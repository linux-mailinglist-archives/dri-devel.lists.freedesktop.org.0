Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A696641744
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 15:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722810E0D2;
	Sat,  3 Dec 2022 14:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4310E0D2
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m4XXX74otc6JGzkTgR2BS7qwSV/8ukkgsWu5x3oojS4=; b=G7Tza+GQOAVMyIOIrtxug1Oc76
 2zJ2Z/5LJ5GlPUoXY5KuMOg/v6rNH84wzu1kohZc6IpLKoK0TFYvpoQMBQYIN/9yF64qqzX1mGLuW
 v7WTUF/UNXPtjy3se5i63sgFXmEAR4aQsnK5hWVWkwNfTGvRxa20yTHqNSywq8l+wiI6VlkgPqAHq
 L3TRb6FFZI3xy5xcDyqbR34fo6P0xflAqG0ZjIeNYVnE5GxAI2h7IMOgMOIn+bhLvOLzNB+nX+V/4
 FzkJ/AQF4Ke/TiNHGtP357q86MxbHzcRRYvcyuIYEz+nMabDvkXp/g7QZVnftVWiHXe/DBKCpHEbM
 ZPLO8OHA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=49553)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p1TQP-0000bA-2O; Sat, 03 Dec 2022 15:23:29 +0100
Message-ID: <6ebeabc4-1b3b-bc1e-6f7c-f4a5c1bb6b14@tronnes.org>
Date: Sat, 3 Dec 2022 15:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 6/8] drm/mipi-dbi: Support shadow-plane state
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221202125644.7917-1-tzimmermann@suse.de>
 <20221202125644.7917-7-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221202125644.7917-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.12.2022 13.56, skrev Thomas Zimmermann:
> Implement MIPI DBI planes with struct drm_shadow_plane_state, so that the
> respective drivers can use the vmap'ed GEM-buffer memory. Implement state
> helpers, the {begin,end}_fb_access helpers and wire up everything.
> 
> With this commit, MIPI DBI drivers can access the GEM object's memory
> that is provided by shadow-plane state. The actual changes to drivers
> are implemented separately.
> 
> v2:
> 	* use shadow-plane state directly (Noralf)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Javier Martinez Canillas <javierm@redhat.com>
> Tested-by: Noralf Trønnes <noralf@tronnes.org> # drm/tiny/mi0283qt
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 85 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/ili9225.c |  5 ++
>  drivers/gpu/drm/tiny/st7586.c  |  5 ++
>  include/drm/drm_mipi_dbi.h     | 16 ++++++-
>  4 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index f58123327ed6..b808de61c5bc 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_modes.h>
> @@ -433,6 +434,90 @@ void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
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
> +	drm_gem_reset_shadow_plane(&pipe->plane);
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
> +	return drm_gem_duplicate_shadow_plane_state(&pipe->plane);
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
> +	drm_gem_destroy_shadow_plane_state(&pipe->plane, plane_state);
> +}
> +EXPORT_SYMBOL(mipi_dbi_pipe_destroy_plane_state);
> +
>  static int mipi_dbi_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
> index ae94c74d0163..a69aec8402bc 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -343,6 +343,11 @@ static const struct drm_simple_display_pipe_funcs ili9225_pipe_funcs = {
>  	.enable		= ili9225_pipe_enable,
>  	.disable	= ili9225_pipe_disable,
>  	.update		= ili9225_pipe_update,
> +	.begin_fb_access = mipi_dbi_pipe_begin_fb_access,
> +	.end_fb_access	= mipi_dbi_pipe_end_fb_access,
> +	.reset_plane	= mipi_dbi_pipe_reset_plane,
> +	.duplicate_plane_state = mipi_dbi_pipe_duplicate_plane_state,
> +	.destroy_plane_state = mipi_dbi_pipe_destroy_plane_state,
>  };

Why not just use DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS?

Noralf.

>  
>  static const struct drm_display_mode ili9225_mode = {
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index e773b1f2fd5f..76b13cefc904 100644
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
> index 36ac8495566b..304fbecdc66a 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -164,6 +164,15 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
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
> @@ -223,6 +232,11 @@ static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
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
