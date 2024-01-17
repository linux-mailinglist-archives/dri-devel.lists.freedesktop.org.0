Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E419830807
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 15:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD1A10E123;
	Wed, 17 Jan 2024 14:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918C410E123
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705501693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZJuZTDDbp7KvcPNN7wxj2cV5vgZgHszOh5bYyjGr/Y=;
 b=KvgN6BmEqg2uYcwDd46VtZDgOY6Jm5Kour4Da0d/J5d7mTPq3iiPyf6KFQB4LKVpiYO0CE
 QmL/0fLD+rsUQAelL+9KenDhLVoB6NZKLfvIMRWDxx5ud+OGrLwhukCrVemK5tyltLBtN6
 VTGmno22xODBjoVrv/ALF5PBEfLTpJ8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-dPyM8GSHPFqd7hF-CgHREg-1; Wed, 17 Jan 2024 09:28:11 -0500
X-MC-Unique: dPyM8GSHPFqd7hF-CgHREg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e4c1dd8a3so71833525e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 06:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705501690; x=1706106490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RZJuZTDDbp7KvcPNN7wxj2cV5vgZgHszOh5bYyjGr/Y=;
 b=XUcKO5/cWGvE5U/xXy7TLHWe0TfALwXEmBpjm24Wd7oKybaLJTLkWGR4txiFoYa2bW
 IYgjXQ4x5iCsmNmcPk7LEAown1PDJZgdOaJ4YUPQKX+Gw++uRz6P8qwbk7Cr8dWnf4Mh
 POPGFfQJ7p5ofm3g6lZ/MsIbHblrMI5l22ZEuexv0sL/BbsVezhaFbAxLtHXnzy4EgkG
 6e6JcLE6QWCrHyws1vKfeABRa1uQduNsDlAi8TsO5mivn96mBxTdkebO3z1pUbA0cKzY
 8vBy2NSKD5pP5sM6OPj6wlS3K2Ngkmanpkg2xIcRf5zJUJpD9Pg3/uyOfTZg4biIi0oC
 3C1Q==
X-Gm-Message-State: AOJu0YzpdL2devg6OwnMBuTOToau9H5SRlSVtBL50EcmLqN6qqatXSPw
 DPGzdeZxSr78yUQxq0t/flqo66CDDEmwwZeGHS3SJqlMPfK4QC0At9pOAt1SI9IUAcuy/7mGArB
 YoMetguJmfAhurp37Ouewx+198FuUj07+oeuP
X-Received: by 2002:a05:600c:1c05:b0:40e:52f4:81bb with SMTP id
 j5-20020a05600c1c0500b0040e52f481bbmr4987751wms.146.1705501690635; 
 Wed, 17 Jan 2024 06:28:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTIyl+QZ8E2Zol4DptxxKO2GiOgi3RfcBqrSso1j1ZVbJl5uR8eVF/dlb2EGe9UPA6Tpg8nA==
X-Received: by 2002:a05:600c:1c05:b0:40e:52f4:81bb with SMTP id
 j5-20020a05600c1c0500b0040e52f481bbmr4987741wms.146.1705501690264; 
 Wed, 17 Jan 2024 06:28:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 fk4-20020a05600c0cc400b0040e7efb1ff2sm8433722wmb.37.2024.01.17.06.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 06:28:09 -0800 (PST)
Message-ID: <e4f14ab3-cb16-43fa-9201-16e132871225@redhat.com>
Date: Wed, 17 Jan 2024 15:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
 <ZaFBofhe217zCmWN@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZaFBofhe217zCmWN@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com, mripard@kernel.org,
 gpiccoli@igalia.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/01/2024 14:41, Daniel Vetter wrote:
