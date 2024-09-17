Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91B997AC27
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 09:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E340B10E426;
	Tue, 17 Sep 2024 07:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hbYwzUjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8AE10E426
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726558363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlZOc2K+ISHHEauB0/GOs0ndNpHKjcVI8t+alRznKmc=;
 b=hbYwzUjjWEPBVfAEQmwtcsd+nyuaVdX3bFhVT/4gEHBB2/kBX1aE+76/0yOSlC5H2q/pLQ
 jyHGdiMfK3WpTzZw/de903lIDQT7OyL5hkE0QtlwQyseXmZIH1uAnERTPmhNkPJ4SRFuHL
 cuYLfCEhxYA1l4pXlZXl+6ZkDOMYG6Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-69TQ8ytNOFaw3bbAtJTEKQ-1; Tue, 17 Sep 2024 03:32:41 -0400
X-MC-Unique: 69TQ8ytNOFaw3bbAtJTEKQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374c79bf194so3458513f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 00:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726558360; x=1727163160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AlZOc2K+ISHHEauB0/GOs0ndNpHKjcVI8t+alRznKmc=;
 b=Ucj5DQc+i/4IVJzWqP/Qjfb72DOMPsuWDW57leljThzKvhagemkHzrmARTkWaoURxZ
 aUkHHTXcv8anVJSlXViunAx4lYsEgpcVG1wKwEU5XAGv4wzRZziy2CTtbZ69yN9maNuK
 2z5tUg/IO0betoRUmaP+DfUGF8duJFmYsCADOGWcFoeDjNPfPmPzqBJM7HfV403s40ct
 VsLDLY+ky8VFp7oVfsWeI7/8sXtWbENUrkN+zlwTrkv+yaaRRk8YP2BG8B9rxYGaW0P/
 e5NBlv6YR5S1rsNc4Ga1sKjfPQqKz7+yaH2eZRyMiaoJKFMbGv9Pj3RiaFBsFxYiJD+/
 z5Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtmees1bAVSFX5D4DQzOcupeDwQqn59OUk/bgrExBoJKK2UrDByfWV2+pHntDBFb8ltxKdWcWXPWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBNUplzACmQSqmiiiu9SUBNEznMd/ivcVASG3qRetldOJs8Sj3
 sX/0RFyMvZu6TdNVtXFcnAk29vIIqRq7Lm5Nk3mXl3j+k7ZH6emvalPyDTdk4APezi/ZlWwdiTu
 /Dh7QbrU8X8tIaYJr6w+ku/xLtHKpBwKZ4+uAwb5VmC/kbEB6aTKUBWwr9cM7nIB2ug==
X-Received: by 2002:a5d:6743:0:b0:371:6fba:d555 with SMTP id
 ffacd0b85a97d-378c2cf40bamr9450353f8f.18.1726558360452; 
 Tue, 17 Sep 2024 00:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaAbMrGgGXriWb7e3gKHYim9vObh3Aaz+SmelHnYDdYV4b+eQYgEyl+BBZEUFQQOR1QjfGbw==
X-Received: by 2002:a5d:6743:0:b0:371:6fba:d555 with SMTP id
 ffacd0b85a97d-378c2cf40bamr9450335f8f.18.1726558359840; 
 Tue, 17 Sep 2024 00:32:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73f996dsm8777118f8f.65.2024.09.17.00.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2024 00:32:39 -0700 (PDT)
Message-ID: <4427beee-f428-4c45-830d-d0cc58293bce@redhat.com>
Date: Tue, 17 Sep 2024 09:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Fix uninitialized spinlock acquisition with
 CONFIG_DRM_PANIC=n
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240916230103.611490-1-lyude@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240916230103.611490-1-lyude@redhat.com>
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

On 17/09/2024 01:00, Lyude Paul wrote:
> It turns out that if you happen to have a kernel config where
> CONFIG_DRM_PANIC is disabled and spinlock debugging is enabled, along with
> KMS being enabled - we'll end up trying to acquire an uninitialized
> spin_lock with drm_panic_lock() when we try to do a commit:

