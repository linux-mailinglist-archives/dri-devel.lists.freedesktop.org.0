Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE0D1EA0A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC8610E576;
	Wed, 14 Jan 2026 12:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j/qBKCUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3495A10E576
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:03:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB65743944
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B73EC16AAE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768392217;
 bh=ISwBmXtqlbwyWss/fBVSoHfvpN3szzQVi/RRDl8VsMQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j/qBKCUe40NVBeas996xnwtfvLquI+x+D6OyuOCjRCSgtAVwj8lyi84ytIfW0IAH7
 K1kkl16xZWHL0Aa9Zp7I0JN+5vM8n50Iv+vwS+GnRWIbIU10Y4x7rnmGNriGGDD5CV
 RB4r9VD4R1uhMEHMYYkTJXDmzMLXQwfxl9B9V8CvA7ZntNst4gv3lMyedamhnCPAPm
 o7Q9Ri7zWPqLuddTM25ZG60K14Ad9aVQYlvw2sS1jQP58f0LW72bhzw7UJq9+GtaKg
 hjL4rumYZAuPLKMysxvvOr1yynP+skYT/xd+/q6Q1Yz3il8fx+UFpPEiX9QzjY0ZSS
 K9uWViWCnhrxA==
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7c7660192b0so6058783a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 04:03:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXqMh+CPUlL1AfRqD/6d8qUUbY0/T1XdQF3+wGbME6Wl+WFt89+aB1FFT2YIWlzjhx2DiGvE62lC0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZOvfT2ye9Hv5nHDsWDJFnsXKQFyEgAWa2cA+0Ujg7jdw9WHee
 cuQwOb14HBtVUDCCmRcH1ASezjBcj30r4Yr1QAI7K2fnq8eotPVdXqT2MfB7ZK4WV6fH3JA4LjT
 vusN969HYunRmsVr8sEkzM+woNh1f3Sg=
X-Received: by 2002:a05:6808:229f:b0:450:d693:4d1b with SMTP id
 5614622812f47-45c7144e9cdmr1695229b6e.26.1768392216637; Wed, 14 Jan 2026
 04:03:36 -0800 (PST)
MIME-Version: 1.0
References: <2256082.irdbgypaU6@rafael.j.wysocki>
In-Reply-To: <2256082.irdbgypaU6@rafael.j.wysocki>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 14 Jan 2026 13:03:25 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gdj6Oe=LSJX8+6JbxTt42W3RkabLDWh=VqEkjUvAWxow@mail.gmail.com>
X-Gm-Features: AZwV_QhbVK5oii9_3CGxCluXrI-tqHdo9S29eDTUEUKRjhI1ctLbD3rwyvO_M9I
Message-ID: <CAJZ5v0gdj6Oe=LSJX8+6JbxTt42W3RkabLDWh=VqEkjUvAWxow@mail.gmail.com>
Subject: Re: [RESEND][PATCH v1] drm: Discard pm_runtime_put() return value
To: Linux PM <linux-pm@vger.kernel.org>, imx@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Brian Norris <briannorris@chromium.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 8, 2026 at 4:38=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
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
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>
> This patch is requisite for converting pm_runtime_put() into a void
> function.
>
> If you decide to pick it up, please let me know.
>
> Otherwise, an ACK or equivalent will be appreciated, but also the lack
> of specific criticism will be eventually regarded as consent.
>
> Originally posted here:
>
> https://lore.kernel.org/linux-pm/3045480.e9J7NaK4W3@rafael.j.wysocki/

This is the last patch from the "discard pm_runtime_put() return
values" lot that has not been applied yet, AFAICS, so this is the last
call for objections or concerns related to it.

