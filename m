Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8115CC0E9EA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC1110E4BF;
	Mon, 27 Oct 2025 14:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dqz8otKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE57710E4BF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:52:34 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso59296605e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761576753; x=1762181553; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CG2tkvlUbIfjNpzMGKRkYn92mrYl4xnwnC80WC0Ss5I=;
 b=Dqz8otKG3qoWMmQzcCaPIZQycB46NHSGWW47M+7sUKF6Ym4RxTN3qdTRFpu8Al1ibg
 64GgfzjJRqZMAAwEpYSHfmWirL8THC6bTMDt+TygElXcD0Wq52VEUFgx4f3MgNu3YU7p
 BNPK9BLC85rGETEFPNz81yONGNbEaoQUoshcVs/8sl5LI/IcUKzHUlQjnE85h388cuLd
 +bz0dsgrOpExNs9C5IKMuLKkNAjm/WYMuCcTQICs/H/vbK7jFEh0xdVF9m/zNjdfczNJ
 CbDM0xlaDg5qBtjKU1F5hKzmpLitCHsyXa+u5vcjSF3PDBBbqsMDqOA+0daHP0HDBAk3
 35CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761576753; x=1762181553;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CG2tkvlUbIfjNpzMGKRkYn92mrYl4xnwnC80WC0Ss5I=;
 b=BVEVXCsu9ialITJ1Vjkpx5VlB799MsICjoOG55c73YtlNcNVGJk4n5mlqqpwxygc+m
 mnGHL0gV+9PIVqQ6VAyaqwoh4hgLD6koSFgyOIUdZ2/9Cpl039RUvynY9s5itHA3nhdV
 scPu+nZNLGpP1UblnrXYqmK1O8J4C9LZDawwQ5cS5Vy3riV80v8R3344RjQQRnouylk1
 787pgR2Prl16jb5br0Ok96HZBkhhrboNmweagxueOpY2kxEURCQbLTElRhjKLnuHKhHZ
 sSc21BmUdC4cffHlVDzEHQ6rukCi3pERQkhIKsQorr7sb3onuOWRwWxMDM1My5NYsDs+
 Uw7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEt2kX/NjiZfrzwCgHaXiC59v1NBE6rWCIJ1/TFD3OFCWG+Co6Gorh6utgD/diKrkslR7AbSbIR14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu4yUSvjTzL7043zdlI6rYzkhZJQ/Az32zOKOcHjzgWdup60zp
 0pj7wWwFgcn5KcSpGLfIgerls4oMCEYuxGM+IsxRI+3Df2yDqyEqqSnv
X-Gm-Gg: ASbGncu9FgHJ5sSBEKXNgLskKGWfUFSGEqLB/ZKlfzuepxNTnZJ0dldwjphtgJwmfuF
 0d6T24RLdAWXa6vZttDH8yIjMfM3HLUs2WaEXS951xlufDN2XX/YB3P51xZv9ofYOkNfKR3XICO
 j353tw//Z0x1QdafTjeu1hJbGidrjLOOxp/jiws9TFQrJJC6JaenNhU6dEhNAJ4dzKdvhOGrXBS
 ypGO8LsqvacGBssgRiM6AdpGBVQMoNuViFJeLGHJ6qL6qnC9jyVjAMIWVDFdg0mlaWY3e28Xvhr
 I4PTCp8ieT0ETjzqQYkZZGSwb2aJR+Ka0PHWYXU1vRLDpze+axXV+ajwkr7Ry+gK0gEfGrJ5xoU
 8ertuThOhpbnoY/srM8QBEF2TY0b/YFuaN9YNMdo005puWfVvHjxKe4qrs+omxAA2GQakv/Uo+Q
 ==
X-Google-Smtp-Source: AGHT+IHjBgSezOajtNnHj2arl75lAB5ScyHP+2SpFJAW6GyFs1n32z2GEG9yrr0CCn8Kd71lNpl3yg==
X-Received: by 2002:a05:600c:3e07:b0:471:c04:a352 with SMTP id
 5b1f17b1804b1-4711787674fmr278303415e9.4.1761576752971; 
 Mon, 27 Oct 2025 07:52:32 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd042499sm140814925e9.8.2025.10.27.07.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:52:32 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:52:30 +0100
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
Subject: Re: [PATCH 20/22] drm/vkms: Store the enabled/disabled status for
 connector
