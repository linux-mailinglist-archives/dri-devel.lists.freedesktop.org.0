Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CCEC6893C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 10:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AC810E45E;
	Tue, 18 Nov 2025 09:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="IX/NU+qL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com
 [220.197.32.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F8510E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 09:37:45 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 29fbbda7b;
 Tue, 18 Nov 2025 17:37:40 +0800 (GMT+08:00)
Message-ID: <525040d5-84db-4de1-aed0-3b4b5a672f8b@rock-chips.com>
Date: Tue, 18 Nov 2025 17:37:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/10] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-7-kernel@airkyi.com>
 <7ca46d0d-d235-421e-95cb-901efb856b0c@linaro.org>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <7ca46d0d-d235-421e-95cb-901efb856b0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9653b96903abkunmdd5bac12ac7c5b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkkaTlYfHUoaThlMGkNMSk1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=IX/NU+qLfjpc6jNOUokdq+mlntEXb77qHZKkJ9s4nb711L7OON8h5dqK7p3ob8lQuodsMJH5PP/UEAjPxp2FGszqJCz5PIUkZPtYDoAMdBI3gqfWs9lxcFir/AqFnDfu3ECbZBWBOW0/7v/CHt0D1o3TWssNEa9VVNiVVtzULiQ=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=Ju+gAVn51Xi01WO06/xEtoW6S8aMqC2W8WHS0vrOthQ=;
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

Hi Neil,

On 11/18/2025 5:08 PM, Neil Armstrong wrote:
> On 11/11/25 11:50, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
>> device.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> (no changes since v7)
>>
>> Changes in v6:
>> - Fix depend in Kconfig.
>>
>>   drivers/phy/rockchip/Kconfig              |  2 +
>>   drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
>> index db4adc7c53da..bcb5476222fc 100644
>> --- a/drivers/phy/rockchip/Kconfig
>> +++ b/drivers/phy/rockchip/Kconfig
>> @@ -120,6 +120,8 @@ config PHY_ROCKCHIP_TYPEC
>>       tristate "Rockchip TYPEC PHY Driver"
>>       depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>>       depends on TYPEC || TYPEC=n
>> +    depends on DRM || DRM=n
>> +    select DRM_AUX_BRIDGE if DRM_BRIDGE
>>       select EXTCON
>>       select GENERIC_PHY
>>       select RESET_CONTROLLER
>> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
>> index 1f5b4142cbe4..748a6eb8ad95 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
>> @@ -36,6 +36,7 @@
>>    * orientation, false is normal orientation.
>>    */
>>   +#include <linux/auxiliary_bus.h>
>>   #include <linux/clk.h>
>>   #include <linux/clk-provider.h>
>>   #include <linux/delay.h>
>> @@ -56,6 +57,7 @@
>>   #include <linux/phy/phy.h>
>>   #include <linux/usb/typec_dp.h>
>>   #include <linux/usb/typec_mux.h>
>> +#include <drm/bridge/aux-bridge.h>
>>     #define CMN_SSM_BANDGAP            (0x21 << 2)
>>   #define CMN_SSM_BIAS            (0x22 << 2)
>> @@ -415,6 +417,7 @@ struct rockchip_usb3phy_port_cfg {
>>     struct rockchip_typec_phy {
>>       struct device *dev;
>> +    struct auxiliary_device dp_port_dev;
>>       void __iomem *base;
>>       struct extcon_dev *extcon;
>>       struct typec_mux_dev *mux;
>> @@ -1299,6 +1302,51 @@ static void tcphy_typec_mux_unregister(void *data)
>>       typec_mux_unregister(tcphy->mux);
>>   }
>>   +static void tcphy_dp_port_dev_release(struct device *dev)
>> +{
>> +    struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +    of_node_put(adev->dev.of_node);
>> +}
>> +
>> +static void tcphy_dp_port_unregister_adev(void *_adev)
>> +{
>> +    struct auxiliary_device *adev = _adev;
>> +
>> +    auxiliary_device_delete(adev);
>> +    auxiliary_device_uninit(adev);
>> +}
>> +
>> +static int tcphy_aux_bridge_register(struct rockchip_typec_phy *tcphy, struct device_node *np)
>> +{
>> +    struct auxiliary_device *adev = &tcphy->dp_port_dev;
>> +    int ret;
>> +
>> +    adev->name = "dp_port";
>> +    adev->dev.parent = tcphy->dev;
>> +    adev->dev.of_node = of_node_get(np);
>> +    adev->dev.release = tcphy_dp_port_dev_release;
>> +
>> +    ret = auxiliary_device_init(adev);
>> +
>
> Drop this empty line.

>
>> +    if (ret) {
>> +        of_node_put(adev->dev.of_node);
>> +        return ret;
>> +    }
>> +
>> +    ret = auxiliary_device_add(adev);
>> +    if (ret) {
>> +        auxiliary_device_uninit(adev);
>> +        return ret;
>> +    }
>> +
>> +    devm_add_action_or_reset(tcphy->dev, tcphy_dp_port_unregister_adev, adev);
>> +
>> +    ret = drm_aux_bridge_register(&adev->dev);
>
> Adding an aux device to an aux device looks quite overengineered to me !
>
> If it's a matter of using the proper of_node, you may instead create a separate
> drm_aux_bridge_register() like drm_aux_bridge_register_from_node() instead.

Yes, as you said, the aux device here is only to let the drm_aux_bridge get the correct of_node. I will add the API you mentioned in v10. Thank you.


-- 
Best,
Chaoyi

