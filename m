Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B192286CAE5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 15:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CCC10E130;
	Thu, 29 Feb 2024 14:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cbelDjAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5A110E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709215350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGn2p6W9uibemKPqyREb9k7E1bgINc2ga/funBz0R28=;
 b=cbelDjAxUU8euuktWmI0ErPDYjhyJu5WOxAJ6b/LrpQzut1EGPRCI2D2UUWjkCbC/KynEf
 JmaHzXfurt4uaeKHXJoZC6hM6Z0nstsk21bhbWZ9JkL2Z1di3EYeE1aYx3+U5WD+q7vJI/
 ohf1o9KVuYYb86DXh0Q1N7XtrWHuFkk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-4_Buyqc7OCuvWjMVTI_3Qg-1; Thu, 29 Feb 2024 09:02:28 -0500
X-MC-Unique: 4_Buyqc7OCuvWjMVTI_3Qg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2d2d59be640so8509351fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 06:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709215347; x=1709820147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nGn2p6W9uibemKPqyREb9k7E1bgINc2ga/funBz0R28=;
 b=pI3IrPqs9ymKiHZuB6TPx7k/wsMhO0H0XjLd8r1XHKn4QSrfiZIn/kPWbhjSIN4IFB
 nenOJ5vlHerDLjIn3O9/O8rF949KmteBfhvC9KofBSY7demLd9uUrNRsjadqAw6hszib
 +FI8v4ii0u3NIpKiodKNRUnMokdSl15VsMvER6zwMzssjBDFRJ94EVcVWAXuoTs1bJki
 ENYKsBDyUzr0zSxAWccwtBAkzUuT4stBkv8FwTUJ9rvpAMTpIrsQ3Se8y6ERfxztRVD7
 ZiQ77o7Zv5AtuFLrCvuIJMP3HIfs0Wpg7zV4NOG1OjXzfGzXVIsg1ka/HQzw77KWCnIv
 kRlQ==
X-Gm-Message-State: AOJu0Yyvgi0zrl7PGOoPmEBXNvC1mxi6L/781OjOKAXSfxrsWhVp/u7/
 Do1ZWApbUSn+rb+Np9f38cbl68EgoYtNkj5H3s9obKlBB0Z0qPryjVpI/Zjolx/OI0gLu040jCh
 Jd+7Ohgb3/Jt3/RDyzrUP1Y3J8OS+nqUgFpRHIlDD2MPzUgfWJgKfF4G/k8L69xJs8A==
X-Received: by 2002:a2e:8012:0:b0:2d2:9a89:4d83 with SMTP id
 j18-20020a2e8012000000b002d29a894d83mr1353766ljg.45.1709215347272; 
 Thu, 29 Feb 2024 06:02:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTbnHScjHKD+ti9mRv/Ieo7c9Gl/SojPGsRGhpYGZqFVslzllI/vJNrgtF1CzViAgHixnNzQ==
X-Received: by 2002:a2e:8012:0:b0:2d2:9a89:4d83 with SMTP id
 j18-20020a2e8012000000b002d29a894d83mr1353739ljg.45.1709215346925; 
 Thu, 29 Feb 2024 06:02:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 hg10-20020a05600c538a00b00412bcac77c1sm2025294wmb.7.2024.02.29.06.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 06:02:26 -0800 (PST)
Message-ID: <466dccb2-2529-4909-afa1-65eea6857553@redhat.com>
Date: Thu, 29 Feb 2024 15:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] drm/simpledrm: Add drm_panic support
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, javierm@redhat.com, 
 bluescreen_avenger@verizon.net, noralf@tronnes.org, gpiccoli@igalia.com
References: <20240227100459.194478-1-jfalempe@redhat.com>
 <20240227100459.194478-6-jfalempe@redhat.com>
 <ZeBn2sJmmQzY3Nxu@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZeBn2sJmmQzY3Nxu@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/02/2024 12:17, Daniel Vetter wrote:
> On Tue, Feb 27, 2024 at 11:04:16AM +0100, Jocelyn Falempe wrote:
>> Add support for the drm_panic module, which displays a user-friendly
>> message to the screen when a kernel panic occurs.
>>
>> v8:
>>   * Replace get_scanout_buffer() with drm_panic_set_buffer()
>>     (Thomas Zimmermann)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/tiny/simpledrm.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
>> index 7ce1c4617675..a2190995354a 100644
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>> @@ -25,6 +25,7 @@
>>   #include <drm/drm_gem_shmem_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_probe_helper.h>
>>   
>>   #define DRIVER_NAME	"simpledrm"
>> @@ -735,6 +736,20 @@ static const struct drm_connector_funcs simpledrm_connector_funcs = {
>>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>   };
>>   
>> +static void simpledrm_init_panic_buffer(struct drm_plane *plane)
>> +{
>> +	struct simpledrm_device *sdev = simpledrm_device_of_dev(plane->dev);
>> +	struct drm_framebuffer fb;
>> +
>> +	/* Fake framebuffer struct for drm_panic_set_buffer */
>> +	fb.width = sdev->mode.hdisplay;
>> +	fb.height = sdev->mode.vdisplay;
>> +	fb.format = sdev->format;
>> +	fb.pitches[0] = sdev->pitch;
>> +
>> +	drm_panic_set_buffer(plane->panic_scanout, &fb, &sdev->screen_base);
>> +}
>> +
>>   static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
>>   	.fb_create = drm_gem_fb_create_with_dirty,
>>   	.atomic_check = drm_atomic_helper_check,
>> @@ -945,6 +960,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>>   		return ERR_PTR(ret);
>>   	drm_plane_helper_add(primary_plane, &simpledrm_primary_plane_helper_funcs);
>>   	drm_plane_enable_fb_damage_clips(primary_plane);
>> +	drm_panic_register(primary_plane);
> 
> Just a quick comment on this:
> 
> This does not work, the driver is not ready to handle panic calls at this
> stage. Instead we need to automatically register all planes that support
> panic handling in drm_dev_register(), and we need to remove them all again
> in drm_dev_unregister(). Outside of these functions it is not safe to call
> into driver code.

If you register the primary plane and didn't call drm_panic_set_buffer() 
yet, the panic handler will not do anything, so it should be safe.

But if we revert to using the get_scanout_buffer(), this makes sense.
> 
> At that point it might be simpler to only register one panic notifier per
> drm_device, and push the loop into the panic handler again.
> 
> Cheers, Sima
> 
>> +	simpledrm_init_panic_buffer(primary_plane);
>>   
>>   	/* CRTC */
>>   
>> -- 
>> 2.43.0
>>
> 

