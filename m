Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A133C3F8878
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1B36E846;
	Thu, 26 Aug 2021 13:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E096E846
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 13:13:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a25so6176644ejv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=tZzwxUjfLrzYOqglDKb4EAa5fo9Lw2+YYSIeMkYsRHU=;
 b=aD1D0sblC8GDlYWlPmTdjwvxbdaI4IKKptwL2QEt8dnz4MwgJp96CVA1mAnZbN8Wfz
 styAhOR/G/t7lbpDwup4omSOOvIXw8ctUTlDaNuRl3igUcGuyYU1uetg3ENZXwpotpKJ
 qQlsmi8dPs5PnyaN4NUNAeLxRLmGycXJCeVEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=tZzwxUjfLrzYOqglDKb4EAa5fo9Lw2+YYSIeMkYsRHU=;
 b=WXuhpeuaacifEkYMX8rZV7UiOjssC51pya2lEi6l9THYlyLMRNsv/TcjYE4tSagBWc
 WKWP57Dw9r7Nzo6X0tFtzWPA6l8Zt6Vwu0u+XGSI5BFII5wOlQBBU3XqXh8JyTgQFJpY
 CUlnnwzjKntZmbg5yLAGsgt5xt8Qf9euX+y2KPpIfxtfmU7KW7LiUWwmQZ6d7BSYmyz2
 fCmrtxvFgt/ING6DvkSSXrQlE7oT/wje7AKz495L1Bo+Qin9FTewv8vJocqiVVbGWdsV
 n2puiFvMpgl2ydQb4B9a9gdaIdszg3LMoYHMjUMfE2CqDWogku+I+2tIKSdCCt/cGi+o
 xasA==
X-Gm-Message-State: AOAM531zQjcg/SeVjYMKRCqSfHr8QKsOUBHEyL5g5/imjsgGBrznuqq6
 7dKtkMe2utfP+gTavLwQTqzD7Q==
X-Google-Smtp-Source: ABdhPJyMe3rLVFL8ZexeHBZEZ07VSLIkwCSi8yqt5r+0iTQgrtGq7KqsyhsfJ9EFF0jBdluJJ2Jutw==
X-Received: by 2002:a17:906:93ef:: with SMTP id
 yl15mr4304714ejb.229.1629983608324; 
 Thu, 26 Aug 2021 06:13:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v10sm1816556edt.25.2021.08.26.06.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:13:27 -0700 (PDT)
Date: Thu, 26 Aug 2021 15:13:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com, matthew.auld@intel.com,
 dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 karthik.b.s@intel.com, jose.souza@intel.com,
 manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v8 5/7] drm: avoid circular locks in drm_mode_object_find
Message-ID: <YSeTdLmr7mshx4at@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com,
 tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-6-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826020122.1488002-6-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 26, 2021 at 10:01:20AM +0800, Desmond Cheong Zhi Xi wrote:
> __drm_mode_object_find checks if the given drm file holds the required
> lease on a object by calling _drm_lease_held. _drm_lease_held in turn
> uses drm_file_get_master to access drm_file.master.
> 
> However, in a future patch, the drm_file.master_lookup_lock in
> drm_file_get_master will be replaced by drm_device.master_rwsem. This
> is an issue for two reasons:
> 
> 1. master_rwsem is sometimes already held when __drm_mode_object_find
> is called, which leads to recursive locks on master_rwsem
> 
> 2. drm_mode_object_find is sometimes called with the modeset_mutex
> held, which leads to an inversion of the master_rwsem -->
> modeset_mutex lock hierarchy
> 
> To fix this, we make __drm_mode_object_find the locked version of
> drm_mode_object_find, and wrap calls to __drm_mode_object_find with
> locks on master_rwsem. This allows us to safely access drm_file.master
> in _drm_lease_held (__drm_mode_object_find is its only caller) without
> the use of drm_file_get_master.
> 
> Functions that already lock master_rwsem are modified to call
> __drm_mode_object_find, whereas functions that haven't locked
> master_rwsem should call drm_mode_object_find. These two options
> allow us to grab master_rwsem before modeset_mutex (such as in
> drm_mode_get_obj_get_properties_ioctl).
> 
> This new rule requires more extensive changes to three functions:
> drn_connector_lookup, drm_crtc_find, and drm_plane_find. These
> functions are only sometimes called with master_rwsem held. Hence, we
> have to further split them into locked and unlocked versions that call
> __drm_mode_object_find and drm_mode_object_find respectively.

