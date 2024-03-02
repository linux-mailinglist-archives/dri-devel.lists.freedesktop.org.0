Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B1086F0A8
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 15:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982D310E06C;
	Sat,  2 Mar 2024 14:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="PQTq4rXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAB610E06C
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 14:14:43 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tn6R65KmSzDqLl;
 Sat,  2 Mar 2024 14:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709388883; bh=5B887/YzHTP+xGbj5UZLvqN6oKQPELOG/LwxVfcghlM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PQTq4rXUQYJimfxdmG1ubZ+6eereGvDuMi0koUUOhoZCIZvTDkoULbm1i7Gkpez9C
 GPdStJeDDFykJ5EmMRN3emEMTcz+lUb/cDt+jvvig+1yIblE22EbHd1zGLpdk54qzy
 ZXZpAHJUSUHrrkT8IMGdUA62S9f3jQxVchveyaAQ=
X-Riseup-User-ID: B70142BE40204FCEECD727AA0B0A5BF7A1D779D9CD1D828502538BE16079DACE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tn6R123BdzJsbL;
 Sat,  2 Mar 2024 14:14:37 +0000 (UTC)
Message-ID: <551e74f7-3df9-42b8-8221-c51191dbc6b6@riseup.net>
Date: Sat, 2 Mar 2024 11:14:35 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
 <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
 <Zd35c_CJbhY46TjQ@localhost.localdomain>
 <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
 <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
 <20240229141238.51891cad.pekka.paalanen@collabora.com>
 <5a45e133-d554-4252-a223-dadced383443@riseup.net>
 <20240301135327.22efe0dd.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240301135327.22efe0dd.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
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



