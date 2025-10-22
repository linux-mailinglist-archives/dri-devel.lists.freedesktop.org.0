Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474A2BFC0AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCF110E0E0;
	Wed, 22 Oct 2025 13:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="G1rVAeN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F6010E0E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:12:21 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MDC3X61420385;
 Wed, 22 Oct 2025 08:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1761138723;
 bh=m/cAaTTfbQ3qHJtzsorg06KXjTXRKukmNLthb9x5rFs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=G1rVAeN79KYWk7Jic+txu7PQrWKP6VQ4k5FW2Qiu95NA6b5g/DkvC3TygV0O9B3g7
 GSZPNmX8UedDkhaExyE4fPcg6aEHlESRf4xwS16GJnBaKjQ4+l/nijC+SnPWJw6Wy8
 +6/maDt23ZttChewIeNNbLUvgNcgshv4r5C5rEXw=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MDC3Wd1948730
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Oct 2025 08:12:03 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 08:12:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 08:12:03 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MDBxjW1230100;
 Wed, 22 Oct 2025 08:12:00 -0500
Message-ID: <f4b35661-24c8-4d1e-8267-6b39c0521a4a@ti.com>
Date: Wed, 22 Oct 2025 18:41:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/tidss: Restructure dispc_vp_prepare() and
 dispc_vp_enable()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pekka Paalanen <pekka.paalanen@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250905-tidss-fix-timestamp-v1-0-c2aedf31e2c9@ideasonboard.com>
 <20250905-tidss-fix-timestamp-v1-1-c2aedf31e2c9@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250905-tidss-fix-timestamp-v1-1-c2aedf31e2c9@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 05/09/25 19:28, Tomi Valkeinen wrote:
> tidss_crtc.c calls dispc_vp_prepare() and dispc_vp_enable() in that
> order, next to each other. dispc_vp_prepare() does preparations for
> enabling the crtc, by writing some registers, and dispc_vp_enable() does
> more preparations. As the last thing, dispc_vp_enable() enables the CRTC
> by writing the enable bit.
> 
> There might have been a reason at some point in the history for this
> split, but I can't find any point to it. They also do a bit of
> overlapping work: both call dispc_vp_find_bus_fmt(). They could as well
> be a single function.
> 
> But instead of combining them, this patch moves everything from
> dispc_vp_enable() to dispc_vp_prepare(), except the actual CRTC enable
> bit write. The reason for this is that unlike all the preparatory
> register writes, CRTC enable has an immediate effect, starting the
> timing generator and the CRTC as a whole. Thus it may be important to
> time the enable just right (as we do in the next patch).
> 
> No functional changes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
>   drivers/gpu/drm/tidss/tidss_crtc.c  |  2 +-
>   drivers/gpu/drm/tidss/tidss_dispc.c | 22 ++++++----------------
>   drivers/gpu/drm/tidss/tidss_dispc.h |  3 +--
>   3 files changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index da89fd01c337..1b767af8e1f6 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -244,7 +244,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
>   
>   	dispc_vp_prepare(tidss->dispc, tcrtc->hw_videoport, crtc->state);
>   
> -	dispc_vp_enable(tidss->dispc, tcrtc->hw_videoport, crtc->state);
> +	dispc_vp_enable(tidss->dispc, tcrtc->hw_videoport);
>   
>   	spin_lock_irqsave(&ddev->event_lock, flags);
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 7c8c15a5c39b..d4762410d262 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1161,6 +1161,9 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
>   {
>   	const struct tidss_crtc_state *tstate = to_tidss_crtc_state(state);
>   	const struct dispc_bus_format *fmt;
> +	const struct drm_display_mode *mode = &state->adjusted_mode;
> +	bool align, onoff, rf, ieo, ipc, ihs, ivs;
> +	u32 hsw, hfp, hbp, vsw, vfp, vbp;
>   
>   	fmt = dispc_vp_find_bus_fmt(dispc, hw_videoport, tstate->bus_format,
>   				    tstate->bus_flags);
> @@ -1173,22 +1176,6 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
>   
>   		dispc_enable_am65x_oldi(dispc, hw_videoport, fmt);
>   	}
> -}
> -
> -void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
> -		     const struct drm_crtc_state *state)
> -{
> -	const struct drm_display_mode *mode = &state->adjusted_mode;
> -	const struct tidss_crtc_state *tstate = to_tidss_crtc_state(state);
> -	bool align, onoff, rf, ieo, ipc, ihs, ivs;
> -	const struct dispc_bus_format *fmt;
> -	u32 hsw, hfp, hbp, vsw, vfp, vbp;
> -
> -	fmt = dispc_vp_find_bus_fmt(dispc, hw_videoport, tstate->bus_format,
> -				    tstate->bus_flags);
> -
> -	if (WARN_ON(!fmt))
> -		return;
>   
>   	dispc_set_num_datalines(dispc, hw_videoport, fmt->data_width);
>   
> @@ -1244,7 +1231,10 @@ void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
>   				  mode->crtc_hdisplay - 1) |
>   		       FIELD_PREP(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK,
>   				  mode->crtc_vdisplay - 1));
> +}
>   
> +void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport)
> +{
>   	VP_REG_FLD_MOD(dispc, hw_videoport, DISPC_VP_CONTROL, 1,
>   		       DISPC_VP_CONTROL_ENABLE_MASK);
>   }
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 60c1b400eb89..f38493a70122 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -119,8 +119,7 @@ void dispc_ovr_enable_layer(struct dispc_device *dispc,
>   
>   void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
>   		      const struct drm_crtc_state *state);
> -void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport,
> -		     const struct drm_crtc_state *state);
> +void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport);
>   void dispc_vp_disable(struct dispc_device *dispc, u32 hw_videoport);
>   void dispc_vp_unprepare(struct dispc_device *dispc, u32 hw_videoport);
>   bool dispc_vp_go_busy(struct dispc_device *dispc, u32 hw_videoport);
> 

