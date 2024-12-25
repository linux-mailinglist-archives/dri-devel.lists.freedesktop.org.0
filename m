Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39469FC41B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 09:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448D310E06C;
	Wed, 25 Dec 2024 08:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="UPC0f7qc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49230.qiye.163.com (mail-m49230.qiye.163.com
 [45.254.49.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E490A10E06C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 08:27:28 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6c497887;
 Wed, 25 Dec 2024 16:27:23 +0800 (GMT+08:00)
Message-ID: <affff5b9-95fb-4d0a-ab09-371545e8450b@rock-chips.com>
Date: Wed, 25 Dec 2024 16:27:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy
 configuration.
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com>
 <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
 <654c30ec-7d7e-4956-9a48-15bfcea34acc@rock-chips.com>
 <CAA8EJpqk-iim668ZTzQaROJmkTr2COBwA5G9Eg73uLE28XHYpg@mail.gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <CAA8EJpqk-iim668ZTzQaROJmkTr2COBwA5G9Eg73uLE28XHYpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ04YT1ZOGEIfTBlKSB8fSk5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93fced818603a3kunm6c497887
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Tjo5GjIcEE8YDys4KEMj
 Kj0aFBBVSlVKTEhOSkpOSU9OTEtNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNQk9LNwY+
DKIM-Signature: a=rsa-sha256;
 b=UPC0f7qcrwZe5+4cW9Y0k24vj4hFwCwq07GzJZR1NrL6UI77q+ZweU392GftAMLQYVyu/1jerhQCLTGDsIal4GHLyxA42x6uoOCFIy7dxZQD+xAhAIDn9gWTzPeA6c3aqMnzyEPmEElCv3pN2qgse8lKl+SP0u9RYeUgWfwByXY=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=txPoZjhS7WmZRPL5mk+VeO5MESw98jX31iKdCOFZ2WY=;
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

Hi Dmitry,

On 2024/12/20 13:37, Dmitry Baryshkov wrote:
> On Fri, 20 Dec 2024 at 05:37, Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 2024/12/20 8:13, Dmitry Baryshkov wrote:
>>> On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
>>>> Add support to configurate link rate, lane count, voltage swing and
>>>> pre-emphasis with phy_configure(). It is helpful in application scenarios
>>>> where analogix controller is mixed with the phy of other vendors.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - remove needless assignments for phy_configure()
>>>> - remove unnecessary changes for phy_power_on()/phy_power_off()
>>>> ---
>>>>    .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>>>>    .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 56 +++++++++++++++++++
>>>>    2 files changed, 57 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> index 6f10d88a34c5..9429c50cc1bc 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> @@ -1696,6 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
>>>>       if (dp->plat_data->power_on)
>>>>               dp->plat_data->power_on(dp->plat_data);
>>>>
>>>> +    phy_set_mode(dp->phy, PHY_MODE_DP);
>>>>       phy_power_on(dp->phy);
>>>>
>>>>       analogix_dp_init_dp(dp);
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>>> index 3afc73c858c4..613ce504bea6 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>>>> @@ -11,6 +11,7 @@
>>>>    #include <linux/gpio/consumer.h>
>>>>    #include <linux/io.h>
>>>>    #include <linux/iopoll.h>
>>>> +#include <linux/phy/phy.h>
>>>>
>>>>    #include <drm/bridge/analogix_dp.h>
>>>>
>>>> @@ -513,10 +514,25 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
>>>>    void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
>>>>    {
>>>>       u32 reg;
>>>> +    int ret;
>>>>
>>>>       reg = bwtype;
>>>>       if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
>>>>               writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
>>>> +
>>>> +    if (dp->phy) {
>>>> +            union phy_configure_opts phy_cfg = {0};
>>>> +
>>>> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
>>>
>>> Should not be necessary, you are only setting the .set_rate.
>>
>> Indeed, this can be dropped.
>>
>>>
>>>> +            phy_cfg.dp.link_rate =
>>>> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
>>>> +            phy_cfg.dp.set_rate = true;
>>>> +            ret = phy_configure(dp->phy, &phy_cfg);
>>>> +            if (ret && ret != -EOPNOTSUPP) {
>>>> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>>>> +                    return;
>>>> +            }
>>>> +    }
>>>>    }
>>>>
>>>>    void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>>>> @@ -530,9 +546,22 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>>>>    void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
>>>>    {
>>>>       u32 reg;
>>>> +    int ret;
>>>>
>>>>       reg = count;
>>>>       writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
>>>> +
>>>> +    if (dp->phy) {
>>>> +            union phy_configure_opts phy_cfg = {0};
>>>> +
>>>> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
>>>> +            phy_cfg.dp.set_lanes = true;
>>>> +            ret = phy_configure(dp->phy, &phy_cfg);
>>>> +            if (ret && ret != -EOPNOTSUPP) {
>>>> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>>>> +                    return;
>>>> +            }
>>>> +    }
>>>>    }
>>>>
>>>>    void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>>>> @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>>>>    void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
>>>>    {
>>>>       u8 lane;
>>>> +    int ret;
>>>>
>>>>       for (lane = 0; lane < dp->link_train.lane_count; lane++)
>>>>               writel(dp->link_train.training_lane[lane],
>>>>                      dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
>>>> +
>>>> +    if (dp->phy) {
>>>> +            union phy_configure_opts phy_cfg = {0};
>>>> +
>>>> +            for (lane = 0; lane < dp->link_train.lane_count; lane++) {
>>>> +                    u8 training_lane = dp->link_train.training_lane[lane];
>>>> +                    u8 vs, pe;
>>>> +
>>>> +                    vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
>>>> +                         DP_TRAIN_VOLTAGE_SWING_SHIFT;
>>>> +                    pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
>>>> +                         DP_TRAIN_PRE_EMPHASIS_SHIFT;
>>>> +                    phy_cfg.dp.voltage[lane] = vs;
>>>> +                    phy_cfg.dp.pre[lane] = pe;
>>>> +            }
>>>> +
>>>> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
>>>> +            phy_cfg.dp.link_rate =
>>>> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
>>>
>>> This two should not be necessary, please drop them.
>>
>> These two are necessary for rk_hdptx_phy_set_voltage(), so they cannot
>> be dropped.
> 
> Please review the documentation for struct phy_configure_opts_dp and
> fix your PHY driver to skip the values for which the .set_foo isn't
> set. Then you might have to change this part.
> You are setting just .set_voltages. It means that the rate and .lanes
> shouldn't be changed and can be used as they were set by the previous
> calls to phy_configure().
> 

Indeed, I will store the previous &phy_configure_opts.dp.link_rate and 
&phy_configure_opts.dp.lanes in the struct rk_hdptx_phy, and will not 
use both of them during the configuration process of the 
&phy_cfg.dp.voltage[] and &phy_cfg.dp.pre[] in next version.

>>
>>>
>>>> +            phy_cfg.dp.set_voltages = true;
>>>> +            ret = phy_configure(dp->phy, &phy_cfg);
>>>> +            if (ret && ret != -EOPNOTSUPP) {
>>>> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>>>> +                    return;
>>>> +            }
>>>> +    }
>>>>    }
>>>>
>>>>    u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
>>>> --
>>>> 2.34.1
>>>>
>>>

Best regards,
Damon

