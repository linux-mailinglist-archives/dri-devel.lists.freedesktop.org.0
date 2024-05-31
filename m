Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE18D5E42
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0589A10E042;
	Fri, 31 May 2024 09:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Asm1lQ69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3332D10E042
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717147767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCFPXFrpx3KBvtv6qktcipr22uLNyejGkNsNz1rKKLo=;
 b=Asm1lQ69VPljfOp87eIfeerKwfgvXtOTpFSrb9pxCgT8vuK8f6XcIbfWGs7QUGJbrt1Jc2
 qfhNBoh34UoUYMzuzsb8P6b4GB3t+6n1E9x7dFVH8fEh3Q38x4UjIE29Fg4zPPFS5B6Mn8
 RO4fgDNVBjcalc339z9r37R5p1fzBIs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-r_0JXhILPz2ABCX1VnlCnw-1; Fri, 31 May 2024 05:29:24 -0400
X-MC-Unique: r_0JXhILPz2ABCX1VnlCnw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35dced40d17so734651f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717147763; x=1717752563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TCFPXFrpx3KBvtv6qktcipr22uLNyejGkNsNz1rKKLo=;
 b=Dpn3pOdyyrrU+hE1QVloz5TF81pybZl/hOLTF72RdhoI213+keanngJR/5O7P8X7x3
 KVLy/jFUfKiJ7l/FZK/hkG0yQQi0PO385Yr0XYXv1YeFHJFwkO5m0JiDYBGgCgjr25/1
 5BSzgPBGdJIU8uo3hN5eu2cY3f3hwhXCgHDSh7C8/PmSpma+PJuYSp+xl5qjwNYRzLE3
 86XbPIYdBdt/3hy3aW38J7MP3KyKCWxP6SjLRgRdLHoeL65MyGLy3rK+HJNbpElnwwjD
 P2YTYWxli0okChkfjncsQoGs0a0e8Zg28448LSyMtKjIK7X/ckQlLivxC5qLQuNshdIP
 SdHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC8mmbyqkf+vZe4Y2fpAVl0pSHHiRplja/4AcAFTTYneokM4uWG9AAhHxjnKbgkQBcuauDmhIlJsrE4TecncMB5NrAxoOrKNrvIOIlPIVq
X-Gm-Message-State: AOJu0Yy5SIcogIHcP5hemif+Iu5pG0xc28YZ7JjLWYinOHFEUqM2Ct/H
 C6hNURC8Nzb8//3tZxbWjm7BPESsjmZvEEFPp6FtT2DyBcPHOe8Y1pdzsATM0W+M2RluU9WfytW
 hSd7gM6fUzP3kp1Ge1vXA1UXiijyvxRHny0zC3cP8Sw+/y/zhpvz0AazmzlhxMuqSAg==
X-Received: by 2002:adf:f7c4:0:b0:34e:9342:6b8 with SMTP id
 ffacd0b85a97d-35e0f28800emr817898f8f.40.1717147763326; 
 Fri, 31 May 2024 02:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk8G6Dn/1vBy0cwqajHS7WEuke5UeTlPPcjBqETFKT486pWBaYWFB0G+HvV3+ilBEEmexKqA==
X-Received: by 2002:adf:f7c4:0:b0:34e:9342:6b8 with SMTP id
 ffacd0b85a97d-35e0f28800emr817881f8f.40.1717147762930; 
 Fri, 31 May 2024 02:29:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b?
 ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04da5acsm1426068f8f.62.2024.05.31.02.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:29:22 -0700 (PDT)
Message-ID: <463dcc2e-92e3-441e-b1ec-226a3ffbcca5@redhat.com>
Date: Fri, 31 May 2024 11:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/panic: only draw the foreground color in
 drm_panic_blit()
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240531080750.765982-1-jfalempe@redhat.com>
 <20240531080750.765982-2-jfalempe@redhat.com>
 <87frty1gvn.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87frty1gvn.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
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



On 31/05/2024 11:15, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
> Hello Jocelyn,
> 
>> The whole framebuffer is cleared, so it's useless to rewrite the
>> background colored pixels. It allows to simplify the drawing
>> functions, and prepare the work for the set_pixel() callback.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 63 +++++++++++++++----------------------
>>   1 file changed, 26 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 7ece67086cec..9d95c7eaae83 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -197,37 +197,33 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
>>   static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
>>   			     const u8 *sbuf8, unsigned int spitch,
>>   			     unsigned int height, unsigned int width,
>> -			     u16 fg16, u16 bg16)
>> +			     u16 color)
> 
> What about calling this fg16 instead of color? That way is clear that only
> the fb is written and not the background ?

Yes I can keep the fg16 name.
> 
>>   {
>>   	unsigned int y, x;
>> -	u16 val16;
>>   
>> -	for (y = 0; y < height; y++) {
>> -		for (x = 0; x < width; x++) {
>> -			val16 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg16 : bg16;
>> -			iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, val16);
>> -		}
>> -	}
>> +	for (y = 0; y < height; y++)
>> +		for (x = 0; x < width; x++)
> 
> I would add here a comment that this check is about determining if a color
> is suitable for foreground or background, depending on the luminance
> threshold (which I understand is the 0x80 value?).

The source buffer is monochrome, so store 8 pixels per byte.
the (0x80 >> (x % 8)) is a bit mask, to check if the source pixel is 
foreground or background. I will add a comment about this, to make it clear.

> 
>> +			if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
>> +				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
>>   }
>>   
>>   static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
>>   			     const u8 *sbuf8, unsigned int spitch,
>>   			     unsigned int height, unsigned int width,
>> -			     u32 fg32, u32 bg32)
>> +			     u32 color)
>>   {
>>   	unsigned int y, x;
>> -	u32 val32;
>>
> 
> Same here, I would left the variable name as fg32.
> 
> [...]
> 
> and also here would add a comment or use a variable to make it more readable.
> 
> Same comments for drm_panic_blit32().
> 
> [...]
> 
>>   /*
>> @@ -256,8 +249,7 @@ static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
>>    * @spitch: source pitch in bytes
>>    * @height: height of the image to copy, in pixels
>>    * @width: width of the image to copy, in pixels
>> - * @fg_color: foreground color, in destination format
>> - * @bg_color: background color, in destination format
>> + * @color: foreground color, in destination format
> 
> Leaving as fg_color would even be consistent with your comment.
> 
> Feel free to ignore my comments though if you disagree, the patch looks
> good to me regardless.

sure I will keep the fg_* name
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Thanks for the reviews,

--

Jocelyn

