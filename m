Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28341CA3BF3
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977A210E956;
	Thu,  4 Dec 2025 13:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1hepY4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E815E10E956
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764854126; x=1796390126;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mbYf9s61hZbO1/3BKVmN4lnCdGsGpn5DBMdhu2GQ5Bs=;
 b=m1hepY4HBBeKALBOvflqJrQJr+Wa3uoA1oXTDYd8xwGG4IXlCqSowkXa
 L9PpogvcXBiJWIvN9hHCTbTv+4+lS2MqEMf0awOHBiJf0z6zSB3q+r6TX
 PLYPlIJk/+o1pkGbPJfx5yyEgho9ZPhMonkvjkDVKpI8eOipDMy/s/76O
 woEES0mSJGtpWciLaenHVOHkAb2UFbqp80CyIU3ySjv++7o9V78OZZa5j
 kLXOFxWr5c5z0G/IVod4cPQD3g97OtIg3DuyjRd69TKlhJPN5l8a+d1UD
 V5L2X9W4U/m8/CqzLf5cTsyjlAhEGsg25s5TWox2EbbOv8+e+8BBeJEm0 Q==;
X-CSE-ConnectionGUID: sZQZ7L8SQh6CCN2OS/pZIA==
X-CSE-MsgGUID: a07Q2CyZQVCS7Ur6PVWlvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66804644"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66804644"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:15:26 -0800
X-CSE-ConnectionGUID: 7W3MHYAbSGydfAtJ1ATcuw==
X-CSE-MsgGUID: gPH0sPJ2ThWez4OxVgHgag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199159105"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.149])
 by orviesa003.jf.intel.com with SMTP; 04 Dec 2025 05:15:18 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 04 Dec 2025 15:15:08 +0200
Date: Thu, 4 Dec 2025 15:15:08 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] drm: bridge: anx7625: implement minimal Type-C
 support
Message-ID: <aTGJXAnlkK5vQTzk@kuha>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
 <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-anx7625-typec-v1-2-22b30f846a88@oss.qualcomm.com>
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

