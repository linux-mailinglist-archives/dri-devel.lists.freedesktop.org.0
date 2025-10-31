Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31002C25BD9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137810E2D0;
	Fri, 31 Oct 2025 15:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I9AbAObB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE8C10E2C8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761923080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6HVqMT3UbNiUK5ev+9yaW4GCf8Ri2nqGAuG6YYfgMw=;
 b=I9AbAObBXnTsWEDT9t6dEa9XLdduv+i2E8aefN0gz6uJOVgZLfzdi7pA+Li7bLh+kKINHh
 kkK+1Pm62MNP+a8YTzt1XwCA/1iHZ3jfl0+TlLIWhJxUKFoHwE+iTabWZMN6ITmsfVtiVn
 fuKO5qmbOd1+KttpCVVJgQIBc4QntF0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-nWnE9x-fMgCD426W3H8_5Q-1; Fri, 31 Oct 2025 11:04:39 -0400
X-MC-Unique: nWnE9x-fMgCD426W3H8_5Q-1
X-Mimecast-MFC-AGG-ID: nWnE9x-fMgCD426W3H8_5Q_1761923077
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42851b6a659so1414667f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761923077; x=1762527877;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6HVqMT3UbNiUK5ev+9yaW4GCf8Ri2nqGAuG6YYfgMw=;
 b=hv75DuRr01B8FmOP6aHOUgbTGQBGKtQaD7kbMuZAqFkG0CVaeXWp+aXFSHMH4jck1X
 bVlQ8AsJft8KkutwcaFGs54+lBHvRAIJJAKDvmM8CVbigP1Vo5iOrNmvRt3/T+473IBk
 0VLSxkPAj3AH0yIG66eRvIReX10pNFviXju3UyCHBARUayct6grgxvMmi4bcCOwUNyeX
 X+wBvptywflrsaFdxalyKrwDYk8fcUutIDyfctyJeZdfq49m8kxGYhlTrf2jG1qzuNKm
 YJNdCIhtYn5yIQBTFbrNUjGGu/tad9jO5Ho0fZyF93ZvLmUqpXQeT59+A33GQpp8s1MI
 mdoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVVXMIKa7k6qzYSvk73xVWHIoNPlKIVVV1KUkyh7jH136qNufkAyWY73KCuG7dR86h4NvzD05nUeI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy64bMjuUrTV7DAqoxTBRMRDHN1HEesyHIiAC8SLtaLF9ogfrS3
 mdAs5bRXFdzHb6v+AI4yHbSCRfgWiaFF6RnOdOyVYJGkWXa+Wk3+z/77vuSe/NYf5Y8BtLrb/D+
 k7y4t9Rmy9mMtGtf1Aoau+TM65Sq37kjbTuV5G70P83of1ul+zAEb3e72/+eVbk22R2WMvg==
X-Gm-Gg: ASbGncuo5qe5FmK7deJmPSwAsy4586eWEoSWb8hyKA3b6UUXOirLXUFWptp/TUaeBK3
 PIkWAHvTrk8rO8tEpNWNb7BOGDu0vos4vtaJDBX5EUnlWKzpZ3Q5B8EmCgNadS3ouQL7FS30Fhk
 WxehPPeehNFUJpYF+oloctv7cYsdXIf+wVb/WWTgewhJ7+5Br3wZMlv9LxlP+iFJXtTAXI9Nr3Q
 MkGxlu0PLtR5+j/Jp8EJPnTE3Hk+301N6HirTOQ1+GmIY1ZbDQU03MyWyzZb00qed/xyBLpbjeH
 myWRX9vogKrEN/5T03DVrKK0vFZot8dVazdnFgMjqYrKXLPedUJ2mHKntrOoF3bCY+8Q1ioOIno
 kXqnwddtKIW4Nub/uOeOj3UcJ9CvXsdO4aNZWvas=
