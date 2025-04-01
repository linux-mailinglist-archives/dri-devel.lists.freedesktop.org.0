Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5465EA77CF2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 15:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30F010E329;
	Tue,  1 Apr 2025 13:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YVV8ESG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0D110E329
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743515785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwNp1e/wCdcrQAQaG4bf5btqH7TSJa2ITvzoKNP3p3I=;
 b=YVV8ESG6AnugnWMYi1mHB2Kzr0GyZ/FEvbw7IzYd4Bcl5o9m5IZu2swoSKz7+q/NrvKsbl
 ajAKtjL/JVZgGpkqnsfsj3uWeESeQxxbwvuGpycyeCeRxT7B7RT+5XJVHtA3oxBV2y7hsU
 6qljSQ1FqBNT1A0IrwsNgC2KfTqrkqM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-t0OU9QfPM4-TF55e7Pz5yg-1; Tue, 01 Apr 2025 09:56:23 -0400
X-MC-Unique: t0OU9QfPM4-TF55e7Pz5yg-1
X-Mimecast-MFC-AGG-ID: t0OU9QfPM4-TF55e7Pz5yg_1743515782
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-391425471d6so2476267f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 06:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743515781; x=1744120581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kwNp1e/wCdcrQAQaG4bf5btqH7TSJa2ITvzoKNP3p3I=;
 b=qdyeeNmdjg5KWjwWt8Q6kYvfen2nSlKgQN2nTBja9BLWFUXmVcgkDqhLnMMKqLdRl6
 7Wh5k4f6ENsdHG8220WYjY7r4wMrZ3b7KN+cSMb80jO8b/Ejwa1CaI2JhFiDIU1E9hI7
 /v32LdegnafeZ+QDqE0DO/ZZQNGT42T0PA+Y+D6FtoDAsA4SzK8ZBu/kfQ8kN1OUCN4b
 SmxnBDdtB2Ycok2f6eDuslA9RltzUutsI/IeQPBHK3NMFiqB9tVXwLUWbgkARWS21b0E
 fRmSMq/S8pHQMmNT75O9DxdiMAIEb8+BcmEzr0jcWSScecFEBdPXlgh8Zo1TEK6pbJFf
 uC/Q==
X-Gm-Message-State: AOJu0YyZFoOeh4x7J+aQdoWAMFfD8N9cbiCI2RtJyVxygxb17JjH71fm
 cJ9p3y5ybmfWBzcO9ILjxvO2VTdmNiDjJyBM+E/K0Jb1cSyq3WxFs5lLe4USm/L0YFJ70gyP85N
 4KXNseQulXK8dczsqq4/uDoYX1HgdDFKkRmymw8dHzWVTtrw8+xeipPkn1ELBwBHP3iyjXLU7ZX
 4dFYKLcv0cchwjbUZVNYZVmsm7Mmqlkw/IRRafxrrJ0GV8ht+Kuw==
X-Gm-Gg: ASbGnct0T8bTsT8ud6G2/iZOA2eOVIxzbWkSL0NDGZhBhTT7vbjD97hV21KW/IR4QYp
 1Wp2ftv5oQ21EA3CHWOXopjoeZFS3vNS4EG0H7oQOy8ldGjegT25Rs551E+nyORDvVWUlbA7DhG
 nTQ4lmGfLnkZo/innMgN5vfWOaKrsof8JR9TLb/IWfGebrD3/aLyeU+7tG5YZbEARlX55RgOadx
 oQR4Fh/KRdsRWvNmYXO36N6TnfCv8kjaZf/60j/t5sBj5bS8i4tNxHscm+KL2VsyORvtGcKgOJW
 g4Paw2jEN+ru4d5S84Nsh1EVMo5DAEpyOFBCaSGmfD0l88LsDb9V/88=
X-Received: by 2002:a5d:6d8d:0:b0:391:a74:d7dc with SMTP id
 ffacd0b85a97d-39c12119cf6mr8705820f8f.50.1743515781506; 
 Tue, 01 Apr 2025 06:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET3cRr9AhiU2HZZqgdwOIyZWyFtDNxTPdu6zdf8BRbz9VV39Jnzn/OCQZpA9xf3SP0jBBVFQ==
