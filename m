Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3123C25357
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D264C10EB36;
	Fri, 31 Oct 2025 13:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="l7zRKTAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D0810EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:12:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so19390375e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761916375; x=1762521175;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qNX6KVX2q+PDu84U/XKuqBODfvtpJV43jMXyUpGBL08=;
 b=l7zRKTAVEgdGT5QgFXb1Ym3aXagtNqi7MQkaQ6QyHhL658ZaF3OMHPh6Vb1Mz3U5TO
 7HLn8S8jdub94LPiUsvFUw5z/jql4AMsb9AG4+/cywjgogWcmdJXXUpxDBTLyC9ugAMy
 zJQdo8RZ068Mr681gAH1KCN0ut352FowfUC+ZILvYSDgKF98r1BsbFjx5txM9fNkvH8/
 JTh1u0/dldJL1bCRG8Lq8N+DZ4JGPR2KPeOqvQoFbuv1OVd0sOziS8jqqmq35irZV5Ou
 k7tljhYQmSaJJld58Adgb0pFTKFVB0Z/mvRw48QJs6KZMASFvlL88CEGMkBFFRcCkDPN
 u/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761916375; x=1762521175;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qNX6KVX2q+PDu84U/XKuqBODfvtpJV43jMXyUpGBL08=;
 b=rfRmBfIJnkwWysY/Sujzcp2JYu4OSQFjGQKIB4rqPyVef88ytgPJUrZFYajoIVHwbb
 juz/qlMpDu2WEpyAMJNqJ6/2ZDzzt7qGbOuawHt4YptJN7Kz3Pz6pU5/b5pnn3x3ZAKF
 D2v0/VJxjvYoidWkN0bAlouw848pYZT5qB4NPfu9XkAoGEuzXgyVxsumhDUoizggKy43
 J5a7fneym6IodMGcE7DSnYYUfYroQSNYLX8Gvf5hPqCDFrOsO2yiO5gJOQEICZPK2IAu
 CfHW5r3+9VReexrpYLdkoVNL6SCJYuDccWn9u1a0sw0VuCMSZbOUoloL3Q8thLpb0lI2
 A+GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUdY3rZdqLa4w8FScwQPPMphFP1PeusRDGle/AB6gfnIeTgQDSRbEdjhtQFAHWZqKLg240siFDkxM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLyTh/igFz40RMazg4rw62+XaHx4WJugudFJjVmte3lvF168Xf
 pMi9/d2Hz34A29ScKiaAJ7SAVg8fCIolP9DEH3AlJHh9Hv7IjTlYUIce7Gh9rcJy1Ns=
X-Gm-Gg: ASbGncuNj/6PwHbYT0DlxBKFT2Guvlon8Ph/wyqQ3ZZ2FaODLrLxpiha0PPLD8dV36Q
 zr9jlBOXvrrwc8NC2KoBMF+RsrAEHNAOaDe/jsQCkhIAozUQ44MS8S+NSnPQLhQZR8qFwb2kPBx
 tQLuoiklah7n/A9CTUY+kyvBr1e16dzGfs5pM3B36t0KEseUbC0iCXRzeLuKqggGfKE8pu0/Tr8
 IV04SY6HaHbnTDSy5HSzr5EQgPF1yk6ouatZUYH6YuyvoPqlVx3y/6qsC72genpx5W9Eep8PzeZ
 me4+gQGyRsmTiul2uAzY2fpDX1pK+PZiXVPg6BNNx2gwc5RT7vpbljBK6BvVmhAQiXlgJV4VH2R
 +pFl8p9Sxypk8hOEUySW9k43A6hSfyUbvdyiV5EhTQpe5eMF1P1v/1xOa4xMlWIJ/gLH94fEhLy
 7Yqq/ao/fbM5uZ+zAv
X-Google-Smtp-Source: AGHT+IGvJ4sKk1W5UvLUKiJV8ymzexXWGjytfB8WkCGAXgvIDnyQNsS7gF8HDUe265tffTW7EbBNWQ==
X-Received: by 2002:a5d:5c84:0:b0:429:9501:c9c1 with SMTP id
 ffacd0b85a97d-429bd6e16d4mr3017033f8f.46.1761916375087; 
 Fri, 31 Oct 2025 06:12:55 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c54efcadsm173675f8f.5.2025.10.31.06.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 06:12:54 -0700 (PDT)
Message-ID: <8c91e311-cef1-4018-88e0-a22f289d7983@ursulin.net>
Date: Fri, 31 Oct 2025 13:12:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <a90547e6-c05b-4e1c-be5f-2898b516abcc@suse.de>
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