> ---
>  drivers/gpu/drm/arm/malidp_crtc.c                   |    6 +-----
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |    4 +---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |    4 +---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c |    5 +----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |    5 +----
>  drivers/gpu/drm/imx/dc/dc-crtc.c                    |   12 +++---------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                      |    5 +----
>  drivers/gpu/drm/vc4/vc4_vec.c                       |   12 ++----------
>  8 files changed, 11 insertions(+), 42 deletions(-)
>
> --- a/drivers/gpu/drm/arm/malidp_crtc.c
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -77,7 +77,6 @@ static void malidp_crtc_atomic_disable(s
>                                                                          =
crtc);
>         struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
>         struct malidp_hw_device *hwdev =3D malidp->dev;
> -       int err;
>
>         /* always disable planes on the CRTC that is being turned off */
>         drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> @@ -87,10 +86,7 @@ static void malidp_crtc_atomic_disable(s
>
>         clk_disable_unprepare(hwdev->pxlclk);
>
> -       err =3D pm_runtime_put(crtc->dev->dev);
> -       if (err < 0) {
> -               DRM_DEBUG_DRIVER("Failed to disable runtime power managem=
ent: %d\n", err);
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
> -       ret =3D pm_runtime_put(dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret)=
;
> +       pm_runtime_put(dev);
>  }
>
>  static const u32 imx8qm_ldb_bus_output_fmts[] =3D {
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -282,9 +282,7 @@ static void imx8qxp_ldb_bridge_atomic_di
>         if (is_split && companion)
>                 companion->funcs->atomic_disable(companion, state);
>
> -       ret =3D pm_runtime_put(dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(dev, "failed to put runtime PM: %d\n", ret)=
;
> +       pm_runtime_put(dev);
>  }
>
>  static const u32 imx8qxp_ldb_bus_output_fmts[] =3D {
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -181,11 +181,8 @@ static void imx8qxp_pc_bridge_atomic_dis
>  {
>         struct imx8qxp_pc_channel *ch =3D bridge->driver_private;
>         struct imx8qxp_pc *pc =3D ch->pc;
> -       int ret;
>
> -       ret =3D pm_runtime_put(pc->dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(pc->dev, "failed to put runtime PM: %d\n", =
ret);
> +       pm_runtime_put(pc->dev);
>  }
>
>  static const u32 imx8qxp_pc_bus_output_fmts[] =3D {
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -127,11 +127,8 @@ static void imx8qxp_pxl2dpi_bridge_atomi
>                                                   struct drm_atomic_state=
 *state)
>  {
>         struct imx8qxp_pxl2dpi *p2d =3D bridge->driver_private;
> -       int ret;
>
> -       ret =3D pm_runtime_put(p2d->dev);
> -       if (ret < 0)
> -               DRM_DEV_ERROR(p2d->dev, "failed to put runtime PM: %d\n",=
 ret);
> +       pm_runtime_put(p2d->dev);
>
>         if (p2d->companion)
>                 p2d->companion->funcs->atomic_disable(p2d->companion, sta=
te);
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -300,7 +300,7 @@ dc_crtc_atomic_disable(struct drm_crtc *
>                                 drm_atomic_get_new_crtc_state(state, crtc=
);
>         struct dc_drm_device *dc_drm =3D to_dc_drm_device(crtc->dev);
>         struct dc_crtc *dc_crtc =3D to_dc_crtc(crtc);
> -       int idx, ret;
> +       int idx;
>
>         if (!drm_dev_enter(crtc->dev, &idx))
>                 goto out;
> @@ -313,16 +313,10 @@ dc_crtc_atomic_disable(struct drm_crtc *
>         dc_fg_disable_clock(dc_crtc->fg);
>
>         /* request pixel engine power-off as plane is off too */
> -       ret =3D pm_runtime_put(dc_drm->pe->dev);
> -       if (ret)
> -               dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\=
n",
> -                           ret);
> +       pm_runtime_put(dc_drm->pe->dev);
>
>         /* request display engine power-off when CRTC is disabled */
> -       ret =3D pm_runtime_put(dc_crtc->de->dev);
> -       if (ret < 0)
> -               dc_crtc_err(crtc, "failed to put DC display engine RPM: %=
d\n",
> -                           ret);
> +       pm_runtime_put(dc_crtc->de->dev);
>
>         drm_dev_exit(idx);
>
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -848,7 +848,6 @@ static void vc4_hdmi_encoder_post_crtc_p
>         struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>         struct drm_device *drm =3D vc4_hdmi->connector.dev;
>         unsigned long flags;
> -       int ret;
>         int idx;
>
>         mutex_lock(&vc4_hdmi->mutex);
> @@ -867,9 +866,7 @@ static void vc4_hdmi_encoder_post_crtc_p
>         clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
>         clk_disable_unprepare(vc4_hdmi->pixel_clock);
>
> -       ret =3D pm_runtime_put(&vc4_hdmi->pdev->dev);
> -       if (ret < 0)
> -               drm_err(drm, "Failed to release power domain: %d\n", ret)=
;
> +       pm_runtime_put(&vc4_hdmi->pdev->dev);
>
>         drm_dev_exit(idx);
>
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -542,7 +542,7 @@ static void vc4_vec_encoder_disable(stru
>  {
>         struct drm_device *drm =3D encoder->dev;
>         struct vc4_vec *vec =3D encoder_to_vc4_vec(encoder);
> -       int idx, ret;
> +       int idx;
>
>         if (!drm_dev_enter(drm, &idx))
>                 return;
> @@ -556,17 +556,9 @@ static void vc4_vec_encoder_disable(stru
>
>         clk_disable_unprepare(vec->clock);
>
> -       ret =3D pm_runtime_put(&vec->pdev->dev);
> -       if (ret < 0) {
> -               drm_err(drm, "Failed to release power domain: %d\n", ret)=
;
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
>
