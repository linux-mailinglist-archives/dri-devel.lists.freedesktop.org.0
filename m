Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66CA6FAE22
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 13:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36310E24D;
	Mon,  8 May 2023 11:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32510E24D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XTddLcsberhUQKESO0MF+J90sxDVtPwIR5ZIy4T2X9w=; b=QC1T0wborbKk0b30Wy0I/+us/g
 DKOZADygzBZ5hqT5lfAtFzvsklBiPooHPZHju65R7VTPQ97mBMEx/GlplyugdlFfAE5sQ669Obofn
 3gEW+r3L6tbLxLw9gLvTAOHtk7LmYSML9phcIfYwXJN0yzmHUL2jwWZvowdSH66VChsupcCk8n5X1
 qj8f1hHrG1Y3GOyDEp3GRvY4P/j+q3fSgZ5pN7/KnHJbPQ9yqiKw0j9V9KO22LmKxqyS9EGQsp8W0
 81x0Dq4NwOgp7LVDk+QplA7wPKizKw7P/l1Ohdx0PpmsGaHIaCPsjQMuNEzQ6j7W9ryC/9GkPkpBk
 N9QTD4yg==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pvzFJ-003pLi-8l; Mon, 08 May 2023 13:41:37 +0200
Message-ID: <a59779a5-f1f7-573d-6bc9-001455ddc42b@igalia.com>
Date: Mon, 8 May 2023 08:41:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 3/4] vkms: Add support for multiple pipes
Content-Language: en-US
To: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org
References: <20230508075356.6511-1-marius.vlad@collabora.com>
 <20230508075356.6511-4-marius.vlad@collabora.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230508075356.6511-4-marius.vlad@collabora.com>
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 yixie@chromium.org, melissa.srw@gmail.com, jshargo@chromium.org,
 brpol@chromium.org, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marius,

