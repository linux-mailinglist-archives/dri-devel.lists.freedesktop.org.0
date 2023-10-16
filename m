Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CACD7CAF0E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4941810E222;
	Mon, 16 Oct 2023 16:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3967A10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697473349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODCW8D4uHl6BDf18y11+YXXwRT0Qz6rbnXouHSICdFw=;
 b=HcTJlQikzfKpna3USltJengLd1i2a8bzHTt57UduDm+ktz78TaOD579Q5sPN8yHCE1+EQe
 ioEVedbAOfWurT68sFHbyYkOH4rhUojN7qW2TnicGGkoQdxjMqLKlldT0ovZPQWWJF9KZ9
 NY8kXW5WRbn5/VSLOjGvB92jsClya00=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-PS2voyq5O-C9n3DYmgw0KA-1; Mon, 16 Oct 2023 12:22:22 -0400
X-MC-Unique: PS2voyq5O-C9n3DYmgw0KA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4055ce1e8c4so25417365e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697473341; x=1698078141;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODCW8D4uHl6BDf18y11+YXXwRT0Qz6rbnXouHSICdFw=;
 b=OWYuht0LdpFe5b9cWQp/Ifou7KYOJ2kZSjWUBGFgHps9CCC23s4T+CnAO5aKAJjl/q
 dEBQvPSF6j8vwKcOBk3hn3pMxt/wFRCmO2BQpCp/RG8wb7shteQjP1xOPWoGPvNpNY+I
 z98sf/kUdVGsWtIZVUXL2B7Ze/IOkFFwYB4CAiJE/10oLlaQvUFzPcZhsKVujq8YtbYI
 rrMRyp/xT470Ca2ciCppksVIFRG3avbOntgxSa/iuUtk8uhuJ/twmE5MHCnKxiD8zcuQ
 m/D6r2sFiuIJiQwDsW8BVR9qPpDKpk7zS0n701qa2zOXyQCFjrL6asM/KfDmP71uAEBr
 qhWg==
X-Gm-Message-State: AOJu0YzKLRm3Y2CSBngO16VKWYyLEfJxcXHvA26IuwWtX1DU4Bssm3en
 KSzZXQI8ZsHQlU2klgWjlLcSRYt217fSCXjXek2EKdBQN5plz/uvTetjfSS/Z9Ce0RgmjvV/Aq9
 6bp/8ATQ/xevImHZx2MCxUGjSZDAz
X-Received: by 2002:a05:600c:444f:b0:405:409e:1fcb with SMTP id
 v15-20020a05600c444f00b00405409e1fcbmr6971853wmn.5.1697473341609; 
 Mon, 16 Oct 2023 09:22:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc4bWqGEo51uZUUOBwb4Af0O9Q86Wol/swRq4ltMdfA43TKh6rMCHMSdE2io+U5/wVjtg4nw==
X-Received: by 2002:a05:600c:444f:b0:405:409e:1fcb with SMTP id
 v15-20020a05600c444f00b00405409e1fcbmr6971829wmn.5.1697473341131; 
 Mon, 16 Oct 2023 09:22:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600c4e0400b004030e8ff964sm7530387wmq.34.2023.10.16.09.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Oct 2023 09:22:20 -0700 (PDT)
Message-ID: <c1fe1116-7817-4c4c-aeb6-f5e37ed396bf@redhat.com>
Date: Mon, 16 Oct 2023 18:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/format-helper: Export line conversion helper
 for drm_panic
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-2-jfalempe@redhat.com>
 <8e616d64-a5a7-4f4d-a196-a55c59caf0e8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <8e616d64-a5a7-4f4d-a196-a55c59caf0e8@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/10/2023 12:47, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.10.23 um 16:22 schrieb Jocelyn Falempe:
>> drm_panic will need the low-level drm_fb_xxxx_line functions.
> 
> It seems like premature optimization to not use drm_fb_blit(); 
> especially since drm_panic is not performance critical.
> 
>> Also add drm_fb_r1_to_xrgb8888 to render the fonts.
> 
> I think we should provide a helper function that returns a pointer to 
> the correct function for each supported case. Essentially, it would move 
> that if-else branching from drm_fb_blit() into its own function.  It's 
> not typical DRM style, but cleaner than retyping the if-elses in drm_panic.
> 
> Something like:
> 
> typedef int (*drm_format_conv_func)(/* args here */);
> 
> drm_format_conv_func  drm_format_conv(u32 dst_fourcc, u32 src_fourcc)
> {
>      // do if-else from drm_fb_blit here
> 
>      return <correct-format-conv-helper>
> }
> EXPORT_SYMBOL(drm_format_conv)
> 
> That would be callable from anywhere. You can integrate any helpers for 
> _R1 here as well.

