Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98C86CAC4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 14:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC8210E0A3;
	Thu, 29 Feb 2024 13:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G3MAlkXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB0710E0A3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709214991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIemOJP3L2jTkOIUjJfFhEyW5v/qMUkwBnPwQUw/KP4=;
 b=G3MAlkXld5GKgL00wj8XzMFIiuX1C60LzkMXpr50PZIfpSuvAL78H9/T1g8ie+hL8jM+zP
 W6hBt77pY27QG/Yq01h3lqpC/sOY1byRvk3pCmJBgeQlB8BhQhSEeAu6yh7HP0X5YvoV0U
 b+W6Nz4mZkiWJdSw40DjZWvLatwcKok=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-XLiR6YRLOK2rFBBKl8xOmg-1; Thu, 29 Feb 2024 08:56:28 -0500
X-MC-Unique: XLiR6YRLOK2rFBBKl8xOmg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-787988f273dso97437885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 05:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709214988; x=1709819788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tIemOJP3L2jTkOIUjJfFhEyW5v/qMUkwBnPwQUw/KP4=;
 b=MucFUJyD2ROhQBtYiX0H3GtWc5XbjRnC9Ra/cmHYVAiXi8IriL4Op2X5kVv49m7ICf
 ra33IC/TFP76YpnWzft2rEKHO+ZR2DhzsvJ9FhoePEdzgTLz00T6Z0Kn+wIqAMj1mSVa
 POqQ0zIzH9WUNAPHJD+tQn95ol/WnLuHN8Q0E7gJ2nCZxcuQZoTKgvdUbibWd02rxf/e
 d1Mfgy3FalvAqRKrRrjn2XOW8cvWCrfcHYa9XVE/TTFpbtr1jgQwO5C3esA0nOND+PvU
 AV1t57epjRgEicSDyV7qnbCrxl0P06ZyNLaGfoqWnXorTpBdZgwPbJVdYSPQNn4sbMVH
 VjMQ==
X-Gm-Message-State: AOJu0YzeIa0BadQX+RZjqUe2SJF0qL744lgfvvjDISWM4CQnBSOB3h+X
 FVbtUVgFpYw8JbxNaPbU3A7VVSxKkWhcBR3J2sYZSHVN6IRniqKYEDC5gJMSV0wluRcA4g9M5Dj
 cVU8eweMVvGAB43bdH1snwmtigYxLeXvIiWATW9DYzbaOZAiNxlmbT4AfARrkEtkiUQ==
X-Received: by 2002:a05:620a:5e07:b0:787:e01a:b1fc with SMTP id
 xz7-20020a05620a5e0700b00787e01ab1fcmr1988613qkn.34.1709214987846; 
 Thu, 29 Feb 2024 05:56:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoIEVAOytsc0hcAHs2zdV4QMmBZt789iBzeiGXplAQ6yA3B1K8iSTFm26orcVDBlFA3stGKg==
X-Received: by 2002:a05:620a:5e07:b0:787:e01a:b1fc with SMTP id
 xz7-20020a05620a5e0700b00787e01ab1fcmr1988587qkn.34.1709214987501; 
 Thu, 29 Feb 2024 05:56:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a37ef11000000b00787cad5dceesm692451qkk.18.2024.02.29.05.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:56:27 -0800 (PST)
Message-ID: <0d30aa98-945e-47c0-9019-6d01e20f3393@redhat.com>
Date: Thu, 29 Feb 2024 14:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] drm/panic: Add debugfs entry to test without
 triggering panic.
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, javierm@redhat.com, 
 bluescreen_avenger@verizon.net, noralf@tronnes.org, gpiccoli@igalia.com
References: <20240227100459.194478-1-jfalempe@redhat.com>
 <20240227100459.194478-4-jfalempe@redhat.com>
 <ZeBowX0Rq-c7HGDh@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZeBowX0Rq-c7HGDh@phenom.ffwll.local>
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



