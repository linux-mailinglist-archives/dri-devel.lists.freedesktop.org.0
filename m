Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7DC0CA50
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD19B10E416;
	Mon, 27 Oct 2025 09:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W36W001u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6515E10E046
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:27:36 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so4538372f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 02:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761557255; x=1762162055; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1XbFQN4z+8uQL2wpQ+sfpguxFieK37cH2bAkG+VAGE0=;
 b=W36W001uSA7qcmn5ldP25W3ZBOXe0q17YLriVrGDBPvEl0HLhW+rafYX1t/qidjsj3
 byTtCVr2yvOjb07iR4LQxw/WMdNGqsIpJlEmI/5af1OkWk/r2hGOYpAF7wqMdXZ5kWwp
 pWyiczai4zPK2JNOAHKEQKVupAljv4fWqZJrrNRP4CnH2HR4GvjruhQ2Pg6B05ljrwiu
 plOVBJ+3g5X1SXdIIqF2AIm7Lqo7D0PW43poNbNTAxGgZa4c0Rbrq5r/fXsOS0tmoBaT
 ZUrILTjemqG6Iwg+kTM4jD7TuyYoL63NT1JWPvOFTjB/sMqbOuNgx5hkuku4orbTpABW
 picg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761557255; x=1762162055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1XbFQN4z+8uQL2wpQ+sfpguxFieK37cH2bAkG+VAGE0=;
 b=C3E9RW6gkp1lwH/w/H7hYVS1wR7U5MEnw2GVWq2RnlMLtFTGqoFwfSjrjbC+LaCoWv
 Yhi5VIZ+5FtDY027waeuKG4oRaQN/BAHvZyZZsuziTU9nWWC6MufB0cHig+piRioeX4f
 FmL79g4IC8ubWxY/HvOiR689fhf2VKRie68cv1jWYHPJCW+tvgXL1vVsbQ+Zmm9q/+BE
 BsA2bOR13COoabr8NkrkHrx737teI55XbGF7u+Q6czCOFW2vlt+pr7oimQzheWJeSaJM
 1ii4Fm9FHrMOc4RrbC6tj3CQc0BVYx3louj36y3MkfuMTLX2F3Qc5pEU7ORfAFoAr+/y
 wPNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+2JrY+xhVI8aymQxlDBlvPN80m8GZpnsdo5R8EeN8o6gjoCyqo9KsKMIDlfs1qd2XSd7i/BP2x7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwygLYIAUsApoCkLDaoBFCzT+/yh1oEwXR3UcULE6FS8i12olgP
 lYUSjxI6rtu7Kihhr7K0G//dWecAIulEpqClKuddfMxgkbEW9fBVPy43
X-Gm-Gg: ASbGncvcqgJh9yo9C+u4XWzRC6s4sfzl1X6ug8A6EocxjcbWZWz7lpBVA5el0emulhz
 tPqmggeaRuOb2MigdiCTEYw8EtoIYLfHEdOWi04XlRj0gr2yrbuOXM3oy/y7wQS4EMI8U0ZXyzk
 Ts27rnEJrAaza6sY5/7H8jDNi7e9QUhIhm+/IkUcbc4kgvqXVngdMKl5KYhSsmHHcM+UScuHGi7
 3oQr8DFaJwMnGvPbAv0kmRX0JmCi6gffT3MM8SMCK3+f/kMaqTGP8eojt+FZ1JkObX7s+Baj7wV
 6AIBijLTV5ZrZH/Sjj1LyPfzTsxL7GMr1QeZR+Ijk/3efx7OavujZYDU5nArv4/GPpxz5FxWmbl
 jpJjJsz2pYsiTrZpEFW4O7AFNAaoJtC5hLw7jz39WyLUftZAvgDqiJ7AkZwdg2TByccfGBGkKDa
 TBGy1N83Qg
