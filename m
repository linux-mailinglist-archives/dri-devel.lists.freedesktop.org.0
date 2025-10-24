Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D235AC06F66
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816EC10E10B;
	Fri, 24 Oct 2025 15:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B6FVpOON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266C310E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:28:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47495477241so18708185e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761319679; x=1761924479; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ztNfXSF1NkhyWiUsHRf36r0DXviZBccOSUgahHp2yUo=;
 b=B6FVpOONCqQ3oa7zrx0SXqi0x8pHkdHXl70KWBCcm6F4q6fTMJcONveGjciipBvqYc
 N3o+VDvC8wuqOJdtwr7RieaIB0IQZr8W3asvWWcrYFhAaYFwnUYRZOB43nmSec0M2d8s
 8W1a8uQlQZ4d3KtUZUaVKiKTvBvl/G/+HDeXNy7D2NtJC5oqrXMS9Db1TlZXTKcqgn0p
 n3Mu7ze3gMOdj5MaYeNPReyElcLKgfBLbOcDmcPqt+1Ac2ugq+m8QQqlH8RBpOl1w/wz
 d738TNFd0dkgEK2RCKdBnIzDOQIRff9aIq/FeX7/LtT0lEyxPVHHDg3Z2BOYXfLtX250
 nWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761319679; x=1761924479;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztNfXSF1NkhyWiUsHRf36r0DXviZBccOSUgahHp2yUo=;
 b=sBxnkcfGzeMsddjGeuSvIYdQ/BMiZmgq+mY/gg6xA5lt3x59ehlLDdSlKDVxO6TKCm
 zOMYzxQoQJ113iNcGD6rtCKv+i4T07Wpnia63P3hocDE5ZKs/dGk2AbVOvdonlYW+NDr
 fhKASKLQ6kTSX0aqz1/4jQpUtCOXsiXwo+sT+rp76T5yARcBqTTfSoKAu9eMayOO0YNN
 MG1dcJD1mTtUA1C+8430JWxoWXoeqd5P3KkrZcLns/6Mta36GLvRSVvgo3tKSqRALqID
 WTS6JFSqU2Iw+IEqypsN3dy4t1s1nSoZ8BPRM6Ca/8cDJWu0gxmTt+xXXx6zF6L1tS1v
 Ftjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBHMH/zjSsFcujWTITSqyeY2qZP2Mhxec9bHHxrUcKBQpsAh35do7uVWz8mHEtNcNq53eMEjPIqkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyohkpoVYQFm8CTEgFFKyi5z2cztkqyCOHrk7zdKKhFnJWGhfNZ
 CERJNOZvb/QUYKAbTqfXCh/3fVb32u9j7NX15A33sQ8YghlvTzrvmh8J
X-Gm-Gg: ASbGncux+1pq+8/ATBOz6yZ04OdsDhnad4g4yyeaIpDUHXcA+bSiNKMTr2NwuiTH57y
 gudlHqXsbb1lDKmFbH27HIYsSLh/5cYOzbhfgEPGICdOlbzdYPgEJ0mYGSQOASfUi4BLOLdV0zg
 oG1Ve1nWhMcea/Lm/UEU9tZ9ULGCp7opJR1uT10LoZc8rUsDx7ga0Ww/YRn/lfD5C2CNW//hiy/
 t2riSYL9K8yUVrUwQP8DlU9oR5WN5NM82JdVjnLBmeALtSBNXNTlIF0V1EsqfWsBfs/iByGND8A
 mMiKsV+rjaw+Iah6DoGu6y65SnvDXVLsw6q2Bu4AenO+DolHJQLprU3DYzIxuITCIopjXRWX5m6
 I5WoPEh7qiH/pWuejJZtwR9CiP/DkafNyySIY8T0ldIS6qKEXoDgF0Xrdb/Oa1m65IJk5ozCJbA
 9otTOEazyE3Q==
