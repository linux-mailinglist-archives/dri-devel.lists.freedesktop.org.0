Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E6A2DD0FE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C2489850;
	Thu, 17 Dec 2020 12:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B5A89850
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:01:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k10so5324743wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qad4pjOxuhwlAXyru47I7iLdTyF8wvpq+mUMTbhJ9B4=;
 b=YOVGFEQg43JlqMiMgqvQynn8TC1rokGHjSsmI3GUDU2Dcbgmj9+x2aI4VQGefvJ7Nm
 MtIVlPuTx1f3OkmjisOHWg9YoBOJ+s9sL4rGbmM2OIJC2xBmb/TiFmmwwV2thuEZHeWN
 j5qH5w1aAF/VdBH6YjUa1cX7ndyBi8rHCF40g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qad4pjOxuhwlAXyru47I7iLdTyF8wvpq+mUMTbhJ9B4=;
 b=NEqk0Ip/nmmKJ4dx6xxzvy45ggCEc6G/ocVDJ/104KFBA7VTMj+hz4bB9etor29/pG
 iD8C0AEWao6PDWMtQjZtyiE8waMlyazdCSxgBoKw/DOWZcJRDfgoUsOfSrtNO3VfA2++
 Bj8PmzC+b6tBMQW/rYVILlhbsjNDg3nm30KiaNo1xt7tDCv1lFtuPMkgtPlA41E5AxPy
 6K83tkEIy0hz/ZqVr7TN52dIkEy+840B3fFcYDwY+3+R3ccZFn/y+j52l3IulmM+DuF7
 YB3Kj71dr84W0fofwmVJF0dHQgwXDao4/119lz/IOEs4f/SdpSGu03FFp1CDPqnBnfnY
 PgWg==
X-Gm-Message-State: AOAM531aOr1iT0KIM9j5BXOQIua+fpVANmgNAA3LevC/WN/dLLx1iWdC
 /njm+R/6pvBDQaUnMGbEHBk9FA==
X-Google-Smtp-Source: ABdhPJxuVzYVTp1qqHUyzIbYOcCvfOVktllVUHtAhdVD9aVTqsmZRUPqUWL545WLcv5e5G96uPx6Cw==
X-Received: by 2002:a1c:e246:: with SMTP id z67mr8205895wmg.166.1608206511251; 
 Thu, 17 Dec 2020 04:01:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm9066824wrb.73.2020.12.17.04.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:01:50 -0800 (PST)
Date: Thu, 17 Dec 2020 13:01:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
Message-ID: <X9tIrE0Ak68HJ391@phenom.ffwll.local>
References: <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
 <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
 <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
 <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
 <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
 <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 Qiang Yu <yuq825@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 07:20:02PM -0500, Andrey Grodzovsky wrote:
> =

> On 12/16/20 6:15 PM, Daniel Vetter wrote:
> > On Wed, Dec 16, 2020 at 7:26 PM Andrey Grodzovsky
> > <Andrey.Grodzovsky@amd.com> wrote:
> > > =

> > > On 12/16/20 12:12 PM, Daniel Vetter wrote:
> > > > On Wed, Dec 16, 2020 at 5:18 PM Christian K=F6nig
> > > > <christian.koenig@amd.com> wrote:
> > > > > Am 16.12.20 um 17:13 schrieb Andrey Grodzovsky:
> > > > > > On 12/16/20 9:21 AM, Daniel Vetter wrote:
> > > > > > > On Wed, Dec 16, 2020 at 9:04 AM Christian K=F6nig
> > > > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > > > > Am 15.12.20 um 21:18 schrieb Andrey Grodzovsky:
> > > > > > > > > [SNIP]
> > > > > > > > > > > While we can't control user application accesses to t=
he mapped
> > > > > > > > > > > buffers explicitly and hence we use page fault rerout=
ing
> > > > > > > > > > > I am thinking that in this  case we may be able to sp=
rinkle
> > > > > > > > > > > drm_dev_enter/exit in any such sensitive place were w=
e might
> > > > > > > > > > > CPU access a DMA buffer from the kernel ?
> > > > > > > > > > Yes, I fear we are going to need that.
> > > > > > > > > > =

> > > > > > > > > > > Things like CPU page table updates, ring buffer acces=
ses and FW
> > > > > > > > > > > memcpy ? Is there other places ?
> > > > > > > > > > Puh, good question. I have no idea.
> > > > > > > > > > =