X-Google-Smtp-Source: AGHT+IHcyTe136nWSTxsMQKxX59pQ/f0Ypkv0sfxJUZlqYO+kymBeNP1oT9oBON1N3Qewg0X6Y2Jvw==
X-Received: by 2002:a05:6000:1863:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42704d7e91dmr25788662f8f.12.1761557254451; 
 Mon, 27 Oct 2025 02:27:34 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm13166563f8f.8.2025.10.27.02.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 02:27:34 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:27:32 +0100
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
Subject: Re: [PATCH 14/22] drm/vkms: Introduce config for connector type
Message-ID: <aP87BOrWoR7tdGga@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-14-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-14-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:14AM +0200, Louis Chauvet wrote:
> In order to emulate connector-specific behavior, add connector type
> configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  6 ++++++
>  drivers/gpu/drm/vkms/vkms_config.c            |  1 +
>  drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         |  5 +++--
>  drivers/gpu/drm/vkms/vkms_connector.h         |  3 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  1 +
>  drivers/gpu/drm/vkms/vkms_output.c            |  2 +-
>  7 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index f2b38b436252..8633210342a4 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> +#include "drm/drm_mode.h"

#include <drm/drm_mode.h>?

>  #include <kunit/test.h>
>  
>  #include "../vkms_config.h"
> @@ -126,6 +127,7 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  	int n_primaries = 0;
>  	int n_cursors = 0;
>  	int n_overlays = 0;
> @@ -182,6 +184,10 @@ static void vkms_config_test_default_config(struct kunit *test)
>  
>  	/* Connectors */
>  	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
> +				DRM_MODE_CONNECTOR_VIRTUAL);
> +	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 5da34a3e8114..20750c9f6d08 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -771,6 +771,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&connector_cfg->link, &config->connectors);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 267e45f5a617..36d289a010f6 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -126,6 +126,7 @@ struct vkms_config_encoder {
>   * struct vkms_config_connector
>   *
>   * @link: Link to the others connector in vkms_config
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -138,6 +139,7 @@ struct vkms_config_connector {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  
> @@ -315,6 +317,28 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>  }
>  
>  /**
> + * vkms_config_connector_get_type() - Return the connector type
> + * @connector_cfg: Connector to get the type from
> + */
> +static inline int
> +vkms_config_connector_get_type(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->type;
> +}
> +
> +/**
> + * vkms_config_connector_set_type() - Set the connector type
> + * @connector_cfg: Connector to set the type to
> + * @type: New connector type
> + */
> +static inline void
> +vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
> +			       int type)
> +{
> +	connector_cfg->type = type;
> +}
> +
> +/*
>   * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
>   * @plane_cfg: Plane to get the default rotation from
>   *
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index b0a6b212d3f4..5a87dc2d4c63 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -68,7 +68,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.best_encoder = vkms_conn_best_encoder,
>  };
>  
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
> +struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> +					   struct vkms_config_connector *connector_cfg)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_connector *connector;
> @@ -79,7 +80,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
>  		return ERR_PTR(-ENOMEM);
>  
>  	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
> -				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> +				  vkms_config_connector_get_type(connector_cfg), NULL);

For debugging, it'd be nice to print the connector type in vkms_config_show().

>  	if (ret)
>  		return ERR_PTR(ret);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index ed312f4eff3a..a124c5403697 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -24,7 +24,8 @@ struct vkms_connector {
>   * Returns:
>   * The connector or an error on failure.
>   */
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
> +struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> +					   struct vkms_config_connector *connector_cfg);
>  
>  /**
>   * vkms_trigger_connector_hotplug() - Update the device's connectors status
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 9ad286f043b5..07bdf3f550ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -226,6 +226,7 @@ struct vkms_output {
>  
>  struct vkms_config;
>  struct vkms_config_plane;
> +struct vkms_config_connector;

Since vkms_connector_init() is defined in vkms_connector.h, I don't think
this is required.

>  /**
>   * struct vkms_device - Description of a VKMS device
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 22208d02afa4..217f054d9598 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -96,7 +96,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		struct vkms_config_encoder *possible_encoder;
>  		unsigned long idx = 0;
>  
> -		connector_cfg->connector = vkms_connector_init(vkmsdev);
> +		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
>  		if (IS_ERR(connector_cfg->connector)) {
>  			DRM_ERROR("Failed to init connector\n");
>  			return PTR_ERR(connector_cfg->connector);
> 
> -- 
> 2.51.0
> 
