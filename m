Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F616FBE7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 11:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF058991C;
	Wed, 26 Feb 2020 10:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1389958
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 10:21:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c13so1492425wrq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tKWM/NdAzG8m/+DUwDoGEGRF5Zik76ep3vvNYPf1i6o=;
 b=CJ2KbxDQl4RYf7jJMlrwjoYqBi6c0rR8c3pH5AK/TtkeKJ6iPR0U1EkUjMOGcludZs
 IhCD178BphZZYWRGqU5wSB6k9Nhp+xfbPgMVHo0xgkYNBYDUwgiZDtXnRW21CD+XDSOY
 s9WhJ1HVnFpmorel3DK3p9pvyrduJQ7OUf7hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tKWM/NdAzG8m/+DUwDoGEGRF5Zik76ep3vvNYPf1i6o=;
 b=npwNNg2GUBxQr6wz7Pxob8XQFeLlTMwBbb86OXNpWPxnLa+trGkne2vgN8zlQoAySw
 uQSSLQfqW+GcRMe8JTWKnenNViYfuEGNT203mptQn6CyrYbdtmwGLAh6bOo2rdRc7ydX
 36uGWjznVwgF3tejs5ebsA+jEt5FzBVfkPIihuDCpVE94aSCopDXqFpX+SGRBxXLE0cv
 HftlNTR4fL9wbblmpqarMl8wmYua2Y2NxleNiElDEVB1WbbxnlVlnbO8NACgvK/KNRcI
 Kp54Qv8eHvuhCYsPdARZnV2gcNrbgG1dhChDojJ64F8inLci6obzTa64v/YCtJFyeiIb
 S31Q==
X-Gm-Message-State: APjAAAU6ZJvG2sWfaTsx4k7GaAPdDfU91w7D/divIhjCGswy75BVPYIo
 ZOgsmOBEK4UfPluxfuY9W3Ja1w==
X-Google-Smtp-Source: APXvYqyIUnXv52tlOk45TgWvol5IBDaTP8JcM2U5IkklDxspVSN8lij9yAF3ikyVVhflyjqPhZIPhQ==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr4604525wrv.3.1582712481437;
 Wed, 26 Feb 2020 02:21:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h205sm2296559wmf.25.2020.02.26.02.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 02:21:20 -0800 (PST)
Date: Wed, 26 Feb 2020 11:21:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200226102118.GS2363188@phenom.ffwll.local>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
 <CGME20200221210354eucas1p1b9377cb5c64ae9f657191cf7d6c9e92c@eucas1p1.samsung.com>
 <20200221210319.2245170-4-daniel.vetter@ffwll.ch>
 <c088ce3b-d409-3a66-1f45-72f8ee9d9784@samsung.com>
 <CAKMK7uE+8eQGfV=6t_3vV+L=fOL6zUm5CqSxWf26JNUSL54brg@mail.gmail.com>
 <fd3ebf4e-8ba3-b2a5-20a4-9dd35f35c244@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd3ebf4e-8ba3-b2a5-20a4-9dd35f35c244@samsung.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 10:21:17AM +0100, Andrzej Hajda wrote:
> On 25.02.2020 16:03, Daniel Vetter wrote:
> > On Tue, Feb 25, 2020 at 11:27 AM Andrzej Hajda <a.hajda@samsung.com> wr=
ote:
> >> Hi Daniel,
> >>
> >>
> >> The patchset looks interesting.
> >>
> >>
> >> On 21.02.2020 22:02, Daniel Vetter wrote:
> >>> We have lots of these. And the cleanup code tends to be of dubious
> >>> quality. The biggest wrong pattern is that developers use devm_, which
> >>> ties the release action to the underlying struct device, whereas
> >>> all the userspace visible stuff attached to a drm_device can long
> >>> outlive that one (e.g. after a hotunplug while userspace has open
> >>> files and mmap'ed buffers). Give people what they want, but with more
> >>> correctness.
> >>
> >> I am not familiar with this stuff, so forgive me stupid questions.
> >>
> >> Is it documented how uapi should behave in such case?
> >>
> >> I guess the general rule is to return errors on most ioctls (ENODEV,
> >> EIO?), and wait until userspace releases everything, as there is not
> >> much more to do.
> >>
> >> If that is true what is the point of keeping these structs anyway -
> >> trivial functions with small context data should do the job.
> >>
> >> I suspect I am missing something but I do not know what :)
> > We could do the above (also needs unmapping of all mmaps, so userspace
> > then gets SIGSEGV everywhere) and watch userspace crash&burn.
> > Essentially if the kernel can't do this properly, then there's no hope
> > that userspace will be any better.
> =

