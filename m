Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4849CC29C45
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 02:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ABE10E2AA;
	Mon,  3 Nov 2025 01:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="MhC1aMzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3287.qiye.163.com (mail-m3287.qiye.163.com
 [220.197.32.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3C910E2AA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 01:16:03 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2818daae2;
 Mon, 3 Nov 2025 09:15:57 +0800 (GMT+08:00)
Message-ID: <48b9ae2c-7cc5-430d-94c0-e49d341a4b14@rock-chips.com>
Date: Mon, 3 Nov 2025 09:15:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <20251029071435.88-4-kernel@airkyi.com> <aQTAdaIgjgTRSgxL@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aQTAdaIgjgTRSgxL@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a4748ff7903abkunm80e48559945672
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUlNTVYYS05PH0hMS0hMTRhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=MhC1aMzTcbPCb2GjvXUVWVpijnqhAyuKlMB6iEaiyJGduWsVfghOz7b2U3nUfv8Mj0E35szVjd5jTralNiiLCaQdj9D5G7m7Qs5XWRHxfl1qXlNyLyigt/zY5uzcO1bqg1vdcVzL/VjRyP0YS3mSEae+ibuPs+XQeTNHJ1KiXT8=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=5pRPING1gapH7HdR50g5wH/mDEvyo4qh8YXcAm7Fee8=;
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

On 10/31/2025 9:58 PM, Heikki Krogerus wrote:

> Wed, Oct 29, 2025 at 03:14:28PM +0800, Chaoyi Chen kirjoitti:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Several USB-C controller drivers have already implemented the DP HPD
>> bridge function provided by aux-hpd-bridge.c, but there are still
>> some USB-C controller driver that have not yet implemented it.
>>
>> This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
>> so that other USB-C controller drivers don't need to implement it again.
>>
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
> Don't you now need:
>
>          depends on TYPEC || !TYPEC
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
> You don't need that. You should not use ifdefs in .c files.
>
Oh yes, this should be handled by depend on. I will fix it in v9.

-- 
Best,
Chaoyi

