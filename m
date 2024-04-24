Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A348B09B8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 14:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963A113AF1;
	Wed, 24 Apr 2024 12:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GAhL0bgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECE9113AF1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 12:30:55 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B285DEBB;
 Wed, 24 Apr 2024 14:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713961802;
 bh=Fq+btv0vT40giGM+xmyuiq6xJPvakVqB6nGXDaOHgBY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GAhL0bgcXFl/SqZYK2T0fc85HfXyW5OaVJHOBfHn6lquy9WOqDsKBErEsDXVE+CJe
 87QzBLhV6pWQx6qHvB1A5zD+WEFGhVy/dQeLiCltnLXOCfvOn7IsaBjSfJLidzB9Uk
 95VWkK2VsWZsxGNF9DHV6Qy6bjyCr5mAIfmQCqw0=
Message-ID: <911a0692-b1cd-4a97-9a99-2102d7f6f5ee@ideasonboard.com>
Date: Wed, 24 Apr 2024 15:30:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] drm: zynqmp_dp: Use AUX IRQs instead of polling
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240423171859.3953024-1-sean.anderson@linux.dev>
 <20240423171859.3953024-11-sean.anderson@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240423171859.3953024-11-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 23/04/2024 20:18, Sean Anderson wrote:
> Instead of polling the status register for the AUX status, just enable
> the IRQs and signal a completion.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 

This one seems to cause a hang when I unload the modules. I didn't debug 
it further yet, but most likely we get an AUX interrupt when disabling 
the hardware, and the driver hasn't disabled the IRQ handler.

  Tomi

> (no changes since v3)
> 
> Changes in v3:
> - New
> 
>   drivers/gpu/drm/xlnx/zynqmp_dp.c | 35 +++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 9d61b6b8f2d4..863668642190 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -285,6 +285,7 @@ struct zynqmp_dp_config {
>    * @next_bridge: The downstream bridge
>    * @config: IP core configuration from DTS
>    * @aux: aux channel
> + * @aux_done: Completed when we get an AUX reply or timeout
>    * @phy: PHY handles for DP lanes
>    * @num_lanes: number of enabled phy lanes
>    * @hpd_work: hot plug detection worker
> @@ -305,6 +306,7 @@ struct zynqmp_dp {
>   	struct drm_bridge bridge;
>   	struct work_struct hpd_work;
>   	struct work_struct hpd_irq_work;
> +	struct completion aux_done;
>   	struct mutex lock;
>   
>   	struct drm_bridge *next_bridge;
> @@ -941,12 +943,15 @@ static int zynqmp_dp_aux_cmd_submit(struct zynqmp_dp *dp, u32 cmd, u16 addr,
>   				    u8 *buf, u8 bytes, u8 *reply)
>   {
>   	bool is_read = (cmd & AUX_READ_BIT) ? true : false;
> +	unsigned long time_left;
>   	u32 reg, i;
>   
>   	reg = zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
>   	if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST)
>   		return -EBUSY;
>   
> +	reinit_completion(&dp->aux_done);
> +
>   	zynqmp_dp_write(dp, ZYNQMP_DP_AUX_ADDRESS, addr);
>   	if (!is_read)
>   		for (i = 0; i < bytes; i++)
> @@ -961,17 +966,14 @@ static int zynqmp_dp_aux_cmd_submit(struct zynqmp_dp *dp, u32 cmd, u16 addr,
>   	zynqmp_dp_write(dp, ZYNQMP_DP_AUX_COMMAND, reg);
>   
>   	/* Wait for reply to be delivered upto 2ms */
> -	for (i = 0; ; i++) {
> -		reg = zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
> -		if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
> -			break;
> +	time_left = wait_for_completion_timeout(&dp->aux_done,
> +						msecs_to_jiffies(2));
> +	if (!time_left)
> +		return -ETIMEDOUT;
>   
> -		if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT ||
> -		    i == 2)
> -			return -ETIMEDOUT;
> -
> -		usleep_range(1000, 1100);
> -	}
> +	reg = zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
> +	if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT)
> +		return -ETIMEDOUT;
>   
>   	reg = zynqmp_dp_read(dp, ZYNQMP_DP_AUX_REPLY_CODE);
>   	if (reply)
> @@ -1055,6 +1057,9 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
>   			(w << ZYNQMP_DP_AUX_CLK_DIVIDER_AUX_FILTER_SHIFT) |
>   			(rate / (1000 * 1000)));
>   
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_EN, ZYNQMP_DP_INT_REPLY_RECEIVED |
> +					      ZYNQMP_DP_INT_REPLY_TIMEOUT);
> +
>   	dp->aux.name = "ZynqMP DP AUX";
>   	dp->aux.dev = dp->dev;
>   	dp->aux.drm_dev = dp->bridge.dev;
> @@ -1072,6 +1077,9 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
>   static void zynqmp_dp_aux_cleanup(struct zynqmp_dp *dp)
>   {
>   	drm_dp_aux_unregister(&dp->aux);
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_REPLY_RECEIVED |
> +					      ZYNQMP_DP_INT_REPLY_TIMEOUT);
>   }
>   
>   /* -----------------------------------------------------------------------------
> @@ -1685,6 +1693,12 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
>   	if (status & ZYNQMP_DP_INT_HPD_IRQ)
>   		schedule_work(&dp->hpd_irq_work);
>   
> +	if (status & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
> +		complete(&dp->aux_done);
> +
> +	if (status & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT)
> +		complete(&dp->aux_done);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -1708,6 +1722,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>   	dp->dpsub = dpsub;
>   	dp->status = connector_status_disconnected;
>   	mutex_init(&dp->lock);
> +	init_completion(&dp->aux_done);
>   
>   	INIT_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
>   	INIT_WORK(&dp->hpd_irq_work, zynqmp_dp_hpd_irq_work_func);

