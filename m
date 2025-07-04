Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E69AF929F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B4B10EA1C;
	Fri,  4 Jul 2025 12:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Dgc/a1lZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NZw5n9wz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dgc/a1lZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NZw5n9wz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11E710EA18
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 12:31:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5585E21172;
 Fri,  4 Jul 2025 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751632280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X9QbCr2bHk5aDZv/OKGH9Uvd6J29D96g17XlBrgClVE=;
 b=Dgc/a1lZ1L0rayQiEfsAadt1JtmxEzMt4Kw19yk7tV1forJzJgmeMFogjZRGwwtWvj5gDS
 watHBG64uzGqP1DpgJco6VAKadF0Ty/4z/yqo608GupyIO59/C+MrnILGK0au+XAHrSzH5
 eOjBOlsG/R6ys+BPQMG5OlwfnCFWtZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751632280;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X9QbCr2bHk5aDZv/OKGH9Uvd6J29D96g17XlBrgClVE=;
 b=NZw5n9wzN+R9s13HrdBenO9iuNcqvrc/VBsuD3EmvrICp3lAo8EOxWOFYnzxG2J+5Qvdnv
 /xFknqi/aM7xQQCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751632280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X9QbCr2bHk5aDZv/OKGH9Uvd6J29D96g17XlBrgClVE=;
 b=Dgc/a1lZ1L0rayQiEfsAadt1JtmxEzMt4Kw19yk7tV1forJzJgmeMFogjZRGwwtWvj5gDS
 watHBG64uzGqP1DpgJco6VAKadF0Ty/4z/yqo608GupyIO59/C+MrnILGK0au+XAHrSzH5
 eOjBOlsG/R6ys+BPQMG5OlwfnCFWtZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751632280;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X9QbCr2bHk5aDZv/OKGH9Uvd6J29D96g17XlBrgClVE=;
 b=NZw5n9wzN+R9s13HrdBenO9iuNcqvrc/VBsuD3EmvrICp3lAo8EOxWOFYnzxG2J+5Qvdnv
 /xFknqi/aM7xQQCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F205F13A71;
 Fri,  4 Jul 2025 12:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id x9yvOZfJZ2hLVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Jul 2025 12:31:19 +0000
Message-ID: <621b4efc-dd71-4eb1-b81a-f0551ef38257@suse.de>
Date: Fri, 4 Jul 2025 14:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/framebuffer: Acquire internal references on GEM
 handles
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 asrivats@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org, Bert Karwatzki <spasswolf@web.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250704085541.28165-1-tzimmermann@suse.de>
 <2be81e33-91f3-49f2-9293-231d48af381c@amd.com>
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
In-Reply-To: <2be81e33-91f3-49f2-9293-231d48af381c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,web.de];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TAGGED_RCPT(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,web.de,linaro.org,vger.kernel.org,lists.linaro.org];
 FREEMAIL_TO(0.00)[amd.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, linaro.org:email,
 intel.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Am 04.07.25 um 14:06 schrieb Christian König:
> On 04.07.25 10:53, Thomas Zimmermann wrote:
>> Acquire GEM handles in drm_framebuffer_init() and release them in
>> the corresponding drm_framebuffer_cleanup(). Ties the handle's
>> lifetime to the framebuffer. Not all GEM buffer objects have GEM
>> handles. If not set, no refcounting takes place. This is the case
>> for some fbdev emulation. This is not a problem as these GEM objects
>> do not use dma-bufs and drivers will not release them while fbdev
>> emulation is running.
>>
>> As all drivers use drm_framebuffer_init(), they will now all hold
>> dma-buf references as fixed in commit 5307dce878d4 ("drm/gem: Acquire
>> references on GEM handles for framebuffers").
>>
>> In the GEM framebuffer helpers, restore the original ref counting
>> on buffer objects. As the helpers for handle refcounting are now
>> no longer called from outside the DRM core, unexport the symbols.
>>
>> Gma500 (unnecessarily) clears the framebuffer's GEM-object pointer
>> before calling drm_framebuffer_cleanup(). Remove these lines to
>> make it consistent with the rest of the drivers. It's one of the
>> fbdev emulations with no GEM handle on their buffers. The change
>> to gma500 is therefore rather cosmetic.
> Could we separate that change out? I mean we want to backport the patch.

Sure. gma500 doesn't use handles for its fbdev emulation. So nothing 
changes.

>
>> Tested on i915, amdgpu (by Bert) and gma500. Also tested on i915
>> plus udl for the original problem with dma-buf sharing.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 5307dce878d4 ("drm/gem: Acquire references on GEM handles for framebuffers")
>> Reported-by: Bert Karwatzki <spasswolf@web.de>
>> Closes: https://lore.kernel.org/dri-devel/20250703115915.3096-1-spasswolf@web.de/
>> Tested-by: Bert Karwatzki <spasswolf@web.de>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/gpu/drm/drm_framebuffer.c            | 23 +++++++-
>>   drivers/gpu/drm/drm_gem.c                    | 59 +++++++++++++-------
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++---
>>   drivers/gpu/drm/drm_internal.h               |  4 +-
>>   drivers/gpu/drm/gma500/fbdev.c               |  2 -
>>   5 files changed, 69 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
>> index b781601946db..e4a10dd053fc 100644
>> --- a/drivers/gpu/drm/drm_framebuffer.c
>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>> @@ -862,11 +862,17 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_free);
>>   int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>   			 const struct drm_framebuffer_funcs *funcs)
>>   {
>> +	unsigned int i;
>>   	int ret;
>>   
>>   	if (WARN_ON_ONCE(fb->dev != dev || !fb->format))
>>   		return -EINVAL;
>>   
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		if (fb->obj[i])
>> +			drm_gem_object_handle_get_if_exists_unlocked(fb->obj[i]);
>> +	}
>> +
>>   	INIT_LIST_HEAD(&fb->filp_head);
>>   
>>   	fb->funcs = funcs;
>> @@ -875,7 +881,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>   	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>>   				    false, drm_framebuffer_free);
>>   	if (ret)
>> -		goto out;
>> +		goto err;
>>   
>>   	mutex_lock(&dev->mode_config.fb_lock);
>>   	dev->mode_config.num_fb++;
>> @@ -883,7 +889,14 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>>   	mutex_unlock(&dev->mode_config.fb_lock);
>>   
>>   	drm_mode_object_register(dev, &fb->base);
>> -out:
>> +
>> +	return 0;
>> +
>> +err:
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		if (fb->obj[i])
>> +			drm_gem_object_handle_put_if_exists_unlocked(fb->obj[i]);
>> +	}
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_framebuffer_init);
>> @@ -960,6 +973,12 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
>>   void drm_framebuffer_cleanup(struct drm_framebuffer *fb)
>>   {
>>   	struct drm_device *dev = fb->dev;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < fb->format->num_planes; i++) {
>> +		if (fb->obj[i])
>> +			drm_gem_object_handle_put_if_exists_unlocked(fb->obj[i]);
>> +	}
> That goes boom as soon as somebody grabs a GEM handle for the FB used for fbdev emulation (which is perfectly possible with the UAPI but not done currently as far as I know).

