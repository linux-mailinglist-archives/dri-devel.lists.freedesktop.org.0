Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2943609E0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 14:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47F16E508;
	Thu, 15 Apr 2021 12:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1203E6EA5F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 12:58:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id w186so7890351wmg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=r9SO9imqyb1CVP7A7bROSSf70gc+rLBmkml2AZi7GU4=;
 b=lf+HGX0rX0w/Unqp0DjsyYGCV1lkhReavuzS+8F6Uwk+wavNhlvRCfjSI99oILIVdR
 q+yrf8pw1bOGwOHIQPwUoo5WcLxUKY0iFpbSk20wK2lIrRZZvBafs2ebItGe8AVct9Ea
 gDB3cF6z5SetqiRzdULuNHLoBOm3J3HXL8oj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r9SO9imqyb1CVP7A7bROSSf70gc+rLBmkml2AZi7GU4=;
 b=rUzPe4p0Cs35aHcvxZXPCzliZpo9/Oez39IROduw1UeQbd1P72sZ+a+LG5ZtKX6sHp
 vkPxzuh16UdVlRuIXcynDOzQlcC2j79dVT95f/zQr7edDEuHRtyof81++wUbMjof0epP
 0O17t5NnjWc826SBf8qxsmYEZmQHThweki2EOPdgD+Z0ah6E5rRCWLD3D4JFCSqSthIe
 dH0iysY3We47OpYi8CLEQ9zkq9CCbcaTeOAd8xx7hsP/pzptCCzbGY8ONUoxZDlmqeBB
 j5/MPVjjJJ/GC6QnOrGwe5ENtyBU0BEZF4QciESsiyeVVbaDoVSUsisd/6BlEf0ZLk6h
 8iNQ==
X-Gm-Message-State: AOAM532zF4WlGzRLSSG1LtTCx4QfUwzwa0t/QUiEFap5IwDxDua3RmHs
 uql4nGiXkkSrAnu/9gxGqXUQVQ==
X-Google-Smtp-Source: ABdhPJxVfEsaV7SriaiRNYIDv40oDlz6f2NtWDDFdlY0wsNNb1lD+k7kMrEchG6I6hQWHLlz+y6U8Q==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr2993882wmf.86.1618491478646; 
 Thu, 15 Apr 2021 05:57:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 2sm886599wmi.19.2021.04.15.05.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:57:57 -0700 (PDT)
Date: Thu, 15 Apr 2021 14:57:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
Message-ID: <YHg4Ux7L3FTV45ST@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
 <YHAc3vdstgJzIAEL@phenom.ffwll.local>
 <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: bluescreen_avenger@verizon.net, geert+renesas@glider.be, corbet@lwn.net,
 airlied@linux.ie, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, lgirdwood@gmail.com,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 08:56:20AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 09.04.21 um 11:22 schrieb Daniel Vetter:
> > > Is it that easy? simepldrm's detach function has code to synchronize =
with
> > > concurrent hotplug removals. If we can use drm_dev_unplug() for every=
thing,
> > > I'm all for it.
> > =

> > Uh, I should have looked at the code instead of just asking silly
> > questions :-)
> > =

> > Now I'm even more scared, and also more convinced that we're recreating
> a
> > bad version of some of the core driver model concepts.
> > =

> > I think the ideal option here would be if drm_aperture could unload
> > (unbind really) the platform driver for us, through the driver model. T=
hen
> > there's only one place that keeps track whether the driver is unbound or
> > not. I'm not sure whether this can be done fully generic on a struct
> > device, or whether we need special code for each type. Since atm we only
> > have simpledrm we can just specialize on platform_device and it's good
> > enough.
> =

> I meanwhile found that calling platform_device_unregister() is the right
> thing to do. It is like a hot-unplug event. It's simple to implement and
> removes the generic device as well. Any memory ranges for the generic dev=
ice
> are gone as well. Only the native driver's native device will remain. Tha=
t's
> better than the existing simplefb driver.

That sounds great.

> Which unregister function to call still driver-specific, so I kept the
> callback.

Could we have the callback in core code, and you do something like
drm_aperture_acquire_platform (and later on drm_aperture_acquire_pci or
whatever, although tbh I'm not sure we ever get anything else than
platform). That function can do a runtime check that drm_device->dev is
actually a platform dev.

