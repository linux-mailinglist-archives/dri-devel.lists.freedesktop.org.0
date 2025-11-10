Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A6C4715B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473D610E3D4;
	Mon, 10 Nov 2025 14:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H8bX/aKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEF110E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762783464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xuk1X+36TOirMGRLYfDLISDdL5z2Oi58jGgOBqhD2/A=;
 b=H8bX/aKYVYbMnf19tUNIRU3YkI8US5NF/V1TzNePwbgpdRnw0nDGVNFdHMv3oA7rFULPb9
 DtKX+sW42q2xpTXew1THiTnGMyDErSPiFBsCDxWG/lN7ycP5goGfOBbn01KV85YMRQyLCx
 K6IpvR1eKiWd+VFBSPacTrptt5/7s64=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-rdPOatF_P0WPBLmp67EMwQ-1; Mon, 10 Nov 2025 09:04:23 -0500
X-MC-Unique: rdPOatF_P0WPBLmp67EMwQ-1
X-Mimecast-MFC-AGG-ID: rdPOatF_P0WPBLmp67EMwQ_1762783462
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4773e108333so18647375e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 06:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762783462; x=1763388262;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xuk1X+36TOirMGRLYfDLISDdL5z2Oi58jGgOBqhD2/A=;
 b=E2liU+7pqLExIL8uVdYspBz2pHtWyaHDrmh++/rp3+P6uVHYuuqoyKKsPZXQbFR4kP
 rPCtdZ2eGwfFgzCDtIL+1KJmrBafC4/KcKEUn2eH9MX5khv0/rvOaxetbAnz0G+hxtas
 LJ8mxAX4jbDmcKogOEHwB1HtpK2maLVoHY/v176qCtyXrUK9Un0niAsftNWR7VlK7KQh
 gZqk8X2ouKDaBbyfpSTHy1m7OAFbXTmC0shs0YD1ANEXjVEdF4QF5pGKugly900teexr
 GnhKwOBrYK6DGZAd1Z74QebcEDu9uUARtuyTiVK82h43xlp5PYFuh1BNAs2zxTMJ79i0
 cudg==
X-Gm-Message-State: AOJu0YzTfckHRbtzvN9UNHa5kbyCYHLzuHaVlcz+yqv1LLcNROZXRqWS
 uciYyb/aDCBWRR1LIOhjC19JXC5Sh1T0B52dxRUPYatGgSMZT2K/meUThF10wuVj1SfvOTaPAZJ
 ubE6bB2TgzoYNI7d2dn6HRgA1f5BS3OLVyVtQQMtMkHgL13NuzoTdKkzd2pUblwjzFvtjYhKLgc
 6CjQRwqvQ9rZpgkaSRItWgAFbJJu1jmsh5zKTVjKUZmhowCPQpzqLSjw==
X-Gm-Gg: ASbGncubBZwUfQP708Ou9oBcoLxpUfobETy09LzVx63tmfgTA8Lx6vNbruO0uV7VyBc
 +94acyEZ9mbxewYUFdiwTYyh9iQ+AsSuc//2OCnLOZXJuFM5gpa4VG6Tv6pHo1rcn3PBl+EyqYt
 6dZmdUQxVMkROfcpW78aI27zxBn3FlKdtb69wNb+W4WQah9oK0UTWh0Ol3pyRQMtb4/P+kDeBui
 YMpCkBRgJ1LTX5bDJ8ZIjy/FNExsyX7dEb033e4i52IIIXhtAVzuA4Wkrfasx7d8uLx5AIcc5jy
 sXZgknRenYeM7zzToB9KeEXoHIRRQTlrcthK7YlGDpQUPchs1l1KkGrqnAnJQ5evks/0ya5Qxow
 BzqJVZTPavmotkgO7eJ3h08QdksBb3V20S0wvp3A=
X-Received: by 2002:a05:600c:3105:b0:477:1622:7f78 with SMTP id
 5b1f17b1804b1-47773293fd4mr69211985e9.40.1762783461614; 
 Mon, 10 Nov 2025 06:04:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe4BsonZdAgEz1ZaAqmDzT1iJMHUJ4doZBvORMC8GAKgFjtL+3PBJe+V87CzDd6Q94fa+HcQ==
X-Received: by 2002:a05:600c:3105:b0:477:1622:7f78 with SMTP id
 5b1f17b1804b1-47773293fd4mr69211605e9.40.1762783461001; 
 Mon, 10 Nov 2025 06:04:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47774df2d80sm131934815e9.14.2025.11.10.06.04.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:04:20 -0800 (PST)
Message-ID: <1eca79d6-6c19-4353-8e28-5ae11bf394d9@redhat.com>
Date: Mon, 10 Nov 2025 15:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/client: Support emergency restore via sysrq for
 all clients
To: dri-devel@lists.freedesktop.org
References: <20251107142612.467817-1-tzimmermann@suse.de>
 <20251107142612.467817-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251107142612.467817-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 707bupJ_MQY167XiF8KpzxSAVQGwzSAvxhslQq294C0_1762783462
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

