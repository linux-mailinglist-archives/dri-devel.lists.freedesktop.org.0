Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3164B531A5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FC710EAD6;
	Thu, 11 Sep 2025 12:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BsfyaGGi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B63010EAD6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757592047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVX5ov/wR4sB0hiUdS2uKerj6PX/BzbKi/PaeD7eU6A=;
 b=BsfyaGGiOBw8Bb4sua00QsmzyR2Gt/F4sHo2sQbDh86Nz83Z0E9IoNyKwTRwzcm4eQcsOp
 bL5vL2IVlZ0BTHIMqApzVYDyd5M+luNCtJTzRN23u/y8Hfchq2v/cMDoF5Ey/3j97QiTig
 U4MLlSFYEHf2rhh1G5yrK3KXY7LCRd0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-P5HeC5qcOGa6Uw19gtLYDA-1; Thu, 11 Sep 2025 08:00:46 -0400
X-MC-Unique: P5HeC5qcOGa6Uw19gtLYDA-1
X-Mimecast-MFC-AGG-ID: P5HeC5qcOGa6Uw19gtLYDA_1757592045
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3dabec38299so416255f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757592045; x=1758196845;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bVX5ov/wR4sB0hiUdS2uKerj6PX/BzbKi/PaeD7eU6A=;
 b=pvYg/FoSHwgchWjVTLq1jN6L7vjMQNAJJJA4Ausvf3J6Xg1crgTCR/3cd6RO5JGwBl
 R21+8XJB+82ktawRxevvn1ORGT4Ocm/4ociab5817rafFX9R/BbdxrhWrUQ0ny9amqIr
 Thxl8ef+SC7i70FX7XG/osa3dG1huv5lfu31NXWtWK/XWOkC4qXFUDk206qmAggXK5+i
 4SAyBmbhhsDwMvXWwIo9FGfT+jIswmsvz6HE7096ro3DjuCHAG9hzEoszVf8sH55HfDF
 Nn6T0H8tST9wbcMmb8LVoN0WPdSYTAGHds3befkOhc5Xi231WVonfSC3xlG2n3DDhgyO
 //Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW63CLNeg5ZakHjSk9oIYjGGO7b3ubRcUXHKtvw2puuqzpcaZckvl5eXTtr0+noGdsegubHC71vVLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlZazE7qmDrnIfUMmHB4w16Ro+e9XVvUgv5R2x05i6qZ26dpBq
 osP+FrFeTi83lHOs4vXcSo8AclPJd2JTaCizk/OFpb66ZSEYoq+Xcb6+/TldbQ6QktwgKNY9+jC
 iohTbwfbkFbuSXsiYge2PaCSoDVGsES9vx6hqieLnsMjjQJ6iDSy4CULn9+1XoL2gr3iyGA==
X-Gm-Gg: ASbGnctf/axirOkpsQvRdxtIfuYm4Z8UgMAqZj7DR9hMBBMexbR5bhZMKoSwmXmpMZl
 BrxsihQB6IOoAEver7pRTWpv3mnYnhtUjCXZqC6Sv63tyrKtFPO6p5WqKkMEnv9st97R+QDIraQ
 OBska+Q6TVqnC00rSPXgRMLl37KF5R1NIlAGuwm97aq7LP0kGc00A3yD1l4FeQ6eGuf84KmpHVU
 f7CQpA/jFDZgzjOD2RGCkQyVRgDORKORKAlL9nA86Jfhwdm0H63m6Cc5EF4g700z4B13c42aYKo
 kAPJtnzVtsXFMpCH7Hsf7K8HSOajfGz0XtpGY9MRmShwT3bAHQ8Btc/kgeC+WgX4EFQ5NyuC3K7
 ggVE=
X-Received: by 2002:a05:6000:430a:b0:3e7:471c:1ddd with SMTP id
 ffacd0b85a97d-3e7471c223dmr11405044f8f.49.1757592045015; 
 Thu, 11 Sep 2025 05:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLVVQC0eY4HoVHqOpKiv2pGBzG6+iBKCOe0cz5ZOeflvxyX3p0Ju+5/hKQlM/A0+PEmEILjA==
