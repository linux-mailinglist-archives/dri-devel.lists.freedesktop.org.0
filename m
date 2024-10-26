Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CAC9B1910
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 17:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F510E108;
	Sat, 26 Oct 2024 15:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="ksFiG5pd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C9E10E108
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 15:22:20 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XbNgJ2GtRz9vvN;
 Sat, 26 Oct 2024 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729956140; bh=7owUxhN9X+jbjacXEfX6CmSMtq7aqDx02jvmRVZiOjA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ksFiG5pdwyiq7az82zeS3MFpCCBdMbyaId1p9GeHIAHLHmTdGUlm9l412MtOZl2WJ
 h0SBg5sjNVqkf7N5eZu1uspcmsha93X6Rca1kMMeNUNWhDTkclYVSpFu8vAQ2TyhtM
 e2FQkZuN4JgM476kwlqOpBLu1TPeoxejqFYR2CvY=
X-Riseup-User-ID: 1A0D2919C74591BB03443E9DEA64305B47DA0CCFF9C4E536AEC739FA2BE45D4E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XbNg10VYFzFqLF;
 Sat, 26 Oct 2024 15:22:04 +0000 (UTC)
Message-ID: <35a5cf2e-caa4-48bf-a5be-3cbae9865f6a@riseup.net>
Date: Sat, 26 Oct 2024 12:22:02 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/vkms: Remove index parameter from init_vkms_output
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com>
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

On 10/10/24 14:27, Louis Chauvet wrote:
> VKMS currently supports only one CRTC, so it make no sense to have this
> index configurable. To avoid issues, replace this hardcoded index by
> drm_crtc_mask when applicable.
> 
> There is no need to manually set a crtc mask on primary and cursor plane
> as it is automatically set by drmm_crtc_alloc_with_planes.
> 
> In addition, this will remove the use of an uninitialized structure in
> vkms_add_overlay_plane. This currently works by chance because two things:
> - vkms_plane_init always set a possible_crtcs value, so the problematic
>    branch is never used;
> - drm_crtc_mask on an kzalloc'd drm_crtc returns BIT(0), and the VKMS CRTC
>    always have this id.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Changes in v2:
> - Applied comments from José
> - Link to v1: https://lore.kernel.org/r/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com
> ---
>   drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
>   drivers/gpu/drm/vkms/vkms_drv.h    |  8 ++----
>   drivers/gpu/drm/vkms/vkms_output.c | 54 ++++++++++++++------------------------
>   drivers/gpu/drm/vkms/vkms_plane.c  |  4 +--
>   4 files changed, 24 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 2d1e95cb66e5..0f6805b9fe7b 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -174,7 +174,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>   	dev->mode_config.preferred_depth = 0;
>   	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>   
> -	return vkms_output_init(vkmsdev, 0);
> +	return vkms_output_init(vkmsdev);
>   }
>   
>   static int vkms_create(struct vkms_config *config)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 672fe191e239..036101ee4ea1 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -212,21 +212,17 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>    * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
>    *
>    * @vkmsdev: VKMS device to initialize
> - * @index: CRTC which can be attached to the planes. The caller must ensure that
> - *	   @index is positive and less or equals to 31.
>    */
> -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> +int vkms_output_init(struct vkms_device *vkmsdev);
>   
>   /**
>    * vkms_plane_init() - Initialize a plane
>    *
>    * @vkmsdev: VKMS device containing the plane
>    * @type: type of plane to initialize
> - * @index: CRTC which can be attached to the plane. The caller must ensure that
> - *	   @index is positive and less or equals to 31.
>    */
>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index);
> +				   enum drm_plane_type type);
>   
>   /* CRC Support */
>   const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 0a5a185aa0b0..5128aa3b2eb6 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -32,29 +32,14 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>   	.get_modes    = vkms_conn_get_modes,
>   };
>   
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> -				  struct drm_crtc *crtc)
> -{
> -	struct vkms_plane *overlay;
> -
> -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> -	if (IS_ERR(overlay))
> -		return PTR_ERR(overlay);
> -
> -	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> -
> -	return 0;
> -}
> -
> -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> +int vkms_output_init(struct vkms_device *vkmsdev)
>   {
>   	struct vkms_output *output = &vkmsdev->output;
>   	struct drm_device *dev = &vkmsdev->drm;
>   	struct drm_connector *connector = &output->connector;
>   	struct drm_encoder *encoder = &output->encoder;
>   	struct drm_crtc *crtc = &output->crtc;
> -	struct vkms_plane *primary, *cursor = NULL;
> +	struct vkms_plane *primary, *overlay, *cursor = NULL;
>   	int ret;
>   	int writeback;
>   	unsigned int n;
> @@ -65,34 +50,37 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
>   	 * composition.
>   	 */
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
>   	if (IS_ERR(primary))
>   		return PTR_ERR(primary);
>   
> -	if (vkmsdev->config->overlay) {
> -		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> -
>   	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>   		if (IS_ERR(cursor))
>   			return PTR_ERR(cursor);
>   	}
>   
> -	/* [1]: Allocation of a CRTC, its index will be BIT(0) = 1 */
>   	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
>   	if (ret)
>   		return ret;
>   
> +	if (vkmsdev->config->overlay) {
> +		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> +			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> +			if (IS_ERR(overlay)) {
> +				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> +				ret = PTR_ERR(overlay);
> +				goto err_crtc;
> +			}
> +			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> +		}
> +	}
> +
>   	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
>   				 DRM_MODE_CONNECTOR_VIRTUAL);
>   	if (ret) {
>   		DRM_ERROR("Failed to init connector\n");
> -		goto err_connector;
> +		goto err_crtc;
>   	}
>   
>   	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> @@ -103,11 +91,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   		DRM_ERROR("Failed to init encoder\n");
>   		goto err_encoder;
>   	}
> -	/*
> -	 * This is a hardcoded value to select crtc for the encoder.
> -	 * BIT(0) here designate the first registered CRTC, the one allocated in [1]
> -	 */
> -	encoder->possible_crtcs = BIT(0);
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret) {
> @@ -131,7 +115,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   err_encoder:
>   	drm_connector_cleanup(connector);
>   
> -err_connector:
> +err_crtc:
>   	drm_crtc_cleanup(crtc);

Do we really need `drm_crtc_cleanup`? We are allocating the CRTC with
`drmm_crtc_init_with_planes`.

The rest looks fine to me.

Best Regards,
- Maíra

>   
>   	return ret;
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e5c625ab8e3e..ad137c9a75f5 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -198,12 +198,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>   };
>   
>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type)
>   {
>   	struct drm_device *dev = &vkmsdev->drm;
>   	struct vkms_plane *plane;
>   
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
>   					   &vkms_plane_funcs,
>   					   vkms_formats, ARRAY_SIZE(vkms_formats),
>   					   NULL, type, NULL);
> 
> ---
> base-commit: 33c255312660653cf54f8019896b5dca28e3c580
> change-id: 20240906-vkms-remove-index-3a6e04c38e02
> 
> Best regards,
