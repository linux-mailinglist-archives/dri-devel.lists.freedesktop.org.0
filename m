Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F035B8F979
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A3610E3F4;
	Mon, 22 Sep 2025 08:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o6Sku5Oi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IB5gLBjc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uh1uKVlG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z6ZysaOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EA210E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:40:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2B521F8C3;
 Mon, 22 Sep 2025 08:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n76Q3/rcBTWK7If+3kNd7cw8ZhT8+GMbBJPryUz2Xng=;
 b=o6Sku5OiMkIAucjxUbHjo4aPjg3QVtm+0v0Ityye9kNGqPwe4UPuDS2s0Fxq4WpoeO4vQ8
 LaXl82emNUL+971wVVmrqtlJj11crSfO8znBWxw97mRxvhk5MASYGTpvYIbKH0lOJq1dn4
 GMuOXw4p9AplzJIGVqnUuDOM8EcrPME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n76Q3/rcBTWK7If+3kNd7cw8ZhT8+GMbBJPryUz2Xng=;
 b=IB5gLBjcvbEoQ+7RdAkCpBeC71yFj+Nvc1DpHZH80r7s++OMxvTTKBlr4Sggg2KqlLMirB
 fsEya2dCYXu/s8AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n76Q3/rcBTWK7If+3kNd7cw8ZhT8+GMbBJPryUz2Xng=;
 b=uh1uKVlGZTOTzslrJWqB/4L5+/VHVo2LYCKppaxh/CW3CLgxfad/gjHd+McPQM4s4vpA8A
 Gt1pIayvP/c9rH1UsZk4raoKZ/3IlKL7y0/T+76TSHzYr/NHLcYDcTDVVrLI1586fDeDFy
 fQN5/rhxnVQ2KHYFg+yDy/whdS0UrSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n76Q3/rcBTWK7If+3kNd7cw8ZhT8+GMbBJPryUz2Xng=;
 b=z6ZysaObuh53PT9YhQYJ+2P7vewpvD321nkyIZVq0Erwuylg5qUMHSjse+FzE7jScmW1rw
 9KabDY+eFy2dOyDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E3B01388C;
 Mon, 22 Sep 2025 08:40:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 89rnIIIL0WjmFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 08:40:34 +0000
Message-ID: <aa9ee6a7-81ea-46d3-8043-fcdcbfad882c@suse.de>
Date: Mon, 22 Sep 2025 10:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/gem: Acquire references on GEM handles
 for framebuffers"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <20250919155519.1104256-3-mwen@igalia.com>
 <4762e5ef-8427-4fdc-ab22-da2dbcb7b8ac@amd.com>
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
In-Reply-To: <4762e5ef-8427-4fdc-ab22-da2dbcb7b8ac@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 22.09.25 um 10:34 schrieb Christian König:
> On 19.09.25 17:54, Melissa Wen wrote:
>> This reverts commit 5307dce878d4126e1b375587318955bd019c3741.
>>
>> We've already reverted all other commits related to dma_bug handling and
>> there is still something wrong with this approach that does not allow
>> unloading a driver. By reverting this commit, we'd just go back ot the
>> old behavior.
> I don't think we want to do this.
>
> Keeping the backing store alive for DMA-bufs while they are used for scanout is actually a really important bug fix.

That bug has rarely seen seen in practice. At least I'm not aware of any 
such report. And it's also just half of the fix IIRC. Not being able to 
unload the module is a regression OTOH. I'd rather go back to the old 
status quo than now having to deal with two problems.

Best regards
Thomas

>
> Regards,
> Christian.
>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
>>   drivers/gpu/drm/drm_internal.h               |  2 -
>>   3 files changed, 11 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 09f80a84d61a..12efc04fb896 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>>   }
>>   EXPORT_SYMBOL(drm_gem_private_object_fini);
>>   
>> -static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>> -{
>> -	struct drm_device *dev = obj->dev;
>> -
>> -	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
>> -
>> -	if (obj->handle_count++ == 0)
>> -		drm_gem_object_get(obj);
>> -}
>> -
>> -/**
>> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>> - * @obj: GEM object
>> - *
>> - * Acquires a reference on the GEM buffer object's handle. Required
>> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>> - * to release the reference.
>> - */
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>> -{
>> -	struct drm_device *dev = obj->dev;
>> -
>> -	guard(mutex)(&dev->object_name_lock);
>> -
>> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>> -	drm_gem_object_handle_get(obj);
>> -}
>> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>> -
>>   /**
>>    * drm_gem_object_handle_free - release resources bound to userspace handles
>>    * @obj: GEM object to clean up.
>> @@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
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
>> +static void
>> +drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>   {
>>   	struct drm_device *dev = obj->dev;
>>   	bool final = false;
>> @@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>   	if (final)
>>   		drm_gem_object_put(obj);
>>   }
>> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>>   
>>   /*
>>    * Called at device or object close to release the file's
>> @@ -434,8 +398,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>>   	int ret;
>>   
>>   	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>> -
>> -	drm_gem_object_handle_get(obj);
>> +	if (obj->handle_count++ == 0)
>> +		drm_gem_object_get(obj);
>>   
>>   	/*
>>   	 * Get the user-visible handle using idr.  Preload and perform
>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> index e364fa36ee36..4bc89d33df59 100644
>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>> @@ -101,7 +101,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>   	unsigned int i;
>>   
>>   	for (i = 0; i < fb->format->num_planes; i++)
>> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>> +		drm_gem_object_put(fb->obj[i]);
>>   
>>   	drm_framebuffer_cleanup(fb);
>>   	kfree(fb);
>> @@ -179,10 +179,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
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
>> @@ -192,22 +190,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
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
>>   	ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
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
>> index ec1bf58e5714..5265eac81077 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -163,8 +163,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>>   
>>   /* drm_gem.c */
>>   int drm_gem_init(struct drm_device *dev);
>> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>>   int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>   			       struct drm_gem_object *obj,
>>   			       u32 *handlep);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


