Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA1359908
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 11:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B186EBC4;
	Fri,  9 Apr 2021 09:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD3A6EBC4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 09:22:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q26so4903593wrz.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vLvBXXNW9anasakQAr8qQLcWcSFiTRvgGWu5WLKs3rk=;
 b=OgsIEelzOm3+bjqC2BAMMEbU3mdKUY4rN//VNlYBl++Lq46Ke2tfQCeeIl6D5liv0A
 syEdFvS+Ov4v6hjl2EdRV4K2tkYI+yZzuHbsNfTmF8ysUsS+23QtCEac2xoGJKp6eqSc
 7KLxMwOc+EoWb6RAPAZhbjPk+OMKcSAIPnAsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vLvBXXNW9anasakQAr8qQLcWcSFiTRvgGWu5WLKs3rk=;
 b=VrhBUmRwYn1H9++qmfHPDx+CLzTPYT2Csc5PUrioJBOXqslD0IDyZ/WdfqOxz39D+O
 BL+fmrwjRUb/uFZKKdMaANwvUGZV2HbwjVES5h15x5L5l8hzBdj18ulrl0kMzTuG3zin
 AQTGAMIQ/Pmhm1sg6I6QORGK0KjGe57Nr82hvuhEZeHgdSAbkga+IokCZ5wKiSUiaYAx
 WyDGws/jLe/2zjhkHuqCGLyre8xuUaa4Hdx27qIKLFZNSG5UopPOVNqU25U4qqTd/TW5
 bmthlw/xPlrLsVal/T3giWd5SdXA2Vf6EZuqJID7940ZU/t2+xvtzid5AcHsR/FI+wlI
 vZ+Q==
X-Gm-Message-State: AOAM531WhiJYlP8ypknQSwKXJB379Qpyeve4rXanRMUl80OJEj5VmVMk
 elEOZKg8is1wmqvlf4UJUBD7Iw==
X-Google-Smtp-Source: ABdhPJzf/ThGjTEWF4IYBosfUTP08Trlj6uVf2xa8DV5u1irOInL3zHkM19FAMZ7rfBdfElplD7GEg==
X-Received: by 2002:a5d:4884:: with SMTP id g4mr16594801wrq.191.1617960161670; 
 Fri, 09 Apr 2021 02:22:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f9sm2981589wmj.38.2021.04.09.02.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:22:40 -0700 (PDT)
Date: Fri, 9 Apr 2021 11:22:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
Message-ID: <YHAc3vdstgJzIAEL@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
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

On Fri, Apr 09, 2021 at 09:06:56AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 08.04.21 um 11:48 schrieb Daniel Vetter:
> > =

> > Maybe just me, but to avoid overstretching the attention spawn of doc
> > readers I'd avoid this example here. And maybe make the recommendation
> > stronger, e.g. "PCI device drivers can avoid open-coding
> > remove_conflicting_framebuffers() by calling
> > drm_fb_helper_remove_conflicting_pci_framebuffers()."
> =

> It's a tutorial. In my expectation, everyone just copies the tutorial code
> and fills the gaps.

Sure, but we also have default functions for most common cases, so most
people just end up copypasting the single function call. Feels like
overkill to have a tutorial for that.

Imo tutorial/pseudo-code are good if there's more involved code flow that
many places need to copypaste and customize. Or to show how different
functions work together collectively. This doesn't quite feel like it's
clearing that bar.

And please don't get me wrong, solid docs is great. It's just that I think
we need to have reader's attention span in mind too (and mine personally
might be on the extremely short side here) to make sure our docs are
effective at conveying information.

> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static int probe(struct pci_dev *pdev)
> > > + *	{
> > > + *		int ret;
> > > + *
> > > + *		// Remove any generic drivers...
> > > + *		ret =3D drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, =
"example driver");
> > > + *		if (ret)
> > > + *			return ret;
> > > + *
> > > + *		// ... and initialize the hardware.
> > > + *		...
> > > + *
> > > + *		drm_dev_register();
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + * Drivers that are susceptible to being removed be other drivers, s=
uch as
> > > + * generic EFI or VESA drivers, have to register themselves as owner=
s of their
> > > + * given framebuffer memory. Ownership of the framebuffer memory is =
achived
> > > + * by calling devm_aperture_acquire(). On success, the driver is the=
 owner
