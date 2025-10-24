Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F140DC06C86
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 16:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962EC10EAAF;
	Fri, 24 Oct 2025 14:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HOlksSYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FF410EAAF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 14:50:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4711810948aso16141335e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761317420; x=1761922220; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bvkZR2Vh4Krn1ke+GLvqfOD39dvZoqg79ZqoUlC3wn8=;
 b=HOlksSYXSa0SCFQViIe3UwnSIzSXJGC293VA2GThWWKZCtC+fL7PGgs19uvE9yDeTr
 4p7kdGJBkUXGCtPjHYSv2KSCdKWY8Ka01PZq9zV2WvrkbXp9KqgE/nBnNqjRDHGukj+D
 IlSulV/pFZ+20+ol7UZNRgEnzJKH3RZqCY0MsLgBqn9ovW9xRbDtNcPW5Y1b/nVdtkxI
 LWpoMcmK3E+1SxgBRlBVhMQy2Yoy+jT8wn2h8RESY0ccIRAh2XgDlb93+xmiDvPZNlId
 1Gr+k/xYdduXxlBpQ4uk/9LRXg0M5KeBCYnrFpUWpbghFz4/eVdY7Z+08Xi54wRIi/Pn
 PDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761317420; x=1761922220;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bvkZR2Vh4Krn1ke+GLvqfOD39dvZoqg79ZqoUlC3wn8=;
 b=I8RvJid7yQ6dnhxn97EThPFWfAfkxKNgXo42HEDPlTMS6UPQQn0LFZDgyr6rWD00Zk
 cOqvtsMUErzKOvrNDzjZafbehkYUcFVHy7h7nKQAKz/v0z6vyuSqYOtKHcToUHVW6aOh
 JsgDxDdG1ezYFePRaUo7SDQY3rSzm1Z0hJzrenh5PQ5fru8U9bGXAbvTxnaBXEybqPkl
 xaM+Dk9V6wZSdWR/HhlAWU/zAwk7aMN5YkoHEIMerq7VaefN7/bAts2j+5+EHMAxfH4S
 rNYKr+hN+72W+ZG4SEwt6tAVZZN6YcXjaGNaQRZfEQRwcknfLTJUCrMP/Dl6HmLWoi5O
 h/xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAIQdka1q36YL1aRBRDzC2aqJH9De6pv9LR6GkVWmowb4fuMLlfEpgOUi9lMHNxXx918A2N635tDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvDSEil3LHwdUcMqAe6FORTM0GmRPseKXxHIY85XS/JKVZkems
 OG1EYRdxFXlMewWnCEAbg0R7//R/njSY1Ol4WAisoE6PnMVqcyQmhWkj
X-Gm-Gg: ASbGncus0/tQoehCmS4OaJaLBg35EEZuSfuPqCSz3cxPJXqN1sySpwR+z4kZ7+BdRRo
 hjyLSLW/0V2FI+hnwAr5lJrv5dXKNp9v9lFfEC4JzruzpGdigt2OwyP+HuMhLiZvKRUyjKKR67a
 c6gWM8B5q5K/L0uHnqMSyETym2l4FymSCj7naU20NSPuJrHgLO07qCcu35dy5VfNV+rcqSUTeCA
 oIeb9JHm5YeAHf5xBhh+J+/bD00eDzhjz9njEotfmfM6XxHKcBH2j+0w8Ozc3qSdBnbXUUaDokL
 RoB42yrHDjI82VoYeRU5E07Sezvo93RDMeNlHp49L3YwUwkUBTVAUUtRxNhEPYLaz8EQnBnsebJ
 Q80xfyU8ZfBnbDk07oS56OiyA0ewXj7bvaQ6eNvVIZIwInxmzcADSr22hdY45j5vXJ7UYQDAVcB
 0=
