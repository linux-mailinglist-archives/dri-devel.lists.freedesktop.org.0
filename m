Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAEF87EF6A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 19:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A4710FD8C;
	Mon, 18 Mar 2024 18:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="iMrEI2uO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E610F664
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 18:02:01 +0000 (UTC)
Message-ID: <bda83141-1350-4517-8b83-10cf48135b17@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710784919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmygLB5mwmDf7ougxQc0mLDBWEO79RLREmB0n06npVo=;
 b=iMrEI2uOCru32Fbz5NDN82nYVdskyAlEjAkmIFRUuQRyKU2mBr7B9BPizOZeDKltxcBCSR
 datpU3d1yZvpr39mHLlqbLmMdSmnuzRipC+EamMQPxtOrKB2LYxgI+SqXD2IV9q4sB9GQx
 Qt72cls9B9A3E/3Lyhw2WM3O5QaU2/0=
Date: Mon, 18 Mar 2024 14:01:55 -0400
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] drm: zynqmp_dp: Add locking
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
 <20240315230916.1759060-4-sean.anderson@linux.dev>
 <20240318171651.GJ13682@pendragon.ideasonboard.com>
 <7e8e5e8e-ad50-4a6a-ac47-7fb1536a9df8@linux.dev>
 <20240318175921.GO13682@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240318175921.GO13682@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 3/18/24 13:59, Laurent Pinchart wrote:
