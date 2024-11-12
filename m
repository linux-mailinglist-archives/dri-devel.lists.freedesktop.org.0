Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4B9C5270
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 10:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452B710E304;
	Tue, 12 Nov 2024 09:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F2sSF7BX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D9E10E304
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731405102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsXJIOcU1Y8WPOzExqls3FXydBaj0wSBKcVoF/FpkwA=;
 b=F2sSF7BXxL+lTA1sYeSrLXsAVE4uxGi5LDgwU41f/7R/9PFnwzRmL11UCK+Yx6YoVFM7TT
 c4KErX5/cWRb8lMB0FCe61j3JZ8m4dxotZNREwqWCYAkMXW6hz0OS5YsNZwMrtQlEZ7VYD
 Wbwq3op14JpTWrP2TTENMoyTRlbhH6A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-dAwM8c20PdGc4h6cTSvkGw-1; Tue, 12 Nov 2024 04:51:40 -0500
X-MC-Unique: dAwM8c20PdGc4h6cTSvkGw-1
X-Mimecast-MFC-AGG-ID: dAwM8c20PdGc4h6cTSvkGw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d49887a2cso2944500f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 01:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731405100; x=1732009900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsXJIOcU1Y8WPOzExqls3FXydBaj0wSBKcVoF/FpkwA=;
 b=VfLlCcooY1X90DajHcTK0tTa+KD3uMBXemirS+kwOY5Geok+YeqsSeWDNefYVmo5Dk
 BnAh9zBNdcA5cuWHTFPbx08E97lvGPoc1gKtCpdlaXDy8mQxR++1DxuC196L8XdlWftH
 I04arVOVD5orbi7Y9pyOvLjTLLKKGivhSMrn3ah4wBX8ATG5l/NoiQRRofYs9Jb2ky9j
 zRbFRxs3yCLKPBiBwhJ+MwU5kBwyns7iuOBVuXJ88rlrhsJLBOzSuGG1byfRQdgjpaOG
 boMu/LFo1xVe8eoZdbymv7Cs8JJHGNzdNfkaETX9MysSPkfSjUYPJsg+n7mn/4T3NOuC
 JJvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeblCyX+j/2l8BiHCeMokV8T2UUMeTDWeuMR8IHwv94zeDL4EuLGcYm1jVAEjN/oG+GIc0woJ3Hq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC6j0KvVxjG8rPlDmih+fHZDCqLBjZRQvW3qZtKJRQEPrzswte
 bnGrDqxf3RZ+mjxLQBKTg3puJOpN9OuBx19CDuCAd08FPsddDiKPi6gX0KuR0h7oLeJIGpZiP/c
 QP9unluh3AXGkCNyDkz2m0k6LLHvDrjKZMo1n9+x+GZqZt7Z4L9fVNJcRXbZXJspvfw==
X-Received: by 2002:a05:6000:1569:b0:37d:4660:c027 with SMTP id
 ffacd0b85a97d-381f0f87207mr14707290f8f.24.1731405099745; 
 Tue, 12 Nov 2024 01:51:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHusiA3w3BhzwfE2GvVnI3Z50uH1qhg1kogLt4IQIs9Vf9VGFuNEyeoDdQGxbFTY2yKrvHbLA==
X-Received: by 2002:a05:6000:1569:b0:37d:4660:c027 with SMTP id
 ffacd0b85a97d-381f0f87207mr14707266f8f.24.1731405099328; 
 Tue, 12 Nov 2024 01:51:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6b2d13sm233789855e9.12.2024.11.12.01.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 01:51:38 -0800 (PST)
Message-ID: <86135b98-40cb-4694-971c-3f09263d4236@redhat.com>
Date: Tue, 12 Nov 2024 10:51:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/log: Add integer scaling support
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241108082025.1004653-1-jfalempe@redhat.com>
 <20241108082025.1004653-8-jfalempe@redhat.com>
 <6a1bc758-e66a-4067-80d3-82fe3ba357e5@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <6a1bc758-e66a-4067-80d3-82fe3ba357e5@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Br1U6CNY5JWcb0p01bS_M27uTxDwIi4kZmjIzM-bItU_1731405100
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/2024 14:06, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 08.11.24 um 09:10 schrieb Jocelyn Falempe:
>> Add a module parameter, to increase the font size for HiDPI screen.
>> Even with CONFIG_FONT_TER16x32, it can still be a bit small to read.
>> In this case, adding drm_log.scale=2 to your kernel command line will
>> double the character size.
> 
> Can't we have larger fonts instead?

Yes, that would be nice, but the largest font available currently is 16x32.
Also it's stored as raw bitmap, so bigger fonts will take much more memory.
For the drm_log use case, we don't need pixel-perfect glyph, so integer 
scaling is good enough.