I think approach looks good, but the naming isn't so great. Usually __
prefix means "do not call directly, this is only exported for static
inline and other helpers". For these the usual rule is to add a _locked or
_unlocked suffix. I'd leave the normal _find functions as-is (since those
take the lock) themselves, and annotate the _locked ones.

Also same for the other lookup helpers.

> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c            |  7 ++---
>  drivers/gpu/drm/drm_color_mgmt.c             |  2 +-
>  drivers/gpu/drm/drm_crtc.c                   |  5 ++--
>  drivers/gpu/drm/drm_framebuffer.c            |  2 +-
>  drivers/gpu/drm/drm_lease.c                  | 21 +++++----------
>  drivers/gpu/drm/drm_mode_object.c            | 28 +++++++++++++++++---
>  drivers/gpu/drm/drm_plane.c                  |  8 +++---
>  drivers/gpu/drm/drm_property.c               |  6 ++---
>  drivers/gpu/drm/i915/display/intel_overlay.c |  2 +-
>  drivers/gpu/drm/i915/display/intel_sprite.c  |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c          |  2 +-
>  include/drm/drm_connector.h                  | 23 ++++++++++++++++
>  include/drm/drm_crtc.h                       | 22 +++++++++++++++
>  include/drm/drm_mode_object.h                |  3 +++
>  include/drm/drm_plane.h                      | 20 ++++++++++++++
>  15 files changed, 118 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 909f31833181..cda9a501cf74 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -557,7 +557,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  			return -EINVAL;
>  
>  	} else if (property == config->prop_crtc_id) {
> -		struct drm_crtc *crtc = drm_crtc_find(dev, file_priv, val);
> +		struct drm_crtc *crtc = __drm_crtc_find(dev, file_priv, val);
>  
>  		if (val && !crtc)
>  			return -EACCES;
> @@ -709,7 +709,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  	int ret;
>  
>  	if (property == config->prop_crtc_id) {
> -		struct drm_crtc *crtc = drm_crtc_find(dev, file_priv, val);
> +		struct drm_crtc *crtc = __drm_crtc_find(dev, file_priv, val);
>  
>  		if (val && !crtc)
>  			return -EACCES;
> @@ -1385,7 +1385,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  			goto out;
>  		}
>  
> -		obj = drm_mode_object_find(dev, file_priv, obj_id, DRM_MODE_OBJECT_ANY);
> +		obj = __drm_mode_object_find(dev, file_priv, obj_id,
> +					     DRM_MODE_OBJECT_ANY);
>  		if (!obj) {
>  			ret = -ENOENT;
>  			goto out;
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index bb14f488c8f6..9dcb2ccca3ab 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -365,7 +365,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	crtc = drm_crtc_find(dev, file_priv, crtc_lut->crtc_id);
> +	crtc = __drm_crtc_find(dev, file_priv, crtc_lut->crtc_id);
>  	if (!crtc)
>  		return -ENOENT;
>  
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 26a77a735905..b1279bb3fa61 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -656,7 +656,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  	if (crtc_req->x & 0xffff0000 || crtc_req->y & 0xffff0000)
>  		return -ERANGE;
>  
> -	crtc = drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
> +	crtc = __drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
>  	if (!crtc) {
>  		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", crtc_req->crtc_id);
>  		return -ENOENT;
> @@ -787,7 +787,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  				goto out;
>  			}
>  
> -			connector = drm_connector_lookup(dev, file_priv, out_id);
> +			connector = __drm_connector_lookup(dev, file_priv,
> +							   out_id);
>  			if (!connector) {
>  				DRM_DEBUG_KMS("Connector id %d unknown\n",
>  						out_id);
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 07f5abc875e9..9c1db91b150d 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -887,7 +887,7 @@ struct drm_framebuffer *drm_framebuffer_lookup(struct drm_device *dev,
>  	struct drm_mode_object *obj;
>  	struct drm_framebuffer *fb = NULL;
>  
> -	obj = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);
> +	obj = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);

I expect this to go boom, also for property and blob objects. These lookup
functions can be called from the atomic_ioctl machinery, where we're
already holding all kinds of locks. So grabbing the master_rwsem is not a
good idea.

We should always use the the drm_mode_object_find_unlocked for anything
object which is not in the list of drm_mode_object_lease_required().

>  	if (obj)
>  		fb = obj_to_fb(obj);
>  	return fb;
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index bed6f7636cbe..1b156c85d1c8 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -105,22 +105,13 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>  	return false;
>  }
>  
> -/* Called with idr_mutex held */
> +/* Called with idr_mutex and master_rwsem held */

Please verify this with lockdep_assert_held.

The reason is that our locking gets rather funny here, because only for
some types of objects do we need to check master status.
drm_mode_object_lease_required() decides that.

>  bool _drm_lease_held(struct drm_file *file_priv, int id)
>  {
> -	bool ret;
> -	struct drm_master *master;
> -
> -	if (!file_priv)
> +	if (!file_priv || !file_priv->master)
>  		return true;
>  
> -	master = drm_file_get_master(file_priv);
> -	if (!master)
> -		return true;
> -	ret = _drm_lease_held_master(master, id);
> -	drm_master_put(&master);
> -
> -	return ret;
> +	return _drm_lease_held_master(file_priv->master, id);
>  }
>  
>  bool drm_lease_held(struct drm_file *file_priv, int id)
> @@ -391,9 +382,9 @@ static int fill_object_idr(struct drm_device *dev,
>  	/* step one - get references to all the mode objects
>  	   and check for validity. */
>  	for (o = 0; o < object_count; o++) {
> -		objects[o] = drm_mode_object_find(dev, lessor_priv,
> -						  object_ids[o],
> -						  DRM_MODE_OBJECT_ANY);
> +		objects[o] = __drm_mode_object_find(dev, lessor_priv,
> +						    object_ids[o],
> +						    DRM_MODE_OBJECT_ANY);
>  		if (!objects[o]) {
>  			ret = -ENOENT;
>  			goto out_free_objects;
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index 86d9e907c0b2..90c23997aa53 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -133,12 +133,27 @@ bool drm_mode_object_lease_required(uint32_t type)
>  	}
>  }
>  
> +/**
> + * __drm_mode_object_find - look up a drm object with static lifetime
> + * @dev: drm device
> + * @file_priv: drm file
> + * @id: id of the mode object
> + * @type: type of the mode object
> + *
> + * This function is used to look up a modeset object. It will acquire a
> + * reference for reference counted objects. This reference must be dropped
> + * again by calling drm_mode_object_put().
> + *
> + * Similar to drm_mode_object_find(), but called with &drm_device.master_rwsem
> + * held.
> + */
>  struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
>  					       struct drm_file *file_priv,
> -					       uint32_t id, uint32_t type)
> +					       u32 id, u32 type)
>  {
>  	struct drm_mode_object *obj = NULL;
>  
> +	lockdep_assert_held_once(&dev->master_rwsem);
>  	mutex_lock(&dev->mode_config.idr_mutex);
>  	obj = idr_find(&dev->mode_config.object_idr, id);
>  	if (obj && type != DRM_MODE_OBJECT_ANY && obj->type != type)
> @@ -158,6 +173,7 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
>  
>  	return obj;
>  }
> +EXPORT_SYMBOL(__drm_mode_object_find);
>  
>  /**
>   * drm_mode_object_find - look up a drm object with static lifetime
> @@ -176,7 +192,9 @@ struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
>  {
>  	struct drm_mode_object *obj = NULL;
>  
> +	down_read(&dev->master_rwsem);
>  	obj = __drm_mode_object_find(dev, file_priv, id, type);
> +	up_read(&dev->master_rwsem);
>  	return obj;
>  }
>  EXPORT_SYMBOL(drm_mode_object_find);
> @@ -408,9 +426,12 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> +	down_read(&dev->master_rwsem);
>  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
> -	obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
> +	obj = __drm_mode_object_find(dev, file_priv, arg->obj_id,
> +				     arg->obj_type);
> +	up_read(&dev->master_rwsem);
>  	if (!obj) {
>  		ret = -ENOENT;
>  		goto out;
> @@ -534,7 +555,8 @@ int drm_mode_obj_set_property_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	arg_obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
> +	arg_obj = __drm_mode_object_find(dev, file_priv, arg->obj_id,
> +					 arg->obj_type);
>  	if (!arg_obj)
>  		return -ENOENT;
>  
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 82afb854141b..b5566167a798 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -971,7 +971,7 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
>  	 * First, find the plane, crtc, and fb objects.  If not available,
>  	 * we don't bother to call the driver.
>  	 */
> -	plane = drm_plane_find(dev, file_priv, plane_req->plane_id);
> +	plane = __drm_plane_find(dev, file_priv, plane_req->plane_id);
>  	if (!plane) {
>  		DRM_DEBUG_KMS("Unknown plane ID %d\n",
>  			      plane_req->plane_id);
> @@ -986,7 +986,7 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
>  			return -ENOENT;
>  		}
>  
> -		crtc = drm_crtc_find(dev, file_priv, plane_req->crtc_id);
> +		crtc = __drm_crtc_find(dev, file_priv, plane_req->crtc_id);
>  		if (!crtc) {
>  			drm_framebuffer_put(fb);
>  			DRM_DEBUG_KMS("Unknown crtc ID %d\n",
> @@ -1108,7 +1108,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
>  	if (!req->flags || (~DRM_MODE_CURSOR_FLAGS & req->flags))
>  		return -EINVAL;
>  
> -	crtc = drm_crtc_find(dev, file_priv, req->crtc_id);
> +	crtc = __drm_crtc_find(dev, file_priv, req->crtc_id);
>  	if (!crtc) {
>  		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", req->crtc_id);
>  		return -ENOENT;
> @@ -1229,7 +1229,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  	if ((page_flip->flags & DRM_MODE_PAGE_FLIP_ASYNC) && !dev->mode_config.async_page_flip)
>  		return -EINVAL;
>  
> -	crtc = drm_crtc_find(dev, file_priv, page_flip->crtc_id);
> +	crtc = __drm_crtc_find(dev, file_priv, page_flip->crtc_id);
>  	if (!crtc)
>  		return -ENOENT;
>  
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index 6c353c9dc772..9f04dcb81d07 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -656,7 +656,7 @@ struct drm_property_blob *drm_property_lookup_blob(struct drm_device *dev,
>  	struct drm_mode_object *obj;
>  	struct drm_property_blob *blob = NULL;
>  
> -	obj = __drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
> +	obj = drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
>  	if (obj)
>  		blob = obj_to_blob(obj);
>  	return blob;
> @@ -919,8 +919,8 @@ bool drm_property_change_valid_get(struct drm_property *property,
>  		if (value == 0)
>  			return true;
>  
> -		*ref = __drm_mode_object_find(property->dev, NULL, value,
> -					      property->values[0]);
> +		*ref = drm_mode_object_find(property->dev, NULL, value,
> +					    property->values[0]);
>  		return *ref != NULL;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index 7e3f5c6ca484..1d4af29e31c9 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -1120,7 +1120,7 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
>  		return ret;
>  	}
>  
> -	drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
> +	drmmode_crtc = __drm_crtc_find(dev, file_priv, params->crtc_id);
>  	if (!drmmode_crtc)
>  		return -ENOENT;
>  	crtc = to_intel_crtc(drmmode_crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index 4ae9a7455b23..e19ef2d90bac 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -1505,7 +1505,7 @@ int intel_sprite_set_colorkey_ioctl(struct drm_device *dev, void *data,
>  	    set->flags & I915_SET_COLORKEY_DESTINATION)
>  		return -EINVAL;
>  
> -	plane = drm_plane_find(dev, file_priv, set->plane_id);
> +	plane = __drm_plane_find(dev, file_priv, set->plane_id);
>  	if (!plane || plane->type != DRM_PLANE_TYPE_OVERLAY)
>  		return -ENOENT;
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 74fa41909213..d368b2bcb1fa 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1862,7 +1862,7 @@ int vmw_kms_cursor_bypass_ioctl(struct drm_device *dev, void *data,
>  		return 0;
>  	}
>  
> -	crtc = drm_crtc_find(dev, file_priv, arg->crtc_id);
> +	crtc = __drm_crtc_find(dev, file_priv, arg->crtc_id);
>  	if (!crtc) {
>  		ret = -ENOENT;
>  		goto out;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1647960c9e50..322c823583c7 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1591,6 +1591,29 @@ static inline u32 drm_connector_mask(const struct drm_connector *connector)
>  	return 1 << connector->index;
>  }
>  
> +/**
> + * __drm_connector_lookup - lookup connector object
> + * @dev: DRM device
> + * @file_priv: drm file to check for lease against.
> + * @id: connector object id
> + *
> + * This function looks up the connector object specified by id
> + * add takes a reference to it.
> + *
> + * Similar to drm_connector_lookup(), but called with &drm_device.master_rwsem
> + * held.
> + */
> +static inline struct drm_connector *__drm_connector_lookup(struct drm_device *dev,
> +							   struct drm_file *file_priv,
> +							   uint32_t id)
> +{
> +	struct drm_mode_object *mo;
> +
> +	mo = __drm_mode_object_find(dev, file_priv, id,
> +				    DRM_MODE_OBJECT_CONNECTOR);
> +	return mo ? obj_to_connector(mo) : NULL;
> +}
> +
>  /**
>   * drm_connector_lookup - lookup connector object
>   * @dev: DRM device
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 13eeba2a750a..69df854dd322 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1283,6 +1283,28 @@ static inline uint32_t drm_crtc_mask(const struct drm_crtc *crtc)
>  int drm_mode_set_config_internal(struct drm_mode_set *set);
>  struct drm_crtc *drm_crtc_from_index(struct drm_device *dev, int idx);
>  
> +/**
> + * __drm_crtc_find - look up a CRTC object from its ID
> + * @dev: DRM device
> + * @file_priv: drm file to check for lease against.
> + * @id: &drm_mode_object ID
> + *
> + * This can be used to look up a CRTC from its userspace ID. Only used by
> + * drivers for legacy IOCTLs and interface, nowadays extensions to the KMS
> + * userspace interface should be done using &drm_property.
> + *
> + * Similar to drm_crtc_find(), but called with &drm_device.master_rwsem held.
> + */
> +static inline struct drm_crtc *__drm_crtc_find(struct drm_device *dev,
> +					       struct drm_file *file_priv,
> +					       uint32_t id)
> +{
> +	struct drm_mode_object *mo;
> +
> +	mo = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_CRTC);
> +	return mo ? obj_to_crtc(mo) : NULL;
> +}
> +
>  /**
>   * drm_crtc_find - look up a CRTC object from its ID
>   * @dev: DRM device
> diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
> index c34a3e8030e1..1906af9cae9b 100644
> --- a/include/drm/drm_mode_object.h
> +++ b/include/drm/drm_mode_object.h
> @@ -114,6 +114,9 @@ struct drm_object_properties {
>  		return "(unknown)";				\
>  	}
>  
> +struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
> +					       struct drm_file *file_priv,
> +					       u32 id, u32 type);
>  struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
>  					     struct drm_file *file_priv,
>  					     uint32_t id, uint32_t type);
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index fed97e35626f..49e35d3724c9 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -842,6 +842,26 @@ int drm_mode_plane_set_obj_prop(struct drm_plane *plane,
>  				       struct drm_property *property,
>  				       uint64_t value);
>  
> +/**
> + * __drm_plane_find - find a &drm_plane
> + * @dev: DRM device
> + * @file_priv: drm file to check for lease against.
> + * @id: plane id
> + *
> + * Returns the plane with @id, NULL if it doesn't exist.
> + *
> + * Similar to drm_plane_find(), but called with &drm_device.master_rwsem held.
> + */
> +static inline struct drm_plane *__drm_plane_find(struct drm_device *dev,
> +						 struct drm_file *file_priv,
> +						 uint32_t id)
> +{
> +	struct drm_mode_object *mo;
> +
> +	mo = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_PLANE);
> +	return mo ? obj_to_plane(mo) : NULL;
> +}
> +
>  /**
>   * drm_plane_find - find a &drm_plane
>   * @dev: DRM device

Aside from the one area for mode objects that cannoted be leased I think
this looks correct.

Sinc the spinlock+rwsem unification is a bit tricky, maybe you want to
split out the patch series so that we can land the initial patches
already?
-Daniel

> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
