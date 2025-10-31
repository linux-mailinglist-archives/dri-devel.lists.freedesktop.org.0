Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACDC26372
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DA610EB89;
	Fri, 31 Oct 2025 16:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KVVt2eXF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gxOdgOeI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KVVt2eXF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gxOdgOeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD07310EB89
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:50:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C81C1F387;
 Fri, 31 Oct 2025 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761929427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zq+dASARY8V+glfehaCrL3+HumvAcLxzoH8LuIedlM0=;
 b=KVVt2eXFPUt87hRq+slWMNvdL7H9SgYjWMu8xYnOUkPV493rnyzkBNxez140UVCHmCu7ZS
 LeX4bnYbF26gED3FWMiTjqGUQnBsnd3WgBr/m8rJ6kY2F8n/rtu+PsGVTWZPJw5aiFlrcx
 BijxXlAdj3mSHbX3G0+PMhnYs/GJ5yQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761929427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zq+dASARY8V+glfehaCrL3+HumvAcLxzoH8LuIedlM0=;
 b=gxOdgOeI1+KDFJ0w2olX4nboa0VT30EcfRUdnciTrun5EpCuWbRvVuHyV02uOp3BfZXucI
 ffbBY6VSbrx9GWCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761929427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zq+dASARY8V+glfehaCrL3+HumvAcLxzoH8LuIedlM0=;
 b=KVVt2eXFPUt87hRq+slWMNvdL7H9SgYjWMu8xYnOUkPV493rnyzkBNxez140UVCHmCu7ZS
 LeX4bnYbF26gED3FWMiTjqGUQnBsnd3WgBr/m8rJ6kY2F8n/rtu+PsGVTWZPJw5aiFlrcx
 BijxXlAdj3mSHbX3G0+PMhnYs/GJ5yQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761929427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zq+dASARY8V+glfehaCrL3+HumvAcLxzoH8LuIedlM0=;
 b=gxOdgOeI1+KDFJ0w2olX4nboa0VT30EcfRUdnciTrun5EpCuWbRvVuHyV02uOp3BfZXucI
 ffbBY6VSbrx9GWCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D87B13393;
 Fri, 31 Oct 2025 16:50:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wezdAdPoBGlTFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Oct 2025 16:50:27 +0000
Message-ID: <c6676e93-d277-4b71-b04c-c376df871041@suse.de>
Date: Fri, 31 Oct 2025 17:50:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
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
 <25bdae26-0952-458c-b0f9-ce8fb82aba68@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <25bdae26-0952-458c-b0f9-ce8fb82aba68@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ursulin.net,linux.intel.com,intel.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, bootlin.com:url,
 suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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

Hi

