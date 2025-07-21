Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A9B0BDC7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 09:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241F10E38B;
	Mon, 21 Jul 2025 07:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="EMNzdqeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15581.qiye.163.com (mail-m15581.qiye.163.com
 [101.71.155.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D1810E38B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:36:47 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1cb3df4bc;
 Mon, 21 Jul 2025 15:36:41 +0800 (GMT+08:00)
Message-ID: <f122492f-7f2a-4d3f-af74-3b807c9cd742@rock-chips.com>
Date: Mon, 21 Jul 2025 15:36:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] drm/bridge: analogix_dp: Add support to find
 panel or bridge
From: Damon Ding <damon.ding@rock-chips.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-8-damon.ding@rock-chips.com>
 <4555084.IFkqi6BYcA@diego>
 <0a4d5e97-a143-4293-987c-5682be60023d@rock-chips.com>
Content-Language: en-US
In-Reply-To: <0a4d5e97-a143-4293-987c-5682be60023d@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a982be9d47603a3kunmf0036496274134
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pOGFZOTh5JQ0IfGU8fTk5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=EMNzdqeOdDlKBOOh7gKY5lvBoJzZz8n2CRLGROufJnK6PLGQKvzZoO0aFgSUCAW00tzdnoo7j+vy+8rJ7RfLspNoAWLHoCr2AgqbinG5qPCrWGgeqQ7CpYYZ/bGGjDJsSsuLR9okEiHEnpoMW5W6Ka27Wl13J3KRAMUp2Bm0hto=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=BcqKufxdH6F7LtnCk0e0JkGxUW+ENO9nSfoURV4nsTs=;
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

On 2025/7/11 15:41, Damon Ding wrote:
> Hi Heiko,
> 
> On 2025/7/10 4:07, Heiko Stübner wrote:
>> Hi Damon,
>>
>> Am Mittwoch, 9. Juli 2025, 09:01:34 Mitteleuropäische Sommerzeit 
>> schrieb Damon Ding:
>>> Since the panel/bridge should logically be positioned behind the
>>> Analogix bridge in the display pipeline, it makes sense to handle
>>> the panel/bridge parsing on the Analogix side.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> ---
>>>   .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
>>>   include/drm/bridge/analogix_dp.h              |  2 +
>>>   2 files changed, 50 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/ 
>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index 78d68310e4f6..660f95e90490 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> @@ -19,12 +19,14 @@
>>>   #include <linux/platform_device.h>
>>>   #include <drm/bridge/analogix_dp.h>
>>> +#include <drm/display/drm_dp_aux_bus.h>
>>>   #include <drm/drm_atomic.h>
>>>   #include <drm/drm_atomic_helper.h>
>>>   #include <drm/drm_bridge.h>
>>>   #include <drm/drm_crtc.h>
>>>   #include <drm/drm_device.h>
>>>   #include <drm/drm_edid.h>
>>> +#include <drm/drm_of.h>
>>>   #include <drm/drm_panel.h>
>>>   #include <drm/drm_print.h>
>>>   #include <drm/drm_probe_helper.h>
>>> @@ -1707,6 +1709,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct 
>>> analogix_dp_device *dp)
>>>   }
>>>   EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>>> +static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
>>> +{
>>> +    struct analogix_dp_device *dp = to_dp(aux);
>>> +    struct analogix_dp_plat_data *plat_data = dp->plat_data;
>>> +    int port = plat_data->dev_type == EXYNOS_DP ? 0 : 1;
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * If drm_of_find_panel_or_bridge() returns -ENODEV, there may 
>>> be no valid panel
>>> +     * or bridge nodes. The driver should go on for the driver-free 
>>> bridge or the DP
>>> +     * mode applications.
>>> +     */
>>> +    ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
>>> +                      &plat_data->panel, &plat_data->bridge);
>>
>> Could you check if this can use a panel-bridge?
>> See for example
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> tree/drivers/gpu/drm/rockchip/rockchip_rgb.c#n138
>> or a lot of other places for drm_panel_bridge_add()
>>
>> So if drm_of_find_panel_or_bridge() finds a bridge, just use it; if it
>> finds a panel, drm_panel_bridge_add() just wraps a bridge around it
>> and all the code can just assume everything is bridge after that.
>>
>>
> 
> Yes, that is a good approach. Using the panel-bridge will make the 
> related checks more concise.
> 
>>
>>> +    if (ret && ret != -ENODEV)
>>> +        return ret;
>>> +
>>> +    return component_add(dp->dev, plat_data->ops);
>>> +}
>>> +
>>> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = devm_of_dp_aux_populate_bus(&dp->aux, 
>>> analogix_dp_aux_done_probing);
>>> +    if (ret) {
>>> +        /*
>>> +         * If devm_of_dp_aux_populate_bus() returns -ENODEV, the 
>>> done_probing() will
>>> +         * not be called because there are no EP devices. Then the 
>>> callback function
>>> +         * analogix_dp_aux_done_probing() will be called directly in 
>>> order to support
>>> +         * the other valid DT configurations.
>>> +         *
>>> +         * NOTE: The devm_of_dp_aux_populate_bus() is allowed to 
>>> return -EPROBE_DEFER.
>>> +         */
>>> +        if (ret != -ENODEV) {
>>> +            dev_err(dp->dev, "failed to populate aux bus\n");
>>> +            return ret;
>>> +        }
>>> +
>>> +        return analogix_dp_aux_done_probing(&dp->aux);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(analogix_dp_find_panel_or_bridge);
>>> +
>>>   MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>>>   MODULE_DESCRIPTION("Analogix DP Core Driver");
>>>   MODULE_LICENSE("GPL v2");
>>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/ 
>>> analogix_dp.h
>>> index 202e5eafb2cc..0b6d85f1924e 100644
>>> --- a/include/drm/bridge/analogix_dp.h
>>> +++ b/include/drm/bridge/analogix_dp.h
>>> @@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
>>>       struct drm_bridge *bridge;
>>>       struct drm_encoder *encoder;
>>>       struct drm_connector *connector;
>>> +    const struct component_ops *ops;
>>>       int (*power_on)(struct analogix_dp_plat_data *);
>>>       int (*power_off)(struct analogix_dp_plat_data *);
>>> @@ -52,5 +53,6 @@ int analogix_dp_stop_crc(struct drm_connector 
>>> *connector);
>>>   struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct 
>>> drm_dp_aux *aux);
>>>   struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
>>> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp);
>>>   #endif /* _ANALOGIX_DP_H_ */
>>>
>>
> 

