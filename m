Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D600D82BFC4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 13:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB9610E097;
	Fri, 12 Jan 2024 12:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C081010E097
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705062548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tZejtU7PEXTdJbvkHX1fFcTF4v3ln5g0/JMsf/uvFs=;
 b=TFPHKD2WOeuZl37wCgoCGgzEUc8Y9we56ufrBfcVp1fvYcaCeMMOzkkC8oLQwzi6vndAy3
 3+NS8ijH69TKDWSbsuX5jK1EcgcxHU3dQryqlvZgmmbIm2vJ/CajFpn/UKfZYC0LOYsvxZ
 HjxXLqbQXSCVtBlfL/7JTloIBEo7tPo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-24vwYlA3MNCyynOPsCTQzg-1; Fri, 12 Jan 2024 07:29:07 -0500
X-MC-Unique: 24vwYlA3MNCyynOPsCTQzg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e5f548313so13219935e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 04:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705062546; x=1705667346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0tZejtU7PEXTdJbvkHX1fFcTF4v3ln5g0/JMsf/uvFs=;
 b=AmP5kYX21qVEuDTCTOxVjCsEuzQApSmWEd1bMtVLkOQYtkUT42aS1T8iF9NHrB2Fv0
 HF+onOnzudiXiUL+rbLmNIrnANhJXLqSz4MN5aGeo60aZnUhaj04aXsfRgwf0R3VVr6K
 0qn1+nZKsNTDMrFKA0e0xOJHA/HHJ4pHpQr7t52Rx8gqBDcgHWts4nUR6sklJGrVHmn+
 kFBBQeGMYR2aAC6UkZ/5jN3qPbGbpXPP/XmoN+00/rfdqHqZvkUCM65vH9Cw+rPWcVoD
 HO7gmj7nRit+o3Dr0aZiIgrdpqbC90OUU0rcN4ZHrQjyUq/hDqAy6LCNGMzAJMolU+pE
 fCiw==
X-Gm-Message-State: AOJu0YwL6ufLA9dVj6DTm/HdHWkoSIuhJzDF0iwPJy6UxbGtEyNimwmB
 vpnmRWRHqTbu8r5+iLPkAhDwwp+bD6ZLOkSYYlYyzYjwNcJnyw8llmfJclBGZCiFr8I/MaIGhWl
 9zLvFwKJ7qu4Og+KGrpmcaxkto9crfWEIQkiS
X-Received: by 2002:a05:600c:4fc2:b0:40e:5562:bcda with SMTP id
 o2-20020a05600c4fc200b0040e5562bcdamr656180wmq.155.1705062546214; 
 Fri, 12 Jan 2024 04:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtxJXGaONruGdiKJ1mTDzDJq/DTpXs5Hvf7ioa0uGBPReHHYKIbYiQPxg/82Qoz22qg6j01A==
X-Received: by 2002:a05:600c:4fc2:b0:40e:5562:bcda with SMTP id
 o2-20020a05600c4fc200b0040e5562bcdamr656169wmq.155.1705062545918; 
 Fri, 12 Jan 2024 04:29:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 az39-20020a05600c602700b0040e68e4f240sm433096wmb.35.2024.01.12.04.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 04:29:05 -0800 (PST)
Message-ID: <5654b14f-6907-42b4-aebb-ac5c129e5974@redhat.com>
Date: Fri, 12 Jan 2024 13:29:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
To: Maxime Ripard <mripard@kernel.org>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
 <zyzybbofx2mhl7pvpgzc33vq4u4zg6o6h6het6wwasprg4y7pt@vz4tvadsid4c>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <zyzybbofx2mhl7pvpgzc33vq4u4zg6o6h6het6wwasprg4y7pt@vz4tvadsid4c>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/01/2024 11:20, Maxime Ripard wrote:
> Hi,
> 
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
>> +			continue;
>> +
>> +		/* Buffer should be already mapped to CPU */
>> +		if (!dma_obj->vaddr)
>> +			continue;
>> +
>> +		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
>> +		sb->format = fb->format;
>> +		sb->height = fb->height;
>> +		sb->width = fb->width;
>> +		sb->pitch = fb->pitches[0];
>> +		return 0;
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
> 
> Looks much better, thanks :)
> 
> I think we should be more vocal about the failure cases too. Maybe log
> it through warn/pr_crit or whatever so that at least we have an idea
> what went wrong in a post mortem.

Thanks for the review.
Yes I can add an error message when it fails to find a scanout buffer.
> 
> Maxime

-- 

Jocelyn