Wed, Nov 26, 2025 at 11:41:57AM +0200, Dmitry Baryshkov kirjoitti:
> ANX7625 can be used as a USB-C controller, handling USB and DP data
> streams. Provide minimal Type-C support necessary for ANX7625 to
> register the Type-C port device and properly respond to data / power
> role events from the Type-C partner.
> 
> While ANX7625 provides TCPCI interface, using it would circumvent the
> on-chip running firmware. Analogix recommended using the higher-level
> interface instead of TCPCI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/bridge/analogix/Kconfig   |   1 +
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 163 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  21 +++-
>  3 files changed, 175 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> index 4846b2e9be7c2a5da18f6a3cdec53ef5766455e0..f3448b0631fea42e7e7ab10368777a93ce33cee7 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -34,6 +34,7 @@ config DRM_ANALOGIX_ANX7625
>  	tristate "Analogix Anx7625 MIPI to DP interface support"
>  	depends on DRM
>  	depends on OF
> +	depends on TYPEC || !TYPEC
>  	select DRM_DISPLAY_DP_HELPER
>  	select DRM_DISPLAY_HDCP_HELPER
>  	select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 6f3fdcb6afdb9d785bc4515300676cf3988c5807..a44405db739669dfd2907b0afd41293a7b173035 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -3,6 +3,7 @@
>   * Copyright(c) 2020, Analogix Semiconductor. All rights reserved.
>   *
>   */
> +#include <linux/cleanup.h>
>  #include <linux/gcd.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -15,6 +16,9 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/usb.h>
> +#include <linux/usb/pd.h>
> +#include <linux/usb/role.h>
>  #include <linux/workqueue.h>
>  
>  #include <linux/of_graph.h>
> @@ -1325,7 +1329,7 @@ static int anx7625_read_hpd_gpio_config_status(struct anx7625_data *ctx)
>  static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
>  {
>  	struct device *dev = ctx->dev;
> -	int ret, val;
> +	int ret;
>  
>  	/* Reset main ocm */
>  	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x40);
> @@ -1339,6 +1343,11 @@ static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
>  		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature fail.\n");
>  	else
>  		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature succeeded.\n");
> +}
> +
> +static void anx7625_configure_hpd(struct anx7625_data *ctx)
> +{
> +	int val;
>  
>  	/*
>  	 * Make sure the HPD GPIO already be configured after OCM release before
> @@ -1369,7 +1378,9 @@ static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
>  	if ((ret & FLASH_LOAD_STA_CHK) != FLASH_LOAD_STA_CHK)
>  		return -ENODEV;
>  
> -	anx7625_disable_pd_protocol(ctx);
> +	if (!ctx->typec_port)
> +		anx7625_disable_pd_protocol(ctx);
> +	anx7625_configure_hpd(ctx);
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "Firmware ver %02x%02x,",
>  			     anx7625_reg_read(ctx,
> @@ -1472,6 +1483,115 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>  	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=%02x\n", ret);
>  }
>  
> +#if IS_REACHABLE(CONFIG_TYPEC)
> +static void anx7625_typec_set_orientation(struct anx7625_data *ctx)
> +{
> +	u32 val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
> +
> +	if (val & (CC1_RP | CC1_RD))
> +		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NORMAL);
> +	else if (val & (CC2_RP | CC2_RD))
> +		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_REVERSE);
> +	else
> +		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NONE);
> +}
> +
> +static void anx7625_typec_isr(struct anx7625_data *ctx,
> +			      unsigned int intr_vector,
> +			      unsigned int intr_status)
> +{
> +	if (intr_vector & CC_STATUS)
> +		anx7625_typec_set_orientation(ctx);
> +	if (intr_vector & DATA_ROLE_STATUS) {
> +		usb_role_switch_set_role(ctx->role_sw,
> +					 (intr_status & DATA_ROLE_STATUS) ?
> +					 USB_ROLE_HOST : USB_ROLE_DEVICE);
> +		typec_set_data_role(ctx->typec_port,
> +				    (intr_status & DATA_ROLE_STATUS) ?
> +				    TYPEC_HOST : TYPEC_DEVICE);
> +	}
> +	if (intr_vector & VBUS_STATUS)
> +		typec_set_pwr_role(ctx->typec_port,
> +				   (intr_status & VBUS_STATUS) ?
> +				   TYPEC_SOURCE : TYPEC_SINK);
> +	if (intr_vector & VCONN_STATUS)
> +		typec_set_vconn_role(ctx->typec_port,
> +				     (intr_status & VCONN_STATUS) ?
> +				     TYPEC_SOURCE : TYPEC_SINK);
> +}
> +
> +static int anx7625_typec_register(struct anx7625_data *ctx)
> +{
> +	struct typec_capability typec_cap = { };
> +	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
> +	u32 val;
> +	int ret;
> +
> +	fwnode = device_get_named_child_node(ctx->dev, "connector");
> +	if (!fwnode)
> +		return 0;
> +
> +	ret = typec_get_fw_cap(&typec_cap, fwnode);
> +	if (ret < 0)
> +		return ret;
> +
> +	typec_cap.revision = 0x0120;
> +	typec_cap.pd_revision = 0x0300;
> +	typec_cap.usb_capability = USB_CAPABILITY_USB2 | USB_CAPABILITY_USB3;
> +	typec_cap.orientation_aware = true;
> +
> +	typec_cap.driver_data = ctx;
> +
> +	ctx->typec_port = typec_register_port(ctx->dev, &typec_cap);
> +	if (IS_ERR(ctx->typec_port))
> +		return PTR_ERR(ctx->typec_port);
> +
> +	ctx->role_sw = fwnode_usb_role_switch_get(fwnode);
> +	if (IS_ERR(ctx->role_sw)) {
> +		typec_unregister_port(ctx->typec_port);
> +		return PTR_ERR(ctx->role_sw);
> +	}
> +
> +	val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
> +	anx7625_typec_set_orientation(ctx);
> +	usb_role_switch_set_role(ctx->role_sw,
> +				 (val & DATA_ROLE_STATUS) ?
> +				 USB_ROLE_HOST : USB_ROLE_DEVICE);
> +	typec_set_data_role(ctx->typec_port,
> +			    (val & DATA_ROLE_STATUS) ?
> +			    TYPEC_HOST : TYPEC_DEVICE);
> +	typec_set_pwr_role(ctx->typec_port,
> +			    (val & VBUS_STATUS) ?
> +			    TYPEC_SOURCE : TYPEC_SINK);
> +	typec_set_vconn_role(ctx->typec_port,
> +			     (val & VCONN_STATUS) ?
> +			     TYPEC_SOURCE : TYPEC_SINK);
> +
> +	return 0;
> +}
> +
> +static void anx7625_typec_unregister(struct anx7625_data *ctx)
> +{
> +	usb_role_switch_put(ctx->role_sw);
> +	typec_unregister_port(ctx->typec_port);
> +}
> +#else
> +static void anx7625_typec_isr(struct anx7625_data *ctx,
> +			      unsigned int intr_vector,
> +			      unsigned int intr_status)
> +{
> +}
> +
> +static int anx7625_typec_register(struct anx7625_data *ctx)
> +{
> +	return 0;
> +}
> +
> +static void anx7625_typec_unregister(struct anx7625_data *ctx)
> +{
> +}
> +#endif
> +
>  static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
>  {
>  	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
> @@ -1566,7 +1686,7 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>  	}
>  }
>  
> -static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> +static int anx7625_intr_status(struct anx7625_data *ctx)
>  {
>  	int intr_vector, status;
>  	struct device *dev = ctx->dev;
> @@ -1593,9 +1713,6 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
>  		return status;
>  	}
>  
> -	if (!(intr_vector & HPD_STATUS_CHANGE))
> -		return -ENOENT;
> -
>  	status = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
>  				  SYSTEM_STSTUS);
>  	if (status < 0) {
> @@ -1604,6 +1721,12 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
>  	}
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x45=%x\n", status);
> +
> +	anx7625_typec_isr(ctx, intr_vector, status);
> +
> +	if (!(intr_vector & HPD_STATUS))
> +		return -ENOENT;
> +
>  	dp_hpd_change_handler(ctx, status & HPD_STATUS);
>  
>  	return 0;
> @@ -1622,7 +1745,7 @@ static void anx7625_work_func(struct work_struct *work)
>  		return;
>  	}
>  
> -	event = anx7625_hpd_change_detect(ctx);
> +	event = anx7625_intr_status(ctx);
>  
>  	mutex_unlock(&ctx->lock);
>  
> @@ -2741,11 +2864,29 @@ static int anx7625_i2c_probe(struct i2c_client *client)
>  	}
>  
>  	if (!platform->pdata.low_power_mode) {
> -		anx7625_disable_pd_protocol(platform);
> +		struct fwnode_handle *fwnode;
> +
> +		fwnode = device_get_named_child_node(dev, "connector");
> +		if (fwnode)
> +			fwnode_handle_put(fwnode);
> +		else
> +			anx7625_disable_pd_protocol(platform);
> +
> +		anx7625_configure_hpd(platform);
> +
>  		pm_runtime_get_sync(dev);
>  		_anx7625_hpd_polling(platform, 5000 * 100);
>  	}
>  
> +	if (platform->pdata.intp_irq)
> +		anx7625_reg_write(platform, platform->i2c.rx_p0_client,
> +				  INTERFACE_CHANGE_INT_MASK, 0);
> +
> +	/* After getting runtime handle */
> +	ret = anx7625_typec_register(platform);
> +	if (ret)
> +		goto pm_suspend;
> +
>  	/* Add work function */
>  	if (platform->pdata.intp_irq) {
>  		enable_irq(platform->pdata.intp_irq);
> @@ -2759,6 +2900,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> +pm_suspend:
> +	if (!platform->pdata.low_power_mode)
> +		pm_runtime_put_sync_suspend(&client->dev);
> +
>  free_wq:
>  	if (platform->workqueue)
>  		destroy_workqueue(platform->workqueue);
> @@ -2774,6 +2919,8 @@ static void anx7625_i2c_remove(struct i2c_client *client)
>  {
>  	struct anx7625_data *platform = i2c_get_clientdata(client);
>  
> +	anx7625_typec_unregister(platform);
> +
>  	drm_bridge_remove(&platform->bridge);
>  
>  	if (platform->pdata.intp_irq)
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index eb5580f1ab2f86b48b6f2df4fa4d6c3be603ad48..f9570cd6d22e55fd70a12c15960714cbb783d059 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -51,9 +51,21 @@
>  #define INTR_RECEIVED_MSG BIT(5)
>  
>  #define SYSTEM_STSTUS 0x45
> +#define INTERFACE_CHANGE_INT_MASK 0x43
>  #define INTERFACE_CHANGE_INT 0x44
> -#define HPD_STATUS_CHANGE 0x80
> -#define HPD_STATUS 0x80
> +#define VCONN_STATUS	BIT(2)
> +#define VBUS_STATUS	BIT(3)
> +#define CC_STATUS	BIT(4)
> +#define DATA_ROLE_STATUS	BIT(5)
> +#define HPD_STATUS	BIT(7)
> +
> +#define NEW_CC_STATUS 0x46
> +#define CC1_RD                  BIT(0)
> +#define CC1_RA                  BIT(1)
> +#define CC1_RP			(BIT(2) | BIT(3))
> +#define CC2_RD                  BIT(4)
> +#define CC2_RA                  BIT(5)
> +#define CC2_RP			(BIT(6) | BIT(7))
>  
>  /******** END of I2C Address 0x58 ********/
>  
> @@ -447,9 +459,14 @@ struct anx7625_i2c_client {
>  	struct i2c_client *tcpc_client;
>  };
>  
> +struct typec_port;
> +struct usb_role_switch;
> +
>  struct anx7625_data {
>  	struct anx7625_platform_data pdata;
>  	struct platform_device *audio_pdev;
> +	struct typec_port *typec_port;
> +	struct usb_role_switch *role_sw;
>  	int hpd_status;
>  	int hpd_high_cnt;
>  	int dp_en;
> 
> -- 
> 2.47.3

-- 
heikki
