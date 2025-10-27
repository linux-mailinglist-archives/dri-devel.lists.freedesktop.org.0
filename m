Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E711C0C760
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E7310E3F5;
	Mon, 27 Oct 2025 08:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQ1DlnIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E9F10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:55:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-475c9881821so27097405e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761555312; x=1762160112; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rTRZ3EhuIswe365aG/XvjvEwriEQziiLr/d1qgrUekA=;
 b=VQ1DlnIeG9b2p/rpMZrjOEjS8/yIo9LvnQ/WOlwweD55YjRXxSdCpeEZ5euM4I5nu2
 HJ84ZVkVo2VNt9jP/ewE9sN7q57Fjwr+LHaoIyhiHlgbqpU9PolWBPuTELKYh9YrnicI
 Cly2lM25ddWmtqHG6BBe89e6cjkBB8ciYVKONr9zcxCfRZaeRgaebvdDUE0Y6tJrCfs8
 TAghIDvZwA3mD62hd/aVuucDDhFLzKcqnb8fMPB/nFQyb2MVdKLt30NPqwORRTcf9Hxm
 5dXStg5QLH9giramE9jTuctlOeDW5soC9SQtLCZQSiybCQ/He5h2ygvAAzl1LXh70zVF
 6PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761555312; x=1762160112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rTRZ3EhuIswe365aG/XvjvEwriEQziiLr/d1qgrUekA=;
 b=XQT+HAPvRoW6LScjwKabG9QkI1gKp28uFPXXbOhS/hH7JUk1Az6QhRW/TtGQxH0Aax
 h+mD0iCTuDhNdICwcX6Yr3O3RWM45UUeVRQBjGqCwqX9k3H8gwC8V7ZH4NjauGtW0ZnK
 4OctmUtPyxPeeo9A6Gkl9XkCxbVwxZTu8YIV8KNQ907gyuYllAkNgdgAIkqkneYHVPYo
 NGjDrgl1v+YDDKSw3ugd1eRnUj8HDEmuNuC028RhYs4lfwUi2pGZf2LmNORg4+sdrGjE
 xQ0cxFYSbJmlBFn4ggaxeexv2VrzItp9i0R2FrTCIiysxktmxYdCbuDxA2vXI/iGebIj
 s8qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4wORSTo1ciAE5WFitFRbbg5DFoZh3AXETZSnIZSEwWA91gwvo5J1oBEUnBtExu5K4nqCdH+JDSD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1u+UY4B9A1OvvPbQ+b6dQHbwXgr94is8FfTA4QmRk8angfZbM
 eP3Dwdxps9lBDJeFYUW/ghA/753I2Vc4NYjr9WroHPdOY6jmYqqc0/Hm
X-Gm-Gg: ASbGncuIWExpGXNmol6OjBRgViRXVTSf9ciV1xzBbxjdf3nhK51mhh5ppAqMsO5nbMR
 q4aCUsqN1lWEdz1YpcOIaKgHgu0ZvuAHeYDLn+4Ar4/MKu0dlPOoG8uoGd8SawlxHZKm0qpv8MR
 xzbpPQp/XNyh8GRefYbOJTkDmb616GkUgbfucUdPqcD/fRTb1RwKo5c3EfLucyAQk4zilDnBhul
 eLWrafbL82lK/lE5wWtjdo5C3ISVXVKRilv5d48cfteQO0jamWFMZKVQJ5paN1c22rVXS5deL61
 qGDcM1FCp8IJbCqVlObBthZZpbvA414S2yv/XGXgUQyHLApd4pZCNJBHJfCt5b9ZLtnkkdn0AFg
 ZtJvo/5zm4oTmq0c9mTOL5kBuDJ9BI/ym+yHai7f+T5y44b6mSHaYjhxA+qZy3uw2DwFAG2IVQP
 +J/bTlNoE3
X-Google-Smtp-Source: AGHT+IGwkEUcJwMJhosHHfH/GxJAl3iU3iW4Mt6ujmdrpnIv7t1iBgzQ7ZFbWVwAn1+OadGrK7omzw==
X-Received: by 2002:a05:6000:4313:b0:401:2cbf:ccad with SMTP id
 ffacd0b85a97d-4298f582465mr10291302f8f.17.1761555311692; 
 Mon, 27 Oct 2025 01:55:11 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd374e41sm124963555e9.12.2025.10.27.01.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:55:11 -0700 (PDT)
