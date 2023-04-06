Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE2D6D8CF5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 03:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729E10EAA5;
	Thu,  6 Apr 2023 01:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D16110EAA5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 01:52:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9921905;
 Thu,  6 Apr 2023 03:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680745918;
 bh=PwF7HOwGp5bA6jbwQDp0KdXehX+EH6m4ll+FkeITg5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TkCVqosMktiKYiHMIIXtvRtM1m9QriNBOygyyaneQ9ie0lPVTV2pI+lnoT7B3UXGT
 sCumXVBG3CtKOksEiws5SW5T14OYKWt+8yeoPnGhe5PMbv8u7GdDJVpagfIkOsV2ap
 Oxw19igKARIqjKl3xKB8iBRiHY6BD/2ZsEeMxPKw=
Date: Thu, 6 Apr 2023 04:52:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH v2 2/2] drm: bridge: cdns-mhdp8546: Add support for no-hpd
Message-ID: <20230406015207.GO9915@pendragon.ideasonboard.com>
References: <20230405142440.191939-1-j-choudhary@ti.com>
 <20230405142440.191939-3-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230405142440.191939-3-j-choudhary@ti.com>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 jani.nikula@intel.com, robh+dt@kernel.org, neil.armstrong@linaro.org,
 yamonkar@cadence.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jayesh,

Thank you for the patch.

On Wed, Apr 05, 2023 at 07:54:40PM +0530, Jayesh Choudhary wrote:
> From: Rahul T R <r-ravikumar@ti.com>
> 
> In J721S2 EVMs DP0 hpd is not connected to correct
> hpd pin on SOC, to handle such cases, Add support for
> "no-hpd" property in the device tree node to disable
> hpd

s/hpd/hpd./

You can also reflow the commit message to 72 columns.

> Also change the log level for dpcd read failuers to
> debug, since framework retries 32 times for each read

s/read/read./

Doesn't this apply to writes as well ?

> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 37 ++++++++++++++++---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index f6822dfa3805..e177794b069d 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -54,6 +54,8 @@
>  #include "cdns-mhdp8546-hdcp.h"
>  #include "cdns-mhdp8546-j721e.h"
>  
> +static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp);
> +
>  static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
>  {
>  	int ret, empty;
> @@ -749,7 +751,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
>  	 * MHDP_HW_STOPPED happens only due to driver removal when
>  	 * bridge should already be detached.
>  	 */
> -	if (mhdp->bridge_attached)
> +	if (mhdp->bridge_attached && !mhdp->no_hpd)
>  		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  
> @@ -845,7 +847,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
>  		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
>  					  msg->buffer, msg->size);
>  		if (ret) {
> -			dev_err(mhdp->dev,
> +			dev_dbg(mhdp->dev,
>  				"Failed to read DPCD addr %u\n",
>  				msg->address);
>  
> @@ -1738,6 +1740,19 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  
>  	spin_unlock(&mhdp->start_lock);
>  
> +	if (mhdp->no_hpd) {
> +		ret = wait_event_timeout(mhdp->fw_load_wq,
> +					 mhdp->hw_state == MHDP_HW_READY,
> +					 msecs_to_jiffies(100));
> +		if (ret == 0) {
> +			dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> +				__func__);
> +			return -ETIMEDOUT;
> +		}
> +
> +		cdns_mhdp_update_link_status(mhdp);
> +		return 0;
> +	}

Missing blank line.

It's not clear to me while you need to wait for the state to change to
MHDP_HW_READY in the no_hpd case. This should be explained in the commit
message.

>  	/* Enable SW event interrupts */
>  	if (hw_ready)
>  		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> @@ -2256,7 +2271,16 @@ static int cdns_mhdp_update_link_status(struct cdns_mhdp_device *mhdp)
>  
>  	mutex_lock(&mhdp->link_mutex);
>  
> -	mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
> +	if (mhdp->no_hpd) {
> +		ret = drm_dp_dpcd_read_link_status(&mhdp->aux, status);
> +		hpd_pulse = false;
> +		if (ret < 0)
> +			mhdp->plugged = false;
> +		else
> +			mhdp->plugged = true;

I think there's an issue with how the driver uses mhdp->plugged. In the
no_hpd case, you try to detect if a display is connected by reading the
link status at attach time, and then never update mhdp->plugged. This
means that if no display is connected at that point, functions like
cdns_mhdp_get_edid() will always fail, even if a display gets plugged
later. As the goal of this series is (as far as I understand) support
systems where the HPD signal could be connected to a SoC GPIO instead of
the bridge, I don't think this is good enough.

> +	} else {
> +		mhdp->plugged = cdns_mhdp_detect_hpd(mhdp, &hpd_pulse);
> +	}
>  
>  	if (!mhdp->plugged) {
>  		cdns_mhdp_link_down(mhdp);
> @@ -2451,6 +2475,8 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  	mhdp->aux.dev = dev;
>  	mhdp->aux.transfer = cdns_mhdp_transfer;
>  
> +	mhdp->no_hpd = of_property_read_bool(dev->of_node, "cdns,no-hpd");
> +
>  	mhdp->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mhdp->regs)) {
>  		dev_err(dev, "Failed to get memory resource\n");
> @@ -2526,8 +2552,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  
>  	mhdp->bridge.of_node = pdev->dev.of_node;
>  	mhdp->bridge.funcs = &cdns_mhdp_bridge_funcs;
> -	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> -			   DRM_BRIDGE_OP_HPD;
> +	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +	if (!mhdp->no_hpd)
> +		mhdp->bridge.ops |= DRM_BRIDGE_OP_HPD;
>  	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  	if (mhdp->info)
>  		mhdp->bridge.timings = mhdp->info->timings;
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index bedddd510d17..6786ccb51387 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -388,6 +388,7 @@ struct cdns_mhdp_device {
>  
>  	bool link_up;
>  	bool plugged;
> +	bool no_hpd;
>  
>  	/*
>  	 * "start_lock" protects the access to bridge_attached and

-- 
Regards,

Laurent Pinchart
