Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0F1C3741
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 12:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0BC6E375;
	Mon,  4 May 2020 10:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78346E358
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 10:54:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044As4Yx072831
 for <dri-devel@lists.freedesktop.org>; Mon, 4 May 2020 05:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588589644;
 bh=T1Zzj10dWjVY542y863VEzMEjE8Bval7ZI3gFf4QyHQ=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=CRHbChl0dmLmHLmc9lImVxuxf8wgQxtmHuDjycuG/oG+Z+sbDF6uIXJT21DfT2iX7
 5rN3X3uPBZgo+ASk5LDb2JyFWqSyZVtiSo0DCCXPY+qBR3XU4kFTR8V6iCbUPys9fD
 d/ejYMkG+9FEUGShi360hDeVQdQdB03/LupUzfSM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044As45W126350
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Mon, 4 May 2020 05:54:04 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 05:54:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 05:54:03 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044As22b108991;
 Mon, 4 May 2020 05:54:03 -0500
Subject: Re: [PATCH] drm/tidss: remove AM65x PG1 YUV erratum code
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20200429121022.3871-1-tomi.valkeinen@ti.com>
 <9d10511b-d520-c05c-6b09-d7709ad5b89a@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <af19366c-fdcc-440b-31d7-bc310f939610@ti.com>
Date: Mon, 4 May 2020 13:54:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9d10511b-d520-c05c-6b09-d7709ad5b89a@ti.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2020 13:51, Jyri Sarha wrote:
> On 29/04/2020 15:10, Tomi Valkeinen wrote:
>> AM65x PG1 has a HW issue with YUV pixel formats, resulting in wrong
>> colors on the screen. This issue is fixed in PG2 hardware.
>>
>> The driver currently has code to hide YUV pixel formats from the
>> userspace. To support PG2, we would need to add code to detect the SoC
>> version and hide the YUV formats based on that.
>>
>> However, as PG1 will be phased out and PG2 will be the main platform, a
>> much simpler solution is just to drop the code in question. The downside
>> is that the users will be able to use YUV formats on PG1, getting wrong
>> colors on the screen. On the other hand, that may also be a plus, as the
>> same applications will now work on PG1 and PG2, even if the colors are
>> wrong on PG1.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> One minor nitpick bellow, but otherwise:
> 
> Reviewed-by: Jyri Sarha <jsarha@ti.com>
> 
>> ---
>>   drivers/gpu/drm/tidss/tidss_dispc.c | 11 ++---------
>>   drivers/gpu/drm/tidss/tidss_dispc.h |  5 -----
>>   2 files changed, 2 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index 29f42768e294..629dd06393f6 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -181,10 +181,6 @@ const struct dispc_features dispc_am65x_feats = {
>>   	.vid_name = { "vid", "vidl1" },
>>   	.vid_lite = { false, true, },
>>   	.vid_order = { 1, 0 },
>> -
>> -	.errata = {
>> -		.i2000 = true,
>> -	},
>>   };
>>   
>>   static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
>> @@ -2674,12 +2670,9 @@ int dispc_init(struct tidss_device *tidss)
>>   		return -ENOMEM;
>>   
>>   	num_fourccs = 0;
>> -	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i) {
>> -		if (feat->errata.i2000 &&
>> -		    dispc_fourcc_is_yuv(dispc_color_formats[i].fourcc))
>> -			continue;
>> +	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i)
>>   		dispc->fourccs[num_fourccs++] = dispc_color_formats[i].fourcc;
>> -	}
>> +
>>   	dispc->num_fourccs = num_fourccs;
>>   	dispc->tidss = tidss;
>>   	dispc->dev = dev;
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
>> index a4a68249e44b..1228b166b255 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>> @@ -46,10 +46,6 @@ struct dispc_features_scaling {
>>   	u32 xinc_max;
>>   };
>>   
>> -struct dispc_errata {
>> -	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
>> -};
>> -
>>   enum dispc_vp_bus_type {
>>   	DISPC_VP_DPI,		/* DPI output */
>>   	DISPC_VP_OLDI,		/* OLDI (LVDS) output */
>> @@ -84,7 +80,6 @@ struct dispc_features {
>>   	bool vid_lite[TIDSS_MAX_PLANES];
>>   	u32 vid_order[TIDSS_MAX_PLANES];
>>   
> 
> Shouldn't we remove the above empty line too?

Indeed, I'll do the change. Thanks!

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
