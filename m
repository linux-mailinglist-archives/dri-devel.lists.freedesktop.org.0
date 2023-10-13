Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2276F7C8820
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BB810E160;
	Fri, 13 Oct 2023 14:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072B910E160
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697209089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J0KUZHh+WhAjJ7l87OQYW6THQnkK4w0QFU8cZolbEYw=;
 b=YYijEtteY+c2Z76UphYyQNAQIQSDxGNYArZ6tXdTc6zT0U9UnPZ60TCz7O/NKP5ZXLfd/F
 6N4M/lkq5lYumPRWB4gMKLoXT/X3NxLu+8YbuzZEFqvZV10pvzvfBDv+Rk9j5ea0UfUH3H
 UL4sZIeQIlBRaQmZQEcui7R8ApASI9o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-jGfH5tZCMCCm3W48e1oXtQ-1; Fri, 13 Oct 2023 10:57:51 -0400
X-MC-Unique: jGfH5tZCMCCm3W48e1oXtQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso1359561f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 07:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697209070; x=1697813870;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J0KUZHh+WhAjJ7l87OQYW6THQnkK4w0QFU8cZolbEYw=;
 b=lCu93jRNMj36ZIFME4jhD7S9/o/qFRE5rM6zHXeknhclbs+7RjSzlLGh5qelQw5TKa
 lVTeuTcvr0dpmRQqzezwHqiF4UZS3tO9lckHe410YCdOcYMsq6gPu1JnbXQjK2gK7kWJ
 l/Py+6S8yn66g/Oa1C7S7ZRfoc+e/GUOBKMd+xMDEhC4WbM2mRVuS4Pmxs85x+cST5+z
 86Fhy62yOsWlNaoL1cESgbBZ+hVSCa2JLc7iAppqfXDqCr8OAsjGIO98nI8OV71NPU75
 mMn2zgAKiQvWbWhyZHtVBsbuktc97X+tZxmGErgi+YUj0SKqxIPuwLgeITAK0KYbw1m1
 JoZg==
X-Gm-Message-State: AOJu0YxHI52GNWfZPupUGORhV3NehQjTfV24qH8mR3giAX53ak1nXz/2
 7B6vakb+9YQrm1QNft3NvY/+SNdjdPp2tztvD86zyyhIyUAnRnEZn3sY3wfmEE1TXtiQ2QHzomU
 P4vTiWkwqoDYpLri6wAr68KEJjRF6NMKryAfW
X-Received: by 2002:a5d:4009:0:b0:32d:a2c3:19f3 with SMTP id
 n9-20020a5d4009000000b0032da2c319f3mr108901wrp.41.1697209069744; 
 Fri, 13 Oct 2023 07:57:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRosWdyIwSDhkhLp9fyiN5rDE/nomm1Dpd7/zJdSNPlJngVcDhbhUosjDeZgaxvfZX71AXPA==
X-Received: by 2002:a5d:4009:0:b0:32d:a2c3:19f3 with SMTP id
 n9-20020a5d4009000000b0032da2c319f3mr108875wrp.41.1697209069389; 
 Fri, 13 Oct 2023 07:57:49 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q6-20020adfb186000000b0032d87b13240sm7104304wra.73.2023.10.13.07.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 07:57:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] drm/ssd130x: Add support for the SSD132x OLED
 controller family
In-Reply-To: <6740c736-ba5f-4df2-ba2b-da0902f51f6d@suse.de>
References: <20231012213843.1151060-1-javierm@redhat.com>
 <20231012213843.1151060-5-javierm@redhat.com>
 <6740c736-ba5f-4df2-ba2b-da0902f51f6d@suse.de>
Date: Fri, 13 Oct 2023 16:57:48 +0200
Message-ID: <87bkd2sh77.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor@kernel.org>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks a lot for your feedback.

