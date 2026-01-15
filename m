Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B69ED255A3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB4910E790;
	Thu, 15 Jan 2026 15:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MtmliGQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7849110E78D;
 Thu, 15 Jan 2026 15:30:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C7FD43A1E;
 Thu, 15 Jan 2026 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73D5C19422;
 Thu, 15 Jan 2026 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768491024;
 bh=Tdh8vUSB9h6cGBkd4Yoh0KO4dewGr2XwfKhzq/PFFHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtmliGQQ0HwQXqkNh+gbNIqKmXqZl/GrHlr9sR3xGberqohktFfpXuYDdsBiVt+F/
 lfTA9zE+M12JzL3Dkt/5IoCd1UZ3JAr+OG+HxOzyYuzsVInkaDbxbcA1AjOHwO+3yS
 AZJwAqbi1sUiHySvsbrSYYmJoEb/H4ENSuU4IRIisC6OqzqfwBck4OY+u6ScAk838L
 37RcaB6uTEzpHBFMyat2vY4ILrwJ3tAZwvGsaLptj+oKtaBL8dhHFl4vvwSnkipr2J
 pbzHHydpkjA4ruZ2gLlfW+BblftHLYoKjEUHd8XbNX7ivKZsf3vv+h7HSAM0kVsY4H
 cNoqq3JH5IpEg==
Date: Thu, 15 Jan 2026 09:30:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <x72w6pys3ph7sfcpp2drowkv7wkis2vf2z72eokgo2m3mpiod5@ykuxvtdfcnpf>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
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

On Thu, Jan 15, 2026 at 09:29:09AM +0200, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> Link disabling is already done in atomic_post_disable() (as part of the
> dp_ctrl_off_link_stream() helper).
> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a05144de3b93..3184066adb15 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);

I think unrelated to this patch (and series), but do we really want to
keep the v_level and p_level settings until the user reconnects the
cable?

Regards,
Bjorn

> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
> @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		force_link_train = true;
>  	}
>  
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> +	}
> +
>  	msm_dp_display_enable(msm_dp_display, force_link_train);
>  
>  	rc = msm_dp_display_post_enable(dp);
> 
> -- 
> 2.47.3
> 
> 