> On Thu, Jan 04, 2024 at 05:00:49PM +0100, Jocelyn Falempe wrote:
>> This was initialy done for imx6, but should work on most drivers
>> using drm_fb_dma_helper.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_fb_dma_helper.c | 55 +++++++++++++++++++++++++++++
>>   include/drm/drm_fb_dma_helper.h     |  4 +++
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
>> index 3b535ad1b07c..caed2935df4f 100644
>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
>> @@ -15,6 +15,7 @@
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_plane.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/module.h>
>> @@ -148,3 +149,57 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>>   	}
>>   }
>>   EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
>> +
>> +#if defined(CONFIG_DRM_PANIC)
>> +/**
>> + * @dev: DRM device
>> + * @drm_scanout_buffer: scanout buffer for the panic handler
>> + * Returns: 0 or negative error code
>> + *
>> + * Generic get_scanout_buffer() implementation, for drivers that uses the
>> + * drm_fb_dma_helper.
>> + */
>> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
>> +				     struct drm_scanout_buffer *sb)
>> +{
>> +	struct drm_plane *plane;
>> +	struct drm_gem_dma_object *dma_obj;
>> +	struct drm_framebuffer *fb;
>> +
>> +	drm_for_each_primary_visible_plane(plane, dev) {
> 
> Ok that's not enough locking by far. You can't just hope that nothing
> disappears while you're in a panic handler. We've been there and ended up
> reliably oopsing in the panic handler itself. So you _have_ to follow the
> full set of locking rules for all drm structures, or things will just get
> worse at the worst possible moment.
> 
> But also, you're not allowed to do anything else than trylock, because a
> panic handler might run from nmi context, and so you cannot even acquire
> irq-safe spinlocks reliably.
> 
> Which means:
> 
> - You need to be safe against concurrent drm_dev_unregister. Using the
>    atomic panic notifier directly for each device should take care of that
>    (but maybe that stuff is still not nmi safe, not sure).
> 
> - You _have_ to use all the locks. Luckily iterating over the plane list
>    doesn't need one, but you have to trylock the plane's modeset lock.
>    Which means your nice iterator macro is already toast, because that
>    already looks at state it's not allowed to look at without a lock. Or
>    well, the plane->state pointer is no-go already.

mutex_trylock() shouldn't be called from interrupt context, and as the 
panic may occurs in irq, I can't use that.

But the panic context should guarantee that only one CPU is still running:
https://elixir.bootlin.com/linux/latest/source/kernel/panic.c#L310

So I think using mutex_is_locked() should be safe: 
https://elixir.bootlin.com/linux/latest/source/include/linux/mutex.h#L128

This will only check if the lock is not taken, but as it's not possible 
for another task to run at the same time, I think that should be good 
enough ?

The drawback, is if we want to test without crashing the kernel, then we 
need to take the locks with trylock(), (and it's safe this time), but 
the code path would be slightly different.

-- 

Jocelyn


> 
> Given the locking issues I'm not sure whether the
> drm_for_each_primary_visible_plane iterator is going to work, you'd need
> something like iter_init/next/end we have for walking the connector list.
> Plus it would be very panic specific due to the trylock, so maybe
> 
> drm_for_each_visible_plane_in_panic_handler()
> 
> or something like that.
> 
> One thing I was wondering is whether we should lift this iteration over
> all planes into the shared code, and move the ->get_scanout_buffer
> function to the drm_plane_funcs structure instead?
> 
>> +		fb = plane->state->fb;
>> +		/* Only support linear modifier */
>> +		if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
>> +			continue;
>> +
>> +		/* Check if color format is supported */
>> +		if (!drm_panic_is_format_supported(fb->format->format))
>> +			continue;
>> +
>> +		dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
>> +
>> +		/* Buffer should be accessible from the CPU */
>> +		if (dma_obj->base.import_attach)
> 
> This might be a bit too restrictive, since some drivers import dma-buf
> including a vmap. So just checking for ->vaddr might be better. But can be
> changed later on.
> 
>> +			continue;
>> +
>> +		/* Buffer should be already mapped to CPU */
> 
> I'd clarify this comment to state that vaddr is invariant over the
> lifetime of the buffer and therefore needs no locking. Correct locking
> that a) takes all the locks b) never ever stalls for one is absolutely
> crucial for a panic handler that won't make the situation worse.
> 
>> +		if (!dma_obj->vaddr)
> 
> 
>> +			continue;
>> +
>> +		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
>> +		sb->format = fb->format;
>> +		sb->height = fb->height;
>> +		sb->width = fb->width;
>> +		sb->pitch = fb->pitches[0];
>> +		return 0;
> 
> Otherwise this lgtm.
> -Sima
> 
>> +	}
>> +	return -ENODEV;
>> +}
>> +#else
>> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
>> +				     struct drm_scanout_buffer *sb)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);
>> diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
>> index d5e036c57801..2ae432865079 100644
>> --- a/include/drm/drm_fb_dma_helper.h
>> +++ b/include/drm/drm_fb_dma_helper.h
>> @@ -7,6 +7,7 @@
>>   struct drm_device;
>>   struct drm_framebuffer;
>>   struct drm_plane_state;
>> +struct drm_scanout_buffer;
>>   
>>   struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
>>   	unsigned int plane);
>> @@ -19,5 +20,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>>   				  struct drm_plane_state *old_state,
>>   				  struct drm_plane_state *state);
>>   
>> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
>> +				     struct drm_scanout_buffer *sb);
>> +
>>   #endif
>>   
>> -- 
>> 2.43.0
>>
> 

