Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5CCCD8C76
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 11:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1E610E039;
	Tue, 23 Dec 2025 10:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dkaWazlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BAD10E039
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 10:23:39 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-78fb9a67b06so33592357b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 02:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1766485418; x=1767090218;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UlhETS7/kFMdpmyZp8uXws6d7GG/7QM6EmMT9RiTjas=;
 b=dkaWazlrb+g7yGcx0zfS76/lS7W85EbO12kNVfANKb+XrVID8NcG683YyzZ2n6MyJK
 2wPXB1iTFR9QBZQi/Or/Dw/A16gLeTWHTaPgeA/eVv6B5Er2UgP41IRqQWTqASuygWab
 FmClHHlv/OscYdj0tvp6LMN8hPrJVqbiqk85MK5CiHkFUnW/3UMgxPesaBD0PK7s8Wjs
 k6rYPnBjkgMasFrOYVEGCHXphZZ7+Br3zmeeL5A5NQeoTQFEGs0/CdTG4AhR3ycexS3G
 iBijTezglK+Kgpw675SiLqpCGXRxhehAiKsa7uKlzfEWGmNLTik/Uswju3Rg5E/+SL2G
 7sKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766485418; x=1767090218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UlhETS7/kFMdpmyZp8uXws6d7GG/7QM6EmMT9RiTjas=;
 b=Kdj6jJPXBZdDzxBiFcqhA/mq/FXJlo7lYFLLTUFZfsdfWjTX+bfUCfPJfIjf3yjsRO
 G1W5HtguX45E5wK/REY9BtyOsWvxZH8I7jfHrNyMzKBm1T6bJrJn38++wcXw5PZgLFAn
 PMHITFltMlrCHuWBptsuhdmY3usJt2oHqrvA7d8PSYtTwdZWGlRyhj9l5ute1ZCFlgLL
 KtYXiySRZQCXGLBDZMpWH3zfbkwMzixeDG6b+r1f23Ic92jclI+MEMqClmJsZrIDN/kQ
 cfLIznnUTiictx8T1jpJyWPea3VUUvF3uLOsjqCRHRNHhwhFpvfrf4+xkuGkcccelXSI
 20Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8CyvgXUaFXpBvUaAHlupxhyMEXQ9sNliCnfKznS06Ko/SHUHx8S9r++S93lsDcqQqjpJ0gnYlrp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG1m4OpVV5k08XIEHbg/x+FNsmOC7acpdy4z2evyUdDNXwqoI6
 F8gcSj/c7grzgUFps7Jk7ChfsO/zwwK0ozIPp/oMtfZOmfiBRbd4zjz7FVSbAD7tZq+KPlxG1uR
 4buxeuBbA+m4y0WSPRcMFrRRfY0T6WyO3AIoPxIH0qw==
X-Gm-Gg: AY/fxX7h7cS5itWDtUsf7RIt0p9uxOnpZ1zCJU5nhpk8Ohta2MCtWI1OlP02Hg6nyoB
 7Wanr0w8gJHA1ktSMUW4oHEln6lTNHaJ0gFVhVpxufvxnincnT04YVgA1bQR+K3Q+MhKJ+VFOr0
 poS85riIIt0Di2+UJJJ9RdUYEEwDCd/ovz7Ntht0rPdQdLfcm4Rllrq909XtKsV3T+6P7lgAcoG
 YClnGVmZUlob/sygDS9dbcIXjkf6VNKMItSweOavnQ9LJf6wagD3G8NZApVpKPQnAkY2YtyhDGU
 0cRsXo2y2xTVCtPlIVhEx74oVjQ=
X-Google-Smtp-Source: AGHT+IFnf13U6Ikz16XDuf5ZDc4vmAituFzAXSaLSV0CwD1Jp327Q008LcjqhybrfbyhfayJFBxuTuwR8kI2KEjgIY8=
X-Received: by 2002:a05:690e:1883:b0:63f:ab07:def with SMTP id
 956f58d0204a3-6466a901125mr9125733d50.59.1766485418165; Tue, 23 Dec 2025
 02:23:38 -0800 (PST)
MIME-Version: 1.0
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki>
 <3045480.e9J7NaK4W3@rafael.j.wysocki>
In-Reply-To: <3045480.e9J7NaK4W3@rafael.j.wysocki>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 23 Dec 2025 10:23:21 +0000
X-Gm-Features: AQt7F2q5j8iCScxuKrDJdn6a0Mw5tIUxNBazZbfeydozNI3XFwXBXhSVIstZQCM
Message-ID: <CAPY8ntBrcpqHjVAqkc2r4Map+dUBfNsHZPN22AYdUWi+QmVYrg@mail.gmail.com>
Subject: Re: [PATCH v1 03/23] drm: Discard pm_runtime_put() return value
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Brian Norris <briannorris@chromium.org>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Dec 2025 at 20:38, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Multiple DRM drivers use the pm_runtime_put() return value for printing
> debug or even error messages and all of those messages are at least
> somewhat misleading.
>
> Returning an error code from pm_runtime_put() merely means that it has
> not queued up a work item to check whether or not the device can be
> suspended and there are many perfectly valid situations in which that
> can happen, like after writing "on" to the devices' runtime PM "control"
> attribute in sysfs for one example.  It also happens when the kernel
> has been configured with CONFIG_PM unset.
>
> For this reason, modify all of those drivers to simply discard the
> pm_runtime_put() return value which is what they should be doing.
>
> This will facilitate a planned change of the pm_runtime_put() return
> type to void in the future.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> This patch is part of a series, but it doesn't depend on anything else
> in that series.  The last patch in the series depends on it.
>
> It can be applied by itself and if you decide to do so, please let me
> know.
>
> Otherwise, an ACK or equivalent will be appreciated, but also the lack
> of specific criticism will be eventually regarded as consent.
>
> ---
>  drivers/gpu/drm/arm/malidp_crtc.c                   |    6 +-----
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |    4 +---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |    4 +---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c |    5 +----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |    5 +----
>  drivers/gpu/drm/imx/dc/dc-crtc.c                    |   12 +++---------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                      |    5 +----
>  drivers/gpu/drm/vc4/vc4_vec.c                       |   12 ++----------

