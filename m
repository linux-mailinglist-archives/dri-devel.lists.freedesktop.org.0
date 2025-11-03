Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5111AC2C3DE
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 14:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CE910E3E9;
	Mon,  3 Nov 2025 13:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoEhzKYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B27610E3E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762177709; x=1793713709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/eMBTgNJH8/Xgm8LgLzir6GKHePQ75zTAgJlicmNsfQ=;
 b=WoEhzKYemBdcD8PsWNzNw5GpGsxipF4zNsvDD+kJ2q/ZJ1zCjXBRV9RO
 +kDYMo58SBbvdtNm3qvOkFRT4cLQKAIJL1k+cSiHArylAXKORuXJNPQUZ
 rk9nQDIQZ5fQwo6P8yAdJz+kxNS7OX0PROUXsQdNSqPttJWviXv2jUwP5
 kbi0SaprYUKwk8m7Nvv9e/IJVxVvbZaDVJA0G5bEJRO0q7ZEauOL91BMq
 5e+4mnRp/YEMA9bD9RnHI2/7Fg2o41yDlr+GJj3kHANHAoQ0wOC+c0rq+
 UlanJs6L+8YuY8QsEp72pk1iZ4m45rcZjmIXYONRN13YSF/AiYa9b7WPI Q==;
X-CSE-ConnectionGUID: gXPZd5MsQ6GI3ODHxV562A==
X-CSE-MsgGUID: vD9XtzfwRCqfK3Gl7Us3bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64156336"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64156336"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 05:48:29 -0800
X-CSE-ConnectionGUID: JFm5J5b9STC09kNJqEZ1eA==
X-CSE-MsgGUID: J32ocSpgR2yn1eLsQx1Tpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186110382"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.222])
 by orviesa006.jf.intel.com with SMTP; 03 Nov 2025 05:48:11 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 03 Nov 2025 15:48:09 +0200
Date: Mon, 3 Nov 2025 15:48:09 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 03/10] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <aQiymTFVU7UpcJ1p@kuha.fi.intel.com>
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-4-kernel@airkyi.com>
 <rzozpbqmymdczerh3iijxxtz3xnsznoku7w2mquikwv6u5osvo@7h43hwc2fpzm>
 <eca9d5bd-23bd-4c1d-b2f2-c0c32f14177f@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eca9d5bd-23bd-4c1d-b2f2-c0c32f14177f@rock-chips.com>
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

> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index a250afd8d662..17257b223a28 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -23,13 +23,16 @@ config DRM_AUX_BRIDGE
> > >   	  build bridges chain.
> > >   config DRM_AUX_HPD_BRIDGE
> > > -	tristate
> > > +	tristate "AUX HPD bridge support"
> > Why? No, this is supposed to be selected by other drivers. Users don't
> > know an wouldn't know what is this.
> 
> In v7, I implemented an additional module for selecting this option. But
> Heikki believes that it would be better to merge the two modules into one.

Like I said before, I was merely curious why not just squash the
support into that AUX_PD_HPD_BRIDGE. If that does not make sense, then
so be it - make it a "Display Interface Bridge" driver like you
originally proposed.

