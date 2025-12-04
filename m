Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0261CA3DB0
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EFB10E988;
	Thu,  4 Dec 2025 13:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iA42RosM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5510E985
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764855677; x=1796391677;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5vrRVcLYPFCpzhwyAw2L34Cd/fwmvirgk6ahEYjKQ3Y=;
 b=iA42RosM/IRGnCyWiVmbhNQ5nHSLRsIAmFMHcU47Q4ulifAYXAjiW824
 guG5BEW2tMXYqAeMCfUuxDPNisnmvLLccJBow93N0+rqP3G/xrlC2TTAd
 WaRpMbgxXYHy809Pf3GgZC3pEyrYrEJTsepLheeqq+ICroPfjIY1I+DmL
 0dSleuuRF19U8bf2lPwJ/+EIyrLcony9IxZFAgtTkViING9Rw3iTO1OHf
 SuLz3MyjrGvpFgUXh0nlSvpLnHsSTJvkb3+gkkMTkSFEUxaY5EBlh2Jjq
 UrvwlVJC7GYwIBgRcnbouJdY8JOzwo8FTZH0BfepMgwWUnmFqUD2IVBok g==;
X-CSE-ConnectionGUID: qaJcV1kcTaK3leRWciZkog==
X-CSE-MsgGUID: J2S3XctwSE677rOHqYjwEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77554966"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="77554966"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:41:16 -0800
X-CSE-ConnectionGUID: cEDuTO85SkOa/8dziq4Xxg==
X-CSE-MsgGUID: B4wj07nmRam/YVp9CHTeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194056172"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.149])
 by orviesa006.jf.intel.com with SMTP; 04 Dec 2025 05:41:05 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 04 Dec 2025 15:40:56 +0200
Date: Thu, 4 Dec 2025 15:40:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB
 Type-C DP HPD bridge
Message-ID: <aTGPaJmwd7uHfrnV@kuha>
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204063109.104-4-kernel@airkyi.com>
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

Hi,

I don't know what's going on here - this series is the 12th?
In any case, you need to fix this..

> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> new file mode 100644
> index 000000000000..94be3d5f69e9
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> @@ -0,0 +1,51 @@
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
> +	struct device *dev = (struct device *)data;
> +	struct typec_altmode *alt = to_typec_altmode(dev);
> +
> +	if (action != BUS_NOTIFY_ADD_DEVICE)
> +		goto done;
> +
> +	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> +		goto done;

That's still not enough because of the plug altmodes. You need to
check that it's a port altmode:

        if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
        	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
        				   to_of_node(alt->dev.parent->fwnode));

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
> +	bus_unregister_notifier(&typec_bus, &drm_typec_event_nb);
> +}
> +
> +static int __init drm_aux_hpd_typec_dp_bridge_module_init(void)
> +{
> +	bus_register_notifier(&typec_bus, &drm_typec_event_nb);
> +
> +	return 0;
> +}
> +
> +module_init(drm_aux_hpd_typec_dp_bridge_module_init);
> +module_exit(drm_aux_hpd_typec_dp_bridge_module_exit);
> +
> +MODULE_DESCRIPTION("DRM TYPEC DP HPD BRIDGE");
> +MODULE_LICENSE("GPL");

thanks,

-- 
heikki
