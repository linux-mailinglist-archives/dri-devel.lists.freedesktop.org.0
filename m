Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97A97E237
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 17:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D39010E211;
	Sun, 22 Sep 2024 15:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RNdu1YPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C4310E211
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 15:11:26 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f75428b9f8so45911741fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727017884; x=1727622684; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3qYEWdyuyPD387BNY3ItgbS+E+pNExfegqaMbqgiH70=;
 b=RNdu1YPRwyWuolvE1gNi28BvLvJvrcQnJ3F8qm6h9pGrRFiB3jxmWvYnHMz61ooa0X
 yXdFQoOxc9wdJ3WY7G+QdjK4pROJm00ei6piU3ubBfs0udxMi9xjx+gLQo94Z/gcfhoi
 FdKe7G8ddKG9mbY4at/TFpvWEOvey2utUXGmRwgAmP3/fBy3LfcNhkDBXHC7X/ZUre/1
 uWCjkdS3ymZpNaem7QXkN4Qh+d8QdYk8rH4m8mI16wts7R7j3kqWtp34AWAz/dPyVCWp
 C1PBeKPDU1ITKsZnZmm8+ZeX8QJsafFghPGt0DGLhWTBPHKdrAOsB+hf58iZ57h685cm
 Q2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727017884; x=1727622684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qYEWdyuyPD387BNY3ItgbS+E+pNExfegqaMbqgiH70=;
 b=g/M2erdl4xWcW/ypkm1rzgKbkczIC+TLvuRdP1gwLUDtMu+IP6tnM3ID77p0aT0XGS
 OcYvd7hgV/nJ2PjpQaRDoqU8e8nVVjVwvVZ6pnjIDoWSymm3uoRo0FyvjY1ISqjD800r
 DoUFhTPJUBKBq4Nu3DAvzPBtdZ8wgVlLVss2ZA65G2XwIVjIGHn2RQMOX6hJEsWH+WDH
 8cOeb5yx5DM39c66Nbe/e760gTUIVmlhiGdVy3b6QLNo0s1nB16kTJH/HQAlb2k/jMPV
 kJpDkp6bEe31uEMY/bSZZAzLxQPGFf9sDlbzOw517bY4tWVUHL7Tp1ipjgTYTNVnd7Fe
 Usig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWzIuZbewUhv0HW66QhNOBcLxA920H8b8BwUTzeJ1jpAh7nQEOJgwyKAMuvywORW/U5KpCaUT82Rc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC2UntwzGrgSKRunxIQ3D0CDaX2F2mxKw6rbVijurRGXmB0SKE
 fPj0uYo4zSIlSDpkyK9IXV7ECZqhn53uEcGZrzcM1JOudiQaSQzZcdF+3UhvU/A=
X-Google-Smtp-Source: AGHT+IHHo31CqOXpn4SbWKggYqRdL9mScTmUZldIUgIsrVZTZzlvjOpcdiRZ0T1BWZ4Z9Wr8+Oh/1w==
X-Received: by 2002:a05:6512:6d1:b0:52c:d628:c77c with SMTP id
 2adb3069b0e04-536ac32f044mr5619933e87.43.1727017884451; 
 Sun, 22 Sep 2024 08:11:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368709695csm2947204e87.135.2024.09.22.08.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 08:11:23 -0700 (PDT)
Date: Sun, 22 Sep 2024 18:11:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm: Change drm_class from pointer to const struct
 class
Message-ID: <56lilw7gkq4ggtxfoykxcd727llmdrc2wksoafhjktxwpxil4e@6kcfqgwtxcrj>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <9e5567f6-c27e-4875-9db8-0435669a7d7c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e5567f6-c27e-4875-9db8-0435669a7d7c@gmail.com>
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