> =

> We do not want to crash userspace. We just need to tell userspace that
> the kernel objects userspace has references to are not valid.
> =

> For this two mechanism should be enough:
> =

> - signal hot-unplug,
> =

> - report error (ENODEV for example) on any userspace requests (ioctls)
> on invalid objects.
> =

> Expecting from userspace properly handling ioctl errors seems to be fair.

The trouble is that maybe it's fair, practice says it's just not going to
happen.

> Regarding mmap I am not sure how to properly handle disappearing
> devices, but this is common problem regardless which solution we use.

signal handler wrapped around every mmap access. Which doesn't compose
across libraries, so is essentially impossible.

Note that e.g. GL's robustness extensions works exactly like this here
too: GPU dies, kernel kills all your objects and contexts and everything.
But the driver keeps "working". The only way to get information that
everything is actually dead is by querying the robustness extension, which
then will tell you what's happened.

Again this is because it's impossible to make sure userspace actually
checks error codes every where. It's also prohibitively expensive. vk goes
as far as outright removing all error validation (at least as much as
possible).

> > Hence the idea is that we keep everything userspace facing still
> > around, except it doesn't do much anymore. So connectors still there,
> > but they look disconnected.
> =

> =

> It looks like lying to userspace that physical connectors still exists.
> If we want to lie we need good reason for that. What is that reason?
> =

> Why not just tell connectors are gone?

Userspace sucks at handling hotunplugged connectors. Most of it is special
case code for DP MST connectors only.

> > Userspace can then hopefully eventually
> > get around to processing the sysfs hotunplug event and remove the
> > device from all its list. So the long-term idea is that a lot of stuff
> > keeps working, except the driver doesn't talk to the hardware anymore.
> > And we just sit around waiting for userspace to clean things up.
> =

> =

> What does it mean "lot of stuff keeps working"? What drm driver can do
> without hardware? Could you show some examples?

Nothing will "work", the goal is simply for userspace to not explode in
fire and take the entire desktop down with it.