> Hi Sean,
> 
> On Mon, Mar 18, 2024 at 01:29:12PM -0400, Sean Anderson wrote:
>> On 3/18/24 13:16, Laurent Pinchart wrote:
>> > On Fri, Mar 15, 2024 at 07:09:13PM -0400, Sean Anderson wrote:
>> >> Add some locking, since none is provided by the drm subsystem. This will
>> > 
>> > That's not quite right, the DRM core doesn't call bridge operations
>> > concurrently.
>> 
>> I figured something like this was going on.
>> 
>> > We may need locking to protect against race conditions
>> > between bridge operations and interrupts though.
>> 
>> And of course this will only get worse once we let userspace get involved.
>> 
>> >> prevent the IRQ/workers/bridge API calls from stepping on each other's
>> >> toes.
>> >> 
>> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> ---
>> >> 
>> >>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 59 +++++++++++++++++++++++---------
>> >>  1 file changed, 42 insertions(+), 17 deletions(-)
>> >> 
>> >> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> >> index 8635b5673386..d2dee58e7bf2 100644
>> >> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> >> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> >> @@ -279,6 +279,7 @@ struct zynqmp_dp_config {
>> >>   * @dpsub: Display subsystem
>> >>   * @iomem: device I/O memory for register access
>> >>   * @reset: reset controller
>> >> + * @lock: Mutex protecting this struct and register access (but not AUX)
>> > 
>> > This patch does two things at once, it defers link training from the IRQ
>> > handler to a work queue, and covers everything with a big lock. The
>> > scope is too large.
>> 
>> OK, I can split this.
>> 
>> > Please restrict the lock scope and document the
>> > individual fields that need to be protected, and explain the locking
>> > design in the commit message (or comments in the code).
>> 
>> As said, this lock protects
>> 
>> - Non-atomic registers configuring the link. That is, everything but the IRQ
>>   registers (since these are accessed in an atomic fashion), and the DP AUX
>>   registers (since these don't affect the link).
>> - Link configuration. This is effectively everything in zynqmp_dp which isn't
>>   read-only after probe time. So from next_bridge onward.
>> 
>> It's designed to protect configuration changes so we don't have to do anything
>> tricky. Configuration should never be in the hot path, so I'm not worried about
>> performance.
> 
> If userspace can control all this directly through debugfs, can you
> guarantee that locks will be enough ? The driver doesn't expect direct
> userspace access. I have a feeling this is really quite hacky.

Yes, this is fine. The most userspace can do is force a lot of retraining. But we
have timeouts on everything so I'm not really concerned.

--Sean

>> >>   * @irq: irq
>> >>   * @bridge: DRM bridge for the DP encoder
>> >>   * @next_bridge: The downstream bridge
>> >> @@ -299,6 +300,7 @@ struct zynqmp_dp {
>> >>  	struct zynqmp_dpsub *dpsub;
>> >>  	void __iomem *iomem;
>> >>  	struct reset_control *reset;
>> >> +	struct mutex lock;
>> >>  	int irq;
>> >>  
>> >>  	struct drm_bridge bridge;
>> >> @@ -308,7 +310,7 @@ struct zynqmp_dp {
>> >>  	struct drm_dp_aux aux;
>> >>  	struct phy *phy[ZYNQMP_DP_MAX_LANES];
>> >>  	u8 num_lanes;
>> >> -	struct delayed_work hpd_work;
>> >> +	struct delayed_work hpd_work, hpd_irq_work;
>> > 
>> > One variable per line please.
>> 
>> OK
>> 
>> >>  	enum drm_connector_status status;
>> >>  	bool enabled;
>> >>  
>> >> @@ -1371,8 +1373,10 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
>> >>  	}
>> >>  
>> >>  	/* Check with link rate and lane count */
>> >> +	mutex_lock(&dp->lock);
>> >>  	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
>> >>  				  dp->link_config.max_lanes, dp->config.bpp);
>> >> +	mutex_unlock(&dp->lock);
>> >>  	if (mode->clock > rate) {
>> >>  		dev_dbg(dp->dev, "filtered mode %s for high pixel rate\n",
>> >>  			mode->name);
>> >> @@ -1399,6 +1403,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>> >>  
>> >>  	pm_runtime_get_sync(dp->dev);
>> >>  
>> >> +	mutex_lock(&dp->lock);
>> >>  	zynqmp_dp_disp_enable(dp, old_bridge_state);
>> >>  
>> >>  	/*
>> >> @@ -1459,6 +1464,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>> >>  	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
>> >>  			ZYNQMP_DP_SOFTWARE_RESET_ALL);
>> >>  	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
>> >> +	mutex_unlock(&dp->lock);
>> >>  }
>> >>  
>> >>  static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>> >> @@ -1466,6 +1472,7 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>> >>  {
>> >>  	struct zynqmp_dp *dp = bridge_to_dp(bridge);
>> >>  
>> >> +	mutex_lock(&dp->lock);
>> >>  	dp->enabled = false;
>> >>  	cancel_delayed_work(&dp->hpd_work);
>> >>  	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 0);
>> >> @@ -1476,6 +1483,7 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>> >>  		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
>> >>  
>> >>  	zynqmp_dp_disp_disable(dp, old_bridge_state);
>> >> +	mutex_unlock(&dp->lock);
>> >>  
>> >>  	pm_runtime_put_sync(dp->dev);
>> >>  }
>> >> @@ -1518,6 +1526,8 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
>> >>  	u32 state, i;
>> >>  	int ret;
>> >>  
>> >> +	mutex_lock(&dp->lock);
>> >> +
>> >>  	/*
>> >>  	 * This is from heuristic. It takes some delay (ex, 100 ~ 500 msec) to
>> >>  	 * get the HPD signal with some monitors.
>> >> @@ -1545,11 +1555,13 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
>> >>  					       dp->num_lanes);
>> >>  
>> >>  		dp->status = connector_status_connected;
>> >> +		mutex_unlock(&dp->lock);
>> >>  		return connector_status_connected;
>> >>  	}
>> >>  
>> >>  disconnected:
>> >>  	dp->status = connector_status_disconnected;
>> >> +	mutex_unlock(&dp->lock);
>> >>  	return connector_status_disconnected;
>> >>  }
>> >>  
>> >> @@ -1611,6 +1623,29 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
>> >>  	drm_bridge_hpd_notify(&dp->bridge, status);
>> >>  }
>> >>  
>> >> +static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
>> >> +{
>> >> +	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp,
>> >> +					    hpd_irq_work.work);
>> >> +	u8 status[DP_LINK_STATUS_SIZE + 2];
>> >> +	int err;
>> >> +
>> >> +	mutex_lock(&dp->lock);
>> >> +	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
>> >> +			       DP_LINK_STATUS_SIZE + 2);
>> >> +	if (err < 0) {
>> >> +		dev_dbg_ratelimited(dp->dev,
>> >> +				    "could not read sink status: %d\n", err);
>> >> +	} else {
>> >> +		if (status[4] & DP_LINK_STATUS_UPDATED ||
>> >> +		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
>> >> +		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
>> >> +			zynqmp_dp_train_loop(dp);
>> >> +		}
>> >> +	}
>> >> +	mutex_unlock(&dp->lock);
>> >> +}
>> >> +
>> >>  static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
>> >>  {
>> >>  	struct zynqmp_dp *dp = (struct zynqmp_dp *)data;
>> >> @@ -1635,23 +1670,9 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
>> >>  	if (status & ZYNQMP_DP_INT_HPD_EVENT)
>> >>  		schedule_delayed_work(&dp->hpd_work, 0);
>> >>  
>> >> -	if (status & ZYNQMP_DP_INT_HPD_IRQ) {
>> >> -		int ret;
>> >> -		u8 status[DP_LINK_STATUS_SIZE + 2];
>> >> +	if (status & ZYNQMP_DP_INT_HPD_IRQ)
>> >> +		schedule_delayed_work(&dp->hpd_irq_work, 0);
>> >>  
>> >> -		ret = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
>> >> -				       DP_LINK_STATUS_SIZE + 2);
>> >> -		if (ret < 0)
>> >> -			goto handled;
>> >> -
>> >> -		if (status[4] & DP_LINK_STATUS_UPDATED ||
>> >> -		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
>> >> -		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
>> >> -			zynqmp_dp_train_loop(dp);
>> >> -		}
>> >> -	}
>> >> -
>> >> -handled:
>> >>  	return IRQ_HANDLED;
>> >>  }
>> >>  
>> >> @@ -1674,8 +1695,10 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>> >>  	dp->dev = &pdev->dev;
>> >>  	dp->dpsub = dpsub;
>> >>  	dp->status = connector_status_disconnected;
>> >> +	mutex_init(&dp->lock);
>> >>  
>> >>  	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
>> >> +	INIT_DELAYED_WORK(&dp->hpd_irq_work, zynqmp_dp_hpd_irq_work_func);
>> >>  
>> >>  	/* Acquire all resources (IOMEM, IRQ and PHYs). */
>> >>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
>> >> @@ -1775,6 +1798,7 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
>> >>  	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_ALL);
>> >>  	disable_irq(dp->irq);
>> >>  
>> >> +	cancel_delayed_work_sync(&dp->hpd_irq_work);
>> >>  	cancel_delayed_work_sync(&dp->hpd_work);
>> >>  
>> >>  	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
>> >> @@ -1782,4 +1806,5 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
>> >>  
>> >>  	zynqmp_dp_phy_exit(dp);
>> >>  	zynqmp_dp_reset(dp, true);
>> >> +	mutex_destroy(&dp->lock);
>> >>  }
> 

