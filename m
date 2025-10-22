Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61065BF9971
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 03:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED8310E672;
	Wed, 22 Oct 2025 01:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="G3IBa/UR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49236.qiye.163.com (mail-m49236.qiye.163.com
 [45.254.49.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B4610E672
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 01:15:58 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26b816b55;
 Wed, 22 Oct 2025 09:15:54 +0800 (GMT+08:00)
Message-ID: <ff65f453-68a9-41fc-b9e3-02733bba96e3@rock-chips.com>
Date: Wed, 22 Oct 2025 09:15:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021023130.1523707-2-damon.ding@rock-chips.com>
 <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
Content-Language: en-US
In-Reply-To: <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a097ca16b03a3kunm40777dd76b3afa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5NTVZIGRkYGB1CSENNHk5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=G3IBa/UR/LuPN+iUHG5BfBsR0wakY08fMpbIcc22chg3Yl2mDJuP3hApodwjF7Dp3I5RcHlsanrTg0887GoJUZgyuAx5TMRcyEawoDSmH9l/4xI5P1euGxlyg400GezPKB85JhtiTT1ZShmJwtVe+NOdaGsfV+2hDV4p/3K+h9E=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=zauBUVRHLTtxfE8FEqH72ce8GCghwo6SRo4GbUPwtY0=;
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

Hi Luca,

On 10/21/2025 6:31 PM, Luca Ceresoli wrote:
> Hello Damon,
> 
> On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
>> When multiple bridges are present, EDID detection capability
>> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
>> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
>> determined by the last bridge in the chain, we handle three cases:
>>
>> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>>   - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>>     &drm_bridge_connector.bridge_edid to NULL and set
>>     &drm_bridge_connector.bridge_modes to the later bridge.
>>   - Ensure modes detection capability of the later bridge will not
>>     be ignored.
>>
>> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>>   - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>>     &drm_bridge_connector.bridge_modes to NULL and set
>>     &drm_bridge_connector.bridge_edid to the later bridge.
>>   - Although EDID detection capability has higher priority, this
>>     operation is for balance and makes sense.
>>
>> Case 3: the later bridge declares both of them
>>   - Assign later bridge as &drm_bridge_connector.bridge_edid and
>>     and &drm_bridge_connector.bridge_modes to this bridge.
>>   - Just leave transfer of these two capabilities as before.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> ---
>>
>> Changes in v7:
>> - As Luca suggested, simplify the code and related comment.
>> ---
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index baacd21e7341..7c2936d59517 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -673,14 +673,22 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>>   		if (!bridge->ycbcr_420_allowed)
>>   			connector->ycbcr_420_allowed = false;
>>
>> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
>> -			bridge_connector->bridge_edid = bridge;
>> +		/*
>> +		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
>> +		 */
>> +		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
>> +			bridge_connector->bridge_edid = NULL;
>> +			bridge_connector->bridge_modes = NULL;
>> +			if (bridge->ops & DRM_BRIDGE_OP_EDID)
>> +				bridge_connector->bridge_edid = bridge;
>> +			if (bridge->ops & DRM_BRIDGE_OP_MODES)
>> +				bridge_connector->bridge_modes = bridge;
>> +		}
>>   		if (bridge->ops & DRM_BRIDGE_OP_HPD)
>>   			bridge_connector->bridge_hpd = bridge;
>>   		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>>   			bridge_connector->bridge_detect = bridge;
>> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>> -			bridge_connector->bridge_modes = bridge;
>> +
> 
> This does not apply on current drm-misc-next, due to the patch I mentioned
> in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
> bridge_connector: get/put the stored bridges").
> 
> However I'm sorry I have to mention that patch turned out being buggy, so
> I've sent a series to apply a corrected version [0]. I suggest watching the
> disucssion about the fix series, and if that gets approved rebase on top of
> that and adapt your changes.
> 
> Sorry about the mess. :(
> 
> [0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com
> 
> 

I saw your fix patches before sending this series. I think your patches 
will likely be merged relatively quickly, so I plan to wait until the 
other patches in my patch series are confirmed to be fine, then submit 
v8 version based on the latest bridge_connector driver. :-)

Best regards,
Damon