For vc4_hdmi and vc4_vec:

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>  8 files changed, 11 insertions(+), 42 deletions(-)
>
> --- a/drivers/gpu/drm/arm/malidp_crtc.c
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -77,7 +77,6 @@ static void malidp_crtc_atomic_disable(s
>                                                                          crtc);
>         struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
>         struct malidp_hw_device *hwdev = malidp->dev;
> -       int err;
>
>         /* always disable planes on the CRTC that is being turned off */
>         drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> @@ -87,10 +86,7 @@ static void malidp_crtc_atomic_disable(s
>
>         clk_disable_unprepare(hwdev->pxlclk);
>
> -       err = pm_runtime_put(crtc->dev->dev);
> -       if (err < 0) {
> -               DRM_DEBUG_DRIVER("Failed to disable runtime power management: %d\n", err);
> -       }
> +       pm_runtime_put(crtc->dev->dev);
>  }
>
>  static const struct gamma_curve_segment {
> --- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
> @@ -280,9 +280,7 @@ static void imx8qm_ldb_bridge_atomic_dis
>         clk_disable_unprepare(imx8qm_ldb->clk_bypass);
>         clk_disable_unprepare(imx8qm_ldb->clk_pixel);
>
> -       ret = pm_runtime_put(dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
> +       pm_runtime_put(dev);
>  }
>
>  static const u32 imx8qm_ldb_bus_output_fmts[] = {
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -282,9 +282,7 @@ static void imx8qxp_ldb_bridge_atomic_di
>         if (is_split && companion)
>                 companion->funcs->atomic_disable(companion, state);
>
> -       ret = pm_runtime_put(dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret);
> +       pm_runtime_put(dev);
>  }
>
>  static const u32 imx8qxp_ldb_bus_output_fmts[] = {
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -181,11 +181,8 @@ static void imx8qxp_pc_bridge_atomic_dis
>  {
>         struct imx8qxp_pc_channel *ch = bridge->driver_private;
>         struct imx8qxp_pc *pc = ch->pc;
> -       int ret;
>
> -       ret = pm_runtime_put(pc->dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", ret);
> +       pm_runtime_put(pc->dev);
>  }
>
>  static const u32 imx8qxp_pc_bus_output_fmts[] = {
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -127,11 +127,8 @@ static void imx8qxp_pxl2dpi_bridge_atomi
>                                                   struct drm_atomic_state *state)
>  {
>         struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
> -       int ret;
>
> -       ret = pm_runtime_put(p2d->dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n", ret);
> +       pm_runtime_put(p2d->dev);
>
>         if (p2d->companion)
>                 p2d->companion->funcs->atomic_disable(p2d->companion, state);
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -300,7 +300,7 @@ dc_crtc_atomic_disable(struct drm_crtc *
>                                 drm_atomic_get_new_crtc_state(state, crtc);
>         struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
>         struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> -       int idx, ret;
> +       int idx;
>
>         if (!drm_dev_enter(crtc->dev, &idx))
>                 goto out;
> @@ -313,16 +313,10 @@ dc_crtc_atomic_disable(struct drm_crtc *
>         dc_fg_disable_clock(dc_crtc->fg);
>
>         /* request pixel engine power-off as plane is off too */
> -       ret = pm_runtime_put(dc_drm->pe->dev);
> -       if (ret)
> -               dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
> -                           ret);
> +       pm_runtime_put(dc_drm->pe->dev);
>
>         /* request display engine power-off when CRTC is disabled */
> -       ret = pm_runtime_put(dc_crtc->de->dev);
> -       if (ret < 0)
> -               dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
> -                           ret);
> +       pm_runtime_put(dc_crtc->de->dev);
>
>         drm_dev_exit(idx);
>
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -848,7 +848,6 @@ static void vc4_hdmi_encoder_post_crtc_p
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         struct drm_device *drm = vc4_hdmi->connector.dev;
>         unsigned long flags;
> -       int ret;
>         int idx;
>
>         mutex_lock(&vc4_hdmi->mutex);
> @@ -867,9 +866,7 @@ static void vc4_hdmi_encoder_post_crtc_p
>         clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
>         clk_disable_unprepare(vc4_hdmi->pixel_clock);
>
> -       ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
> -       if (ret < 0)
> -               drm_err(drm, "Failed to release power domain: %d\n", ret);
> +       pm_runtime_put(&vc4_hdmi->pdev->dev);
>
>         drm_dev_exit(idx);
>
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -542,7 +542,7 @@ static void vc4_vec_encoder_disable(stru
>  {
>         struct drm_device *drm = encoder->dev;
>         struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
> -       int idx, ret;
> +       int idx;
>
>         if (!drm_dev_enter(drm, &idx))
>                 return;
> @@ -556,17 +556,9 @@ static void vc4_vec_encoder_disable(stru
>
>         clk_disable_unprepare(vec->clock);
>
> -       ret = pm_runtime_put(&vec->pdev->dev);
> -       if (ret < 0) {
> -               drm_err(drm, "Failed to release power domain: %d\n", ret);
> -               goto err_dev_exit;
> -       }
> +       pm_runtime_put(&vec->pdev->dev);
>
>         drm_dev_exit(idx);
> -       return;
> -
> -err_dev_exit:
> -       drm_dev_exit(idx);
>  }
>
>  static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>
>
>
