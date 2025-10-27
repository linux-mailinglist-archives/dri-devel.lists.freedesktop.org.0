Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF8DC0CD8C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB4E10E42E;
	Mon, 27 Oct 2025 10:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjzJDTm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD53610E42E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:03:03 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47112a73785so27728945e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 03:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761559382; x=1762164182; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ColHiiG/qinTBnjmfHXEdZo/afW+oA9OJEzlrf1jxbY=;
 b=FjzJDTm1RRZDUorSgLUbFfc5DpcYZNkTYm8b4NDGU96epuEO13enAyTzAEn0OfzFr3
 DkJa0nBGRkNpyQDR2dJYPKls0XDEdM5WzJM/HgxppBrJq+QFLTAcX9U+wO32n+9dG4dD
 HO0IhU7db2/AHNfh4n6XvCF69+mM3AjIUwAAsxxctKVzaAY18HDTV0Jkl0VF3AlFlXcy
 OKYTrV3fpp7WL+o+UTpM+aMljC6AtCh8UkWDTJfbsQOwUnv2M8AbMqotM0Evp1SP9MSj
 0GnPHeqwbtE82aPPV4Er6n3ODUIi6Kf9DzDHuCYmblvR9Dn4Tery6sL9FJ9u+5nBoh+q
 I+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761559382; x=1762164182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ColHiiG/qinTBnjmfHXEdZo/afW+oA9OJEzlrf1jxbY=;
 b=G/AYOocBsmMonjAMCAg5wv/MvC1oa/QpESgqvfMVCCqFvwAv8h72kfbdUUZ0jzMQKm
 PaC40M/cuOlunrFdB8a/O5EztZT6/XhgSe55vIDtVpj83iv9bIXnOKHV1nq/FtdFvJlf
 ErGD8CR/FX1mZvzGc0XM30TB7/5vJd+J/y/jxdTG4IWi4lRJASsoGXIXWsMjK4Odu54l
 t3diIQ7Bj2KunWcrZyrYMjWNSDqtIY3aQK7tG1VKyqaY24kQy6Wt4o/p64JYt176YtB2
 xTusaI/jZWA7ZB2JjUI7HQNLJWFgENyJRaULKfilGt/VZY6MlOmGNVpxqqIfIb0zrp+g
 aRVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBqjgeFomHK9ANVAt9wzRYDxgadrbu/rVHAUyhxGWBrL0WnB4wtoDCzkC2h0n4O1vDDdccucUjuyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo4UuGFPU5nOqaM4pd2g37R6DeqmAnuFC6B2fXkYxEnWiMigeg
 fg4OZ89DW/VnmnHukPYUFTEZVw7G2yYUcBPZD8vvKeCzb3YcK5EXVlm4obUMuTQG
X-Gm-Gg: ASbGncvlb7Vk0uJgM7Z0KZtFGyx0vRWLtKKXSfJiyvVzIK7YE449LDrNYXUC1M0p6or
 3MK1S16vNj/vYwqv1ov1tQh6GGePjvtARRjBjETqXsmbug61B3U+ElDNjy68SobT+PB8f9hEzLC
 LBF9qTVOdowIJUTp4Cpp7FRWgbfkVTrMMSiQT1T8O5UBH1luVR20tdJTFlbbsiaz38hVC0++vbf
 FATepjmN6FKUBY2wTPbzzmgFUnuFAk5DYCVb6Ke92M4tCjHiRlYJCijUBwsb2ZmMU4W4SgBvNnH
 x7FXksGTvCztLYnyfzQf4KEaU5rUzaPV1resSbBufIACtL48SPefBqTNcOrDCRbbZLUu/46tnZ/
 0JqyCMU4NX56nFwOrNppFwF3+/EzpbFyG9i+jVC3T7aG304BYDUHNGJk8xC3E4W4knNaU3MbpQG
 2sfpknBZ3Y