X-Received: by 2002:a05:6000:430a:b0:3e7:471c:1ddd with SMTP id
 ffacd0b85a97d-3e7471c223dmr11404998f8f.49.1757592044328; 
 Thu, 11 Sep 2025 05:00:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607770c2sm2215708f8f.8.2025.09.11.05.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:00:43 -0700 (PDT)
Message-ID: <5af10ddf-26a4-4022-9bf3-ade739fe0f78@redhat.com>
Date: Thu, 11 Sep 2025 14:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panic: Add a drm_panic/draw_test in debugfs
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250908090341.762049-1-jfalempe@redhat.com>
 <20250908090341.762049-4-jfalempe@redhat.com>
 <20250910-astute-vole-of-kindness-c6f6ce@houat>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250910-astute-vole-of-kindness-c6f6ce@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZK3um3vZajRV7dAsXIsRs-4lID2URgCmFZy7S4sFAas_1757592045
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

On 10/09/2025 12:49, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Sep 08, 2025 at 11:00:31AM +0200, Jocelyn Falempe wrote:
>> This adds a new drm_panic/draw_test file in debugfs.
>> This file allows to test the panic screen rendering at different
>> resolution and pixel format.
>> It's useful only for kernel developers that want to create or
>> customize a panic screen.
>>
>> If you want to check the result at 1024x768 using XRGB8888:
>>
>> cd /sys/kernel/debug/drm_panic/
>> exec 3<> draw_test
>> echo 1024x768:XR24 >&3
>> cat <&3 > ~/panic_screen.raw
>> exec 3<&-
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> I see what you meant in your previous version, and I misunderstood what
> you were saying, sorry.
> 
>> v2:
>>   * Use debugfs instead of sending the framebuffer through the kunit logs. (Thomas Zimmermann).
>>
>>   drivers/gpu/drm/Kconfig     |   2 +
>>   drivers/gpu/drm/drm_panic.c | 117 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 119 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index f7ea8e895c0c..0d3146070d9c 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -83,6 +83,8 @@ config DRM_PANIC_DEBUG
>>   	  Add dri/[device]/drm_panic_plane_x in the kernel debugfs, to force the
>>   	  panic handler to write the panic message to this plane scanout buffer.
>>   	  This is unsafe and should not be enabled on a production build.
>> +	  Also adds a drm_panic/draw_test file in debugfs, to easily test the
>> +	  panic screen rendering.
>>   	  If in doubt, say "N".
>>   
>>   config DRM_PANIC_SCREEN
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index d89812ff1935..0c01d6067eab 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -873,6 +873,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
>>    */
>>   #ifdef CONFIG_DRM_PANIC_DEBUG
>>   #include <linux/debugfs.h>
>> +#include <linux/vmalloc.h>
>>   
>>   static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_buf,
>>   				     size_t count, loff_t *ppos)
>> @@ -901,8 +902,122 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
>>   	debugfs_create_file(fname, 0200, plane->dev->debugfs_root,
>>   			    plane, &dbg_drm_panic_ops);
>>   }
>> +
>> +/*
>> + * Draw test interface
>> + * This can be used to check the panic screen at any resolution/pixel format.
>> + * The framebuffer memory is freed when the file is closed, so use this sh
>> + * script to write the parameters and read the result without closing the file.
>> + * cd /sys/kernel/debug/drm_panic/
>> + * exec 3<> draw_test
>> + * echo 1024x768:XR24 >&3
>> + * cat <&3 > ~/panic_screen.raw
>> + * exec 3<&-
>> + */
> 
> This should be documented properly, and I'm also kind of wondering how
> that would fit in the larger testing ecosystem.
> 
> Ie, how can someone that just starts contributing to Linux, or is
> setting up a CI platform, can have that test running.
> 
> kunit is great for that, kselftests to some extent too, but I'm not sure
> an ad-hoc interface is.

It's a bit harder to setup, but also allows to do some useful things.
I've written a small GUI application which displays the contents of the 
debugfs drm_panic/draw_test file in a window.
The displayed content is automatically refreshed whenever the window is 
resized, making it easy to inspect the DRM panic output at any screen 
resolution.
https://gitlab.com/kdj0c/panicviewer

> 
> Unless we create IGT tests for it too maybe?

Yes, I should also take a look at what IGT can do.

> 
> Maxime


-- 

Jocelyn