Date: Mon, 27 Oct 2025 09:55:09 +0100
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
Subject: Re: [PATCH 10/22] drm/vkms: Introduce configfs for plane format
Message-ID: <aP8zbabbfLJ6F4Ok@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-10-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018-vkms-all-config-v1-10-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:10AM +0200, Louis Chauvet wrote:
> To allow the userspace to test many hardware configuration, introduce a
> new interface to configure the available formats per planes. VKMS supports
> multiple formats, so the userspace can choose any combination.
> 
> The supported formats are configured by writing the fourcc code in
> supported_formats:
>  # enable AR24 format
>   echo '+AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable AR24 format
>   echo '-AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # enable all format supported by VKMS
>   echo '+*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable all formats
>   echo '-*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  7 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 82 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 979f8a545498..deb14e7c48ea 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 7 configurable attribute:
> +Planes have 8 configurable attribute:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -106,6 +106,11 @@ Planes have 7 configurable attribute:
>    those exposed by the COLOR_RANGE property of a plane)
>  - default_color_range: Default color range presented to the userspace, same
>    values as supported_color_range
> +- supported_formats: List of supported formats for this plane. To add a new item in the
> +  list, write it using a plus its fourcc code: +XR24
> +  To remove a format, use a minus and its fourcc: -XR24
> +  To add all formats use +*
> +  To remove all formats, use -*
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 0b280c73b0cc..528f22fa2df1 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -599,6 +599,86 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t plane_supported_formats_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	page[0] = '\0';
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +	{

This "{" should go in the same line.

> +		u32 *formats = vkms_config_plane_get_supported_formats(plane->config);
> +
> +		for (int i = 0;
> +		     i < vkms_config_plane_get_supported_formats_count(plane->config);
> +		     i++) {
> +			char tmp[6] = { 0 };
> +			const ssize_t ret = snprintf(tmp, ARRAY_SIZE(tmp), "%.*s\n",
> +					       (int)sizeof(*formats),
> +					       (char *)&formats[i]);
> +			if (ret < 0)
> +				return ret;
> +			/*
> +			 * Limitation of ConfigFS attributes, an attribute can't be bigger
> +			 * than PAGE_SIZE. This will crop the result if this plane support
> +			 * more than ≈1000 formats.
> +			 */
> +			if (ret + strlen(page) > PAGE_SIZE - 1)
> +				return -ENOMEM;
> +			strncat(page, tmp, ARRAY_SIZE(tmp));
> +		}
> +	}
> +
> +	return strlen(page);
> +}
> +
> +static ssize_t plane_supported_formats_store(struct config_item *item,
> +					     const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret = 0;
> +	int ptr = 0;
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +	{

This "{" should go in the same line.

> +		while (ptr < count) {
> +			char tmp[4] = { ' ', ' ', ' ', ' ' };
> +
> +			memcpy(tmp, &page[ptr + 1], min(sizeof(tmp), count - (ptr + 1)));

This is not handling correctly formats with less than 4 characters.

For example, "+R1" is not handled because it is adding the sctring NULL terminator
to tmp. I think you need to:

memcpy(tmp, &page[ptr + 1], min(sizeof(tmp), count - 1 - (ptr + 1)));

> +			if (page[ptr] == '+') {
> +				if (tmp[0] == '*') {
> +					ret = vkms_config_plane_add_all_formats(plane->config);
> +					if (ret)
> +						return ret;
> +					ptr += 1;
> +				} else {
> +					ret = vkms_config_plane_add_format(plane->config,
> +									   *(int *)tmp);
> +					if (ret)
> +						return ret;
> +					ptr += 4;
> +				}
> +			} else if (page[ptr] == '-') {
> +				if (tmp[0] == '*') {
> +					vkms_config_plane_remove_all_formats(plane->config);
> +					ptr += 1;
> +				} else {
> +					vkms_config_plane_remove_format(plane->config, *(int *)tmp);
> +					ptr += 4;
> +				}
> +			}
> +			/* Skip anything that is not a + or a - */
> +			ptr += 1;
> +		}
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
>  CONFIGFS_ATTR(plane_, supported_rotations);
>  CONFIGFS_ATTR(plane_, default_rotation);
> @@ -606,6 +686,7 @@ CONFIGFS_ATTR(plane_, supported_color_range);
>  CONFIGFS_ATTR(plane_, default_color_range);
>  CONFIGFS_ATTR(plane_, supported_color_encoding);
>  CONFIGFS_ATTR(plane_, default_color_encoding);
> +CONFIGFS_ATTR(plane_, supported_formats);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> @@ -615,6 +696,7 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_default_color_range,
>  	&plane_attr_supported_color_encoding,
>  	&plane_attr_default_color_encoding,
> +	&plane_attr_supported_formats,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