> Hi Javier,
>
> thanks for this patch.
>
> Am 12.10.23 um 23:38 schrieb Javier Martinez Canillas:
> [...]
>>   
>> +static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
>> +				const struct iosys_map *vmap,
>> +				struct drm_rect *rect, u8 *buf,
>> +				u8 *data_array)
>> +{
>> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
>> +	unsigned int dst_pitch = drm_rect_width(rect);
>> +	struct iosys_map dst;
>> +	int ret = 0;
>> +
>> +	/* Align x to display segment boundaries */
>> +	rect->x1 = round_down(rect->x1, SSD132X_SEGMENT_WIDTH);
>> +	rect->x2 = min_t(unsigned int, round_up(rect->x2, SSD132X_SEGMENT_WIDTH),
>> +			 ssd130x->width);
>> +
>> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	iosys_map_set_vaddr(&dst, buf);
>> +	drm_fb_xrgb8888_to_gray8(&dst, &dst_pitch, vmap, fb, rect);
>
> Here's an idea for a follow-up patchset.
>
> You could attempt to integrate the gray8 and mono conversions into 
> drm_fb_blit(). With some the right parameters, both, ssd130x and ssd132x 
> could use the same blitting code from BO to buffer.
>

Yeah, I considered that but as mentioned in the commit message want to see
what are the needs of the SSD133x controller family (I bought a SSD1331
display but haven't had time to play with it yet) before trying to factor
out the common bits in helper functions.

[...]

>> +
>> +	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
>> +	if (!ssd130x_state->buffer)
>> +		return -ENOMEM;
>
> It's unrelated to these patches and I know it's been discussed 
> endlessly, but I have a questions about buffer allocation. That memory 
> acts as another shadow buffer for the device's memory, such that format 
> conversion becomes easier.
>

Correct.

> But then, why is ->buffer part of the plane_state? Shouldn't it be part 
> of the plane and never be re-allocated? The real size of that buffer is 
> <width> times <height> (not <pitch>). That size is static over the 
> lifetime of the device. That would represent the semantics much better.
>
> This would allow for additional changes: blit_rect and update_rect would 
> be much easier to separate: no more segment adjustments for the blit 
> code; only for updates. If the update code has high latency (IDK), you 
> could push it into a worker thread to run besides the DRM logic. The gud 
> and repaper drivers do something to this effect.
>
>

The idea of making it part of the plane state is that this buffer could be
optional, for example in the case of user-space using the native display
format instead of the emulated XRGB8888.

In that case, an intermediate buffer won't be used because the shadow-plane
format will already be the native one (e.g: R1) and there won't be a need
to do any format conversion (only the conversion to the data format as is
expected by the controller).

Take a look to Geert's patch adding R1 support to ssd130x for an example:

https://lore.kernel.org/all/72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org/

That's why it was decided that making it part of the plane state follows
better the KMS model, because when using R1 this buffer won't even be
allocated in the primary plane .atomic_check handler.

[...]

>> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
>> +		dst_clip = plane_state->dst;
>> +
>> +		if (!drm_rect_intersect(&dst_clip, &damage))
>> +			continue;
>> +
>> +		ssd132x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
>> +				     ssd130x_plane_state->buffer,
>> +				     ssd130x_crtc_state->data_array);
>> +	}
>
> Here's another idea for a another follow-up patchset:
>
> You are allocating state->buffer to cover the whole display, right? It's 
> <pitch> times <height> IIRC.  Maybe it would make sense to split the 
> damage loop into two loops and inline the driver's blit_rect() function. 
> Something like that
>
>    begin_cpu_access()
>
>    for_each(damage) {
>      drm_fb_blit( "from GEM BO to buffer" )
>    }
>
>    end_cpu_access()
>
>    for_each(damge) {
>      update_rect( "from buffer to device" )
>    }
>
> With the changes from the other comments, the first loop could become 
> entirely device-neutral AFAICT.
>

Regardless, splitting the blit and update rect might make sense and is an
intersesting idea. I need to explore this, thanks for the suggestion.

As you mention that these could be follow-up changes, I assume that you
agree with the current approach. Should I expect your review / ack for
this patch-set?

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

