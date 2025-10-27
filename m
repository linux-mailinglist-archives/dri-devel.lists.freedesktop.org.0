Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1DC0CB53
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2810E427;
	Mon, 27 Oct 2025 09:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nCWqK1MO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0481D10E426
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:38:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so2842293f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 02:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761557914; x=1762162714; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mrXR8lBbY3rQP++NKL3OM/LYz3iXG33tu2GQ0QMPU0o=;
 b=nCWqK1MOAHqscFuLYAKwSxjAXaGrZpoLim3xpU53Um1agBqcXnCfIUnVIBMGEGnJUf
 kQbmr6xbC3+DP6VVGj0pxamXy1lYbcKRjTfZY5A9MJDaURVS6w66MJs96w4Kfx2LxlPi
 DhWnBl+A+w+8sf0f7nyoc/njV5pG4ksC2mva5wBq2tgBzg+BXL78wucEc/GlIpynuTyr
 5XnJhc2LLXJSvcnS3sVAnunMJqiN0a1zg4ep48jU0H7lpH5UB4LP5VURUxDjFCEHpDds
 A8ifYntgpaFzO0EdZtFy1kxrlIBqnwWCfRKCRqlM4mbzJp56xxs+uJADNd0xduokYabC
 kQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761557914; x=1762162714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrXR8lBbY3rQP++NKL3OM/LYz3iXG33tu2GQ0QMPU0o=;
 b=RfBzH0Yx+9JPB4YcNdvR2L54DRDVT7B7Xnl8+Bdz5TThAerC9KHJXdKGWa4yrs63kh
 xXWQzwHoYYyw+664BLS3J4x3H2vm3xYWrjRdikV/OS1NxnVwLBOxg3GPOKgwpJxrA/HW
 jNgOR490itCsuOEVD4Q645Py0nFktrRjvjPZcYpSQinQ/ttnfcdog80GE/DY9LsuuUT+
 OBJVVcTv427IrmZ61Kf4027km8RSfHiNRxfjJf3GyeXnGYrh5VKXRFzWtfo8WAySWwQD
 oRIh12gsZQ5Ys16iodl4px+Uf0VjhMadkok0MgJN4fZ8tkvJzQWD5F/iRYNc5tDKh3Wy
 Or8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFdTPJqZMie0HLxyOm6NjpwDusJRde0kg46TCCiTUaV3DcSVv8ycRi9O/5OupKaVqHwrS4SjFtzaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB6H2NqOgWbDkt6hFXAJS44NFSnRzKdYKZPawGJQjC61nC3s6Y
 J3cbr5XwvPVsGdTI9duFeQPLxlD/r0Vp1cLMWmuZ/TazUfdvznMgq2gO
X-Gm-Gg: ASbGncscNf4mFSypI2xB24EHq4BBBSMjviIQ0wRdtRHP8Z57YGusfqSF0NYI2SlQS4u
 ukxX5jpTsYdK9Wxicfa71S0n8flLvDimKV/cT4zv8fgry3E+5ShJnPFfTB+kBAlM9v7QAjcZ3HT
 yaeoGkp4M6LfVsZU90jDLvwrSiTqgwyEEIqP5TYVzMw0G2H1mVUlQBWHD6JfTI8D3iBNudG2b6B
 dR/ubopQy3OfFpU5Lpt+xaIUIosjJR/+dffPgmN4iV6uZTLh22lypFmfNeif+Yj6+/7WnDapRVu
 FCvOA11BKs20ZZWq5ZZuiVXzEq7fStn+t2Y9wRWBJodlVXpqusmvIYOjnOaiXrH1l4b/JM9iE6N
 mLTjXqEC2CTvgygNpRVgDSzyDFdejwkX28rixJ0m3FuTyi+Yzl3jRP//IOC+VWsn/Ia2HiijUrQ
 ==
X-Google-Smtp-Source: AGHT+IHQ+TEVjMq0y+9SkjrfTyB83zzg4AUyCMIh2DMHA2Qh4W3bcbJMnYyQxYMtIF1VS0cZAPn60w==
X-Received: by 2002:a05:6000:40cb:b0:427:72d1:e3b2 with SMTP id
 ffacd0b85a97d-4299072c24amr8621232f8f.35.1761557914436; 
 Mon, 27 Oct 2025 02:38:34 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd00cf3dsm61686405e9.1.2025.10.27.02.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 02:38:34 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:38:32 +0100
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
Subject: Re: [PATCH 16/22] drm/vkms: Introduce config for connector supported
 colorspace
