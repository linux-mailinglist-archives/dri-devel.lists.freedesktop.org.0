Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B0C2A7A4
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 09:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276C10E383;
	Mon,  3 Nov 2025 08:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gCSyfNBh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576810E383
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 08:05:44 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BEF411D5;
 Mon,  3 Nov 2025 09:03:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1762157031;
 bh=Nnk0iDk+2nEq8U8BO6N3ucUcw+hYH4nbhRtzYQUFiuI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gCSyfNBhxQHUFTYP+ZP5P3ElIkMz3FOj4t/EmMeXVr7Xyx7VOMUCLvfRmGysazgyO
 XnxIE2v+2hSY9zLAVCjVIRneQfXwfIFfj17AOwZS7wzxUKMKRSGv5xtdk4FU6ZcCno
 iAb85nUGa3ClgGbRPvFl3+sf05MmWV+C/WiZB+8A=
Message-ID: <5c080bb8-2745-4765-abc4-2a46ca40916b@ideasonboard.com>
Date: Mon, 3 Nov 2025 10:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v7 2/2] drm/tidss: Move OLDI mode validation to
 OLDI bridge mode_valid hook
To: Swamil Jain <s-jain1@ti.com>, aradhya.bhatia@linux.dev, devarsht@ti.com,
 mripard@kernel.org, jyri.sarha@iki.fi, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, h-shenoy@ti.com
Cc: praneeth@ti.com, u-kumar1@ti.com, vigneshr@ti.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251028033958.369100-1-s-jain1@ti.com>
 <20251028033958.369100-3-s-jain1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251028033958.369100-3-s-jain1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 28/10/2025 05:39, Swamil Jain wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> After integrating OLDI support[0], it is necessary to identify which VP
> instances use OLDI, since the OLDI driver owns the video port clock
> (as a serial clock). Clock operations on these VPs must be delegated to
> the OLDI driver, not handled by the TIDSS driver. This issue also
> emerged in upstream discussions when DSI-related clock management was
> attempted in the TIDSS driver[1].
> 
> To address this, add an 'is_ext_vp_clk' array to the 'tidss_device'
> structure, marking a VP as 'true' during 'tidss_oldi_init()' and as
> 'false' during 'tidss_oldi_deinit()'. TIDSS then uses 'is_ext_vp_clk'
> to skip clock validation checks in 'dispc_vp_mode_valid()' for VPs
> under OLDI control.
> 
> Since OLDI uses the DSS VP clock directly as a serial interface and
> manages its own rate, mode validation should be implemented in the OLDI
> bridge's 'mode_valid' hook. This patch adds that logic, ensuring proper
> delegation and avoiding spurious clock handling in the TIDSS driver.
> 
> [0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
> [1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Tested-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c |  2 ++
>  drivers/gpu/drm/tidss/tidss_drv.h   |  2 ++
>  drivers/gpu/drm/tidss/tidss_oldi.c  | 21 +++++++++++++++++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 07731b02490f..0c3337a7b163 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1315,6 +1315,8 @@ static int check_pixel_clock(struct dispc_device *dispc,
>  {
>  	unsigned long round_clock;
>  
> +	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
> +		return 0;

Add empty line here. Also, add a short comment what this check is about.

>  	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
>  	/*
>  	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 84454a4855d1..e1c1f41d8b4b 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -24,6 +24,8 @@ struct tidss_device {
>  
>  	const struct dispc_features *feat;
>  	struct dispc_device *dispc;
> +	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
> +
>  
>  	unsigned int num_crtcs;
>  	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> index 7688251beba2..d1a5fdac93ff 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -309,6 +309,24 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  	return input_fmts;
>  }
>  
> +static enum drm_mode_status
> +tidss_oldi_mode_valid(struct drm_bridge *bridge,
> +		      const struct drm_display_info *info,
> +		      const struct drm_display_mode *mode)
> +{
> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
> +	unsigned long round_clock;
> +
> +	round_clock = clk_round_rate(oldi->serial, mode->clock * 7 * 1000);
> +	/*
> +	 * To keep the check consistent with dispc_vp_set_clk_rate(),
> +	 * we use the same 5% check here.
> +	 */
> +	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
> +		return -EINVAL;

Add an empty line here.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

> +	return 0;
> +}
> +
>  static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
>  	.attach	= tidss_oldi_bridge_attach,
>  	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
> @@ -317,6 +335,7 @@ static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.mode_valid = tidss_oldi_mode_valid,
>  };
>  
>  static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
> @@ -430,6 +449,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
>  	for (int i = 0; i < tidss->num_oldis; i++) {
>  		if (tidss->oldis[i]) {
>  			drm_bridge_remove(&tidss->oldis[i]->bridge);
> +			tidss->is_ext_vp_clk[tidss->oldis[i]->parent_vp] = false;
>  			tidss->oldis[i] = NULL;
>  		}
>  	}
> @@ -580,6 +600,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
>  		oldi->bridge.timings = &default_tidss_oldi_timings;
>  
>  		tidss->oldis[tidss->num_oldis++] = oldi;
> +		tidss->is_ext_vp_clk[oldi->parent_vp] = true;
>  		oldi->tidss = tidss;
>  
>  		drm_bridge_add(&oldi->bridge);

