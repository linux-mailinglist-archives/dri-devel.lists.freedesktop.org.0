Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F61ADE67
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 15:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E258D6EBE1;
	Fri, 17 Apr 2020 13:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341C66EBE1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:34:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HDYLAT067757;
 Fri, 17 Apr 2020 08:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587130461;
 bh=lA+3dG7v4SiPn88JPBchtLZe9SeEqhh7V/SesrPFFn0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=gmME/DnTpv9TAShti/0QaBNHyxh0hb9k+wU6RPyqv/MNefw4Qbtrl2mPkJZ9VpGXT
 rONH7ZkH0jk2CNg02cIrlBgiXvdsZW9FGXMzmX4vhz5f5G1L20AHCnZ5bTggA/21+0
 6SkHMkub+E3y3zxbUASfkVni4xZu/nltIk557zK4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03HDYLA1118543
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Apr 2020 08:34:21 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 08:34:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 08:34:21 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HDYJqw094100;
 Fri, 17 Apr 2020 08:34:20 -0500
Subject: Re: [PATCH] drm/omap: change default signal polarities and drives
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200417114151.25843-1-tomi.valkeinen@ti.com>
 <20200417132902.GA11473@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ab55ce8c-f737-e91f-4cd2-4769520b7f50@ti.com>
Date: Fri, 17 Apr 2020 16:34:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417132902.GA11473@pendragon.ideasonboard.com>
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

On 17/04/2020 16:29, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Apr 17, 2020 at 02:41:51PM +0300, Tomi Valkeinen wrote:
>> If the given videomode does not specify DISPLAY_FLAG_* for the specific
>> signal property, the driver used a default value. These defaults were
>> never thought through, as the expectation was that all the DISPLAY_FLAGS
>> are always set explicitly.
>>
>> With DRM bridge and panel drivers this is not the case, and while that
>> issue should be resolved in the future, it's still good to have sane
>> signal defaults.
>>
>> This patch changes the defaults to what the hardware has as reset
>> defaults. Also, based on my experience, I think they make sense and are
>> more likely correct than the defaults without this patch.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/gpu/drm/omapdrm/dss/dispc.c | 33 ++++++-----------------------
>>   1 file changed, 6 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> index dbb90f2d2ccd..6639ee9b05d3 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> @@ -3137,33 +3137,12 @@ static void _dispc_mgr_set_lcd_timings(struct dispc_device *dispc,
>>   	dispc_write_reg(dispc, DISPC_TIMING_H(channel), timing_h);
>>   	dispc_write_reg(dispc, DISPC_TIMING_V(channel), timing_v);
>>   
>> -	if (vm->flags & DISPLAY_FLAGS_VSYNC_HIGH)
>> -		vs = false;
>> -	else
>> -		vs = true;
>> -
>> -	if (vm->flags & DISPLAY_FLAGS_HSYNC_HIGH)
>> -		hs = false;
>> -	else
>> -		hs = true;
>> -
>> -	if (vm->flags & DISPLAY_FLAGS_DE_HIGH)
>> -		de = false;
>> -	else
>> -		de = true;
>> -
>> -	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
>> -		ipc = false;
>> -	else
>> -		ipc = true;
>> -
>> -	/* always use the 'rf' setting */
>> -	onoff = true;
>> -
>> -	if (vm->flags & DISPLAY_FLAGS_SYNC_POSEDGE)
>> -		rf = true;
>> -	else
>> -		rf = false;
>> +	vs = !!(vm->flags & DISPLAY_FLAGS_VSYNC_LOW);
>> +	hs = !!(vm->flags & DISPLAY_FLAGS_HSYNC_LOW);
>> +	de = !!(vm->flags & DISPLAY_FLAGS_DE_LOW);
>> +	ipc = !!(vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE);
>> +	onoff = true; /* always use the 'rf' setting */
>> +	rf = !!(vm->flags & DISPLAY_FLAGS_SYNC_POSEDGE);
> 
> Would it make sense to WARN() if flags are not set, to catch offenders
> and fix them ? Apart from that,

Maybe at some point, but for now it would probably be printing WARNs on all boards. I haven't looked 
at exactly which driver combinations get the bus flags/formats right, but I have a feeling that it's 
not too many.

And some pieces of hardware also may be "don't care" for certain flags, so I think it's a valid case 
that a bridge/panel doesn't define some of the flags.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
