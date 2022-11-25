Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B35638F4F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 18:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FDE10E779;
	Fri, 25 Nov 2022 17:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC0910E779
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rbku6l+SplyZzM1CXsGrD0FkNFKm1kSxKIalZ/7MDMo=; b=drt0+e8P+UWeqn5nv5ltcnH8zW
 PHx7JoMsxfAMipYfmrO/xDMOsI7pIr9IMUVQs43jz5s3zmagMPWsGqQEuy/d+Wn5RBRj2ckPfL4QR
 J9XRh3iSMJIEWSQr2agjvR8MZLglxC3zltcYWuqIOUEnKYSj59bjqFtIwNN0CJ4TV+nnNKAu015p5
 CNLFnn33Be7XJ5L0FDkCvQN1fPwE/gvB/MHMMT9K9JSr/yX+fgFcfNrR4BSr7CyP6DCajupKtgkNL
 kCH2gRZV0t9Oy/GBX8+WjCshs5lQvyWSw9a4hzSufrFiwxBGvXLJA1iEbRX49NAFxuz+/GC07OZ4Q
 S/V+AVFg==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=49227)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oycoB-0001ob-9r; Fri, 25 Nov 2022 18:48:15 +0100
Message-ID: <8da60926-5c19-5198-72f0-efc6a633b1b5@tronnes.org>
Date: Fri, 25 Nov 2022 18:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 6/8] drm/mipi-dbi: Support shadow-plane state
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-7-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121104532.8301-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 11.45, skrev Thomas Zimmermann:
> Introduce struct drm_mipi_dbi_plane_state that contains state related to
> MIPI DBI. It currently only inherits from struct drm_shadow_plane_state,
> so that MIPI DBI drivers can use the vmap'ed GEM-buffer memory. Implement
> state helpers, the {begin,end}_fb_access helpers and wire up everything.
> 
> With this commit, MIPI DBI drivers can access the GEM object's memory
> that is provided by shadow-plane state. The actual changes to drivers
> are implemented separately. The new struct drm_mipi_dbi_plane was added
> to avoid exposing struct drm_shadow_plane_state directly. The latter is
> a detail of the actual implementation and having it in the MIPI driver
> interface seems unintuitive.

I don't understand this reasoning. The update functions still uses
drm_shadow_plane_state in order to access ->data[0]. If you want to
avoid exposing it, can't you add an accessor function for ->data[0]
instead? That would actually be useful to me at least since when I first
read the shadow plane code I didn't understand what data really was
referring to. fb_map would have been more clear to me.