While preparing the v3 patch series, I encountered a question regarding 
the mode retrieval process. The relevant code in 
drivers/gpu/drm/display/drm_bridge_connector.c is as follows:

static int drm_bridge_connector_get_modes(struct drm_connector *connector)
{
......
	/*
	 * If display exposes EDID, then we parse that in the normal way to
	 * build table of supported modes.
	 */
	bridge = bridge_connector->bridge_edid;
	if (bridge)
		return drm_bridge_connector_get_modes_edid(connector, bridge);

	/*
	 * Otherwise if the display pipeline reports modes (e.g. with a fixed
	 * resolution panel or an analog TV output), query it.
	 */
	bridge = bridge_connector->bridge_modes;
	if (bridge)
		return bridge->funcs->get_modes(bridge, connector);
......
}

The &drm_bridge_funcs.get_modes() will never be called if the 
bridge_connector supports DRM_BRIDGE_OP_EDID. This suggests that 
DRM_BRIDGE_OP_EDID and DRM_BRIDGE_OP_MODES might be mutually exclusive.
And the following comments also ​confirm it(include/drm/drm_bridge.h):

......
	/**
	 * @get_modes:
	 *
	 * Fill all modes currently valid for the sink into the &drm_connector
	 * with drm_mode_probed_add().
	 *
	 * The @get_modes callback is mostly intended to support non-probeable
	 * displays such as many fixed panels. Bridges that support reading
	 * EDID shall leave @get_modes unimplemented and implement the
	 * &drm_bridge_funcs->edid_read callback instead.
	 *
......

I want to use drm_panel_get_modes()/drm_bridge_get_modes() as a fallback 
when drm_bridge_connector_get_modes_edid() returns no modes, compatible 
with the historical behavior. Should I apply the related code with 
&drm_bridge_funcs.edid_read() then abandon the 
&drm_bridge_funcs.get_modes()? or the opposite?

Or maybe the DRM_BRIDGE_OP_MODES can be a certain fallback of 
DRM_BRIDGE_OP_EDID for the bridge_connector?

Best regards,
Damon

