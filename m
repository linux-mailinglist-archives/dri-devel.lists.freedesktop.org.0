Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18CA647527
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 18:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8613010E1E0;
	Thu,  8 Dec 2022 17:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8D810E1E0;
 Thu,  8 Dec 2022 17:50:43 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-14455716674so2675965fac.7; 
 Thu, 08 Dec 2022 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EcDib7bnYJl/Unwetka3jeGow0uypTS8xDJA3Nr+9ew=;
 b=l06xBHdQVkajTuW7VX6uuHvMIl1RK9SMqeMSWCTAKB5XUhqLqmc9mAymE2iOCDxYAO
 syHdyaUequqZSnvWv/kMv9oBmyfZMlcyPvA1+GFuNTEdiCTZNZ7sGFR8FzU+cQxuRqSK
 8ZPzeFuAjqnvFSMqTKQ5YTPFgsTS06BCqqOloaW5P2/GsqHm7MPOqxwz5pl84x4INS30
 WN+wShP+a52htV46LnSO3BuboU5LOPC1AZvUZPORjoz48ahBPnmica10L6fee7Xm6Gwl
 mFu/C6F1c7WFEKR/pcT8wo96eCRhvfc7EsD48dEKFL8Yfe22jE+BXtmKyQPXrgsdT5nn
 BYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcDib7bnYJl/Unwetka3jeGow0uypTS8xDJA3Nr+9ew=;
 b=B7DfGPSjlFYxJ3db89RZmD12XALgQ5jgoR9XaJnv8mmFgBVT8Pp85mlQwjGTbmPKdH
 4bHrvMXBluHDpboHxxCgiRPeruM8YYa5GsCveFAkxfbQuRPBSMZXIxTsEPW/CbqovlKo
 pXZKEFjovjRWO/i+yzWev0A2uFcEViyyea8HXKoXZIPThoDqklI5Bg3hYh4QQmtiS/K+
 PYaDlkGnqzKysP13ygV/H6HukgzjCYvXX3l9fNDoIQWQsfZsgt7k4HGMVjcpg0hPKr4b
 vTetmDOZnHtKXvaj2bPEpGfS3Y1bZiGDY5yd1IViygKJLE/JYMCUi9kMHyy6sTTeYjZO
 LWbA==
X-Gm-Message-State: ANoB5pktWoD0W0OW+14Q70ESvCbQqO8+HgcvG01Q6OegWLtsL/ji2n5b
 CQ8R7/q6UEu8QhJ9IQZvfxiC9tZ3X820W085/YRhIzv+
X-Google-Smtp-Source: AA0mqf45SvHm6kzi6ZeuT3Fspud9r0wFsO3c0zqTSaFW8u5+a19GLvzh8KfOeGWpOGfak5/ALktSWVh2t9AukR9HO/4=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr43749954oab.46.1670521842232; Thu, 08
 Dec 2022 09:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20221206073156.43453-1-xurui@kylinos.cn>
In-Reply-To: <20221206073156.43453-1-xurui@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Dec 2022 12:50:30 -0500
Message-ID: <CADnq5_ONUkteQrhgMVfst5UCK5+GjVQaj-=-ABo8bYczeGCRLg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Retry DDC probing on DVI on failure if we got
 an HPD interrupt
To: xurui <xurui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: guchun.chen@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, cssk@net-c.es,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 alexander.deucher@amd.com, sam@ravnborg.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 7, 2022 at 3:09 AM xurui <xurui@kylinos.cn> wrote:
>
> HPD signals on DVI ports can be fired off before the pins required for
> DDC probing actually make contact, due to the pins for HPD making
> contact first. This results in a HPD signal being asserted but DDC
> probing failing, resulting in hotplugging occasionally failing.

It seems like DP should get a similar fix.

>
> Rescheduling the hotplug work for a second when we run into an HPD
> signal with a failing DDC probe usually gives enough time for the rest
> of the connector's pins to make contact, and fixes this issue.

This looks reasonable.  Please address the kernel test robot reports.

Thanks,

Alex

>
> Signed-off-by: xurui <xurui@kylinos.cn>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 22 ++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 +
>  2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index cfb262911bfc..dd8d414249a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -997,13 +997,33 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
>                 }
>         }
>
> +       if (amdgpu_connector->detected_hpd_without_ddc) {
> +               force = true;
> +               amdgpu_connector->detected_hpd_without_ddc = false;
> +       }
> +
>         if (!force && amdgpu_connector_check_hpd_status_unchanged(connector)) {
>                 ret = connector->status;
>                 goto exit;
>         }
>
> -       if (amdgpu_connector->ddc_bus)
> +       if (amdgpu_connector->ddc_bus) {
>                 dret = amdgpu_display_ddc_probe(amdgpu_connector, false);
> +
> +               /* Sometimes the pins required for the DDC probe on DVI
> +                * connectors don't make contact at the same time that the ones
> +                * for HPD do. If the DDC probe fails even though we had an HPD
> +                * signal, try again later
> +                */
> +               if (!dret && !force &&
> +                   amdgpu_display_hpd_sense(adev, amdgpu_connector->hpd.hpd)) {
> +                       DRM_DEBUG_KMS("hpd detected without ddc, retrying in 1 second\n");
> +                       amdgpu_connector->detected_hpd_without_ddc = true;
> +                       schedule_delayed_work(&adev->hotplug_work,
> +                                             msecs_to_jiffies(1000));
> +                       goto exit;
> +               }
> +       }
>         if (dret) {
>                 amdgpu_connector->detected_by_load = false;
>                 amdgpu_connector_free_edid(connector);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 37322550d750..bf009de59710 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -535,6 +535,7 @@ struct amdgpu_connector {
>         void *con_priv;
>         bool dac_load_detect;
>         bool detected_by_load; /* if the connection status was determined by load */
> +       bool detected_hpd_without_ddc; /* if an HPD signal was detected on DVI, but ddc probing failed */
>         uint16_t connector_object_id;
>         struct amdgpu_hpd hpd;
>         struct amdgpu_router router;
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
