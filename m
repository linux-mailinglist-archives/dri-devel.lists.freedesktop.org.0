Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CBC38F14
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 04:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F1210E071;
	Thu,  6 Nov 2025 03:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="evRfUVzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973192.qiye.163.com (mail-m1973192.qiye.163.com
 [220.197.31.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91A610E071
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 03:07:05 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2893b798a;
 Thu, 6 Nov 2025 11:06:56 +0800 (GMT+08:00)
Message-ID: <64de56d4-43e8-4e77-a171-0bd0855ad816@rock-chips.com>
Date: Thu, 6 Nov 2025 11:06:54 +0800
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
X-HM-Tid: 0a9a5721af0c03abkunm89fae464e7fb72
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtKHlZKSk1MSE5OS0kfTkpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=evRfUVzE9gnJAOXo0XuZFWXMj+MLkXfh5miIhw12ck4N1iYs5TbQdrxU9sXAhiqRhN95j9bofAlR+87xDufP/ZBmz83i5dVRqQ8YiIiWE3TJThOgujLTjEgg/nXx4gfI/QUtvi+Nqf0kpUsoxBrB6H+DOC0XV+9rUTNW2AupTjQ=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=uxhO0QLYdKtAxkfwSVZCwZIlmY3EqbMoelKvCYvQETM=;
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
>
Sorry, I might have misunderstood you point. In v7, I added a new DRM_AUX_TYPEC_DP_HPD_BRIDGE module to select DRM_AUX_HPD_BRIDGE. This seems to fit the "selected by other drivers" scenario, but I think you might not want to expose any information to the users.

And the other one is what Heikki said:

+if DRM_AUX_HPD_BRIDGE + +config DRM_AUX_HPD_TYPEC_BRIDGE + tristate + depends on TYPEC || !TYPEC + default TYPEC + +endif /* DRM_AUX_HPD_BRIDGE */ + menu "Display Interface Bridges" depends on DRM && DRM_BRIDGE

If I understand correctly, in this scenario we need to select DRM_AUX_HPD_BRIDGE in the DP driver. When Type-C is available, DRM_AUX_HPD_TYPEC_BRIDGE will be selected automatically.

Is the method mentioned by Heikki what you want? Thank you.

-- 
Best,
Chaoyi

