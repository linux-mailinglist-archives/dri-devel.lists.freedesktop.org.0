Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F2B44C18
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 05:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E016210E2AA;
	Fri,  5 Sep 2025 03:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="BwtbmYMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973172.qiye.163.com (mail-m1973172.qiye.163.com
 [220.197.31.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D577D10E2AA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 03:06:48 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 21c51f9ff;
 Fri, 5 Sep 2025 11:06:41 +0800 (GMT+08:00)
Message-ID: <22a5119c-01da-4a7a-bafb-f657b1552a56@rock-chips.com>
Date: Fri, 5 Sep 2025 11:06:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Marek Szyprowski <m.szyprowski@samsung.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
 <20250814104753.195255-1-damon.ding@rock-chips.com>
 <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
 <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
 <1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
 <f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
 <a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
 <461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
 <46f9137e-402d-4c0f-a224-10520f80c8b4@rock-chips.com>
 <ea57ca6e-4000-49f7-8e0b-899f34b7693a@samsung.com>
 <825ff59f-0a97-49a1-a210-a7ee275364bc@rock-chips.com>
 <4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9917d72c0e03a3kunmbaa24fa91f77c7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5IGVYeGEJMTkJKTU8fTE5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=BwtbmYMNkLOfYppAy+wuG3dRf3rgy/c5fhy0xfkxwjm4IP/EavUY+x5tkpRceqRJiBu+2UIRw4usYHfbUd9Y/L0yFePemizYbPmz3Q8nZ8ysLJ0O3T7nBxiPvA/aIkc9b4hwf3HatRCTgkqwI47m9DmdxumhhRdXH5+51C+XPQc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=yYRsnu1zQIxv1Gvs6bfNQCy9syx23j16FxOMbpuMt9Y=;
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

Hi Marek,

On 9/4/2025 9:27 PM, Marek Szyprowski wrote:
> On 04.09.2025 05:19, Damon Ding wrote:
>> On 9/1/2025 6:25 PM, Marek Szyprowski wrote:
>>> On 01.09.2025 05:41, Damon Ding wrote:
>>>> On 8/29/2025 4:23 PM, Marek Szyprowski wrote:
>>>>> On 29.08.2025 10:08, Damon Ding wrote:
>>>>>> On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
>>>>>>> On 15.08.2025 04:59, Damon Ding wrote:
>>>>>>>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>>>>>>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>>>>>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>>>>>>>> PATCH 1 is a small format optimization for struct
>>>>>>>>>>> analogid_dp_device.
>>>>>>>>>>> PATCH 2 is to perform mode setting in
>>>>>>>>>>> &drm_bridge_funcs.atomic_enable.
>>>>>>>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector
>>>>>>>>>>> helper.
>>>>>>>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>>>>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix
>>>>>>>>>>> side.
>>>>>>>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>>>>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>>>>>>> ...
>>>>>>>
>>>>>>
>>>>>> Could you please provide the related DTS file for the test? I will
>>>>>> also try to find out the reason for this unexpected issue. ;-)
>>>>>
>>>>> Unfortunately I didn't find enough time to debug this further. The
>>>>> above
>>>>> log is from Samsung Snow Chromebook,
>>>>> arch/arm/boot/dts/samsung/exynos5250-snow.dts
>>>>>
>>>>>
>>>>
>>>> I compare the differences in the following display path before and
>>>> after this patch series:
>>>>
>>>> exynos_dp -> nxp-ptn3460 -> panel "auo,b116xw03"
>>>>
>>>> The issue is likely caused by the &drm_connector_funcs.detect()
>>>> related logic. Before this patch series, the nxp-ptn3460 connector is
>>>> always connector_status_connected because there is not available
>>>> &drm_connector_funcs.detect(). After it, the DRM_BRIDGE_OP_DETECT flag
>>>> make the connection status depend on analogix_dp_bridge_detect().
>>>>
>>>> Could you please add the following patches additionally and try again?
>>>> (Not the final solution, just validation)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> index a93ff8f0a468..355911c47354 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> @@ -1491,9 +1491,11 @@ int analogix_dp_bind(struct analogix_dp_device
>>>> *dp, struct drm_device *drm_dev)
>>>>                   }
>>>>           }
>>>>
>>>> -       bridge->ops = DRM_BRIDGE_OP_DETECT |
>>>> -                     DRM_BRIDGE_OP_EDID |
>>>> +       bridge->ops = DRM_BRIDGE_OP_EDID |
>>>>                         DRM_BRIDGE_OP_MODES;
>>>> +       if (drm_bridge_is_panel(dp->plat_data->next_bridge))
>>>> +               bridge->ops |= DRM_BRIDGE_OP_DETECT;
>>>> +
>>>>           bridge->of_node = dp->dev->of_node;
>>>>           bridge->type = DRM_MODE_CONNECTOR_eDP;
>>>>           ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>>>
>>> It is better. Now the display panel is detected and reported to
>>> userspace, but it looks that something is not properly initialized,
>>> because there is garbage instead of the proper picture.
>>>
>>
>> I simulated the display path mentioned above on my RK3588S EVB1 Board.
>> To my slight surprise, it displayed normally with the reported
>> connector type DRM_MODE_CONNECTOR_LVDS. ;-)
>>
>> The modifications included:
>> 1.Synchronized the Analogix DP ralated DT configurations with Samsung
>> Snow Chromebook.
>> 2.Skipped the I2C transfers and GPIO operations in nxp-ptn3460 driver.
>> 3.Set the EDID to that of eDP Panel LP079QX1-SP0V forcibly.
>>
>> Additionally, I added debug logs to verify whether the functions in
>> ptn3460_bridge_funcs were actually called.
>>
>> Did you encounter any unexpected logs during your investigation? I'd
>> like to perform additional tests on this issue. :-)
> 
> 
> Okay, I've finally went to the office and tested manually all 3
> Chromebook boards witch use exynos-dp based display hardware. Previously
> I only did the remote tests and observed result on a webcam, which was
> not directed directly at the tested displays, so I only saw the glare
> from the display panel.
> 
> The results are as follows:
> 
> 1. Snow (arch/arm/boot/dts/samsung/exynos5250-snow.dts) - exynos-dp ->
> nxp-ptn3460 1366x768 lvds panel - works fine with the above mentioned
> change.
> 
> 2. Peach-Pit (arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts) -
> exynos-dp -> parade,ps8625 -> auo,b116xw03 1366x768 lvds panel -
> displays garbage, this was the only board I previously was able to see
> partially on the webcam.
> 
> 3. Peach-Pi (arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts) -
> exynos-dp -> auo,b133htn01 1920x1080 edp panel - also displays garbage.
> 
> Then I found why both Peach boards displays garbage on boot - the
> framebuffer emulation is initialized for 1024x786 resolution, which is
> not handled by those panels. This is a bit strange, because the
> connector implemented by the panel reports proper native mode to drm and
> userspace. 'modetest -c' shows the right resolution. Also when I run
> 'modetest -s' with the panel's native resolution then the test pattern
> is correctly displayed on all three boards.
> 
> 
> Then I've played a bit with the analogix code and it looks that this
> 1024x768 mode is some kind default mode which comes from
> analogix_dp_bridge_edid_read() function, which has been introduced by
> this patchset. When I removed DRM_BRIDGE_OP_EDID flag from bridge->ops,
> then I got it finally working again properly on all three boards. I hope
> this helps fixing this issue.
> 

