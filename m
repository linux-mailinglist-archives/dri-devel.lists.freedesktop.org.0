Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485279F111
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFA810E4D7;
	Wed, 13 Sep 2023 18:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE2010E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:21:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52a40cf952dso53914a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629285; x=1695234085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l5QGC6faED9UJjdk62LCMZfSOuUFJeBirWltiWK+61M=;
 b=HAVHLIdnW7RE45+MO6nfnCHhAT6LcW2wFDFruZ7RHgaxayPJ6keZrqS9OpNasDLGFM
 xWMZPRsaERPyOQmwXJDOO2US48tUc0kPyvlTUn0DeqjGfxIe5PtkTVmOShe+vW4yJ9Xq
 qJa/fsICwCK9wZcMvgmZILLmh8+1wmfsHQiY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629285; x=1695234085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5QGC6faED9UJjdk62LCMZfSOuUFJeBirWltiWK+61M=;
 b=XpqIEl+cFEOeWIPxrGudPgiSzojZJy3vILgMNna32HTUb38PpR3juEDQpvoONgkaEI
 1Xwk2bHAt+k6agjJUusbAkInW/Rf7X6Uld7xPJ6V1TGHLn9SZpgaZVtTjnnbTUh4dnHw
 xlKQGPtQXFuY+MUVPKaXkUsmK1MCqRSAZlm8blyqwHbOgMJkSqZu5HMKlUnIrP6DBOqr
 bku7rNzYjoSWXKYuhtn3n4TmbSEF4LJm6gfhCHvunutaeO45vQqbwE7Yb1YqbNqV0jpR
 u4r/XauaD+O02uyht7AzRG990VktiX+DmGVG0GdI4blaJQdAtwMTB1zbsQPog0u6STn+
 tFZw==
X-Gm-Message-State: AOJu0Yyw6IJNnL/SpT6vvS+huGrsXwi9nv1NUqUO2ou6Qbi7YZiTabU2
 dGi0QHzzc28iMSbYb9JtDixdh9ijLsjXpcWks5xPpr8m
X-Google-Smtp-Source: AGHT+IGZJAncpGv/YQLQFKNwq5BGwLFCFGfscelQnuEx++egvAkYXPEi8MKV/Nwh0E23B4gjy+ySbg==
X-Received: by 2002:aa7:d6c3:0:b0:522:2ba9:6fce with SMTP id
 x3-20020aa7d6c3000000b005222ba96fcemr3177842edr.8.1694629285572; 
 Wed, 13 Sep 2023 11:21:25 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7cb49000000b0051bed21a635sm7705497edt.74.2023.09.13.11.21.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:21:25 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-52c96d5df86so2157a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:21:24 -0700 (PDT)
X-Received: by 2002:a50:cd59:0:b0:522:4741:d992 with SMTP id
 d25-20020a50cd59000000b005224741d992mr219125edj.4.1694629284486; Wed, 13 Sep
 2023 11:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
In-Reply-To: <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:21:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VvbkKo9i994-GGFBKte=f_d9Vzh3o1UkTpTPSqCCEdeQ@mail.gmail.com>
Message-ID: <CAD=FV=VvbkKo9i994-GGFBKte=f_d9Vzh3o1UkTpTPSqCCEdeQ@mail.gmail.com>
Subject: Re: [RFT PATCH 13/15] drm/imx/ipuv3: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 shawnguo@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:42=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver unbind time. Among other things, this means that if a
> panel is in use that it won't be cleanly powered off at system
> shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart and at driver remove (or unbind) time comes
> straight out of the kernel doc "driver instance overview" in
> drm_drv.c.
>
> A few notes about this fix:
> - When adding drm_atomic_helper_shutdown() to the unbind path, I added
>   it after drm_kms_helper_poll_fini() since that's when other drivers
>   seemed to have it.
> - Technically with a previous patch, ("drm/atomic-helper:
>   drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
>   actually need to check to see if our "drm" pointer is NULL before
>   calling drm_atomic_helper_shutdown(). We'll leave the "if" test in,
>   though, so that this patch can land without any dependencies. It
>   could potentially be removed later.
> - This patch also makes sure to set the drvdata to NULL in the case of
>   bind errors to make sure that shutdown can't access freed data.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/i=
mx/ipuv3/imx-drm-core.c
> index 4a866ac60fff..4c8bc49758a7 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> @@ -257,6 +257,7 @@ static int imx_drm_bind(struct device *dev)
>         drm_kms_helper_poll_fini(drm);
>         component_unbind_all(drm->dev, drm);
>  err_kms:
> +       dev_set_drvdata(dev, NULL);
>         drm_dev_put(drm);
>
>         return ret;
> @@ -269,6 +270,7 @@ static void imx_drm_unbind(struct device *dev)
>         drm_dev_unregister(drm);
>
>         drm_kms_helper_poll_fini(drm);
> +       drm_atomic_helper_shutdown(drm);
>
>         component_unbind_all(drm->dev, drm);
>
> @@ -298,6 +300,14 @@ static int imx_drm_platform_remove(struct platform_d=
evice *pdev)
>         return 0;
>  }
>
> +static void imx_drm_platform_shutdown(struct platform_device *pdev)
> +{
> +       struct drm_device *drm =3D platform_get_drvdata(pdev);
> +
> +       if (drm)
> +               drm_atomic_helper_shutdown(platform_get_drvdata(pdev));

Since this is now landing through the drm-misc-next tree, I got rid of
the check for NULL when applying and landed this after the patch
("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
noop").


> @@ -325,6 +335,7 @@ MODULE_DEVICE_TABLE(of, imx_drm_dt_ids);
>  static struct platform_driver imx_drm_pdrv =3D {
>         .probe          =3D imx_drm_platform_probe,
>         .remove         =3D imx_drm_platform_remove,
> +       .shutdown       =3D imx_drm_platform_shutdown,

There was a trivial context conflict with commit 3095f1122203
("drm/imx/ipuv3: Convert to platform remove callback returning void")
that I resolved while applying.

I've now pushed to drm-misc-next:

02680d71dea8 drm/imx/ipuv3: Call drm_atomic_helper_shutdown() at
shutdown/unbind time