> > > > > > > > > > > Another point is that at this point the driver should=
n't access any
> > > > > > > > > > > such buffers as we are at the process finishing the d=
evice.
> > > > > > > > > > > AFAIK there is no page fault mechanism for kernel map=
pings so I
> > > > > > > > > > > don't think there is anything else to do ?
> > > > > > > > > > Well there is a page fault handler for kernel mappings,=
 but that one
> > > > > > > > > > just prints the stack trace into the system log and cal=
ls BUG(); :)
> > > > > > > > > > =

> > > > > > > > > > Long story short we need to avoid any access to release=
d pages after
> > > > > > > > > > unplug. No matter if it's from the kernel or userspace.
> > > > > > > > > I was just about to start guarding with drm_dev_enter/exi=
t CPU
> > > > > > > > > accesses from kernel to GTT ot VRAM buffers but then i lo=
oked more in
> > > > > > > > > the code
> > > > > > > > > and seems like ttm_tt_unpopulate just deletes DMA mapping=
s (for the
> > > > > > > > > sake of device to main memory access). Kernel page table =
is not
> > > > > > > > > touched
> > > > > > > > > until last bo refcount is dropped and the bo is released
> > > > > > > > > (ttm_bo_release->destroy->amdgpu_bo_destroy->amdgpu_bo_ku=
nmap). This
> > > > > > > > > is both
> > > > > > > > > for GTT BOs maped to kernel by kmap (or vmap) and for VRA=
M BOs mapped
> > > > > > > > > by ioremap. So as i see it, nothing will bad will happen =
after we
> > > > > > > > > unpopulate a BO while we still try to use a kernel mappin=
g for it,
> > > > > > > > > system memory pages backing GTT BOs are still mapped and =
not freed and
> > > > > > > > > for
> > > > > > > > > VRAM BOs same is for the IO physical ranges mapped into t=
he kernel
> > > > > > > > > page table since iounmap wasn't called yet.
> > > > > > > > The problem is the system pages would be freed and if we ke=
rnel driver
> > > > > > > > still happily write to them we are pretty much busted becau=
se we write
> > > > > > > > to freed up memory.
> > > > > > OK, i see i missed ttm_tt_unpopulate->..->ttm_pool_free which w=
ill
> > > > > > release
> > > > > > the GTT BO pages. But then isn't there a problem in ttm_bo_rele=
ase since
> > > > > > ttm_bo_cleanup_memtype_use which also leads to pages release co=
mes
> > > > > > before bo->destroy which unmaps the pages from kernel page tabl=
e ? Won't
> > > > > > we have end up writing to freed memory in this time interval ? =
Don't we
> > > > > > need to postpone pages freeing to after kernel page table unmap=
ping ?
> > > > > BOs are only destroyed when there is a guarantee that nobody is
> > > > > accessing them any more.
> > > > > =

> > > > > The problem here is that the pages as well as the VRAM can be
> > > > > immediately reused after the hotplug event.
> > > > > =

> > > > > > > Similar for vram, if this is actual hotunplug and then replug=
, there's
> > > > > > > going to be a different device behind the same mmio bar range=
 most
> > > > > > > likely (the higher bridges all this have the same windows ass=
igned),
> > > > > > No idea how this actually works but if we haven't called iounma=
p yet
> > > > > > doesn't it mean that those physical ranges that are still mappe=
d into
> > > > > > page
> > > > > > table should be reserved and cannot be reused for another
> > > > > > device ? As a guess, maybe another subrange from the higher bri=
dge's
> > > > > > total
> > > > > > range will be allocated.
> > > > > Nope, the PCIe subsystem doesn't care about any ioremap still act=
ive for
> > > > > a range when it is hotplugged.
> > > > > =

> > > > > > > and that's bad news if we keep using it for current drivers. =
So we
> > > > > > > really have to point all these cpu ptes to some other place.
> > > > > > We can't just unmap it without syncing against any in kernel ac=
cesses
> > > > > > to those buffers
> > > > > > and since page faulting technique we use for user mapped buffer=
s seems
> > > > > > to not be possible
> > > > > > for kernel mapped buffers I am not sure how to do it gracefully=
...
> > > > > We could try to replace the kmap with a dummy page under the hood=
, but
> > > > > that is extremely tricky.
> > > > > =

