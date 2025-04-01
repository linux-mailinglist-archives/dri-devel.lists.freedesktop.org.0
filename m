Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F816A784C6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 00:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE9110E688;
	Tue,  1 Apr 2025 22:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N8gvtqE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829A310E688
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 22:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743547098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5PJKLi2OplBGTGIMXpZ53IzIo/Tz04cZeR9oJzwXFw=;
 b=N8gvtqE1wMEPnueJ2vCyssvec/AA6vqRKz/t4GI5Xbdd5tWRJX/DG/sh01mOYL84YttIZJ
 zMezMg8HD+NQAv6HBARk/ImiNsEy35rUYjBph65uqfL/waJPGGVsaME9++TIh8+O8B4gbO
 ecmg7Kc8nvbzqsBbOqtVYCFwBtlzCMY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-vO_UYWoLOa63NxqhuWrcpA-1; Tue, 01 Apr 2025 18:38:17 -0400
X-MC-Unique: vO_UYWoLOa63NxqhuWrcpA-1
X-Mimecast-MFC-AGG-ID: vO_UYWoLOa63NxqhuWrcpA_1743547096
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so33909045e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 15:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743547096; x=1744151896;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C5PJKLi2OplBGTGIMXpZ53IzIo/Tz04cZeR9oJzwXFw=;
 b=XiTageMQyVCwaqZVWW1zc5AtyBQHsmxjMyFlzTwSQJqRsyZPs1I1OhZy9YNGJKROTi
 msW7S26mxanpTIfxTr7cOT5nl4D3TGt5G7xKWjeSSH8oK4yH+7jeHRSNPjVYJ4JcJVhN
 8Uk1TF29GoFqAGbOci06eaDLxMd5NhU8yxZIJHnyP8cKi8kGzYU1Z6CQbYUK2AfrUvFF
 /znC4lFPD0YgksSfp0ikV88JESFV12r9KUMSYAQQXA/0wi7Hf8VowVXb04xyqG8YBX1v
 g483yPOLaymmZiEHkpKsrXtp7dZDHMxTaP8Sd+H38TvmbBckrFhs2ZmxZzKlfb67TDqB
 Bgcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLpjKdkaM2/Tz+wrmRgXvjvB5w4m5vaD7RL+xtePLK6M9d5GnfraN1HwTW+IerzKp9+JDZeN3ij24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbmTLL/DKf1ZuOIvDPGg0nE+BP2nDcCCx8beTBkC7baSgHJV/w
 4RtibgoMPTV5JSlQVzzBqAkqJLBC37JALQSmArzATukvPRZ/pLAWOQb399oAaF4f4Ouj7SrR3fU
 1dgPk33VAYcBFRCQHTfj0wUv1ByfbEg1TmH5fFIZuOxPPv5dArEcMMVLUh38jkEurEQ==
X-Gm-Gg: ASbGncuR+FhBZ0Gpa25ZUdowubuq2tMpG4J73Qi9XL0deycntecneVBs4GB05yshNx4
 EBw8GeW+/4hNcMa7YegFrUannvWufxVMKMzZgXlIzOyys3pXe6IJ2g5QVvKNSSk0GC1Tnzj9A4F
 YWc8wEyCU1/qBQxpPpcf/bla1j3R1MjsHZKr18sTfN1bthVv8deJpGwDn23GkFZ6fUvPBF9uFqd
 nUdvwjeb02OIF3XUbUxxJHJ6K7RlSBVAx2YCVbwn9SNoJ62TZTI5erTvix7kQWFRKYK7R6IAgXF
 JqjVUGbAQTdfQLVHpaOnfnA4z0qHdNkIBuCbAdJQI0GguBfyjunLNxs=
X-Received: by 2002:a05:600c:4e52:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-43ead8c33d6mr29300725e9.16.1743547096017; 
 Tue, 01 Apr 2025 15:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+A9B3Z3i0+ExREjsKk6CLKNAI1PotfynRKX0NjYjl47QvaVyla0up+c3eNFCiXusT9Z7c5g==
X-Received: by 2002:a05:600c:4e52:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-43ead8c33d6mr29300575e9.16.1743547095592; 
 Tue, 01 Apr 2025 15:38:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4294sm14934785f8f.89.2025.04.01.15.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 15:38:14 -0700 (PDT)
Message-ID: <4256338c-e547-4ec5-a72e-262d58f2a818@redhat.com>
Date: Wed, 2 Apr 2025 00:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] drm/i915/gem: Add i915_gem_object_panic_map()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-5-jfalempe@redhat.com> <Z-wmxijRKQiZFyup@intel.com>
 <Z-wo9W5SnvVQDEDt@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z-wo9W5SnvVQDEDt@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JvMrbNuL_-hEma0w-5ps7lPdZii-WVFjpie1lnFtN-A_1743547096
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