On Sun, Sep 08, 2024 at 02:11:25PM GMT, Heiner Kallweit wrote:
> Define class drm statically and constify it. This ensure that no user
> of the exported struct class can tamper with it.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/gpu/drm/drm_internal.h       |  2 +-
>  drivers/gpu/drm/drm_privacy_screen.c |  2 +-
>  drivers/gpu/drm/drm_sysfs.c          | 32 ++++++++++++++--------------
>  3 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 1705bfc90..6e0df44b6 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -139,7 +139,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
>  void drm_master_internal_release(struct drm_device *dev);
>  
>  /* drm_sysfs.c */
> -extern struct class *drm_class;
> +extern const struct class drm_class;
>  
>  int drm_sysfs_init(void);
>  void drm_sysfs_destroy(void);
> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
> index 6cc39e307..2fbd24ba5 100644
> --- a/drivers/gpu/drm/drm_privacy_screen.c
> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> @@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>  	mutex_init(&priv->lock);
>  	BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>  
> -	priv->dev.class = drm_class;
> +	priv->dev.class = &drm_class;
>  	priv->dev.type = &drm_privacy_screen_type;
>  	priv->dev.parent = parent;
>  	priv->dev.release = drm_privacy_screen_device_release;
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index f8577043e..f443f9a76 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -58,7 +58,15 @@ static struct device_type drm_sysfs_device_connector = {
>  	.name = "drm_connector",
>  };
>  
> -struct class *drm_class;
> +static char *drm_devnode(const struct device *dev, umode_t *mode)
> +{
> +	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
> +}
> +
> +const struct class drm_class = {
> +	.name = "drm",
> +	.devnode = drm_devnode,
> +};
>  
>  #ifdef CONFIG_ACPI
>  static bool drm_connector_acpi_bus_match(struct device *dev)
> @@ -93,11 +101,6 @@ static void drm_sysfs_acpi_register(void) { }
>  static void drm_sysfs_acpi_unregister(void) { }
>  #endif
>  
> -static char *drm_devnode(const struct device *dev, umode_t *mode)
> -{
> -	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
> -}
> -

Please keep this function in place and move drm_class declarattion next
to it. It simplifies reviewing the code.

>  static int typec_connector_bind(struct device *dev,
>  				struct device *typec_connector, void *data)
>  {
> @@ -138,14 +141,12 @@ static const struct component_ops typec_connector_ops = {
>   */
>  int drm_sysfs_init(void)
>  {
> -	drm_class = class_create("drm");
> -	if (IS_ERR(drm_class))
> -		return PTR_ERR(drm_class);
> +	int ret = class_register(&drm_class);
>  
> -	drm_class->devnode = drm_devnode;
> +	if (!ret)
> +		drm_sysfs_acpi_register();
>  
> -	drm_sysfs_acpi_register();
> -	return 0;
> +	return ret;
>  }
>  
>  /**
> @@ -156,8 +157,7 @@ int drm_sysfs_init(void)
>  void drm_sysfs_destroy(void)
>  {
>  	drm_sysfs_acpi_unregister();
> -	class_destroy(drm_class);
> -	drm_class = NULL;
> +	class_unregister(&drm_class);

This code makes me wonder: can we define static classes in unloadable
modules? What happens if userspace holds the reference on the class in
sysfs, while we remove the module ?

>  }
>  
>  static void drm_sysfs_release(struct device *dev)
> @@ -337,7 +337,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>  		return -ENOMEM;
>  
>  	device_initialize(kdev);
> -	kdev->class = drm_class;
> +	kdev->class = &drm_class;
>  	kdev->type = &drm_sysfs_device_connector;
>  	kdev->parent = dev->primary->kdev;
>  	kdev->groups = connector_dev_groups;
> @@ -516,7 +516,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>  			minor_str = "card%d";
>  
>  		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
> -		kdev->class = drm_class;
> +		kdev->class = &drm_class;
>  		kdev->type = &drm_sysfs_device_minor;
>  	}
>  
> -- 
> 2.46.0
> 
> 

-- 
With best wishes
Dmitry
