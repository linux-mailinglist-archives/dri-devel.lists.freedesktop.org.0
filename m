Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF90984468
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFA210E6BE;
	Tue, 24 Sep 2024 11:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Az3uF+8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B2210E6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 11:21:11 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so7454821a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727176870; x=1727781670; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYQ/IDmT9gcN7gYfq5hChxVJK5hUzJ0xEOoEvIgK6x0=;
 b=Az3uF+8J/jjmxOuDZMFSnKUabc32TsCL9G9TtPVCVoqWcvizvtOVE3c70UXBDB7BNk
 QYvbmAQwRuhpuckUoCddRDTJheo1pZHBmkcqyuty9AYKibUuFlvOEXBCZfjkPM6bh7Hx
 iaNYpwwUkbPzGFghkMLGHQbTKlYGZjZ66zLFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727176870; x=1727781670;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gYQ/IDmT9gcN7gYfq5hChxVJK5hUzJ0xEOoEvIgK6x0=;
 b=YpCnmMm99MV6BpgpyO7BMB07eRGfcSLEfu3Yx6VtDCtB5582+po0Pc/OYcH0br+GiS
 nl0RctdzRDoKI8YIrUgNa1ChCXfIFd6MeUnl6tdQuSABZDSGENUGX56BBDdemy1tbCoV
 CtsNYlN7We31oQ9jpfL6JiOYxnjd2YpZUXsc7A0TfSRIx31RoaFSi6ow3NTfTDJg6AXs
 djQpBGvy5n9ClYB1P9C1j5xmV04NMLQtjLp55L6oEWmuLCtixzIo4KNNxbVPVPLkuJPm
 2iAgsdwobPjEz2x2e5AAEh8K3+krxshxTSUroYr1jc4SR7owJCLMcF1vWwgNNu7OkwDf
 FIpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzMDMGd6BGUkpPyW3NU9dc/nwTekTB6wJPIUhYHKVImJXo0Nb0vEA9Qp19S22+bSSz2+F79S1PjKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgS8vPhSlzrniK8Mq9jH9GYBKdeVGTVHJZqHPT2xpbqpApqXYj
 f8HvqPN0g3qr2K8lvOxJN5OKhwJOV9CPj6v+ZjFkZ99pWCZotVfdxhhOTq+L7f6w6OaHepQ9kme
 t
X-Google-Smtp-Source: AGHT+IG+0CZhC8lhSSWIeyvYwrLQI4O0OQvh1Pjvq9SkGlKqyG/ISsZIxeuv8w2ijkNznz0YfWr6pw==
X-Received: by 2002:a17:906:794c:b0:a86:7199:af37 with SMTP id
 a640c23a62f3a-a90d51601d9mr1727612666b.58.1727176869474; 
 Tue, 24 Sep 2024 04:21:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f7b90sm72287366b.175.2024.09.24.04.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:21:09 -0700 (PDT)
Date: Tue, 24 Sep 2024 13:21:07 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: linux@treblig.org
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: Remove notifier
Message-ID: <ZvKgo8RUImafDRPE@phenom.ffwll.local>
Mail-Followup-To: linux@treblig.org, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com,
 hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240919232758.639925-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919232758.639925-1-linux@treblig.org>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Fri, Sep 20, 2024 at 12:27:58AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> backlight_register_notifier and backlight_unregister_notifier have