Message-ID: <aP-HLjiHzs2v5F8-@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-20-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018-vkms-all-config-v1-20-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:20AM +0200, Louis Chauvet wrote:
> In order to prepare for dynamic connector configuration, we need to store
> if a connector is dynamic and if it is enabled.
> 
> The two new vkms_config_connector fields will helps for that.
> 
> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  4 ++
>  drivers/gpu/drm/vkms/vkms_config.c            |  2 +
>  drivers/gpu/drm/vkms/vkms_config.h            | 66 +++++++++++++++++++++++++++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index d1e380da31ff..f4b5f8f59fab 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -192,6 +192,10 @@ static void vkms_config_test_default_config(struct kunit *test)
>  				0);
>  		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_edid_enabled(connector_cfg),
>  				false);
> +		KUNIT_EXPECT_EQ(test, vkms_config_connector_is_enabled(connector_cfg),
> +				true);
> +		KUNIT_EXPECT_EQ(test, vkms_config_connector_is_dynamic(connector_cfg),
> +				false);

I missed this in other reviews, but you can use KUNIT_EXPECT_TRUE/FALSE instead.

>  	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 56e2082b91c9..fd724ae2ebc9 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -773,6 +773,8 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  	connector_cfg->status = connector_status_connected;
>  	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
> +	vkms_config_connector_set_dynamic(connector_cfg, false);
> +	vkms_config_connector_set_enabled(connector_cfg, true);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&connector_cfg->link, &config->connectors);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index eaf76a58aab6..6716b5a85f0d 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -128,6 +128,8 @@ struct vkms_config_encoder {
>   * @link: Link to the others connector in vkms_config
>   * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
> + * @dynamic: Store if a connector should be created with drm_connector_dynamic_init
> + * @enabled: If @dynamic, this means that the correct is currently registered in drm
>   * @status: Status (connected, disconnected...) of the connector
>   * @edid: Stores the current EDID
>   * @edid_len: Current EDID length
> @@ -142,6 +144,8 @@ struct vkms_config_connector {
>  	struct vkms_config *config;
>  
>  	int type;
> +	bool enabled;
> +	bool dynamic;

In this patch we could also log this in vkms_config_show().

>  	enum drm_connector_status status;
>  	u32 supported_colorspaces;
>  	bool edid_enabled;
> @@ -185,6 +189,24 @@ struct vkms_config_connector {
>  #define vkms_config_for_each_connector(config, connector_cfg) \
>  	list_for_each_entry((connector_cfg), &(config)->connectors, link)
>  
> +/**
> + * vkms_config_for_each_connector_static - Iterate over the static vkms_config connectors
> + * @config: &struct vkms_config pointer
> + * @connector_cfg: &struct vkms_config_connector pointer used as cursor
> + */
> +#define vkms_config_for_each_connector_static(config, connector_cfg) \
> +	vkms_config_for_each_connector((config), (connector_cfg)) \
> +		if (!(connector_cfg)->dynamic)
> +
> +/**
> + * vkms_config_for_each_connector_dynamic - Iterate over the dynamic vkms_config connectors
> + * @config: &struct vkms_config pointer
> + * @connector_cfg: &struct vkms_config_connector pointer used as cursor
> + */
> +#define vkms_config_for_each_connector_dynamic(config, connector_cfg) \
> +	vkms_config_for_each_connector((config), (connector_cfg)) \
> +		if ((connector_cfg)->dynamic)
> +
>  /**
>   * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
>   * possible CRTCs
> @@ -441,6 +463,50 @@ vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
>  	connector_cfg->type = type;
>  }
>  
> +/**
> + * vkms_config_connector_set_enabled() - If the connector is part of the device
> + * @crtc_cfg: Target connector
> + * @enabled: Add or remove the connector
> + */
> +static inline void
> +vkms_config_connector_set_enabled(struct vkms_config_connector *connector_cfg,
> +				  bool enabled)
> +{
> +	connector_cfg->enabled = enabled;
> +}
> +
> +/**
> + * vkms_config_connector_is_enabled() - If the connector is part of the device
> + * @connector_cfg: The connector
> + */
> +static inline bool
> +vkms_config_connector_is_enabled(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->enabled;
> +}
> +
> +/**
> + * vkms_config_connector_set_dynamic() - If the connector is dynamic
> + * @crtc_cfg: Target connector
> + * @enabled: Enable or disable the dynamic status
> + */
> +static inline void
> +vkms_config_connector_set_dynamic(struct vkms_config_connector *connector_cfg,
> +				  bool dynamic)
> +{
> +	connector_cfg->dynamic = dynamic;
> +}
> +
> +/**
> + * vkms_config_connector_is_enabled() - If the connector is dynamic
> + * @connector_cfg: The connector
> + */
> +static inline bool
> +vkms_config_connector_is_dynamic(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->dynamic;
> +}
> +
>  /*
>   * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
>   * @plane_cfg: Plane to get the default rotation from
> 
> -- 
> 2.51.0
> 
