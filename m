Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC8950BCC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E5710E3BA;
	Tue, 13 Aug 2024 17:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NE2KUCRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BAF10E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F21A240005;
 Tue, 13 Aug 2024 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dejwQO/IByLQQk1Olumnre9RPQk3PFi8Nd8Sz+iDMvc=;
 b=NE2KUCRudXuZTvXVHgjtH7iqonZl84sK+ZHKDT1c2Kf/cbOlzwzZHCUhsXkiWLoFFHBsiO
 ddm8BDCcjKbQn6umkvSbknEriZusXa+Y1lUYvh/x9o34iz14sYLlKdhXS376kxrrM0XYUK
 GEe3qdz8+YWZT6DITiee7kpSzmuQo0v2ID1PlyoA6h+uQHJmwbUTyFkm6RFk1ECWrKrpoy
 HJAB9l12VQjVzrQTkTvYKqpmoBuVyEQvXk7O7um5PmTnxuBDqnpt9xQPKcle16EkDhuhcw
 Jahe3vteHx2/4N+B9WlFq/Q5IsSE63dDkhPdWb12r9W3QiUYk6ctCPxewc9ylw==
Date: Tue, 13 Aug 2024 19:58:55 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 04/17] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <Zrue3y6Lr6D4s1Tn@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-5-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-5-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 13/08/24 - 12:44, José Expósito a écrit :
> Add a list of CRTC configurations to vkms_config and add as many CRTCs
> as configured during output initialization.
> 
> For backwards compatibility, create a single CRTC in the default
> configuration.
> 
> Since writeback support, vblank and composer states are now per CRTC,
> extract all the fields to the vkms_crtc structure and allow each
> vkms_device to have a list of CRTCs.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>