> been unused since
>   commit 6cb634d0dc85 ("ACPI: video: Remove code to unregister acpi_video
> backlight when a native backlight registers")
> 
> With those not being called, it means that the backlight_notifier
> list is always empty.
> 
> Remove the functions, the list itself and the enum used in the
> notifications.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

I think Lee Jones or Daniel Thompson will pick this up.
-Sima

> ---
>  drivers/video/backlight/backlight.c | 42 -----------------------------
>  include/linux/backlight.h           | 20 --------------
>  2 files changed, 62 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index a82934694d05..f699e5827ccb 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -65,7 +65,6 @@
>  
>  static struct list_head backlight_dev_list;
>  static struct mutex backlight_dev_list_mutex;
> -static struct blocking_notifier_head backlight_notifier;
>  
>  static const char *const backlight_types[] = {
>  	[BACKLIGHT_RAW] = "raw",
> @@ -467,9 +466,6 @@ struct backlight_device *backlight_device_register(const char *name,
>  	list_add(&new_bd->entry, &backlight_dev_list);
>  	mutex_unlock(&backlight_dev_list_mutex);
>  
> -	blocking_notifier_call_chain(&backlight_notifier,
> -				     BACKLIGHT_REGISTERED, new_bd);
> -
>  	return new_bd;
>  }
>  EXPORT_SYMBOL(backlight_device_register);
> @@ -539,9 +535,6 @@ void backlight_device_unregister(struct backlight_device *bd)
>  	mutex_unlock(&pmac_backlight_mutex);
>  #endif
>  
> -	blocking_notifier_call_chain(&backlight_notifier,
> -				     BACKLIGHT_UNREGISTERED, bd);
> -
>  	mutex_lock(&bd->ops_lock);
>  	bd->ops = NULL;
>  	mutex_unlock(&bd->ops_lock);
> @@ -566,40 +559,6 @@ static int devm_backlight_device_match(struct device *dev, void *res,
>  	return *r == data;
>  }
>  
> -/**
> - * backlight_register_notifier - get notified of backlight (un)registration
> - * @nb: notifier block with the notifier to call on backlight (un)registration
> - *
> - * Register a notifier to get notified when backlight devices get registered
> - * or unregistered.
> - *
> - * RETURNS:
> - *
> - * 0 on success, otherwise a negative error code
> - */
> -int backlight_register_notifier(struct notifier_block *nb)
> -{
> -	return blocking_notifier_chain_register(&backlight_notifier, nb);
> -}
> -EXPORT_SYMBOL(backlight_register_notifier);
> -
> -/**
> - * backlight_unregister_notifier - unregister a backlight notifier
> - * @nb: notifier block to unregister
> - *
> - * Register a notifier to get notified when backlight devices get registered
> - * or unregistered.
> - *
> - * RETURNS:
> - *
> - * 0 on success, otherwise a negative error code
> - */
> -int backlight_unregister_notifier(struct notifier_block *nb)
> -{
> -	return blocking_notifier_chain_unregister(&backlight_notifier, nb);
> -}
> -EXPORT_SYMBOL(backlight_unregister_notifier);
> -
>  /**
>   * devm_backlight_device_register - register a new backlight device
>   * @dev: the device to register
> @@ -767,7 +726,6 @@ static int __init backlight_class_init(void)
>  
>  	INIT_LIST_HEAD(&backlight_dev_list);
>  	mutex_init(&backlight_dev_list_mutex);
> -	BLOCKING_INIT_NOTIFIER_HEAD(&backlight_notifier);
>  
>  	return 0;
>  }
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index ea9c1bc8148e..f5652e5a9060 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -66,24 +66,6 @@ enum backlight_type {
>  	BACKLIGHT_TYPE_MAX,
>  };
>  
> -/**
> - * enum backlight_notification - the type of notification
> - *
> - * The notifications that is used for notification sent to the receiver
> - * that registered notifications using backlight_register_notifier().
> - */
> -enum backlight_notification {
> -	/**
> -	 * @BACKLIGHT_REGISTERED: The backlight device is registered.
> -	 */
> -	BACKLIGHT_REGISTERED,
> -
> -	/**
> -	 * @BACKLIGHT_UNREGISTERED: The backlight revice is unregistered.
> -	 */
> -	BACKLIGHT_UNREGISTERED,
> -};
> -
>  /** enum backlight_scale - the type of scale used for brightness values
>   *
>   * The type of scale used for brightness values.
> @@ -421,8 +403,6 @@ void devm_backlight_device_unregister(struct device *dev,
>  				      struct backlight_device *bd);
>  void backlight_force_update(struct backlight_device *bd,
>  			    enum backlight_update_reason reason);
> -int backlight_register_notifier(struct notifier_block *nb);
> -int backlight_unregister_notifier(struct notifier_block *nb);
>  struct backlight_device *backlight_device_get_by_name(const char *name);
>  struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
>  int backlight_device_set_brightness(struct backlight_device *bd,
> -- 
> 2.46.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