X-Received: by 2002:a05:6000:430d:b0:429:b958:2189 with SMTP id
 ffacd0b85a97d-429bd6800c2mr3175071f8f.16.1761923076355; 
 Fri, 31 Oct 2025 08:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2u7Aig/lRm0VVOVtJcRsWaLJsYZWgdc32IN9HRTgAfdUPOMDoaWpc679EJl+aUt8SIaCBNQ==
X-Received: by 2002:a05:6000:430d:b0:429:b958:2189 with SMTP id
 ffacd0b85a97d-429bd6800c2mr3175024f8f.16.1761923075554; 
 Fri, 31 Oct 2025 08:04:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13eae16sm4016682f8f.32.2025.10.31.08.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 08:04:35 -0700 (PDT)
Message-ID: <25bdae26-0952-458c-b0f9-ce8fb82aba68@redhat.com>
Date: Fri, 31 Oct 2025 16:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251024110432.1313391-1-jfalempe@redhat.com>
 <a1d6cf1f-02b6-4c89-84e2-4b2af39829ef@ursulin.net>
 <d123d897-8e65-417b-ad3f-40fe5b49f2b1@suse.de>
 <5ae02bda-0732-4dd4-827e-9e2dac7ae6bd@redhat.com>
 <8384a735-9d90-4817-86a6-7b7bae81b6e2@suse.de>
 <fb6f4e12-6bef-4f72-abbe-b82de6c85282@ursulin.net>
 <70fe6101-4404-42d8-a1b5-0d22a11d8f67@redhat.com>
 <a90547e6-c05b-4e1c-be5f-2898b516abcc@suse.de>
 <8c91e311-cef1-4018-88e0-a22f289d7983@ursulin.net>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <8c91e311-cef1-4018-88e0-a22f289d7983@ursulin.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0oTFwDp-dPgS-o4LejgsyQaJ4xDfHY6eawhUO09WhBw_1761923077
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

