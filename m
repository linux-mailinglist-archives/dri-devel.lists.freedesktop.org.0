Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD92DE40C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFC36E0F6;
	Fri, 18 Dec 2020 14:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0750F6E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:30:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 190so2533639wmz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VVM1v56DoUti6dx/dKRWAI3CHXJoVJMQZgrNm3EbUAQ=;
 b=NPPjpOE+3n6qcILCnP6HXHc26zXRKCd9QKz/eK/oaiyAFVcjZxjbupMedJxF07DDxu
 dzjLYyjB0WVeaNfHqHOPiBxiyGrjqm5PICkz2UZwreR5XIJc2UQGQHd+aIgDN+E55Q8m
 8J348qqJj6dH0pDl4EgNHWtOAkeYjwMfJ2pTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VVM1v56DoUti6dx/dKRWAI3CHXJoVJMQZgrNm3EbUAQ=;
 b=rwSvLG3s/QhxTF7K7RXca4esSSO/sJPRJM8E9ugOf6e93f+g0j33upLD624w4GN740
 J4q4Zitr1TR+G76J7zCo3aQOK8AVkSReUlMXbJfXHVUZ1N085AJAOxNcE6dtJBoJ1qov
 czlcbrwWRnMlGCUXf0fqmAsziwn+i/UCjoqMTNpNB/xxtTOHWNHPI2kTsPs+AQuFp61u
 S/JBm6KPrrcpE1Ex58Lzww7U7QL8A2w8i52FwALXzeKiJt09ZLkm7vixrPkfpqXQsO3j
 E7THkOVU/uPW78xjKP9X0wewzfFovNNOwpYp9uW2PgTZI1IzNMJy+72S/MtfYGjWJx0l
 E1tg==
X-Gm-Message-State: AOAM533OGrCEbHB/2QsSHiDGD5eoz2MoJK0wHj0QXV4JbqHFuhA9v9x6
 3OIOTMef50TB4c0Ifan3iMG92xiConSCoA==
X-Google-Smtp-Source: ABdhPJwi1tmOS76zbyTcN9wCTzRtcMOIS857KbLiEJCiKIsjd1UiUiokEfX0AGdGBKQ/rsyJ40TSVA==
X-Received: by 2002:a1c:e1c6:: with SMTP id y189mr4416450wmg.172.1608301829473; 
 Fri, 18 Dec 2020 06:30:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y68sm13662732wmc.0.2020.12.18.06.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 06:30:28 -0800 (PST)
Date: Fri, 18 Dec 2020 15:30:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Message-ID: <X9y9Asbm7YLGAqHD@phenom.ffwll.local>
References: <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
 <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
 <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
 <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
 <X9tIrE0Ak68HJ391@phenom.ffwll.local>
 <864df6cc-33f4-6624-6756-5a171ad7ed4f@amd.com>
 <e1549b76-eed4-fa91-88c6-083e0dfe5595@amd.com>
 <cf18edc7-e1a6-7a6e-3944-63f3463577b9@amd.com>
 <CAKMK7uF5NRARdA1BrsYSBgYw-ioTc_P54LXLCi4LQ21S3NZc1Q@mail.gmail.com>
 <19ec7cb6-e1aa-e4ac-9cb1-a08d60c07af4@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19ec7cb6-e1aa-e4ac-9cb1-a08d60c07af4@amd.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 04:06:38PM -0500, Andrey Grodzovsky wrote:
> =

> On 12/17/20 3:48 PM, Daniel Vetter wrote:
> > On Thu, Dec 17, 2020 at 9:38 PM Andrey Grodzovsky
> > <Andrey.Grodzovsky@amd.com> wrote:
> > > =

> > > On 12/17/20 3:10 PM, Christian K=F6nig wrote:
> > > > [SNIP]
> > > > > > > By eliminating such users, and replacing them with local maps=
 which
