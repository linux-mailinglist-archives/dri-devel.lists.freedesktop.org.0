Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD99E1FF3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F53310EA3E;
	Tue,  3 Dec 2024 14:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S/NHonzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5596110EA3E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733237401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4GDP2N42De0BPou1g+YWzXPbsQ3btrCc627tUnJ8gg=;
 b=S/NHonzrgLmk9CDbfEfobWUAjjOGPzcrP2xNvrD8wnB/lD7lSNeBW+yXEkp55zoU13acHQ
 npqtgXujnd/20W+KaD9Yv+gODdgLTf8qEQS8pXaTQZGDoz+zIe6+cCzv2FLPBZN7tnv+kn
 BJ1B9pxgDikFuq9DkDydhwxjf/N3CHE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632--pRreJZvP0Gkpt0mgcnN8w-1; Tue, 03 Dec 2024 09:49:55 -0500
X-MC-Unique: -pRreJZvP0Gkpt0mgcnN8w-1
X-Mimecast-MFC-AGG-ID: -pRreJZvP0Gkpt0mgcnN8w
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385fdff9db5so507197f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 06:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733237394; x=1733842194;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n4GDP2N42De0BPou1g+YWzXPbsQ3btrCc627tUnJ8gg=;
 b=Wn4R+b9DZmVgC1U91iX5coBXq+DONhGMM+fy6+r1yNFDJwIORcXrHk/t++w7kUsgsn
 WeNwWW+gwxeRwAGy1xTW7X+vN2tZYTqK3+nXzQQwKDNnq1kuXdRR8KonJpaCtg46qRJR
 1SGUEsostd+FMv7/9L3g5Kk+MLBCL6FPbjnSvN1nTplCgAhWtuQGrWQCKWDF5CFIwtvj
 JtOUQYpeDqjt4J6M14bVvEwjQ6itw7kxrg/UBcBicSD5JJ1UGA4/4zuQNvSQWcFqzQRm
 UQd/EPRKv67YeFXPIYCU/5Vm1rTUSACiVGOtwCJYSwfCQIq4KuKfYLnwSp4A1xoaEXgM
 vPUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgjipbw5SoG6F/IKf1IcnrTyGl9y3xSCskp72yDwX13Ww/Ae1y+dvJByRFak8Z33VKOJL1sUsgUPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAi5AawEtv1dTLh7HbS50ziSOPmrLFHeYUX23KdyVrUIZgKavI
 MF0r9JBQ+ne+3XWGumOidHd1gfM/Q1rXvjZ2oaNYbO88mo72tkrFP1K7h8cy1W5vEjl2jI/VtY/
 OfZs6mkCOp7RQ/sLw4ivJlIFDsfaoUrb7UJ6Eb9rtgqYTNdVWuMoq8O18o02SmPPjMA==
X-Gm-Gg: ASbGnct1zIx/rfqZBSa9DLGUr5xf3VVhJno0l0j/gVfqlyBBf0s0YnP0lvaMTzF3oX/
 petn6vNrbUdx18ZlD79ynl3nuClZobEaXkLJhRp4MB/6TacWAZpU926DYCUNFGPbnpUIbnmetMv
 GUj2aAuYefED+88zIKrvGuULpuJO5D3KD+lInC0m4h8YSAr61AV4UxStxyvihYtJJhUImljHsBC
 g3+31lo453PSwath33eohSyVieg8xs1aCNaHAJKL42Qpu9cmNKE1gq7uNGlqveZaZJ11Yvdjd1I
 bunaA2v3kjXCTg==
X-Received: by 2002:a5d:64e6:0:b0:37e:d2b7:acd5 with SMTP id
 ffacd0b85a97d-385fd3ce813mr2293184f8f.8.1733237393664; 
 Tue, 03 Dec 2024 06:49:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFcwkE05mCDE5tPeK9RAGof+vyXA1+Fejzj8Sh9g5cySN/ZQlfiIv2uok1tNdkoohrM943VA==
