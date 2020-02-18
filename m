Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D76162F5D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 20:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5F089CAA;
	Tue, 18 Feb 2020 19:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC1B6EA6F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 19:06:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y11so25292834wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 11:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=I0FrOe1BlsCvUhVQbSIwmq4j2Vf1zPMnbzTLrxEbFx4=;
 b=imV7PORUgPGro6SiQS1+47KTtTI3ui/vPCJrpiMPZsRe8SQFZDDTRVrb70my7MCONx
 cI7QQdgjzv6gtBYfItYnlbwYn5Wm45mxRLTn0l0k+3K6rHQ8RNgzAu8k00tYHBr0KBjF
 yrKO5FYp3/BIpvF9+ZUp79uYJZvNsx1146huk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=I0FrOe1BlsCvUhVQbSIwmq4j2Vf1zPMnbzTLrxEbFx4=;
 b=oIr22A15eL5AnPAtHf3755JW8rUyWTc8aTg71HtmlcLuUatF4KtKj7Z7aTutsiSv6c
 clqFY0TtDwLH9GsCs1KQGCzGbhXPHdvfHQjtflGM3G8npebIJ0XeUWKNmyXYy1e0pmwL
 WwuK/zp0QbQzP4bhryuyat3rER5T7aKltcQnHvpiKalOLzbV7axsFPnEQZokmwYRhGFt
 qhNpumwDD91GrVWMpnbLOMHtJspjmCGzzLpifXwlWoHWmeeVN+1uouPC7sSjJK72KMfH
 yeiCB11tWq3h2CP4NRRa91XujBSR2ksh2YwKXCoIf8WIGrU9uwIKQx4dFMZ54KWdv3+X
 dHxw==
X-Gm-Message-State: APjAAAX2YgLQdRNTcJTysPn40e7V2eis4vPoePd6e9zKEnXUA4gYnFSr
 mDsq6dPg8o2Y/bfPtMr+rqYz+A==
X-Google-Smtp-Source: APXvYqzSBD16HVfcIocmRPGYaFBcoM8x3FUH7uSSeU+UFLIJJaeBhUpwkNf8atuuPQ1m0UhGrsZBmg==
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr30747801wrq.415.1582052802193; 
 Tue, 18 Feb 2020 11:06:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s15sm6945079wrp.4.2020.02.18.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:06:41 -0800 (PST)
Date: Tue, 18 Feb 2020 20:06:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [Nouveau] [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
Message-ID: <20200218190639.GM2363188@phenom.ffwll.local>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
 <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
 <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
 <31b0cac7-82c7-60ad-830b-66f7838a1047@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31b0cac7-82c7-60ad-830b-66f7838a1047@gmail.com>
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
Cc: thellstrom@vmware.com, kraxel@redhat.com, airlied@linux.ie,
 kenny.ho@amd.com, Nirmoy <nirmodas@amd.com>, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 07:37:44PM +0100, Christian K=F6nig wrote:
> Am 18.02.20 um 19:28 schrieb Thomas Zimmermann:
> > Hi
> > =

> > Am 18.02.20 um 19:23 schrieb Christian K=F6nig:
> > > Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
> > > > Hi
> > > > =

> > > > Am 18.02.20 um 18:13 schrieb Nirmoy:
> > > > > On 2/18/20 1:44 PM, Christian K=F6nig wrote:
> > > > > > Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
> > > > > > > Hi
> > > > > > > =

> > > > > > > Am 17.02.20 um 16:04 schrieb Nirmoy Das:
> > > > > > > > GPU address handling is device specific and should be handl=
e by its
> > > > > > > > device
> > > > > > > > driver.
> > > > > > > > =

> > > > > > > > Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> > > > > > > > ---
> > > > > > > >  =A0=A0 drivers/gpu/drm/ttm/ttm_bo.c=A0=A0=A0 | 7 -------
> > > > > > > >  =A0=A0 include/drm/ttm/ttm_bo_api.h=A0=A0=A0 | 2 --
> > > > > > > >  =A0=A0 include/drm/ttm/ttm_bo_driver.h | 1 -
> > > > > > > >  =A0=A0 3 files changed, 10 deletions(-)
> > > > > > > > =

> > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > index 151edfd8de77..d5885cd609a3 100644
> > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > > @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
> > > > > > > > ttm_bo_device *bdev, struct drm_printer *p
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 has_type: %d\n=
", man->has_type);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 use_type: %d\n=
", man->use_type);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 flags: 0x%08X\=
n", man->flags);
> > > > > > > > -=A0=A0=A0 drm_printf(p, "=A0=A0=A0 gpu_offset: 0x%08llX\n"=
, man->gpu_offset);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 size: %llu\n",=
 man->size);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 available_cach=