If we choose your implementation, can you split this commit in two? I 
think you did two interesting stuff here:
- Creating the vkms_crtc structure
- Creating the vkms_crtc_config

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  | 30 ++++----
>  drivers/gpu/drm/vkms/vkms_config.c    | 54 ++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_config.h    | 15 +++-
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 99 ++++++++++++++-------------
>  drivers/gpu/drm/vkms/vkms_drv.c       | 10 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h       | 35 +++++++---
>  drivers/gpu/drm/vkms/vkms_output.c    | 38 +++++-----
>  drivers/gpu/drm/vkms/vkms_writeback.c | 27 ++++----
>  8 files changed, 197 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 6ab8091bf72f..3af750071f04 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -26,20 +27,29 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  					       bool enable_overlay)
>  {
>  	struct vkms_config *config;
> +	struct vkms_config_crtc *crtc_cfg;
>  
>  	config = vkms_config_create(DEFAULT_DEVICE_NAME);
>  	if (IS_ERR(config))
>  		return config;
>  
>  	config->cursor = enable_cursor;
> -	config->writeback = enable_writeback;
>  	config->overlay = enable_overlay;
>  
> +	crtc_cfg = vkms_config_add_crtc(config, enable_writeback);
> +	if (IS_ERR(crtc_cfg))
> +		return ERR_CAST(crtc_cfg);
> +
>  	return config;
>  }
>  
>  void vkms_config_destroy(struct vkms_config *config)
>  {
> +	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
> +
> +	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, list)
> +		vkms_config_destroy_crtc(config, crtc_cfg);
> +
>  	kfree(config);
>  }
>  
> @@ -48,12 +58,20 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct drm_debugfs_entry *entry = m->private;
>  	struct drm_device *dev = entry->dev;
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> +	struct vkms_config_crtc *crtc_cfg;
> +	int n;
>  
>  	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
> -	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
>  	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
>  	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
>  
> +	n = 0;
> +	list_for_each_entry(crtc_cfg, &vkmsdev->config->crtcs, list) {
> +		seq_printf(m, "crtc(%d).writeback=%d\n", n,
> +			   crtc_cfg->writeback);
> +		n++;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -66,3 +84,35 @@ void vkms_config_debugfs_init(struct vkms_device *vkms_device)
>  	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  }
> +
> +struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
> +					      bool enable_writeback)
> +{
> +	struct vkms_config_crtc *crtc_cfg;
> +
> +	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
> +	if (!crtc_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	crtc_cfg->writeback = enable_writeback;
> +
> +	crtc_cfg->index = 0;
> +	if (!list_empty(&config->crtcs)) {
> +		struct vkms_config_crtc *last;
> +
> +		last = list_last_entry(&config->crtcs, struct vkms_config_crtc,
> +				       list);
> +		crtc_cfg->index = last->index + 1;
> +	}

This code may break if you create 32 crtc, delete the 31 first, and then 
recreate 31 crtc. The indexes will be 31..63, which is wrong I think for 
the `possible_crtc` mask.

That why in my series I choose to use drm_crtc_mask with the created crtc 
instance, so I don't have to manage in my code this case, I just rely on 
drm core implementation to provide indexes.

> +
> +	list_add_tail(&crtc_cfg->list, &config->crtcs);
> +
> +	return crtc_cfg;
> +}
> +
> +void vkms_config_destroy_crtc(struct vkms_config *config,
> +			      struct vkms_config_crtc *crtc_cfg)
> +{
> +	list_del(&crtc_cfg->list);
> +	kfree(crtc_cfg);
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index ba06aad32799..bc40a0e3859a 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -3,15 +3,22 @@
>  #ifndef _VKMS_CONFIG_H_
>  #define _VKMS_CONFIG_H_
>  
> +#include <linux/list.h>
>  #include <linux/types.h>
>  
>  struct vkms_device;
>  
> +struct vkms_config_crtc {
> +	struct list_head list;
> +	unsigned int index;
> +	bool writeback;
> +};
> +
>  struct vkms_config {
>  	char *dev_name;
> -	bool writeback;
>  	bool cursor;
>  	bool overlay;
> +	struct list_head crtcs;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
> @@ -26,4 +33,10 @@ void vkms_config_destroy(struct vkms_config *config);
>  /* DebugFS */
>  void vkms_config_debugfs_init(struct vkms_device *vkms_device);
>  
> +/* CRTCs */
> +struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
> +					      bool enable_writeback);
> +void vkms_config_destroy_crtc(struct vkms_config *config,
> +			      struct vkms_config_crtc *crtc_cfg);
> +
>  #endif /* _VKMS_CONFIG_H_ */



> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
> +				 struct drm_plane *primary,
> +				 struct drm_plane *cursor,
> +				 unsigned int index)
>  {
> -	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> -	int ret;
> +	struct vkms_crtc *crtc;
>  
> -	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> -					 &vkms_crtc_funcs, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +	crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base, primary,
> +					   cursor, &vkms_crtc_funcs, NULL);
> +	if (IS_ERR(crtc)) {
> +		DRM_ERROR("Failed to alloc CRTC\n");
> +		return crtc;
>  	}
>  
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	crtc->base.index = index;
> +	primary->possible_crtcs = drm_crtc_mask(&crtc->base);

It feel strange to configure the primary plane possible_crtc inside the 
vkms_crtc_init function, espicially when it is already configured in
vkms_plane_init.

The previous comment apply for allocating index to crtc, it is already 
managed by the drm core (in drmm_crtc_alloc_with_plane). I don't think 
this is an issue for the core to have it changed, but I would prefer to 
avoid duplicating this management in vkms.

> +	if (cursor)
> +		cursor->possible_crtcs = drm_crtc_mask(&crtc->base);

(same for cursor)

> -	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> -	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> +	INIT_LIST_HEAD(&crtc->list);
>  
> -	spin_lock_init(&vkms_out->lock);
> -	spin_lock_init(&vkms_out->composer_lock);
> +	drm_crtc_helper_add(&crtc->base, &vkms_crtc_helper_funcs);
>  
> -	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> -	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +	drm_mode_crtc_set_gamma_size(&crtc->base, VKMS_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(&crtc->base, 0, false, VKMS_LUT_SIZE);
> +
> +	spin_lock_init(&crtc->lock);
> +	spin_lock_init(&crtc->composer_lock);
> +
> +	crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> +	if (!crtc->composer_workq)
> +		return ERR_PTR(-ENOMEM);
>
> -	return ret;
> +	return crtc;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 2f9d1db0cfae..15a2ba26d190 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -54,9 +54,12 @@ DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
> +	struct vkms_crtc *vkms_crtc;
>  
> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> +	list_for_each_entry(vkms_crtc, &vkms->crtcs, list) {
> +		if (vkms_crtc->composer_workq)
> +			destroy_workqueue(vkms_crtc->composer_workq);
> +	}
>  }

To avoid managing this per-crtc, you can maybe use 
drmm_add_action_or_reset [1] and let drm core manage the call to 
destroy_workqueue.

[1]: https://github.com/Fomys/linux/commit/c4d665599798265aedd131f93cff8c7263cacff8#diff-08d2420ad9a7a48e3c7dafa0f61e0a7c860a53de2f41659d03735875cffebea5R318
  
>  static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> @@ -177,6 +180,7 @@ static int vkms_create(struct vkms_config *config)
>  	}
>  	vkms_device->platform = pdev;
>  	vkms_device->config = config;
> +	vkms_device->crtcs = (struct list_head)LIST_HEAD_INIT(vkms_device->crtcs);

Why do you need a cast here?

>  	config->dev = vkms_device;
>  
>  	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
> @@ -187,7 +191,7 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> +	ret = drm_vblank_init(&vkms_device->drm, list_count_nodes(&config->crtcs));

Thanks, I think I forgot this change in my implementation!

