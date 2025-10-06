Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A909BBBD4D2
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 10:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5736310E33D;
	Mon,  6 Oct 2025 08:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CN0RRrJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A4B10E33D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759738016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpLOO/RlbSV+v+FkGVukdBUWowalJplYfx2koVcYQzM=;
 b=CN0RRrJ95IZtxtnPGCd304KfivCgMLrFn1XGlbj37D39yA5kwDyweR8uUPnJ1NkmGWi10N
 lCeeQJVZPuqDU6NgTSbMk+uER3wciJZjfalZ9tFL3ob2AnW6ZzoKSNcK59Bd4EMHbatrvL
 uh9MGDquoDJvdLQCVYL5VUSbEwYG7xk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-h0kShXD-OdahB4jikwiirA-1; Mon, 06 Oct 2025 04:06:55 -0400
X-MC-Unique: h0kShXD-OdahB4jikwiirA-1
X-Mimecast-MFC-AGG-ID: h0kShXD-OdahB4jikwiirA_1759738014
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3ecdc9dbc5fso2451619f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 01:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759738014; x=1760342814;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpLOO/RlbSV+v+FkGVukdBUWowalJplYfx2koVcYQzM=;
 b=wHqU5Gyn4IeZXNbX9Qw/97utD6IgonlgGbCOrvYny8AqYRUm2nbizQRsUPwBq6Mh/l
 JNziaH7EquS0Ea5NwPMDxgqUg8d573s7JOpjMaKpG2dWyuyqOtZdMyie7SEHWvR6HFJZ
 tBTRETjqH/jtAolqFTOJZ0b6Ip77+GDDsWg0UMxaDrIlBip78PV9KyCI6sP2e8cTrpSY
 +rjjHiw9cJqqKziDhxOIEe/CpJvo+XxK+BJPdz5PufGT6yyK22v1eL/zUtILfAUbPD52
 ougZVHbSfd+m5l873sNAGrFJgCOpovORKtTmxRBQZ31XxTTTT2FrF0J/cpEo8RZ0nncT
 u9dQ==
X-Gm-Message-State: AOJu0Yz+36vaPzvcaplfspzKqLbJCEaCz522hHQy3cdxu0LEJ1ChqMWS
 sbOb4OW2JHCMYFBr0fT8nYb1Lyc4HQ/GoXS1R5zLnea14bPtP/wyQQDYNG+vEuess3+iVeBMcCx
 lwITMhJsyZJLYsznEnmElt0/TdZa4a50tQIXKqrSrh1BInnWMJcKPFKuyLmXW/kUQU+qoNA==
X-Gm-Gg: ASbGncsja4Fzp15F9VBcGEgAqfhd5Art+sQUZWRhtvhE6SQyODA48154T7LLA/3suTI
 wUpNua7Lh3mn4IXg/74CDsMUYhrUW2nZnfxHlP7Zp2xK8kYwp2yKGhhItpa1/Gedo33sa6g9tdl
 tjAACWA5+kQIiVSBhdpSjFeOuv1ZfBw2OOobZ02so7DGl8reWWr7yXbagMx2pCSZmDJOSdDC6wJ
 4jAvvUSiMV8f4DEWe1i1SeosDXCdSVtXN5W26iTHqVZ/62hZfe1q6SInEMZiRezQatqqTDb42ep
 qLpIGQjNGeZDh+vcFGwD9A/qoo+xOCjklO96GV4cA4JstcCZwff9WReb+l2rQr6icOLV/4NUskW
 +ub/UACFocQ==
X-Received: by 2002:a05:6000:610:b0:3fe:d6df:c679 with SMTP id
 ffacd0b85a97d-425671c1c62mr7390041f8f.55.1759738014245; 
 Mon, 06 Oct 2025 01:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpwOMaIeKVt8usgBP9B8cskANRaaLPNti2Z/heEmw9fA6OvQl4UHwY/r85C4aCobj9vmHGCA==