> > I guess once we have a bunch of the panel/usb drivers converted over
> > we could indeed document how this is all supposed to work from an uapi
> > pov. But right now a lot of this is all rather aspirational, I think
> > only the recent simple display pipe based drivers implement this as
> > described above.
> >
> >>> Mostly copied from devres.c, with types adjusted to fit drm_device and
> >>> a few simplifications - I didn't (yet) copy over everything. Since
> >>> the types don't match code sharing looked like a hopeless endeavour.
> >>>
> >>> For now it's only super simplified, no groups, you can't remove
> >>> actions (but kfree exists, we'll need that soon). Plus all specific to
> >>> drm_device ofc, including the logging. Which I didn't bother to make
> >>> compile-time optional, since none of the other drm logging is compile
> >>> time optional either.
> >>
> >> I saw in v1 thread that copy/paste is OK and merging back devres and
> >> drmres can be done later, but experience shows that after short time
> >> things get de-synchronized and merging process becomes quite painful.
> >>
> >> On the other side I guess it shouldn't be difficult to split devres in=
to
> >> consumer agnostic core and "struct device" helpers and then use the co=
re
> >> in drm.
> >>
> >> For example currently devres uses two fields from struct device:
> >>
> >>     spinlock_t        devres_lock;
> >>     struct list_head    devres_head;
> >>
> >> Lets put it into separate struct:
> >>
> >> struct devres {
> >>
> >>     spinlock_t        lock;
> >>     struct list_head    head;
> >>
> >> };
> >>
> >> And embed this struct into "struct device".
> >>
> >> Then convert all core devres functions to take "struct devres *"
> >> argument instead of "struct device *" and then these core functions can
> >> be usable in drm.
> >>
> >> Looks quite simple separation of abstraction (devres) and its consumer
> >> (struct device).
> >>
> >> After such split one could think about changing name devres to somethi=
ng
> >> more reliable.
> > There was a long discussion on v1 exactly about this, Greg's
> > suggestion was to "just share a struct device". So we're not going to
> > do this here, and the struct device seems like slight overkill and not
> > a good enough fit here.
> =

> =

> But my proposition is different, I want to get rid of "struct device"
> from devres core - devres has nothing to do with device, it was bound to
> it probably because it was convenient as device was the only client of
> devres (I guess). Now if we want to have more devres clients abstracting
> out devres from device seems quite natural. This way we will have proper
> abstractions without code duplication.
> =

> Examples of devres related code according to my proposition:
> =

> // devres core
> =

> void devres_add(struct devres_head *dh, void *res)
> {
> =

> =A0=A0 struct devres *dr =3D container_of(res, struct devres, data);
> =

> =A0=A0=A0 unsigned long flags;
> =

> =A0=A0=A0 spin_lock_irqsave(&dh->lock, flags);
> =A0=A0=A0 add_dr(dev, &dr->node);
> =A0=A0=A0 spin_unlock_irqrestore(&dh->lock, flags);
> }
> =

> // device devres helper (non core)
> =

> struct clk *devm_clk_get(struct device *dev, const char *id)
> {
> =A0=A0=A0 struct clk **ptr, *clk;
> =

> =A0=A0=A0 ptr =3D devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL=
);
> =A0=A0=A0 if (!ptr)
> =A0=A0=A0 =A0=A0=A0 return ERR_PTR(-ENOMEM);
> =

> =A0=A0=A0 clk =3D clk_get(dev, id);
> =A0=A0=A0 if (!IS_ERR(clk)) {
> =A0=A0=A0 =A0=A0=A0 *ptr =3D clk;
> =A0=A0=A0 =A0=A0=A0 devres_add(&dev->devres, ptr);
> =A0=A0=A0 } else {
> =A0=A0=A0 =A0=A0=A0 devres_free(ptr);
> =A0=A0=A0 }
> =

> =A0=A0=A0 return clk;
> }
> =

> =

> Changes are cosmetic. But then you can easily add devres to drmdev:
> =

> struct drm_device {
> =

> =A0=A0 ...
> =

> +=A0=A0 struct devres_head devres;
> =

> };
> =

> // then copy/modify from your patch:
> =

> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> +{
> +	struct drmres *dr;
> +
> +	dr =3D alloc_dr(NULL, size, gfp, dev_to_node(dev->dev));
> +	if (!dr)
> +		return NULL;
> +	dr->node.name =3D "kmalloc";
> +
> +	devres_add(&dev->devres, dr); // the only change is here
> +
> +	return dr->data;
> +}
> =

> =

> Btw, reimplemented add_dr is different of original add_dr and is similar
> to original devres_add, so your implementation differs already from
> original one, merging back these two will be painfull :)

Oh I know, I guess I could go more into details about why exactly. One
reason is that I want type-checking, so struct drm_device * instead of
something else. At least for the userspace callbacks. That's going to be
tough with your approach - kmalloc is easy, it's the _add_action which
gets nasty with the type checking.

The other is that we can use drm debugging, which gives us some nice
consistency within drm at least.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