On 29/02/2024 12:21, Daniel Vetter wrote:
> On Tue, Feb 27, 2024 at 11:04:14AM +0100, Jocelyn Falempe wrote:
>> Add a debugfs file, so you can test drm_panic without freezing
>> your machine. This is unsafe, and should be enabled only for
>> developer or tester.
>>
>> to display the drm_panic screen, just run:
>> echo 1 > /sys/kernel/debug/drm_panic/trigger
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig     |  9 +++++++
>>   drivers/gpu/drm/drm_panic.c | 47 +++++++++++++++++++++++++++++++++++++
>>   2 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index c17d8a8f6877..8dcea29f595c 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -125,6 +125,15 @@ config DRM_PANIC_BACKGROUND_COLOR
>>   	depends on DRM_PANIC
>>   	default 0x000000
>>   
>> +config DRM_PANIC_DEBUG
>> +	bool "Add a debug fs entry to trigger drm_panic"
>> +	depends on DRM_PANIC && DEBUG_FS
>> +	help
>> +	  Add drm_panic/trigger in the kernel debugfs, to force the panic
>> +	  handler to write the panic message to the scanout buffer. This is
>> +	  unsafe and should not be enabled on a production build.
>> +	  If in doubt, say "N".
>> +
>>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>           bool "Enable refcount backtrace history in the DP MST helpers"
>>   	depends on STACKTRACE_SUPPORT
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index c9f386476ef9..c5d3f725c5f5 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -398,3 +398,50 @@ void drm_panic_unregister(struct drm_plane *plane)
>>   }
>>   EXPORT_SYMBOL(drm_panic_unregister);
>>   
>> +
>> +/*
>> + * DEBUG, This is currently unsafe.
>> + * Also it will call all panic_notifier, since there is no way to filter and
>> + * only call the drm_panic notifier.
>> + */
>> +#ifdef CONFIG_DRM_PANIC_DEBUG
>> +#include <linux/debugfs.h>
>> +
>> +static struct dentry *debug_dir;
>> +static struct dentry *debug_trigger;
>> +
>> +static ssize_t dbgfs_trigger_write(struct file *file, const char __user *user_buf,
>> +				   size_t count, loff_t *ppos)
>> +{
>> +	bool run;
>> +
>> +	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run)
>> +		atomic_notifier_call_chain(&panic_notifier_list, 0, "Test drm panic from debugfs");
> 
> Since this is just the general panic notifier it feels very misplaced in
> the drm subsystem. I think moving that code into the core panic code makes
> a lot more sense, then we'd also have all the right people on Cc: to
> figure out how we can best recreate the correct calling context (like nmi
> context or whatever) for best case simulation of panic code. John Ogness
> definitely needs to see this and ack, wherever we put it.

I'm not sure it makes sense to test all panic notifiers at once.

So maybe I can write an atomic_notifier_call_chain_with_filter(), and 
filter on the callback address, so it will only call the drm_panic 
handlers ?

-- 

Jocelyn

> -Sima
> 
>> +	return count;
>> +}
>> +
>> +static const struct file_operations dbg_drm_panic_ops = {
>> +	.owner = THIS_MODULE,
>> +	.write = dbgfs_trigger_write,
>> +};
>> +
>> +static int __init debugfs_start(void)
>> +{
>> +	debug_dir = debugfs_create_dir("drm_panic", NULL);
>> +
>> +	if (IS_ERR(debug_dir))
>> +		return PTR_ERR(debug_dir);
>> +	debug_trigger = debugfs_create_file("trigger", 0200, debug_dir,
>> +					    NULL, &dbg_drm_panic_ops);
>> +	return 0;
>> +}
>> +
>> +static void __exit debugfs_end(void)
>> +{
>> +	debugfs_remove_recursive(debug_dir);
>> +}
>> +
>> +module_init(debugfs_start);
>> +module_exit(debugfs_end);
>> +
>> +#endif
>> -- 
>> 2.43.0
>>
> 

