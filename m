Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7DC071C7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8260710E212;
	Fri, 24 Oct 2025 15:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="qWzwjfRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514FE10E211
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:55:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so375065e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761321331; x=1761926131;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bv7CrIX0J3ORvJ0y0l9bZBZQa6vmqTKACkbu/6ZXyTI=;
 b=qWzwjfRgI8NqA8qGoXpIlkeYWtD94v5cdW5Bgz5PphNIrywGZsfC4JKzZaMU1sqfD/
 zufhi2eohBPpg5uuSXpIuHDdESP79EDUXFkmM+5ysIGChgqVzABTxl1xacgv72Q8De+I
 M3Yh9iypPfeR04h3erUL0WfH0kB08R0Tu+vsf+2sJCgfvmcmCNE4PRrmp7gZzINcHhh+
 6DpcZNbj6bI7Ev5SVaX0Mr0VHh+HoSWsYYz7JSRi4aOARP0Q5idK/urbJjc6cE24FBQh
 wb2Pt5yE2TlD8RZSdCNyHLTgUEh6xAGlYpFdaB6QgMLKGCjpfpPIzMEoDcFnDFW8FlbD
 fLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761321331; x=1761926131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bv7CrIX0J3ORvJ0y0l9bZBZQa6vmqTKACkbu/6ZXyTI=;
 b=gzCRX3/MFTaMh6miWENcBs9HvIZz58CVGegTJBPSOGNQXjbOR5ZC+bF8yU+v4xT/Rg
 RSPMCBvhWzOYFh0z5+xaGR+ZKyG1onMTvkcCrWq80kgIN00ATNgSKg8/0FYu0tESVy/N
 FG21inH1qxMTMV1f6zTNTAd2lTe8Vorung71hYU44vM7QC97kR9kakASEWi8T8Ly6kR+
 qbDtCpNeTNB2zLsAlWnssw1RUY0CUj48Pv7hmChcCBFPE1TvVbMFNCs3XopAnKSRYYyD
 gnrmryQxXNIEzu1L3HJAF5cCYqBdP8bKHDS1SqJHMnacTt9xH7Qat/i7nS1G2aFbp/Tz
 C79Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJCqxI/coEkcqr9Ps0XeAKespwad7xRR3HFtL7AUpW1aeV/qDx8IzCnp1UnlQoyHSU9ZRz6HSvY+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHlCb3soWz6PZ60qVsJGFRKUk0+CYiccj5tjK/Sdcl436K8uPw
 xTAbY9SnYO4pCwcgXX4j53NPYqFoZRUkTJIgBdO2Zonn6vkrzS35qKivHYL9Fl7MqIA=
X-Gm-Gg: ASbGncsyGbOEdRawswo6HaLQDB7/8PREvQ94qJglLbSN9HvauI1jeB6922FNk9Y7NVP
 b0l+11ruOfwPf7EYeUG1yEVh7EK75XeSM0M3rkVlomAUfA2A7MFXJzHqqyc26fuCkpODg5sERWa
 9czWb+Rz77gxsMWBAsvJc+twkw4Gy7WjNFy/lrX6dpHiDY7iREzSUuE9Jv8YaL0Ge7mkpbhAXVr
 Yyxko1N3JQiBOb+yjzUwRg/cssrGtqwZinrdTRrlqzDe5CUiGoAK0udXUFz8hMtketznxwVWnWO
 LTF0RQMlYrJ0B5Q66t5QjggDUiZY7YHLX8nKkaYiwT2NkGCnF4LM+k5LNAwB/7i2x5Tvk3SYZtP
 SvOdnn1QxYa0IWK096TzTb1hkmtScyacwci0ud0ERY8WYOcgpP/vBUqKXjK4Ou+41OLlA1QGLUg
 BaUJabOAcAG0eYCFbBb+WMoEzyJg==