On 27/10/2025 10:26, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.10.25 um 10:46 schrieb Jocelyn Falempe:
>> On 24/10/2025 17:55, Tvrtko Ursulin wrote:
>>>
>>> On 24/10/2025 16:18, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 24.10.25 um 15:33 schrieb Jocelyn Falempe:
>>>>> On 24/10/2025 14:40, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 24.10.25 um 13:53 schrieb Tvrtko Ursulin:
>>>>>>>
>>>>>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>>>>>> On a lenovo se100 server, when using i915 GPU for rendering, and 
>>>>>>>> the
>>>>>>>> ast driver for display, the graphic output is corrupted, and almost
>>>>>>>> unusable.
>>>>>>>>
>>>>>>>> Adding a clflush call in the vmap function fixes this issue
>>>>>>>> completely.
>>>>>>>
>>>>>>> AST is importing i915 allocated buffer in this use case, or how 
>>>>>>> exactly is the relationship?
>>>>>>>
>>>>>>> Wondering if some path is not calling dma_buf_begin/ 
>>>>>>> end_cpu_access().
>>>>>>
>>>>>> Yes, ast doesn't call begin/end_cpu_access in [1].
>>>>>>
>>>>>> Jocelyn, if that fixes the issue, feel free to send me a patch for 
>>>>>> review.
>>>>>>
>>>>>> [1] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/ 
>>>>>> drm/ ast/ ast_mode.c
>>>>>
>>>>> I tried the following patch, but that doesn't fix the graphical issue:
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ 
>>>>> ast_mode.c
>>>>> index b4e8edc7c767..e50f95a4c8a9 100644
>>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>>> @@ -564,6 +564,7 @@ static void 
>>>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>>>         struct drm_crtc_state *crtc_state = 
>>>>> drm_atomic_get_new_crtc_state(state, crtc);
>>>>>         struct drm_rect damage;
>>>>>         struct drm_atomic_helper_damage_iter iter;
>>>>> +       int ret;
>>>>>
>>>>>         if (!old_fb || (fb->format != old_fb->format) || 
>>>>> crtc_state- >mode_changed) {
>>>>>                 struct ast_crtc_state *ast_crtc_state = 
>>>>> to_ast_crtc_state(crtc_state);
>>>>> @@ -572,11 +573,16 @@ static void 
>>>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>>>                 ast_set_vbios_color_reg(ast, fb->format, 
>>>>> ast_crtc_state->vmode);
>>>>>         }
>>>>>
>>>>> +       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>>>> +       pr_info("AST begin_cpu_access %d\n", ret);
>>>>
>>>> Presumably, you end up in [1]. I cannot find the cflush there or in 
>>>> [2]. Maybe you need to add this call somewhere in there, similar to 
>>>> [3]. Just guessing.
>>>
>>> Near [2] clflush can happen at [4] *if* the driver thinks it is 
>>> needed. Most GPUs are cache coherent so mostly it isn't. But if this 
>>> is a Meteorlake machine (when I google Lenovo se100 it makes me think 
>>> so?) then the userspace has some responsibility to manage things 
>>> since there it is only 1-way coherency. Or userspace could have even 
>>> told the driver to stay off in which case it then needs to manage 
>>> everything. From the top of my head I am not sure how exactly this 
>>> used to work, or how it is supposed to interact with exported buffers.
>>>
>>> If this is indeed on Meteorlake, maybe Joonas or Rodrigo remember 
>>> better how the special 1-way coherency is supposed to be managed there?
>>
>> I've made an experiment, and if I add:
>>
>> * a calls to drm_gem_fb_begin_cpu_access() in the ast driver.
>> * and in i915_gem_domain.c flush_write_domain():
>>         case I915_GEM_DOMAIN_RENDER:
>> +               i915_gem_clflush_object(obj, I915_CLFLUSH_SYNC | 
>> I915_CLFLUSH_FORCE);
>>
>> Then that fixes the issue too.
>>
>> So I think there are two things to fix:
>>  * The missing call to drm_gem_fb_begin_cpu_access() in ast.
> 
> Yes. We definitely want to add these calls, as they are expected for 
> this case.

Browsing around a bit, I notice ast_primary_plane_helper_atomic_update() 
calls to_drm_shadow_plane_state() to get the source of the memcpy. 
Should there somewhere be calls to drm_gem_begin_shadow_fb_access() and 
drm_gem_end_shadow_fb_access()? Or those should be set as  vfuncs by 
someone? Sorry I get lost easily in the DRM maze of 
helpers<->vfuncs<->helpers<->vfuncs..

>>  * The missing cache flush in i915 for the Arrowlake iGPU (but 
>> probably not the way I've done it).
> 
> You call begin_cpu_access with DMA_FROM_DEVICE, but there's no support 
> for that flag in i915 AFAICT. Maybe this needs to be added somehow?

AFAIR the premise is GPU writes will not get stuck in the last level 
cache but I might be remembering a reverse of what Meteorlake 1-way 
coherency means. This area of the driver ended up a mess and was never 
properly cleaned up. I even had a series to try and do it but it never 
happened. We will need someone who actually remembers how Meteorlake works.

Regards,

Tvrtko

