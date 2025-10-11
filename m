Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B8BCEE93
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 04:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A4310E2BD;
	Sat, 11 Oct 2025 02:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="S2D9oCYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3287.qiye.163.com (mail-m3287.qiye.163.com
 [220.197.32.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC7810E2BD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 02:48:06 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2583d42b4;
 Sat, 11 Oct 2025 10:47:59 +0800 (GMT+08:00)
Message-ID: <7d13fd2a-090e-4a58-b862-050f9ee4ff43@rock-chips.com>
Date: Sat, 11 Oct 2025 10:47:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251009193028.4952-1-heiko@sntech.de>
 <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
 <3572997.QJadu78ljV@diego>
 <b47c5579-511e-4831-b86e-48ad4cefaa6c@rock-chips.com>
 <wzeleliof47ogogxqrlwswfbnvummoydtegpgwf463k5ve3uue@tpemjilgagpl>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <wzeleliof47ogogxqrlwswfbnvummoydtegpgwf463k5ve3uue@tpemjilgagpl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99d12afe2403a3kunme96870ed1c85ea
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhIS1ZNHkhLSkJCGENMTktWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=S2D9oCYGGbu2NFv47nBijW+b2It8nOu6OPjaH0bEfyhlxOv+fJGk/cQhEwTpaHzqJyTcEV1rWfwCi0Sfw5mc0qO/An7Y9c7nxNr0uYxbYU9S/HymPkvmjU+kMYcpDK4CqElV0eE5rEwlrO8whFuUmzZUPiyuJ1+h0mJDd/3h5DM=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=5+ihUYu0S1qJ7LbunOf2GjCHQGLK8SqoKsSPOioSnbk=;
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

On 10/10/2025 8:43 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 10, 2025 at 12:02:43PM +0800, Damon Ding wrote:
>> Hi,
>>
>> On 10/10/2025 7:42 AM, Heiko Stübner wrote:
>>> Hi Dmitry,
>>>
>>> Am Freitag, 10. Oktober 2025, 00:30:11 Mitteleuropäische Sommerzeit schrieb Dmitry Baryshkov:
>>>> On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
>>>>> Right now if there is a next bridge attached to the analogix-dp controller
>>>>> the driver always assumes this bridge is connected to something, but this
>>>>> is of course not always true, as that bridge could also be a hotpluggable
>>>>> dp port for example.
>>>>>
>>>>> On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
>>>>> connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
>>>>> for DisplayPort targets is more complicated than just reading the HPD pin
>>>>> level" and we should be "letting the actual DP driver perform detection."
>>>>>
>>>>> So use drm_bridge_detect() to detect the next bridge's state but ignore
>>>>> that bridge if the analogix-dp is handling the hpd-gpio.
>>>>>
>>>>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>>>> ---
>>>>> As this patch stands, it would go on top of v6 of Damon's bridge-connector
>>>>> work, but could very well be also integrated into one of the changes there.
>>>>>
>>>>> I don't know yet if my ordering and/or reasoning is the correct one or if
>>>>> a better handling could be done, but with that change I do get a nice
>>>>> hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
>>>>> Analogix-DP ends in a full size DP port.
>>>>>
>>>>>    drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
>>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>>> index c04b5829712b..cdc56e83b576 100644
>>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>>> @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
>>>>>    	struct analogix_dp_device *dp = to_dp(bridge);
>>>>>    	enum drm_connector_status status = connector_status_disconnected;
>>>>> -	if (dp->plat_data->next_bridge)
>>>>> -		return connector_status_connected;
>>>>> +	/*
>>>>> +	 * An optional next bridge should be in charge of detection the
>>>>> +	 * connection status, except if we manage a actual hpd gpio.
>>>>> +	 */
>>>>> +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
>>>>> +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);
>>
>> I have tried to use the drm_bridge_detect() API to do this as simple-bridge
>> driver, but it does not work well for bridges that do not declare OP_DETECT.
>>
>> Take nxp-ptn3460 as an example, the connected status will be treated as
>> connector_status_unknown via the following call stack:
>>
>> drm_helper_probe_single_connector_modes()
>>    -> drm_helper_probe_detect()
>>       -> drm_bridge_connector_detect()
>>          -> analogix_dp_bridge_detect()
>>             -> drm_bridge_detect()
>>                -> return connector_status_unknown due to !OP_DETECT
>>
>> However, the connected status will be connector_status_connected as expected
>> if Analogix DP does not declare OP_DETECT[0]:
>>
>> drm_helper_probe_single_connector_modes()
>>    -> drm_helper_probe_detect()
>>       -> drm_bridge_connector_detect()
>>          -> return connector_status_connected due to CONNECTOR_LVDS
>>
>> Base on Andy's commit 5d156a9c3d5e ("drm/bridge: Pass down connector to drm
>> bridge detect hook"), the drm_connector becomes available in
>> drm_bridge_detect().
>>
>> It may be better to unify the logic of drm_bridge_detect() and
>> drm_bridge_connector_detect(), which sets the connected status according to
>> the connector_type. Then the codes will be more reasonable and become
>> similar to the simple-bridge demo via
>> 'drm_bridge_detect(dp->plat_data->next_bridge, connector)'.
> 
> I'm not sure, what you are trying to achieve here. The
> drm_bridge_connector should handle the OP_DETECT and use the last bridge
> in the chain that supports detection.
> 
> Note: OP_HPD and OP_DETECT are not that tightly connected, especially
> for DP bridges. It is fine to have a later bridge which generates HPD
> events, while Analogix DP bridge responds to .hpd_notify() events and
> performs its duties.
> 
> For example, it's perfectly fine to have dp-connector with the HPD GPIO
> pin routed to the connector (in which case it will declare OP_HPD). But
> the Analogix bridge should perform actual detection. Normally this is
> handled by reading DPCD and ensuring that there is an actual connected
> device (i.e. either a non-branch device or a branch with at least 1
> sink).
> 