Noralf.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 113 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/ili9225.c |   5 ++
>  drivers/gpu/drm/tiny/st7586.c  |   5 ++
>  include/drm/drm_mipi_dbi.h     |  30 ++++++++-
>  4 files changed, 152 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 40e59a3a6481e..3030344d25b48 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -436,6 +436,119 @@ void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
>  }
>  EXPORT_SYMBOL(mipi_dbi_pipe_disable);
>  
> +/**
> + * mipi_dbi_pipe_begin_fb_access - MIPI DBI pipe begin-access helper
> + * @pipe: Display pipe
> + * @plane_state: Plane state
> + *
> + * This function implements struct &drm_simple_display_funcs.begin_fb_access.
> + *
> + * See drm_gem_begin_shadow_fb_access() for details and mipi_dbi_pipe_cleanup_fb()
> + * for cleanup.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int mipi_dbi_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
> +				  struct drm_plane_state *plane_state)
> +{
> +	return drm_gem_begin_shadow_fb_access(&pipe->plane, plane_state);
> +}
> +EXPORT_SYMBOL(mipi_dbi_pipe_begin_fb_access);
> +
> +/**
> + * mipi_dbi_pipe_end_fb_access - MIPI DBI pipe end-access helper
> + * @pipe: Display pipe
> + * @plane_state: Plane state
> + *
> + * This function implements struct &drm_simple_display_funcs.end_fb_access.
> + *
> + * See mipi_dbi_pipe_begin_fb_access().
> + */
> +void mipi_dbi_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
> +				 struct drm_plane_state *plane_state)
> +{
> +	drm_gem_end_shadow_fb_access(&pipe->plane, plane_state);
> +}
> +EXPORT_SYMBOL(mipi_dbi_pipe_end_fb_access);
> +
> +/**
> + * mipi_dbi_pipe_reset_plane - MIPI DBI plane-reset helper
> + * @pipe: Display pipe
> + *
> + * This function implements struct &drm_simple_display_funcs.reset_plane
> + * for MIPI DBI planes.
> + */
> +void mipi_dbi_pipe_reset_plane(struct drm_simple_display_pipe *pipe)
> +{
> +	struct drm_plane *plane = &pipe->plane;
> +	struct mipi_dbi_plane_state *mipi_dbi_plane_state;
> +
> +	if (plane->state) {
> +		mipi_dbi_pipe_destroy_plane_state(pipe, plane->state);
> +		plane->state = NULL; /* must be set to NULL here */
> +	}
> +
> +	mipi_dbi_plane_state = kzalloc(sizeof(*mipi_dbi_plane_state), GFP_KERNEL);
> +	if (!mipi_dbi_plane_state)
> +		return;
> +	__drm_gem_reset_shadow_plane(plane, &mipi_dbi_plane_state->shadow_plane_state);
> +}
> +EXPORT_SYMBOL(mipi_dbi_pipe_reset_plane);
> +
> +/**
> + * mipi_dbi_pipe_duplicate_plane_state - duplicates MIPI DBI plane state
> + * @pipe: Display pipe
> + *
> + * This function implements struct &drm_simple_display_funcs.duplicate_plane_state
> + * for MIPI DBI planes.
> + *
> + * See drm_gem_duplicate_shadow_plane_state() for additional details.
> + *
> + * Returns:
> + * A pointer to a new plane state on success, or NULL otherwise.
> + */
> +struct drm_plane_state *mipi_dbi_pipe_duplicate_plane_state(struct drm_simple_display_pipe *pipe)
> +{
> +	struct drm_plane *plane = &pipe->plane;
> +	struct drm_plane_state *plane_state = plane->state;
> +	struct mipi_dbi_plane_state *new_mipi_dbi_plane_state;
> +	struct drm_shadow_plane_state *new_shadow_plane_state;
> +
> +	if (!plane_state)
> +		return NULL;
> +
> +	new_mipi_dbi_plane_state = kzalloc(sizeof(*new_mipi_dbi_plane_state), GFP_KERNEL);
> +	if (!new_mipi_dbi_plane_state)
> +		return NULL;
> +	new_shadow_plane_state = &new_mipi_dbi_plane_state->shadow_plane_state;
> +
> +	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
> +
> +	return &new_shadow_plane_state->base;
> +}
> +EXPORT_SYMBOL(mipi_dbi_pipe_duplicate_plane_state);
> +
> +/**
> + * mipi_dbi_pipe_destroy_plane_state - cleans up MIPI DBI plane state
> + * @pipe: Display pipe
> + * @plane_state: Plane state
> + *
> + * This function implements struct drm_simple_display_funcs.destroy_plane_state
> + * for MIPI DBI planes.
> + *
> + * See drm_gem_destroy_shadow_plane_state() for additional details.
> + */
> +void mipi_dbi_pipe_destroy_plane_state(struct drm_simple_display_pipe *pipe,
> +				       struct drm_plane_state *plane_state)
> +{
> +	struct mipi_dbi_plane_state *mipi_dbi_plane_state = to_mipi_dbi_plane_state(plane_state);
> +
> +	__drm_gem_destroy_shadow_plane_state(&mipi_dbi_plane_state->shadow_plane_state);
> +	kfree(mipi_dbi_plane_state);
> +}
> +EXPORT_SYMBOL(mipi_dbi_pipe_destroy_plane_state);
> +
>  static int mipi_dbi_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
> index 0115c4090f9e7..9e55ce28b4552 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -349,6 +349,11 @@ static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
>  	.enable		= ili9225_pipe_enable,
>  	.disable	= ili9225_pipe_disable,
>  	.update		= ili9225_pipe_update,
> +	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
> +	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
> +	.reset_plane	= mipi_dbi_pipe_reset_plane,
> +	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
> +	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
>  };
>  
>  static const struct drm_display_mode ili9225_mode = {
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index e773b1f2fd5f3..76b13cefc904f 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -277,6 +277,11 @@ static const struct drm_simple_display_pipe_funcs st7586_pipe_funcs = {
>  	.enable		= st7586_pipe_enable,
>  	.disable	= st7586_pipe_disable,
>  	.update		= st7586_pipe_update,
> +	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
> +	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
> +	.reset_plane	= mipi_dbi_pipe_reset_plane,
> +	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
> +	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
>  };
>  
>  static const struct drm_display_mode st7586_mode = {
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index 36ac8495566b0..0213d4aae0326 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -10,6 +10,7 @@
>  
>  #include <linux/mutex.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
>  struct drm_rect;
> @@ -18,6 +19,19 @@ struct iosys_map;
>  struct regulator;
>  struct spi_device;
>  
> +/**
> + * struct mipi_dbi_plane_state - MIPI DBI plane state
> + */
> +struct mipi_dbi_plane_state {
> +	struct drm_shadow_plane_state shadow_plane_state;
> +};
> +
> +static inline struct mipi_dbi_plane_state *
> +to_mipi_dbi_plane_state(struct drm_plane_state *plane_state)
> +{
> +	return container_of(plane_state, struct mipi_dbi_plane_state, shadow_plane_state.base);
> +}
> +
>  /**
>   * struct mipi_dbi - MIPI DBI interface
>   */
> @@ -164,6 +178,15 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
>  			   struct drm_crtc_state *crtc_state,
>  			   struct drm_plane_state *plan_state);
>  void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe);
> +int mipi_dbi_pipe_begin_fb_access(struct drm_simple_display_pipe *pipe,
> +				  struct drm_plane_state *plane_state);
> +void mipi_dbi_pipe_end_fb_access(struct drm_simple_display_pipe *pipe,
> +				 struct drm_plane_state *plane_state);
> +void mipi_dbi_pipe_reset_plane(struct drm_simple_display_pipe *pipe);
> +struct drm_plane_state *mipi_dbi_pipe_duplicate_plane_state(struct drm_simple_display_pipe *pipe);
> +void mipi_dbi_pipe_destroy_plane_state(struct drm_simple_display_pipe *pipe,
> +				       struct drm_plane_state *plane_state);
> +
>  void mipi_dbi_hw_reset(struct mipi_dbi *dbi);
>  bool mipi_dbi_display_is_on(struct mipi_dbi *dbi);
>  int mipi_dbi_poweron_reset(struct mipi_dbi_dev *dbidev);
> @@ -223,6 +246,11 @@ static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
>  	.mode_valid = mipi_dbi_pipe_mode_valid, \
>  	.enable = (enable_), \
>  	.disable = mipi_dbi_pipe_disable, \
> -	.update = mipi_dbi_pipe_update
> +	.update = mipi_dbi_pipe_update, \
> +	.begin_fb_access = mipi_dbi_pipe_begin_fb_access, \
> +	.end_fb_access = mipi_dbi_pipe_end_fb_access, \
> +	.reset_plane = mipi_dbi_pipe_reset_plane, \
> +	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state, \
> +	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state
>  
>  #endif /* __LINUX_MIPI_DBI_H */
