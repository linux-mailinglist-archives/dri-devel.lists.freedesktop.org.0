Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94AB186770
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 10:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA7A6E37F;
	Mon, 16 Mar 2020 09:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E02A6E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 09:07:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w16so3704854wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4ZxBACl3ZGgKq89fC7DT3taz/WKRaUEaM3S2x10r9MI=;
 b=RGO6QJ1SH9zDQ/UfY+2z8rtQop7pTgLGOgDfZmpW/YdeCsJ1XYLvYVkv+XnTetxSa7
 6Pv+4JXd4DNbygIvxICbFunUG4oCtL55PrfZtK4LFHN3IDhzF8gd0ov4t42hc0vydd62
 BewwfmcvhjA3i257uQoF4QKRkEo4n58qHJ7yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4ZxBACl3ZGgKq89fC7DT3taz/WKRaUEaM3S2x10r9MI=;
 b=e/8pWtN2Pgb7SJ2V15Uxza1/jU+KZsKNRz3Uj0LPsE4rKLysVO5gbYWUwVa79FE4ow
 /l2fnILdpebuJdUJ1Rz90g2ZxRK32+I6qYpPnLz4UCerL79ENGVvV/CF/IoQiBtrHrSX
 WeDKuZf8hfUDNRMiWc205+3dvaa/5eXtgyLtwnAIYntP95rVEz/mkpcq5ODSnr24Nrf5
 C4IvDOr+zVlnmkjUfuFvNejLrGwiqZBXXAiEZfVszTPcLfNtlmVDPYxQG2N0UgEB72J3
 JAkIUX0LDFWdhzgF0M6v4fgvflGkkMwZHgc5FwG21Zos18ZDUmvD4D7G/JOeWZQmcL/z
 kovg==
X-Gm-Message-State: ANhLgQ3Zk/N83e08v5VobN3o7ybpI4k9LkugAPoFCN42k/EIpGO7TD1a
 tYviYvHGbkxFKSCfGZtyJRwVPA==
X-Google-Smtp-Source: ADFU+vvCaHCEJmuSDkUZukKgRkq/z/jN/RBuyWmfRXrlDzpa244WHEJK8ptfgzWDmAA7XwO6AUT4sA==
X-Received: by 2002:adf:ba48:: with SMTP id t8mr34820611wrg.329.1584349654745; 
 Mon, 16 Mar 2020 02:07:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a199sm20057508wme.29.2020.03.16.02.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 02:07:34 -0700 (PDT)
Date: Mon, 16 Mar 2020 10:07:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 22/51] drm: manage drm_minor cleanup with drmm_
Message-ID: <20200316090732.GH2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-23-daniel.vetter@ffwll.ch>
 <aa1dad07-9697-dea2-2b07-46f5ca7c0b9d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa1dad07-9697-dea2-2b07-46f5ca7c0b9d@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 10:59:10AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 02.03.20 um 23:26 schrieb Daniel Vetter:
> > The cleanup here is somewhat tricky, since we can't tell apart the
> > allocated minor index from 0. So register a cleanup action first, and
> > if the index allocation fails, unregister that cleanup action again to
> > avoid bad mistakes.
> > =

> > The kdev for the minor already handles NULL, so no problem there.
> > =

> > Hence add drmm_remove_action() to the drm_managed library.
> > =

> > v2: Make pointer math around void ** consistent with what Laurent
> > suggested.
> > =

> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c     | 74 +++++++++++++----------------------
> >  drivers/gpu/drm/drm_managed.c | 28 +++++++++++++
> >  include/drm/drm_managed.h     |  4 ++
> >  3 files changed, 59 insertions(+), 47 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 23e5b0e7e041..29d106195ab3 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -93,19 +93,35 @@ static struct drm_minor **drm_minor_get_slot(struct=
 drm_device *dev,
> >  	}
> >  }
> >  =

> > +static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> > +{
> > +	struct drm_minor *minor =3D data;
> > +	unsigned long flags;
> > +
> > +	put_device(minor->kdev);
> > +
> > +	spin_lock_irqsave(&drm_minor_lock, flags);
> > +	idr_remove(&drm_minors_idr, minor->index);
> > +	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +}
> > +
> >  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >  {
> >  	struct drm_minor *minor;
> >  	unsigned long flags;
> >  	int r;
> >  =

> > -	minor =3D kzalloc(sizeof(*minor), GFP_KERNEL);
> > +	minor =3D drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
> >  	if (!minor)
> >  		return -ENOMEM;
> >  =

> >  	minor->type =3D type;
> >  	minor->dev =3D dev;
> >  =

> > +	r =3D drmm_add_action(dev, drm_minor_alloc_release, minor);
> > +	if (r)
> > +		return r;
> > +
> >  	idr_preload(GFP_KERNEL);
> >  	spin_lock_irqsave(&drm_minor_lock, flags);
> >  	r =3D idr_alloc(&drm_minors_idr,
> > @@ -116,47 +132,18 @@ static int drm_minor_alloc(struct drm_device *dev=
, unsigned int type)
> >  	spin_unlock_irqrestore(&drm_minor_lock, flags);
> >  	idr_preload_end();
> >  =

> > -	if (r < 0)
> > -		goto err_free;
> > +	if (r < 0) {
> > +		drmm_remove_action(dev, drm_minor_alloc_release, minor);
> > +		return r;
> > +	}
> >  =

> >  	minor->index =3D r;
> > -
> >  	minor->kdev =3D drm_sysfs_minor_alloc(minor);
> > -	if (IS_ERR(minor->kdev)) {
> > -		r =3D PTR_ERR(minor->kdev);
> > -		goto err_index;
> > -	}
> > +	if (IS_ERR(minor->kdev))
> > +		return PTR_ERR(minor->kdev);
> >  =

> >  	*drm_minor_get_slot(dev, type) =3D minor;
> >  	return 0;
> > -
> > -err_index:
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	idr_remove(&drm_minors_idr, minor->index);
> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > -err_free:
> > -	kfree(minor);
> > -	return r;
> > -}
> =

> TBH, I think you're reducing code quality by removing the rollback code
> from init functions, just for the sake of it.
> =

> Specifically in this case here, you saved a few lines of code, but the
> overall flow is way more complicated to follow. That's typically a
> reliably source of bugs. This call to drmm_remove_action() just makes it
> worse.
> =

> Rather, see my remark on OOP destruction in patch 21. For now, I'd focus
> on the device cleanup and leave init functions as they are.

Ah, I can simplify this with add_action_or_reset. This removes the only
user of drmm_remove_action, which I think is actually a good thing :-)
-Daniel