Another idea: Do the runtime casting in the core without anything? Atm we
have platform that needs support, maybe pci device, so we could easily
extend this and just let it do the right thing. Then no callback is
needed. I.e.

	if (is_platform_dev(drm_device->dev))
		platform_device_unregister(drm_device->dev);
	else
		WARN(1, "not yet implemented\n");

or something like that.

I just find the callback to essentially unregister a device a bit
redundant.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > I think best here would be to Cc: gregkh on this patch and the simpledrm
> > ->detach implementatation, and ask for his feedback as driver model
> > maintainer. Maybe if you could hack together the platform_device unbind
> > path as proof of concept would be even better.
> > =

> > Either way, this is really tricky.
> > -Daniel
> > =

> > > =

> > > Best regards
> > > Thomas
> > > =

> > > > =

> > > > Or maybe we should tie this more into the struct device mode and fo=
rce an
> > > > unload that way? That way devm cleanup would work as one expects, a=
nd
> > > > avoid the need for anything specific (hopefully) in this detach cal=
lback.
> > > > =

> > > > Just feels a bit like we're reinventing half of the driver model he=
re,
> > > > badly.
> > > > =

> > > > > + *	};
> > > > > + *
> > > > > + *	static int acquire_framebuffers(struct drm_device *dev, struc=
t pci_dev *pdev)
> > > > > + *	{
> > > > > + *		resource_size_t start, len;
> > > > > + *		struct drm_aperture *ap;
> > > > > + *
> > > > > + *		base =3D pci_resource_start(pdev, 0);
> > > > > + *		size =3D pci_resource_len(pdev, 0);
> > > > > + *
> > > > > + *		ap =3D devm_acquire_aperture(dev, base, size, &ap_funcs);
> > > > > + *		if (IS_ERR(ap))
> > > > > + *			return PTR_ERR(ap);
> > > > > + *
> > > > > + *		return 0;
> > > > > + *	}
> > > > > + *
> > > > > + *	static int probe(struct pci_dev *pdev)
> > > > > + *	{
> > > > > + *		struct drm_device *dev;
> > > > > + *		int ret;
> > > > > + *
> > > > > + *		// ... Initialize the device...
> > > > > + *		dev =3D devm_drm_dev_alloc();
> > > > > + *		...
> > > > > + *
> > > > > + *		// ... and acquire ownership of the framebuffer.
> > > > > + *		ret =3D acquire_framebuffers(dev, pdev);
> > > > > + *		if (ret)
> > > > > + *			return ret;
> > > > > + *
> > > > > + *		drm_dev_register();
> > > > > + *
> > > > > + *		return 0;
> > > > > + *	}
> > > > > + *
> > > > > + * The generic driver is now subject to forced removal by other =
drivers. This
> > > > > + * is when the detach function in struct &drm_aperture_funcs com=
es into play.
> > > > > + * When a driver calls drm_fb_helper_remove_conflicting_framebuf=
fers() et al
> > > > > + * for the registered framebuffer range, the DRM core calls stru=
ct
> > > > > + * &drm_aperture_funcs.detach and the generic driver has to onlo=
ad itself. It
> > > > > + * may not access the device's registers, framebuffer memory, RO=
M, etc after
> > > > > + * detach returned. If the driver supports hotplugging, detach c=
an be treated
> > > > > + * like an unplug event.
> > > > > + *
> > > > > + * .. code-block:: c
> > > > > + *
> > > > > + *	static void detach_from_device(struct drm_device *dev,
> > > > > + *				       resource_size_t base,
> > > > > + *				       resource_size_t size)
> > > > > + *	{
> > > > > + *		// Signal unplug
> > > > > + *		drm_dev_unplug(dev);
> > > > > + *
> > > > > + *		// Maybe do other clean-up operations
> > > > > + *		...
> > > > > + *	}
> > > > > + *
> > > > > + *	static struct drm_aperture_funcs ap_funcs =3D {
> > > > > + *		.detach =3D detach_from_device,
> > > > > + *	};
> > > > > + */
> > > > > +
> > > > > +/**
> > > > > + * struct drm_aperture - Represents a DRM framebuffer aperture
> > > > > + *
> > > > > + * This structure has no public fields.
> > > > > + */
> > > > > +struct drm_aperture {
> > > > > +	struct drm_device *dev;
> > > > > +	resource_size_t base;
> > > > > +	resource_size_t size;
> > > > > +
> > > > > +	const struct drm_aperture_funcs *funcs;
> > > > > +
> > > > > +	struct list_head lh;
> > > > > +};
> > > > > +
> > > > > +static LIST_HEAD(drm_apertures);
> > > > > +
> > > > > +static DEFINE_MUTEX(drm_apertures_lock);
> > > > > +
> > > > > +static bool overlap(resource_size_t base1, resource_size_t end1,
> > > > > +		    resource_size_t base2, resource_size_t end2)
> > > > > +{
> > > > > +	return (base1 < end2) && (end1 > base2);
> > > > > +}
> > > > > +
> > > > > +static void devm_aperture_acquire_release(void *data)
> > > > > +{
> > > > > +	struct drm_aperture *ap =3D data;
> > > > > +	bool detached =3D !ap->dev;
> > > > > +
> > > > > +	if (!detached)
> > > > =

> > > > Uh this needs a comment that if ap->dev is NULL then we're called f=
rom
> > > > drm_aperture_detach_drivers() and hence the lock is already held.
> > > > =

> > > > > +		mutex_lock(&drm_apertures_lock);
> > > > =

> > > > and an
> > > > =

> > > > 	else
> > > > 		locdep_assert_held(&drm_apertures_lock);
> > > > =

> > > > here to check that. I was scratching my head first quite a bit how =
you'd
> > > > solve the deadlock, this is a neat solution (much simpler than anyt=
hing I
> > > > came up with in my head). But needs comments.
> > > > =

> > > > > +
> > > > > +	list_del(&ap->lh);
> > > > > +
> > > > > +	if (!detached)
> > > > > +		mutex_unlock(&drm_apertures_lock);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * devm_aperture_acquire - Acquires ownership of a framebuffer o=
n behalf of a DRM driver.
> > > > > + * @dev:	the DRM device to own the framebuffer memory
> > > > > + * @base:	the framebuffer's byte offset in physical memory
> > > > > + * @size:	the framebuffer size in bytes
> > > > > + * @funcs:	callback functions
> > > > > + *
> > > > > + * Installs the given device as the new owner. The function fail=
s if the
> > > > > + * framebuffer range, or parts of it, is currently owned by
> > > > > another
> driver.
> > > > > + * To evict current owners, callers should use
> > > > > + * drm_fb_helper_remove_conflicting_framebuffers() et al. before=
 calling this
> > > > > + * function. Acquired apertures are released automatically if th=
e underlying
> > > > > + * device goes away.
> > > > > + *
> > > > > + * Returns:
> > > > > + * An instance of struct &drm_aperture on success, or a pointer-=
encoded
> > > > > + * errno value otherwise.
> > > > > + */
> > > > > +struct drm_aperture *
> > > > > +devm_aperture_acquire(struct drm_device *dev,
> > > > > +		      resource_size_t base, resource_size_t size,
> > > > > +		      const struct drm_aperture_funcs *funcs)
> > > > > +{
> > > > > +	size_t end =3D base + size;
> > > > > +	struct list_head *pos;
> > > > > +	struct drm_aperture *ap;
> > > > > +	int ret;
> > > > > +
> > > > > +	mutex_lock(&drm_apertures_lock);
> > > > > +
> > > > > +	list_for_each(pos, &drm_apertures) {
> > > > > +		ap =3D container_of(pos, struct drm_aperture, lh);
> > > > > +		if (overlap(base, end, ap->base, ap->base + ap->size))
> > > > > +			return ERR_PTR(-EBUSY);
> > > > > +	}
> > > > > +
> > > > > +	ap =3D devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
> > > > > +	if (!ap)
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +	ap->dev =3D dev;
> > > > > +	ap->base =3D base;
> > > > > +	ap->size =3D size;
> > > > > +	ap->funcs =3D funcs;
> > > > > +	INIT_LIST_HEAD(&ap->lh);
> > > > > +
> > > > > +	list_add(&ap->lh, &drm_apertures);
> > > > > +
> > > > > +	mutex_unlock(&drm_apertures_lock);
> > > > > +
> > > > > +	ret =3D devm_add_action_or_reset(dev->dev, devm_aperture_acquir=
e_release, ap);
> > > > > +	if (ret)
> > > > > +		return ERR_PTR(ret);
> > > > > +
> > > > > +	return ap;
> > > > > +}
> > > > > +EXPORT_SYMBOL(devm_aperture_acquire);
> > > > > +
> > > > > +void drm_aperture_detach_drivers(resource_size_t base, resource_=
size_t size)
> > > > > +{
> > > > > +	resource_size_t end =3D base + size;
> > > > > +	struct list_head *pos, *n;
> > > > > +
> > > > > +	mutex_lock(&drm_apertures_lock);
> > > > > +
> > > > > +	list_for_each_safe(pos, n, &drm_apertures) {
> > > > > +		struct drm_aperture *ap =3D
> > > > > +			container_of(pos, struct drm_aperture, lh);
> > > > > +		struct drm_device *dev =3D ap->dev;
> > > > > +
> > > > > +		if (!overlap(base, end, ap->base, ap->base + ap->size))
> > > > > +			continue;
> > > > > +
> > > > > +		ap->dev =3D NULL; /* detach from device */
> > > > > +		if (drm_WARN_ON(dev, !ap->funcs->detach))
> > > > > +			continue;
> > > > > +		ap->funcs->detach(dev, ap->base, ap->size);
> > > > > +	}
> > > > > +
> > > > > +	mutex_unlock(&drm_apertures_lock);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_aperture_detach_drivers);
> > > > =

> > > > Is this just exported because of the inline functions in the
> > > > headers?
> Imo
> > > > better to make them proper functions (they're big after your patch&=
not
> > > > perf critical, so not good candidates for inlining anyway).
> > > > =

> > > > > diff --git a/include/drm/drm_aperture.h b/include/drm/drm_apertur=
e.h
> > > > > index 13766efe9517..696cec75ef78 100644
> > > > > --- a/include/drm/drm_aperture.h
> > > > > +++ b/include/drm/drm_aperture.h
> > > > > @@ -4,8 +4,30 @@
> > > > >    #define _DRM_APERTURE_H_
> > > > >    #include <linux/fb.h>
> > > > > +#include <linux/pci.h>
> > > > >    #include <linux/vgaarb.h>
> > > > > +struct drm_aperture;
> > > > > +struct drm_device;
> > > > > +
> > > > > +struct drm_aperture_funcs {
> > > > > +	void (*detach)(struct drm_device *dev, resource_size_t base, re=
source_size_t size);
> > > > > +};
> > > > > +
> > > > > +struct drm_aperture *
> > > > > +devm_aperture_acquire(struct drm_device *dev,
> > > > > +		      resource_size_t base, resource_size_t size,
> > > > > +		      const struct drm_aperture_funcs *funcs);
> > > > > +
> > > > > +#if defined(CONFIG_DRM_APERTURE)
> > > > > +void drm_aperture_detach_drivers(resource_size_t base, resource_=
size_t size);
> > > > > +#else
> > > > > +static inline void
> > > > > +drm_aperture_detach_drivers(resource_size_t base, resource_size_=
t size)
> > > > > +{
> > > > > +}
> > > > > +#endif
> > > > > +
> > > > >    /**
> > > > >     * drm_fb_helper_remove_conflicting_framebuffers - remove firm=
ware-configured framebuffers
> > > > >     * @a: memory range, users of which are to be removed
> > > > > @@ -20,6 +42,11 @@ static inline int
> > > > >    drm_fb_helper_remove_conflicting_framebuffers(struct apertures=
_struct *a,
> > > > >    					      const char *name, bool primary)
> > > > >    {
> > > > > +	int i;
> > > > > +
> > > > > +	for (i =3D 0; i < a->count; ++i)
> > > > > +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].si=
ze);
> > > > > +
> > > > >    #if IS_REACHABLE(CONFIG_FB)
> > > > >    	return remove_conflicting_framebuffers(a, name, primary);
> > > > >    #else
> > > > > @@ -43,7 +70,16 @@ static inline int
> > > > >    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_d=
ev *pdev,
> > > > >    						  const char *name)
> > > > >    {
> > > > > -	int ret =3D 0;
> > > > > +	resource_size_t base, size;
> > > > > +	int bar, ret =3D 0;
> > > > > +
> > > > > +	for (bar =3D 0; bar < PCI_STD_NUM_BARS; bar++) {
> > > > > +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> > > > > +			continue;
> > > > > +		base =3D pci_resource_start(pdev, bar);
> > > > > +		size =3D pci_resource_len(pdev, bar);
> > > > > +		drm_aperture_detach_drivers(base, size);
> > > > > +	}
> > > > >    	/*
> > > > >    	 * WARNING: Apparently we must kick fbdev drivers before vgac=
on,
> > > > > -- =

> > > > > 2.30.1
> > > > > =

> > > > =

> > > =

> > > -- =

> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > > (HRB 36809, AG N=FCrnberg)
> > > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > > =

> > =

> > =

> > =

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
