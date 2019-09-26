Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E37BEDC0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33576EE17;
	Thu, 26 Sep 2019 08:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F816EE54
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:47:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 8F10528B998
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/ioctl: Add a ioctl to label GEM objects
Date: Thu, 26 Sep 2019 10:47:35 +0200
Message-ID: <2300656.u1qCu661Xg@solembum>
Organization: Collabora Ltd.
In-Reply-To: <20190920152510.GB10973@ulmo>
References: <20190919125321.22880-1-rohan.garg@collabora.com>
 <20190920152510.GB10973@ulmo>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1176027682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1176027682==
Content-Type: multipart/signed; boundary="nextPart196192041.9XqM0aFo38"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart196192041.9XqM0aFo38
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On viernes, 20 de septiembre de 2019 17:25:10 (CEST) Thierry Reding wrote:
> On Thu, Sep 19, 2019 at 02:53:21PM +0200, Rohan Garg wrote:
> > DRM_IOCTL_BO_SET_LABEL lets you label GEM objects, making it
> > easier to debug issues in userspace applications.
> > 
> > Changes in v2:
> >   - Hoist the IOCTL up into the drm_driver framework
> > 
> > Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> > ---
> > 
> >  drivers/gpu/drm/drm_gem.c      | 64 ++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_internal.h |  4 +++
> >  drivers/gpu/drm/drm_ioctl.c    |  1 +
> >  include/drm/drm_drv.h          | 18 ++++++++++
> >  include/drm/drm_gem.h          |  7 ++++
> >  include/uapi/drm/drm.h         | 20 +++++++++++
> >  6 files changed, 114 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 6854f5867d51..785ac561619a 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -941,6 +941,65 @@ drm_gem_release(struct drm_device *dev, struct
> > drm_file *file_private)> 
> >  	idr_destroy(&file_private->object_idr);
> >  
> >  }
> > 
> > +int drm_bo_set_label_ioctl(struct drm_device *dev, void *data,
> > +		       struct drm_file *file_priv)
> 
> Perhaps call this drm_gem_set_label_ioctl() so that it's consistent with
> the other GEM related IOCTLs?
> 
> > +{
> > +	struct drm_label_object *args = data;
> 
> Similarly, perhaps make this struct drm_gem_set_label for consistency.
> 
> > +
> > +	if (!args->len || !args->name)
> > +		return -EINVAL;
> > +
> > +	if (dev->driver->label)
> > +		return dev->driver->label(dev, args, file_priv);
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +/**
> > + * drm_gem_label - label a given GEM object
> > + * @dev: drm_device for the associated GEM object
> > + * @data: drm_label_bo struct with a label, label length and any relevant
> > flags + * @file_private: drm file-private structure to clean up
> > + */
> > +
> > +int drm_gem_set_label(struct drm_device *dev, struct drm_label_object
> > *args, struct drm_file *file_priv)
> Function name doesn't match the kerneldoc.
> 
> > +{
> > +	struct drm_gem_object *gem_obj;
> > +	int err = 0;
> > +	char *label;
> > +
> > +	if (args->len > 0)
> > +		label = strndup_user(u64_to_user_ptr(args->name), args-
>len);
> > +
> > +	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
> > +	if (!gem_obj) {
> > +		DRM_ERROR("Failed to look up GEM BO %d\n", args-
>handle);
> 
> People could abuse this to spam the system logs with these error
> messages. Better make this DRM_DEBUG() or leave it out completely.
> 
> > +		err = -ENOENT;
> > +		goto err;
> 
> I think you're leaking the label string here.
> 
> > +	}
> > +
> > +	if ((args->len == 0 && args->name == NULL) || gem_obj->label) {
> > +		kfree(gem_obj->label);
> > +		gem_obj->label = NULL;
> > +	}
> > +
> > +	gem_obj->label = label;
> > +
> > +	drm_gem_object_put_unlocked(gem_obj);
> > +
> > +	if (IS_ERR(gem_obj->label)) {
> > +		err = PTR_ERR(gem_obj->label);
> > +		goto err;
> > +	}
> 
> Why don't you check for this earlier? That seems suboptimal because now
> you've got some error value in gem_obj->label that you're going to have
> to special case at every step of the way.
> 
> > +
> > +err:
> > +	if (err != 0)
> > +		args->flags = err;
> 
> Why the flags? We typically just return the error...
> 
> > +
> > +	return err;
> 
> ... like here.
> 
> > +}
> 
> Do we want to export this so that drivers can use it?
> 
> > +
> > +
> > 
> >  /**
> >  
> >   * drm_gem_object_release - release GEM buffer object resources
> >   * @obj: GEM buffer object
> > 
> > @@ -958,6 +1017,11 @@ drm_gem_object_release(struct drm_gem_object *obj)
> > 
> >  	dma_resv_fini(&obj->_resv);
> >  	drm_gem_free_mmap_offset(obj);
> > 
> > +
> > +	if (obj->label) {
> > +		kfree(obj->label);
> > +		obj->label = NULL;
> > +	}
> > 
> >  }
> >  EXPORT_SYMBOL(drm_gem_object_release);
> > 
> > diff --git a/drivers/gpu/drm/drm_internal.h
> > b/drivers/gpu/drm/drm_internal.h index 51a2055c8f18..8259622f9ab6 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -137,6 +137,10 @@ int drm_gem_pin(struct drm_gem_object *obj);
> > 
> >  void drm_gem_unpin(struct drm_gem_object *obj);
> >  void *drm_gem_vmap(struct drm_gem_object *obj);
> >  void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
> > 
> > +int drm_bo_set_label_ioctl(struct drm_device *dev, void *data,
> > +			struct drm_file *file_priv);
> > +int drm_gem_set_label(struct drm_device *dev, struct drm_label_object
> > *args, +			struct drm_file *file_priv);
> 
> This one seems to be unused now.
> 
> >  /* drm_debugfs.c drm_debugfs_crc.c */
> >  #if defined(CONFIG_DEBUG_FS)
> > 
> > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > index f675a3bb2c88..079d1422f9c5 100644
> > --- a/drivers/gpu/drm/drm_ioctl.c
> > +++ b/drivers/gpu/drm/drm_ioctl.c
> > @@ -709,6 +709,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
> > 
> >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, 
drm_mode_list_lessees_ioctl,
> >  	DRM_MASTER), DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE,
> >  	drm_mode_get_lease_ioctl, DRM_MASTER),
> >  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, 
drm_mode_revoke_lease_ioctl,
> >  	DRM_MASTER),> 
> > +	DRM_IOCTL_DEF(DRM_IOCTL_BO_SET_LABEL, drm_bo_set_label_ioctl,
> > DRM_RENDER_ALLOW),> 
> >  };
> >  
> >  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
> > 
> > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > index 8976afe48c1c..f736ba1f42a6 100644
> > --- a/include/drm/drm_drv.h
> > +++ b/include/drm/drm_drv.h
> > @@ -715,6 +715,24 @@ struct drm_driver {
> > 
> >  			    struct drm_device *dev,
> >  			    uint32_t handle);
> > 
> > +
> > +	/**
> > +	 * @label:
> > +	 *
> > +	 * This label's a buffer object.
> > +	 *
> > +	 * Called by the user via ioctl.
> > +	 *
> > +	 * The default implementation is drm_gem_label(). GEM based 
drivers
> > +	 * must not overwrite this.
> > +
> 
> Spurious blank line.
> 

Ack to all the above. I'll address these in v3!

> > +	 * Returns:
> > +	 *
> > +	 * Zero on success, negative errno on failure.
> > +	 */
> > +	int (*label)(struct drm_device *dev, struct drm_label_object 
*args,
> > +				struct drm_file *file_priv);
> 
> If I understand correctly, you use this so that non-GEM drivers can use
> this IOCTL to label their non-GEM objects. Do you think that's really
> useful? I mean they've already got quite a bit of special code to deal
> with their objects, so singling out this IOCTL seems a bit odd.
> 
> Then again, I guess it doesn't really hurt since GEM-based drivers will
> always use the standard implementation.
> 

