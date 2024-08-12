Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA1D94EF5C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 16:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999D510E235;
	Mon, 12 Aug 2024 14:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UjqeCAFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853B410E233
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723472348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsZ0n/uAaYy4BF0ruktYY8YrFP/mFKdzXlqcXk7zn70=;
 b=UjqeCAFdpD4KspxR8fDZTk/VNggYthpZOkDaWGQGOK1He9hk6dbTK1u0E28/z10rsPR7yA
 PzCiI6hMeJP3fZ4RLEhGE+bKXD93nEZ9jp+1e4BtkothLWxlC37mE0i3+CP9lUcHweEjNw
 NOzFs4mKIhAaWhBGKCGrT1pkh1KFttk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-Med97TkGMtOpvjnQis3l3Q-1; Mon, 12 Aug 2024 10:19:05 -0400
X-MC-Unique: Med97TkGMtOpvjnQis3l3Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-429097df54bso29783635e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 07:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723472344; x=1724077144;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DsZ0n/uAaYy4BF0ruktYY8YrFP/mFKdzXlqcXk7zn70=;
 b=qUZiqaasfDhR0y9IoftJ/mJ0PGYhe8rO5N1nqQXLMe1QS/6T6RPVHui0CTqyVbBk2L
 gmhS5d9rzTazn4ZoB/bfWnlf5F506+t5eOP8ii9gOWVw+0Jb3Q2hfjxHama+4LrCPhvU
 B0XCasDtnHz6NSm0UXr6MmmqCOvHfqSeIwiM27cu286yhGFAG+sZfwci1A/zA/ylpWgo
 N5Tpfx8WB7SIflZj5AZn7wJnRG6BOjSynLKEj9SbGSWJVS+nljWiui+rUY7fiQyrpMdL
 u+SAelMu5PcfSrw+0zvKQPqDxfvDRLTdQDqKp4G+irvhxhEJ22Azc2Z2FIPbuEax0RF1
 VWDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeihgG4Koi4kCdjuGcVVN6q2MMPW/IGdE8CBZg0EBMEz3adUvsWCgaFK33sBaSq1UZx+gtvvbM1cs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwJAMHk1AiL9JFkLOZvrPbWK7FpSW1miDEb37nb1/ha77OZB+U
 HU85tIBvRogdNd/B8p9UvTuWJrMf1/PDmgS4LRsv5UU7to8hnChvf0tnTv6CAkRd6xgkbaPzzq0
 ITn227ZL5iVQye3yGFIIMspmnPPo1OuFjn2TmR6sW8GMpFPfp2ArW/pDHgFiqbw99Ng==
X-Received: by 2002:a05:600c:5489:b0:427:d8f7:b718 with SMTP id
 5b1f17b1804b1-429d488047fmr4483195e9.24.1723472343949; 
 Mon, 12 Aug 2024 07:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMYqABa//mMcdpuf59X1dzQmjPKUZRUSfrn2rTiz4JEfPCW7tnP/wiYu6/J9T05f0sM7ifPw==
X-Received: by 2002:a05:600c:5489:b0:427:d8f7:b718 with SMTP id
 5b1f17b1804b1-429d488047fmr4483015e9.24.1723472343486; 
 Mon, 12 Aug 2024 07:19:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290c79f345sm187090885e9.39.2024.08.12.07.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 07:19:03 -0700 (PDT)
Message-ID: <60e55a9d-70bb-45d1-ac97-e4f6f6ffa9a9@redhat.com>
Date: Mon, 12 Aug 2024 16:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/rect: Add drm_rect_overlap()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240812123147.81356-1-jfalempe@redhat.com>
 <20240812123147.81356-3-jfalempe@redhat.com> <87sev926na.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87sev926na.fsf@intel.com>
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



On 12/08/2024 15:49, Jani Nikula wrote:
> On Mon, 12 Aug 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Check if two rectangles overlap.
>> It's a bit similar to drm_rect_intersect() but this won't modify
>> the rectangle.
>> Simplifies a bit drm_panic.
> 
> Based on the name, I'd expect drm_rect_overlap() to return true for
> *any* overlap, while this one seems to mean if one rectangle is
> completely within another, with no adjacent borders.

It's what I intended, but I may have messed up the formula.
> 
> I'd expect a drm_rect_overlap() to return true for this:
> 
>   +-------+
>   |   +---+---+
>   |   |       |
>   +---+       |
>       |       |
>       +-------+

if r1 is the top left rectangle, you've got:

r1->x2 > r2->x1   => true
r2->x2 > r1->x1   => true
r1->y2 > r2->y1   => true
r2->y2 > r1->y1   => true

So they count as overlap.

Checking in stackoverflow, they use the same formula:
https://stackoverflow.com/questions/306316/determine-if-two-rectangles-overlap-each-other

> 
> While this seems to be required instead:
> 
>   +-------+
>   | +---+ |
>   | |   | |
>   | +---+ |
>   +-------+
> 
> 
> IOW, I find the name misleading.
> 
> BR,
> Jani.
> 
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c |  3 +--
>>   include/drm/drm_rect.h      | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 0a047152f88b8..59fba23e5fd7a 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -529,8 +529,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>>   	/* Fill with the background color, and draw text on top */
>>   	drm_panic_fill(sb, &r_screen, bg_color);
>>   
>> -	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
>> -	    logo_width <= sb->width && logo_height <= sb->height) {
>> +	if (!drm_rect_overlap(&r_logo, &r_msg)) {
>>   		if (logo_mono)
>>   			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
>>   				       fg_color);
>> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
>> index 73fcb899a01da..7bafde747d560 100644
>> --- a/include/drm/drm_rect.h
>> +++ b/include/drm/drm_rect.h
>> @@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct drm_rect *dst,
>>   		      drm_rect_height(src) >> 16);
>>   }
>>   
>> +/**
>> + * drm_rect_overlap - Check if two rectangles overlap
>> + * @r1: first rectangle
>> + * @r2: second rectangle
>> + *
>> + * RETURNS:
>> + * %true if the rectangles overlap, %false otherwise.
>> + */
>> +static inline bool drm_rect_overlap(const struct drm_rect *r1,
>> +				    const struct drm_rect *r2)
>> +{
>> +	return (r1->x2 > r2->x1 && r2->x2 > r1->x1 &&
>> +		r1->y2 > r2->y1 && r2->y2 > r1->y1);
>> +}
>> +
>>   bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect *clip);
>>   bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
>>   			  const struct drm_rect *clip);
> 