X-Google-Smtp-Source: AGHT+IEhJgRbhZWxAtcGo/HkTUbtQh4nuBOxFDXFQPWt87Z+E3yOA3FIVntFGRPGhKTYH/ky4bgtag==
X-Received: by 2002:a05:600c:5392:b0:477:bcb:24cd with SMTP id
 5b1f17b1804b1-4770bcb27a0mr35415935e9.22.1761559381856; 
 Mon, 27 Oct 2025 03:03:01 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a36easm128111685e9.10.2025.10.27.03.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 03:03:01 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:02:59 +0100
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
Subject: Re: [PATCH 18/22] drm/vkms: Introduce config for connector EDID
Message-ID: <aP9DU6g_qbEn1lHn@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-18-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-18-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:18AM +0200, Louis Chauvet wrote:
> Allows configuration of EDID for each connector.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  2 +
>  drivers/gpu/drm/vkms/vkms_config.h            | 77 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         | 48 +++++++++++++++--
>  3 files changed, 123 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index a89ccd75060d..d1e380da31ff 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -190,6 +190,8 @@ static void vkms_config_test_default_config(struct kunit *test)
>  		KUNIT_EXPECT_EQ(test,
>  				vkms_config_connector_get_supported_colorspaces(connector_cfg),
>  				0);
> +		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_edid_enabled(connector_cfg),
> +				false);
>  	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index ec614c2d4a30..eaf76a58aab6 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -129,6 +129,8 @@ struct vkms_config_encoder {
>   * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector

@edid_enabled: If true, @edid and @edid_len are taken into account

(or similar)

> + * @edid: Stores the current EDID
> + * @edid_len: Current EDID length
>   * @possible_encoders: Array of encoders that can be used with this connector
>   * @connector: Internal usage. This pointer should never be considered as valid.
>   *             It can be used to store a temporary reference to a VKMS connector
> @@ -142,6 +144,9 @@ struct vkms_config_connector {
>  	int type;
>  	enum drm_connector_status status;
>  	u32 supported_colorspaces;
> +	bool edid_enabled;
> +	u8 *edid;
> +	unsigned int edid_len;
>  	struct xarray possible_encoders;
>  
>  	/* Internal usage */
> @@ -265,6 +270,78 @@ vkms_config_connector_get_supported_colorspaces(struct vkms_config_connector *co
>  	return connector_cfg->supported_colorspaces;
>  }
>  
> +/**
> + * vkms_config_connector_get_edid_enabled() - Check if EDID is enabled for a connector
> + * @connector_cfg: Connector configuration to check
> + *
> + * Returns:
> + * True if EDID is enabled for this connector, false otherwise.
> + */
> +static inline bool
> +vkms_config_connector_get_edid_enabled(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->edid_enabled;
> +}
> +
> +/**
> + * vkms_config_connector_set_edid_enabled() - Enable or disable EDID for a connector
> + * @connector_cfg: Connector configuration to modify
> + * @enabled: Whether to enable EDID for this connector
> + */
> +static inline void
> +vkms_config_connector_set_edid_enabled(struct vkms_config_connector *connector_cfg,
> +				       bool enabled)
> +{
> +	connector_cfg->edid_enabled = enabled;
> +}
> +
> +/**
> + * vkms_config_connector_get_edid() - Get the EDID data for a connector
> + * @connector_cfg: Connector configuration to get the EDID from
> + * @len: Pointer to store the length of the EDID data
> + *
> + * Returns:
> + * Pointer to the EDID data buffer, or NULL if no EDID is set.
> + * The length of the EDID data is stored in @len.
> + */
> +static inline const u8 *
> +vkms_config_connector_get_edid(const struct vkms_config_connector *connector_cfg, int *len)
> +{
> +	*len = connector_cfg->edid_len;
> +	return connector_cfg->edid;
> +}
> +
> +/**
> + * vkms_config_connector_set_edid() - Set the EDID data for a connector
> + * @connector_cfg: Connector configuration to modify
> + * @edid: Pointer to the EDID data buffer
> + * @len: Length of the EDID data
> + *
> + * If @len is 0, the EDID data will be cleared. If memory allocation fails,
> + * the existing EDID data will be preserved.
> + */
> +static inline void
> +vkms_config_connector_set_edid(struct vkms_config_connector *connector_cfg,
> +			       const u8 *edid, unsigned int len)
> +{
> +	if (len) {
> +		void *edid_tmp = krealloc(connector_cfg->edid, len, GFP_KERNEL);
> +
> +		if (edid_tmp) {
> +			connector_cfg->edid = edid_tmp;
> +			memcpy(connector_cfg->edid, edid, len);
> +			connector_cfg->edid_len = len;
> +		} else {
> +			kfree(connector_cfg->edid);
> +			connector_cfg->edid_len = 0;

I wonder if in case of error it makes sense to NULL connector_cfg->edid and
vkms_config_connector_set_edid_enabled(false)?

It'd be also nice to print the EDID in hex format in vkms_config_show().

> +		}
> +	} else {
> +		kfree(connector_cfg->edid);
> +		connector_cfg->edid = NULL;
> +		connector_cfg->edid_len = len;
> +	}
> +}
> +
>  /**
>   * vkms_config_get_device_name() - Return the name of the device
>   * @config: Configuration to get the device name from
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index cc59d13c2d22..339d747e729e 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -42,13 +42,53 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> +static int vkms_connector_read_block(void *context, u8 *buf, unsigned int block, size_t len)
> +{
> +	struct vkms_config_connector *config = context;
> +	unsigned int edid_len;
> +	const u8 *edid = vkms_config_connector_get_edid(config, &edid_len);
> +
> +	if (block * len + len > edid_len)
> +		return 1;
> +	memcpy(buf, &edid[block * len], len);
> +	return 0;
> +}
> +
>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
> -	int count;
> +	struct vkms_connector *vkms_connector = drm_connector_to_vkms_connector(connector);
> +	const struct drm_edid *drm_edid = NULL;
> +	int count = 0;
> +	struct vkms_config_connector *context = NULL;
> +	struct drm_device *dev = connector->dev;
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> +	struct vkms_config_connector *connector_cfg;
>  
> -	/* Use the default modes list from DRM */
> -	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> -	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> +	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
> +		if (connector_cfg->connector == vkms_connector)
> +			context = connector_cfg;
> +	}
> +	if (context) {
> +		if (vkms_config_connector_get_edid_enabled(context)) {
> +			drm_edid = drm_edid_read_custom(connector,
> +							vkms_connector_read_block, context);
> +
> +			/*
> +			 * Unconditionally update the connector. If the EDID was read
> +			 * successfully, fill in the connector information derived from the
> +			 * EDID. Otherwise, if the EDID is NULL, clear the connector
> +			 * information.
> +			 */
> +			drm_edid_connector_update(connector, drm_edid);
> +
> +			count = drm_edid_connector_add_modes(connector);
> +
> +			drm_edid_free(drm_edid);
> +		} else {
> +			count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> +			drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> +		}
> +	}
>  
>  	return count;
>  }
> 
> -- 
> 2.51.0
> 
