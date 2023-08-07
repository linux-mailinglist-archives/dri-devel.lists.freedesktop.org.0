Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008D771D9A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654589E33;
	Mon,  7 Aug 2023 09:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663589E33;
 Mon,  7 Aug 2023 09:55:59 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1bc05bece1dso489536fac.1; 
 Mon, 07 Aug 2023 02:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691402158; x=1692006958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HM29zdZVBVOCSCNWC+N4/pn42HvEOpSp0FjiUfhyV+c=;
 b=eHLtyYlojSCvGycSK5EHhtygzrQ1N+0oSZys+UwzL4EtZ5uj+k951+1D73/AjNrQHT
 uMzfsTq+txlu9VRHfWzcyfSzeKocQrQqTij3LPLyxHVT0GZoqrKtCH5X1LoExtJUExvO
 YzEM8MgK+ewJ1w5MlmgGf4y8BHiOMtEUrrYUJtu8T+yDo+RXHtl/069cOyfJhEn5oH5I
 qscej8okKOV78e7fEoi0GnrOX32Gz52Ld1m5SVIchcMhHefcdrfTPh2tzs1+YtgT32dR
 UnYoYICbkX2aTrXCZU+TVsdmffBQVCqEL7Fb5IN+WluWONIJ3oLcPyzF43KqZxPzxSru
 tXrQ==
X-Gm-Message-State: AOJu0YxvIjtfV7+SWo1bEuthyG2rKm0xqg/qz6HwxfbaiL/3ZMSZwQGQ
 stSqcE25kzbwJHn8Ep4jdh59CCpyvGjKTZDn2jw=
X-Google-Smtp-Source: AGHT+IFHIvYl74pw4UZh36FUG3o40lXvym9lMWxwRL/SxHlVB7wTSMG9tn/tEdRQ5gFzwoxUxtwe3BVZMSdpSLITRrE=
X-Received: by 2002:a05:6870:c091:b0:1bf:9170:89ef with SMTP id
 c17-20020a056870c09100b001bf917089efmr9642566oad.4.1691402158480; Mon, 07 Aug
 2023 02:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230804214051.136268-1-robdclark@gmail.com>
In-Reply-To: <20230804214051.136268-1-robdclark@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 7 Aug 2023 11:55:43 +0200
Message-ID: <CAJZ5v0iy+qD7J+UvFkG+ErLmYGk7ZvG2HY2vvWFiwA95jQ-yPA@mail.gmail.com>
Subject: Re: [RFC] PM / QoS: Decouple request alloc from dev_pm_qos_mtx
 (alternative solution)
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 11:41=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Similar to the previous patch, move the allocation out from under
> dev_pm_qos_mtx, by speculatively doing the allocation and handle
> any race after acquiring dev_pm_qos_mtx by freeing the redundant
> allocation.
>
> Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> This is an alternative to https://patchwork.freedesktop.org/patch/551417/=
?series=3D115028&rev=3D4
>
> So, this does _slightly_ change error paths, for ex
> dev_pm_qos_update_user_latency_tolerance() will now allocate
> dev->power.qos in some error cases.  But this seems harmless?

It is harmless AFAICS.

> A slightly more complicated version of this could conserve the
> previous error path behavior, but I figured I'd try the simpler
> thing first.

Good choice!

>  drivers/base/power/qos.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> index 1b73a704aac1..c7ba85e89c42 100644
> --- a/drivers/base/power/qos.c
> +++ b/drivers/base/power/qos.c
> @@ -920,8 +920,12 @@ s32 dev_pm_qos_get_user_latency_tolerance(struct dev=
ice *dev)
>  int dev_pm_qos_update_user_latency_tolerance(struct device *dev, s32 val=
)
>  {
>         struct dev_pm_qos *qos =3D dev_pm_qos_constraints_allocate();
> +       struct dev_pm_qos_request *req =3D NULL;
>         int ret =3D 0;
>
> +       if (!dev->power.qos->latency_tolerance_req)
> +               req =3D kzalloc(sizeof(*req), GFP_KERNEL);
> +
>         mutex_lock(&dev_pm_qos_mtx);
>
>         dev_pm_qos_constraints_set(dev, qos);
> @@ -935,8 +939,6 @@ int dev_pm_qos_update_user_latency_tolerance(struct d=
evice *dev, s32 val)
>                 goto out;
>
>         if (!dev->power.qos->latency_tolerance_req) {
> -               struct dev_pm_qos_request *req;
> -
>                 if (val < 0) {
>                         if (val =3D=3D PM_QOS_LATENCY_TOLERANCE_NO_CONSTR=
AINT)
>                                 ret =3D 0;
> @@ -944,17 +946,15 @@ int dev_pm_qos_update_user_latency_tolerance(struct=
 device *dev, s32 val)
>                                 ret =3D -EINVAL;
>                         goto out;
>                 }
> -               req =3D kzalloc(sizeof(*req), GFP_KERNEL);
>                 if (!req) {
>                         ret =3D -ENOMEM;
>                         goto out;
>                 }
>                 ret =3D __dev_pm_qos_add_request(dev, req, DEV_PM_QOS_LAT=
ENCY_TOLERANCE, val);
> -               if (ret < 0) {
> -                       kfree(req);
> +               if (ret < 0)
>                         goto out;
> -               }
>                 dev->power.qos->latency_tolerance_req =3D req;
> +               req =3D NULL;
>         } else {
>                 if (val < 0) {
>                         __dev_pm_qos_drop_user_request(dev, DEV_PM_QOS_LA=
TENCY_TOLERANCE);
> @@ -966,6 +966,7 @@ int dev_pm_qos_update_user_latency_tolerance(struct d=
evice *dev, s32 val)
>
>   out:
>         mutex_unlock(&dev_pm_qos_mtx);
> +       kfree(req);
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_qos_update_user_latency_tolerance);
> --

Yes, something like this, please!