>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
>  		goto out_devres;
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 87e44b51a03f..3156ff896c33 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -4,6 +4,7 @@
>  #define _VKMS_DRV_H_
>  
>  #include <linux/hrtimer.h>
> +#include <linux/list.h>
>  
>  #include <drm/drm.h>
>  #include <drm/drm_framebuffer.h>
> @@ -98,10 +99,11 @@ struct vkms_crtc_state {
>  	u64 frame_end;
>  };
>  
> -struct vkms_output {
> -	struct drm_crtc crtc;
> -	struct drm_encoder encoder;
> -	struct drm_connector connector;
> +struct vkms_crtc {
> +	struct list_head list;
> +
> +	struct drm_crtc base;
> +
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> @@ -119,19 +121,28 @@ struct vkms_output {
>  
>  struct vkms_config;
>  
> +struct vkms_output {
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +};
> +
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
>  	struct vkms_output output;
> +	struct list_head crtcs;
>  	const struct vkms_config *config;
>  };

I don't think you need to store the list of crtcs. You can use 
drm_for_each_crtc and container_of macro to get the vkms_crtc structure. 

>  
> -#define drm_crtc_to_vkms_output(target) \
> -	container_of(target, struct vkms_output, crtc)
> -
>  #define drm_device_to_vkms_device(target) \
>  	container_of(target, struct vkms_device, drm)
>  
> +#define drm_crtc_to_vkms_crtc(crtc) \
> +	container_of(crtc, struct vkms_crtc, base)
> +
> +#define timer_to_vkms_crtc(timer) \
> +	container_of(timer, struct vkms_crtc, vblank_hrtimer)
> +
>  #define to_vkms_crtc_state(target)\
>  	container_of(target, struct vkms_crtc_state, base)
>  
> @@ -139,8 +150,10 @@ struct vkms_device {
>  	container_of(target, struct vkms_plane_state, base.base)
>  
>  /* CRTC */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> +struct vkms_crtc *vkms_crtc_init(struct drm_device *dev,
> +				 struct drm_plane *primary,
> +				 struct drm_plane *cursor,
> +				 unsigned int index);
>  
>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
>  
> @@ -156,11 +169,11 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
> -void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
>  void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
>  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
>  
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +int vkms_enable_writeback_connector(struct vkms_crtc *vkms_crtc);
>  
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index afe3945c1962..dcd32bc30e17 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -32,8 +32,7 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.get_modes    = vkms_conn_get_modes,
>  };
>  
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> -				  struct drm_crtc *crtc)
> +static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index)
>  {
>  	struct vkms_plane *overlay;
>  
> @@ -42,7 +41,7 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
>  		return PTR_ERR(overlay);
>  
>  	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> +		overlay->base.possible_crtcs = BIT(index);

Again, I prefer to see `drm_crtc_mask` to compute possible_crtcs bitmask.
  
>  	return 0;
>  }
> @@ -53,7 +52,8 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector = &output->connector;
>  	struct drm_encoder *encoder = &output->encoder;
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct vkms_crtc *vkms_crtc;
> +	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_plane *primary, *cursor = NULL;
>  	int ret;
>  	int writeback;
> @@ -65,7 +65,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  
>  	if (vkmsdev->config->overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> +			ret = vkms_add_overlay_plane(vkmsdev, index);
>  			if (ret)
>  				return ret;
>  		}
> @@ -77,15 +77,26 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  			return PTR_ERR(cursor);
>  	}
>  
> -	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> -	if (ret)
> -		return ret;
> +	list_for_each_entry(crtc_cfg, &vkmsdev->config->crtcs, list) {
> +		vkms_crtc = vkms_crtc_init(dev, &primary->base, &cursor->base,
> +					   crtc_cfg->index);
> +		if (IS_ERR(vkms_crtc))
> +			return PTR_ERR(vkms_crtc);
> +
> +		list_add_tail(&vkms_crtc->list, &vkmsdev->crtcs);
> +
> +		if (crtc_cfg->writeback) {
> +			writeback = vkms_enable_writeback_connector(vkms_crtc);
> +			if (writeback)
> +				DRM_ERROR("Failed to init writeback connector\n");
> +		}
> +	}

You are creating multiple CRTC, but only link planes to the `index` one. 
Is this intentional? DRM is not happy if a CRTC don't have any primary 
plane.

>  
>  	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
>  				 DRM_MODE_CONNECTOR_VIRTUAL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init connector\n");
> -		goto err_connector;
> +		return ret;
>  	}
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> @@ -104,12 +115,6 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		goto err_attach;
>  	}
>  
> -	if (vkmsdev->config->writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev);
> -		if (writeback)
> -			DRM_ERROR("Failed to init writeback connector\n");
> -	}
> -
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> @@ -120,8 +125,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  err_encoder:
>  	drm_connector_cleanup(connector);
>  
> -err_connector:
> -	drm_crtc_cleanup(crtc);
> -
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index bc724cbd5e3a..b317cb291586 100644

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