X-Google-Smtp-Source: AGHT+IGbPHvof2wEvJsHr7JShGUgytOsOPt3sc4p8XK2AbaR8H9uczr1U+606r/dbfMyPKW+oUkqIw==
X-Received: by 2002:a05:600c:8b0c:b0:46e:731b:db0f with SMTP id
 5b1f17b1804b1-47117912b5fmr245766765e9.28.1761321330855; 
 Fri, 24 Oct 2025 08:55:30 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4378cbesm152502145e9.16.2025.10.24.08.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 08:55:30 -0700 (PDT)
Message-ID: <fb6f4e12-6bef-4f72-abbe-b82de6c85282@ursulin.net>
Date: Fri, 24 Oct 2025 16:55:29 +0100
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <8384a735-9d90-4817-86a6-7b7bae81b6e2@suse.de>
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


On 24/10/2025 16:18, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.10.25 um 15:33 schrieb Jocelyn Falempe:
>> On 24/10/2025 14:40, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 24.10.25 um 13:53 schrieb Tvrtko Ursulin:
>>>>
>>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>>>>> ast driver for display, the graphic output is corrupted, and almost
>>>>> unusable.
>>>>>
>>>>> Adding a clflush call in the vmap function fixes this issue
>>>>> completely.
>>>>
>>>> AST is importing i915 allocated buffer in this use case, or how 
>>>> exactly is the relationship?
>>>>
>>>> Wondering if some path is not calling dma_buf_begin/end_cpu_access().
>>>
>>> Yes, ast doesn't call begin/end_cpu_access in [1].
>>>
>>> Jocelyn, if that fixes the issue, feel free to send me a patch for 
>>> review.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
>>> ast/ ast_mode.c
>>
>> I tried the following patch, but that doesn't fix the graphical issue:
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ 
>> ast_mode.c
>> index b4e8edc7c767..e50f95a4c8a9 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -564,6 +564,7 @@ static void 
>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>         struct drm_crtc_state *crtc_state = 
>> drm_atomic_get_new_crtc_state(state, crtc);
>>         struct drm_rect damage;
>>         struct drm_atomic_helper_damage_iter iter;
>> +       int ret;
>>
>>         if (!old_fb || (fb->format != old_fb->format) || crtc_state- 
>> >mode_changed) {
>>                 struct ast_crtc_state *ast_crtc_state = 
>> to_ast_crtc_state(crtc_state);
>> @@ -572,11 +573,16 @@ static void 
>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>                 ast_set_vbios_color_reg(ast, fb->format, 
>> ast_crtc_state->vmode);
>>         }
>>
>> +       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>> +       pr_info("AST begin_cpu_access %d\n", ret);
> 
> Presumably, you end up in [1]. I cannot find the cflush there or in [2]. 
> Maybe you need to add this call somewhere in there, similar to [3]. Just 
> guessing.

Near [2] clflush can happen at [4] *if* the driver thinks it is needed. 
Most GPUs are cache coherent so mostly it isn't. But if this is a 
Meteorlake machine (when I google Lenovo se100 it makes me think so?) 
then the userspace has some responsibility to manage things since there 
it is only 1-way coherency. Or userspace could have even told the driver 
to stay off in which case it then needs to manage everything. From the 
top of my head I am not sure how exactly this used to work, or how it is 
supposed to interact with exported buffers.

If this is indeed on Meteorlake, maybe Joonas or Rodrigo remember better 
how the special 1-way coherency is supposed to be managed there?

Regards,

Tvrtko

[4] 
https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/i915/gem/i915_gem_domain.c#L510

> [1] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
> i915/gem/i915_gem_dmabuf.c#L117
> [2] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
> i915/gem/i915_gem_domain.c#L493
> [3] https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ 
> i915/gem/i915_gem_object.c#L509
> 
>> +
>>         drm_atomic_helper_damage_iter_init(&iter, old_plane_state, 
>> plane_state);
>>         drm_atomic_for_each_plane_damage(&iter, &damage) {
>>                 ast_handle_damage(ast_plane, shadow_plane_state->data, 
>> fb, &damage);
>>         }
>>
>> +       drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>> +
>>         /*
>>          * Some BMCs stop scanning out the video signal after the driver
>>          * reprogrammed the offset. This stalls display output for 
>> several
>>
>>
>>
>> Best regards,
>>
> 

