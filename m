Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6DFA83DD7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3830E10E378;
	Thu, 10 Apr 2025 09:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a4I7MZAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D66C10E7FB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744276016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BER7UYmEw9ixtL0kHFxm0y4uAkw7Au5WEiHbUUwjMi0=;
 b=a4I7MZAY3g3Cvt5V5LVL3E7hjg7b4XKBEp9j0XlAmU86AUI+BvfZF9zWh4JyV33e/kUJpP
 wRjmHCf7IW1t60U5h5nTwK6DCjnhayk5gYvCt0w3Y6Ak8wAJqIclO3t2qN0K/SY9O3bKxk
 bHFCS2np9a+asqaNQWutpaNW17DmH1U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-VembhjINO1qs67jMIu808w-1; Thu, 10 Apr 2025 05:06:55 -0400
X-MC-Unique: VembhjINO1qs67jMIu808w-1
X-Mimecast-MFC-AGG-ID: VembhjINO1qs67jMIu808w_1744276014
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39135d31ca4so324644f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 02:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744276014; x=1744880814;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BER7UYmEw9ixtL0kHFxm0y4uAkw7Au5WEiHbUUwjMi0=;
 b=vmrG3CByTgLAEXUhc2hL5h2Hwqwfd/YdajOEV9wmLqHBdzYP5K+eaDHCU2u/n7fQwt
 ewzH6HfiiZQY4T5j3tAa1xDj8DgF0Pu/6cqP9NqkrmpSTlJOBHkzCtqKfV+42I6vSl9X
 +RcqwM5dF5JSMDCgO8+j9BBA+eq8O7Dack21HfrGXrrgkknhBGIW0OjMAyaGd5F4NEsE
 qnyu+d7/tnYy8qJKHp519Zd5eCdc88Lf9ckGjM2bWsWqFlpP1drj9x/2OA35nCER2axJ
 6lEIhwsfxAaAunSaF6PWFFWan/gR+PbcCRaO2y0fse2Wp+MzNG/A/mXwwYvXwDwyKfOH
 GlRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQQQ5VvYHyHp/GDVjdu8BFFwaS6aeSNC1bVJzYs/+SbjooTY/EmkgjgUwskpPzNkZSP5vMgUxt5jY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwCJPdZkWuVIsnDrOqgXikWxouGrD1Gq/FOngktyZN5ewqEVif
 B2v/OxW3Gg1BvE3BgpGi/DVt2spVtEfPey5Ry8Xxl1bYDbE5S9FE3zIMo9h9FbqOxHy+gGaL33E
 D0RgffGr4xu49o7WNQb92Mw/FzPEmIvyyM5QLWxLwjbhAp9mKL0odd9mhyNees7BukA==
X-Gm-Gg: ASbGnctQhaoQB0YhAfZv4ResFtX3sBgGsdIli07480dc7EYUsMgpE9im/DPsd0SLL7k
 Y8V5iApc7FKds+PzwZjOLdRfcrYxG86KjWS+o9zGy3COe2VubiDzW4CHeDz+yJktxB2ZpgxTic6
 J0ALLcCNFPnsheiReLrRKEVwx93Im/MOdo6lVmr6EGVQ5MQMo8Fttmj2XF0Q8bjT9uYMJXD7LAG
 rnFLC8LR//AQ0Z8GmW9yy24aFBbRmefGZJTChaCGG3M6Bi6JMUnJGTJvLE3+qqZ/bcq0FrRiBun
 dSQBA5A2n66nD4YY+/tMCMB035hXdSBbDoWwB0gPjL4Sj5mra48=
X-Received: by 2002:a05:6000:4287:b0:39c:dfa:e86c with SMTP id
 ffacd0b85a97d-39d8f46abb1mr1575663f8f.13.1744276013613; 
 Thu, 10 Apr 2025 02:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDTPklJCzw4HNfyygiYcYENKvKTw3MdqacWTlMUzZ5L20Mra+gQEivLdIL/Z2Qjq+OZ/HoFw==
X-Received: by 2002:a05:6000:4287:b0:39c:dfa:e86c with SMTP id
 ffacd0b85a97d-39d8f46abb1mr1575628f8f.13.1744276013103; 
 Thu, 10 Apr 2025 02:06:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2c53sm43898445e9.14.2025.04.10.02.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:06:52 -0700 (PDT)
Message-ID: <009a1a7b-594b-4709-b9bc-068b2e6aa922@redhat.com>
Date: Thu, 10 Apr 2025 11:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/panic: Add support to scanout buffer as array
 of pages
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, John Ogness
 <john.ogness@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407140138.162383-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250407140138.162383-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DEDgYFYBHMpBvErIzTEBbN7o9OBPremL3X2SxQMQawY_1744276014
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

On 07/04/2025 15:42, Jocelyn Falempe wrote:
> Some drivers like virtio-gpu, don't map the scanout buffer in the
> kernel. Calling vmap() in a panic handler is not safe, and writing an
> atomic_vmap() API is more complex than expected [1].
> So instead, pass the array of pages of the scanout buffer to the
> panic handler, and map only one page at a time to draw the pixels.
> This is obviously slow, but acceptable for a panic handler.
> As kmap_local_page() is not safe to call from a panic handler,
> introduce a kmap_local_page_try_from_panic() that will avoid unsafe
> operations.

I applied both patches to drm-misc/drm-misc-next.

Thanks for the reviews.

> 
> [1] https://lore.kernel.org/dri-devel/20250305152555.318159-1-ryasuoka@redhat.com/
> 
> v2:
>   * Add kmap_local_page_try_from_panic() (Simona Vetter)
>   * Correctly handle the case if kmap_local_page_try_from_panic()
>     returns NULL
>   * Check that the current page is not NULL before trying to map it.
>   * Add a comment in struct drm_scanout_buffer, that the array of
>     pages shouldn't be allocated in the get_scanout_buffer() callback.
> 
> v3:
>   * Replace DRM_WARN_ONCE with pr_debug_once (Simona Vetter)
>   * Add a comment in kmap_local_page_try_from_panic() (Thomas Gleixner)
> 
> Jocelyn Falempe (2):
>    mm/kmap: Add kmap_local_page_try_from_panic()
>    drm/panic: Add support to scanout buffer as array of pages
> 
>   drivers/gpu/drm/drm_panic.c      | 142 +++++++++++++++++++++++++++++--
>   include/drm/drm_panic.h          |  12 ++-
>   include/linux/highmem-internal.h |  13 +++
>   3 files changed, 160 insertions(+), 7 deletions(-)
> 
> 
> base-commit: fbe43810d563a293e3de301141d33caf1f5d5c5a

