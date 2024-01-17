Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466AE830B56
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 17:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB9310E6FF;
	Wed, 17 Jan 2024 16:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0696D10E6FF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705509618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32FNssfhx8G2zyTXNBhwlc1NZK1dD6VTuqfaEyCRtNU=;
 b=CYTnjPiiMeOFMQe9I7LcPxQiu4J70YIk5h+Pp+vDjc/XYkVuWzpw9zcIbvnebO7wWEAZEU
 nc8cxfJfK4vMYpBH2gdzF7tRxfEU9TBsRjSywr0L+87ErZ6vKSB6goN1LHfTfi0JapgiEV
 8QZF8Z9BQsVioEbzjscExXT5m/hC4Kw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-kGobmvQrMoGu5M_CmYlBFA-1; Wed, 17 Jan 2024 11:40:16 -0500
X-MC-Unique: kGobmvQrMoGu5M_CmYlBFA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2ccab4b1353so75842211fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 08:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705509615; x=1706114415;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=32FNssfhx8G2zyTXNBhwlc1NZK1dD6VTuqfaEyCRtNU=;
 b=mYzBsboIYCQFPQLLSI4mcyxyDhXsyrWATQzLnimNxSG7T2eRBDTUaBB5rB2+jf21vv
 jsqK4CLZMCoRuOVEsnzpNWzcehQaI9XFkBJwTS5Hn7FqMME8R9coONGkAND34YXOy67a
 v9sbH+fLmSiXK7CbhV3uJ2N9WH3CNZmKKbFfGRzwjoO05Ou6vRnH+QHHZPmBwNnNil/j
 x8jcsCExvajoPpXQbKMZ3JI2/+6RBP+s9CNdDObBlrsc99xUSQUQ2nMkjeXz4QvKUIBQ
 /cIKz/1biVAE9QgQWO7+d/xYXHfT47cPyqJlsdN+PDG7CgAn4XzJJBR5iXiUET+4WWvo
 wzNw==
X-Gm-Message-State: AOJu0YziecuQpb6DZq5B0Bc8bBwSmaN9JTT2Cmf40of/J5kTjvZxMQfL
 Ov54b/sA1Xbx3Avm7FosVFnf4TrUr1ryS3zk7JMovsCssLurNq1/UUd1T+3wF3CwQsQ5nI20W3t
 y5nwtnXweQU6OPYFOQZaopVc3uQABfDXwUI4e
X-Received: by 2002:a2e:8096:0:b0:2cd:1647:966 with SMTP id
 i22-20020a2e8096000000b002cd16470966mr4276053ljg.35.1705509614838; 
 Wed, 17 Jan 2024 08:40:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw821UBB/sSm82mJ6mLZ8IUv1U/gQ3LNnKp94F0lRg4e6AVLUak9g5odGBdfOPvUd7Vn1ybg==
X-Received: by 2002:a2e:8096:0:b0:2cd:1647:966 with SMTP id
 i22-20020a2e8096000000b002cd16470966mr4276046ljg.35.1705509614264; 
 Wed, 17 Jan 2024 08:40:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa7cd89000000b00558e0481b2fsm6871037edv.47.2024.01.17.08.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 08:40:13 -0800 (PST)
Message-ID: <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
Date: Wed, 17 Jan 2024 17:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 17/01/2024 16:06, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.01.24 um 17:00 schrieb Jocelyn Falempe:
>> This is needed for drm_panic, to draw the font, and fill
>> the background color, in multiple color format.
> 
> TBH, I don't like this patch at all. It looks like you're reimplementing 
> existing functionality for a single use case; specifically drm_fb_blit().
> 
> What's wrong with the existing interfaces?

drm_fb_blit() is good to copy a framebuffer to another, but is clearly 
unoptimal to draw font.
It handles xrgb8888 to any rgb format, and I need monochrome to any rgb 
format.
I need to convert foreground and background color to the destination 
format, but using drm_fb_blit() to convert 1 pixel is tedious.

It also requires an additional memory buffer, and do an additional 
memory copy that we don't need at all.

It also has no way to fill a region with the background color.

