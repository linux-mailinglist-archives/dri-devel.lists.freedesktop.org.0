Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACCC0CBDC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6D410E42C;
	Mon, 27 Oct 2025 09:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TgC4NdZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E4210E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761558401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4wurI99gUOh2Mn6wVPFu9NX3eU/CuHlWaPPmjMZRTk=;
 b=TgC4NdZfIowQ8UFIGzIVjKDcOIZOhhFfoXhSXrXghOeXg2h8JFznFwaqMVU/mATijq+iRG
 hkr2xJCstk8p/uufFyjZVBiuli753I6zV3CDzbmz8icxBxY2XtnxVPTy4+QLaCGCaPSjeq
 tcS6khmD0IDDv9atJden1ObZUXzN3RE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-zHJ8gbNaNxm8Ov3iWr2sDQ-1; Mon, 27 Oct 2025 05:46:40 -0400
X-MC-Unique: zHJ8gbNaNxm8Ov3iWr2sDQ-1
X-Mimecast-MFC-AGG-ID: zHJ8gbNaNxm8Ov3iWr2sDQ_1761558399
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-427015f62a7so1833357f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 02:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761558399; x=1762163199;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l4wurI99gUOh2Mn6wVPFu9NX3eU/CuHlWaPPmjMZRTk=;
 b=uT+3GK87qjD3keC+pFMRje0ZGvZoE/Gh+042kwl4o8LRzwXEVz7injG/UmuapfjKYZ
 /PpkL/KQZHQHKNXJa4gi9zvqStte9wnkYcCLlNQaGa33hZIF8e8xZ/zLB2kVdAHKMjax
 u1JK0JA2peE6cmGR+6v7smyf3MMBn9KYoHh8EnUO8cIONFMsYgXui7b1xS2UKnPhA2vL
 Ow6OGnLCelV7u5zifiQ6j6D0c7/JFUxBYcusOh1X+BRZxf9w7wVKIs8TJ39SEgojoQZJ
 STDtrqvN9MTqW2S7rdbmOi2VwyDD4chp6Jb7ML/5KflXnFI3OUAQLN/kIn93cBDrU3WQ
 KvJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4hgKJbMr7VO8bcstJIiB5oIQX/lTeOmxCzxncUTXyqv1aJGhpjQRlUPcafCkFxZ/9AQfUMCKCAFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpxmcvZ82xLxVQbkG5qtUgeOBrXpR3CPIqRLt/W24vgBKr3OcQ
 Cu6ld6chrq57EXohdE9BBT8t+nuVUnB8FSvOe49zOVsXK0SxM7+nQ2cT3Tlpza6kxtALWeDynUH
 +rD+exfAc7C/dE0v9NlicBPgict6h5YrdiHwpU4wIq6SNwQdvWT+m5BuhLUYepSJMZJ3eaA==
X-Gm-Gg: ASbGnctbGjBma32VBnMLeFNppbbJFiJceVOBcqjQ3mCB/LSrZQcGmfgvLHOoVMJWaEw
 YZycFOVnUTdXvFQE9IG2t+6a6YgyyIPqfOUDStP6JiR7G7JxMaRukWJkovNq45/r2e0MM3VcFmQ
 DFVvXsgWrmEv1FChGiS0Kh5ketsVMBy8Ix/i7nCSTjlL4J7wJ9otZD8oWK1JfcsEKwezp1gplIp
 Oc/Mbz3IGRozz8K4s/+CUjq/7kLSKzrUCqksdvx9Qaf0gbEXbQdUXxAiTtFNCmOVVKNK3QXPO5R
 5kXJ7u1CQkSMfWiX3xNrppxY9awOHyo61544D/r/SnEhh/EsOkj4uqBK+vMzF97EmZucQgywgSC
 AQEfVwwxeLLeNMmvkCXzezME6eebsAK1QZJFQ414=
X-Received: by 2002:a05:600c:1da7:b0:46e:4be1:a423 with SMTP id
 5b1f17b1804b1-4711786d630mr250739635e9.1.1761558398867; 
 Mon, 27 Oct 2025 02:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmG2A09IsQekmebDPjm1gYlh+OQD9B1tjk4etWgRoV57J4R1anljTnHFkbyV6hZPKaVaJEDA==
X-Received: by 2002:a05:600c:1da7:b0:46e:4be1:a423 with SMTP id
 5b1f17b1804b1-4711786d630mr250739395e9.1.1761558398455; 
 Mon, 27 Oct 2025 02:46:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a36easm127217165e9.10.2025.10.27.02.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 02:46:37 -0700 (PDT)
