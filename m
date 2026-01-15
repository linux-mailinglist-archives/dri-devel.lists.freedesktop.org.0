Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073DD25722
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3F210E795;
	Thu, 15 Jan 2026 15:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lxMLZ+sM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5163010E795;
 Thu, 15 Jan 2026 15:42:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 14EBB41A2B;
 Thu, 15 Jan 2026 15:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD181C116D0;
 Thu, 15 Jan 2026 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768491777;
 bh=Vvu0/TPmWVy6yatxjIes5gxfTU9U/IRZqj1fb8T9FCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lxMLZ+sMFx9z01Wj67Yk/ayjOT+zk9ITI70cCjFSNr8XYvNNWuYN0tYmPfaOHQGD1
 qyfEfkQ+MzFOqTHr0s0u69COb4lujVHOzdXSSJxTBWi+PlkoohpaKAdgxvMr9KG112
 Z4Rif6zXRfy0PPVFJuTaqAnRbNxaZ+NRxPViZXfWwPz2uo1vEmN+50qS1m+6g0hitG
 xI7w2YBz8ZutpXjm/l8/J59EMhl2c7YDSGQUWXiZftbBbS+w2rM9Jn4i8UuKn66m8J
 lMsDoaQpUJGGQ0GmhVsDs3tctWeCxEMxj3en/rdgSTLbKWQ1vNaB6cdNkjOqlD/mNe
 owzYmF4QF1a7g==
Date: Thu, 15 Jan 2026 09:42:54 -0600
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
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
Message-ID: <ztriduhwhimeztfdgijai2qeii2giaosb6qizhj4skxg6k5uq4@bi6vomgv3whj>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
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

On Thu, Jan 15, 2026 at 09:29:10AM +0200, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3184066adb15..e0b424ac861a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -58,7 +58,6 @@ enum {
>  	EV_HPD_PLUG_INT,
>  	EV_IRQ_HPD_INT,
>  	EV_HPD_UNPLUG_INT,
> -	EV_USER_NOTIFICATION,
>  };
>  
>  #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
> @@ -343,17 +342,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
>  	.unbind = msm_dp_display_unbind,
>  };
>  
> -static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
> -{
> -	struct msm_dp_display_private *dp;
> -	struct drm_connector *connector;
> -
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> -
> -	connector = dp->msm_dp_display.connector;
> -	drm_helper_hpd_irq_event(connector->dev);
> -}
> -
>  static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
>  					    bool hpd)
>  {
> @@ -377,7 +365,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
> -	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
> +
> +	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> +			      hpd ?
> +			      connector_status_connected :
> +			      connector_status_disconnected);

Last time we tried this, we where out of sync with the link_ready in
detect. So, I'm still wondering about that if (!link_ready) return
disconnected; in the detect function.

With a reliable detect method, this looks good though.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

>  
>  	return 0;
>  }
> @@ -437,7 +429,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> -	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> +	msm_dp_display_send_hpd_notification(dp, true);
>  
>  end:
>  	return rc;
> @@ -506,7 +498,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
>  {
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
>  
> -	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> +	msm_dp_display_send_hpd_notification(dp, false);
>  
>  	return 0;
>  }
> @@ -527,7 +519,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
>  		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
>  		if (dp->hpd_state != ST_DISCONNECTED) {
>  			dp->hpd_state = ST_DISCONNECT_PENDING;
> -			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> +			msm_dp_display_send_hpd_notification(dp, false);
>  		}
>  	} else {
>  		if (dp->hpd_state == ST_DISCONNECTED) {
> @@ -1121,10 +1113,6 @@ static int hpd_event_thread(void *data)
>  		case EV_IRQ_HPD_INT:
>  			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
>  			break;
> -		case EV_USER_NOTIFICATION:
> -			msm_dp_display_send_hpd_notification(msm_dp_priv,
> -						todo->data);
> -			break;
>  		default:
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index cc6e2cab36e9..60094061c102 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,6 +16,7 @@ struct msm_dp {
>  	struct platform_device *pdev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
> +	struct drm_bridge *bridge;
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index e4622c85fb66..f935093c4df4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  		}
>  	}
>  
> +	msm_dp_display->bridge = bridge;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.47.3
> 
> 