ing: 0x%08X\n",
> > > > > > > > man->available_caching);
> > > > > > > >  =A0=A0=A0=A0=A0=A0 drm_printf(p, "=A0=A0=A0 default_cachin=
g: 0x%08X\n",
> > > > > > > > man->default_caching);
> > > > > > > > @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(stru=
ct
> > > > > > > > ttm_buffer_object *bo,
> > > > > > > >  =A0=A0 moved:
> > > > > > > >  =A0=A0=A0=A0=A0=A0 bo->evicted =3D false;
> > > > > > > >  =A0=A0 -=A0=A0=A0 if (bo->mem.mm_node)
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 bo->offset =3D (bo->mem.start << PAG=
E_SHIFT) +
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bdev->man[bo->mem.mem_ty=
pe].gpu_offset;
> > > > > > > > -=A0=A0=A0 else
> > > > > > > > -=A0=A0=A0=A0=A0=A0=A0 bo->offset =3D 0;
> > > > > > > > -
> > > > > > > After moving this into users, the else branch has been lost. =
Is
> > > > > > > 'bo->mem.mm_node' always true?
> > > > > > At least for the amdgpu and radeon use cases, yes.
> > > > > > =

> > > > > > But that is a rather good question I mean for it is illegal to =
get the
> > > > > > GPU BO address if it is inaccessible (e.g. in the system domain=
).
> > > > > > =

> > > > > > Could be that some driver relied on the behavior to get 0 for t=
he
> > > > > > system domain here.
> > > > > I wonder how to verify that ?
> > > > > =

> > > > > If I understand correctly:
> > > > > =

> > > > > 1 qxl uses bo->offset only in qxl_bo_physical_address() which is =
not in
> > > > > system domain.
> > > > > =

> > > > > 2 unfortunately I can't say the same for bochs but it works with =
this
> > > > > patch series so I think bochs is fine as well.
> > > > > =

> > > > > 3 vmwgfx uses bo->offset only when bo->mem.mem_type =3D=3D TTM_PL=
_VRAM so
> > > > > vmwgfx should be fine.
> > > > > =

> > > > > 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
> > > > > =

> > > > > I am not sure about=A0 nouveau as bo->offset is being used in man=
y places.
> > > > > =

> > > > > I could probably mirror the removed logic to nouveau as
> > > > I suggest to introduce a ttm helper that contains the original bran=
ching
> > > > and use it everywhere. Something like
> > > > =

> > > >  =A0=A0 s64 ttm_bo_offset(struct ttm_buffer_object *bo)
> > > >  =A0=A0 {
> > > >  =A0=A0=A0=A0=A0 if (WARN_ON_ONCE(!bo->mem.mm_node))
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> > > >  =A0=A0=A0=A0=A0 return bo->mem.start << PAGE_SHIFT;
> > > >  =A0=A0 }
> > > > =

> > > > Could be static inline. The warning should point to broken drivers.=
 This
> > > > also gets rid of the ugly shift in the drivers.
> > > Big NAK on this. That is exactly what we should NOT do.
> > > =

> > > See the shift belongs into the driver, because it is driver dependent=
 if
> > > we work with page or byte offsets.
> > > =

> > > For amdgpu we for example want to work with byte offsets and TTM shou=
ld
> > > not make any assumption about what bo->mem.start actually contains.
> > OK. What about something like ttm_bo_pg_offset()? Same code without the
> > shift. Would also make it clear that it's a page offset.
> =

> That is a rather good idea. We could name that ttm_bo_man_offset() and put
> it into ttm_bo_manager.c next to the manager which allocates them.
> =

> It's just that this manager is not used by everybody, so amdgpu, radeon a=
nd
> nouveau would still need a separate function.

Let me pile on with my bikeshed color choice :-)