The raw spinlock should be initialized in drm_dev_init() [1] regardless 
of DRM_PANIC being enabled or not.

 From the call trace, it looks like you are calling 
drm_client_register() before calling drm_dev_register(), and that's 
probably the root cause.

I didn't find a doc saying drm_dev_register() should be done before 
drm_client_register(), but all drivers are doing it this way.

Can you try to do that in rvkms, and see if it fixes this error ?

Best regards,

-- 

Jocelyn

[1] 
https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/drm_drv.c#L642

> 
>    rvkms rvkms.0: [drm:drm_atomic_commit] committing 0000000068d2ade1
>    INFO: trying to register non-static key.
>    The code is fine but needs lockdep annotation, or maybe
>    you didn't initialize this object before use?
>    turning off the locking correctness validator.
>    CPU: 4 PID: 1347 Comm: modprobe Not tainted 6.10.0-rc1Lyude-Test+ #272
>    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20240524-3.fc40 05/24/2024
>    Call Trace:
>     <TASK>
>     dump_stack_lvl+0x77/0xa0
>     assign_lock_key+0x114/0x120
>     register_lock_class+0xa8/0x2c0
>     __lock_acquire+0x7d/0x2bd0
>     ? __vmap_pages_range_noflush+0x3a8/0x550
>     ? drm_atomic_helper_swap_state+0x2ad/0x3a0
>     lock_acquire+0xec/0x290
>     ? drm_atomic_helper_swap_state+0x2ad/0x3a0
>     ? lock_release+0xee/0x310
>     _raw_spin_lock_irqsave+0x4e/0x70
>     ? drm_atomic_helper_swap_state+0x2ad/0x3a0
>     drm_atomic_helper_swap_state+0x2ad/0x3a0
>     drm_atomic_helper_commit+0xb1/0x270
>     drm_atomic_commit+0xaf/0xe0
>     ? __pfx___drm_printfn_info+0x10/0x10
>     drm_client_modeset_commit_atomic+0x1a1/0x250
>     drm_client_modeset_commit_locked+0x4b/0x180
>     drm_client_modeset_commit+0x27/0x50
>     __drm_fb_helper_restore_fbdev_mode_unlocked+0x76/0x90
>     drm_fb_helper_set_par+0x38/0x40
>     fbcon_init+0x3c4/0x690
>     visual_init+0xc0/0x120
>     do_bind_con_driver+0x409/0x4c0
>     do_take_over_console+0x233/0x280
>     do_fb_registered+0x11f/0x210
>     fbcon_fb_registered+0x2c/0x60
>     register_framebuffer+0x248/0x2a0
>     __drm_fb_helper_initial_config_and_unlock+0x58a/0x720
>     drm_fbdev_generic_client_hotplug+0x6e/0xb0
>     drm_client_register+0x76/0xc0
>     _RNvXs_CsHeezP08sTT_5rvkmsNtB4_5RvkmsNtNtCs1cdwasc6FUb_6kernel8platform6Driver5probe+0xed2/0x1060 [rvkms]
>     ? _RNvMs_NtCs1cdwasc6FUb_6kernel8platformINtB4_7AdapterNtCsHeezP08sTT_5rvkms5RvkmsE14probe_callbackBQ_+0x2b/0x70 [rvkms]
>     ? acpi_dev_pm_attach+0x25/0x110
>     ? platform_probe+0x6a/0xa0
>     ? really_probe+0x10b/0x400
>     ? __driver_probe_device+0x7c/0x140
>     ? driver_probe_device+0x22/0x1b0
>     ? __device_attach_driver+0x13a/0x1c0
>     ? __pfx___device_attach_driver+0x10/0x10
>     ? bus_for_each_drv+0x114/0x170
>     ? __device_attach+0xd6/0x1b0
>     ? bus_probe_device+0x9e/0x120
>     ? device_add+0x288/0x4b0
>     ? platform_device_add+0x75/0x230
>     ? platform_device_register_full+0x141/0x180
>     ? rust_helper_platform_device_register_simple+0x85/0xb0
>     ? _RNvMs2_NtCs1cdwasc6FUb_6kernel8platformNtB5_6Device13create_simple+0x1d/0x60
>     ? _RNvXs0_CsHeezP08sTT_5rvkmsNtB5_5RvkmsNtCs1cdwasc6FUb_6kernel6Module4init+0x11e/0x160 [rvkms]
>     ? 0xffffffffc083f000
>     ? init_module+0x20/0x1000 [rvkms]
>     ? kernfs_xattr_get+0x3e/0x80
>     ? do_one_initcall+0x148/0x3f0
>     ? __lock_acquire+0x5ef/0x2bd0
>     ? __lock_acquire+0x5ef/0x2bd0
>     ? __lock_acquire+0x5ef/0x2bd0
>     ? put_cpu_partial+0x51/0x1d0
>     ? lock_acquire+0xec/0x290
>     ? put_cpu_partial+0x51/0x1d0
>     ? lock_release+0xee/0x310
>     ? put_cpu_partial+0x51/0x1d0
>     ? fs_reclaim_acquire+0x69/0xf0
>     ? lock_acquire+0xec/0x290
>     ? fs_reclaim_acquire+0x69/0xf0
>     ? kfree+0x22f/0x340
>     ? lock_release+0xee/0x310
>     ? kmalloc_trace_noprof+0x48/0x340
>     ? do_init_module+0x22/0x240
>     ? kmalloc_trace_noprof+0x155/0x340
>     ? do_init_module+0x60/0x240
>     ? __se_sys_finit_module+0x2e0/0x3f0
>     ? do_syscall_64+0xa4/0x180
>     ? syscall_exit_to_user_mode+0x108/0x140
>     ? do_syscall_64+0xb0/0x180
>     ? vma_end_read+0xd0/0xe0
>     ? do_user_addr_fault+0x309/0x640
>     ? clear_bhb_loop+0x45/0xa0
>     ? clear_bhb_loop+0x45/0xa0
>     ? clear_bhb_loop+0x45/0xa0
>     ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
>     </TASK>
> 
> Fix this by stubbing these macros out when this config option isn't
> enabled, along with fixing the unused variable warning that introduces.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Fixes: e2a1cda3e0c7 ("drm/panic: Add drm panic locking")
> Cc: <stable@vger.kernel.org> # v6.10+
> 
> ---
> 
> V2:
> * Use static inline instead of macros so we don't need
>    __maybe_unused
> 
> ---
>   drivers/gpu/drm/drm_atomic_helper.c |  2 +-
>   include/drm/drm_panic.h             | 14 ++++++++++++++
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 43cdf39019a44..5186d2114a503 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3015,7 +3015,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>   				  bool stall)
>   {
>   	int i, ret;
> -	unsigned long flags;
> +	unsigned long flags = 0;
>   	struct drm_connector *connector;
>   	struct drm_connector_state *old_conn_state, *new_conn_state;
>   	struct drm_crtc *crtc;
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index 54085d5d05c34..f4e1fa9ae607a 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -64,6 +64,8 @@ struct drm_scanout_buffer {
>   
>   };
>   
> +#ifdef CONFIG_DRM_PANIC
> +
>   /**
>    * drm_panic_trylock - try to enter the panic printing critical section
>    * @dev: struct drm_device
> @@ -149,4 +151,16 @@ struct drm_scanout_buffer {
>   #define drm_panic_unlock(dev, flags) \
>   	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
>   
> +#else
> +
> +static inline bool drm_panic_trylock(struct drm_device *dev, unsigned long flags)
> +{
> +	return true;
> +}
> +
> +static inline void drm_panic_lock(struct drm_device *dev, unsigned long flags) {}
> +static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags) {}
> +
> +#endif
> +
>   #endif /* __DRM_PANIC_H__ */
> 
> base-commit: bf05aeac230e390a5aee4bd3dc978b0c4d7e745f