> > > + * of the framebuffer range. The function fails if the framebuffer i=
s already
> > > + * by another driver. See below for an example.
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static struct drm_aperture_funcs ap_funcs =3D {
> > > + *		.detach =3D ...
> > =

> > Is there really value in allowing/forcing drivers to set up their own
> > detach ops? You already make this specific to struct drm_device, an
> > implementation that just calls drm_dev_unplug feels like the right thing
> > to do?
> =

> Is it that easy? simepldrm's detach function has code to synchronize with
> concurrent hotplug removals. If we can use drm_dev_unplug() for everythin=
g,
> I'm all for it.

Uh, I should have looked at the code instead of just asking silly
questions :-)

Now I'm even more scared, and also more convinced that we're recreating a
bad version of some of the core driver model concepts.

I think the ideal option here would be if drm_aperture could unload
(unbind really) the platform driver for us, through the driver model. Then
there's only one place that keeps track whether the driver is unbound or
not. I'm not sure whether this can be done fully generic on a struct
device, or whether we need special code for each type. Since atm we only
have simpledrm we can just specialize on platform_device and it's good
enough.

I think best here would be to Cc: gregkh on this patch and the simpledrm
->detach implementatation, and ask for his feedback as driver model
maintainer. Maybe if you could hack together the platform_device unbind
path as proof of concept would be even better.

Either way, this is really tricky.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > Or maybe we should tie this more into the struct device mode and force =
an
> > unload that way? That way devm cleanup would work as one expects, and
> > avoid the need for anything specific (hopefully) in this detach callbac=
k.
> > =

> > Just feels a bit like we're reinventing half of the driver model here,
> > badly.
> > =

