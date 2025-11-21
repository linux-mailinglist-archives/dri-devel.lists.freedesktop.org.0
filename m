Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C253C77081
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 03:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C21610E0D1;
	Fri, 21 Nov 2025 02:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N9msI7L2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CD610E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 02:42:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp
 [39.110.208.21])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8A89EC6A;
 Fri, 21 Nov 2025 03:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763692825;
 bh=b8TDw2LitfHcgujdlWIJNdAGuC/msjdf/E/aSBsp6vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N9msI7L2DOJbkLyIkqe1UebpjRIEVHk50RKbkCPeYsL3loEdjSmUYMR0DWfVcsElQ
 BGzrx6TNKDLbMcLQUfbg5SN0VJ3rJCKgXwZ5QBFP7yhSmCdm5lY+lfvvcAPu5AS4QW
 3EYTkDK+edAEZFdRHI3BsmRvAWsdUa2yUXTf8+hQ=
Date: Fri, 21 Nov 2025 11:42:06 +0900
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
Subject: Re: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
Message-ID: <20251121024206.GC11519@pendragon.ideasonboard.com>
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
 <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
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

On Thu, Nov 20, 2025 at 11:55:34PM +0100, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused regressions in all bridges that e.g. send DSI commands in
> their .prepare() and .unprepare() callbacks when used with R-Car DU.
> 
> This is needed on R-Car DU, where the CRTC provides clock to LVDS
> and DSI, and has to be started before a bridge may call .prepare,
> which may trigger e.g. a DSI transfer.

Is there an issue with LVDS ? The LVDS encoder receivers its pixel clock
from the CRTC the same way any encoder does (except on R-Car D3 and E3
where the encoder *provides* the pixel clock to the CRTC, which is
handled through explicit function calls from the CRTC to the LVDS
encoder). There's no command mode with LVDS. Is the concern that we may
have an external LVDS to DSI bridge ?

> This specifically fixes the case where ILI9881C is connected to R-Car
> DU DSI. The ILI9881C panel driver does DSI command transfer in its
> struct drm_panel_funcs .prepare function, which is currently called
> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
> and the DSI command transfer times out.
> 
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This is a modified version of Marek's patch using the approach
> from MCDE. I'm pretty sure this driver also needs the original
> semantic ording during disablement, and it surely doesn't hurt
> to restore it too.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 216219accfd9..d1d756f40fc6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -540,11 +540,30 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  			rcdu->dpad1_source = rcrtc->index;
>  	}
>  
> -	/* Apply the atomic update. */
> -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> +	/*
> +	 * Apply the atomic update.
> +	 *
> +	 * We need special ordering to make sure the CRTC disabled last
> +	 * and enabled first. We do this with modified versions of the
> +	 * common modeset_disables/enables functions.
> +	 */
> +
> +	/* Variant of drm_atomic_helper_commit_modeset_disables() */
> +	drm_encoder_bridge_disable(dev, state);
> +	drm_encoder_bridge_post_disable(dev, state);
> +	drm_crtc_disable(dev, state);

I think we have a fundamental issue here. Commit c9b1150a68d9
("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
states that

    The definition of bridge pre_enable hook says that,
    "The display pipe (i.e. clocks and timing signals) feeding this bridge
    will not yet be running when this callback is called".

This is right, and the above sequence does not comply with the
documentation, which is a concern. Quite clearly the bridge API isn't up
to the task here. I don't know how we'll fix it, the pre/post
enable/disable operations are really a hack and don't scale, and fixing
that will likely not be a simple task.

The short term question is how to deal with the regression that
c9b1150a68d9 caused in the MCDE and R-Car DU drivers. This patch
probably works. The complexity makes me worry that we'll introduce other
regressions, but it can be argued that we're merely restoring the
previous order of operations, which should therefore be safe. I'm still
concerned about maintainability though. Commit c9b1150a68d9 should
probably have been rejected, we should have developed a proper solution
instead :-(

> +	drm_atomic_helper_update_legacy_modeset_state(dev, state);
> +	drm_atomic_helper_calc_timestamping_constants(state);
> +	drm_crtc_set_mode(dev, state);
> +
>  	drm_atomic_helper_commit_planes(dev, old_state,
>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +
> +	/* Variant of drm_atomic_helper_commit_modeset_enables() */
> +	drm_crtc_enable(dev, state);
> +	drm_encoder_bridge_pre_enable(dev, state);
> +	drm_encoder_bridge_enable(dev, state);
> +	drm_atomic_helper_commit_writebacks(dev, state);

That looks pretty horrible :-/ Not your fault of course.

Maxime, what's your opinion ?

>  
>  	drm_atomic_helper_commit_hw_done(old_state);
>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);

-- 
Regards,

Laurent Pinchart
