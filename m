Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F694CCB9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 10:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA2310E881;
	Fri,  9 Aug 2024 08:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZSxwrhhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B923010E880
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 08:51:30 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5b4e2db85ecso209810a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193489; x=1723798289; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Bc3kPPaGk0IbzRHuuxiwDmBjEf16sRrqx5FlMQBJQHQ=;
 b=ZSxwrhhyyRX7yLaqX/2EvyOMsquYiqFutDDdo2CJKhepObHO/PU5K8MAgHeT4i7uuy
 seGTyweQkZ6KC5u04LqEYw1HQ4vB5dN9rL93vXUMn/fnuHF6mYY1F3GVMERx3kHZ5eWS
 wMWG7v3ff/aD5BWAoMgJQsKroUaxqsw0FZ2SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193489; x=1723798289;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bc3kPPaGk0IbzRHuuxiwDmBjEf16sRrqx5FlMQBJQHQ=;
 b=DvKLUaF6Tj8QYqYAU9RM1c+FVvAduv0syFK9xc/xWDiPP2mNPPy9hfxqPDRyFdPeRl
 NGy1PJVDLWUPpU5FyLAQjU+xNO/gefbHktJuwRemUDnuf+FY2U5R4jQkj5s/1PDSheuj
 Mri71kv3BgqFcfdcIcJ6m0EyqnroRG9rppHGZukzgVjK6QvkeLJ7R5mXnX2w/sdlFOAf
 4rSJQWh6up+v2XdljIG0y8nRLcVD3bj56uAhVk/n1FNUDkwMkoB8fDvcALPjrCUsS9Ax
 Lfdylbx5Wq39fW1m53REhpj5AouWZwY2SpA+9meAu555BNYG+g0I29qJoZ62fBguy9pw
 aYlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTT+DZtv/1QpFqHjaPVpEPF72UDq6ZpbX+WA3+fWnwM6kbv62b7bl49+2QIdT9cTSgb+DE6wY2pQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydMV3sWdhcAsd6ZLeTWiqrcTaGSS4UAfwSOaNDjuhWWc3TdUES
 1XxzxvTpp1Lg2FfNHmiFGY1PrslK7lsx4wO/IfpjTVOFgOcEqV1nLhCo1qTRctQ=
X-Google-Smtp-Source: AGHT+IHyrYScI0WDvWwB61dk4JIRmn/B/cN2/2DPRQX6MXK/PbRwp22bnR1LUpH/J1IQvWLk3eeCDA==
X-Received: by 2002:a17:907:2cc3:b0:a74:4f23:14ca with SMTP id
 a640c23a62f3a-a80aa6768dbmr40078166b.7.1723193488816; 
 Fri, 09 Aug 2024 01:51:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0cc44sm818474366b.76.2024.08.09.01.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:51:28 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:51:26 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 8/8] drm: Remove struct
 drm_mode_config_funcs.output_poll_changed
Message-ID: <ZrXYjvVhm1SXs75N@phenom.ffwll.local>
References: <20240807084539.304014-1-tzimmermann@suse.de>
 <20240807084539.304014-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807084539.304014-9-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Wed, Aug 07, 2024 at 10:41:40AM +0200, Thomas Zimmermann wrote:
> The output_poll_changed hook in struct drm_mode_config_funcs is
> unused. Remove it. The helper drm_client_dev_hotplug() implements
> the callback's functionality.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_probe_helper.c | 10 +---------
>  include/drm/drm_mode_config.h      | 16 ----------------
>  2 files changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 285290067056..92f21764246f 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -714,7 +714,7 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
>   * @dev: drm_device whose connector state changed
>   *
>   * This function fires off the uevent for userspace and also calls the
> - * output_poll_changed function, which is most commonly used to inform the fbdev
> + * client hotplug function, which is most commonly used to inform the fbdev
>   * emulation code and allow it to update the fbcon output configuration.
>   *
>   * Drivers should call this from their hotplug handling code when a change is
> @@ -730,11 +730,7 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
>   */
>  void drm_kms_helper_hotplug_event(struct drm_device *dev)
>  {
> -	/* send a uevent + call fbdev */
>  	drm_sysfs_hotplug_event(dev);
> -	if (dev->mode_config.funcs->output_poll_changed)
> -		dev->mode_config.funcs->output_poll_changed(dev);
> -
>  	drm_client_dev_hotplug(dev);
>  }
>  EXPORT_SYMBOL(drm_kms_helper_hotplug_event);
> @@ -750,11 +746,7 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
>  
> -	/* send a uevent + call fbdev */
>  	drm_sysfs_connector_hotplug_event(connector);
> -	if (dev->mode_config.funcs->output_poll_changed)
> -		dev->mode_config.funcs->output_poll_changed(dev);
> -
>  	drm_client_dev_hotplug(dev);
>  }
>  EXPORT_SYMBOL(drm_kms_helper_connector_hotplug_event);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index ab0f167474b1..271765e2e9f2 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -97,22 +97,6 @@ struct drm_mode_config_funcs {
>  	 */
>  	const struct drm_format_info *(*get_format_info)(const struct drm_mode_fb_cmd2 *mode_cmd);
>  
> -	/**
> -	 * @output_poll_changed:
> -	 *
> -	 * Callback used by helpers to inform the driver of output configuration
> -	 * changes.
> -	 *
> -	 * Drivers implementing fbdev emulation use drm_kms_helper_hotplug_event()
> -	 * to call this hook to inform the fbdev helper of output changes.
> -	 *
> -	 * This hook is deprecated, drivers should instead implement fbdev
> -	 * support with struct drm_client, which takes care of any necessary
> -	 * hotplug event forwarding already without further involvement by
> -	 * the driver.
> -	 */
> -	void (*output_poll_changed)(struct drm_device *dev);
> -
>  	/**
>  	 * @mode_valid:
>  	 *
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
