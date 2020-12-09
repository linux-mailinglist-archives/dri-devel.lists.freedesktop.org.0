Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80C62D376C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EC06E204;
	Wed,  9 Dec 2020 00:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A836E201
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:13:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c198so22922wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LPzZXmsmYr4YkRkqlYuDKbmlg7dWEI0P0q9tYnVnC8M=;
 b=Ff/We8mDCf6oIMYbP5cYoe+1Gr61vShcvoa5llR5g38LpfXRF80msxJou9qFb6Ov5E
 c30AVHpqvnueBJGtT2SJCIhPD40byx6nwj/aGq7L7aadRWU39hhXDcjkTAeaA4tag0tU
 2BZRLBXBpAN/IpE2cDBFzIL+SV/UL5VtEI/9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LPzZXmsmYr4YkRkqlYuDKbmlg7dWEI0P0q9tYnVnC8M=;
 b=AWCJTnsTL2kX2/+8woAtwojBA/5akGgba5vIVoEnp5oh64ECTg2GtOc0hZxNJA60Jx
 F2UGDmK/MEdoGnuIXz7Zsx34AjqPWLVMasyNEcYyz1XBn85Zcps6LkE6bJFDN+pbh0IO
 t0Uz5Me/+4iHcnnX4hCKmZi7M7XzhhPC6ITvg4uhx5yz9k7XLHiv7QNY1MnO5+BmMzX7
 E2d6FNP9fUTYJQb8cxLUNR50Si0aPEf+EsXwHku7PhFaLaD7E4k3Q/FyHJyRs0nkO6YD
 ZMAfnHopr1gPtv5SMcWnxiW5dRXUT4Y2MCallL3YYJzkRJDM31e609G/V99s0uIO33w6
 sjIQ==
X-Gm-Message-State: AOAM532/pWHF315k2iOJWZgAvu3DjmrycJudYjD40Z0RghhRbIifX3l4
 aXzU3tyNbBpuD5Mykl1jyY3TiQ==
X-Google-Smtp-Source: ABdhPJyvBFCchU7tkrRHgR9dWVkzVd7Zegld+UqW+zVFlUapwIyYxBp2/Coe7VbRnEdrbW4OYvXTuQ==
X-Received: by 2002:a1c:df57:: with SMTP id w84mr3441wmg.37.1607472803836;
 Tue, 08 Dec 2020 16:13:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d9sm900466wrc.87.2020.12.08.16.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:13:23 -0800 (PST)
Date: Wed, 9 Dec 2020 01:13:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
Message-ID: <20201209001321.GF401619@phenom.ffwll.local>
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local>
 <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
 <4fc93de9-cd26-58b0-d398-ac97577ffa92@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fc93de9-cd26-58b0-d398-ac97577ffa92@amd.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, airlied@redhat.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 04, 2020 at 09:47:08AM +0100, Christian K=F6nig wrote:
> Am 04.12.20 um 09:32 schrieb Thomas Zimmermann:
> > Hi
> > =

> > Am 03.12.20 um 21:41 schrieb Daniel Vetter:
> > > On Thu, Dec 03, 2020 at 07:59:04PM +0100, Thomas Zimmermann wrote:
> > > > Hi
> > > > =

> > > > Am 03.12.20 um 16:26 schrieb Daniel Vetter:
> > > > > On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:
> > > > > > Dma-buf's vmap and vunmap callbacks are undocumented and various
> > > > > > exporters currently have slightly different semantics for them.=
 Add
> > > > > > documentation on how to implement and use these interfaces corr=
ectly.
> > > > > > =

> > > > > > v2:
> > > > > > =A0=A0=A0=A0* document vmap semantics in struct dma_buf_ops
> > > > > > =A0=A0=A0=A0* add TODO item for reviewing and maybe fixing dma-=
buf exporters
> > > > > > =

> > > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > =

> > > > > I still don't think this works, we're breaking dma_buf_vmap
> > > > > for everyone
> > > > > else here.
> > > > =