On 5/8/23 04:53, Marius Vlad wrote:
> This adds support for creating multiple virtual pipes, in case one would
> need to display multiple independent things on different outputs.
> 
> We use a module parameter to specify how many to create,  defaulting to
> just one with the possibility of specifying a maximum of 4 possible pipes.
> 
> This is of particular importance when testing out the DRM back-end in
> compositors, but also to be able to independently set different DPMS states.
> 
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>   drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
>   drivers/gpu/drm/vkms/vkms_drv.c       | 37 ++++++++++++++++++++++-----
>   drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++---
>   drivers/gpu/drm/vkms/vkms_output.c    |  5 ++--
>   drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++---------
>   5 files changed, 55 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 515f6772b866..051e7b647db9 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -89,8 +89,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>   {
>   	struct drm_device *dev = crtc->dev;
>   	unsigned int pipe = crtc->index;
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
>   	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>   
>   	if (!READ_ONCE(vblank->enabled)) {
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index bd53194f1525..b93157fa5336 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -51,14 +51,19 @@ static bool enable_overlay;
>   module_param_named(enable_overlay, enable_overlay, bool, 0444);
>   MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>   
> +static unsigned int max_pipes = 1;
> +module_param_named(max_pipes, max_pipes, int, 0444);
> +MODULE_PARM_DESC(max_pipes, "Specify how many pipes to create");
> +
>   DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>   
>   static void vkms_release(struct drm_device *dev)
>   {
> -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
> +	int i;
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>   
> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> +	for (i = 0; i < vkmsdev->config->max_pipes; i++)
> +		destroy_workqueue(vkmsdev->output[i].composer_workq);
>   }
>   
>   static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> @@ -100,6 +105,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
>   	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
>   	seq_printf(m, "overlay_planes=%d\n", vkmsdev->config->overlay_planes);
> +	seq_printf(m, "pipes=%d\n", vkmsdev->config->max_pipes);
>   
>   	return 0;
>   }
> @@ -134,7 +140,7 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
>   static int vkms_modeset_init(struct vkms_device *vkmsdev)
>   {
>   	struct drm_device *dev = &vkmsdev->drm;
> -	int ret;
> +	int ret, i;
>   
>   	ret = drmm_mode_config_init(dev);
>   	if (ret)
> @@ -153,7 +159,14 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>   	dev->mode_config.preferred_depth = 0;
>   	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>   
> -	return vkms_output_init(vkmsdev, 0);
> +	for (i = 0; i < vkmsdev->config->max_pipes; i++) {
> +		ret = vkms_output_init(vkmsdev, i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	drm_mode_config_reset(dev);
> +	return ret;
>   }
>   
>   static int vkms_create(struct vkms_config *config)
> @@ -189,7 +202,7 @@ static int vkms_create(struct vkms_config *config)
>   		goto out_devres;
>   	}
>   
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> +	ret = drm_vblank_init(&vkms_device->drm, config->max_pipes);
>   	if (ret) {
>   		DRM_ERROR("Failed to vblank\n");
>   		goto out_devres;
> @@ -232,7 +245,19 @@ static int __init vkms_init(void)
>   	config->writeback = enable_writeback;
>   	config->overlay = enable_overlay;
>   	config->overlay_planes = NUM_OVERLAY_PLANES;
> +	config->max_pipes = max_pipes;
> +
> +	if (config->max_pipes > NUM_MAX_PIPES)
> +		config->max_pipes = NUM_MAX_PIPES;
> +	if (config->max_pipes < NUM_MIN_PIPES)
> +		config->max_pipes = NUM_MIN_PIPES;
> +
> +	/* with NUM_OVERLAY_PLANES overlays and 4 pipes we'll exceed the amount
> +	 * of planes we can have; see drm_mode_config::num_total_plane */
> +	if (config->overlay && config->max_pipes == NUM_MAX_PIPES)
> +		config->overlay_planes -= 2;

I'm not sure if you really need to set the overlay planes as a kernel parameter.
You could just reduce NUM_OVERLAY_PLANES to 6 or even 4. This way you could
remove this if statement and make the logic more simple.

Best Regards,
- Maíra Canal

>   
> +	DRM_INFO("Initialized with %u pipes\n", config->max_pipes);
>   	ret = vkms_create(config);
>   	if (ret)
>   		kfree(config);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index ae2b38360236..29617cd491e3 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -21,7 +21,9 @@
>   #define XRES_MAX  8192
>   #define YRES_MAX  8192
>   
> -#define NUM_OVERLAY_PLANES 8
> +#define NUM_OVERLAY_PLANES	8
> +#define NUM_MAX_PIPES		4
> +#define NUM_MIN_PIPES		1
>   
>   struct vkms_frame_info {
>   	struct drm_framebuffer *fb;
> @@ -113,6 +115,7 @@ struct vkms_config {
>   	bool cursor;
>   	bool overlay;
>   	unsigned int overlay_planes;
> +	unsigned int max_pipes;
>   	/* only set when instantiated */
>   	struct vkms_device *dev;
>   };
> @@ -120,13 +123,16 @@ struct vkms_config {
>   struct vkms_device {
>   	struct drm_device drm;
>   	struct platform_device *platform;
> -	struct vkms_output output;
> +	struct vkms_output output[NUM_MAX_PIPES];
>   	const struct vkms_config *config;
>   };
>   
>   #define drm_crtc_to_vkms_output(target) \
>   	container_of(target, struct vkms_output, crtc)
>   
> +#define wb_connector_to_vkms_output(target) \
> +	container_of(target, struct vkms_output, wb_connector)
> +
>   #define drm_device_to_vkms_device(target) \
>   	container_of(target, struct vkms_device, drm)
>   
> @@ -158,6 +164,6 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
>   void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
>   
>   /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, int index);
>   
>   #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index f4e67a0ad712..ca4dc16b8d01 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -48,7 +48,7 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
>   
>   int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   {
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_output *output = &vkmsdev->output[index];
>   	struct drm_device *dev = &vkmsdev->drm;
>   	struct drm_connector *connector = &output->connector;
>   	struct drm_encoder *encoder = &output->encoder;
> @@ -104,12 +104,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   	}
>   
>   	if (vkmsdev->config->writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev);
> +		writeback = vkms_enable_writeback_connector(vkmsdev, index);
>   		if (writeback)
>   			DRM_ERROR("Failed to init writeback connector\n");
>   	}
>   
> -	drm_mode_config_reset(dev);
>   
>   	return 0;
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 84a51cd281b9..5f291689f870 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -101,7 +101,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>   				struct drm_writeback_job *job)
>   {
>   	struct vkms_writeback_job *vkmsjob = job->priv;
> -	struct vkms_device *vkmsdev;
> +	struct vkms_output *output = wb_connector_to_vkms_output(connector);
>   
>   	if (!job->fb)
>   		return;
> @@ -110,19 +110,18 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>   
>   	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
>   
> -	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
> -	vkms_set_composer(&vkmsdev->output, false);
> +	vkms_set_composer(output, false);
>   	kfree(vkmsjob);
>   }
>   
>   static void vkms_wb_atomic_commit(struct drm_connector *conn,
>   				  struct drm_atomic_state *state)
>   {
> -	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
> -											 conn);
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> -	struct vkms_output *output = &vkmsdev->output;
> -	struct drm_writeback_connector *wb_conn = &output->wb_connector;
> +	struct drm_connector_state *connector_state =
> +		drm_atomic_get_new_connector_state(state, conn);
> +	struct drm_writeback_job *wb_job = connector_state->writeback_job;
> +	struct drm_writeback_connector *wb_conn = wb_job->connector;
> +	struct vkms_output *output = wb_connector_to_vkms_output(wb_conn);
>   	struct drm_connector_state *conn_state = wb_conn->base.state;
>   	struct vkms_crtc_state *crtc_state = output->composer_state;
>   	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
> @@ -135,7 +134,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>   	if (!conn_state)
>   		return;
>   
> -	vkms_set_composer(&vkmsdev->output, true);
> +	vkms_set_composer(output, true);
>   
>   	active_wb = conn_state->writeback_job->priv;
>   	wb_frame_info = &active_wb->wb_frame_info;
> @@ -147,6 +146,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>   	wb_frame_info->cpp = fb->format->cpp[0];
>   	crtc_state->wb_pending = true;
>   	spin_unlock_irq(&output->composer_lock);
> +
>   	drm_writeback_queue_job(wb_conn, connector_state);
>   	active_wb->wb_write = get_line_to_frame_function(wb_format);
>   	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
> @@ -160,9 +160,9 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>   	.atomic_commit = vkms_wb_atomic_commit,
>   };
>   
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, int index)
>   {
> -	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +	struct drm_writeback_connector *wb = &vkmsdev->output[index].wb_connector;
>   
>   	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>   
> @@ -171,5 +171,5 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
>   					    &vkms_wb_encoder_helper_funcs,
>   					    vkms_wb_formats,
>   					    ARRAY_SIZE(vkms_wb_formats),
> -					    1);
> +					    1 << index);
>   }