X-Google-Smtp-Source: AGHT+IGLdAA7lW07FJwzdHpunnfAEeHs0j7e6oglL+ICYvhCaN8vtsYMA6YmlpmQQt67WQJiySD2Xg==
X-Received: by 2002:a05:6000:40e0:b0:426:d630:52b7 with SMTP id
 ffacd0b85a97d-42989edb584mr4809131f8f.0.1761319678541; 
 Fri, 24 Oct 2025 08:27:58 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cceebsm9854782f8f.37.2025.10.24.08.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 08:27:58 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:27:55 +0200
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
Subject: Re: [PATCH 08/22] drm/vkms: Introduce configfs for plane color range
Message-ID: <aPua-4yt_rMtRCAp@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-8-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-8-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:08AM +0200, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color ranges per planes. VKMS
> supports multiple color ranges, so the userspace can choose any
> combination.
> 
> The supported color ranges are configured by writing a color range bitmask
> to the file `supported_color_ranges` and the default color range is
> chosen by writing a color encoding bitmask to `default_color_range`.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  7 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 93 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 4ff75b53a386..979f8a545498 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 5 configurable attribute:
> +Planes have 7 configurable attribute:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -101,6 +101,11 @@ Planes have 5 configurable attribute:
>    by the COLOR_ENCODING property of a plane)
>  - default_color_encoding: Default color encoding presented to the userspace, same
>    values as supported_color_encoding
> +- supported_color_range: Available color range for a plane, as a bitmask:
> +  0x1 DRM_COLOR_YCBCR_LIMITED_RANGE, 0x2 DRM_COLOR_YCBCR_FULL_RANGE (same values as
> +  those exposed by the COLOR_RANGE property of a plane)
> +- default_color_range: Default color range presented to the userspace, same
> +  values as supported_color_range
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index a4e0e054cf2d..0b280c73b0cc 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -412,6 +412,95 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t plane_supported_color_range_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int supported_color_range;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		supported_color_range = vkms_config_plane_get_supported_color_range(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", supported_color_range);
> +}
> +
> +static ssize_t plane_supported_color_range_store(struct config_item *item,
> +						 const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_default_color_range(plane->config)) !=
> +		     vkms_config_plane_get_default_color_range(plane->config))
> +			return -EINVAL;
> +		vkms_config_plane_set_supported_color_range(plane->config, val);
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t plane_default_color_range_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int default_color_range;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		default_color_range = vkms_config_plane_get_default_color_range(plane->config);
> +
> +	return sprintf(page, "%u", default_color_range);
> +}
> +
> +static ssize_t plane_default_color_range_store(struct config_item *item,
> +					       const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_supported_color_range(plane->config)) !=
> +		     val)
> +			return -EINVAL;
> +		vkms_config_plane_set_default_color_range(plane->config, val);

Same comment about the validation here.

> +	}
> +
> +	return count;
> +}
> +
>  static ssize_t plane_supported_color_encoding_show(struct config_item *item, char *page)
>  {
>  	struct vkms_configfs_plane *plane;
> @@ -513,6 +602,8 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
>  CONFIGFS_ATTR(plane_, type);
>  CONFIGFS_ATTR(plane_, supported_rotations);
>  CONFIGFS_ATTR(plane_, default_rotation);
> +CONFIGFS_ATTR(plane_, supported_color_range);
> +CONFIGFS_ATTR(plane_, default_color_range);

And the mixed use of singular and plural for supported_*.

>  CONFIGFS_ATTR(plane_, supported_color_encoding);
>  CONFIGFS_ATTR(plane_, default_color_encoding);
>  
> @@ -520,6 +611,8 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
>  	&plane_attr_supported_rotations,
>  	&plane_attr_default_rotation,
> +	&plane_attr_supported_color_range,
> +	&plane_attr_default_color_range,
>  	&plane_attr_supported_color_encoding,
>  	&plane_attr_default_color_encoding,
>  	NULL,
> 
> -- 
> 2.51.0
> 