> > > + *	};
> > > + *
> > > + *	static int acquire_framebuffers(struct drm_device *dev, struct pc=
i_dev *pdev)
> > > + *	{
> > > + *		resource_size_t start, len;
> > > + *		struct drm_aperture *ap;
> > > + *
> > > + *		base =3D pci_resource_start(pdev, 0);
> > > + *		size =3D pci_resource_len(pdev, 0);
> > > + *
> > > + *		ap =3D devm_acquire_aperture(dev, base, size, &ap_funcs);
> > > + *		if (IS_ERR(ap))
> > > + *			return PTR_ERR(ap);
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + *	static int probe(struct pci_dev *pdev)
> > > + *	{
> > > + *		struct drm_device *dev;
> > > + *		int ret;
> > > + *
> > > + *		// ... Initialize the device...
> > > + *		dev =3D devm_drm_dev_alloc();
> > > + *		...
> > > + *
> > > + *		// ... and acquire ownership of the framebuffer.
> > > + *		ret =3D acquire_framebuffers(dev, pdev);
> > > + *		if (ret)
> > > + *			return ret;
> > > + *
> > > + *		drm_dev_register();
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + * The generic driver is now subject to forced removal by other driv=
ers. This
> > > + * is when the detach function in struct &drm_aperture_funcs comes i=
nto play.
> > > + * When a driver calls drm_fb_helper_remove_conflicting_framebuffers=
() et al
> > > + * for the registered framebuffer range, the DRM core calls struct
> > > + * &drm_aperture_funcs.detach and the generic driver has to onload i=
tself. It
> > > + * may not access the device's registers, framebuffer memory, ROM, e=
tc after
> > > + * detach returned. If the driver supports hotplugging, detach can b=
e treated
> > > + * like an unplug event.
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static void detach_from_device(struct drm_device *dev,
> > > + *				       resource_size_t base,
> > > + *				       resource_size_t size)
> > > + *	{
> > > + *		// Signal unplug
> > > + *		drm_dev_unplug(dev);
> > > + *
> > > + *		// Maybe do other clean-up operations
> > > + *		...
> > > + *	}
> > > + *
> > > + *	static struct drm_aperture_funcs ap_funcs =3D {
> > > + *		.detach =3D detach_from_device,
> > > + *	};
> > > + */
> > > +
> > > +/**
> > > + * struct drm_aperture - Represents a DRM framebuffer aperture
> > > + *
> > > + * This structure has no public fields.
> > > + */
> > > +struct drm_aperture {
> > > +	struct drm_device *dev;
> > > +	resource_size_t base;
> > > +	resource_size_t size;
> > > +
> > > +	const struct drm_aperture_funcs *funcs;
> > > +
> > > +	struct list_head lh;
> > > +};
> > > +
> > > +static LIST_HEAD(drm_apertures);
> > > +
> > > +static DEFINE_MUTEX(drm_apertures_lock);
> > > +
> > > +static bool overlap(resource_size_t base1, resource_size_t end1,
> > > +		    resource_size_t base2, resource_size_t end2)
> > > +{
> > > +	return (base1 < end2) && (end1 > base2);
> > > +}
> > > +
> > > +static void devm_aperture_acquire_release(void *data)
> > > +{
> > > +	struct drm_aperture *ap =3D data;
> > > +	bool detached =3D !ap->dev;
> > > +
> > > +	if (!detached)
> > =

> > Uh this needs a comment that if ap->dev is NULL then we're called from
> > drm_aperture_detach_drivers() and hence the lock is already held.
> > =

> > > +		mutex_lock(&drm_apertures_lock);
> > =

> > and an
> > =

> > 	else
> > 		locdep_assert_held(&drm_apertures_lock);
> > =

> > here to check that. I was scratching my head first quite a bit how you'd
> > solve the deadlock, this is a neat solution (much simpler than anything=
 I
> > came up with in my head). But needs comments.
> > =

> > > +
> > > +	list_del(&ap->lh);
> > > +
> > > +	if (!detached)
> > > +		mutex_unlock(&drm_apertures_lock);
> > > +}
> > > +
> > > +/**
> > > + * devm_aperture_acquire - Acquires ownership of a framebuffer on be=
half of a DRM driver.
> > > + * @dev:	the DRM device to own the framebuffer memory
> > > + * @base:	the framebuffer's byte offset in physical memory
> > > + * @size:	the framebuffer size in bytes
> > > + * @funcs:	callback functions
> > > + *
> > > + * Installs the given device as the new owner. The function fails if=
 the
> > > + * framebuffer range, or parts of it, is currently owned by another =
driver.
> > > + * To evict current owners, callers should use
> > > + * drm_fb_helper_remove_conflicting_framebuffers() et al. before cal=
ling this
> > > + * function. Acquired apertures are released automatically if the un=
derlying
> > > + * device goes away.
> > > + *
> > > + * Returns:
> > > + * An instance of struct &drm_aperture on success, or a pointer-enco=
ded
> > > + * errno value otherwise.
> > > + */
> > > +struct drm_aperture *
> > > +devm_aperture_acquire(struct drm_device *dev,
> > > +		      resource_size_t base, resource_size_t size,
> > > +		      const struct drm_aperture_funcs *funcs)
> > > +{
> > > +	size_t end =3D base + size;
> > > +	struct list_head *pos;
> > > +	struct drm_aperture *ap;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&drm_apertures_lock);
> > > +
> > > +	list_for_each(pos, &drm_apertures) {
> > > +		ap =3D container_of(pos, struct drm_aperture, lh);
> > > +		if (overlap(base, end, ap->base, ap->base + ap->size))
> > > +			return ERR_PTR(-EBUSY);
> > > +	}
> > > +
> > > +	ap =3D devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
> > > +	if (!ap)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	ap->dev =3D dev;
> > > +	ap->base =3D base;
> > > +	ap->size =3D size;
> > > +	ap->funcs =3D funcs;
> > > +	INIT_LIST_HEAD(&ap->lh);
> > > +
> > > +	list_add(&ap->lh, &drm_apertures);
> > > +
> > > +	mutex_unlock(&drm_apertures_lock);
> > > +
> > > +	ret =3D devm_add_action_or_reset(dev->dev, devm_aperture_acquire_re=
lease, ap);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	return ap;
> > > +}
> > > +EXPORT_SYMBOL(devm_aperture_acquire);
> > > +
> > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size=
_t size)
> > > +{
> > > +	resource_size_t end =3D base + size;
> > > +	struct list_head *pos, *n;
> > > +
> > > +	mutex_lock(&drm_apertures_lock);
> > > +
> > > +	list_for_each_safe(pos, n, &drm_apertures) {
> > > +		struct drm_aperture *ap =3D
> > > +			container_of(pos, struct drm_aperture, lh);
> > > +		struct drm_device *dev =3D ap->dev;
> > > +
> > > +		if (!overlap(base, end, ap->base, ap->base + ap->size))
> > > +			continue;
> > > +
> > > +		ap->dev =3D NULL; /* detach from device */
> > > +		if (drm_WARN_ON(dev, !ap->funcs->detach))
> > > +			continue;
> > > +		ap->funcs->detach(dev, ap->base, ap->size);
> > > +	}
> > > +
> > > +	mutex_unlock(&drm_apertures_lock);
> > > +}
> > > +EXPORT_SYMBOL(drm_aperture_detach_drivers);
> > =

