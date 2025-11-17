Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AADC62ECF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BAF10E2F2;
	Mon, 17 Nov 2025 08:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VS1dBBIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78DE10E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763368844; x=1794904844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gkncn3MOxKMpS7fFx8b0bIjvCegdIq2/X6RbhxiwYLI=;
 b=VS1dBBIy5LB54X0xWPsXJ+ltM4fQY0mulOYCeHAsjRgI9stA/GMUfwCf
 e0PiwGWnUtnd5rrvLolPeBbez4lD1ofjyRFJJXxyxqOcIv5nDtrMb3Ivq
 Sl1GND5H1BZp5dk17qnSmS2npdgwwXPrXgVEON9tJSnd3G/LKztWuLr5L
 olb5zlvWJZOE+BYONgsS7inotrrp7MRajxtP9QQ92GI2vtFNAbnzjvPUU
 8axFy2nFWPftpwUNIhy5SJeRiaP3Ems0KWA7aAEzX1UfJUdFLJh8lLGlD
 KwRuIb+859NH3fgIGu5IKwM+K8y+JP4O9VcbMAGX+M4zbcMobjmqN9xJD A==;
X-CSE-ConnectionGUID: CriQ5UdYRBm7Y/W3ABocWw==
X-CSE-MsgGUID: Et9+HNWXTqqnhdNlxSHKqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="52930423"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="52930423"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 00:40:44 -0800
X-CSE-ConnectionGUID: +E6Bi6sGSmS+xsZI5u+9Xw==
X-CSE-MsgGUID: u/K5zt9SSo2D8r6X/N8XtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213794754"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.176])
 by fmviesa002.fm.intel.com with SMTP; 17 Nov 2025 00:40:33 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 17 Nov 2025 10:40:30 +0200
Date: Mon, 17 Nov 2025 10:40:30 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 03/10] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <aRrffpTP5KyAFVnx@kuha.fi.intel.com>
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111105040.94-4-kernel@airkyi.com>
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

Tue, Nov 11, 2025 at 06:50:33PM +0800, Chaoyi Chen kirjoitti:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The HPD function of Type-C DP is implemented through
> drm_connector_oob_hotplug_event(). For embedded DP, it is required
> that the DRM connector fwnode corresponds to the Type-C port fwnode.
> 
> To describe the relationship between the DP controller and the Type-C
> port device, we usually using drm_bridge to build a bridge chain.
> 
> Now several USB-C controller drivers have already implemented the DP
> HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
> HPD bridge on USB-C connector port device.
> 
> But this requires the USB-C controller driver to manually register the
> HPD bridge. If the driver does not implement this feature, the bridge
> will not be create.
> 
> So this patch implements a generic DP HPD bridge based on
> aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
> Type-C port device containing the DP svid is registered, it will
> create an HPD bridge for it without the need for the USB-C controller
> driver to implement it.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Normally there is no "help" section for hidden config options. I
guess it can not cause any harm? It is a bit confusing, though. But
FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v9:
> - Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
> DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
> - Add more commit comment about problem background.
> 
> Changes in v8:
> - Merge generic DP HPD bridge into one module.
> 
>  drivers/gpu/drm/bridge/Kconfig                | 10 ++++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 50 +++++++++++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index a250afd8d662..559487aa09a9 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -30,6 +30,16 @@ config DRM_AUX_HPD_BRIDGE
>  	  Simple bridge that terminates the bridge chain and provides HPD
>  	  support.
>  
> +if DRM_AUX_HPD_BRIDGE
> +config DRM_AUX_HPD_TYPEC_BRIDGE
> +	tristate
> +	depends on TYPEC || !TYPEC
> +	default TYPEC
> +	help
> +	  Simple bridge that terminates the bridge chain and provides HPD
> +	  support. It build bridge on each USB-C connector device node.
> +endif
> +
>  menu "Display Interface Bridges"
>  	depends on DRM && DRM_BRIDGE
>  
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index c7dc03182e59..a3a0393d2e72 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>  obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
> +obj-$(CONFIG_DRM_AUX_HPD_TYPEC_BRIDGE) += aux-hpd-typec-dp-bridge.o
>  obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> new file mode 100644
> index 000000000000..9cb6a0cb0f0a
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/of.h>
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
> +
> +#include <drm/bridge/aux-bridge.h>
> +
> +static int drm_typec_bus_event(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct typec_altmode *alt = (struct typec_altmode *)data;
> +
> +	if (action != TYPEC_ALTMODE_REGISTERED)
> +		goto done;
> +
> +	if (is_typec_partner(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> +		goto done;
> +
> +	/*
> +	 * alt->dev.parent->parent : USB-C controller device
> +	 * alt->dev.parent         : USB-C connector device
> +	 */
> +	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +				   to_of_node(alt->dev.parent->fwnode));
> +
> +done:
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block drm_typec_event_nb = {
> +	.notifier_call = drm_typec_bus_event,
> +};
> +
> +static void drm_aux_hpd_typec_dp_bridge_module_exit(void)
> +{
> +	typec_altmode_unregister_notify(&drm_typec_event_nb);
> +}
> +
> +static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
> +{
> +	typec_altmode_register_notify(&drm_typec_event_nb);
> +
> +	return 0;
> +}
> +
> +module_init(drm_aux_hpd_typec_dp_bridge_module_init);
> +module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
> +
> +MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
> +MODULE_LICENSE("GPL");
> -- 
> 2.51.1

-- 
heikki
