Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174587EE5F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 18:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B1810FC9D;
	Mon, 18 Mar 2024 17:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i3kvDuWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4CB10FC9D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 17:06:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 559FC7E9;
 Mon, 18 Mar 2024 18:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710781546;
 bh=eKN5dVb6S67RCse9OvAtbGcBmvx7pJXmDkiVK8Z0e+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i3kvDuWkLq/GiBhR3QIPVDrAbeGf2rohEQFoFP1kp3E1QlJMGQVq8dCZ/1/LqZaTq
 s7O6fu5qm2u4JCv8LYulyvpFUdqx/eBygmA+76O2MKUFbGbdcJPhFJ0gtvb3r4PqIG
 y5gEEKwAIOGStoEixXkaiqURFWsFiXWwoXy1dG4E=
Date: Mon, 18 Mar 2024 19:06:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/6] drm: zynqmp_dp: Adjust training values per-lane
Message-ID: <20240318170609.GI13682@pendragon.ideasonboard.com>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
 <20240315230916.1759060-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240315230916.1759060-3-sean.anderson@linux.dev>
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

Hi Sean,

Thank you for the patch.

On Fri, Mar 15, 2024 at 07:09:12PM -0400, Sean Anderson wrote:
> The feedback we get from the DPRX is per-lane. Make changes using this
> information, instead of picking the maximum values from all lanes. This
> results in more-consistent training on marginal links.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 98a32e6a0459..8635b5673386 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -605,28 +605,21 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
>  				   u8 link_status[DP_LINK_STATUS_SIZE])
>  {
>  	u8 *train_set = dp->train_set;
> -	u8 voltage = 0, preemphasis = 0;
>  	u8 i;
>  
>  	for (i = 0; i < dp->mode.lane_cnt; i++) {
> -		u8 v = drm_dp_get_adjust_request_voltage(link_status, i);
> -		u8 p = drm_dp_get_adjust_request_pre_emphasis(link_status, i);
> +		u8 voltage = drm_dp_get_adjust_request_voltage(link_status, i);
> +		u8 preemphasis =
> +			drm_dp_get_adjust_request_pre_emphasis(link_status, i);
>  
> -		if (v > voltage)
> -			voltage = v;
> +		if (voltage >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
> +			voltage |= DP_TRAIN_MAX_SWING_REACHED;
>  
> -		if (p > preemphasis)
> -			preemphasis = p;
> -	}
> +		if (preemphasis >= DP_TRAIN_PRE_EMPH_LEVEL_2)
> +			preemphasis |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
>  
> -	if (voltage >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
> -		voltage |= DP_TRAIN_MAX_SWING_REACHED;
> -
> -	if (preemphasis >= DP_TRAIN_PRE_EMPH_LEVEL_2)
> -		preemphasis |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> -
> -	for (i = 0; i < dp->mode.lane_cnt; i++)
>  		train_set[i] = voltage | preemphasis;
> +	}

I don't have enough DP knowledge to review this :-(

>  }
>  
>  /**

-- 
Regards,

Laurent Pinchart