Regarding the color conversion approach, I think we don't need to 
convert the whole buffer, like drm_fb_blit() or the xxxx_line() do. Just 
converting the fg_color and bg_color is enough, and then only the pixel 
size matters, when converting from R1.

So instead of having plenty of conversion functions, I will only need
R1_to_8bit(), R1_to_16bit(), R1_to_24bit() and R1_to_32bit()

I can encapsulate this in a drm_blit_from_r1(), that will also take the 
fg_color and bg_color as parameter.

If you agree with that, I will do it for the v5.

-- 

Jocelyn


> 
> Best regards
> Thomas
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_format_helper.c | 88 ++++++++++++++++++++++++++---
>>   include/drm/drm_format_helper.h     |  9 +++
>>   2 files changed, 89 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c 
>> b/drivers/gpu/drm/drm_format_helper.c
>> index f93a4efcee90..c238e5d84f1f 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -270,7 +270,30 @@ void drm_fb_swab(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>       drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, 
>> swab_line);
>>   }
>> -EXPORT_SYMBOL(drm_fb_swab);
>> +
>> +/**
>> + * drm_fb_r1_to_32bit_line - Convert one line from monochrome to any 
>> 32bit pixel format
>> + * @dbuf: Pointer to the destination line (in any 32bit format)
>> + * @sbuf: Pointer to the source line (in monochrome)
>> + * @pixels: Number of pixels to convert.
>> + * @fg_color: Foreground color, applied when R1 is 1
>> + * @bg_color: Background color, applied when R1 is 0
>> + *
>> + * Convert monochrome to any format with 32bit pixel.
>> + * There is a limitation, as sbuf is a pointer, it can only points to 
>> a multiple
>> + * of 8 pixels in the source buffer.
>> + */
>> +void drm_fb_r1_to_32bit_line(void *dbuf, const void *sbuf, unsigned 
>> int pixels,
>> +                u32 fg_color, u32 bg_color)
>> +{
>> +    unsigned int x;
>> +    const u8 *sbuf8 = sbuf;
>> +    u32 *dubf32 = dbuf;
>> +
>> +    for (x = 0; x < pixels; x++)
>> +        dubf32[x] = (sbuf8[x / 8] & (0x80 >> (x % 8))) ? fg_color : 
>> bg_color;
>> +}
>> +EXPORT_SYMBOL(drm_fb_r1_to_32bit_line);
>>   static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>>   {
>> @@ -320,7 +343,13 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map 
>> *dst, const unsigned int *dst_pi
>>   }
>>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>> -static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>> +/**
>> + * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to 
>> RGB565
>> + * @dbuf: Pointer to the destination line (in RGB565)
>> + * @sbuf: Pointer to the source line (in XRGB8888)
>> + * @pixels: Number of pixels to convert.
>> + */
>> +void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels)
>>   {
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>> @@ -336,6 +365,7 @@ static void drm_fb_xrgb8888_to_rgb565_line(void 
>> *dbuf, const void *sbuf, unsigne
>>           dbuf16[x] = cpu_to_le16(val16);
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_line);
>>   /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
>>   static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const 
>> void *sbuf,
>> @@ -396,7 +426,13 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map 
>> *dst, const unsigned int *dst_pi
>>   }
>>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
>> -static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>> +/**
>> + * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to 
>> XRGB1555
>> + * @dbuf: Pointer to the destination line (in XRGB1555)
>> + * @sbuf: Pointer to the source line (in XRGB8888)
>> + * @pixels: Number of pixels to convert.
>> + */
>> +void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels)
>>   {
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>> @@ -412,6 +448,7 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void 
>> *dbuf, const void *sbuf, unsig
>>           dbuf16[x] = cpu_to_le16(val16);
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555_line);
>>   /**
>>    * drm_fb_xrgb8888_to_xrgb1555 - Convert XRGB8888 to XRGB1555 clip 
>> buffer
>> @@ -447,7 +484,13 @@ void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map 
>> *dst, const unsigned int *dst_
>>   }
>>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
>> -static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>> +/**
>> + * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to 
>> ARGB1555
>> + * @dbuf: Pointer to the destination line (in ARGB1555)
>> + * @sbuf: Pointer to the source line (in XRGB8888)
>> + * @pixels: Number of pixels to convert.
>> + */
>> +void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels)
>>   {
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>> @@ -464,6 +507,7 @@ static void drm_fb_xrgb8888_to_argb1555_line(void 
>> *dbuf, const void *sbuf, unsig
>>           dbuf16[x] = cpu_to_le16(val16);
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555_line);
>>   /**
>>    * drm_fb_xrgb8888_to_argb1555 - Convert XRGB8888 to ARGB1555 clip 
>> buffer
>> @@ -499,7 +543,13 @@ void drm_fb_xrgb8888_to_argb1555(struct iosys_map 
>> *dst, const unsigned int *dst_
>>   }
>>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
>> -static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>> +/**
>> + * drm_fb_xrgb8888_to_rgba5551_line - Convert one line from XRGB8888 
>> to ARGB5551
>> + * @dbuf: Pointer to the destination line (in ARGB5551)
>> + * @sbuf: Pointer to the source line (in XRGB8888)
>> + * @pixels: Number of pixels to convert.
>> + */
>> +void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels)
>>   {
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>> @@ -516,6 +566,7 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void 
>> *dbuf, const void *sbuf, unsig
>>           dbuf16[x] = cpu_to_le16(val16);
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551_line);
>>   /**
>>    * drm_fb_xrgb8888_to_rgba5551 - Convert XRGB8888 to RGBA5551 clip 
>> buffer
>> @@ -551,7 +602,13 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map 
>> *dst, const unsigned int *dst_
>>   }
>>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
>> -static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>> +/**
>> + * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to 
>> RGB888
>> + * @dbuf: Pointer to the destination line (in RGB888)
>> + * @sbuf: Pointer to the source line (in XRGB8888)
>> + * @pixels: Number of pixels to convert.
>> + */
>> +void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels)
>>   {
>>       u8 *dbuf8 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>> @@ -566,6 +623,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void 
>> *dbuf, const void *sbuf, unsigne
>>           *dbuf8++ = (pix & 0x00FF0000) >> 16;
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_line);
>>   /**
>>    * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
>> @@ -709,7 +767,13 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct 
>> iosys_map *dst, const unsigned in
>>               drm_fb_xrgb8888_to_xbgr8888_line);
>>   }
>> -static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const 
>> void *sbuf, unsigned int pixels)
>> +/**
>> + * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to 
>> XRGB2101010
>> + * @dbuf: Pointer to the destination line (in XRGB2101010)
>> + * @sbuf: Pointer to the source line (in XRGB8888)
>> + * @pixels: Number of pixels to convert.
>> + */
>> +void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>>   {
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>> @@ -726,6 +790,7 @@ static void 
>> drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
>>           *dbuf32++ = cpu_to_le32(pix);
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_line);
>>   /**
>>    * drm_fb_xrgb8888_to_xrgb2101010 - Convert XRGB8888 to XRGB2101010 
>> clip buffer
>> @@ -761,7 +826,13 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct 
>> iosys_map *dst, const unsigned int *d
>>   }
>>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
>> -static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const 
>> void *sbuf, unsigned int pixels)
>> +/**
>> + * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to 
>> ARGB2101010
>> + * @dbuf: Pointer to the destination line (in ARGB2101010)
>> + * @sbuf: Pointer to the source line (in XRGB8888)
>> + * @pixels: Number of pixels to convert.
>> + */
>> +void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>>   {
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>> @@ -779,6 +850,7 @@ static void 
>> drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
>>           *dbuf32++ = cpu_to_le32(pix);
>>       }
>>   }
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010_line);
>>   /**
>>    * drm_fb_xrgb8888_to_argb2101010 - Convert XRGB8888 to ARGB2101010 
>> clip buffer
>> diff --git a/include/drm/drm_format_helper.h 
>> b/include/drm/drm_format_helper.h
>> index 291deb09475b..31ab699128d5 100644
>> --- a/include/drm/drm_format_helper.h
>> +++ b/include/drm/drm_format_helper.h
>> @@ -24,30 +24,39 @@ void drm_fb_memcpy(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>   void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>>            const struct iosys_map *src, const struct drm_framebuffer *fb,
>>            const struct drm_rect *clip, bool cached);
>> +void drm_fb_r1_to_32bit_line(void *dbuf, const void *sbuf, unsigned 
>> int pixels,
>> +                 u32 fg_color, u32 bg_color);
>>   void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned 
>> int *dst_pitch,
>>                      const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                      const struct drm_rect *clip);
>> +void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels);
>>   void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned 
>> int *dst_pitch,
>>                      const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                      const struct drm_rect *clip, bool swab);
>> +void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels);
>>   void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>                    const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                    const struct drm_rect *clip);
>> +void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels);
>>   void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>                    const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                    const struct drm_rect *clip);
>> +void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels);
>>   void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>                    const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                    const struct drm_rect *clip);
>> +void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, 
>> unsigned int pixels);
>>   void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned 
>> int *dst_pitch,
>>                      const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                      const struct drm_rect *clip);
>>   void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>                    const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                    const struct drm_rect *clip);
>> +void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels);
>>   void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>                       const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                       const struct drm_rect *clip);
>> +void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels);
>>   void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>                       const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                       const struct drm_rect *clip);
> 

