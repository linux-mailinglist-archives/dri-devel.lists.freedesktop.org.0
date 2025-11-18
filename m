Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC95C6A2D4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883E410E1A1;
	Tue, 18 Nov 2025 15:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T7Hq96Mw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088A10E1A1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:01:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E73B0D52;
 Tue, 18 Nov 2025 15:59:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763477982;
 bh=E/YsJM6IheylUC0Sw9Q0gCCkL3kmIQiShNp786J4lB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7Hq96MwT29jQCWhrM94stZvZq1e8qZoCyedP9DEeIjLKzfWoGEFYS73+jA/Xl1pQ
 sL/6jnlqWFyfe/n57UFMDAGVVZvCLhLtv18AEGMDjvU9P5LmNX0V+LT/ulb0Z6hbA+
 ng2v9YKs4sfSR7R5NXAM5nMmwjoKdK+/P4hhiQ3U=
Date: Tue, 18 Nov 2025 17:01:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
Message-ID: <20251118150128.GB23711@pendragon.ideasonboard.com>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
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

Hi Linus,

Thank you for the patch.

On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
> This adds (yet another) variant of the
> drm_atomic_helper_commit_tail_crtc_early_late() helper function
> to deal with regressions caused by reordering the bridge
> prepare/enablement sequence.
> 
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks.
> 
> As the CRTC is no longer online at bridge_pre_enable()
> and gone at brige_post_disable() which maps to the panel
> bridge .prepare()/.unprepare() callbacks, any CRTC that
> enable/disable the DSI transmitter in it's enable/disable
> callbacks will be unable to send any DSI commands in the
> .prepare() and .unprepare() callbacks.
> 
> However the MCDE driver definitely need the CRTC to be
> enabled during .prepare()/.unprepare().
> 
> This patch from Marek Vasut:
> https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
> solves part of the problem for drivers using custom
> tail functions, since MCDE is using helpers only, we
> add a new helper function that exploits the new
> drm_atomic_helper_commit_modeset_enables_crtc_early()
> and use that in MCDE.
> 
> Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
> Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/mcde/mcde_drv.c     |  6 ++++--
>  include/drm/drm_atomic_helper.h     |  1 +
>  3 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index eb47883be153..23fa27f21c4e 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2005,6 +2005,41 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
>  
> +/**
> + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update

Based on the function name, it feels that the nem commit tail and
modeset enable/disable helpers reached a point where we may want to
reconsider the design instead of adding new functions with small
differences in behaviour that will end up confusing driver developers.

> + * @state: new modeset state to be committed
> + *
> + * This is an alternative implementation for the
> + * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
> + * that support runtime_pm or need the CRTC to be enabled to perform a
> + * commit, and also need the CRTC to be enabled before preparing any
> + * bridges, as well as leaving the CRTC enabled while unpreparing
> + * any bridges.
> + *
> + * Otherwise, one should use the default implementation
> + * drm_atomic_helper_commit_tail().
> + */
> +void drm_atomic_helper_commit_tail_crtc_early_late(struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = state->dev;
> +
> +	drm_atomic_helper_commit_modeset_disables_crtc_late(dev, state);
> +
> +	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, state);
> +
> +	drm_atomic_helper_commit_planes(dev, state,
> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +
> +	drm_atomic_helper_fake_vblank(state);
> +
> +	drm_atomic_helper_commit_hw_done(state);
> +
> +	drm_atomic_helper_wait_for_vblanks(dev, state);
> +
> +	drm_atomic_helper_cleanup_planes(dev, state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_commit_tail_crtc_early_late);
> +
>  static void commit_tail(struct drm_atomic_state *state)
>  {
>  	struct drm_device *dev = state->dev;
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index 5f2c462bad7e..f3833d20c0fa 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -104,9 +104,11 @@ static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
>  	/*
>  	 * Using this function is necessary to commit atomic updates
>  	 * that need the CRTC to be enabled before a commit, as is
> -	 * the case with e.g. DSI displays.
> +	 * the case with e.g. DSI displays, and also make sure that the
> +	 * CRTC is enabled before any bridges are prepared and disabled
> +	 * after any bridges are disabled.
>  	 */
> -	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_crtc_early_late,
>  };
>  
>  static irqreturn_t mcde_irq(int irq, void *data)
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index d479afcd1637..1e85df5eea4f 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -64,6 +64,7 @@ int drm_atomic_helper_check(struct drm_device *dev,
>  			    struct drm_atomic_state *state);
>  void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
>  void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state);
> +void drm_atomic_helper_commit_tail_crtc_early_late(struct drm_atomic_state *state);
>  int drm_atomic_helper_commit(struct drm_device *dev,
>  			     struct drm_atomic_state *state,
>  			     bool nonblock);

-- 
Regards,

Laurent Pinchart
