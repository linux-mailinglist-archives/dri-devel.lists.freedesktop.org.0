Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962383D4FCC
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 22:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E57F6E4AA;
	Sun, 25 Jul 2021 20:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4F86E4AA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 20:03:32 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 6bf0807c-ed83-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 20:03:47 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 34693194B04;
 Sun, 25 Jul 2021 22:03:50 +0200 (CEST)
Date: Sun, 25 Jul 2021 22:03:29 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/5] drm/vkms: Map output framebuffer BOs with
 drm_gem_fb_vmap()
Message-ID: <YP3DkUUpu5vO66Z0@ravnborg.org>
References: <20210725174438.24493-1-tzimmermann@suse.de>
 <20210725174438.24493-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725174438.24493-6-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 melissa.srw@gmail.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 25, 2021 at 07:44:38PM +0200, Thomas Zimmermann wrote:
> Abstract the framebuffer details by mappings its BOs with a call
> to drm_gem_fb_vmap(). Unmap with drm_gem_fb_vunamp().
> 
> Before, the output address with stored as raw pointer in the priv
> field of struct drm_writeback_job. Introduce the new type
> struct vkms_writeback_job, which holds the output mappings addresses
> while the writeback job is active.
> 
> The patchset also cleans up some internal casting an setup of the
> output addresses. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  6 +++++-
>  drivers/gpu/drm/vkms/vkms_writeback.c | 21 ++++++++++-----------
>  3 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index ead8fff81f30..49f109c3a2b3 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -257,7 +257,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		return;
>  
>  	if (wb_pending)
> -		vaddr_out = crtc_state->active_writeback;
> +		vaddr_out = crtc_state->active_writeback->map[0].vaddr;
>  
>  	ret = compose_active_planes(&vaddr_out, primary_composer,
>  				    crtc_state);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 8c731b6dcba7..8bc9e3f52e1f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -20,6 +20,10 @@
>  #define XRES_MAX  8192
>  #define YRES_MAX  8192
>  
> +struct vkms_writeback_job {
> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> +};
> +
>  struct vkms_composer {
>  	struct drm_framebuffer fb;
>  	struct drm_rect src, dst;
> @@ -57,7 +61,7 @@ struct vkms_crtc_state {
>  	int num_active_planes;
>  	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
> -	void *active_writeback;
> +	struct vkms_writeback_job *active_writeback;
>  
>  	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 0935686475a0..765bb85ba76c 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -65,21 +65,23 @@ static int vkms_wb_connector_get_modes(struct drm_connector *connector)
>  static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>  			       struct drm_writeback_job *job)
>  {
> -	struct drm_gem_object *gem_obj;
> -	struct dma_buf_map map;
> +	struct vkms_writeback_job *vkmsjob;
>  	int ret;
>  
>  	if (!job->fb)
>  		return 0;
>  
> -	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
> -	ret = drm_gem_shmem_vmap(gem_obj, &map);
> +	vkmsjob = kzalloc(sizeof(*vkmsjob), GFP_KERNEL);
> +	if (!vkmsjob)
> +		return -ENOMEM;
> +
> +	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map);
>  	if (ret) {
>  		DRM_ERROR("vmap failed: %d\n", ret);
>  		return ret;
>  	}
>  
> -	job->priv = map.vaddr;
> +	job->priv = vkmsjob;
>  
>  	return 0;
>  }
> @@ -87,18 +89,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>  static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  				struct drm_writeback_job *job)
>  {
> -	struct drm_gem_object *gem_obj;
> +	struct vkms_writeback_job *vkmsjob = job->priv;
>  	struct vkms_device *vkmsdev;
> -	struct dma_buf_map map;
>  
>  	if (!job->fb)
>  		return;
>  
> -	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
> -	dma_buf_map_set_vaddr(&map, job->priv);
> -	drm_gem_shmem_vunmap(gem_obj, &map);
> +	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
>  
> -	vkmsdev = drm_device_to_vkms_device(gem_obj->dev);
> +	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
>  	vkms_set_composer(&vkmsdev->output, false);
>  }
>  
> -- 
> 2.32.0