Best regards,

-- 

Jocelyn


> 
> Best regards
> Thomas
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v5:
>>   * Change scale parameter to unsigned int (Jani Nikula)
>>
>>   drivers/gpu/drm/drm_log.c | 27 ++++++++++++++++++---------
>>   1 file changed, 18 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
>> index e6900c6b96436..4dc7be2288ab7 100644
>> --- a/drivers/gpu/drm/drm_log.c
>> +++ b/drivers/gpu/drm/drm_log.c
>> @@ -25,6 +25,10 @@ MODULE_AUTHOR("Jocelyn Falempe");
>>   MODULE_DESCRIPTION("DRM boot logger");
>>   MODULE_LICENSE("GPL");
>> +static unsigned int scale = 1;
>> +module_param(scale, uint, 0444);
>> +MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default 
>> is 1");
>> +
>>   /**
>>    * DOC: overview
>>    *
>> @@ -38,6 +42,8 @@ struct drm_log_scanout {
>>       const struct font_desc *font;
>>       u32 rows;
>>       u32 columns;
>> +    u32 scaled_font_h;
>> +    u32 scaled_font_w;
>>       u32 line;
>>       u32 format;
>>       u32 px_width;
>> @@ -66,7 +72,7 @@ static struct drm_log *console_to_drm_log(struct 
>> console *con)
>>   static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>>                const u8 *src, unsigned int src_pitch,
>> -             u32 height, u32 width, u32 scale, u32 px_width, u32 color)
>> +             u32 height, u32 width, u32 px_width, u32 color)
>>   {
>>       switch (px_width) {
>>       case 2:
>> @@ -86,7 +92,7 @@ static void drm_log_blit(struct iosys_map *dst, 
>> unsigned int dst_pitch,
>>   static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 
>> line)
>>   {
>>       struct drm_framebuffer *fb = scanout->buffer->fb;
>> -    unsigned long height = scanout->font->height;
>> +    unsigned long height = scanout->scaled_font_h;
>>       struct iosys_map map;
>>       struct drm_rect r = DRM_RECT_INIT(0, line * height, fb->width, 
>> height);
>> @@ -106,8 +112,8 @@ static void drm_log_draw_line(struct 
>> drm_log_scanout *scanout, const char *s,
>>       size_t font_pitch = DIV_ROUND_UP(font->width, 8);
>>       const u8 *src;
>>       u32 px_width = fb->format->cpp[0];
>> -    struct drm_rect r = DRM_RECT_INIT(0, scanout->line * font->height,
>> -                      fb->width, (scanout->line + 1) * font->height);
>> +    struct drm_rect r = DRM_RECT_INIT(0, scanout->line * scanout- 
>> >scaled_font_h,
>> +                      fb->width, (scanout->line + 1) * scanout- 
>> >scaled_font_h);
>>       u32 i;
>>       if (drm_client_buffer_vmap_local(scanout->buffer, &map))
>> @@ -117,9 +123,10 @@ static void drm_log_draw_line(struct 
>> drm_log_scanout *scanout, const char *s,
>>       for (i = 0; i < len && i < scanout->columns; i++) {
>>           u32 color = (i < prefix_len) ? scanout->prefix_color : 
>> scanout->front_color;
>>           src = drm_draw_get_char_bitmap(font, s[i], font_pitch);
>> -        drm_log_blit(&map, fb->pitches[0], src, font_pitch, font- 
>> >height, font->width,
>> -                 1, px_width, color);
>> -        iosys_map_incr(&map, font->width * px_width);
>> +        drm_log_blit(&map, fb->pitches[0], src, font_pitch,
>> +                 scanout->scaled_font_h, scanout->scaled_font_w,
>> +                 px_width, color);
>> +        iosys_map_incr(&map, scanout->scaled_font_w * px_width);
>>       }
>>       scanout->line++;
>> @@ -204,8 +211,10 @@ static int drm_log_setup_modeset(struct 
>> drm_client_dev *client,
>>           return -ENOMEM;
>>       }
>>       mode_set->fb = scanout->buffer->fb;
>> -    scanout->rows = height / scanout->font->height;
>> -    scanout->columns = width / scanout->font->width;
>> +    scanout->scaled_font_h = scanout->font->height * scale;
>> +    scanout->scaled_font_w = scanout->font->width * scale;
>> +    scanout->rows = height / scanout->scaled_font_h;
>> +    scanout->columns = width / scanout->scaled_font_w;
>>       scanout->front_color = drm_draw_color_from_xrgb8888(0xffffff, 
>> format);
>>       scanout->prefix_color = drm_draw_color_from_xrgb8888(0x4e9a06, 
>> format);
>>       return 0;
> 

