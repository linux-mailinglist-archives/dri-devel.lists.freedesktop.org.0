Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC056C00BA3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F1E10E3CF;
	Thu, 23 Oct 2025 11:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Xn4egCLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49196.qiye.163.com (mail-m49196.qiye.163.com
 [45.254.49.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116A610E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:29:49 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26f1ef09a;
 Thu, 23 Oct 2025 19:29:45 +0800 (GMT+08:00)
Message-ID: <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
Date: Thu, 23 Oct 2025 19:29:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com> <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a10d4feb703abkunm0a84e08b197844
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlLGlYYH0tDGUweS0xOGRlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Xn4egCLAu3OJU+toy3rICbQxQ7WpaviHfsRYKx2TYkWkGCOojJo3gWHnrtg3mYuaIWc++VhgE8ebvOe0CSUPcma62p2KNUiAi/LQ7C9eEfeRI3mnlAJdNEH/ey9A4NwJ3xVIRHGLZKH8ToMeIXkEdVQZGEx8EV2KgTrvu1XBgEs=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=PV5L2/dVmRU/5ecTVqOwB2QqRRY2n4dnoFpehPZT1k0=;
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

Hi Heikki,

On 10/23/2025 4:45 PM, Heikki Krogerus wrote:
> On Thu, Oct 23, 2025 at 11:30:02AM +0800, Chaoyi Chen wrote:
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
>>   drivers/gpu/drm/bridge/Kconfig                | 11 ++++
>>   drivers/gpu/drm/bridge/Makefile               |  1 +
>>   .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
>>   3 files changed, 63 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index b9e0ca85226a..9f31540d3ad8 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -33,6 +33,17 @@ config DRM_AUX_HPD_BRIDGE
>>   menu "Display Interface Bridges"
>>   	depends on DRM && DRM_BRIDGE
>>   
>> +config DRM_AUX_TYPEC_DP_HPD_BRIDGE
>> +	tristate "TypeC DP HPD bridge"
>> +	depends on DRM_BRIDGE && OF && TYPEC
>> +	select DRM_AUX_HPD_BRIDGE
>> +	help
>> +	  Simple USB Type-C DP bridge that terminates the bridge chain and
>> +	  provides HPD support.
>> +
>> +	  If the USB-C controller driver has not implemented this and you need
>> +	  the DP HPD support, say "Y" or "m" here.
> You don't need to depend on DRM_BRIDGE separately, but do you really
> need a separate module for this in the first place?
>
>>   config DRM_CHIPONE_ICN6211
>>   	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
>>   	depends on OF
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>> index 245e8a27e3fc..e91736829167 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>>   obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
>> +obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o
> Instead, why not just make that a part of aux-hpd-bridge
> conditionally:
>
> ifneq ($(CONFIG_TYPEC),)
>          aux-hpd-bridge-y        += aux-hpd-typec-dp-bridge.o
> endif

Oh, I did consider that! But I noticed that aux-hpd-bridge.c contains the following statement module_auxiliary_driver(drm_aux_hpd_bridge_drv), which already includes a module_init. In the newly added file, in order to call the register function, another module_init was also added. If the two files are each made into a module separately, would there be a problem?


>
>
> thanks,
>
-- 
Best,
Chaoyi