X-Received: by 2002:a05:6000:610:b0:3fe:d6df:c679 with SMTP id
 ffacd0b85a97d-425671c1c62mr7390009f8f.55.1759738013823; 
 Mon, 06 Oct 2025 01:06:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ab960sm19681894f8f.13.2025.10.06.01.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 01:06:53 -0700 (PDT)
Message-ID: <b026d815-dd6e-48a6-8efa-4631ed7cca9c@redhat.com>
Date: Mon, 6 Oct 2025 10:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/draw: add drm_draw_can_convert_from_xrgb8888
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
 <20251005-drm_draw_conv_check-v1-1-9c814d9362f6@valla.it>
 <a669b2ee89865e9150efd38e181cdc838c2ac522@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <a669b2ee89865e9150efd38e181cdc838c2ac522@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d1QzO18ZLoODik4iVqvmlmF20Mdbz50RQk-w8zWTsSc_1759738014
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/6/25 08:48, Jani Nikula wrote:
> On Sun, 05 Oct 2025, Francesco Valla <francesco@valla.it> wrote:
>> Add drm_draw_can_convert_from_xrgb8888() function that can be used to
>> determine if a XRGB8888 color can be converted to the specified format.
>>
>> Signed-off-by: Francesco Valla <francesco@valla.it>
>> ---
>>   drivers/gpu/drm/drm_draw.c          | 84 +++++++++++++++++++++++++++----------
>>   drivers/gpu/drm/drm_draw_internal.h |  2 +
>>   2 files changed, 63 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
>> index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..2641026a103d3b28cab9f5d378604b0604520fe4 100644
>> --- a/drivers/gpu/drm/drm_draw.c
>> +++ b/drivers/gpu/drm/drm_draw.c
>> @@ -15,45 +15,83 @@
>>   #include "drm_draw_internal.h"
>>   #include "drm_format_internal.h"
>>   
>> -/**
>> - * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
>> - * @color: input color, in xrgb8888 format
>> - * @format: output format
>> - *
>> - * Returns:
>> - * Color in the format specified, casted to u32.
>> - * Or 0 if the format is not supported.
>> - */
>> -u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
>> +static int __drm_draw_color_from_xrgb8888(u32 color, u32 format, u32 *out_color)
> 
> Is there any reason to change the return value of this function and
> return the result via out_color? It already returns 0 if the format is
> not supported. If there's a reason, it needs to be in the commit
> message.

I think the problem is that 0, is also a valid color.

Maybe it would be better to split it into 2 functions, and duplicate the 
switch case.

ie:

