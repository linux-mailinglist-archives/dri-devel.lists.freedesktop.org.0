Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F3AE3BD0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 12:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B2A10E34B;
	Mon, 23 Jun 2025 10:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bVCk1fU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E5910E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750673429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0QTXQBLxcMhOeb0i/VFxTw420XqKRgS33hIZfnQXmI=;
 b=bVCk1fU6OnS7Ck2ux1TRmWYZOUO0SvDQ5+/DpKnbzLEELHX7RdvjPzwUQVXJMOyX6KQvp8
 1KS/nfnKQTWS9JhnjOGeyKlYTAR7BJebTzcHKiDM1+34IBEDwmy/cW8VtEElpeGtnm8liA
 sgaOEkqDzpzsGikhFezZejj6KBk5sOk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-sUy0jI3XOEuwHQpE4vNcTg-1; Mon, 23 Jun 2025 06:10:27 -0400
X-MC-Unique: sUy0jI3XOEuwHQpE4vNcTg-1
X-Mimecast-MFC-AGG-ID: sUy0jI3XOEuwHQpE4vNcTg_1750673426
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4530ec2c87cso20910705e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 03:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750673426; x=1751278226;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k0QTXQBLxcMhOeb0i/VFxTw420XqKRgS33hIZfnQXmI=;
 b=cfc6pCzsjeWqdjl18KfgUJQ7yH+qy/BelYm/vGJofNEH/awmA5ap6D7oVt9f+WX2Xx
 B45gjsSb3d5kQEt+ZEiSFptltvlxpcsUKCNq3kmfB0h5hAhw+N6vPXjLCOw48AYy+EaF
 NDxaLVIs2OLDJfPezGZGi1rO5sK8DUOIXb9q/fx9L51Nik8pL64BONTR521NB4LC2HIh
 8mLusedjk6TvFX6fXJKB9IYhlV9LIX+rkjhE3d0fGusO4n2UNz6TU1Pc9YQE8fly2dUK
 1FBWasAYeFLu8ExbWzDZviMYXh0S1oxZ+PcVC+6Bw7AoHyvLk6ENOxvJ/XvMNJBT5vHv
 wjqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz1f3zqlvX9XuNZqldR4rLdoZKRRb2yYKr3kSWFM6LRk6EEPYZY8SAJ14SakCs+CimTs2SPUYZIJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcPfOPOHOaLzXRtEdiMQZXpPwikD92fmgJz7xfDgXsKSvufKfr
 goU4ZaibQKx+J2aiFJAZZByRvIaQlYdQ87oCSsDeEjnk5nEJz/MQQz6YloxpgpT+uBpobbCsTpD
 cDsWJktV/efbD6i3wOw6F9JS60nKatJIV6RSzH43MUdEXw4fUUaAPdazsA5mB8Q8SS5hAyA==
X-Gm-Gg: ASbGncvTn3M2BRRHVpUqrBY9xY9ixn3iCgVSp4DZKlxZljgvyMloVmH1LbyckIrrr93
 nLC/h9xTngt2Omu3YBAwtb/3i33JyqHcYkAzA55BWmGbVax4hDiHMq7eu3fX4fZb2RMFehAtc3/
 NMdmuodWy0cdClYxDgkKgnuwLCVawbOYsBW8ZV/722Nv37b9fYakImspNhS8HN99323cLWgkOnt
 0fRVxbuj5SztbYh+gsLNZPK/Zm0L5V2T2jIVtccdXz6W1ufv9W4nACIiBOWLUptZCO/R+EAGd1i
 4TxcIcLPL48MdVLbCy96q2kPZ3W6Zib8LVpa0S27AcczUlNY6HZj+0HGsDwRcg==
X-Received: by 2002:a05:600c:8594:b0:453:9b3:5b67 with SMTP id
 5b1f17b1804b1-453659f8324mr45133005e9.24.1750673425999; 
 Mon, 23 Jun 2025 03:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD/EDMvqV0TmgUGzrlFNaHgM4CsvQsUMw4O18DWIgIsMuiop7OwY4JI2S/azLj8QrlBp/XkA==
X-Received: by 2002:a05:600c:8594:b0:453:9b3:5b67 with SMTP id
 5b1f17b1804b1-453659f8324mr45132755e9.24.1750673425513; 
 Mon, 23 Jun 2025 03:10:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eada7adsm140785055e9.35.2025.06.23.03.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 03:10:24 -0700 (PDT)
Message-ID: <4d81cf64-7bf1-4a7d-8682-fc817d74c373@redhat.com>
Date: Mon, 23 Jun 2025 12:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/10] drm/i915: Add drm_panic support
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <c28aad52-7977-4763-9690-9aed1910c834@linux.intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c28aad52-7977-4763-9690-9aed1910c834@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bpYkUBfuX6k0mLZIe0wTwQ0KtHVWOnGYRaN0gmx5MaU_1750673426
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

On 23/06/2025 09:40, Maarten Lankhorst wrote:
> Hey,
> 
> Thanks for the series. I didn't see you on irc so I wanted to ask if you are planning to send a v11 with
> the changes from void * to struct intel_panic_data and adding the VRAM support?

Yes, I'm preparing a v11, and I'm considering to do something like this, 
to allocate the panic data with the struct intel_framebuffer:

