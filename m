Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87501933F42
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 17:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50F10E290;
	Wed, 17 Jul 2024 15:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="C4v5VMqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE4210E290
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 15:09:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-426719e2efeso7786495e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721228938; x=1721833738; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s77sxARyPcLu/24QtoN8ND9W5Zo8PTRc1Nw51x3CKtQ=;
 b=C4v5VMqz94ToMv+h8pY0k2DzPV47yLP9Oi1P81YbMgLvAn5pKgVB2MiWVRei+wmJ1y
 1mjk4HaAUyxwla0LXOV8Z1NBzOGkOwjZBj48FxGoUo59xG1XsD5UpRlWMk8X5zcBj1TQ
 8bvwr3MEKMXl3Otg7vobkqOtIKB0/OILVWQ1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228938; x=1721833738;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s77sxARyPcLu/24QtoN8ND9W5Zo8PTRc1Nw51x3CKtQ=;
 b=iI4kKoMJYZinsLhHQmt+0aB12PXesfxszUaXzSSQgVO2XAqk3N1IvNZV/ds51dous+
 AvLU1jc/FzPCjDcs3irTXYdBxJp5XcrX0KwKRDTjv+zmeUWeAHsgbqU9xPCAlWdYOs7Q
 VklXD3FPcg4AL5tKTRGisM8G+UhgiqIDNspSiTcD+vZXakL5pCz3Q3yibvns4/qDwUM5
 xPaSavFoRdmZAWaRCVApAKUMYZqXHfVr6s4+OCw3s+IEp5raJnyTo3SqQgbVjYjFaAw5
 LLbwYh86XlhXWQk2Wo2ZlnUGqj5uGCjr8LWd1nMGK4BSK5n3dcYDnN+2eC+pwRaN9zCO
 nZtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3CZ8thbKxmUEx+uWyBACHRfDTQgTH1OI2jMNhFBsPwKX+N+8T2ciiEtUzdKRtMfhji9g+nbUHPMDDq5+8fKZJ8gIrSL3YwT5zPKiF/R4i
X-Gm-Message-State: AOJu0Yz8MwDw5F+VLqwrp5EMPvMTGfE+3Z2n9l9P0jC3o+X2V3Ue1aAT
 XzPvzUe0h84Po+rsO8rkBOPN8z8cGDD4DAwimWGDtWPH1JakAPXmVHuwYgd3MN0=
X-Google-Smtp-Source: AGHT+IH1i/w84Z4TRUoKj/BGXwmxibTxvjiniJriyPObqoZKHx+24ILVUcBSnoq6KRs8SxxUKsqewA==
X-Received: by 2002:a05:600c:3501:b0:426:6a0d:1ae5 with SMTP id
 5b1f17b1804b1-427c2c0ef1bmr9093365e9.0.1721228938505; 
 Wed, 17 Jul 2024 08:08:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c77b05aesm1309505e9.14.2024.07.17.08.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 08:08:58 -0700 (PDT)
Date: Wed, 17 Jul 2024 17:08:56 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
Message-ID: <ZpfeiMj48JQTQcOE@phenom.ffwll.local>
Mail-Followup-To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717090102.968152-2-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Wed, Jul 17, 2024 at 10:48:39AM +0200, Jocelyn Falempe wrote:
> It allows to check if the drm device supports drm_panic.
> Prepare the work to have better integration with fbcon and vtconsole.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
>  include/drm/drm_panic.h     |  2 ++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 948aed00595e..d9a25c2d0a65 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -703,6 +703,26 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
>  static void debugfs_register_plane(struct drm_plane *plane, int index) {}
>  #endif /* CONFIG_DRM_PANIC_DEBUG */
>  
> +/**
> + * drm_panic_is_enabled
> + * @dev: the drm device that may supports drm_panic
> + *
> + * returns true if the drm device supports drm_panic
> + */
> +bool drm_panic_is_enabled(struct drm_device *dev)
> +{
> +	struct drm_plane *plane;
> +
> +	if (!dev->mode_config.num_total_plane)
> +		return false;
> +
> +	drm_for_each_plane(plane, dev)
> +		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
> +			return true;
> +	return false;
> +}
> +EXPORT_SYMBOL(drm_panic_is_enabled);

This feels like overkill since you currently only have one user in the
fbdev emulation code, but maybe useful in some other places ...

> +
>  /**
>   * drm_panic_register() - Initialize DRM panic for a device
>   * @dev: the drm device on which the panic screen will be displayed.
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index 73bb3f3d9ed9..c3a358dc3e27 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -148,11 +148,13 @@ struct drm_scanout_buffer {
>  
>  #ifdef CONFIG_DRM_PANIC
>  
> +bool drm_panic_is_enabled(struct drm_device *dev);

Since it's internal only, this should be in
drivers/gpu/drm/drm_crtc_internal.h and not int he include for drivers.
With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  void drm_panic_register(struct drm_device *dev);
>  void drm_panic_unregister(struct drm_device *dev);

These two are only used in drm.ko. Can you please move them to
drm_crtc_internal.h too and drop the EXPORT_SYMBOL in a follow-up patch?
We're trying to limit the exported interface and official headers to
really only the pieces drivers actually need.

Thanks, Sima

>  
>  #else
>  
> +bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>  static inline void drm_panic_register(struct drm_device *dev) {}
>  static inline void drm_panic_unregister(struct drm_device *dev) {}
>  
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