Am 31.10.25 um 16:04 schrieb Jocelyn Falempe:
> On 31/10/2025 14:12, Tvrtko Ursulin wrote:
>>
>> On 27/10/2025 10:26, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 27.10.25 um 10:46 schrieb Jocelyn Falempe:
>>>> On 24/10/2025 17:55, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 24/10/2025 16:18, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 24.10.25 um 15:33 schrieb Jocelyn Falempe:
>>>>>>> On 24/10/2025 14:40, Thomas Zimmermann wrote:
>>>>>>>> Hi
>>>>>>>>
>>>>>>>> Am 24.10.25 um 13:53 schrieb Tvrtko Ursulin:
>>>>>>>>>
>>>>>>>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>>>>>>>> On a lenovo se100 server, when using i915 GPU for rendering, 
>>>>>>>>>> and the
>>>>>>>>>> ast driver for display, the graphic output is corrupted, and 
>>>>>>>>>> almost
>>>>>>>>>> unusable.
>>>>>>>>>>
>>>>>>>>>> Adding a clflush call in the vmap function fixes this issue
>>>>>>>>>> completely.
>>>>>>>>>
>>>>>>>>> AST is importing i915 allocated buffer in this use case, or 
>>>>>>>>> how exactly is the relationship?
>>>>>>>>>
>>>>>>>>> Wondering if some path is not calling dma_buf_begin/ 
>>>>>>>>> end_cpu_access().
>>>>>>>>
>>>>>>>> Yes, ast doesn't call begin/end_cpu_access in [1].
>>>>>>>>
>>>>>>>> Jocelyn, if that fixes the issue, feel free to send me a patch 
>>>>>>>> for review.
>>>>>>>>
>>>>>>>> [1] 
>>>>>>>> https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/ 
>>>>>>>> drm/ ast/ ast_mode.c
>>>>>>>
>>>>>>> I tried the following patch, but that doesn't fix the graphical 
>>>>>>> issue:
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>>>>>> b/drivers/gpu/drm/ast/ ast_mode.c
>>>>>>> index b4e8edc7c767..e50f95a4c8a9 100644
>>>>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>>>>> @@ -564,6 +564,7 @@ static void 
>>>>>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>>>>>         struct drm_crtc_state *crtc_state = 
>>>>>>> drm_atomic_get_new_crtc_state(state, crtc);
>>>>>>>         struct drm_rect damage;
>>>>>>>         struct drm_atomic_helper_damage_iter iter;
>>>>>>> +       int ret;
>>>>>>>
>>>>>>>         if (!old_fb || (fb->format != old_fb->format) || 
>>>>>>> crtc_state- >mode_changed) {
>>>>>>>                 struct ast_crtc_state *ast_crtc_state = 
>>>>>>> to_ast_crtc_state(crtc_state);
>>>>>>> @@ -572,11 +573,16 @@ static void 
>>>>>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>>>>>                 ast_set_vbios_color_reg(ast, fb->format, 
>>>>>>> ast_crtc_state->vmode);
>>>>>>>         }
>>>>>>>
>>>>>>> +       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>>>>>> +       pr_info("AST begin_cpu_access %d\n", ret);
>>>>>>
>>>>>> Presumably, you end up in [1]. I cannot find the cflush there or 
>>>>>> in [2]. Maybe you need to add this call somewhere in there, 
>>>>>> similar to [3]. Just guessing.
>>>>>
>>>>> Near [2] clflush can happen at [4] *if* the driver thinks it is 
>>>>> needed. Most GPUs are cache coherent so mostly it isn't. But if 
>>>>> this is a Meteorlake machine (when I google Lenovo se100 it makes 
>>>>> me think so?) then the userspace has some responsibility to manage 
>>>>> things since there it is only 1-way coherency. Or userspace could 
>>>>> have even told the driver to stay off in which case it then needs 
>>>>> to manage everything. From the top of my head I am not sure how 
>>>>> exactly this used to work, or how it is supposed to interact with 
>>>>> exported buffers.
>>>>>
>>>>> If this is indeed on Meteorlake, maybe Joonas or Rodrigo remember 
>>>>> better how the special 1-way coherency is supposed to be managed 
>>>>> there?
>>>>
>>>> I've made an experiment, and if I add:
>>>>
>>>> * a calls to drm_gem_fb_begin_cpu_access() in the ast driver.
>>>> * and in i915_gem_domain.c flush_write_domain():
>>>>         case I915_GEM_DOMAIN_RENDER:
>>>> +               i915_gem_clflush_object(obj, I915_CLFLUSH_SYNC | 
>>>> I915_CLFLUSH_FORCE);
>>>>
>>>> Then that fixes the issue too.
>>>>
>>>> So I think there are two things to fix:
>>>>  * The missing call to drm_gem_fb_begin_cpu_access() in ast.
>>>
>>> Yes. We definitely want to add these calls, as they are expected for 
>>> this case.
>>
>> Browsing around a bit, I notice 
>> ast_primary_plane_helper_atomic_update() calls 
>> to_drm_shadow_plane_state() to get the source of the memcpy. Should 
>> there somewhere be calls to drm_gem_begin_shadow_fb_access() and 
>> drm_gem_end_shadow_fb_access()? Or those should be set as vfuncs by 
>> someone? Sorry I get lost easily in the DRM maze of 
>> helpers<->vfuncs<-  >helpers<->vfuncs..
>
> I've already submitted [1] for the ast driver.

Don't be confused by the similar naming. The shadow-plane functions do 
the vmap(). The cpu-access functions do the caching and DMA sync.

Best regards
Thomas

>
>>
>>>>  * The missing cache flush in i915 for the Arrowlake iGPU (but 
>>>> probably not the way I've done it).
>>>
>>> You call begin_cpu_access with DMA_FROM_DEVICE, but there's no 
>>> support for that flag in i915 AFAICT. Maybe this needs to be added 
>>> somehow?
>>
>> AFAIR the premise is GPU writes will not get stuck in the last level 
>> cache but I might be remembering a reverse of what Meteorlake 1-way 
>> coherency means. This area of the driver ended up a mess and was 
>> never properly cleaned up. I even had a series to try and do it but 
>> it never happened. We will need someone who actually remembers how 
>> Meteorlake works.
>
> Logically clflush() shouldn't have any effect, because it flushes the 
> CPU cache, and then ast is reading from the CPU.
> But from the tests, it also flushes the iGPU cache, and the iGPU cache 
> is not coherent with the CPU cache (at least for iGPU writes), or this 
> problem won't exist.
>
> I've the setup ready, and this is easily reproducible, so you can send 
> me patches, and I can quickly check if that works or not.
>
> [1] 
> https://lore.kernel.org/dri-devel/908ff7f7-cdf3-4596-9246-0100e4c15820@suse.de/T/#t
>
> Best regards,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