My uninformed question: how so? I thought userspace gets the handle from 
allocating buffers (e.g., CREATE_DUMB or driver ioctl). That object 
would be distinct from the fbdev object.

>
> It's probably ok for a bug fix we are going to backport, but a more robust long term solution is really desired here I think.

There are only 4 GEM objects per framebuffer at most. So we could flag 
each plane with a bit in struct drm_framebuffer.flags when we acquire 
the handle in drm_framebuffer_init(). _cleanup() would then only unref 
those with the flag set. Does that work?

Best regards
Thomas

>
> Regards,
> Christian.
>
>>   
>>   	mutex_lock(&dev->mode_config.fb_lock);
>>   	list_del(&fb->head);
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index bc505d938b3e..9d8b9e6b7d25 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -224,23 +224,27 @@ static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>>   }
>>   
>>   /**
>> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>> + * drm_gem_object_handle_get_if_exists_unlocked - acquire reference on user-space handle, if any
>>    * @obj: GEM object
>>    *
>> - * Acquires a reference on the GEM buffer object's handle. Required
>> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>> - * to release the reference.
>> + * Acquires a reference on the GEM buffer object's handle. Required to keep
>> + * the GEM object alive. Call drm_gem_object_handle_put_if_exists_unlocked()
>> + * to release the reference. Does nothing if the buffer object has no handle.
>>    */
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>> +void drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj)
>>   {
>>   	struct drm_device *dev = obj->dev;
>>   
>>   	guard(mutex)(&dev->object_name_lock);
>>   
>> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>> -	drm_gem_object_handle_get(obj);
>> +	/*
>> +	 * First ref taken during GEM object creation, if any. Some
>> +	 * drivers set up internal framebuffers with GEM objects that
>> +	 * do not have a GEM handle. Hence, this counter can be zero.
>> +	 */
>> +	if (obj->handle_count)
>> +		drm_gem_object_handle_get(obj);
>>   }
>> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>>   
>>   /**
>>    * drm_gem_object_handle_free - release resources bound to userspace handles
>> @@ -272,21 +276,11 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>>   	}
>>   }
>>   
>> -/**
>> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
>> - * @obj: GEM object
>> - *
>> - * Releases a reference on the GEM buffer object's handle. Possibly releases
>> - * the GEM buffer object and associated dma-buf objects.
>> - */
>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>> +static void drm_gem_object_handle_put_unlocked_tail(struct drm_gem_object *obj)
>>   {
>>   	struct drm_device *dev = obj->dev;
>>   	bool final = false;
>>   
>> -	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
>> -		return;
>> -
>>   	/*
>>   	* Must bump handle count first as this may be the last
>>   	* ref, in which case the object would disappear before we
>> @@ -304,7 +298,32 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>   	if (final)
>>   		drm_gem_object_put(obj);
>>   }
>> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>> +
>> +static void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>> +{
>> +	struct drm_device *dev = obj->dev;
>> +
>> +	if (drm_WARN_ON(dev, READ_ONCE(obj->handle_count) == 0))
>> +		return;
>> +
>> +	drm_gem_object_handle_put_unlocked_tail(obj);
>> +}
>> +
>> +/**
>> + * drm_gem_object_handle_put_if_exists_unlocked - releases reference on user-space handle, if any
>> + * @obj: GEM object
>> + *
>> + * Releases a reference on the GEM buffer object's handle. Possibly releases
>> + * the GEM buffer object and associated dma-buf objects. Does nothing if the
>> + * buffer object has no handle.
>> + */
>> +void drm_gem_object_handle_put_if_exists_unlocked(struct drm_gem_object *obj)
>> +{
>> +	if (!obj->handle_count)
>> +		return;
>> +
>> +	drm_gem_object_handle_put_unlocked_tail(obj);
>> +}
>>   
>>   /*
>>    * Called at device or object close to release the file's
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> index c60d0044d036..618ce725cd75 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>   	unsigned int i;
>>   
>>   	for (i = 0; i < fb->format->num_planes; i++)
>> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>> +		drm_gem_object_put(fb->obj[i]);
>>   
>>   	drm_framebuffer_cleanup(fb);
>>   	kfree(fb);
>> @@ -183,10 +183,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>   		if (!objs[i]) {
>>   			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>   			ret = -ENOENT;
>> -			goto err_gem_object_handle_put_unlocked;
>> +			goto err_gem_object_put;
>>   		}
>> -		drm_gem_object_handle_get_unlocked(objs[i]);
>> -		drm_gem_object_put(objs[i]);
>>   
>>   		min_size = (height - 1) * mode_cmd->pitches[i]
>>   			 + drm_format_info_min_pitch(info, i, width)
>> @@ -196,22 +194,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>   			drm_dbg_kms(dev,
>>   				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>>   				    objs[i]->size, min_size, i);
>> -			drm_gem_object_handle_put_unlocked(objs[i]);
>> +			drm_gem_object_put(objs[i]);
>>   			ret = -EINVAL;
>> -			goto err_gem_object_handle_put_unlocked;
>> +			goto err_gem_object_put;
>>   		}
>>   	}
>>   
>>   	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>>   	if (ret)
>> -		goto err_gem_object_handle_put_unlocked;
>> +		goto err_gem_object_put;
>>   
>>   	return 0;
>>   
>> -err_gem_object_handle_put_unlocked:
>> +err_gem_object_put:
>>   	while (i > 0) {
>>   		--i;
>> -		drm_gem_object_handle_put_unlocked(objs[i]);
>> +		drm_gem_object_put(objs[i]);
>>   	}
>>   	return ret;
>>   }
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index f7b414a813ae..9233019f54a8 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -161,8 +161,8 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>>   
>>   /* drm_gem.c */
>>   int drm_gem_init(struct drm_device *dev);
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>> +void drm_gem_object_handle_get_if_exists_unlocked(struct drm_gem_object *obj);
>> +void drm_gem_object_handle_put_if_exists_unlocked(struct drm_gem_object *obj);
>>   int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>   			       struct drm_gem_object *obj,
>>   			       u32 *handlep);
>> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
>> index 8edefea2ef59..afd252108cfa 100644
>> --- a/drivers/gpu/drm/gma500/fbdev.c
>> +++ b/drivers/gpu/drm/gma500/fbdev.c
>> @@ -121,7 +121,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
>>   	drm_fb_helper_fini(fb_helper);
>>   
>>   	drm_framebuffer_unregister_private(fb);
>> -	fb->obj[0] = NULL;
>>   	drm_framebuffer_cleanup(fb);
>>   	kfree(fb);
>>   
>> @@ -243,7 +242,6 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
>>   
>>   err_drm_framebuffer_unregister_private:
>>   	drm_framebuffer_unregister_private(fb);
>> -	fb->obj[0] = NULL;
>>   	drm_framebuffer_cleanup(fb);
>>   	kfree(fb);
>>   err_drm_gem_object_put:

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