Thank you for your help with the investigation. :-)

Based on your helpful findings and Dmitry's earlier suggestions[0], it 
is better to distinguish the &drm_bridge->ops of Analogix bridge based 
on whether the downstream device is a panel, a bridge or neither.

1. If there is a panel after, the &drm_bridge->ops should be set to 
DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT.

Since the &drm_bridge->ops of panel_bridge is DRM_BRIDGE_OP_MODES and 
the panel-edp driver reads EDID in &drm_panel_funcs.get_modes(), the 
DRM_BRIDGE_OP_EDID should be removed to ensure proper invocation for the 
&drm_bridge_funcs.get_modes() of panel_bridge.

2. If there is a bridge after, the &drm_bridge->ops should be set to NULL.

The OP_EDID and OP_MODES supports depends on the next bridge rather than 
the Analogix bridge. According to your investigation, nxp-ptn3460 
supports &drm_bridge_funcs.edid_read() while parade-ps8625 do not.

Additionally, since some bridges does not support 
&drm_bridge_funcs.detect(), which regards as connector_status_connected 
by default according to 
drm_helper_probe_detect()(drivers/gpu/drm_probe_helper.c), the 
connection status should also depends on the next bridge rather than the 
Analogix bridge.

3. If there is neither a panel nor a bridge, the &drm_bridge->ops should 
be set to DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT.

In this case, the Analogix DP driver may work in the DP mode, so the 
OP_EDID and OP_DETECT supports should be helpful.

Best regards,
Damon

[0]https://lore.kernel.org/all/incxmqneeurgli5h6p3hn3bgztxrzyk5eq2h5nq4lgzalohslq@mvehvr4cgyim/