X-Received: by 2002:a5d:6d8d:0:b0:391:a74:d7dc with SMTP id
 ffacd0b85a97d-39c12119cf6mr8705793f8f.50.1743515780899; 
 Tue, 01 Apr 2025 06:56:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e467sm14270460f8f.79.2025.04.01.06.56.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:56:19 -0700 (PDT)
Message-ID: <dff6086d-62ef-422f-9bc1-952938135a49@redhat.com>
Date: Tue, 1 Apr 2025 15:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] drm/i915/display: Add drm_panic support
To: dri-devel@lists.freedesktop.org
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-6-jfalempe@redhat.com> <87ldsk2dt4.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87ldsk2dt4.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7eyFe_YNJctohWNLRb0vxEjUXahXF_EIfHrZL1Brsqo_1743515782
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

On 01/04/2025 15:48, Jani Nikula wrote:
> On Tue, 01 Apr 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> This adds drm_panic support for a wide range of Intel GPU. I've
>> tested it only on 4 laptops, Haswell (with 128MB of eDRAM),
>> Comet Lake, Raptor Lake, and Lunar Lake.
>> For hardware using DPT, it's not possible to disable tiling, as you
>> will need to reconfigure the way the GPU is accessing the
>> framebuffer.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v4:
>>   * Add support for Xe driver.
>>   
>> v6:
>>   * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c
>>
>>   .../gpu/drm/i915/display/intel_atomic_plane.c | 79 ++++++++++++++++++-
>>   1 file changed, 78 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> index 7276179df878..eebf20fafaeb 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> @@ -33,13 +33,16 @@
>>   
>>   #include <linux/dma-fence-chain.h>
>>   #include <linux/dma-resv.h>
>> +#include <linux/iosys-map.h>
>>   
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_blend.h>
>>   #include <drm/drm_damage_helper.h>
>> +#include <drm/drm_cache.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_panic.h>
>>   
>>   #include "gem/i915_gem_object.h"
>>   #include "i915_config.h"
>> @@ -47,6 +50,7 @@
>>   #include "i915_vma.h"
>>   #include "i9xx_plane_regs.h"
>>   #include "intel_atomic_plane.h"
>> +#include "intel_bo.h"
>>   #include "intel_cdclk.h"
>>   #include "intel_cursor.h"
>>   #include "intel_display_rps.h"
>> @@ -54,6 +58,7 @@
>>   #include "intel_display_types.h"
>>   #include "intel_fb.h"
>>   #include "intel_fb_pin.h"
>> +#include "intel_fbdev.h"
>>   #include "skl_scaler.h"
>>   #include "skl_universal_plane.h"
>>   #include "skl_watermark.h"
>> @@ -1251,14 +1256,86 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
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
>> +	struct intel_plane *iplane = to_intel_plane(plane);
>> +	struct intel_display *display = to_intel_display(iplane);
>> +	struct drm_framebuffer *fb = plane_state->hw.fb;
>> +
>> +	/* Force a cache flush, otherwise the new pixels won't show up */
>> +	drm_clflush_virt_range(panic_map.vaddr, fb->height * fb->pitches[0]);
>> +
>> +	/* Don't disable tiling if it's the fbdev framebuffer.*/
>> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
>> +		return;
>> +
> 
> Mismatched {}

sorry, I messed up my rebase, after updating drm_i915_private to 
intel_display.
I will send a v7 tomorrow.
> 
> 
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
>> +	struct intel_display *display = to_intel_display(plane->dev);
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
>> +	iosys_map_clear(&panic_map);
>> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
>> +		intel_fbdev_get_map(display->fbdev.fbdev, &panic_map);
>> +	} else {
>> +		/* Can't disable tiling if DPT is in use */
>> +		if (intel_fb_uses_dpt(fb))
>> +			return -EOPNOTSUPP;
>> +
>> +		intel_bo_panic_map(obj, &panic_map);
>> +	}
>> +	if (iosys_map_is_null(&panic_map))
>> +		return -ENOMEM;
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

