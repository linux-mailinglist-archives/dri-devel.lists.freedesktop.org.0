Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49940CE7418
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 16:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3F710E527;
	Mon, 29 Dec 2025 15:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PO5vbQpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7FC10E527
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 15:52:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so59173785e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 07:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767023520; x=1767628320; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r+1e82K7qoFHgWEqXd17Blm6g8fb25C94TiYEboEbs4=;
 b=PO5vbQpJiNnWunQberQ76+i4oT4Z4P6QCBxrwMv6DAfIExJzm+tgDLihwHY3iekkn2
 XGlt8kFwgIyVNcd8Ig8/O1OwM35Gd8pc/BUN14HMWqHSZv8MBdCZtxNjUxeD0/aAB+xe
 YdQmmvvtnd5GRw83ufV91gL0e4E6gRBhdAnu2u20h94mU8y3DZr9j5FyTPhwGDUhcxBi
 OnP24fwrPaRgcQCCJqFvPcUlVV2nXJxhMucisWGXjHCZLKtrNF6SuJZDWvVwAdnG/LTu
 M1gShQck4RKlRQxGBR3qKohO/+5QruOmHAT6oX8n3IMybWMvMhYJM7rr82EqMxL6GJWX
 oyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767023520; x=1767628320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+1e82K7qoFHgWEqXd17Blm6g8fb25C94TiYEboEbs4=;
 b=SeuWH88uYzt5DqhgV17ixBRqN4ep8tJ30bUo4KuY+SHrDdkbJRxEEms7AJFRhnOd/K
 Rq2gPU7+80MT9VoRS3YTvZ4bk3xsmTn5K4SPk6QI06mT8fEVQFyNTOlL2CQtULi8RhfU
 WZgk1PNa9aiWldHMWbyxSbO3XhH/2gTGnHrzIkri6OMFcvInN1k/T0MDHgLSsyTq8VHt
 x2LuHnp1fs2zrlQ6rFPIvxjcPt4bYQIcdQgJzY6cR5sqvG3u/rBCqiuWuf83x62e0RAQ
 DMsu58ZO+sI97Xne1wQAKpOPRWNr5FVgyHqaT7OpMzwe7K4bD4fX2fvWti+yr11aS40U
 NqgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn4sJPpm5a+bWzrvLgMBeBY6utZCIH5SVbA/PAPsSBikbOMCHWOTr7dqTYtTf/1WhHqOxJDwKFMeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8bfbYacwCjUoqFBoKUkX4VV9tnFLZ/CAEaIvPx01x83UF0ZBb
 KD0+z1FpbKLw7LSFk/Weel9E27FKoA81U3kvamKrnp+eOHWV+KPKtst7
X-Gm-Gg: AY/fxX6XVHmgOKvCKW1P1lr35voSWbpsarEfm49AEczxI23rX4gGWM/OP5/dH3PeULa
 ymrVcaG13hgUxmwTJWaX961MGulY4LkE+equKMJ0tuZ4UsF2B3Yba4gwDH3WQVubID47j5G306A
 HNRuYgR8g8YpWZ+vcgLtAnOPAQwUsB82/tPn7dccCSyzhSUx4QpaxXYjoxD8h3JR9K+aYo5zjVL
 Y0qkRpLZiLXxqgZNsE03+yjkHFpR7jfq1bU3DBeC5v+X8KYvDv47P8PC3Jb+YBFNt2a8ED2VoD+
 2IBqQgNB3w/Z70r9XhvlMvxJW61pRqCOnM2WcxJZ56EAY+mg8kcRqqVhBV7oigWxNNl5UzOlKH0
 WuFFflEIZXotVnMd23vhYmXDnSOf+rxjSR72VRT63zT+9phr7+GMrXCu93UbTFdIfMZ7VfJG8Rx
 a5neLQktaDow==
X-Google-Smtp-Source: AGHT+IEojd66/KRf/+AdS55kro88HIpMthbNVHbK/I9tDZ6XYWlwKV3LZP6ceu8h/WnqqV4S9HZPjg==
X-Received: by 2002:a05:600c:45c5:b0:47d:4fbe:e6d2 with SMTP id
 5b1f17b1804b1-47d4fbee7b1mr99109135e9.12.1767023520288; 
 Mon, 29 Dec 2025 07:52:00 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d19362345sm543465845e9.6.2025.12.29.07.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 07:51:59 -0800 (PST)
Date: Mon, 29 Dec 2025 16:51:58 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 07/33] drm/vkms: Introduce configfs for plane name
Message-ID: <aVKjnhrDCYLvn5iu@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
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

Hey Louis,

On Mon, Dec 22, 2025 at 11:11:09AM +0100, Louis Chauvet wrote:
> Planes can have name, create a plane attribute to configure it. Currently
> plane name is mainly used in logs.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms |  6 +++++
>  Documentation/gpu/vkms.rst              |  3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 43 +++++++++++++++++++++++++++++++++
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 0beaa25f30ba..6fe375d1636f 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -103,6 +103,12 @@ Description:
>          Plane type. Possible values: 0 - overlay, 1 - primary,
>          2 - cursor.
>  
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/name
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Name of the plane.
> +
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 1e79e62a6bc4..79f1185d8645 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 1 configurable attribute:
> +Planes have 2 configurable attributes:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> +- name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 506666e21c91..989788042191 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -324,10 +324,53 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
>  	return (ssize_t)count;
>  }
>  
> +static ssize_t plane_name_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	const char *name;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		name = vkms_config_plane_get_name(plane->config);
> +
> +	if (name)
> +		return sprintf(page, "%s\n", name);
> +	return sprintf(page, "\n");
> +}
> +
> +static ssize_t plane_name_store(struct config_item *item, const char *page,
> +				size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	size_t str_len;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	// strspn is not lenght-protected, ensure that page is a null-terminated string.
> +	str_len = strnlen(page, count);
> +	if (str_len >= count)
> +		return -EINVAL;

I made a very quick review of v3 and I'm sending the initial issues I found, but I'd need
to do a deeper review.

This check is preventing me to set the name. For example, running:

$ echo "planename" | sudo tee /sys/kernel/config/vkms/gpu1/planes/plane0/name

Fails because str_len = 10 and count = 10. Does the same happen on your side?

Jose

> +
> +	if (strspn(page, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-") != count - 1)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_plane_set_name(plane->config, page);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
> +CONFIGFS_ATTR(plane_, name);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> +	&plane_attr_name,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.2
> 
