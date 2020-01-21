Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DCC1439BC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4286EC1C;
	Tue, 21 Jan 2020 09:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DE66EC1C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:44:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L9iG36079851;
 Tue, 21 Jan 2020 03:44:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579599856;
 bh=pItoAbfEolhg+LEglLACW8jt7X3SSzdi0PRQ6gE8ed4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cnNoOG9zjh8IqdpuGDCC1qxFqhLzn2yXtiP5B7EicJ1evmLlG914GVdXhQ8T40vyh
 n83czwvdawq4yPip1nk5h/K+cpV7thV+JrqOPQg9La5cMW/aq4sTsfVKT/z1S+uVP6
 7TmcPV1K7Ipi4kTBB0VROpNAc5AUR4uYTgeD6aUk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00L9iGWO110632
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Jan 2020 03:44:16 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 03:44:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 03:44:16 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L9iFGY032758;
 Tue, 21 Jan 2020 03:44:15 -0600
Subject: Re: [PATCH] drm/bridge: tfp410: add pclk limits
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200113134528.9851-1-tomi.valkeinen@ti.com>
 <20200117125307.GE5711@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <4a74bb03-74d7-564d-3547-bd01b4eddc5d@ti.com>
Date: Tue, 21 Jan 2020 11:44:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200117125307.GE5711@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2020 14:53, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Jan 13, 2020 at 03:45:28PM +0200, Tomi Valkeinen wrote:
>> Add pixel clock limits to the driver as per TFP410 datasheet: min 25MHz,
>> max 165MHz.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/ti-tfp410.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
>> index 6f6d6d1e60ae..f378a8f79bcb 100644
>> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
>> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
>> @@ -167,10 +167,20 @@ static void tfp410_disable(struct drm_bridge *bridge)
>>   	gpiod_set_value_cansleep(dvi->powerdown, 1);
>>   }
>>   
>> +static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
>> +					      const struct drm_display_mode *mode)
>> +{
>> +	if (mode->clock < 25000 || mode->clock > 165000)
>> +		return MODE_BAD;
> 
> Shouldn't you return MODE_CLOCK_LOW AND MODE_CLOCK_HIGH respectively ?
> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Indeed. I'll send a v2. Thanks!

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