On 01/04/2025 19:57, Ville Syrjälä wrote:
> On Tue, Apr 01, 2025 at 08:47:50PM +0300, Ville Syrjälä wrote:
>> On Tue, Apr 01, 2025 at 02:51:10PM +0200, Jocelyn Falempe wrote:
>>> Prepare the work for drm_panic support. This is used to map the
>>> current framebuffer, so the CPU can overwrite it with the panic
>>> message.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>
>>> v5:
>>>   * Use iosys_map for intel_bo_panic_map().
>>>
>>>   drivers/gpu/drm/i915/display/intel_bo.c    |  5 ++++
>>>   drivers/gpu/drm/i915/display/intel_bo.h    |  1 +
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 29 ++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/display/intel_bo.c      | 10 ++++++++
>>>   5 files changed, 47 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
>>> index fbd16d7b58d9..ac904e9ec7d5 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_bo.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_bo.c
>>> @@ -57,3 +57,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
>>>   {
>>>   	i915_debugfs_describe_obj(m, to_intel_bo(obj));
>>>   }
>>> +
>>> +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
>>> +{
>>> +	i915_gem_object_panic_map(to_intel_bo(obj), map);
>>> +}
>>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
>>> index ea7a2253aaa5..5b6c63d99786 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_bo.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_bo.h
>>> @@ -23,5 +23,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
>>>   						   struct intel_frontbuffer *front);
>>>   
>>>   void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
>>> +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map);
>>>   
>>>   #endif /* __INTEL_BO__ */
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> index a5f34542135c..b16092707ea5 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> @@ -692,6 +692,8 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
>>>   int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
>>>   int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
>>>   
>>> +void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map);
>>> +
>>>   /**
>>>    * i915_gem_object_pin_map - return a contiguous mapping of the entire object
>>>    * @obj: the object to map into kernel address space
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>> index 8780aa243105..718bea6474d7 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>>> @@ -355,6 +355,35 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
>>>   	return vaddr ?: ERR_PTR(-ENOMEM);
>>>   }
>>>   
>>> +/* Map the current framebuffer for CPU access. Called from panic handler, so no
>>> + * need to pin or cleanup.
>>> + */
>>> +void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map)
>>> +{
>>> +	enum i915_map_type has_type;
>>> +	void *ptr;
>>> +
>>> +	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
>>> +
>>> +
>>> +	if (!ptr) {
>>> +		if (i915_gem_object_has_struct_page(obj))
>>> +			ptr = i915_gem_object_map_page(obj, I915_MAP_WB);
>>> +		else
>>> +			ptr = i915_gem_object_map_pfn(obj, I915_MAP_WB);
>>
>> WB mapping would require clflushing to make it to the display.
>> Is that being done somewhere?
> 
> This also seems to have a bunch of race conditions:
> - what happens if the oops happens before the pages have
>    even been swapped in?
> - what happens if the oops happens before we've committed
>    the fb to the hardware?
> 

The panic handler tries to take the panic_lock from the 
device->mode_config, which should ensure we're not in the middle of a 
page swap.

https://elixir.bootlin.com/linux/v6.14-rc6/source/include/drm/drm_panic.h#L70

https://elixir.bootlin.com/linux/v6.14-rc6/source/include/drm/drm_mode_config.h#L500

If the lock is already taken when the panic handler run, it will skip 
this device, and won't draw the panic screen on it.

Best regards,

-- 

Jocelyn

>>
>>> +
>>> +		if (IS_ERR(ptr))
>>> +			return;
>>
>> What happens when the mapping fails?
>>
>>> +
>>> +		obj->mm.mapping = page_pack_bits(ptr, I915_MAP_WB);
>>> +	}
>>> +
>>> +	if (i915_gem_object_has_iomem(obj))
>>> +		iosys_map_set_vaddr_iomem(map, (void __iomem *) ptr);
>>> +	else
>>> +		iosys_map_set_vaddr(map, ptr);
>>> +}
>>> +
>>>   /* get, pin, and map the pages of the object into kernel space */
>>>   void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>>>   			      enum i915_map_type type)
>>> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
>>> index 27437c22bd70..c68166a64336 100644
>>> --- a/drivers/gpu/drm/xe/display/intel_bo.c
>>> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
>>> @@ -59,3 +59,13 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
>>>   {
>>>   	/* FIXME */
>>>   }
>>> +
>>> +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
>>> +{
>>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>>> +	int ret;
>>> +
>>> +	ret = ttm_bo_vmap(&bo->ttm, map);
>>> +	if (ret)
>>> +		iosys_map_clear(map);
>>> +}
>>> -- 
>>> 2.49.0
>>
>> -- 
>> Ville Syrjälä
>> Intel
> 