> > > > > > > > are strictly bound in how long they can exist (and hence we=
 can
> > > > > > > > serialize against them finishing in our hotunplug code).
> > > > > > > Not sure I see how serializing against BO map/unmap helps - o=
ur problem as
> > > > > > > you described is that once
> > > > > > > device is extracted and then something else quickly takes it'=
s place in the
> > > > > > > PCI topology
> > > > > > > and gets assigned same physical IO ranges, then our driver wi=
ll start
> > > > > > > accessing this
> > > > > > > new device because our 'zombie' BOs are still pointing to tho=
se ranges.
> > > > > > Until your driver's remove callback is finished the ranges stay=
 reserved.
> > > > > =

> > > > > The ranges stay reserved until unmapped which happens in bo->dest=
roy
> > > > I'm not sure of that. Why do you think that?
> > > =

> > > Because of this sequence
> > > ttm_bo_release->destroy->amdgpu_bo_destroy->amdgpu_bo_kunmap->...->io=
unmap
> > > Is there another place I am missing ?
> > iounmap is just the mapping, it doesn't reserve anything in the resourc=
e tree.
> > =

> > And I don't think we should keep resources reserved past the pci
> > remove callback, because that would upset the pci subsystem trying to
> > assign resources to a newly hotplugged pci device.
> =

> =

> I assumed we are talking about VA ranges still mapped in the page table. I
> just assumed
> that part of ioremap is also reservation of the mapped physical ranges. In
> fact, if we
> do can explicitly reserve those ranges (as you mention here) then together
> with postponing
> system memory pages freeing/releasing back to the page pool until after BO
> is unmapped
> from the kernel address space I believe this could solve the issue of qui=
ck
> HW reinsertion
> and make all the drm_dev_ener/exit guarding obsolete.

We can't reserve these ranges, that's what I tried to explaine:
- kernel/resource.c isn't very consistently used
- the pci core will get pissed if there's suddenly a range in the middle
  of a bridge that it can't use
- nesting is allowed for resources, so this doesn't actually garuantee
  much

I just wanted to point out that ioremap does do any reserving, so not
enough by far.

We really have to stop using any mmio ranges before the pci remove
callback is finished.
-Daniel

> =

> Andrey
> =

> =

> > Also from a quick check amdgpu does not reserve the pci bars it's
> > using. Somehow most drm drivers don't do that, not exactly sure why,
> > maybe auto-enumeration of resources just works too good and we don't
> > need the safety net of kernel/resource.c anymore.
> > -Daniel
> > =

> > =

> > > > > which for most internally allocated buffers is during sw_fini whe=
n last drm_put
> > > > > is called.
> > > > > =

> > > > > =

> > > > > > If that's not the case, then hotunplug would be fundamentally i=
mpossible
> > > > > > ot handle correctly.
> > > > > > =

> > > > > > Of course all the mmio actions will time out, so it might take =
some time
> > > > > > to get through it all.
> > > > > =

> > > > > I found that PCI code provides pci_device_is_present function
> > > > > we can use to avoid timeouts - it reads device vendor and checks =
if all 1s is
> > > > > returned
> > > > > or not. We can call it from within register accessors before tryi=
ng read/write
> > > > That's way to much overhead! We need to keep that much lower or it =
will result
> > > > in quite a performance drop.
> > > > =

> > > > I suggest to rather think about adding drm_dev_enter/exit guards.
> > > =

> > > Sure, this one is just a bit upstream to the disconnect event. Eventu=
ally none
> > > of them is watertight.
> > > =

> > > Andrey
> > > =

> > > =

> > > > Christian.
> > > > =

> > > > > > > Another point regarding serializing - problem  is that some o=
f those BOs are
> > > > > > > very long lived, take for example the HW command
> > > > > > > ring buffer Christian mentioned before -
> > > > > > > (amdgpu_ring_init->amdgpu_bo_create_kernel), it's life span
> > > > > > > is basically for the entire time the device exists, it's dest=
royed only in
> > > > > > > the SW fini stage (when last drm_dev
> > > > > > > reference is dropped) and so should I grab it's dma_resv_lock=
 from