X-Received: by 2002:a5d:64e6:0:b0:37e:d2b7:acd5 with SMTP id
 ffacd0b85a97d-385fd3ce813mr2293163f8f.8.1733237393188; 
 Tue, 03 Dec 2024 06:49:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d04defb7sm19709015e9.0.2024.12.03.06.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 06:49:52 -0800 (PST)
Message-ID: <9b553553-55b8-4c79-a31b-5661da55df3b@redhat.com>
Date: Tue, 3 Dec 2024 15:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/i915: Add drm_panic support
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241203092836.426422-1-jfalempe@redhat.com>
 <20241203092836.426422-6-jfalempe@redhat.com>
 <4e67e781-df6d-45b8-be52-637ee5926bd7@linux.intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4e67e781-df6d-45b8-be52-637ee5926bd7@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cak8nLZlPHxsrzl54jML--2MuM8E6iDhFs6Zy0DW2fE_1733237394
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2024 11:58, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2024-12-03 kl. 09:50, skrev Jocelyn Falempe:
>> This adds drm_panic support for a wide range of Intel GPU. I've
>> tested it only on 3 laptops, haswell (with 128MB of eDRAM),
>> cometlake and alderlake.
>>
>>   * DPT: if I disable tiling on a framebuffer using DPT, then it
>>     displays some other memory location. As DPT is enabled only for
>>     tiled framebuffer, there might be some hardware limitations.
> This is because DPT points to the pagetable, when you disable tiling DPT is no longer used so the DPT is interpreted as a linear FB instead of a lookup table.

Thanks for the explanation, I was a bit puzzled by this.
> 
> The lookup table is necessarily smaller than the real FB, so you would need to overwrite part of the GGTT and point it to linear FB.
> 
> I'm not sure what the fix is here as it would require a real GGTT mapping to fix, needing an allocation which might not succeed. Perhaps indicates a limitation to require a real pageflip to fbdev fb?