> > >   	depends on DRM_BRIDGE && OF
> > >   	select AUXILIARY_BUS
> > >   	help
> > >   	  Simple bridge that terminates the bridge chain and provides HPD
> > >   	  support.
> > > +	  Specifically, if you want a default Type-C DisplayPort HPD bridge for
> > > +	  each port of the Type-C controller, say Y here.
> > > +
> > >   menu "Display Interface Bridges"
> > >   	depends on DRM && DRM_BRIDGE
> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > index c7dc03182e59..2998937444bc 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -1,6 +1,12 @@
> > >   # SPDX-License-Identifier: GPL-2.0
> > >   obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
> > > -obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
> > > +
> > > +hpd-bridge-y := aux-hpd-bridge.o
> > > +ifneq ($(CONFIG_TYPEC),)
> > > +hpd-bridge-y += aux-hpd-typec-dp-bridge.o
> > > +endif
> > > +obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += hpd-bridge.o
> > > +
> > >   obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
> > >   obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
> > >   obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> > > diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > > index 2e9c702c7087..11ad6dc776c7 100644
> > > --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> > > @@ -12,6 +12,8 @@
> > >   #include <drm/drm_bridge.h>
> > >   #include <drm/bridge/aux-bridge.h>
> > > +#include "aux-hpd-bridge.h"
> > > +
> > >   static DEFINE_IDA(drm_aux_hpd_bridge_ida);
> > >   struct drm_aux_hpd_bridge_data {
> > > @@ -204,7 +206,26 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
> > >   	.id_table = drm_aux_hpd_bridge_table,
> > >   	.probe = drm_aux_hpd_bridge_probe,
> > >   };
> > > -module_auxiliary_driver(drm_aux_hpd_bridge_drv);
> > > +
> > > +static int drm_aux_hpd_bridge_mod_init(void)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = auxiliary_driver_register(&drm_aux_hpd_bridge_drv);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return drm_aux_hpd_typec_dp_bridge_init();
> > > +}
> > > +
> > > +static void drm_aux_hpd_bridge_mod_exit(void)
> > > +{
> > > +	drm_aux_hpd_typec_dp_bridge_exit();
> > > +	auxiliary_driver_unregister(&drm_aux_hpd_bridge_drv);
> > > +}
> > > +
> > > +module_init(drm_aux_hpd_bridge_mod_init);
> > > +module_exit(drm_aux_hpd_bridge_mod_exit);
> > >   MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> > >   MODULE_DESCRIPTION("DRM HPD bridge");
> > > diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.h b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
> > > new file mode 100644
> > > index 000000000000..69364731c2f1
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
> > > @@ -0,0 +1,13 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +#ifndef AUX_HPD_BRIDGE_H
> > > +#define AUX_HPD_BRIDGE_H
> > > +
> > > +#if IS_REACHABLE(CONFIG_TYPEC)
> > > +int drm_aux_hpd_typec_dp_bridge_init(void);
> > > +void drm_aux_hpd_typec_dp_bridge_exit(void);
> > > +#else
> > > +static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
> > > +static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
> > > +#endif /* IS_REACHABLE(CONFIG_TYPEC) */
> > > +
> > > +#endif /* AUX_HPD_BRIDGE_H */
> > > diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> > > new file mode 100644
> > > index 000000000000..6f2a1fca0fc5
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> > > @@ -0,0 +1,47 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +#include <linux/of.h>
> > > +#include <linux/usb/typec_altmode.h>
> > > +#include <linux/usb/typec_dp.h>
> > > +#include <linux/usb/typec_notify.h>
> > > +
> > > +#include <drm/bridge/aux-bridge.h>
> > > +
> > > +#include "aux-hpd-bridge.h"
> > > +
> > > +#if IS_REACHABLE(CONFIG_TYPEC)
> > > +static int drm_typec_bus_event(struct notifier_block *nb,
> > > +			       unsigned long action, void *data)
> > > +{
> > This feels like this should be a part of the Type-C subsystem rather
> > than DRM.
> 
> In v7, this used to be a part of the Type-C subsystem. I'm not sure what
> Heikki thinks about this.

Your original proposal of making the entire TYPEC subsystem depend on
DRM is _not_ going to happen. In general, if I've now understood this
correctly, this thing probable should be a "display interface bridge
driver", similar to what you proposed in the previous version.

Note also that you could make it selected automatically, so there is
no need for user selectable option if that's the preference. Kconfig
and Makefile gives you options on how to do that. For example, maybe
this Kconfig works (or does not, but something like it will):

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..7487024ba2ce 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,15 @@ config DRM_AUX_HPD_BRIDGE
          Simple bridge that terminates the bridge chain and provides HPD
          support.
 
+if DRM_AUX_HPD_BRIDGE
+
+config DRM_AUX_HPD_TYPEC_BRIDGE
+       tristate
+       depends on TYPEC || !TYPEC
+       default TYPEC
+
+endif /* DRM_AUX_HPD_BRIDGE */
+
 menu "Display Interface Bridges"
        depends on DRM && DRM_BRIDGE
 


thanks,

-- 
heikki
