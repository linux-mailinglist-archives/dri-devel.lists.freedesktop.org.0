Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8AA78CB3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9E110E746;
	Wed,  2 Apr 2025 10:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVzw5VgR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53D10E745;
 Wed,  2 Apr 2025 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743591392; x=1775127392;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+nYDdEpiOizEmSi2i1YIIj0TnEehSgjHXLxq5bXG0fY=;
 b=TVzw5VgR4WtfWBJUN2QejZqkFgzRpCZYLzbMcTYZr/P8wkSw+iSoNyOL
 SG32FYjv5j7r5XULtF/AV+HrUmT+EZqbbnmiTHQILV5XRcx+aETjB/8Da
 N309EsEl5L3wNphYh8QiwT2/WCGu5rldMTMDTjqi1G7lv5mTs0msVbG5r
 9NttUOBndHw0PdUvkXwLlF0mBf3XsjLRTDa6cJeJztmSAYiGVNLy6tIDH
 IyuKcu00neE9CkPT2AgBrRRJDSKxKAhYeDq55JyZwm0UeIID+7izVVSwu
 SOV5P4Vfu7xPcUCLSzTxfCD9BWD9u7B54ydmF3E8jOCr03YlPfI3CnTEo w==;
X-CSE-ConnectionGUID: 4HZeiOLlTACn7jBu1XzNJQ==
X-CSE-MsgGUID: XUpRQzWqQsmfHQo7zi6/KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56317339"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="56317339"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:56:32 -0700
X-CSE-ConnectionGUID: 7yIUpfdIQLCT6Az3DYsaJw==
X-CSE-MsgGUID: NQ1xsJnQQGKEupyFeYtYCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="131858137"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.252])
 ([10.245.245.252])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:56:29 -0700
Message-ID: <0488e011-a27a-4f5f-9d4f-52562212ff31@intel.com>
Date: Wed, 2 Apr 2025 11:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/format-helper: fix build
To: Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jocelyn Falempe <jfalempe@redhat.com>
References: <20250402104430.142398-2-matthew.auld@intel.com>
 <4361e048-d2c6-4592-98fe-7b933c09e774@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <4361e048-d2c6-4592-98fe-7b933c09e774@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

