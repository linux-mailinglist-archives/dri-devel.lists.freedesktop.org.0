Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1FEC0EC1B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3153510E4C3;
	Mon, 27 Oct 2025 15:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PKjgaFQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7911F10E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:01:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-474975af41dso33300445e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761577264; x=1762182064; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OwWL3U+YKBuEy27UD4gstwLK+fX/jcV1wo/uf2RvX+s=;
 b=PKjgaFQinyCnTc0ACfHm4r032bU/Bf6Dh9Q/rJvzoojPQvfxeVlshkHoeNSOr/xxkZ
 R4k1eemw40xH6fqWEDqGr6I6XRUymAeB/q/0RMpU6pZCdtdjItxJqktrOdo92hAbdJM5
 aDjDSX2jLtlN+uQw2xNkkTIKzvjEPIVJZymM2RQsgxf6Gqw+BjH8CC7Bs9ZmE/Wxf+LL
 JLHM/HhN1Ss4RMnjwVjxL5a+1XFStwyUxfOxHOqZrhhZoOsC3tSMaZWy9n0v++0BSxbQ
 ydKucKiEJLpLETkBZ7iHdAp/7xFLpIxFiM/9NU4OiM4hWCy9XzgNOLkYSLLLL80RYWS9
 IiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577264; x=1762182064;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OwWL3U+YKBuEy27UD4gstwLK+fX/jcV1wo/uf2RvX+s=;
 b=U3ybNKd1yZq5jqqrhjTHDxCCg5NpWAx45CHTgpMyiVczVWpbXMwdyTOmOgvTiS1XMb
 Sek4GO+PJ9Vb2Sn+RUXyTmF7tgVaRtI/Mb6a2bat3fbC7Ai0dmjqJPa3rkQcnzJLA9bO
 ANss+tFsP3CLFjPo9kw22LCHZ8dZHPv4GMoKJf6MZZnQS9dPWDoYi2oefuZn5JT/Eqgk
 Mpn0woRJ/co/wPIcm6O/xi02IqWNvfnxh57NkkKIGza2aH2VXd9mSo5VY49m1+7gr3Tm
 LyHbSbumsiSr+rL8EK6RH+K51/OWMKWOMs/XLGLpf1PoQi81qktbfNAuTy8GZcC2FMQO
 pljg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW24sLcRJxus57y8szZSpmv5D3pwiDv0JrszqAHekThITkrdi4wV3J0AnIlhcOXoQ5DcminXcS73uw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkGacRr1fVJuhOK/8yB4CS1pOGuOfnGeOnSJ6pyNXJKNJ0jviu
 eBo9teOAHZ+06MzJ6LX241MGUvNMPt6pHXz8QEhDt4HVmVfMmeLjWrc9
X-Gm-Gg: ASbGncsBjYD3l1C2aNYw/PoEN+8zWZgj2EzAhpQdHMWQ4ysVNgtVX+aF8QNABJQJwSl
 q+7F2S3gYHmwbmfDMPB34KPFEA08iDrU/OqBbil8U0jmupaHGvIvAViu/CFeW6vK7aVh0Zfcm2Z
 us61Ims6hI18O8M7p+cMZLY6I6Rl8XdF0PqJaxijPrY11driEzdqPJRg1Z+pZlIsPzflG9talVW
 BWXZuYdlgGcc5jwVUee+99DEcNBxudlMuiUgtlWOnuo/0sZp+BZLnNC+kLMQJxlTGEq6SGifDJR
 nTsHV7vvgqDRLJdxES7KT3MfAzS5cedRnFNviYYmPgJLogquLVUcwpwgRbbJK65EID3MU+m7NPh
 FBRtX5fWg8O5aYk18tLL97ZRWfwD7Owq5BkryFaH6MaSxQ9PDc3mG9qJkkllsz/bfYTNdLOAGGy
 u/d7AwtsTm
X-Google-Smtp-Source: AGHT+IFc8+LlCVyiSuTLdP8egy6T7XZd5h/9gHCfxOT6+snrK0nSZi+gUtUTxGalPDNOgciNrl/ZFQ==
X-Received: by 2002:a05:600c:6094:b0:477:1326:7b4b with SMTP id
 5b1f17b1804b1-47713267bbbmr21637325e9.19.1761577263637; 
 Mon, 27 Oct 2025 08:01:03 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5773sm15995176f8f.27.2025.10.27.08.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:01:02 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:01:00 +0100
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
Subject: Re: [PATCH 21/22] drm/vkms: Allow to hot-add connectors
Message-ID: <aP-JLHHg5nm6l0ji@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-21-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018-vkms-all-config-v1-21-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:21AM +0200, Louis Chauvet wrote:
> In order to allow creating dynamic connector, add the required
> infrastructure in vkms_connector.
> 
> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> [Louis Chauvet: use drm_atomic_helper_connector_reset instead of
> drm_mode_config_reset because connector is not yet registered]