On 01/03/24 08:53, Pekka Paalanen wrote:
> On Thu, 29 Feb 2024 14:57:06 -0300
> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> 
>> On 29/02/24 09:12, Pekka Paalanen wrote:
>>> On Wed, 28 Feb 2024 22:52:09 -0300
>>> Arthur Grillo <arthurgrillo@riseup.net> wrote:
>>>   
>>>> On 27/02/24 17:01, Arthur Grillo wrote:  
>>>>>
>>>>>
>>>>> On 27/02/24 12:02, Louis Chauvet wrote:    
>>>>>> Hi Pekka,
>>>>>>
>>>>>> For all the comment related to the conversion part, maybe Arthur have an 
>>>>>> opinion on it, I took his patch as a "black box" (I did not want to 
>>>>>> break (and debug) it).
>>>>>>
>>>>>> Le 26/02/24 - 14:19, Pekka Paalanen a écrit :    
>>>>>>> On Fri, 23 Feb 2024 12:37:26 +0100
>>>>>>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>>>>>>    
>>>>>>>> From: Arthur Grillo <arthurgrillo@riseup.net>
>>>>>>>>
>>>>>>>> Add support to the YUV formats bellow:
>>>>>>>>
>>>>>>>> - NV12
>>>>>>>> - NV16
>>>>>>>> - NV24
>>>>>>>> - NV21
>>>>>>>> - NV61
>>>>>>>> - NV42
>>>>>>>> - YUV420
>>>>>>>> - YUV422
>>>>>>>> - YUV444
>>>>>>>> - YVU420
>>>>>>>> - YVU422
>>>>>>>> - YVU444
>>>>>>>>
>>>>>>>> The conversion matrices of each encoding and range were obtained by
>>>>>>>> rounding the values of the original conversion matrices multiplied by
>>>>>>>> 2^8. This is done to avoid the use of fixed point operations.
>>>>>>>>
>>>>>>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>>>>>>> [Louis Chauvet: Adapted Arthur's work and implemented the read_line_t
>>>>>>>> callbacks for yuv formats]
>>>>>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
>>>>>>>>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
>>>>>>>>  drivers/gpu/drm/vkms/vkms_formats.c  | 289 +++++++++++++++++++++++++++++++++--
>>>>>>>>  drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
>>>>>>>>  drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
>>>>>>>>  5 files changed, 295 insertions(+), 20 deletions(-)
> 
> ...
> 
>>>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
>>>> index f66584549827..4cee3c2d8d84 100644
>>>> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
>>>> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
>>>> @@ -59,7 +59,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>>>>  			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
>>>>  			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
>>>>  			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
>>>> -			{"red",   {0x35, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
>>>> +			{"red",   {0x36, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
>>>>  			{"green", {0xb6, 0x1e, 0x0c}, {0x0000, 0x0000, 0xffff, 0x0000}},
>>>>  			{"blue",  {0x12, 0xff, 0x74}, {0x0000, 0x0000, 0x0000, 0xffff}},
>>>>  		},
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> index e06bbd7c0a67..043f23dbf80d 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>>>> @@ -121,10 +121,12 @@ static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel
>>>>  	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>>>>  }
>>>>  
>>>> -static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
>>>> +#define BIT_DEPTH 32
>>>> +
>>>> +static void ycbcr2rgb(const s64 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
>>>>  {
>>>> -	s32 y_16, cb_16, cr_16;
>>>> -	s32 r_16, g_16, b_16;
>>>> +	s64 y_16, cb_16, cr_16;
>>>> +	s64 r_16, g_16, b_16;
>>>>  
>>>>  	y_16 =  y - y_offset;
>>>>  	cb_16 = cb - 128;
>>>> @@ -134,9 +136,18 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r,
>>>>  	g_16 = m[1][0] * y_16 + m[1][1] * cb_16 + m[1][2] * cr_16;
>>>>  	b_16 = m[2][0] * y_16 + m[2][1] * cb_16 + m[2][2] * cr_16;
>>>>  
>>>> -	*r = clamp(r_16, 0, 0xffff) >> 8;
>>>> -	*g = clamp(g_16, 0, 0xffff) >> 8;
>>>> -	*b = clamp(b_16, 0, 0xffff) >> 8;
>>>> +	// rounding the values
>>>> +	r_16 = r_16 + (1LL << (BIT_DEPTH - 4));
>>>> +	g_16 = g_16 + (1LL << (BIT_DEPTH - 4));
>>>> +	b_16 = b_16 + (1LL << (BIT_DEPTH - 4));
>>>> +
>>>> +	r_16 = clamp(r_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
>>>> +	g_16 = clamp(g_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
>>>> +	b_16 = clamp(b_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);  
>>>
>>> Where do the BIT_DEPTH - 4 and BIT_DEPTH + 8 come from?  
>>
>> Basically, the numbers are in this form in hex:
>>
>> 0xsspppppppp
>>
>> In the end, we only want the 's' bits.
>>
>> The matrix multiplication is not giving us perfect results, making some
>> of KUnit test not pass, This is because the values end up a little bit
>> off. KUnit expects 0xfe, but this functions is returning 0xfd.
>>
>> I noticed that before shifting the values to get the 's' bytes the
>> values were a lot close to what is expected, something like:
>>
>> 0xfdfe287312
>>     ^
>> So the rounding part adds 1 to this marked 'f' to round a bit the values
>> (drm_fixed.h does something similar on drm_fixp2int_round).
>> Like that:
>>
>>    0xfdfe287312
>> +  0x0010000000
>>    ------------
>>    0xfe0e287312
>>
>> That's why the BIT_DEPTH - 4.
> 
> I have a hard time deciphering this. There is some sort of strange
> combination of UNORM and fixed-point going on here, where you process
> the range 0.0 - 255.0 including 32-bit fraction. All variables being
> named "_16" does not help, I've no idea what that refers to.

Totally forgot to rename that, sorry.

> 
> Usually when you have unsigned pixel format type, it's UNORM, that is
> an unsigned integer representation that maps to [0.0, 1.0]. When
> converting UNORM properly to e.g. fixed-point, you don't have to
> consider the UNORM bit depth when computing in fixed-point.
> 
> There is a catch: since 0xff maps to 1.0, the divisor is 0xff, and not
> a bit shift by 8. This must be taken into account when converting
> between different depths of UNORM, or between UNORM and fixed-point.
> Converting between different depths of fixed-point does not have this
> problem.
> 
> If you want to proper rounding, meaning that 0.5 rounds up to 1.0 and
> 0.4999 rounds down to 0.0 when rounding to integers, you have to add
> 0.5 before truncating.
> 
> So in this case you need to add 0x0100_0000 / 2 = 0x0080_0000, not
> 0x0010_0000.

Thanks for the explanations, I will try to take all this into account.

> 
> I don't understand what drm_fixp2int_round() is even doing. The offset
> is not 0.5, it's 0.0000076.
> 
>> After that, the values need to be clamped to not get wrong results when
>> shifting this s64 and casting it to u8. We clamp it to the minimum
>> allowed value: 0, and to the maximum allowed value, which in this case
>> is all the (BIT_DEPTH + 8) bits set to 1, The '+ 8' is to account for
>> the size of the 's' bits.
> 
> Ok. You could also shift with >> BIT_DEPTH first, and then clamp to 0,
> 255.

Great idea! This makes more sense.

Best Regards,
~Arthur Grillo

> 
> 
> Thanks,
> pq
> 
>> After writing this, I think that maybe it would be good to add this
>> explanation as a comment on the code.
>>
>>>   
>>>> +
>>>> +	*r = r_16 >> BIT_DEPTH;
>>>> +	*g = g_16 >> BIT_DEPTH;
>>>> +	*b = b_16 >> BIT_DEPTH;
>>>>  }  
