Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87748426709
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538E26E0CD;
	Fri,  8 Oct 2021 09:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F1E6E0C4;
 Fri,  8 Oct 2021 09:40:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226761956"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="226761956"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:40:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="489396522"
Received: from ssedpiaz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.186])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:40:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211008091704.27094-1-nirmoy.das@amd.com>
Date: Fri, 08 Oct 2021 12:40:47 +0300
Message-ID: <87a6jjyhuo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 08 Oct 2021, Nirmoy Das <nirmoy.das@amd.com> wrote:
> Debugfs API returns encoded error instead of NULL.
> This patch cleanups drm debugfs error handling to
> properly set dri and its minor's root dentry to NULL.
>
> Also do not error out if dri/minor debugfs directory
> creation fails as a debugfs error is not a fatal error.

Cc: Greg

I thought this is the opposite of what Greg's been telling everyone to
do with debugfs.

BR,
Jani.

>
> CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> CC: Maxime Ripard <mripard@kernel.org>
> CC: Thomas Zimmermann <tzimmermann@suse.de>
> CC: David Airlie <airlied@linux.ie>
> CC: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++--
>  drivers/gpu/drm/drm_drv.c      | 16 ++++++++++------
>  drivers/gpu/drm/drm_internal.h |  7 +++----
>  3 files changed, 36 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index b0a826489488..af275a0c09b4 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -180,6 +180,9 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
>  	struct drm_info_node *tmp;
>  	int i;
>
> +	if (!minor->debugfs_root)
> +		return;
> +
>  	for (i = 0; i < count; i++) {
>  		u32 features = files[i].driver_features;
>
> @@ -203,7 +206,7 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
>  }
>  EXPORT_SYMBOL(drm_debugfs_create_files);
>
> -int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> +void drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root)
>  {
>  	struct drm_device *dev = minor->dev;
> @@ -212,8 +215,16 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  	INIT_LIST_HEAD(&minor->debugfs_list);
>  	mutex_init(&minor->debugfs_lock);
>  	sprintf(name, "%d", minor_id);
> +
> +	if (!root)
> +		goto error;
> +
>  	minor->debugfs_root = debugfs_create_dir(name, root);
>
> +	if (IS_ERR(minor->debugfs_root))
> +		goto error;
> +
> +
>  	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
>  				 minor->debugfs_root, minor);
>
> @@ -230,7 +241,11 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  	if (dev->driver->debugfs_init)
>  		dev->driver->debugfs_init(minor);
>
> -	return 0;
> +	return;
> +
> +error:
> +	minor->debugfs_root = NULL;
> +	return;
>  }
>
>
> @@ -241,6 +256,9 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>  	struct drm_info_node *tmp;
>  	int i;
>
> +	if (!minor->debugfs_root)
> +		return 0;
> +
>  	mutex_lock(&minor->debugfs_lock);
>  	for (i = 0; i < count; i++) {
>  		list_for_each_safe(pos, q, &minor->debugfs_list) {
> @@ -261,6 +279,9 @@ static void drm_debugfs_remove_all_files(struct drm_minor *minor)
>  {
>  	struct drm_info_node *node, *tmp;
>
> +	if (!minor->debugfs_root)
> +		return;
> +
>  	mutex_lock(&minor->debugfs_lock);
>  	list_for_each_entry_safe(node, tmp, &minor->debugfs_list, list) {
>  		debugfs_remove(node->dent);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7a5097467ba5..fa57ec2d49bf 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -160,11 +160,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
>  	if (!minor)
>  		return 0;
>
> -	ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
> -	if (ret) {
> -		DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> -		goto err_debugfs;
> -	}
> +	drm_debugfs_init(minor, minor->index, drm_debugfs_root);
>
>  	ret = device_add(minor->kdev);
>  	if (ret)
> @@ -1050,7 +1046,15 @@ static int __init drm_core_init(void)
>  		goto error;
>  	}
>
> -	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	if (!debugfs_initialized()) {
> +		drm_debugfs_root = NULL;
> +	} else {
> +		drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +		if (IS_ERR(drm_debugfs_root)) {
> +			DRM_WARN("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> +			drm_debugfs_root = NULL;
> +		}
> +	}
>
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 17f3548c8ed2..e27a40166178 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -182,8 +182,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
>
>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
> -int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> -		     struct dentry *root);
> +void drm_debugfs_init(struct drm_minor *minor, int minor_id,
> +		      struct dentry *root);
>  void drm_debugfs_cleanup(struct drm_minor *minor);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
>  void drm_debugfs_connector_remove(struct drm_connector *connector);
> @@ -191,10 +191,9 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
>  #else
> -static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> +static inline void drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  				   struct dentry *root)
>  {
> -	return 0;
>  }
>
>  static inline void drm_debugfs_cleanup(struct drm_minor *minor)
> --
> 2.32.0
>

-- 
Jani Nikula, Intel Open Source Graphics Center
