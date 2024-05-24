Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7238CE38C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B0310E1B6;
	Fri, 24 May 2024 09:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="I+g0mjhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 729 seconds by postgrey-1.36 at gabe;
 Fri, 24 May 2024 09:33:32 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F1910E1B6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:33:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44O9L9Ga035918;
 Fri, 24 May 2024 04:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716542469;
 bh=9VqLXE+M4Ctnqzc9Y53bENjNOA1O/XSeTL4zdOP7UAI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=I+g0mjhlTv4elitGkb1VXIeuQ3/kJDCrThpt7PZl4luKQ5qDv7Qdy407GdUCwvman
 ZFPnsKgbZLRwTqD5/hJPQQsNmyjbrp+FHCVzItkJbfDXFcTvFBx71K8qja8c1SiIG8
 EANAxb7A45wy5b61UGPstSKK6FAda13ojjRzVCdA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44O9L9EP045284
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 May 2024 04:21:09 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 04:21:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 04:21:09 -0500
Received: from [172.24.227.102]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.102] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44O9L46u039745;
 Fri, 24 May 2024 04:21:05 -0500
Message-ID: <442d1323-b6d3-4a50-aaea-ef32dfc08741@ti.com>
Date: Fri, 24 May 2024 14:51:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/bridge: sii902x: Fix mode_valid hook
To: Sam Ravnborg <sam@ravnborg.org>
CC: <linux-kernel@vger.kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <a-bhatia1@ti.com>
References: <20240524073305.107293-1-j-choudhary@ti.com>
 <20240524073305.107293-2-j-choudhary@ti.com>
 <20240524081824.GA615138@ravnborg.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20240524081824.GA615138@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hello Sam,

On 24/05/24 13:48, Sam Ravnborg wrote:
> Hi Jayesh,
> 
> On Fri, May 24, 2024 at 01:03:04PM +0530, Jayesh Choudhary wrote:
>> Currently, mode_valid hook returns all mode as valid and it is
>> defined only in drm_connector_helper_funcs. With the introduction of
>> 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
>> bridge_attach call for cases when the encoder has this flag enabled.
>> So add the mode_valid hook in drm_bridge_funcs as well with proper
>> clock checks for maximum and minimum pixel clock supported by the
>> bridge.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/sii902x.c | 38 ++++++++++++++++++++++++++++++--
>>   1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>> index 2fbeda9025bf..ef7c3ab3386c 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -163,6 +163,14 @@
>>   
>>   #define SII902X_AUDIO_PORT_INDEX		3
>>   
>> +/*
>> + * The maximum resolution supported by the HDMI bridge is 1080p@60Hz
>> + * and 1920x1200 requiring a pixel clock of 165MHz and the minimum
>> + * resolution supported is 480p@60Hz requiring a pixel clock of 25MHz
>> + */
>> +#define SII902X_MIN_PIXEL_CLOCK_KHZ		25000
>> +#define SII902X_MAX_PIXEL_CLOCK_KHZ		165000
>> +
>>   struct sii902x {
>>   	struct i2c_client *i2c;
>>   	struct regmap *regmap;
>> @@ -310,12 +318,26 @@ static int sii902x_get_modes(struct drm_connector *connector)
>>   	return num;
>>   }
>>   
>> +static enum
>> +drm_mode_status sii902x_validate(struct sii902x *sii902x,
>> +				 const struct drm_display_mode *mode)
>> +{
>> +	if (mode->clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
>> +		return MODE_CLOCK_LOW;
>> +
>> +	if (mode->clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	return MODE_OK;
>> +}
>> +
>>   static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>>   					       struct drm_display_mode *mode)
>>   {
>> -	/* TODO: check mode */
>> +	struct sii902x *sii902x = connector_to_sii902x(connector);
>> +	const struct drm_display_mode *mod = mode;
>>   
>> -	return MODE_OK;
>> +	return sii902x_validate(sii902x, mod);
>>   }
>>   
>>   static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
>> @@ -499,11 +521,22 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
>>   	 * There might be flags negotiation supported in future but
>>   	 * set the bus flags in atomic_check statically for now.
>>   	 */
>> +
>>   	bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
> 
> If you spin a v2 then drop the above change as you delete the line again
> in the next patch.
> 
> 	Sam

While splitting the patches, I must have messed up.
I will quickly send v3 with this fixed.

Thanks,
Jayesh