On 07/11/2025 15:19, Thomas Zimmermann wrote:
> Move the sysrq functionality from DRM fb-helpers to the DRM device
> and in-kernel clients, so that all it becomes available on all clients.
> 
> DRM fbdev helpers support emergency restoration of the console output
> via a special key combination. Press SysRq+v to replace the current
> compositor with the kernel's output on the text-mode console. This
> allows users to see the log messages during system emergencies.
> 
> By moving the functionality from fb-helper to DRM devices, any
> in-kernel client can serve as emergency output. This can be used to
> bring up drm_log, for example.
> 
> Each DRM device registers itself to the list possible sysrq handlers.
> On receiving SysRq+v, the DRM core goes over all registered devices and
> restores an in-kernel DRM client for each of them.
> 
> See Documentation/admin-guide/sysrq.rst on how to invoke SysRq. Switch
> VTs to bring back the user-space compositor.

Thanks it looks good to me.
 From the kernel test robot report, there is a missing "static" in
drm_client_sysrq_register() and drm_client_sysrq_unregister()

with that fixed:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Makefile           |  3 +-
>   drivers/gpu/drm/drm_client.c       |  1 +
>   drivers/gpu/drm/drm_client_sysrq.c | 65 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_drv.c          |  3 ++
>   drivers/gpu/drm/drm_fb_helper.c    | 45 +--------------------
>   drivers/gpu/drm/drm_internal.h     | 11 +++++
>   include/drm/drm_device.h           |  8 ++++
>   7 files changed, 91 insertions(+), 45 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_client_sysrq.c
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index c2672f369aed..9901534948e5 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -76,7 +76,8 @@ drm-y := \
>   drm-$(CONFIG_DRM_CLIENT) += \
>   	drm_client.o \
>   	drm_client_event.o \
> -	drm_client_modeset.o
> +	drm_client_modeset.o \
> +	drm_client_sysrq.o
>   drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
>   drm-$(CONFIG_COMPAT) += drm_ioc32.o
>   drm-$(CONFIG_DRM_PANEL) += drm_panel.o
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 504ec5bdfa2c..a82d741e6630 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -11,6 +11,7 @@
>   #include <linux/slab.h>
>   
>   #include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
> diff --git a/drivers/gpu/drm/drm_client_sysrq.c b/drivers/gpu/drm/drm_client_sysrq.c
> new file mode 100644
> index 000000000000..eea660096f1b
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_client_sysrq.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +#include <linux/sysrq.h>
> +
> +#include <drm/drm_client_event.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +
> +#include "drm_internal.h"
> +
> +#ifdef CONFIG_MAGIC_SYSRQ
> +static LIST_HEAD(drm_client_sysrq_dev_list);
> +static DEFINE_MUTEX(drm_client_sysrq_dev_lock);
> +
> +/* emergency restore, don't bother with error reporting */
> +static void drm_client_sysrq_restore_work_fn(struct work_struct *ignored)
> +{
> +	struct drm_device *dev;
> +
> +	guard(mutex)(&drm_client_sysrq_dev_lock);
> +
> +	list_for_each_entry(dev, &drm_client_sysrq_dev_list, client_sysrq_list) {
> +		if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
> +			continue;
> +
> +		drm_client_dev_restore(dev, true);
> +	}
> +}
> +
> +static DECLARE_WORK(drm_client_sysrq_restore_work, drm_client_sysrq_restore_work_fn);
> +
> +static void drm_client_sysrq_restore_handler(u8 ignored)
> +{
> +	schedule_work(&drm_client_sysrq_restore_work);
> +}
> +
> +static const struct sysrq_key_op drm_client_sysrq_restore_op = {
> +	.handler = drm_client_sysrq_restore_handler,
> +	.help_msg = "force-fb(v)",
> +	.action_msg = "Restore framebuffer console",
> +};
> +
> +void drm_client_sysrq_register(struct drm_device *dev)
> +{
> +	guard(mutex)(&drm_client_sysrq_dev_lock);
> +
> +	if (list_empty(&drm_client_sysrq_dev_list))
> +		register_sysrq_key('v', &drm_client_sysrq_restore_op);
> +
> +	list_add(&dev->client_sysrq_list, &drm_client_sysrq_dev_list);
> +}
> +
> +void drm_client_sysrq_unregister(struct drm_device *dev)
> +{
> +	guard(mutex)(&drm_client_sysrq_dev_lock);
> +
> +	/* remove device from global restore list */
> +	if (!drm_WARN_ON(dev, list_empty(&dev->client_sysrq_list)))
> +		list_del(&dev->client_sysrq_list);
> +
> +	/* no devices left; unregister key */
> +	if (list_empty(&drm_client_sysrq_dev_list))
> +		unregister_sysrq_key('v', &drm_client_sysrq_restore_op);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8e3cb08241c8..2915118436ce 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -733,6 +733,7 @@ static int drm_dev_init(struct drm_device *dev,
>   	INIT_LIST_HEAD(&dev->filelist);
>   	INIT_LIST_HEAD(&dev->filelist_internal);
>   	INIT_LIST_HEAD(&dev->clientlist);
> +	INIT_LIST_HEAD(&dev->client_sysrq_list);
>   	INIT_LIST_HEAD(&dev->vblank_event_list);
>   
>   	spin_lock_init(&dev->event_lock);
> @@ -1100,6 +1101,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>   			goto err_unload;
>   	}
>   	drm_panic_register(dev);
> +	drm_client_sysrq_register(dev);
>   
>   	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
>   		 driver->name, driver->major, driver->minor,
> @@ -1144,6 +1146,7 @@ void drm_dev_unregister(struct drm_device *dev)
>   {
>   	dev->registered = false;
>   
> +	drm_client_sysrq_unregister(dev);
>   	drm_panic_unregister(dev);
>   
>   	drm_client_dev_unregister(dev);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 1392738ce2fe..9a734017756b 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -32,7 +32,6 @@
>   #include <linux/console.h>
>   #include <linux/export.h>
>   #include <linux/pci.h>
> -#include <linux/sysrq.h>
>   #include <linux/vga_switcheroo.h>
>   
>   #include <drm/drm_atomic.h>
> @@ -270,42 +269,6 @@ int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper, b
>   }
>   EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
>   
> -#ifdef CONFIG_MAGIC_SYSRQ
> -/* emergency restore, don't bother with error reporting */
> -static void drm_fb_helper_restore_work_fn(struct work_struct *ignored)
> -{
> -	struct drm_fb_helper *helper;
> -
> -	mutex_lock(&kernel_fb_helper_lock);
> -	list_for_each_entry(helper, &kernel_fb_helper_list, kernel_fb_list) {
> -		struct drm_device *dev = helper->dev;
> -
> -		if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
> -			continue;
> -
> -		mutex_lock(&helper->lock);
> -		drm_client_modeset_commit_locked(&helper->client);
> -		mutex_unlock(&helper->lock);
> -	}
> -	mutex_unlock(&kernel_fb_helper_lock);
> -}
> -
> -static DECLARE_WORK(drm_fb_helper_restore_work, drm_fb_helper_restore_work_fn);
> -
> -static void drm_fb_helper_sysrq(u8 dummy1)
> -{
> -	schedule_work(&drm_fb_helper_restore_work);
> -}
> -
> -static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = {
> -	.handler = drm_fb_helper_sysrq,
> -	.help_msg = "force-fb(v)",
> -	.action_msg = "Restore framebuffer console",
> -};
> -#else
> -static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = { };
> -#endif
> -
>   static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
> @@ -602,11 +565,8 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>   	drm_fb_helper_release_info(fb_helper);
>   
>   	mutex_lock(&kernel_fb_helper_lock);
> -	if (!list_empty(&fb_helper->kernel_fb_list)) {
> +	if (!list_empty(&fb_helper->kernel_fb_list))
>   		list_del(&fb_helper->kernel_fb_list);
> -		if (list_empty(&kernel_fb_helper_list))
> -			unregister_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
> -	}
>   	mutex_unlock(&kernel_fb_helper_lock);
>   
>   	if (!fb_helper->client.funcs)
> @@ -1840,9 +1800,6 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
>   		 info->node, info->fix.id);
>   
>   	mutex_lock(&kernel_fb_helper_lock);
> -	if (list_empty(&kernel_fb_helper_list))
> -		register_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
> -
>   	list_add(&fb_helper->kernel_fb_list, &kernel_fb_helper_list);
>   	mutex_unlock(&kernel_fb_helper_lock);
>   
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 5a3bed48ab1f..59cbac12a6d6 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -56,6 +56,17 @@ static inline void drm_client_debugfs_init(struct drm_device *dev)
>   { }
>   #endif
>   
> +/* drm_client_sysrq.c */
> +#if defined(CONFIG_DRM_CLIENT) && defined(CONFIG_MAGIC_SYSRQ)
> +void drm_client_sysrq_register(struct drm_device *dev);
> +void drm_client_sysrq_unregister(struct drm_device *dev);
> +#else
> +void drm_client_sysrq_register(struct drm_device *dev)
> +{ }
> +void drm_client_sysrq_unregister(struct drm_device *dev)
> +{ }
> +#endif
> +
>   /* drm_file.c */
>   extern struct mutex drm_global_mutex;
>   bool drm_dev_needs_global_mutex(struct drm_device *dev);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 778b2cca6c49..5af49c5c3778 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -238,6 +238,14 @@ struct drm_device {
>   	 */
>   	struct list_head clientlist;
>   
> +	/**
> +	 * @client_sysrq_list:
> +	 *
> +	 * Entry into list of devices registered for sysrq. Allows in-kernel
> +	 * clients on this device to handle sysrq keys.
> +	 */
> +	struct list_head client_sysrq_list;
> +
>   	/**
>   	 * @vblank_disable_immediate:
>   	 *

