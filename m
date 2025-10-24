Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE27C06F45
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A18B10E081;
	Fri, 24 Oct 2025 15:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aKJ+ZZk6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAE910E081
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:25:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-475dae5d473so87045e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761319547; x=1761924347; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ypqIa5w6VQiQoM+Tw67e2xyPwM3Mkp0M4rGw2lAkqjc=;
 b=aKJ+ZZk6scQnTq3ibvl3rOn55S55XycBi50GhlWtY5LH3qkikFZSDtDCEg2cn7D0Dv
 miHSuJp1RurXg79GE1u2qlcn8ZdceuLrlZTGqwTAKucgnf8GKIBl4/aZbO/MU3BO/x24
 tw96/uxUpPS1MDskiialoZB0hSuVclQf19Ezt12W5LjrfURAb0fc7UPLKdIPFRyeuGsX
 tRFLRp0uqm4lB8VBrfhgpYkHvTLSyqMgLe2FwqZAg9LDUXzuSu3BYqSOGg6IFGSvNFeW
 JjegYxg5wqEvoGr5TzcetlWz+JsnJwCl0EuZLWDnZE5St0CqQeGXHwU8/tOh0hr7/KHO
 toGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761319547; x=1761924347;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ypqIa5w6VQiQoM+Tw67e2xyPwM3Mkp0M4rGw2lAkqjc=;
 b=KCWpNxzoR/r6KM9G91EK4d/io67tCcR5Dy8yuYhdnG5nfvYFyCo9/bGpP+B6Y1LQ/X
 NSegavTY6GHQVD2zBbTGcYZBvwghnQrSZ4epvLXwGgIooHjmSHZCqjixf4tzNfTXKxyB
 PQnitgbgt7H9Zv943ul5mnJ3n4bGVampo2oRHJMAJ3EMEmOD+MJHc6tOfIlCaD+a4aBd
 liNMD2JXTgenhqm1cNazl28rR4+2o7YYVRAf2H3WeMLlmFWI5UHRxCv9eYpxSXJFAnpE
 +0VhLD2VW2nfULD6Xycw5cKCYyAL4cOaOWbz1AD0hz6wJxtiGBQRJrl0DEVCHDx/Lo3x
 ZTXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8EyXGrKPOCaLXhO4W+CSmcLaIsmjW+ULeSvFPhjquB85LzEFrlLOqcSDmnaBK1Hu5QhEhMmY7Lf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysi9+cqUBcCii2603wtFc54fSPorCNSiW3lCOYCHreRmGP4d0k
 FkLGKnsYjqaIhGKP0ZBwoFGTO2SPyKPzpKnHxoSGhm57jtd2VTy/0T36
X-Gm-Gg: ASbGncsm0PX2h0Q1Jg+oCRxG4YRCHL/1q2Mce8D3uWHnsq7BmMmU3b8eLMfHxD65C+G
 uTLq/vTeEzSzcZn245BAl1JVkMHTzfG+8WFNKlCuLkocOxyi4aVKOmqXwEXo7f+l9FU1TMTJ+a6
 KjUaVbmn7ktDeiDOVfttZ86iAl2zvDJOaqm0demWAc9sHcOiafDic0bF0TylClEHLhIS7dh4/QT
 nyevNro7QG2N9PMj/6DQ30Bp19MlLlovml2DE+1yWzXW8pHoXXke1RLUD/09s4z9dTEjBOF6Gm3
 PCbpLGzeMAn+64tACcaYDzIiCfVBE4QP2JvZ79pWETicS9bWX7aizSDR2e96zuLowfdjb4P2lIX
 6y/TKsAAUuGElBw8eo+bmP9CSAwh2s7WnQKeM173cUsHI0bJD6ouQnp2rLIp2S+6o9U2M9Y5J50
 VW0yEjA1wBrWQsC4cvoHD3
X-Google-Smtp-Source: AGHT+IH+9ceI5wAu8l/3wfsbGJD7MCuJ1USb4K1b4IDrZDz0mW503QMkS82KFPZH8fAPDDytSZwSNg==
X-Received: by 2002:a05:600c:3b03:b0:468:86e0:de40 with SMTP id
 5b1f17b1804b1-4711786c6b9mr223889745e9.4.1761319546714; 
 Fri, 24 Oct 2025 08:25:46 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d4b923sm83941545e9.14.2025.10.24.08.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 08:25:46 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:25:43 +0200
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
Subject: Re: [PATCH 07/22] drm/vkms: Introduce config for plane color range
Message-ID: <aPuad03CDwb2PX5_@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-7-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-7-a7760755d92d@bootlin.com>
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