> > > > > Especially since BOs which are just 1 page in size could point to=
 the
> > > > > linear mapping directly.
> > > > I think it's just more work. Essentially
> > > > - convert as much as possible of the kernel mappings to vmap_local,
> > > > which Thomas Zimmermann is rolling out. That way a dma_resv_lock wi=
ll
> > > > serve as a barrier, and ofc any new vmap needs to fail or hand out a
> > > > dummy mapping.
> > > Read those patches. I am not sure how this helps with protecting
> > > against accesses to released backing pages or IO physical ranges of BO
> > > which is already mapped during the unplug event ?
> > By eliminating such users, and replacing them with local maps which
> > are strictly bound in how long they can exist (and hence we can
> > serialize against them finishing in our hotunplug code).
> =

> Not sure I see how serializing against BO map/unmap helps -=A0 our proble=
m as
> you described is that once
> device is extracted and then something else quickly takes it's place in t=
he
> PCI topology
> and gets assigned same physical IO ranges, then our driver will start acc=
essing this
> new device because our 'zombie' BOs are still pointing to those ranges.

Until your driver's remove callback is finished the ranges stay reserved.
If that's not the case, then hotunplug would be fundamentally impossible
ot handle correctly.

Of course all the mmio actions will time out, so it might take some time
to get through it all.

> Another point regarding serializing - problem=A0 is that some of those BO=
s are
> very long lived, take for example the HW command
> ring buffer Christian mentioned before -
> (amdgpu_ring_init->amdgpu_bo_create_kernel), it's life span
> is basically for the entire time the device exists, it's destroyed only in
> the SW fini stage (when last drm_dev
> reference is dropped) and so should I grab it's dma_resv_lock from
> amdgpu_pci_remove code and wait
> for it to be unmapped before proceeding with the PCI remove code ? This c=
an
> take unbound time and that why I don't understand
> how serializing will help.

Uh you need to untangle that. After hw cleanup is done no one is allowed
to touch that ringbuffer bo anymore from the kernel. That's what
drm_dev_enter/exit guards are for. Like you say we cant wait for all sw
references to disappear.

The vmap_local is for mappings done by other drivers, through the dma-buf
interface (where "other drivers" can include fbdev/fbcon, if you use the
generic helpers).
-Daniel

> =

> Andrey
> =

> =

> > It doesn't
> > solve all your problems, but it's a tool to get there.
> > -Daniel
> > =

> > > Andrey
> > > =

> > > =

> > > > - handle fbcon somehow. I think shutting it all down should work ou=
t.
> > > > - worst case keep the system backing storage around for shared dma-=
buf
> > > > until the other non-dynamic driver releases it. for vram we require
> > > > dynamic importers (and maybe it wasn't such a bright idea to allow
> > > > pinning of importer buffers, might need to revisit that).
> > > > =

> > > > Cheers, Daniel
> > > > =

> > > > > Christian.
> > > > > =

> > > > > > Andrey
> > > > > > =

> > > > > > =

> > > > > > > -Daniel
> > > > > > > =

> > > > > > > > Christian.
> > > > > > > > =

> > > > > > > > > I loaded the driver with vm_update_mode=3D3
> > > > > > > > > meaning all VM updates done using CPU and hasn't seen any=
 OOPs after
> > > > > > > > > removing the device. I guess i can test it more by alloca=
ting GTT and
> > > > > > > > > VRAM BOs
> > > > > > > > > and trying to read/write to them after device is removed.
> > > > > > > > > =

> > > > > > > > > Andrey
> > > > > > > > > =

> > > > > > > > > =

> > > > > > > > > > Regards,
> > > > > > > > > > Christian.
> > > > > > > > > > =

> > > > > > > > > > > Andrey
> > > > > > > > > _______________________________________________
> > > > > > > > > amd-gfx mailing list
> > > > > > > > > amd-gfx@lists.freedesktop.org
> > > > > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D=
04%7C01%7CAndrey.Grodzovsky%40amd.com%7C5849827698d1428065d408d8a2188518%7C=
3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637437573486129589%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;sdata=3Duahs3RgQxLpUJ9hCzE8pvK9UWFCpyIz1i4MNKikl0tY%3D&amp;re=
served=3D0
> > > > > > > > > =

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
