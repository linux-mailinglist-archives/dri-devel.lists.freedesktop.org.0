Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579CF95B61D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BF210EA25;
	Thu, 22 Aug 2024 13:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g7IWhESZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F4A10EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724332334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rEF+0DDPl7ZNGl0E7zRKH64urw9RSLetJWerpVByaAw=;
 b=g7IWhESZ4sJzKk7g8AEkONoFrJSdDuumX2aGf+I2C0nv1nP/hguxXKLnkr29aG/Of3Wjka
 FYKtvioA4RJMZB/W6Rjawv8DzBM10O1NHjcCgYlniuVu09gV+cOoCWzQVrTwyR7PKG7keL
 bQg5IsusquwLVZ7yxJP4vGx0F074r80=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-svhlVgPgPsymPjhyCLcwaQ-1; Thu, 22 Aug 2024 09:12:13 -0400
X-MC-Unique: svhlVgPgPsymPjhyCLcwaQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3717ddcae71so344123f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724332332; x=1724937132;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rEF+0DDPl7ZNGl0E7zRKH64urw9RSLetJWerpVByaAw=;
 b=V2MsciG9N3M04pZgOpXuq8GZlJmFB9+aJdymLiQUL/nZFipHim0Rz/samnSBpysHde
 Hf9pV1wsDoXqGr0fw2fdbehdmv1XO7HYVLthjzGh4UaGLli/Ok5IcyEHVCLUR/dKSvMJ
 25VN/xkZ7p40TN/Ox8hcXGJRTrXWibVHAzZB2uUYB2e896X9K6yvkwW+aaRQV61Qgg/u
 a2KiWYeqh6/xQtW48EEh09uEKkAjonlshBRqREzfbyubs9n61sZ/5Lz+HgkauC2tjfgg
 DSJjNpKQoIE9gQ/bqZB4wzN3CInSC+8sLsUa34cEON+pD3QFRJiQOazYQsXWOY0sg+WF
 IRpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNBWdfz+qRtc8lo1xfP8N0zRdtXU9Z2aIk6zYKitscISQbQwy/t3STRZZvnA3acQb6UbfdFC2sKXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpKkhUUm5IrJwoM/MX07UYQJ9tE6PwpywGLFvZ15uk8B1bl/Bz
 4Ub8MhEg+oHwvq4pO6jmd171ULDQMPtsh+SrrJPqGstB4p1zPri8ZPZWaLu7/TugX/CV2vq6HwO
 +77N8SWZUD1wqbXG7ZTge2epjmv+m/60DBuYWxjxWokYB4umanbdEKhycPpO/+GwoOw==
X-Received: by 2002:a5d:5e11:0:b0:373:b3b:9f62 with SMTP id
 ffacd0b85a97d-3730b3ba074mr953658f8f.38.1724332331849; 
 Thu, 22 Aug 2024 06:12:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCDq2m7q4T8mvCQJ8ZlmkCjIjVWzVYAgF/3CVbiXdiB6c5TercGvJ578lxX8JpG5tDymv72A==
X-Received: by 2002:a5d:5e11:0:b0:373:b3b:9f62 with SMTP id
 ffacd0b85a97d-3730b3ba074mr953629f8f.38.1724332331294; 
 Thu, 22 Aug 2024 06:12:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730821ab05sm1641474f8f.98.2024.08.22.06.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 06:12:10 -0700 (PDT)
Message-ID: <d5de80ed-adc2-4307-bb57-27fc4e611100@redhat.com>
Date: Thu, 22 Aug 2024 15:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/rect: Add drm_rect_overlap()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240822073852.562286-1-jfalempe@redhat.com>
 <20240822073852.562286-3-jfalempe@redhat.com>
 <4b5c6ba2-e16c-4884-a067-8d9ab7ad35f8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4b5c6ba2-e16c-4884-a067-8d9ab7ad35f8@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2024 14:58, Thomas Zimmermann wrote:
> 
> 
> Am 22.08.24 um 09:33 schrieb Jocelyn Falempe:
>> Check if two rectangles overlap.
>> It's a bit similar to drm_rect_intersect() but this won't modify
>> the rectangle.
>> Simplifies a bit drm_panic.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> There's an optional comment further below.
> 
>> ---
>>
>> v7:
>>   * rename r1/r2 to a/b in drm_rect_overlap() (Jani Nikula)
>>
>>   drivers/gpu/drm/drm_panic.c |  3 +--
>>   include/drm/drm_rect.h      | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 0a047152f88b8..59fba23e5fd7a 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -529,8 +529,7 @@ static void draw_panic_static_user(struct 
>> drm_scanout_buffer *sb)
>>       /* Fill with the background color, and draw text on top */
>>       drm_panic_fill(sb, &r_screen, bg_color);
>> -    if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
>> -        logo_width <= sb->width && logo_height <= sb->height) {
>> +    if (!drm_rect_overlap(&r_logo, &r_msg)) {
>>           if (logo_mono)
>>               drm_panic_blit(sb, &r_logo, logo_mono->data, 
>> DIV_ROUND_UP(logo_width, 8),
>>                          fg_color);
>> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
>> index 73fcb899a01da..46f09cf68458c 100644
>> --- a/include/drm/drm_rect.h
>> +++ b/include/drm/drm_rect.h
>> @@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct 
>> drm_rect *dst,
>>                 drm_rect_height(src) >> 16);
>>   }
>> +/**
>> + * drm_rect_overlap - Check if two rectangles overlap
>> + * @a: first rectangle
>> + * @b: second rectangle
>> + *
>> + * RETURNS:
>> + * %true if the rectangles overlap, %false otherwise.
>> + */
>> +static inline bool drm_rect_overlap(const struct drm_rect *a,
>> +                    const struct drm_rect *b)
>> +{
>> +    return (a->x2 > b->x1 && b->x2 > a->x1 &&
>> +        a->y2 > b->y1 && b->y2 > a->y1);
> 
> I found this hard to understand. You may want to use the existing 
> _intersect helper
> 
> bool overlap(a, b)
> {
>    struct drm_rect tmp = *a
> 
>    return intersect(tmp, b);
> }

I considered this, but it creates an unused rect, and compute the 
intersection rectangle, which we are not interested in.
Even if the compiler may optimize and throw all this away, I prefer the 
more straightforward version.

Thanks for the review,

-- 

Jocelyn
> 
> Up to you.
> 
> Best regards
> Thomas
> 
>> +}
>> +
>>   bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect 
>> *clip);
>>   bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
>>                 const struct drm_rect *clip);
> 