> > Is this just exported because of the inline functions in the headers? I=
mo
> > better to make them proper functions (they're big after your patch&not
> > perf critical, so not good candidates for inlining anyway).
> > =

> > > diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
> > > index 13766efe9517..696cec75ef78 100644
> > > --- a/include/drm/drm_aperture.h
> > > +++ b/include/drm/drm_aperture.h
> > > @@ -4,8 +4,30 @@
> > >   #define _DRM_APERTURE_H_
> > >   #include <linux/fb.h>
> > > +#include <linux/pci.h>
> > >   #include <linux/vgaarb.h>
> > > +struct drm_aperture;
> > > +struct drm_device;
> > > +
> > > +struct drm_aperture_funcs {
> > > +	void (*detach)(struct drm_device *dev, resource_size_t base, resour=
ce_size_t size);
> > > +};
> > > +
> > > +struct drm_aperture *
> > > +devm_aperture_acquire(struct drm_device *dev,
> > > +		      resource_size_t base, resource_size_t size,
> > > +		      const struct drm_aperture_funcs *funcs);
> > > +
> > > +#if defined(CONFIG_DRM_APERTURE)
> > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size=
_t size);
> > > +#else
> > > +static inline void
> > > +drm_aperture_detach_drivers(resource_size_t base, resource_size_t si=
ze)
> > > +{
> > > +}
> > > +#endif
> > > +
> > >   /**
> > >    * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-=
configured framebuffers
> > >    * @a: memory range, users of which are to be removed
> > > @@ -20,6 +42,11 @@ static inline int
> > >   drm_fb_helper_remove_conflicting_framebuffers(struct apertures_stru=
ct *a,
> > >   					      const char *name, bool primary)
> > >   {
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < a->count; ++i)
> > > +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size);
> > > +
> > >   #if IS_REACHABLE(CONFIG_FB)
> > >   	return remove_conflicting_framebuffers(a, name, primary);
> > >   #else
> > > @@ -43,7 +70,16 @@ static inline int
> > >   drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *p=
dev,
> > >   						  const char *name)
> > >   {
> > > -	int ret =3D 0;
> > > +	resource_size_t base, size;
> > > +	int bar, ret =3D 0;
> > > +
> > > +	for (bar =3D 0; bar < PCI_STD_NUM_BARS; bar++) {
> > > +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> > > +			continue;
> > > +		base =3D pci_resource_start(pdev, bar);
> > > +		size =3D pci_resource_len(pdev, bar);
> > > +		drm_aperture_detach_drivers(base, size);
> > > +	}
> > >   	/*
> > >   	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> > > -- =

> > > 2.30.1
> > > =

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
