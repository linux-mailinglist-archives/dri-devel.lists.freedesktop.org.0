Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793DD251C3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 15:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940510E77C;
	Thu, 15 Jan 2026 14:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HdohdZiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F144110E77A;
 Thu, 15 Jan 2026 14:57:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 638E76001A;
 Thu, 15 Jan 2026 14:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098D5C16AAE;
 Thu, 15 Jan 2026 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768489047;
 bh=RN5nqWzMwmk5vcj24tq3c6ou+TS9jaUJHpO5HZ+M3G0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HdohdZiWIccNHWVtm6+LqON64wbEFuxZat0QrvaUeSQiCkILve7HxlgFoCjFA172o
 ynihfwM04HHsHAv0btjOMEnGTaEmeQfw2SOsdFDrwIMMyz9F3sdGOeMxdnt2Nvsqgc
 cFr2w4Q6dSyaylLaHaG87iji4Q7W1MgVENSD3ORc82wZN4aOyL0nkt7q6fJZFBTatm
 vi3zZYQIzlQ+gR3xjt5iiKGkMpce0vsIvK6soKgXqXf+rstd5559Tdo1l3jymm872p
 LH7NpAdsu3ovmaLN2eSNyMr4xQQWhT5mfrvcOtl7de2yc7Anzj0ZDiGzWQ5JylY1vp
 iHgFB1hTODa3g==
Date: Thu, 15 Jan 2026 08:57:24 -0600
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
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Message-ID: <ti4tccx5dnupiv5ppglvcg7xmn2twvdjv5fktupgnqp56we4u5@jsd7mdrbhbwj>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
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

On Thu, Jan 15, 2026 at 09:29:08AM +0200, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.

This makes it sounds like the two options are equal, but they most
definitely aren't.

I think this commit message should capture the fact that "link_ready"
not only says that the cable is connected, but that we've managed to
bring up the main link - which is a source of race conditions in the hot
plug detection logic, as well as making it impossible to move link
management to the enable/disable calls.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5997cd28ba11..a05144de3b93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>  	return 0;
>  }
>  
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * @connector: Pointer to drm connector structure
> + * Returns: Bridge's 'is connected' status

Could you please rewrite the return definition, to capture what the
value really refers to.

> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0;

First usage is an assignment, so no need for the zero-initialization.

> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	struct drm_dp_desc desc;
> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;

So despite the commit message, we're still relying on the link_ready
flag? (With the improvement that even if the code thinks we've trained
the link, we can still determine that we should report it as
disconnected)

Perhaps I'm missing something here? Did we change the meaning of
"link_ready"?


Other than this part, this looks quite familiar to my experiments. Very
happy to see you continue this work!!!

Regards,
Bjorn

> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
> +	if (ret)
> +		goto end;
> +
> +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> +	if (ret)
> +		goto end;
> +
> +	status = connector_status_connected;
> +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> +		int sink_count = drm_dp_read_sink_count(priv->aux);
> +
> +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> +
> +		if (sink_count <= 0)
> +			status = connector_status_disconnected;
> +	}
> +
> +end:
> +	pm_runtime_put_sync(&dp->pdev->dev);
> +	return status;
> +}
> +
>  static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>  {
>  	struct msm_dp_display_private *dp = dev_id;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index fd6443d2b6ce..e4622c85fb66 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -15,26 +15,6 @@
>  #include "dp_audio.h"
>  #include "dp_drm.h"
>  
> -/**
> - * msm_dp_bridge_detect - callback to determine if connector is connected
> - * @bridge: Pointer to drm bridge structure
> - * @connector: Pointer to drm connector structure
> - * Returns: Bridge's 'is connected' status
> - */
> -static enum drm_connector_status
> -msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> -{
> -	struct msm_dp *dp;
> -
> -	dp = to_dp_bridge(bridge)->msm_dp_display;
> -
> -	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> -		str_true_false(dp->link_ready));
> -
> -	return (dp->link_ready) ? connector_status_connected :
> -					connector_status_disconnected;
> -}
> -
>  static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
>  			    struct drm_bridge_state *bridge_state,
>  			    struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 9eb3431dd93a..6c0426803d78 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  		   struct drm_encoder *encoder,
>  		   bool yuv_supported);
>  
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector);
>  void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  				 struct drm_atomic_state *state);
>  void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> 
> -- 
> 2.47.3
> 
> 
