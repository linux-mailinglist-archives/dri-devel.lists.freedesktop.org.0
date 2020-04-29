Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6D1BE59C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 19:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1F86EAB7;
	Wed, 29 Apr 2020 17:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5896C6EAB7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 17:49:23 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3487B804E7;
 Wed, 29 Apr 2020 19:49:20 +0200 (CEST)
Date: Wed, 29 Apr 2020 19:49:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/17] drm/mgag200: Embed connector instance in struct
 mga_device
Message-ID: <20200429174918.GA31071@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-4-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=T4VA1Ah5300dP-xGqlsA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Wed, Apr 29, 2020 at 04:32:24PM +0200, Thomas Zimmermann wrote:
> Storing the connector instance in struct mga_device avoids some
> dynamic memory allocation. Done im preparation of converting
> mgag200 to simple-KMS helpers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
One nit below, with that fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I expect to see mga_i2c_chan embedded in a later patch...

	Sam


> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 54 ++++++++++++++------------
>  2 files changed, 31 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index de3181bd63ca0..09b43a0ff6bbf 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -164,6 +164,7 @@ struct mga_device {
>  	/* SE model number stored in reg 0x1e24 */
>  	u32 unique_rev_id;
>  
> +	struct mga_connector connector;
>  	struct drm_encoder encoder;
>  };
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index ce41bebfdd1a2..eaa3fca7216ac 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1444,6 +1444,10 @@ static void mga_crtc_init(struct mga_device *mdev)
>  	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
>  }
>  
> +/*
> + * Connector
> + */
> +
>  static int mga_vga_get_modes(struct drm_connector *connector)
>  {
>  	struct mga_connector *mga_connector = to_mga_connector(connector);
> @@ -1568,7 +1572,6 @@ static void mga_connector_destroy(struct drm_connector *connector)
>  	struct mga_connector *mga_connector = to_mga_connector(connector);
>  	mgag200_i2c_destroy(mga_connector->i2c);
>  	drm_connector_cleanup(connector);
> -	kfree(connector);
>  }
>  
>  static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
> @@ -1582,37 +1585,39 @@ static const struct drm_connector_funcs mga_vga_connector_funcs = {
>  	.destroy = mga_connector_destroy,
>  };
>  
> -static struct drm_connector *mga_vga_init(struct drm_device *dev)
> +static int mgag200_vga_connector_init(struct mga_device *mdev)
>  {
> -	struct drm_connector *connector;
> -	struct mga_connector *mga_connector;
> -
> -	mga_connector = kzalloc(sizeof(struct mga_connector), GFP_KERNEL);
> -	if (!mga_connector)
> -		return NULL;
> -
> -	connector = &mga_connector->base;
> -	mga_connector->i2c = mgag200_i2c_create(dev);
> -	if (!mga_connector->i2c)
> -		DRM_ERROR("failed to add ddc bus\n");
> +	struct drm_device *dev = mdev->dev;
> +	struct mga_connector *mconnector = &mdev->connector;
> +	struct drm_connector *connector = &mconnector->base;
> +	struct mga_i2c_chan *i2c;
> +	int ret;
>  
> -	drm_connector_init_with_ddc(dev, connector,
> -				    &mga_vga_connector_funcs,
> -				    DRM_MODE_CONNECTOR_VGA,
> -				    &mga_connector->i2c->adapter);
> +	i2c = mgag200_i2c_create(dev);
> +	if (!i2c)
> +		drm_warn(dev, "failed to add DDC bus\n");
>  
> +	ret = drm_connector_init_with_ddc(dev, connector,
> +					  &mga_vga_connector_funcs,
> +					  DRM_MODE_CONNECTOR_VGA,
> +					  &i2c->adapter);
> +	if (ret)
> +		goto err_mgag200_i2c_destroy;
>  	drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
>  
> -	drm_connector_register(connector);
> +	mconnector->i2c = i2c;
>  
> -	return connector;
> -}
> +	return 0;
>  
> +err_mgag200_i2c_destroy:
> +	mgag200_i2c_destroy(i2c);
> +	return ret;
> +}
>  
>  int mgag200_modeset_init(struct mga_device *mdev)
>  {
>  	struct drm_encoder *encoder = &mdev->encoder;
> -	struct drm_connector *connector;
> +	struct drm_connector *connector = &mdev->connector.base;
>  	int ret;
>  
>  	mdev->dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> @@ -1632,9 +1637,10 @@ int mgag200_modeset_init(struct mga_device *mdev)
>  	}
>  	encoder->possible_crtcs = 0x1;
>  
> -	connector = mga_vga_init(mdev->dev);
> -	if (!connector) {
> -		DRM_ERROR("mga_vga_init failed\n");
> +	ret = mgag200_vga_connector_init(mdev);
> +	if (ret) {
> +		drm_err(mdev->dev,
> +			"mga_vga_connector_init() failed, error %d\n", ret);
s/mga_vga_connector_init/mgag200_vga_connector_init/

>  		return -1;
>  	}
>  
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