I'd do this a wrapper, but for drivers individually. And only for those we
haven't audited yet, or where we think the WARN_ON actually provides
value. So maybe in vram helpers, since that might be used by some drivers
that get stuff wrong. Or maybe noveau isn't audited yet.

That also sidesteps the "what should we call this, drivers are different?"
problem.

Anyway feel free to ignore me, really just a bikeshed at this point.

Cheers, Daniel

> =

> Christian.
> =

> > =

> > Best regards
> > Thomas
> > =

> > > Regards,
> > > Christian.
> > > =

> > > > Best regards
> > > > Thomas
> > > > =

> > > > =

> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > index f8015e0318d7..5a6a2af91318 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > > > @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_obj=
ect
> > > > > *bo, bool evict,
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_e=
ntry(vma, &nvbo->vma_list, head) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 nouveau_vma_map(vma, mem);
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (bo->mem.mm_node)
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 nvbo->offset =3D (new_reg->start << PAGE_SHIFT);
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 nvbo->offset =3D 0;
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0 } else {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_e=
ntry(vma, &nvbo->vma_list, head) {
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 WARN_ON(ttm_bo_wait(bo, false, false));
> > > > > =

> > > > > Regards,
> > > > > =

> > > > > Nirmoy
> > > > > =

> > > > > =

> > > > > > Regards,
> > > > > > Christian.
> > > > > > =

> > > > > > > Best regards
> > > > > > > Thomas
> > > > > > > =

> > > > > > > >  =A0=A0=A0=A0=A0=A0 ctx->bytes_moved +=3D bo->num_pages << =
PAGE_SHIFT;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 return 0;
> > > > > > > >  =A0=A0 diff --git a/include/drm/ttm/ttm_bo_api.h
> > > > > > > > b/include/drm/ttm/ttm_bo_api.h
> > > > > > > > index b9bc1b00142e..d6f39ee5bf5d 100644
> > > > > > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > > > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > > > > > @@ -213,8 +213,6 @@ struct ttm_buffer_object {
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * either of these locks held.
> > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 */
> > > > > > > >  =A0=A0 -=A0=A0=A0 uint64_t offset; /* GPU address space is=
 independent of CPU
> > > > > > > > word size */
> > > > > > > > -
> > > > > > > >  =A0=A0=A0=A0=A0=A0 struct sg_table *sg;
> > > > > > > >  =A0=A0 };
> > > > > > > >  =A0=A0 diff --git a/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > b/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > index c9e0fd09f4b2..c8ce6c181abe 100644
> > > > > > > > --- a/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > +++ b/include/drm/ttm/ttm_bo_driver.h
> > > > > > > > @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
> > > > > > > >  =A0=A0=A0=A0=A0=A0 bool has_type;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 bool use_type;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint32_t flags;
> > > > > > > > -=A0=A0=A0 uint64_t gpu_offset; /* GPU address space is ind=
ependent of CPU
> > > > > > > > word size */
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint64_t size;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint32_t available_caching;
> > > > > > > >  =A0=A0=A0=A0=A0=A0 uint32_t default_caching;
> > > > > > > > =

> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> =


> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
