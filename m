Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECD1D906B
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 08:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B7289F75;
	Tue, 19 May 2020 06:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31589F75
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 06:57:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04J6vWZ6010519;
 Tue, 19 May 2020 01:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589871452;
 bh=U7R0nSkWZT5W/jQ0lhngomvGQ4/so2xJj/dLo7ViIA4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pcXqjwAtYu9chghERsoVkG42w224Zu6uZSiqd0j5omzsAKCLBfPY60UeDlliForoH
 ByfYdx+rFnXnqLCLQ6MjKcAgM0EaaQvqG2QfoueVaC9GHd82LIV4jglOmSAPx9P+wo
 /VIKx1Q19UVxZa0TbprjLmIF5++JGWHcr5x1Lwno=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04J6vWYD091499
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 May 2020 01:57:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 01:57:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 01:57:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04J6vU21002720;
 Tue, 19 May 2020 01:57:30 -0500
Subject: Re: [PATCH 1/3] drm/tilcdc: fix leak & null ref in
 panel_connector_get_modes
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200429104234.18910-1-tomi.valkeinen@ti.com>
 <20200506190229.GC8227@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ab4a29d8-70ea-1f8a-37e6-6ec77de8732f@ti.com>
Date: Tue, 19 May 2020 09:57:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506190229.GC8227@ravnborg.org>
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2020 22:02, Sam Ravnborg wrote:
> On Wed, Apr 29, 2020 at 01:42:32PM +0300, Tomi Valkeinen wrote:
>> If videomode_from_timings() returns true, the mode allocated with
>> drm_mode_create will be leaked.
>>
>> Also, the return value of drm_mode_create() is never checked, and thus
>> could cause NULL deref.
>>
>> Fix these two issues.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> One nit
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>> ---
>>   drivers/gpu/drm/tilcdc/tilcdc_panel.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
>> index 5584e656b857..f66e2f2a1a35 100644
>> --- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
>> @@ -143,12 +143,16 @@ static int panel_connector_get_modes(struct drm_connector *connector)
>>   	int i;
>>   
>>   	for (i = 0; i < timings->num_timings; i++) {
>> -		struct drm_display_mode *mode = drm_mode_create(dev);
>> +		struct drm_display_mode *mode;
>>   		struct videomode vm;
>>   
>>   		if (videomode_from_timings(timings, &vm, i))
>>   			break;
>>   
>> +		mode =  drm_mode_create(dev);
> extra space            ^

Thanks! Fixed this.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