Aha! That was why, thanks a lot for figuring this out :)

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_connector.c | 69 ++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_connector.h | 33 +++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_output.c    | 11 +++++-
>  3 files changed, 111 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index 339d747e729e..77a544728721 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_managed.h>
> @@ -144,9 +143,77 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  	return connector;
>  }
>  
> +static const struct drm_connector_funcs vkms_dynamic_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.destroy = drm_connector_cleanup,
> +	.detect = vkms_connector_detect,
> +};
> +
>  void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  
>  	drm_kms_helper_hotplug_event(dev);
>  }
> +
> +struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
> +					      struct vkms_config_connector *connector_cfg)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_connector *connector;
> +	int ret;
> +	unsigned long idx = 0;
> +
> +	connector = kzalloc(sizeof(*connector), GFP_KERNEL);

Could we use drmm_kzalloc instead?

> +	if (IS_ERR(connector))
> +		return connector;
> +	ret = drm_connector_dynamic_init(&vkmsdev->drm,
> +					 &connector->base,
> +					 &vkms_dynamic_connector_funcs,
> +					 connector_cfg->type,
> +					 NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, encoder_cfg) {
> +		ret = drm_connector_attach_encoder(&connector->base,
> +						   encoder_cfg->encoder);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	drm_atomic_helper_connector_reset(&connector->base);
> +
> +	ret = drm_connector_dynamic_register(&connector->base);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return connector;
> +}
> +
> +void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
> +			       struct vkms_connector *connector)
> +{
> +	drm_connector_unregister(&connector->base);
> +	drm_mode_config_reset(&vkmsdev->drm);
> +	drm_connector_put(&connector->base);
> +}
> +
> +int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
> +				      struct vkms_connector *connector,
> +				      struct drm_encoder *encoder)
> +{
> +	int ret;
> +
> +	ret = drm_connector_attach_encoder(&connector->base, encoder);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(&vkmsdev->drm);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index a124c5403697..224950c13a93 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -7,6 +7,7 @@
>  
>  #define drm_connector_to_vkms_connector(target) \
>  	container_of(target, struct vkms_connector, base)
> +struct vkms_config_connector;
>  
>  /**
>   * struct vkms_connector - VKMS custom type wrapping around the DRM connector
> @@ -33,4 +34,36 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>   */
>  void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
>  
> +/**
> + * vkms_connector_hot_add() - Create a connector after the device is created
> + * @vkmsdev: Device to hot-add the connector to
> + * @connector_cfg: Connector's configuration
> + *
> + * Returns:
> + * The connector or an error on failure.
> + */
> +struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
> +					      struct vkms_config_connector *connector_cfg);
> +
> +/**
> + * vkms_connector_hot_remove() - Remove a connector after a device is created
> + * @connector: The connector to hot-remove
> + */
> +void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
> +			       struct vkms_connector *connector);
> +
> +/**
> + * vkms_connector_hot_attach_encoder() - Attach a connector to a encoder after
> + * the device is created.
> + * @vkmsdev: Device containing the connector and the encoder
> + * @connector: Connector to attach to @encoder
> + * @encoder: Target encoder
> + *
> + * Returns:
> + * 0 on success or an error on failure.
> + */
> +int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
> +				      struct vkms_connector *connector,
> +				      struct drm_encoder *encoder);
> +
>  #endif /* _VKMS_CONNECTOR_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 217f054d9598..aba2f9ab243d 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -92,7 +92,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		}
>  	}
>  
> -	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
> +	vkms_config_for_each_connector_static(vkmsdev->config, connector_cfg) {
>  		struct vkms_config_encoder *possible_encoder;
>  		unsigned long idx = 0;
>  
> @@ -116,5 +116,14 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  
>  	drm_mode_config_reset(dev);
>  
> +	vkms_config_for_each_connector_dynamic(vkmsdev->config, connector_cfg) {
> +		if (connector_cfg->enabled) {
> +			connector_cfg->connector = vkms_connector_hot_add(vkmsdev, connector_cfg);
> +
> +			if (IS_ERR(connector_cfg->connector))
> +				return PTR_ERR(connector_cfg->connector);
> +		}
> +	}
> +
>  	return 0;
>  }
> 
> -- 
> 2.51.0
> 