fbdev is not always present, (and drm_panic is there to help disable it, 
so I would prefer that it doesn't rely on it).
The other solution is to draw tiled. When I tested, TILED_X looked 
simple, and is the default when using gnome desktop, so I can start to 
implement that.

> 
> Have you tested rotated by any chance? Cursor enabled? Overlay?

No, not yet. But even a rotated panic screen is better than a hard 
freeze. When I test, I have sometime the mouse cursor on top of the 
panic screen, but that's not really a problem. Even if it hides a part 
of the QR code, there are enough ECC to decode it.
drm_panic is a best effort mode, it's not a problem if it doesn't cover 
all use cases.

As a side note regarding rotation, there are a lot of pictures of 
Crowdstrike's BSOD, that doesn't respect the rotation of the screen.

> 
> I also think this may fail if there are flips queued. We should probably bite the bullet, reprogram the entire state into a known state, disable all overlay planes and cursor, reassign all watermarks for the primary and ensure any background work is killed where needed.

This has been discussed when I started drm_panic, and restarting the 
full graphic pipeline is complex to do in a panic handler.
It would also require much more work than this.

In a panic handler, there shouldn't be any background work going on the 
CPU (all CPU are shutdown except the panic CPU). On the other hand, the 
GPU can continue his work freely.

Also there is a mode_config->panic_lock, so that we don't try to draw a 
panic screen, if we are in the middle of a page flip:
https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/drm_atomic_helper.c#L3102

Best regards,

-- 

Jocelyn

> 
> Cheers,
> ~Maarten
> 
>>   * fbdev: On my haswell laptop, the fbdev framebuffer is configured
>>     with tiling enabled, but really it's linear, because fbcon don't
>>     know about tiling, and the panic screen is perfect when it's drawn
>>     as linear.
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++++++++++++++++++-
>>   1 file changed, 84 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> index b7e462075ded3..58eb3b4c55fa5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> @@ -33,16 +33,20 @@
>>   
>>   #include <linux/dma-fence-chain.h>
>>   #include <linux/dma-resv.h>
>> +#include <linux/iosys-map.h>
>>   
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_blend.h>
>> +#include <drm/drm_cache.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_panic.h>
>>   
>>   #include "i915_config.h"
>>   #include "i9xx_plane_regs.h"
>>   #include "intel_atomic_plane.h"
>> +#include "intel_bo.h"
>>   #include "intel_cdclk.h"
>>   #include "intel_cursor.h"
>>   #include "intel_display_rps.h"
>> @@ -50,6 +54,7 @@
>>   #include "intel_display_types.h"
>>   #include "intel_fb.h"
>>   #include "intel_fb_pin.h"
>> +#include "intel_fbdev.h"
>>   #include "skl_scaler.h"
>>   #include "skl_watermark.h"
>>   
>> @@ -1198,14 +1203,92 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>>   	intel_plane_unpin_fb(old_plane_state);
>>   }
>>   
>> +/* Only used by drm_panic get_scanout_buffer() and panic_flush(), so it is
>> + * protected by the drm panic spinlock
>> + */
>> +static struct iosys_map panic_map;
>> +
>> +static void intel_panic_flush(struct drm_plane *plane)
>> +{
>> +	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
>> +	struct drm_i915_private *dev_priv = to_i915(plane->dev);
>> +	struct drm_framebuffer *fb = plane_state->hw.fb;
>> +	struct intel_plane *iplane = to_intel_plane(plane);
>> +
>> +	/* Force a cache flush, otherwise the new pixels won't show up */
>> +	drm_clflush_virt_range(panic_map.vaddr, fb->height * fb->pitches[0]);
>> +
>> +	/* Don't disable tiling if it's the fbdev framebuffer.*/
>> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev))
>> +		return;
>> +
>> +	if (fb->modifier && iplane->disable_tiling)
>> +		iplane->disable_tiling(iplane);
>> +}
>> +
>> +static int intel_get_scanout_buffer(struct drm_plane *plane,
>> +				    struct drm_scanout_buffer *sb)
>> +{
>> +	struct intel_plane_state *plane_state;
>> +	struct drm_gem_object *obj;
>> +	struct drm_framebuffer *fb;
>> +	struct drm_i915_private *dev_priv = to_i915(plane->dev);
>> +	void *ptr;
>> +
>> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
>> +		return -ENODEV;
>> +
>> +	plane_state = to_intel_plane_state(plane->state);
>> +	fb = plane_state->hw.fb;
>> +	obj = intel_fb_bo(fb);
>> +	if (!obj)
>> +		return -ENODEV;
>> +
>> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev)) {
>> +		ptr = intel_fbdev_get_vaddr(dev_priv->display.fbdev.fbdev);
>> +	} else {
>> +		/* can't disable tiling if DPT is in use */
>> +		if (intel_bo_is_tiled(obj) && HAS_DPT(dev_priv))
>> +			return -EOPNOTSUPP;
>> +
>> +		ptr = intel_bo_panic_map(obj);
>> +	}
>> +
>> +	if (!ptr)
>> +		return -ENOMEM;
>> +
>> +	if (intel_bo_has_iomem(obj))
>> +		iosys_map_set_vaddr_iomem(&panic_map, ptr);
>> +	else
>> +		iosys_map_set_vaddr(&panic_map, ptr);
>> +
>> +	sb->map[0] = panic_map;
>> +	sb->width = fb->width;
>> +	sb->height = fb->height;
>> +	sb->format = fb->format;
>> +	sb->pitch[0] = fb->pitches[0];
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_plane_helper_funcs intel_plane_helper_funcs = {
>>   	.prepare_fb = intel_prepare_plane_fb,
>>   	.cleanup_fb = intel_cleanup_plane_fb,
>>   };
>>   
>> +static const struct drm_plane_helper_funcs intel_primary_plane_helper_funcs = {
>> +	.prepare_fb = intel_prepare_plane_fb,
>> +	.cleanup_fb = intel_cleanup_plane_fb,
>> +	.get_scanout_buffer = intel_get_scanout_buffer,
>> +	.panic_flush = intel_panic_flush,
>> +};
>> +
>>   void intel_plane_helper_add(struct intel_plane *plane)
>>   {
>> -	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
>> +	if (plane->base.type == DRM_PLANE_TYPE_PRIMARY)
>> +		drm_plane_helper_add(&plane->base, &intel_primary_plane_helper_funcs);
>> +	else
>> +		drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
>>   }
>>   
>>   void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,
> 