struct xe_framebuffer {
	struct intel_framebuffer base;
	struct xe_panic_data panic;
};

struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
{
	struct xe_framebuffer *xe_fb;

	xe_fb = kmalloc(sizeof(struct xe_framebuffer), GFP_KERNEL);
	return &xe_fb->base;
}

(And the same for i915).
That should allow you to add battlemage support.

> 
> 
> Other than that, I think the series looks good and I'll be able to test it on my battlemage.
> 

Thanks

Best regards,

-- 

Jocelyn

> Best regards,
> ~Maarten
> 
> On 2025-06-18 11:31, Jocelyn Falempe wrote:
>> This adds drm_panic support for i915 and xe driver.
>>
>> I've tested it on the 4 intel laptops I have at my disposal.
>>   * Haswell with 128MB of eDRAM.
>>   * Comet Lake  i7-10850H
>>   * Raptor Lake i7-1370P (with DPT, and Y-tiling).
>>   * Lunar Lake Ultra 5 228V (with DPT, and 4-tiling, and using the Xe driver.
>>
>> I tested panic in both fbdev console and gnome desktop.
>> I think it won't work yet on discrete GPU, but that can be added later.
>>
>> Best regards,
>>
>> v2:
>>   * Add the proper abstractions to build also for Xe.
>>   * Fix dim checkpatch issues.
>>
>> v3:
>>   * Add support for Y-tiled framebuffer when DPT is enabled.
>>
>> v4:
>>   * Add support for Xe driver, which shares most of the code.
>>   * Add support for 4-tiled framebuffer found in newest GPU.
>>
>> v5:
>>   * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
>>   * Use struct intel_display instead of drm_i915_private.
>>   * Use iosys_map for intel_bo_panic_map().
>>
>> v6:
>>   * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
>>   * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c
>>
>> v7:
>>   * Fix mismatch {} in intel_panic_flush() (Jani Nikula)
>>   * Return int for i915_gem_object_panic_map() (Ville Syrjälä)
>>   * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)
>>
>> v8:
>>   * Use kmap_try_from_panic() instead of vmap, to access the framebuffer.
>>   * Add ttm_bo_kmap_try_from_panic() for the xe driver, that uses ttm.
>>   * Replace intel_bo_panic_map() with a setup() and finish() function,
>>     to allow mapping only one page of teh framebuffer at a time.
>>   * Configure psr to send the full framebuffer update.
>>
>> v9:
>>   * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
>>     from the panic handler (Christian König)
>>   * Fix missing kfree() for i915_panic_pages in i915_gem_object_panic_finish()
>>     Also change i915_panic_pages allocation to kmalloc, as kvmalloc is not
>>     safe to call from the panic handler.
>>   * Fix dim checkpatch warnings.
>>
>> v10:
>>   * Add a private field to struct drm_scanout_buffer
>>   * Replace static variables with new fields in struct intel_framebuffer
>>     (Maarten Lankhorst)
>>   * Add error handling if i915_gem_object_panic_pages() returns NULL
>>   * Declare struct drm_scanout_buffer instead of including <drm/drm_panic.h>
>>     in intel_bo.h
>>
>> Jocelyn Falempe (10):
>>    drm/panic: Add a private field to struct drm_scanout_buffer
>>    drm/i915/fbdev: Add intel_fbdev_get_map()
>>    drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
>>    drm/i915/display: Add a disable_tiling() for skl planes
>>    drm/ttm: Add ttm_bo_kmap_try_from_panic()
>>    drm/i915: Add intel_bo_panic_setup and intel_bo_panic_finish
>>    drm/i915/display: Add drm_panic support
>>    drm/i915/display: Add drm_panic support for Y-tiling with DPT
>>    drm/i915/display: Add drm_panic support for 4-tiling with DPT
>>    drm/i915/psr: Add intel_psr2_panic_force_full_update
>>
>>   drivers/gpu/drm/i915/display/i9xx_plane.c     |  23 +++
>>   .../gpu/drm/i915/display/intel_atomic_plane.c | 170 +++++++++++++++++-
>>   drivers/gpu/drm/i915/display/intel_bo.c       |  12 ++
>>   drivers/gpu/drm/i915/display/intel_bo.h       |   4 +
>>   .../drm/i915/display/intel_display_types.h    |  11 ++
>>   drivers/gpu/drm/i915/display/intel_fb_pin.c   |   5 +
>>   drivers/gpu/drm/i915/display/intel_fb_pin.h   |   2 +
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
>>   drivers/gpu/drm/i915/display/intel_fbdev.h    |   6 +-
>>   drivers/gpu/drm/i915/display/intel_psr.c      |  20 +++
>>   drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
>>   .../drm/i915/display/skl_universal_plane.c    |  27 +++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |   5 +
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 112 ++++++++++++
>>   drivers/gpu/drm/i915/i915_vma.h               |   5 +
>>   drivers/gpu/drm/ttm/ttm_bo_util.c             |  27 +++
>>   drivers/gpu/drm/xe/display/intel_bo.c         |  61 +++++++
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +
>>   include/drm/drm_panic.h                       |   6 +
>>   include/drm/ttm/ttm_bo.h                      |   1 +
>>   20 files changed, 507 insertions(+), 2 deletions(-)
>>
>>
>> base-commit: b2f7e30d2e4a34fcee8111d713bef4f29dc23c77
> 