> =

> Best regards
> Thomas
> =

> > -
> > -static void drm_minor_free(struct drm_device *dev, unsigned int type)
> > -{
> > -	struct drm_minor **slot, *minor;
> > -	unsigned long flags;
> > -
> > -	slot =3D drm_minor_get_slot(dev, type);
> > -	minor =3D *slot;
> > -	if (!minor)
> > -		return;
> > -
> > -	put_device(minor->kdev);
> > -
> > -	spin_lock_irqsave(&drm_minor_lock, flags);
> > -	idr_remove(&drm_minors_idr, minor->index);
> > -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> > -
> > -	kfree(minor);
> > -	*slot =3D NULL;
> >  }
> >  =

> >  static int drm_minor_register(struct drm_device *dev, unsigned int typ=
e)
> > @@ -678,16 +665,16 @@ int drm_dev_init(struct drm_device *dev,
> >  	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> >  		ret =3D drm_minor_alloc(dev, DRM_MINOR_RENDER);
> >  		if (ret)
> > -			goto err_minors;
> > +			goto err;
> >  	}
> >  =

> >  	ret =3D drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
> >  	if (ret)
> > -		goto err_minors;
> > +		goto err;
> >  =

> >  	ret =3D drm_legacy_create_map_hash(dev);
> >  	if (ret)
> > -		goto err_minors;
> > +		goto err;
> >  =

> >  	drm_legacy_ctxbitmap_init(dev);
> >  =

> > @@ -695,7 +682,7 @@ int drm_dev_init(struct drm_device *dev,
> >  		ret =3D drm_gem_init(dev);
> >  		if (ret) {
> >  			DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
> > -			goto err_ctxbitmap;
> > +			goto err;
> >  		}
> >  	}
> >  =

> > @@ -708,10 +695,6 @@ int drm_dev_init(struct drm_device *dev,
> >  err_setunique:
> >  	if (drm_core_check_feature(dev, DRIVER_GEM))
> >  		drm_gem_destroy(dev);
> > -err_ctxbitmap:
> > -err_minors:
> > -	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> > -	drm_minor_free(dev, DRM_MINOR_RENDER);
> >  err:
> >  	drm_managed_release(dev);
> >  =

> > @@ -776,9 +759,6 @@ void drm_dev_fini(struct drm_device *dev)
> >  =

> >  	if (drm_core_check_feature(dev, DRIVER_GEM))
> >  		drm_gem_destroy(dev);
> > -
> > -	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> > -	drm_minor_free(dev, DRM_MINOR_RENDER);
> >  }
> >  EXPORT_SYMBOL(drm_dev_fini);
> >  =

> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_manage=
d.c
> > index 514d5bd42446..0883615c2088 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -142,6 +142,34 @@ int __drmm_add_action(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(__drmm_add_action);
> >  =

> > +void drmm_remove_action(struct drm_device *dev,
> > +			drmres_release_t action,
> > +			void *data)
> > +{
> > +	struct drmres *dr =3D NULL, *tmp;
> > +	unsigned long flags;
> > +
> > +	if (!data)
> > +		return;
> > +
> > +	spin_lock_irqsave(&dev->managed.lock, flags);
> > +	list_for_each_entry(tmp, &dev->managed.resources, node.entry) {
> > +		if (tmp->node.release =3D=3D action &&
> > +		    *(void **)&tmp->data =3D=3D data) {
> > +			dr =3D tmp;
> > +			del_dr(dev, dr);
> > +			break;
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> > +
> > +	if (WARN_ON(!dr))
> > +		return;
> > +
> > +	kfree(dr);
> > +}
> > +EXPORT_SYMBOL(drmm_remove_action);
> > +
> >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> >  {
> >  	struct drmres *dr;
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > index 89e6fce9f689..5280209dff92 100644
> > --- a/include/drm/drm_managed.h
> > +++ b/include/drm/drm_managed.h
> > @@ -17,6 +17,10 @@ int __must_check __drmm_add_action(struct drm_device=
 *dev,
> >  				   drmres_release_t action,
> >  				   void *data, const char *name);
> >  =

> > +void drmm_remove_action(struct drm_device *dev,
> > +			drmres_release_t action,
> > +			void *data);
> > +
> >  void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> >  =

> >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __m=
alloc;
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