> > > > I removed the text on the importer. These notes for callers in
> > > > the docs are
> > > > more or less a consequence of the exporter semantics.
> > > =

> > > Callers are importers, so I'm not seeing how that fixes anything.
> > > =

> > > > I thought we at least agreed on the exporter semantics in the
> > > > other thread,
> > > > didn't we?
> > > > =

> > > > What I'm trying to do is to write dome some rules for exporters,
> > > > even if not
> > > > all exporters follow them.
> > > =

> > > This is a standard interface, everyone needs to follow the same
> > > rules. And
> > > if they change, we need to make sure nothing breaks and we're not
> > > creating
> > > issues.
> > > =

> > > In the past the rule was the dma_buf_vmap was allowed to take the
> > > dma_resv_lock, and that the buffer should be pinned. Now some ttm
> > > drivers
> > > didn't ever bother with the pinning, and mostly got away with that
> > > because
> > > drm_prime helpers do the pinning by default at attach time, and most
> > > users
> > > do call dma_buf_attach.
> > > =

> > > But if you look through dma-buf docs nothing ever said you have to do=
 a
> > > dummy attachment before you call dma_buf_vmap, that's just slightly
> > > crappy
> > > implementations that didn't blow up yet.
> > =

> > I had a patch for adding pin to radeon's implementation of vmap. [1]
> > Christian told me to not do this; instead just get the lock in the fbdev
> > code. His advise almost seems the opposite of what you're telling me
> > here.
> =

> I think what Daniel suggests here is that we need to smoothly transition =
the
> code from making assumptions to having a straight interface where importe=
rs
> explicitly say when stuff is locked and when stuff is pinned.
> =

> I've started this with the attach interface by adding a new dynamic appro=
ach
> to that, but you probably need to carry on here with that for vmap as wel=
l.
> =

> When that is done we can migrate every exporter over to the new dynamic
> approach.
> =

> > =

> > For the GEM VRAM helpers, that implicit pin in vmap gave me headaches.
> > Because scanouts can only be done from VRAM, which is badly suited for
> > exporting. So I ended up with an implicit pin that pins the buffer to
> > whatever domain it currently is. I got away with it because GEM VRAM BOs
> > are not sharable among devices; fbdev is the only user of that
> > functionality and only pins for short periods of time.
> > =

> > I suspect that fixing TTM-based drivers by adding an implicit pin would
> > result in a similar situation. Whatever domain it ends up pinning, some
> > functionality might not be compatible with that.
> =

> Correct, exactly that's the problem.
> =

> > =

> > > =

> > > > Given the circumstances, we should leave out this patch from the
> > > > patchset.
> > > =

> > > So the defacto rules are already a big mess, but that's not a good
> > > excuse
> > > to make it worse.
> > > =

> > > What I had in mind is that we split dma_buf_vmap up into two variants:
> > > =

> > > - The current one, which should guarantee that the buffer is pinned.
> > > =A0=A0 Because that's what all current callers wanted, before the fbd=
ev code
> > > =A0=A0 started allowing non-pinned buffers.
> > =

> > Can we add an explicit pin operation to dma_buf_vmap() to enforce the
> > semantics?
> =

> At least I would be fine with that. For now amdgpu is the only exporter w=
ho
> implements the explicit pin/unpin semantics anyway.

Yup, I think that makes sense (if it works). Maybe we could use something
like:

a) dma_buf pin exists, driver is dynamic. This means dma_buf_vmap needs to
first pin, then call ->vmap. dma_buf_vmap_local otoh can directly call
->vmap since the exporter relies on either a pin or dma_resv_lock.

b) dma_buf pin not implement, driver is a legacy pile. dma_buf_vmap will
pin (somewhere at least, or rely on some implicit pin), dma_buf_vmap_local
doesn't work and should fail.

I think for less transition work fbdev helpers could first try
dma_resv_lock + dma_buf_vmap_local, if that fails, drop the dma_resv_lock
and do the pinning dma_buf_vmap. That way we don't have to convert shmem
helpers over to dma_resv locking, which should help.

