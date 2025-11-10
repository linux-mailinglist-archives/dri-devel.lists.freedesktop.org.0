Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D6C47134
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F7610E0B7;
	Mon, 10 Nov 2025 14:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J//6U557";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E3A10E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762783364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+1NLhv4ynxcUSugYQr6fzZ4Za57RfULtHeBZTwsduU=;
 b=J//6U5572okMqMM1qaaAj+MeKsS48e3janH809tRdE7YXnrkuawKe9qT6gA2aFXYe2Svow
 vL7ZIFLXZFGyzud29getADMvT7WED3sYQMXtrfKPhZsmQHYBb3YcSnvnYYcf4k9JYhxDbH
 lxkqdkExCf5fs5hdkimjJ7Fy8cRw/Ec=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-pxVj4ZrmN6a9MiINpqMuDw-1; Mon, 10 Nov 2025 09:02:33 -0500
X-MC-Unique: pxVj4ZrmN6a9MiINpqMuDw-1
X-Mimecast-MFC-AGG-ID: pxVj4ZrmN6a9MiINpqMuDw_1762783352
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4777b59119dso10170705e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 06:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762783352; x=1763388152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+1NLhv4ynxcUSugYQr6fzZ4Za57RfULtHeBZTwsduU=;
 b=UDJGlxeESS9vJ4Na4735VtnA83X1iE5qFPkh5Sy+xglpe8DE/xS5i6kJEVJXkELmPd
 OaqnvJkuTDsPDs3r7+loGpzRBu1fdxbhMoJU27Q2fE8nQv6LInvoeL4gy4hvl7f7nZgU
 jf8031c8KHanF4FV9DFyFcqWGclgBNsH77hJGAyhP85mn732rHHtZbvfq9+Y3pL1TVyr
 M/BZhhXqK7OV3QupHGYF8xoBfveL81nTa/KJc5HhbO7hHhyukxgoIWAd2LOwtv3P3UDz
 N7YWhuP5biCpboZhqAHOf4qH7U3frbNSPwU61TtHbW0le58fUcbHh2hLwJ0HX1fgi4yP
 sJSw==
X-Gm-Message-State: AOJu0Yw2eppQ2w0b1eUzgpVxuAX4l1eEHYlpJJ0XT5MPenW6IkUtkhqv
 i6T3WO6zeFmm0YpGdlWNmv+mGLDJZXZJK9OGym0/X9735iMh7Z6pkAawFtVxxn8u8JgYPGZtQyM
 EYUtHOTJMveIUBCSYODDcevzB1g2AVXSCdNVpRIDSsRM5NBdHKa7FYZruQ55uF0CBNm/yzg==
X-Gm-Gg: ASbGncu7l3LLs6lDjDVFxBTiIlsU4Ve42uUn86f5ThlZR9DFKPGxZM9JUtVeutLl3lb
 qLzfXaCJcdpl4bEZWC0wwpnVHIPyiJBFJPHy50VZsrIaaaPR3scxP+uwhOf5z4o/MuqeMzKDzwQ
 RUq6KMzmHcdzja7kKrXECkNrV8ErPz0/EKFu6P6IWTRRn9cAjlZfjiZC5xbjSlGgibaWRk7ryu6
 geb+sG40bBVJ0bk1HMxJ9f1n9kwcOVfeKiIisRqVD/Ul5T64zDffmegUWE+s7qts8M52M57bOfl
 Hlsyn3IsjWdwq5Tmw55j0dtzdyLCou+gc/HEcbE9Xi2Li4ndZrh9V6tST1CJMB3D2XsVGKBR0Qz
 awOVB2/2LzQ8d5a+qGrAKJmKsj+SJeq/ov1EnkXs=
X-Received: by 2002:a05:600c:6c90:b0:477:3f35:66d5 with SMTP id
 5b1f17b1804b1-47773271a8fmr37054765e9.26.1762783351773; 
 Mon, 10 Nov 2025 06:02:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaBKIohJ95g0BQDXG+Q59OIuRNMSygwDSAKhcDi9d3T3pdiSgJxUCU+yL0tt+Xh55xDeNIlw==
