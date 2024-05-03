Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C688BAF93
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 17:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90687112639;
	Fri,  3 May 2024 15:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="urYQiP8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B9F112639
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 15:14:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 443FE0dr022273;
 Fri, 3 May 2024 10:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1714749240;
 bh=pXJAKxRZZcWDNZTuHwoEtDOpGE1n/3X/l3Ho5YAz60c=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=urYQiP8MW4+DeGpiAb5f4GOkgiZsACi/Kra7P9hw5m0RlfyWvviSeRcj0P2HcxMkt
 vExVCziEqceoJUAUV5VPyu18QAdR4wj+C64nIhvr8mLtjkKsmHPzGF6DY3ZryCKkdK
 LHZ3SQo7mNDOv/Hs9hp3wC+GP6jK/rAzPir8zdNw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 443FE0DP046693
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2024 10:14:00 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 May 2024 10:14:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 May 2024 10:13:59 -0500
Received: from [10.249.129.115] ([10.249.129.115])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 443FDsHo111504;
 Fri, 3 May 2024 10:13:55 -0500
Message-ID: <758be932-d791-48e5-ae36-de7542c7a2a3@ti.com>
Date: Fri, 3 May 2024 20:43:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: sii902x: Fix mode_valid hook
To: Maxime Ripard <mripard@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240408081435.216927-1-j-choudhary@ti.com>
 <20240415-venomous-enthusiastic-wildebeest-a7a446@houat>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20240415-venomous-enthusiastic-wildebeest-a7a446@houat>
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

Hello Maxime,

Thanks for the review.

On 15/04/24 13:10, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Apr 08, 2024 at 01:44:35PM +0530, Jayesh Choudhary wrote:
>> Currently, mode_valid hook returns all mode as valid. Add the check
>> for the maximum and minimum pixel clock that the bridge can support
>> while validating a mode.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/sii902x.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>> index 8f84e98249c7..658819199c84 100644
>> --- a/drivers/gpu/drm/bridge/sii902x.c
>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>> @@ -163,6 +163,16 @@
>>   
>>   #define SII902X_AUDIO_PORT_INDEX		3
>>   
>> +/*
>> + * The maximum resolution supported by the HDMI bridge is 1080p@60Hz
>> + * and 1920x1200 requiring a pixel clock of 165MHz and the minimum
>> + * resolution supported is 480p@60Hz requiring a pixel clock of 25MHz
>> + *
>> + * (drm_display_mode clock is in kHz)
>> + */
>> +#define SII902X_MIN_PIXEL_CLOCK			25000
>> +#define SII902X_MAX_PIXEL_CLOCK			165000
>> +
> 
> You should probably add a KHZ suffix or something to make it obvious.
> The natural unit for a frequency is Hertz.

Okay.
Instead of adding the kHz in comments, I will add that in suffix
like SII902X_MIN_PIXEL_CLOCK_KHZ.

> 
>>   struct sii902x {
>>   	struct i2c_client *i2c;
>>   	struct regmap *regmap;
>> @@ -313,7 +323,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
>>   static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>>   					       struct drm_display_mode *mode)
>>   {
>> -	/* TODO: check mode */
>> +	if (mode->clock < SII902X_MIN_PIXEL_CLOCK)
>> +		return MODE_CLOCK_LOW;
>> +
>> +	if (mode->clock > SII902X_MAX_PIXEL_CLOCK)
>> +		return MODE_CLOCK_HIGH;
>>   
>>   	return MODE_OK;
>>   }
> 
> It's something you should do in atomic_check too
> 

Like using clock from adjusted mode in crtc_state?
Will update in the next revision.

Warm Regards,
-Jayesh