X-Google-Smtp-Source: AGHT+IEqlFHh9cUmE6VeJkHTqoWYwUa2BjE3Cj5kkfpXYdD2XEHiKMq5M8rg1Ncamom4v1KrbdbmNw==
X-Received: by 2002:a05:600c:3b05:b0:471:d13:5762 with SMTP id
 5b1f17b1804b1-471178761bemr206849505e9.4.1761317419995; 
 Fri, 24 Oct 2025 07:50:19 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf15416sm95153355e9.10.2025.10.24.07.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 07:50:19 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:50:16 +0200
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
Subject: Re: [PATCH 04/22] drm/vkms: Introduce configfs for plane rotation
Message-ID: <aPuSKCNRGRCLDwyp@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-4-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018-vkms-all-config-v1-4-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:04AM +0200, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available rotation per planes. VKMS
> supports any rotation and reflection, so the userspace can choose any
> combination.
> 
> The supported rotations are configured by writing a rotation bitmask to
> the file `supported_rotations` and the default rotation is chosen by
> writing a rotation bitmask to `default_rotation`.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  7 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 94 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 3574e01b928d..a432968cc711 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,10 +87,15 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 1 configurable attribute:
> +Planes have 3 configurable attribute:

s/attribute/attributes/

>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> +- possible_rotations: Available rotation for a plane, as a bitmask: 0x01 no rotation,
> +  0x02 rotate 90°, 0x04 rotate 180°, 0x08 rotate 270°, 0x10 reflect x, 0x20 reflect y
> +  (same values as those exposed by the "rotation" property of a plane)
> +- default_rotation: Default rotation presented to the userspace, same values as
> +  possible_rotations.
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index ea245e2e2fd2..450e45e66a45 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -322,10 +322,104 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
>  	return (ssize_t)count;
>  }
>  
> +static ssize_t plane_supported_rotations_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int plane_supported_rotations;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		plane_supported_rotations = vkms_config_plane_get_supported_rotations(plane->config);

Checkpatch is complaining about this line being 1 character longer than
it should... Feel free to ignore it:

WARNING: line length of 101 exceeds 100 columns
#58: FILE: drivers/gpu/drm/vkms/vkms_configfs.c:333:
+               plane_supported_rotations = vkms_config_plane_get_supported_rotations(plane->config);


> +	}
> +
> +	return sprintf(page, "%u", plane_supported_rotations);
> +}
> +
> +static ssize_t plane_supported_rotations_store(struct config_item *item,
> +					       const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
> +		return -EINVAL;
> +	/* Should at least provide one rotation */
> +	if (!(val & DRM_MODE_ROTATE_MASK))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_default_rotation(plane->config)) !=
> +		     vkms_config_plane_get_default_rotation(plane->config))
> +			return -EINVAL;

This makes a bit difficult to change the default supported rotations.

By default, default rotation is DRM_MODE_ROTATE_0. If the user wants to set the
supported rotations to DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90,
this will fail because the default rotation is not included in the new set of
supported rotations.

Therefore, the user would need to add DRM_MODE_ROTATE_0 (DRM_MODE_REFLECT_X |
DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_0), change the default rotation
to DRM_MODE_ROTATE_90 and drop DRM_MODE_ROTATE_0 from the supported rotations.

To avoid this, I think we should check this before enabling the device instead,
in vkms_config_is_valid().

Also, having this logic as a helper called by vkms_config_is_valid() allows to
add a KUnit test to make sure all cases are covered.

What do you think?


> +		vkms_config_plane_set_supported_rotations(plane->config, val);
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t plane_default_rotation_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int plane_default_rotation;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		plane_default_rotation = vkms_config_plane_get_default_rotation(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", plane_default_rotation);
> +}
> +
> +static ssize_t plane_default_rotation_store(struct config_item *item,
> +					    const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
> +		return -EINVAL;
> +	/* Should at least provide one rotation */
> +	if ((val & DRM_MODE_ROTATE_MASK) == 0)
> +		return -EINVAL;
> +	/* Should contains only one rotation */
> +	if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_supported_rotations(plane->config)) != val)
> +			return -EINVAL;
> +
> +		vkms_config_plane_set_default_rotation(plane->config, val);
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
> +CONFIGFS_ATTR(plane_, supported_rotations);
> +CONFIGFS_ATTR(plane_, default_rotation);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> +	&plane_attr_supported_rotations,
> +	&plane_attr_default_rotation,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