On 02/04/2025 11:53, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.04.25 um 12:44 schrieb Matthew Auld:
>> Build fails with:
>>
>> error: multiple unsequenced modifications to 'sbuf32'
>> [-Werror,-Wunsequenced]
>>    264 |                         le32_to_cpup(sbuf32++),
>>        |                                            ^
>>    265 |                         le32_to_cpup(sbuf32++),
>>        |                                            ~~
>>
>> With that move the increment of the sbuf32 pointer to the end of the
>> loop, instead of inside the array list initializer, where the
>> order/sequence of the sbuf32 pointer modifications is not defined.
>>
>> Fixes: 58523a25cbf7 ("drm/format-helper: Optimize 32-to-24-bpp 
>> conversion")
>> Fixes: 3f31a017ddbc ("drm/format-helper: Optimize 32-to-16-bpp 
>> conversion")
>> Fixes: 65931bbc5177 ("drm/format-helper: Optimize 32-to-8-bpp 
>> conversion")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks for the fix. I build with W=1 but never saw this error. Do you 
> use other build flags?

Just building with clang. No other special build flags.

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/drm_format_helper.c | 32 ++++++++++++++++-------------
>>   1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/ 
>> drm_format_helper.c
>> index fc7347caf600..d36e6cacc575 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -261,10 +261,10 @@ static __always_inline void 
>> drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
>>       /* write 4 pixels at once */
>>       while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
>>           u32 pix[4] = {
>> -            le32_to_cpup(sbuf32++),
>> -            le32_to_cpup(sbuf32++),
>> -            le32_to_cpup(sbuf32++),
>> -            le32_to_cpup(sbuf32++),
>> +            le32_to_cpup(sbuf32),
>> +            le32_to_cpup(sbuf32 + 1),
>> +            le32_to_cpup(sbuf32 + 2),
>> +            le32_to_cpup(sbuf32 + 3),
>>           };
>>           /* write output bytes in reverse order for little endianness */
>>           u32 val32 = xfrm_pixel(pix[0]) |
>> @@ -272,6 +272,7 @@ static __always_inline void 
>> drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
>>                  (xfrm_pixel(pix[2]) << 16) |
>>                  (xfrm_pixel(pix[3]) << 24);
>>           *dbuf32++ = cpu_to_le32(val32);
>> +        sbuf32 += ARRAY_SIZE(pix);
>>       }
>>       /* write trailing pixels */
>> @@ -294,10 +295,10 @@ static __always_inline void 
>> drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>>       /* write 4 pixels at once */
>>       while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
>>           u32 pix[4] = {
>> -            le32_to_cpup(sbuf32++),
>> -            le32_to_cpup(sbuf32++),
>> -            le32_to_cpup(sbuf32++),
>> -            le32_to_cpup(sbuf32++),
>> +            le32_to_cpup(sbuf32),
>> +            le32_to_cpup(sbuf32 + 1),
>> +            le32_to_cpup(sbuf32 + 2),
>> +            le32_to_cpup(sbuf32 + 3),
>>           };
>>           /* write output bytes in reverse order for little endianness */
>>           u64 val64 = ((u64)xfrm_pixel(pix[0])) |
>> @@ -305,6 +306,7 @@ static __always_inline void 
>> drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>>                   ((u64)xfrm_pixel(pix[2]) << 32) |
>>                   ((u64)xfrm_pixel(pix[3]) << 48);
>>           *dbuf64++ = cpu_to_le64(val64);
>> +        sbuf32 += ARRAY_SIZE(pix);
>>       }
>>   #endif
>> @@ -312,13 +314,14 @@ static __always_inline void 
>> drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>>       dbuf32 = (__le32 __force *)dbuf64;
>>       while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 2)) {
>>           u32 pix[2] = {
>> -            le32_to_cpup(sbuf32++),
>> -            le32_to_cpup(sbuf32++),
>> +            le32_to_cpup(sbuf32),
>> +            le32_to_cpup(sbuf32 + 1),
>>           };
>>           /* write output bytes in reverse order for little endianness */
>>           u32 val32 = xfrm_pixel(pix[0]) |
>>                  (xfrm_pixel(pix[1]) << 16);
>>           *dbuf32++ = cpu_to_le32(val32);
>> +        sbuf32 += ARRAY_SIZE(pix);
>>       }
>>       /* write trailing pixel */
>> @@ -339,10 +342,10 @@ static __always_inline void 
>> drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
>>       /* write pixels in chunks of 4 */
>>       while (sbuf32 < ALIGN_DOWN_PIXELS(send32, pixels, 4)) {
>>           u32 val24[4] = {
>> -            xfrm_pixel(le32_to_cpup(sbuf32++)),
>> -            xfrm_pixel(le32_to_cpup(sbuf32++)),
>> -            xfrm_pixel(le32_to_cpup(sbuf32++)),
>> -            xfrm_pixel(le32_to_cpup(sbuf32++)),
>> +            xfrm_pixel(le32_to_cpup(sbuf32)),
>> +            xfrm_pixel(le32_to_cpup(sbuf32 + 1)),
>> +            xfrm_pixel(le32_to_cpup(sbuf32 + 2)),
>> +            xfrm_pixel(le32_to_cpup(sbuf32 + 3)),
>>           };
>>           u32 out32[3] = {
>>               /* write output bytes in reverse order for little 
>> endianness */
>> @@ -363,6 +366,7 @@ static __always_inline void 
>> drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
>>           *dbuf32++ = cpu_to_le32(out32[0]);
>>           *dbuf32++ = cpu_to_le32(out32[1]);
>>           *dbuf32++ = cpu_to_le32(out32[2]);
>> +        sbuf32 += ARRAY_SIZE(val24);
>>       }
>>       /* write trailing pixel */
> 