Please refer to Thomas Zimmermann's reply earlier in this thread. This was 
also specifically requested as part of the v1 review of this patch.

> > +
> > 
> >  	/**
> >  	
> >  	 * @gem_vm_ops: Driver private ops for this object
> >  	 *
> > 
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 6aaba14f5972..f801c054e972 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -237,6 +237,13 @@ struct drm_gem_object {
> > 
> >  	 */
> >  	
> >  	int name;
> > 
> > +	/**
> > +	 * @label:
> > +	 *
> > +	 * Label for this object, should be a human readable string.
> > +	 */
> > +	char *label;
> > +
> > 
> >  	/**
> >  	
> >  	 * @dma_buf:
> >  	 *
> > 
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 8a5b2f8f8eb9..23b507f5c571 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -626,6 +626,25 @@ struct drm_gem_open {
> > 
> >  	__u64 size;
> >  
> >  };
> > 
> > +/** struct drm_label_object - ioctl argument for labelling BOs.
> > + *
> > + * This label's a BO with a userspace label
> > + *
> > + */
> > +struct drm_label_object {
> > +	/** Handle for the object being labelled. */
> > +	__u32 handle;
> > +
> > +	/** Label and label length.
> > +	 *  length includes the trailing NULL.
> 
> Nit: I think you mean "trailing NUL". Also, the parameter is called len
> below, so the comment here should match.
> 

Ack.

Thanks for the review!

Cheers
Rohan Garg
--nextPart196192041.9XqM0aFo38
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl2MeycACgkQpwS9TvJn
IJShyQ/8DfcHJrtOz3vqQ9td+lXeMcA7frSnYzUk0XxpherZ4DYOqQK8R4T8xZHo
lNt3Jivo4NEtNuN05nlPmvqb5ECMwRw5gm4Ya7kH4t/EF/+BeV7PKzLt8gPrCcR2
oC5B8bdszk/gsvwX2cSKujTx9R0UY/lg3We3lpUDdJJJRa5p+7iGPISPPivwVVHQ
NL7GQeBRUYz8A9vkWsfeQBP8oq5C+EttCrmi00QrIIMZAWhxj6rI73PMn6DU7F0b
3GDOv3KMWEc8cXa8QJP0USLPAI0787ffKt53iaNbvY3GSauzD8uFetO2Ep5Ue7x3
KQponyOV6LLj9gzujZ48GqQS7mCGQ9E6SrQlIdXdko02acmK9sYsH8MReEEOG6wl
CswgYl+vmGQC7/oT82tQIY2bcwfnA0MRvJ9UF8NcQgosEUPaDSrhh/4nASz6IWsK
NI2OfyyxNNxcf/5Brqsw46r+5XkO4juIWIfVOTejarTCOE1Jh8lRShLf+mYL+BL3
NNZx8b33TFEOAzAyFmObBBeRa9SgcAuLIMEpHRGrDFQCeFa4O1JZdmIphKVZpTu1
4rYDJb8gtv3kM8jU8KMFKPsyhOevz+skWW7ihK10381hFYnjycZzhaBd8ar+itLT
LFRTe7mmyxLXoA0Duzmyc6ZfsD+zEooSXR/tY3iS3ATYBkbUAH4=
=SU5X
-----END PGP SIGNATURE-----

--nextPart196192041.9XqM0aFo38--




--===============1176027682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1176027682==--



