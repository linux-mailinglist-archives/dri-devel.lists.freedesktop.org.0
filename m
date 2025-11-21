Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE24C78134
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 10:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7AC10E802;
	Fri, 21 Nov 2025 09:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LPj3U1tT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F3110E802
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763716519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JFo2mE6fOHrmlA/ZMdnm3Dkr70+Oswcpqho/VQVotU=;
 b=LPj3U1tTLtUOtxZQO2hnoRzpm4BPGmvmhVvzhPW1/REf3puhz9xstu0oCUVILTjRMJoaVJ
 vAh2HmYeyvtKvKRnjQw2XY4kUQ1OvLYXTnXWlPR0Mh+5eLDzW5pTngrrR8CcS0FyuK5w+i
 w4Sl2m9CC9R4bTCkAGxdx5SSjmgtZyU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-UNYXsVvRP6y9eJG4IR_zlQ-1; Fri, 21 Nov 2025 04:15:17 -0500
X-MC-Unique: UNYXsVvRP6y9eJG4IR_zlQ-1
X-Mimecast-MFC-AGG-ID: UNYXsVvRP6y9eJG4IR_zlQ_1763716516
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b30184be7so869835f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 01:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763716516; x=1764321316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0JFo2mE6fOHrmlA/ZMdnm3Dkr70+Oswcpqho/VQVotU=;
 b=ZOS1p2qQNk5ROnv+Orjmr4yYd5iMULeDVPZoAlff5jGNrPxZ7pAZcidTeuU7bFqzHn
 L18RG/UBjwOzyxUjH5tKUCgMYnsFLo+OB6T56V1UARAaS2gkWSJwS/L4BivRlE0Oxyh7
 UsbtTYfpf9ByqbcBZU6Haf1vofE2iFBW/QW1gKR1Hn70xOqcfFwETX/+Y2C3t103hdoL
 yxWbP9jNwhSizgEc+D0zJ3GQMoOHWeHwTAzC3LZredzWpn6a5ob6nbjLlWbCUX3SjPJV
 gjjNPuokObKfZXkjMOUbiVjodTkhEaK5c7H/0kxbKLQZyaig61p6114KvcH/CxNY/oxm
 Xa8A==
X-Gm-Message-State: AOJu0YyKDy8Cvzbs/4ySBLYspB+M+P2W/qXzJAb+BRBcLOAF6GLi0fN0
 OcO0fIwZ5Qxlysl4LkAkEoLYX7Hq5AMT+dj8XBIHrxosuqw5RQABWW4V1y+4HwcAwhmjwTdYf4B
 Y90MPvS8l48hMXyGcbGEZv3UCkMvFBiEG/73RbzaPXxQjp0ljgXJmKMvxh1YIGv9jxJW2SA==
X-Gm-Gg: ASbGnctTnq8JuoWgzplDpqkzGlKN2Ds1IKzCOmrGHWsU/W2UN4tzZxevvq87kjpdrCc
 O81pshvDrm/BbWxq5RKu4FhmfMWgDc1f9EnNA8gjpJmlBuSFUWbh9uQ9QuOvhjQGdg4c2f+450h
 vjlmWO0ahJdsXc+2Is8VJjI5A9hVDabK5dNQMeWQslKVPYw5n8gL/tttOA3uw58hBD1w9z5TC3w
 4FJqKbPCbapS98jEkLHSzXOEuEgX7XYB742FZobQa3CyvXrttCwVp3fRtaQW1fSc2PBLYI0cHUT
 zByihkZ1PcZUTwSiZ2D1QkNXPgvH6grqCke+pGSbMghagtiay15/hteyrA+q/L6yx+wBRdii09k
 NGB+tElY1atkFAqj+kfbQ+NHh0I8D0TxFbbLPbccEjhbG9le3tw==
X-Received: by 2002:a05:6000:2c0d:b0:42b:3afa:5e1d with SMTP id
 ffacd0b85a97d-42cc1ceeb13mr1511942f8f.20.1763716516015; 
 Fri, 21 Nov 2025 01:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvO2CFn/zBRWV4wtKHNWd5jCvsB7K9ec+y1XeQ+RMs7EJJt6HpBCW8BkE5QCPkxqxolclOUg==
X-Received: by 2002:a05:6000:2c0d:b0:42b:3afa:5e1d with SMTP id
 ffacd0b85a97d-42cc1ceeb13mr1511898f8f.20.1763716515513; 
 Fri, 21 Nov 2025 01:15:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa41d2sm9780925f8f.22.2025.11.21.01.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 01:15:14 -0800 (PST)
Message-ID: <3fce43d9-260a-4539-9b25-3dff42c4fdd7@redhat.com>
Date: Fri, 21 Nov 2025 10:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/client: Support emergency restore via sysrq
 for all clients
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 francesco@valla.it, rrameshbabu@nvidia.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20251110154616.539328-1-tzimmermann@suse.de>
 <20251110154616.539328-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251110154616.539328-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H7zJV8xHrCPgNozIKDY0ZdvxoRdeyWKI3L-y_SO-EJE_1763716516
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

On 10/11/2025 16:44, Thomas Zimmermann wrote:
> Move the sysrq functionality from DRM fbdev helpers to the DRM device
> and in-kernel clients, so that it becomes available on all clients.
> 
> DRM fbdev helpers support emergency restoration of the console output
> via a special key combination. Press SysRq+v to replace the current
> compositor with the kernel's output on the framebuffer console. This
> allows users to see the log messages during system emergencies.
> 
> By moving the functionality from fbdev helpers to the DRM device, any
> in-kernel client can serve as emergency output. This can be used to
> bring up drm_log, for example.
> 
> Each DRM device registers itself to the list of possible sysrq handlers.
> On receiving SysRq+v, the DRM core goes over all registered devices and
> restores an in-kernel DRM client for each of them.
> 
> See Documentation/admin-guide/sysrq.rst on how to invoke SysRq. Switch
> VTs to bring back the user-space compositor.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> v2:
> - declare placeholders as 'static inline' (kernel test robot)
> - fix grammar in commit description
> 
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
> index 7789f42027ff..33ff76ae52b2 100644
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
> index 5a3bed48ab1f..f893b1e3a596 100644
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
> +static inline void drm_client_sysrq_register(struct drm_device *dev)
> +{ }
> +static inline void drm_client_sysrq_unregister(struct drm_device *dev)
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