And ttm drivers would do the new clean interface, so at least everyone
using dma_resv today is all fine. Intel's conversion to dma_resv lock is
in-flight, but that needs a conversion to the dynamic interface anyway,
the current code splats. And dynamic brings means explicit pin/unpin
callbacks, so should be good too.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > Best regards
> > Thomas
> > =

> > [1] https://patchwork.freedesktop.org/patch/400054/?series=3D83765&rev=
=3D1
> > =

> > > =

> > > - The new one, which allows vmapping with just dma_resv locked, and
> > > should
> > > =A0=A0 have some caching in exporters.
> > > =

> > > Breaking code and then adding todos about that is kinda not so cool
> > > approach here imo.
> > > =

> > > Also I guess ttm_bo_vmap should have a check that either the buffer is
> > > pinned, or dma_resv_lock is held.
> > > =

> > > Cheers, Daniel
> > > =

> > > =

> > > =

> > > > =

> > > > Best regards
> > > > Thomas
> > > > =

> > > > > =

> > > > > > ---
> > > > > > =A0=A0 Documentation/gpu/todo.rst | 15 +++++++++++++
> > > > > > =A0=A0 include/drm/drm_gem.h=A0=A0=A0=A0=A0 |=A0 4 ++++
> > > > > > =A0=A0 include/linux/dma-buf.h=A0=A0=A0 | 45
> > > > > > ++++++++++++++++++++++++++++++++++++++
> > > > > > =A0=A0 3 files changed, 64 insertions(+)
> > > > > > =

> > > > > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/tod=
o.rst
> > > > > > index 009d8e6c7e3c..32bb797a84fc 100644
> > > > > > --- a/Documentation/gpu/todo.rst
> > > > > > +++ b/Documentation/gpu/todo.rst
> > > > > > @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann
> > > > > > <tzimmermann@suse.de>, Christian K=F6nig, Daniel Vette
> > > > > > =A0=A0 Level: Intermediate
> > > > > > +Enforce rules for dma-buf vmap and pin ops
> > > > > > +------------------------------------------
> > > > > > +
> > > > > > +Exporter implementations of vmap and pin in struct
> > > > > > dma_buf_ops (and consequently
> > > > > > +struct drm_gem_object_funcs) use a variety of locking
> > > > > > semantics. Some rely on
> > > > > > +the caller holding the dma-buf's reservation lock, some
> > > > > > do their own locking,
> > > > > > +some don't require any locking. VRAM helpers even used
> > > > > > to pin as part of vmap.
> > > > > > +
> > > > > > +We need to review each exporter and enforce the documented rul=
es.
> > > > > > +
> > > > > > +Contact: Christian K=F6nig, Daniel Vetter, Thomas
> > > > > > Zimmermann <tzimmermann@suse.de>
> > > > > > +
> > > > > > +Level: Advanced
> > > > > > +
> > > > > > +
> > > > > > =A0=A0 Core refactorings
> > > > > > =A0=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > > > index 5e6daa1c982f..1864c6a721b1 100644
> > > > > > --- a/include/drm/drm_gem.h
> > > > > > +++ b/include/drm/drm_gem.h
> > > > > > @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
> > > > > > =A0=A0=A0=A0=A0=A0=A0 * drm_gem_dmabuf_vmap() helper.
> > > > > > =A0=A0=A0=A0=A0=A0=A0 *
> > > > > > =A0=A0=A0=A0=A0=A0=A0 * This callback is optional.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * See also struct dma_buf_ops.vmap
> > > > > > =A0=A0=A0=A0=A0=A0=A0 */
> > > > > > =A0=A0=A0=A0=A0=A0 int (*vmap)(struct drm_gem_object *obj, stru=
ct
> > > > > > dma_buf_map *map);
> > > > > > @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
> > > > > > =A0=A0=A0=A0=A0=A0=A0 * drm_gem_dmabuf_vunmap() helper.
> > > > > > =A0=A0=A0=A0=A0=A0=A0 *
> > > > > > =A0=A0=A0=A0=A0=A0=A0 * This callback is optional.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * See also struct dma_buf_ops.vunmap
> > > > > > =A0=A0=A0=A0=A0=A0=A0 */
> > > > > > =A0=A0=A0=A0=A0=A0 void (*vunmap)(struct drm_gem_object *obj, s=
truct
> > > > > > dma_buf_map *map);
> > > > > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > > > > index cf72699cb2bc..dc81fdc01dda 100644
> > > > > > --- a/include/linux/dma-buf.h
> > > > > > +++ b/include/linux/dma-buf.h
> > > > > > @@ -267,7 +267,52 @@ struct dma_buf_ops {
> > > > > > =A0=A0=A0=A0=A0=A0=A0 */
> > > > > > =A0=A0=A0=A0=A0=A0 int (*mmap)(struct dma_buf *, struct vm_area=
_struct *vma);
> > > > > > +=A0=A0=A0 /**
> > > > > > +=A0=A0=A0=A0 * @vmap:
> > > > > =

> > > > > There's already a @vmap and @vunamp kerneldoc at the top comment,=
 that
> > > > > needs to be removed.
> > > > > -Daniel
> > > > > =

> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * Returns a virtual address for the buffer.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * Notes to callers:
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * - Callers must hold the struct dma_buf.resv lock
> > > > > > before calling
> > > > > > +=A0=A0=A0=A0 *=A0=A0 this interface.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * - Callers must provide means to prevent the
> > > > > > mappings from going
> > > > > > +=A0=A0=A0=A0 *=A0=A0 stale, such as holding the reservation lo=
ck or providing a
> > > > > > +=A0=A0=A0=A0 *=A0=A0 move-notify callback to the exporter.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * Notes to implementors:
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * - Implementations must expect pairs of @vmap and
> > > > > > @vunmap to be
> > > > > > +=A0=A0=A0=A0 *=A0=A0 called frequently and should optimize for=
 this case.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * - Implementations should avoid additional opera=
tions, such as
> > > > > > +=A0=A0=A0=A0 *=A0=A0 pinning.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * - Implementations may expect the caller to hold=
 the dma-buf's
> > > > > > +=A0=A0=A0=A0 *=A0=A0 reservation lock to protect against concu=
rrent calls and
> > > > > > +=A0=A0=A0=A0 *=A0=A0 relocation.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * - Implementations may provide additional
> > > > > > guarantees, such as working
> > > > > > +=A0=A0=A0=A0 *=A0=A0 without holding the reservation lock.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * This callback is optional.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * Returns:
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * 0 on success or a negative error code on failur=
e.
> > > > > > +=A0=A0=A0=A0 */
> > > > > > =A0=A0=A0=A0=A0=A0 int (*vmap)(struct dma_buf *dmabuf, struct d=
ma_buf_map *map);
> > > > > > +
> > > > > > +=A0=A0=A0 /**
> > > > > > +=A0=A0=A0=A0 * @vunmap:
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * Releases the address previously returned by @vm=
ap.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * This callback is optional.
> > > > > > +=A0=A0=A0=A0 *
> > > > > > +=A0=A0=A0=A0 * See also @vmap()
> > > > > > +=A0=A0=A0=A0 */
> > > > > > =A0=A0=A0=A0=A0=A0 void (*vunmap)(struct dma_buf *dmabuf, struct
> > > > > > dma_buf_map *map);
> > > > > > =A0=A0 };
> > > > > > -- =

> > > > > > 2.29.2
> > > > > > =

> > > > > =

> > > > =

> > > > -- =

> > > > Thomas Zimmermann
> > > > Graphics Driver Developer
> > > > SUSE Software Solutions Germany GmbH
> > > > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > > > (HRB 36809, AG N=FCrnberg)
> > > > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > > > =

> > > =

> > > =

> > > =

> > > =

> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