On Sat, Oct 18, 2025 at 04:01:07AM +0200, Louis Chauvet wrote:
> VKMS driver supports all the color range on planes, but for testing it can
> be useful to only advertise few of them. This new configuration interface
> will allow configuring the color range per planes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 14 ++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c  |  5 ++---
>  3 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 5353719a476d..8f00ca21ed6e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -163,6 +163,13 @@ static bool valid_plane_properties(const struct vkms_config *config)
>  			drm_info(dev, "Configured default color encoding is not supported by the plane\n");
>  			return false;
>  		}
> +
> +		if ((BIT(vkms_config_plane_get_default_color_range(plane_cfg)) &
> +		     vkms_config_plane_get_supported_color_range(plane_cfg)) !=
> +		    BIT(vkms_config_plane_get_default_color_range(plane_cfg))) {
> +			drm_info(dev, "Configured default color range is not supported by the plane\n");
> +			return false;
> +		}
>  	}
>  	return true;
>  }
> @@ -386,6 +393,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_plane_get_supported_color_encoding(plane_cfg));
>  		seq_printf(m, "\tdefault color encoding: %d\n",
>  			   vkms_config_plane_get_default_color_encoding(plane_cfg));
> +		seq_printf(m, "\tsupported color range: 0x%x\n",
> +			   vkms_config_plane_get_supported_color_range(plane_cfg));
> +		seq_printf(m, "\tdefault color range: %d\n",
> +			   vkms_config_plane_get_default_color_range(plane_cfg));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -433,6 +444,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  							BIT(DRM_COLOR_YCBCR_BT709) |
>  							BIT(DRM_COLOR_YCBCR_BT2020));
>  	vkms_config_plane_set_default_color_encoding(plane_cfg, DRM_COLOR_YCBCR_BT601);
> +	vkms_config_plane_set_supported_color_range(plane_cfg, BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +							       BIT(DRM_COLOR_YCBCR_FULL_RANGE));
> +	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_FULL_RANGE);
>  
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 11160c3c13bc..8127e12f00dc 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -47,6 +47,8 @@ struct vkms_config {
>   *         must be managed by other means.
>   * @default_color_encoding: Default color encoding that should be used by this plane
>   * @supported_color_encoding: Color encoding that this plane will support
> + * @default_color_range: Default color range that should be used by this plane
> + * @supported_color_range: Color range that this plane will support

Similar comment about using plural or singular in supported_*
properties.

>   */
>  struct vkms_config_plane {
>  	struct list_head link;
> @@ -58,6 +60,8 @@ struct vkms_config_plane {
>  	unsigned int supported_rotations;
>  	enum drm_color_encoding default_color_encoding;
>  	unsigned int supported_color_encoding;
> +	enum drm_color_range default_color_range;
> +	unsigned int supported_color_range;
>  	struct xarray possible_crtcs;
>  
>  	/* Internal usage */
> @@ -374,6 +378,32 @@ vkms_config_plane_set_supported_color_encoding(struct vkms_config_plane *plane_c
>  	plane_cfg->supported_color_encoding = supported_color_encoding;
>  }
>  
> +static inline enum drm_color_range
> +vkms_config_plane_get_default_color_range(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->default_color_range;
> +}
> +
> +static inline void
> +vkms_config_plane_set_default_color_range(struct vkms_config_plane *plane_cfg,
> +					  enum drm_color_range default_color_range)
> +{
> +	plane_cfg->default_color_range = default_color_range;
> +}
> +
> +static inline unsigned int
> +vkms_config_plane_get_supported_color_range(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->supported_color_range;
> +}
> +
> +static inline void
> +vkms_config_plane_set_supported_color_range(struct vkms_config_plane *plane_cfg,
> +					    unsigned int supported_color_range)
> +{
> +	plane_cfg->supported_color_range = supported_color_range;
> +}
> +
>  /**
>   * vkms_config_plane_set_name() - Set the plane name
>   * @plane_cfg: Plane to set the name to
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 5869000415e4..ab719da2ca0b 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -240,10 +240,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  
>  	drm_plane_create_color_properties(&plane->base,
>  					  vkms_config_plane_get_supported_color_encoding(config),
> -					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> -					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> +					  vkms_config_plane_get_supported_color_range(config),
>  					  vkms_config_plane_get_default_color_encoding(config),
> -					  DRM_COLOR_YCBCR_FULL_RANGE);
> +					  vkms_config_plane_get_default_color_range(config));
>  
>  	return plane;
>  }
> 
> -- 
> 2.51.0
> 