I see. Your kind explanation helped me understand OP_HPD and OP_DETECT 
better.

Back to Heiko's issue, the v3, in which dp-connector declares OP_HPD, 
should be better (refers to arm64/qcom/qcs6490-rb3gen2 and 
arm64/qcom/sa8295p-adp). And the .hpd_notify() of Analogix DP bridge 
will be supported in the future if something needs to be handle with the 
HPD status changes (refers to driver drivers/gpu/drm/msm/dp/dp_display.c).

Additionally, I will keep analogix_dp_bridge_detect() the same as before.

>>
>> But we still need a specific check for DP-connector to resolve this issue.
>> The '!dp->hpd_gpiod' may not be well-considered. Perhaps we could introduce
>> a new API, similar to drm_bridge_is_panel(), called
>> drm_bridge_is_display_connector()?
>>
>>>>
>>>> And it's also not correct because the next bridge might be a retimer
>>>> with the bridge next to it being a one with the actual detection
>>>> capabilities. drm_bridge_connector solves that in a much better way. See
>>>> the series at [1]
>>>>
>>>> [1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/
>>>
>>> Hence my comment above about that possibly not being the right variant.
>>> Sort of asking for direction :-) .
>>>
>>> I am working on top of Damon's drm-bridge-connector series as noted above,
>>> but it looks like the detect function still is called at does then stuff.
>>>
>>> My board is the rk3588-tiger-displayport-carrier [0], with a dp-connector
>>> which is the next bridge, so _without_ any changes, the analogix-dp
>>> always assumes "something" is connected and I end up with
>>>
>>> [    9.869198] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
>>> [    9.980422] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
>>> [   10.091522] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
>>> [   10.202419] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
>>> [   10.313651] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
>>>
>>> when no display is connected.
>>>
>>> With this change I do get the expected hotplug behaviour, so something is
>>> missing still even with the bridge-connector series.
>>>
>>>
>>> Heiko
>>>
>>>
>>> [0] v3: https://lore.kernel.org/r/20250812083217.1064185-3-heiko@sntech.de
>>>       v4: https://lore.kernel.org/r/20251009225050.88192-3-heiko@sntech.de
>>>       (moved hpd-gpios from dp-connector back to analogix-dp per dp-connector
>>>       being not able to detect dp-monitors)
>>>>
>>>>>    	if (!analogix_dp_detect_hpd(dp))
>>>>>    		status = connector_status_connected;
>>>>
>>>>
>>>
>>>
>>
>> I see... There is also a way to leave the connected status check in Analogix
>> DP bridge:
>>
>> 1.If the later bridge does not support HPD function, the 'force-hpd'
>> property must be set under the DP DT node. The DT modifications may be
>> large by this way.
> 
> Well... The drivers should continue to work with old DTs, if they did so
> before.
> 
>> 2.If the later bridge do support HPD function like the DP-connector, the
>> connected status detection method is GPIO HPD or functional pin HPD.
> 
> dp-connector should set OP_HPD
> analogix-dp should set OP_DETECT
> 

Got it.

>>
>> With the DT modifications for above 1, the analogix_dp_bridge_detect() can
>> be simplified to:
>>
>> static enum drm_connector_status
>> analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector
>> *connector)
>> {
>> 	struct analogix_dp_device *dp = to_dp(bridge);
>> 	enum drm_connector_status status = connector_status_disconnected;
>>
>> 	if (!analogix_dp_detect_hpd(dp))
>> 		status = connector_status_connected;
>>
>> 	return status;
>> }
>>
>> Best regards,
>> Damon
>>
>> [0]https://lore.kernel.org/all/22a5119c-01da-4a7a-bafb-f657b1552a56@rock-chips.com/
>>
> 

Best regards,
Damon