> > > > > > > amdgpu_pci_remove code and wait
> > > > > > > for it to be unmapped before proceeding with the PCI remove c=
ode ? This can
> > > > > > > take unbound time and that why I don't understand
> > > > > > > how serializing will help.
> > > > > > Uh you need to untangle that. After hw cleanup is done no one i=
s allowed
> > > > > > to touch that ringbuffer bo anymore from the kernel.
> > > > > =

> > > > > I would assume we are not allowed to touch it once we identified =
the device is
> > > > > gone in order to minimize the chance of accidental writes to some=
 other
> > > > > device which might now
> > > > > occupy those IO ranges ?
> > > > > =

> > > > > =

> > > > > >    That's what
> > > > > > drm_dev_enter/exit guards are for. Like you say we cant wait fo=
r all sw
> > > > > > references to disappear.
> > > > > =

> > > > > Yes, didn't make sense to me why would we use vmap_local for inte=
rnally
> > > > > allocated buffers. I think we should also guard registers read/wr=
ites for the
> > > > > same reason as above.
> > > > > =

> > > > > =

> > > > > > The vmap_local is for mappings done by other drivers, through t=
he dma-buf
> > > > > > interface (where "other drivers" can include fbdev/fbcon, if yo=
u use the
> > > > > > generic helpers).
> > > > > > -Daniel
> > > > > =

> > > > > Ok, so I assumed that with vmap_local you were trying to solve th=
e problem of
> > > > > quick reinsertion
> > > > > of another device into same MMIO range that my driver still point=
s too but
> > > > > actually are you trying to solve
> > > > > the issue of exported dma buffers outliving the device ? For this=
 we have
> > > > > drm_device refcount in the GEM layer
> > > > > i think.
> > > > > =

> > > > > Andrey
> > > > > =

> > > > > =

> > > > > > > Andrey
> > > > > > > =

> > > > > > > =

> > > > > > > > It doesn't
> > > > > > > > solve all your problems, but it's a tool to get there.
> > > > > > > > -Daniel
> > > > > > > > =

> > > > > > > > > Andrey
> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > > - handle fbcon somehow. I think shutting it all down sh=
ould work out.
> > > > > > > > > > - worst case keep the system backing storage around for=
 shared dma-buf
> > > > > > > > > > until the other non-dynamic driver releases it. for vra=
m we require
> > > > > > > > > > dynamic importers (and maybe it wasn't such a bright id=
ea to allow
> > > > > > > > > > pinning of importer buffers, might need to revisit that=
).
> > > > > > > > > > =

> > > > > > > > > > Cheers, Daniel
> > > > > > > > > > =

> > > > > > > > > > > Christian.
> > > > > > > > > > > =

> > > > > > > > > > > > Andrey
> > > > > > > > > > > > =

> > > > > > > > > > > > =

> > > > > > > > > > > > > -Daniel
> > > > > > > > > > > > > =

> > > > > > > > > > > > > > Christian.
> > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > I loaded the driver with vm_update_mode=3D3
> > > > > > > > > > > > > > > meaning all VM updates done using CPU and has=
n't seen any OOPs after
> > > > > > > > > > > > > > > removing the device. I guess i can test it mo=
re by allocating GTT and
> > > > > > > > > > > > > > > VRAM BOs
> > > > > > > > > > > > > > > and trying to read/write to them after device=
 is removed.
> > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > Andrey
> > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > > Regards,
> > > > > > > > > > > > > > > > Christian.
> > > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > > > Andrey
> > > > > > > > > > > > > > > _____________________________________________=
__
> > > > > > > > > > > > > > > amd-gfx mailing list
> > > > > > > > > > > > > > > amd-gfx@lists.freedesktop.org
> > > > > > > > > > > > > > > https://nam11.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx=
&amp;data=3D04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cc632e5bd5a1f402ac40608d=
8a2cd2072%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637438349203619335%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3DtKk0GTmSnkLVV42HuQaPAj01qFiwDW6Zs%2Bgi2ho=
q%2BvA%3D&amp;reserved=3D0
> > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > =

> > =

> > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