Message-ID: <70fe6101-4404-42d8-a1b5-0d22a11d8f67@redhat.com>
Date: Mon, 27 Oct 2025 10:46:36 +0100
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <fb6f4e12-6bef-4f72-abbe-b82de6c85282@ursulin.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tz7atX44m2zVgpF7W34gegAgplDeEqCPA_G_2h6dPeo_1761558399
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

On 24/10/2025 17:55, Tvrtko Ursulin wrote:
> 
> On 24/10/2025 16:18, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 24.10.25 um 15:33 schrieb Jocelyn Falempe:
>>> On 24/10/2025 14:40, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 24.10.25 um 13:53 schrieb Tvrtko Ursulin:
>>>>>
>>>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>>>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>>>>>> ast driver for display, the graphic output is corrupted, and almost
>>>>>> unusable.
>>>>>>
>>>>>> Adding a clflush call in the vmap function fixes this issue
>>>>>> completely.
>>>>>
>>>>> AST is importing i915 allocated buffer in this use case, or how 
>>>>> exactly is the relationship?
>>>>>
>>>>> Wondering if some path is not calling dma_buf_begin/end_cpu_access().
>>>>
>>>> Yes, ast doesn't call begin/end_cpu_access in [1].
>>>>
>>>> Jocelyn, if that fixes the issue, feel free to send me a patch for 
>>>> review.
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
>>>> ast/ ast_mode.c
>>>
>>> I tried the following patch, but that doesn't fix the graphical issue:
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ 
>>> ast_mode.c
>>> index b4e8edc7c767..e50f95a4c8a9 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -564,6 +564,7 @@ static void 
>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>         struct drm_crtc_state *crtc_state = 
>>> drm_atomic_get_new_crtc_state(state, crtc);
>>>         struct drm_rect damage;
>>>         struct drm_atomic_helper_damage_iter iter;
>>> +       int ret;
>>>
>>>         if (!old_fb || (fb->format != old_fb->format) || crtc_state- 
>>> >mode_changed) {
>>>                 struct ast_crtc_state *ast_crtc_state = 
>>> to_ast_crtc_state(crtc_state);
>>> @@ -572,11 +573,16 @@ static void 
>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>                 ast_set_vbios_color_reg(ast, fb->format, 
>>> ast_crtc_state->vmode);
>>>         }
>>>
>>> +       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>> +       pr_info("AST begin_cpu_access %d\n", ret);
>>
>> Presumably, you end up in [1]. I cannot find the cflush there or in 
>> [2]. Maybe you need to add this call somewhere in there, similar to 
>> [3]. Just guessing.
> 
> Near [2] clflush can happen at [4] *if* the driver thinks it is needed. 
> Most GPUs are cache coherent so mostly it isn't. But if this is a 
> Meteorlake machine (when I google Lenovo se100 it makes me think so?) 
> then the userspace has some responsibility to manage things since there 
> it is only 1-way coherency. Or userspace could have even told the driver 
> to stay off in which case it then needs to manage everything. From the 
> top of my head I am not sure how exactly this used to work, or how it is 
> supposed to interact with exported buffers.
> 
> If this is indeed on Meteorlake, maybe Joonas or Rodrigo remember better 
> how the special 1-way coherency is supposed to be managed there?

I've made an experiment, and if I add:

* a calls to drm_gem_fb_begin_cpu_access() in the ast driver.
* and in i915_gem_domain.c flush_write_domain():
         case I915_GEM_DOMAIN_RENDER:
+               i915_gem_clflush_object(obj, I915_CLFLUSH_SYNC | 
I915_CLFLUSH_FORCE);

Then that fixes the issue too.

So I think there are two things to fix:
  * The missing call to drm_gem_fb_begin_cpu_access() in ast.
  * The missing cache flush in i915 for the Arrowlake iGPU (but probably 
not the way I've done it).

Regards,

-- 

Jocelyn

> 
> Regards,
> 
> Tvrtko
> 
> [4] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
> i915/gem/i915_gem_domain.c#L510
> 
>> [1] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
>> i915/gem/i915_gem_dmabuf.c#L117
>> [2] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
>> i915/gem/i915_gem_domain.c#L493
>> [3] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
>> i915/gem/i915_gem_object.c#L509
>>
>>> +
>>>         drm_atomic_helper_damage_iter_init(&iter, old_plane_state, 
>>> plane_state);
>>>         drm_atomic_for_each_plane_damage(&iter, &damage) {
>>>                 ast_handle_damage(ast_plane, shadow_plane_state- 
>>> >data, fb, &damage);
>>>         }
>>>
>>> +       drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>>> +
>>>         /*
>>>          * Some BMCs stop scanning out the video signal after the driver
>>>          * reprogrammed the offset. This stalls display output for 
>>> several
>>>
>>>
>>>
>>> Best regards,
>>>
>>
> 