Message-ID: <aP89mA408-Y6Kq7q@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-16-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-16-a7760755d92d@bootlin.com>
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

Sorry for the additional email.

I see that the colorspace is ignored if the connector is not HDMI,
eDP or Display Port. Should we add some kind of validation?


On Sat, Oct 18, 2025 at 04:01:16AM +0200, Louis Chauvet wrote:
> To emulate some HDR features of displays, it is required to expose some
> properties on HDMI, eDP and DP connectors.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  3 +++
>  drivers/gpu/drm/vkms/vkms_config.c            |  1 +
>  drivers/gpu/drm/vkms/vkms_config.h            | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         | 15 +++++++++++++++
>  4 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index 8633210342a4..a89ccd75060d 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -187,6 +187,9 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	vkms_config_for_each_connector(config, connector_cfg) {
>  		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
>  				DRM_MODE_CONNECTOR_VIRTUAL);
> +		KUNIT_EXPECT_EQ(test,
> +				vkms_config_connector_get_supported_colorspaces(connector_cfg),
> +				0);
>  	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 20750c9f6d08..56e2082b91c9 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -772,6 +772,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
>  	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
> +	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&connector_cfg->link, &config->connectors);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 36d289a010f6..ec614c2d4a30 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -141,6 +141,7 @@ struct vkms_config_connector {
>  
>  	int type;
>  	enum drm_connector_status status;
> +	u32 supported_colorspaces;
>  	struct xarray possible_encoders;
>  
>  	/* Internal usage */
> @@ -239,6 +240,31 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>   */
>  void vkms_config_destroy(struct vkms_config *config);
>  
> +/**
> + * vkms_config_connector_set_supported_colorspaces() - Set the supported colorspaces for a connector
> + * @connector_cfg: Connector configuration to modify
> + * @supported_colorspaces: Bitmask of supported colorspaces (DRM_COLOR_YCBCR_*)
> + */
> +static inline void
> +vkms_config_connector_set_supported_colorspaces(struct vkms_config_connector *connector_cfg,
> +						u32 supported_colorspaces)
> +{
> +	connector_cfg->supported_colorspaces = supported_colorspaces;
> +}
> +
> +/**
> + * vkms_config_connector_get_supported_colorspaces() - Get the supported colorspaces for a connector
> + * @connector_cfg: Connector configuration to query
> + *
> + * Returns:
> + * Bitmask of supported colorspaces (DRM_COLOR_YCBCR_*)
> + */
> +static inline u32
> +vkms_config_connector_get_supported_colorspaces(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->supported_colorspaces;
> +}
> +
>  /**
>   * vkms_config_get_device_name() - Return the name of the device
>   * @config: Configuration to get the device name from
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index 5a87dc2d4c63..cc59d13c2d22 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -84,6 +84,21 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	if (vkms_config_connector_get_supported_colorspaces(connector_cfg)) {
> +		if (connector_cfg->type == DRM_MODE_CONNECTOR_HDMIA) {
> +			drm_mode_create_hdmi_colorspace_property(&connector->base,
> +								 vkms_config_connector_get_supported_colorspaces(connector_cfg));
> +			drm_connector_attach_hdr_output_metadata_property(&connector->base);
> +			drm_connector_attach_colorspace_property(&connector->base);
> +		} else if (connector_cfg->type == DRM_MODE_CONNECTOR_DisplayPort ||
> +			   connector_cfg->type == DRM_MODE_CONNECTOR_eDP) {
> +			drm_mode_create_dp_colorspace_property(&connector->base,
> +							       vkms_config_connector_get_supported_colorspaces(connector_cfg));
> +			drm_connector_attach_hdr_output_metadata_property(&connector->base);
> +			drm_connector_attach_colorspace_property(&connector->base);
> +		}
> +	}
> +
>  	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
>  
>  	return connector;
> 
> -- 
> 2.51.0
> 