u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
{
	switch(format) {
	case DRM_FORMAT_RGB565:
		return drm_pixel_xrgb8888_to_rgb565(color);

....


bool drm_draw_can_convert_from_xrgb8888(u32 format)
{

	switch(format) {
	case DRM_FORMAT_RGB565:
		return true;

....
	default:
		return false;


I didn't do it this way, because there is a risk to add a format to only 
one of the switch. But after more thinking, that would be simpler overall.

Best regards,

-- 

Jocelyn


> 
>>   {
>>   	switch (format) {
>>   	case DRM_FORMAT_RGB565:
>> -		return drm_pixel_xrgb8888_to_rgb565(color);
>> +		*out_color = drm_pixel_xrgb8888_to_rgb565(color);
>> +		break;
>>   	case DRM_FORMAT_RGBA5551:
>> -		return drm_pixel_xrgb8888_to_rgba5551(color);
>> +		*out_color = drm_pixel_xrgb8888_to_rgba5551(color);
>> +		break;
>>   	case DRM_FORMAT_XRGB1555:
>> -		return drm_pixel_xrgb8888_to_xrgb1555(color);
>> +		*out_color = drm_pixel_xrgb8888_to_xrgb1555(color);
>> +		break;
>>   	case DRM_FORMAT_ARGB1555:
>> -		return drm_pixel_xrgb8888_to_argb1555(color);
>> +		*out_color = drm_pixel_xrgb8888_to_argb1555(color);
>> +		break;
>>   	case DRM_FORMAT_RGB888:
>> +		fallthrough;
> 
> That's not necessary for back to back case labels. Please don't add it.
> 
>>   	case DRM_FORMAT_XRGB8888:
>> -		return color;
>> +		*out_color = color;
>> +		break;
>>   	case DRM_FORMAT_ARGB8888:
>> -		return drm_pixel_xrgb8888_to_argb8888(color);
>> +		*out_color = drm_pixel_xrgb8888_to_argb8888(color);
>> +		break;
>>   	case DRM_FORMAT_XBGR8888:
>> -		return drm_pixel_xrgb8888_to_xbgr8888(color);
>> +		*out_color = drm_pixel_xrgb8888_to_xbgr8888(color);
>> +		break;
>>   	case DRM_FORMAT_ABGR8888:
>> -		return drm_pixel_xrgb8888_to_abgr8888(color);
>> +		*out_color = drm_pixel_xrgb8888_to_abgr8888(color);
>> +		break;
>>   	case DRM_FORMAT_XRGB2101010:
>> -		return drm_pixel_xrgb8888_to_xrgb2101010(color);
>> +		*out_color = drm_pixel_xrgb8888_to_xrgb2101010(color);
>> +		break;
>>   	case DRM_FORMAT_ARGB2101010:
>> -		return drm_pixel_xrgb8888_to_argb2101010(color);
>> +		*out_color = drm_pixel_xrgb8888_to_argb2101010(color);
>> +		break;
>>   	case DRM_FORMAT_ABGR2101010:
>> -		return drm_pixel_xrgb8888_to_abgr2101010(color);
>> +		*out_color = drm_pixel_xrgb8888_to_abgr2101010(color);
>> +		break;
>>   	default:
>> -		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>> -		return 0;
>> +		return -1;
> 
> Please don't use -1 as a generic error code. -1 is -EPERM.
> 
>>   	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * drm_draw_can_convert_from_xrgb8888 - check if xrgb8888 can be converted to the desired format
>> + * @format: format
>> + *
>> + * Returns:
>> + * True if XRGB8888 can be converted to the specified format, false otherwise.
>> + */
>> +bool drm_draw_can_convert_from_xrgb8888(u32 format)
>> +{
>> +	u32 out_color;
>> +
>> +	return __drm_draw_color_from_xrgb8888(0, format, &out_color) == 0;
>> +}
>> +EXPORT_SYMBOL(drm_draw_can_convert_from_xrgb8888);
>> +
>> +/**
>> + * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
>> + * @color: input color, in xrgb8888 format
>> + * @format: output format
>> + *
>> + * Returns:
>> + * Color in the format specified, casted to u32.
>> + * Or 0 if the format is not supported.
>> + */
>> +u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
>> +{
>> +	u32 out_color = 0;
>> +
>> +	if (__drm_draw_color_from_xrgb8888(color, format, &out_color))
>> +		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>> +
>> +	return out_color;
>>   }
>>   EXPORT_SYMBOL(drm_draw_color_from_xrgb8888);
>>   
>> diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
>> index f121ee7339dc11537f677c833f0ee94fe0e799cd..2ab4cb341df94fc4173dd6f5e7a512bdcfa5e55c 100644
>> --- a/drivers/gpu/drm/drm_draw_internal.h
>> +++ b/drivers/gpu/drm/drm_draw_internal.h
>> @@ -24,6 +24,8 @@ static inline const u8 *drm_draw_get_char_bitmap(const struct font_desc *font,
>>   	return font->data + (c * font->height) * font_pitch;
>>   }
>>   
>> +bool drm_draw_can_convert_from_xrgb8888(u32 format);
>> +
>>   u32 drm_draw_color_from_xrgb8888(u32 color, u32 format);
>>   
>>   void drm_draw_blit16(struct iosys_map *dmap, unsigned int dpitch,
> 