On 31/10/2025 14:12, Tvrtko Ursulin wrote:
> 
> On 27/10/2025 10:26, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 27.10.25 um 10:46 schrieb Jocelyn Falempe:
>>> On 24/10/2025 17:55, Tvrtko Ursulin wrote:
>>>>
>>>> On 24/10/2025 16:18, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 24.10.25 um 15:33 schrieb Jocelyn Falempe:
>>>>>> On 24/10/2025 14:40, Thomas Zimmermann wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>> Am 24.10.25 um 13:53 schrieb Tvrtko Ursulin:
>>>>>>>>
>>>>>>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>>>>>>> On a lenovo se100 server, when using i915 GPU for rendering, 
>>>>>>>>> and the
>>>>>>>>> ast driver for display, the graphic output is corrupted, and 
>>>>>>>>> almost
>>>>>>>>> unusable.
>>>>>>>>>
>>>>>>>>> Adding a clflush call in the vmap function fixes this issue
>>>>>>>>> completely.
>>>>>>>>
>>>>>>>> AST is importing i915 allocated buffer in this use case, or how 
>>>>>>>> exactly is the relationship?
>>>>>>>>
>>>>>>>> Wondering if some path is not calling dma_buf_begin/ 
>>>>>>>> end_cpu_access().
>>>>>>>
>>>>>>> Yes, ast doesn't call begin/end_cpu_access in [1].
>>>>>>>
>>>>>>> Jocelyn, if that fixes the issue, feel free to send me a patch 
>>>>>>> for review.
>>>>>>>
>>>>>>> [1] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/ 
>>>>>>> drm/ ast/ ast_mode.c
>>>>>>
>>>>>> I tried the following patch, but that doesn't fix the graphical 
>>>>>> issue:
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ 
>>>>>> ast_mode.c
>>>>>> index b4e8edc7c767..e50f95a4c8a9 100644
>>>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>>>> @@ -564,6 +564,7 @@ static void 
>>>>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>>>>         struct drm_crtc_state *crtc_state = 
>>>>>> drm_atomic_get_new_crtc_state(state, crtc);
>>>>>>         struct drm_rect damage;
>>>>>>         struct drm_atomic_helper_damage_iter iter;
>>>>>> +       int ret;
>>>>>>
>>>>>>         if (!old_fb || (fb->format != old_fb->format) || 
>>>>>> crtc_state- >mode_changed) {
>>>>>>                 struct ast_crtc_state *ast_crtc_state = 
>>>>>> to_ast_crtc_state(crtc_state);
>>>>>> @@ -572,11 +573,16 @@ static void 
>>>>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>>>>                 ast_set_vbios_color_reg(ast, fb->format, 
>>>>>> ast_crtc_state->vmode);
>>>>>>         }
>>>>>>
>>>>>> +       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>>>>> +       pr_info("AST begin_cpu_access %d\n", ret);
>>>>>
>>>>> Presumably, you end up in [1]. I cannot find the cflush there or in 
>>>>> [2]. Maybe you need to add this call somewhere in there, similar to 
>>>>> [3]. Just guessing.
>>>>
>>>> Near [2] clflush can happen at [4] *if* the driver thinks it is 
>>>> needed. Most GPUs are cache coherent so mostly it isn't. But if this 
>>>> is a Meteorlake machine (when I google Lenovo se100 it makes me 
>>>> think so?) then the userspace has some responsibility to manage 
>>>> things since there it is only 1-way coherency. Or userspace could 
>>>> have even told the driver to stay off in which case it then needs to 
>>>> manage everything. From the top of my head I am not sure how exactly 
>>>> this used to work, or how it is supposed to interact with exported 
>>>> buffers.
>>>>
>>>> If this is indeed on Meteorlake, maybe Joonas or Rodrigo remember 
>>>> better how the special 1-way coherency is supposed to be managed there?
>>>
>>> I've made an experiment, and if I add:
>>>
>>> * a calls to drm_gem_fb_begin_cpu_access() in the ast driver.
>>> * and in i915_gem_domain.c flush_write_domain():
>>>         case I915_GEM_DOMAIN_RENDER:
>>> +               i915_gem_clflush_object(obj, I915_CLFLUSH_SYNC | 
>>> I915_CLFLUSH_FORCE);
>>>
>>> Then that fixes the issue too.
>>>
>>> So I think there are two things to fix:
>>>  * The missing call to drm_gem_fb_begin_cpu_access() in ast.
>>
>> Yes. We definitely want to add these calls, as they are expected for 
>> this case.
> 
> Browsing around a bit, I notice ast_primary_plane_helper_atomic_update() 
> calls to_drm_shadow_plane_state() to get the source of the memcpy. 
> Should there somewhere be calls to drm_gem_begin_shadow_fb_access() and 
> drm_gem_end_shadow_fb_access()? Or those should be set as  vfuncs by 
> someone? Sorry I get lost easily in the DRM maze of helpers<->vfuncs<- 
>  >helpers<->vfuncs..

I've already submitted [1] for the ast driver.

> 
>>>  * The missing cache flush in i915 for the Arrowlake iGPU (but 
>>> probably not the way I've done it).
>>
>> You call begin_cpu_access with DMA_FROM_DEVICE, but there's no support 
>> for that flag in i915 AFAICT. Maybe this needs to be added somehow?
> 
> AFAIR the premise is GPU writes will not get stuck in the last level 
> cache but I might be remembering a reverse of what Meteorlake 1-way 
> coherency means. This area of the driver ended up a mess and was never 
> properly cleaned up. I even had a series to try and do it but it never 
> happened. We will need someone who actually remembers how Meteorlake works.

Logically clflush() shouldn't have any effect, because it flushes the 
CPU cache, and then ast is reading from the CPU.
But from the tests, it also flushes the iGPU cache, and the iGPU cache 
is not coherent with the CPU cache (at least for iGPU writes), or this 
problem won't exist.

I've the setup ready, and this is easily reproducible, so you can send 
me patches, and I can quickly check if that works or not.

[1] 
https://lore.kernel.org/dri-devel/908ff7f7-cdf3-4596-9246-0100e4c15820@suse.de/T/#t

Best regards,

-- 

Jocelyn


> 
> Regards,
> 
> Tvrtko
> 

