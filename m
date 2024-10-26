Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC89B1919
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 17:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895D310E17B;
	Sat, 26 Oct 2024 15:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="P5lX5iOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5910E17B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 15:30:00 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XbNr73dW2z9sds;
 Sat, 26 Oct 2024 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729956599; bh=pYluJ3omqwxgqFAuDuVyD/Sd6a9hO2GIbBm03evzMkM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P5lX5iOV60zHPz2UpbtBKNNqnm9m47Z0j/IF7cS5n8e7uOuH0eFUOL6Fc2y9Zk38J
 8BbulnkN0hTOF+TsT5p7myVKy3LVo9Zy+ilYlE7gbHQ/z6eAODxgPHgVZ9gHo3Ky9Y
 fHIQ6GOdoU9MeQGX3mfZbFQ+WRzhp3NfGWUvtyR4=
X-Riseup-User-ID: FFBD87AD2E51267661257BB3EE0703F461EECA8382EB83FB8428AA0B3FB6850F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XbNqn6JlszFqLF;
 Sat, 26 Oct 2024 15:29:41 +0000 (UTC)
Message-ID: <575323aa-d322-4d03-8343-15aaaa955437@riseup.net>
Date: Sat, 26 Oct 2024 12:29:39 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/5] drm/vkms: Switch to managed for connector
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
 <20241010-google-vkms-managed-v4-1-ed04a62ad2e3@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20241010-google-vkms-managed-v4-1-ed04a62ad2e3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Louis,

On 10/10/24 14:39, Louis Chauvet wrote:
> The current VKMS driver uses non-managed function to create connectors. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_output.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 5128aa3b2eb6..8f7a05b73e1d 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,11 +3,11 @@
>   #include "vkms_drv.h"
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>   #include <drm/drm_probe_helper.h>
>   
>   static const struct drm_connector_funcs vkms_connector_funcs = {
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.reset = drm_atomic_helper_connector_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -70,17 +70,17 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   			if (IS_ERR(overlay)) {
>   				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
>   				ret = PTR_ERR(overlay);
> -				goto err_crtc;
> +				goto err_connector;

Why did you renamed err_crtc to err_connector? I think err_crtc looks
correct.

Best Regards,
- Maíra

>   			}
>   			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
>   		}
>   	}
>   
> -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init connector\n");
> -		goto err_crtc;
> +		goto err_connector;
>   	}
>   
>   	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> @@ -89,7 +89,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init encoder\n");
> -		goto err_encoder;
> +		return ret;
>   	}
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
> @@ -111,12 +111,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>   
>   err_attach:
>   	drm_encoder_cleanup(encoder);
> -
> -err_encoder:
> -	drm_connector_cleanup(connector);
> -
> -err_crtc:
> +err_connector:
>   	drm_crtc_cleanup(crtc);
> -
>   	return ret;
>   }
> 