The last thing, is if I plan to add YUV support, with this 
implementation, I only need to write one function that convert one 
pixel. Otherwise I would need to add the drm_fb_r1_to_yuvxxx_line() and 
drm_fb_r1_to_yuvxxxx() boilerplate.

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>>
>> v5:
>>   * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>>   * Also add drm_fb_fill() to fill area with background color.
>> v6:
>>   * fix __le32 conversion warning found by the kernel test bot
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_format_helper.c | 432 ++++++++++++++++++++++------
>>   include/drm/drm_format_helper.h     |   9 +
>>   2 files changed, 360 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c 
>> b/drivers/gpu/drm/drm_format_helper.c
>> index b1be458ed4dd..8cbc2d747cff 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -111,6 +111,153 @@ void drm_format_conv_state_release(struct 
>> drm_format_conv_state *state)
>>   }
>>   EXPORT_SYMBOL(drm_format_conv_state_release);
>> +static inline __le16 drm_format_xrgb8888_to_rgb565(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = ((pix & 0x00F80000) >> 8) |
>> +        ((pix & 0x0000FC00) >> 5) |
>> +        ((pix & 0x000000F8) >> 3);
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static inline __le16 drm_format_xrgb8888_to_rgba5551(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = ((pix & 0x00f80000) >> 8) |
>> +        ((pix & 0x0000f800) >> 5) |
>> +        ((pix & 0x000000f8) >> 2) |
>> +        BIT(0); /* set alpha bit */
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static inline __le16 drm_format_xrgb8888_to_xrgb1555(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = ((pix & 0x00f80000) >> 9) |
>> +        ((pix & 0x0000f800) >> 6) |
>> +        ((pix & 0x000000f8) >> 3);
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static inline __le16 drm_format_xrgb8888_to_argb1555(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = BIT(15) | /* set alpha bit */
>> +        ((pix & 0x00f80000) >> 9) |
>> +        ((pix & 0x0000f800) >> 6) |
>> +        ((pix & 0x000000f8) >> 3);
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static inline __le32 drm_format_xrgb8888_to_argb8888(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 |= GENMASK(31, 24); /* fill alpha bits */
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +static inline __le32 drm_format_xrgb8888_to_xbgr8888(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
>> +        ((val32 & 0x0000ff00) >>  8) <<  8 |
>> +        ((val32 & 0x000000ff) >>  0) << 16 |
>> +        ((val32 & 0xff000000) >> 24) << 24;
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +static inline __le32 drm_format_xrgb8888_to_abgr8888(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
>> +        ((val32 & 0x0000ff00) >>  8) <<  8 |
>> +        ((val32 & 0x000000ff) >>  0) << 16 |
>> +        GENMASK(31, 24); /* fill alpha bits */
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +static inline __le32 drm_format_xrgb8888_to_xrgb2101010(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x000000FF) << 2) |
>> +        ((val32 & 0x0000FF00) << 4) |
>> +        ((val32 & 0x00FF0000) << 6);
>> +    return cpu_to_le32(val32 | ((val32 >> 8) & 0x00300C03));
>> +}
>> +
>> +static inline __le32 drm_format_xrgb8888_to_argb2101010(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x000000FF) << 2) |
>> +        ((val32 & 0x0000FF00) << 4) |
>> +        ((val32 & 0x00FF0000) << 6);
>> +    val32 = GENMASK(31, 30) | /* set alpha bits */
>> +          val32 | ((val32 >> 8) & 0x00300c03);
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +/**
>> + * drm_fb_convert_from_xrgb8888 - convert one pixel from xrgb8888 to 
>> the desired format
>> + * @color: input color, in xrgb8888 format
>> + * @format: output format
>> + *
>> + * Returns:
>> + * Color in the format specified, casted to u32.
>> + * Or 0 if the format is unknown.
>> + */
>> +u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format)
>> +{
>> +    __le32 pix = cpu_to_le32(color);
>> +
>> +    switch (format) {
>> +    case DRM_FORMAT_RGB565:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_rgb565(pix));
>> +    case DRM_FORMAT_RGBA5551:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_rgba5551(pix));
>> +    case DRM_FORMAT_XRGB1555:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_xrgb1555(pix));
>> +    case DRM_FORMAT_ARGB1555:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_argb1555(pix));
>> +    case DRM_FORMAT_RGB888:
>> +    case DRM_FORMAT_XRGB8888:
>> +        return le32_to_cpu(pix);
>> +    case DRM_FORMAT_ARGB8888:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_argb8888(pix));
>> +    case DRM_FORMAT_XBGR8888:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_xbgr8888(pix));
>> +    case DRM_FORMAT_XRGB2101010:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_xrgb2101010(pix));
>> +    case DRM_FORMAT_ARGB2101010:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_argb2101010(pix));
>> +    default:
>> +        WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>> +        return 0;
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_fb_convert_from_xrgb8888);
>> +
>>   static unsigned int clip_offset(const struct drm_rect *clip, 
>> unsigned int pitch, unsigned int cpp)
>>   {
>>       return clip->y1 * pitch + clip->x1 * cpp;
>> @@ -366,6 +513,193 @@ void drm_fb_swab(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>   }
>>   EXPORT_SYMBOL(drm_fb_swab);
>> +static void drm_fb_r1_to_16bit(struct iosys_map *dmap, unsigned int 
>> dpitch,
>> +                   const u8 *sbuf8, unsigned int spitch,
>> +                   unsigned int height, unsigned int width,
>> +                   __le16 fg16, __le16 bg16)
>> +{
>> +    unsigned int l, x;
>> +    __le16 val16;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            val16 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 8))) 
>> ? fg16 : bg16;
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, 
>> le16_to_cpu(val16));
>> +        }
>> +    }
>> +}
>> +
>> +static void drm_fb_r1_to_24bit(struct iosys_map *dmap, unsigned int 
>> dpitch,
>> +                   const u8 *sbuf8, unsigned int spitch,
>> +                   unsigned int height, unsigned int width,
>> +                   __le32 fg32, __le32 bg32)
>> +{
>> +    unsigned int l, x;
>> +    __le32 color;
>> +    u32 val32;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            u32 off = l * dpitch + x * 3;
>> +
>> +            color = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 8))) 
>> ? fg32 : bg32;
>> +            val32 = le32_to_cpu(color);
>> +
>> +            /* write blue-green-red to output in little endianness */
>> +            iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
>> +            iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
>> +            iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 16);
>> +        }
>> +    }
>> +}
>> +
>> +static void drm_fb_r1_to_32bit(struct iosys_map *dmap, unsigned int 
>> dpitch,
>> +                   const u8 *sbuf8, unsigned int spitch,
>> +                   unsigned int height, unsigned int width,
>> +                   __le32 fg32, __le32 bg32)
>> +{
>> +    unsigned int l, x;
>> +    __le32 val32;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            val32 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 8))) 
>> ? fg32 : bg32;
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, 
>> le32_to_cpu(val32));
>> +        }
>> +    }
>> +}
>> +
>> +/**
>> + * drm_fb_blit_from_r1 - convert a monochrome image to a linear 
>> framebuffer
>> + * @dmap: destination iosys_map
>> + * @dpitch: destination pitch in bytes
>> + * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
>> + * @spitch: source pitch in bytes
>> + * @height: height of the image to copy, in pixels
>> + * @width: width of the image to copy, in pixels
>> + * @fg_color: foreground color, in destination format
>> + * @bg_color: background color, in destination format
>> + * @pixel_width: pixel width in bytes.
>> + *
>> + * This can be used to draw font which are monochrome images, to a 
>> framebuffer
>> + * in other supported format.
>> + */
>> +void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
>> +             const u8 *sbuf8, unsigned int spitch,
>> +             unsigned int height, unsigned int width,
>> +             u32 fg_color, u32 bg_color,
>> +             unsigned int pixel_width)
>> +{
>> +    switch (pixel_width) {
>> +    case 2:
>> +        drm_fb_r1_to_16bit(dmap, dpitch, sbuf8, spitch,
>> +                   height, width,
>> +                   cpu_to_le16(fg_color),
>> +                   cpu_to_le16(bg_color));
>> +    break;
>> +    case 3:
>> +        drm_fb_r1_to_24bit(dmap, dpitch, sbuf8, spitch,
>> +                   height, width,
>> +                   cpu_to_le32(fg_color),
>> +                   cpu_to_le32(bg_color));
>> +    break;
>> +    case 4:
>> +        drm_fb_r1_to_32bit(dmap, dpitch, sbuf8, spitch,
>> +                   height, width,
>> +                   cpu_to_le32(fg_color),
>> +                   cpu_to_le32(bg_color));
>> +    break;
>> +    default:
>> +        WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_fb_blit_from_r1);
>> +
>> +static void drm_fb_fill8(struct iosys_map *dmap, unsigned int dpitch,
>> +             unsigned int height, unsigned int width,
>> +             u8 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++)
>> +        for (x = 0; x < width; x++)
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u8), u8, color);
>> +}
>> +
>> +static void drm_fb_fill16(struct iosys_map *dmap, unsigned int dpitch,
>> +              unsigned int height, unsigned int width,
>> +              u16 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++)
>> +        for (x = 0; x < width; x++)
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, 
>> color);
>> +}
>> +
>> +static void drm_fb_fill24(struct iosys_map *dmap, unsigned int dpitch,
>> +              unsigned int height, unsigned int width,
>> +              u32 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            unsigned int off = l * dpitch + x * 3;
>> +
>> +            /* write blue-green-red to output in little endianness */
>> +            iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
>> +            iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
>> +            iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
>> +        }
>> +    }
>> +}
>> +
>> +static void drm_fb_fill32(struct iosys_map *dmap, unsigned int dpitch,
>> +              unsigned int height, unsigned int width,
>> +              u32 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++)
>> +        for (x = 0; x < width; x++)
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, 
>> color);
>> +}
>> +
>> +/**
>> + * drm_fb_fill - Fill a rectangle with a color
>> + * @dmap: destination iosys_map, pointing to the top left corner of 
>> the rectangle
>> + * @dpitch: destination pitch in bytes
>> + * @height: height of the rectangle, in pixels
>> + * @width: width of the rectangle, in pixels
>> + * @color: color to fill the rectangle.
>> + * @pixel_width: pixel width in bytes
>> + *
>> + * Fill a rectangle with a color, in a linear framebuffer.
>> + */
>> +void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
>> +             unsigned int height, unsigned int width,
>> +             u32 color, unsigned int pixel_width)
>> +{
>> +    switch (pixel_width) {
>> +    case 1:
>> +        drm_fb_fill8(dmap, dpitch, height, width, color);
>> +    break;
>> +    case 2:
>> +        drm_fb_fill16(dmap, dpitch, height, width, color);
>> +    break;
>> +    case 3:
>> +        drm_fb_fill24(dmap, dpitch, height, width, color);
>> +    break;
>> +    case 4:
>> +        drm_fb_fill32(dmap, dpitch, height, width, color);
>> +    break;
>> +    default:
>> +        WARN_ONCE(1, "Can't fill with pixel width %d\n", pixel_width);
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_fb_fill);
>> +
>>   static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>>   {
>>       u8 *dbuf8 = dbuf;
>> @@ -420,15 +754,9 @@ static void drm_fb_xrgb8888_to_rgb565_line(void 
>> *dbuf, const void *sbuf, unsigne
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>>       for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = ((pix & 0x00F80000) >> 8) |
>> -            ((pix & 0x0000FC00) >> 5) |
>> -            ((pix & 0x000000F8) >> 3);
>> -        dbuf16[x] = cpu_to_le16(val16);
>> +        dbuf16[x] = drm_format_xrgb8888_to_rgb565(sbuf32[x]);
>>       }
>>   }
>> @@ -498,16 +826,9 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void 
>> *dbuf, const void *sbuf, unsig
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = ((pix & 0x00f80000) >> 9) |
>> -            ((pix & 0x0000f800) >> 6) |
>> -            ((pix & 0x000000f8) >> 3);
>> -        dbuf16[x] = cpu_to_le16(val16);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf16[x] = drm_format_xrgb8888_to_xrgb1555(sbuf32[x]);
>>   }
>>   /**
>> @@ -550,17 +871,9 @@ static void drm_fb_xrgb8888_to_argb1555_line(void 
>> *dbuf, const void *sbuf, unsig
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = BIT(15) | /* set alpha bit */
>> -            ((pix & 0x00f80000) >> 9) |
>> -            ((pix & 0x0000f800) >> 6) |
>> -            ((pix & 0x000000f8) >> 3);
>> -        dbuf16[x] = cpu_to_le16(val16);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf16[x] = drm_format_xrgb8888_to_argb1555(sbuf32[x]);
>>   }
>>   /**
>> @@ -603,17 +916,9 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void 
>> *dbuf, const void *sbuf, unsig
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = ((pix & 0x00f80000) >> 8) |
>> -            ((pix & 0x0000f800) >> 5) |
>> -            ((pix & 0x000000f8) >> 2) |
>> -            BIT(0); /* set alpha bit */
>> -        dbuf16[x] = cpu_to_le16(val16);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf16[x] = drm_format_xrgb8888_to_rgba5551(sbuf32[x]);
>>   }
>>   /**
>> @@ -707,13 +1012,9 @@ static void 
>> drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        pix |= GENMASK(31, 24); /* fill alpha bits */
>> -        dbuf32[x] = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf32[x] = drm_format_xrgb8888_to_argb8888(sbuf32[x]);
>>   }
>>   /**
>> @@ -756,16 +1057,9 @@ static void 
>> drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsig
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        pix = ((pix & 0x00ff0000) >> 16) <<  0 |
>> -              ((pix & 0x0000ff00) >>  8) <<  8 |
>> -              ((pix & 0x000000ff) >>  0) << 16 |
>> -              GENMASK(31, 24); /* fill alpha bits */
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_abgr8888(sbuf32[x]);
>>   }
>>   static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>> @@ -787,16 +1081,9 @@ static void 
>> drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsig
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        pix = ((pix & 0x00ff0000) >> 16) <<  0 |
>> -              ((pix & 0x0000ff00) >>  8) <<  8 |
>> -              ((pix & 0x000000ff) >>  0) << 16 |
>> -              ((pix & 0xff000000) >> 24) << 24;
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_xbgr8888(sbuf32[x]);
>>   }
>>   static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>> @@ -818,17 +1105,9 @@ static void 
>> drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 val32;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val32 = ((pix & 0x000000FF) << 2) |
>> -            ((pix & 0x0000FF00) << 4) |
>> -            ((pix & 0x00FF0000) << 6);
>> -        pix = val32 | ((val32 >> 8) & 0x00300C03);
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_xrgb2101010(sbuf32[x]);
>>   }
>>   /**
>> @@ -872,18 +1151,9 @@ static void 
>> drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 val32;
>> -    u32 pix;
>> -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val32 = ((pix & 0x000000ff) << 2) |
>> -            ((pix & 0x0000ff00) << 4) |
>> -            ((pix & 0x00ff0000) << 6);
>> -        pix = GENMASK(31, 30) | /* set alpha bits */
>> -              val32 | ((val32 >> 8) & 0x00300c03);
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_argb2101010(sbuf32[x]);
>>   }
>>   /**
>> diff --git a/include/drm/drm_format_helper.h 
>> b/include/drm/drm_format_helper.h
>> index f13b34e0b752..f416f0bef52d 100644
>> --- a/include/drm/drm_format_helper.h
>> +++ b/include/drm/drm_format_helper.h
>> @@ -66,6 +66,7 @@ void *drm_format_conv_state_reserve(struct 
>> drm_format_conv_state *state,
>>                       size_t new_size, gfp_t flags);
>>   void drm_format_conv_state_release(struct drm_format_conv_state 
>> *state);
>> +u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format);
>>   unsigned int drm_fb_clip_offset(unsigned int pitch, const struct 
>> drm_format_info *format,
>>                   const struct drm_rect *clip);
>> @@ -76,6 +77,14 @@ void drm_fb_swab(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>            const struct iosys_map *src, const struct drm_framebuffer *fb,
>>            const struct drm_rect *clip, bool cached,
>>            struct drm_format_conv_state *state);
>> +void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
>> +             const u8 *sbuf8, unsigned int spitch,
>> +             unsigned int height, unsigned int width,
>> +             u32 fg_color, u32 bg_color,
>> +             unsigned int pixel_width);
>> +void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
>> +         unsigned int height, unsigned int width,
>> +         u32 color, unsigned int pixel_width);
>>   void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned 
>> int *dst_pitch,
>>                      const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                      const struct drm_rect *clip, struct 
>> drm_format_conv_state *state);
> 