X-Received: by 2002:a05:600c:6c90:b0:477:3f35:66d5 with SMTP id
 5b1f17b1804b1-47773271a8fmr37054405e9.26.1762783351241; 
 Mon, 10 Nov 2025 06:02:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce2cde0sm325813385e9.15.2025.11.10.06.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:02:30 -0800 (PST)
Message-ID: <ac63816c-b12a-4127-b975-ee80b53ee11f@redhat.com>
Date: Mon, 10 Nov 2025 15:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/client: Pass force parameter to client restore
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20251107142612.467817-1-tzimmermann@suse.de>
 <20251107142612.467817-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251107142612.467817-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ub_GLJxtRvv3pUkJwU0wtPH1RDMp3h6dnN-BnxYjil8_1762783352
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
> Add force parameter to client restore and pass value through the
> layers. The only currently used value is false.
> 
> If force is true, the client should restore its display even if it
> does not hold the DRM master lock. This is be required for emergency
> output, such as sysrq.
> 
> While at it, inline drm_fb_helper_lastclose(), which is a trivial
> wrapper around drm_fb_helper_restore_fbdev_mode_unlocked().

Thanks for this work, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_fbdev_client.c |  6 ++++--
>   drivers/gpu/drm/drm_client_event.c         |  4 ++--
>   drivers/gpu/drm/drm_fb_helper.c            | 24 ++++++----------------
>   drivers/gpu/drm/drm_file.c                 |  2 +-
>   include/drm/drm_client.h                   |  8 +++++---
>   include/drm/drm_client_event.h             |  4 ++--
>   include/drm/drm_fb_helper.h                |  8 ++------
>   7 files changed, 22 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index 47e5f27eee58..28951e392482 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -38,9 +38,11 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>   	}
>   }
>   
> -static int drm_fbdev_client_restore(struct drm_client_dev *client)
> +static int drm_fbdev_client_restore(struct drm_client_dev *client, bool force)
>   {
> -	drm_fb_helper_lastclose(client->dev);
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +
> +	drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, force);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index d25dc5250983..7b3e362f7926 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -102,7 +102,7 @@ void drm_client_dev_hotplug(struct drm_device *dev)
>   }
>   EXPORT_SYMBOL(drm_client_dev_hotplug);
>   
> -void drm_client_dev_restore(struct drm_device *dev)
> +void drm_client_dev_restore(struct drm_device *dev, bool force)
>   {
>   	struct drm_client_dev *client;
>   	int ret;
> @@ -115,7 +115,7 @@ void drm_client_dev_restore(struct drm_device *dev)
>   		if (!client->funcs || !client->funcs->restore)
>   			continue;
>   
> -		ret = client->funcs->restore(client);
> +		ret = client->funcs->restore(client, force);
>   		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>   		if (!ret) /* The first one to return zero gets the privilege to restore */
>   			break;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 53e9dc0543de..1392738ce2fe 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -255,6 +255,7 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
>   /**
>    * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configuration
>    * @fb_helper: driver-allocated fbdev helper, can be NULL
> + * @force: ignore present DRM master
>    *
>    * This helper should be called from fbdev emulation's &drm_client_funcs.restore
>    * callback. It ensures that the user isn't greeted with a black screen when the
> @@ -263,9 +264,9 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
>    * Returns:
>    * 0 on success, or a negative errno code otherwise.
>    */
> -int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
> +int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper, bool force)
>   {
> -	return __drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, false);
> +	return __drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, force);
>   }
>   EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
>   
> @@ -1328,9 +1329,9 @@ int drm_fb_helper_set_par(struct fb_info *info)
>   	 * the KDSET IOCTL with KD_TEXT, and only after that drops the master
>   	 * status when exiting.
>   	 *
> -	 * In the past this was caught by drm_fb_helper_lastclose(), but on
> -	 * modern systems where logind always keeps a drm fd open to orchestrate
> -	 * the vt switching, this doesn't work.
> +	 * In the past this was caught by drm_fb_helper_restore_fbdev_mode_unlocked(),
> +	 * but on modern systems where logind always keeps a drm fd open to
> +	 * orchestrate the vt switching, this doesn't work.
>   	 *
>   	 * To not break the userspace ABI we have this special case here, which
>   	 * is only used for the above case. Everything else uses the normal
> @@ -1955,16 +1956,3 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
> -
> -/**
> - * drm_fb_helper_lastclose - DRM driver lastclose helper for fbdev emulation
> - * @dev: DRM device
> - *
> - * This function is obsolete. Call drm_fb_helper_restore_fbdev_mode_unlocked()
> - * instead.
> - */
> -void drm_fb_helper_lastclose(struct drm_device *dev)
> -{
> -	drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
> -}
> -EXPORT_SYMBOL(drm_fb_helper_lastclose);
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index eebd1a05ee97..be5e617ceb9f 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -405,7 +405,7 @@ EXPORT_SYMBOL(drm_open);
>   
>   static void drm_lastclose(struct drm_device *dev)
>   {
> -	drm_client_dev_restore(dev);
> +	drm_client_dev_restore(dev, false);
>   
>   	if (dev_is_pci(dev->dev))
>   		vga_switcheroo_process_delayed_switch();
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 5ecde0f6f591..c972a8a3385b 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -57,12 +57,14 @@ struct drm_client_funcs {
>   	 *
>   	 * Note that the core does not guarantee exclusion against concurrent
>   	 * drm_open(). Clients need to ensure this themselves, for example by
> -	 * using drm_master_internal_acquire() and
> -	 * drm_master_internal_release().
> +	 * using drm_master_internal_acquire() and drm_master_internal_release().
> +	 *
> +	 * If the caller passes force, the client should ignore any present DRM
> +	 * master and restore the display anyway.
>   	 *
>   	 * This callback is optional.
>   	 */
> -	int (*restore)(struct drm_client_dev *client);
> +	int (*restore)(struct drm_client_dev *client, bool force);
>   
>   	/**
>   	 * @hotplug:
> diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
> index 985d6f02a4c4..79369c755bc9 100644
> --- a/include/drm/drm_client_event.h
> +++ b/include/drm/drm_client_event.h
> @@ -10,7 +10,7 @@ struct drm_device;
>   #if defined(CONFIG_DRM_CLIENT)
>   void drm_client_dev_unregister(struct drm_device *dev);
>   void drm_client_dev_hotplug(struct drm_device *dev);
> -void drm_client_dev_restore(struct drm_device *dev);
> +void drm_client_dev_restore(struct drm_device *dev, bool force);
>   void drm_client_dev_suspend(struct drm_device *dev);
>   void drm_client_dev_resume(struct drm_device *dev);
>   #else
> @@ -18,7 +18,7 @@ static inline void drm_client_dev_unregister(struct drm_device *dev)
>   { }
>   static inline void drm_client_dev_hotplug(struct drm_device *dev)
>   { }
> -static inline void drm_client_dev_restore(struct drm_device *dev)
> +static inline void drm_client_dev_restore(struct drm_device *dev, bool force)
>   { }
>   static inline void drm_client_dev_suspend(struct drm_device *dev)
>   { }
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index c1d38d54a112..63e3af8dd5ed 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -254,7 +254,8 @@ int drm_fb_helper_set_par(struct fb_info *info);
>   int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>   			    struct fb_info *info);
>   
> -int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
> +int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
> +					      bool force);
>   
>   struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper);
>   void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper);
> @@ -283,7 +284,6 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
>   int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
>   int drm_fb_helper_debug_enter(struct fb_info *info);
>   int drm_fb_helper_debug_leave(struct fb_info *info);
> -void drm_fb_helper_lastclose(struct drm_device *dev);
>   #else
>   static inline void drm_fb_helper_prepare(struct drm_device *dev,
>   					 struct drm_fb_helper *helper,
> @@ -409,10 +409,6 @@ static inline int drm_fb_helper_debug_leave(struct fb_info *info)
>   {
>   	return 0;
>   }
> -
> -static inline void drm_fb_helper_lastclose(struct drm_device *dev)
> -{
> -}
>   #endif
>   
>   #endif

