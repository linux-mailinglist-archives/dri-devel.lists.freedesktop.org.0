Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C4DC2A2BC
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 07:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F04610E357;
	Mon,  3 Nov 2025 06:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="KLLEHfL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m21472.qiye.163.com (mail-m21472.qiye.163.com
 [117.135.214.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600110E357
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:24:19 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 28250c7cf;
 Mon, 3 Nov 2025 14:24:13 +0800 (GMT+08:00)
Message-ID: <eca9d5bd-23bd-4c1d-b2f2-c0c32f14177f@rock-chips.com>
Date: Mon, 3 Nov 2025 14:24:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-4-kernel@airkyi.com>
 <rzozpbqmymdczerh3iijxxtz3xnsznoku7w2mquikwv6u5osvo@7h43hwc2fpzm>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <rzozpbqmymdczerh3iijxxtz3xnsznoku7w2mquikwv6u5osvo@7h43hwc2fpzm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a4863370503abkunmdcf094ba9ba717
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUsdSVZPGUJDGB9KSEhJQhpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=KLLEHfL+eT0sjodZKmu60DNsnGd0BPXPm5ay685/jsdk/72KHGZ0UiGeNL2GEQAKZUdlSGuGXhrz+pcd7pL56fYgCYnfMhNrSnhqMBPKaXuop6Ybm3fvKwz1CN1DkV9k5/9fijJ7eQYFrgLXOTCjJ0vWbVkexNiveEuh3nFC8Ms=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=gBgZDKPDJM4JV2dVqNS/6faO3isIevqJbpBh6wQkg3U=;
 h=date:mime-version:subject:message-id:from;
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

On 11/3/2025 12:00 PM, Dmitry Baryshkov wrote:

> On Wed, Oct 29, 2025 at 03:14:28PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Several USB-C controller drivers have already implemented the DP HPD
>> bridge function provided by aux-hpd-bridge.c, but there are still
>> some USB-C controller driver that have not yet implemented it.
>>
>> This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
>> so that other USB-C controller drivers don't need to implement it again.
> This doesn't describe the problem that you are trying to solve.

I'll try to describe the information more accurately. Thank you.


>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v8:
>> - Merge generic DP HPD bridge into one module.
>>
>>   drivers/gpu/drm/bridge/Kconfig                |  5 +-
>>   drivers/gpu/drm/bridge/Makefile               |  8 +++-
>>   drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 23 ++++++++-
>>   drivers/gpu/drm/bridge/aux-hpd-bridge.h       | 13 +++++
>>   .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 47 +++++++++++++++++++
>>   5 files changed, 93 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.h
>>   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index a250afd8d662..17257b223a28 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -23,13 +23,16 @@ config DRM_AUX_BRIDGE
>>   	  build bridges chain.
>>   
>>   config DRM_AUX_HPD_BRIDGE
>> -	tristate
>> +	tristate "AUX HPD bridge support"
> Why? No, this is supposed to be selected by other drivers. Users don't
> know an wouldn't know what is this.

In v7, I implemented an additional module for selecting this option. But Heikki believes that it would be better to merge the two modules into one.



>
>>   	depends on DRM_BRIDGE && OF
>>   	select AUXILIARY_BUS
>>   	help
>>   	  Simple bridge that terminates the bridge chain and provides HPD
>>   	  support.
>>   
>> +	  Specifically, if you want a default Type-C DisplayPort HPD bridge for
>> +	  each port of the Type-C controller, say Y here.
>> +
>>   menu "Display Interface Bridges"
>>   	depends on DRM && DRM_BRIDGE
>>   
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>> index c7dc03182e59..2998937444bc 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -1,6 +1,12 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>> -obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
>> +
>> +hpd-bridge-y := aux-hpd-bridge.o
>> +ifneq ($(CONFIG_TYPEC),)
>> +hpd-bridge-y += aux-hpd-typec-dp-bridge.o
>> +endif
>> +obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += hpd-bridge.o
>> +
>>   obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>>   obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>>   obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
>> index 2e9c702c7087..11ad6dc776c7 100644
>> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
>> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
>> @@ -12,6 +12,8 @@
>>   #include <drm/drm_bridge.h>
>>   #include <drm/bridge/aux-bridge.h>
>>   
>> +#include "aux-hpd-bridge.h"
>> +
>>   static DEFINE_IDA(drm_aux_hpd_bridge_ida);
>>   
>>   struct drm_aux_hpd_bridge_data {
>> @@ -204,7 +206,26 @@ static struct auxiliary_driver drm_aux_hpd_bridge_drv = {
>>   	.id_table = drm_aux_hpd_bridge_table,
>>   	.probe = drm_aux_hpd_bridge_probe,
>>   };
>> -module_auxiliary_driver(drm_aux_hpd_bridge_drv);
>> +
>> +static int drm_aux_hpd_bridge_mod_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = auxiliary_driver_register(&drm_aux_hpd_bridge_drv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return drm_aux_hpd_typec_dp_bridge_init();
>> +}
>> +
>> +static void drm_aux_hpd_bridge_mod_exit(void)
>> +{
>> +	drm_aux_hpd_typec_dp_bridge_exit();
>> +	auxiliary_driver_unregister(&drm_aux_hpd_bridge_drv);
>> +}
>> +
>> +module_init(drm_aux_hpd_bridge_mod_init);
>> +module_exit(drm_aux_hpd_bridge_mod_exit);
>>   
>>   MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
>>   MODULE_DESCRIPTION("DRM HPD bridge");
>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.h b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
>> new file mode 100644
>> index 000000000000..69364731c2f1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef AUX_HPD_BRIDGE_H
>> +#define AUX_HPD_BRIDGE_H
>> +
>> +#if IS_REACHABLE(CONFIG_TYPEC)
>> +int drm_aux_hpd_typec_dp_bridge_init(void);
>> +void drm_aux_hpd_typec_dp_bridge_exit(void);
>> +#else
>> +static inline int drm_aux_hpd_typec_dp_bridge_init(void) { return 0; }
>> +static inline void drm_aux_hpd_typec_dp_bridge_exit(void) { }
>> +#endif /* IS_REACHABLE(CONFIG_TYPEC) */
>> +
>> +#endif /* AUX_HPD_BRIDGE_H */
>> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>> new file mode 100644
>> index 000000000000..6f2a1fca0fc5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>> @@ -0,0 +1,47 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +#include <linux/of.h>
>> +#include <linux/usb/typec_altmode.h>
>> +#include <linux/usb/typec_dp.h>
>> +#include <linux/usb/typec_notify.h>
>> +
>> +#include <drm/bridge/aux-bridge.h>
>> +
>> +#include "aux-hpd-bridge.h"
>> +
>> +#if IS_REACHABLE(CONFIG_TYPEC)
>> +static int drm_typec_bus_event(struct notifier_block *nb,
>> +			       unsigned long action, void *data)
>> +{
> This feels like this should be a part of the Type-C subsystem rather
> than DRM.

In v7, this used to be a part of the Type-C subsystem. I'm not sure what Heikki thinks about this.



>
>> +	struct typec_altmode *alt = (struct typec_altmode *)data;
>> +
>> +	if (action != TYPEC_ALTMODE_REGISTERED)
>> +		goto done;
>> +
>> +	if (is_typec_partner(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
>> +		goto done;
>> +
>> +	/*
>> +	 * alt->dev.parent->parent : USB-C controller device
>> +	 * alt->dev.parent         : USB-C connector device
>> +	 */
>> +	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>> +				   to_of_node(alt->dev.parent->fwnode));
>> +
>> +done:
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block drm_typec_event_nb = {
>> +	.notifier_call = drm_typec_bus_event,
>> +};
>> +
>> +int drm_aux_hpd_typec_dp_bridge_init(void)
>> +{
>> +	return typec_altmode_register_notify(&drm_typec_event_nb);
>> +}
>> +
>> +void drm_aux_hpd_typec_dp_bridge_exit(void)
>> +{
>> +	typec_altmode_unregister_notify(&drm_typec_event_nb);
>> +}
>> +#endif
>> -- 
>> 2.49.0
>>
-- 
Best,
Chaoyi

