Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597556BABF6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4B88924F;
	Wed, 15 Mar 2023 09:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B776B8924F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:20:40 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so1237290pjp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678872040;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJSYyhC9hw2dM6xrk1Ayhxfkc3nPZHyNZyP2FXIazVU=;
 b=ky5l3UhZ7WgUz6YMH4LuMgKZCEVAcOjKSBr9EJrY2B3CeDfo7K4aCSqHokbXYIi9SJ
 +q31aveABnlxmPsT5IBlI8H1LqCgVHVjfG9Xn/6ukXMwlMWm/LnD1k4NTNYqzZ4wYfvm
 8h7hdYNqgwgdIuBrbMK9rQ49sYp6uBRPqtHcvlntGVKqeIlHT6uPxsLEx+KOS15Z8pt5
 0LrRMQebiwbNAb/sVB3jKq1isuyFuYdSu8NYsOSOgvSwfcITKmpT1BFyvd1gjb0tAMn/
 /gh6vpaoloJKLY0O6ekrVUqszxenc9p3I1NGkS5Og2ctN5XIzGHqeI+SQunPdTQodAG5
 JWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678872040;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJSYyhC9hw2dM6xrk1Ayhxfkc3nPZHyNZyP2FXIazVU=;
 b=FgAMwi35uKJp0FZAGZwH2+s26BvX3gEzJMx4LM+37ujus63rvMBPDkd5fZlTn1lnRp
 reymuK+74e184EvAFFAIt8IYQ8YoRn3LjPwi73qCX4q0+Unu7HibSLFWJWJy6Xx1SYj8
 L7+AXhEdmZ3212BUHstCRQ23ms7eIz3wfy6CRVYrHJqpTIBML0VF+Cq08nV4VnEVSiqq
 KC+MK/MIegjI5Nyi0RrP+sybvLsPUmKpu3d3ZAHm20Sz1/es7+dRRfGTkglULWgmY8s9
 DhBDlBN8ZPKEhFeDlzYofxTRjkRdWaepG+BM881CjZPIYIb+/yzaiOpfAJHR8i23J099
 Drmg==
X-Gm-Message-State: AO0yUKUjbPbmA71/HjCy1UhU4XvM2VtnV9AgkWaZsb3llNkWnmpR+QOy
 6WZUQeSV1KoNz+4FbfyZXxa+dN2X4N9a2gVTUyA=
X-Google-Smtp-Source: AK7set9NwX+IDLekPulTlC0yQn9MFkdfj2xwZm68xeREZLv/VQMzM9y68XR+wgxY1EUz6Kl/DiJR4FPbxTCKb3N4ZN8=
X-Received: by 2002:a17:903:130a:b0:1a0:52f1:8ea7 with SMTP id
 iy10-20020a170903130a00b001a052f18ea7mr848781plb.12.1678872040256; Wed, 15
 Mar 2023 02:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230308173433.2788833-1-zyytlz.wz@163.com>
 <d1eee7a0-8942-5f76-a3f0-74dcfddb95b5@linaro.org>
In-Reply-To: <d1eee7a0-8942-5f76-a3f0-74dcfddb95b5@linaro.org>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 15 Mar 2023 17:20:28 +0800
Message-ID: <CAJedcCwWWet3--mvSks=Dz10jEBNqYKadwGY1ijT9-Q=ponCYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: fix race condition bug in
 adv7511_remove due to unfinished work
To: neil.armstrong@linaro.org
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
Cc: alex000young@gmail.com, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1395428693sheep@gmail.com, Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<neil.armstrong@linaro.org> =E4=BA=8E2023=E5=B9=B43=E6=9C=8815=E6=97=A5=E5=
=91=A8=E4=B8=89 17:08=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 08/03/2023 18:34, Zheng Wang wrote:
> > In adv7511_probe, adv7511->hpd_work is bound with adv7511_hpd_work.
> > If we call adv7511_remove with a unfinished work. There may be a
> > race condition where bridge->hpd_mutex was destroyed by
> > drm_bridge_remove and used in adv7511_hpd_work in drm_bridge_hpd_notify=
.
> >
> > Fix it by canceling the work before cleanup in adv7511_remove.
> >
>
> Can you add the relevant Fixes tag ?
>

Hi Neil,

Thanks for your reply and kind reminder. Sorry for my mistake. I'll
append more messages in the next version of patch.

Best regards,
Zheng

> Thanks,
> Neil
>
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > ---
> >   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index ddceafa7b637..9bf72dd6c1d3 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -1349,6 +1349,7 @@ static void adv7511_remove(struct i2c_client *i2c=
)
> >   {
> >       struct adv7511 *adv7511 =3D i2c_get_clientdata(i2c);
> >
> > +     cancel_work_sync(&adv7511->hpd_work);
> >       adv7511_uninit_regulators(adv7511);
> >
> >       drm_bridge_remove(&adv7511->bridge);
>
