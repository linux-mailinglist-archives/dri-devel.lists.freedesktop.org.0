Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62972F2AD0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 10:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A85F6E16D;
	Tue, 12 Jan 2021 09:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C5E6E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 09:10:37 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q18so1656754wrn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 01:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=O6sBsy2mXrzSsZgD+zsgzajVilwjgxGqKDzmfyk52Hk=;
 b=K/3EDgRwyTlaN1IBFnjNQO2K7iO2YzP4f0M8/WXfFDkhyKHRsivSBctQzwoyORBnDS
 NPd/sQ2qNJYs6yW+8NnW8sPGuF50nYjDyeuysS5F9JlyxmIi/t+onX4rMGhPSkljyygR
 hmYOHbXunXgpKdUNQdLpbASAU2FaUkiQ5PoZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O6sBsy2mXrzSsZgD+zsgzajVilwjgxGqKDzmfyk52Hk=;
 b=fgSLCCVKiskoMDpMTQ2pFUxHDZmS9c1ruCKmUDAHQDeJolXRQRNrqIcGXyb2WEAalL
 Dp5JV+WXrtIjlVS6P0iiQPmTpBmudPTRNwHaxydx4UPwH847xuidXjsCZcvfnypWZ5Cs
 Q/Wm2W2TsWEzA9wfOAURTZeflQ7J18tcFwsHpReIWuXJoLvowaAyxb2xNaTvzARnKm1b
 b02A2WmFCETrONAKSBpawNllyOZYjJsVw5XeD80kd1+oMPDHiotHRHGpu8aEoBcco2kZ
 jPl9NIYO2tTwmMZOVgBiEqBuQQ/Aj2q8cnEDLBSJqa1bUWPDFNPgFt8zNgAHghGdgbMg
 pl+Q==
X-Gm-Message-State: AOAM531wpdZECPaCHmGBLGYk0J4s7O5RLKHTHJqrXmusIcs/bWKPUIpb
 8L7Zwrkfv/u2P+/jpXafeHdv6g==
X-Google-Smtp-Source: ABdhPJwA0gauqF7x1nhRoB9Q7cVU41RgM7oHp9f0APzrZzwrHsSia5WsM6MjiMPfdgdTdDAIVEUEhA==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr3161471wrw.249.1610442636437; 
 Tue, 12 Jan 2021 01:10:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q73sm3089252wme.44.2021.01.12.01.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:10:35 -0800 (PST)
Date: Tue, 12 Jan 2021 10:10:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
Message-ID: <X/1niT8MNvcEwDFS@phenom.ffwll.local>
References: <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local>
 <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
 <db1e456d-8493-c94e-942e-ed19a2e1b931@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db1e456d-8493-c94e-942e-ed19a2e1b931@amd.com>
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 03:45:10PM -0500, Andrey Grodzovsky wrote:
> =

> On 1/11/21 11:15 AM, Daniel Vetter wrote:
> > On Mon, Jan 11, 2021 at 05:13:56PM +0100, Daniel Vetter wrote:
> > > On Fri, Jan 08, 2021 at 04:49:55PM +0000, Grodzovsky, Andrey wrote:
> > > > Ok then, I guess I will proceed with the dummy pages list implement=
ation then.
> > > > =

> > > > Andrey
> > > > =

> > > > ________________________________
> > > > From: Koenig, Christian <Christian.Koenig@amd.com>
> > > > Sent: 08 January 2021 09:52
> > > > To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Daniel Vetter <=
daniel@ffwll.ch>
> > > > Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; =
dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; daniel.v=
etter@ffwll.ch <daniel.vetter@ffwll.ch>; robh@kernel.org <robh@kernel.org>;=
 l.stach@pengutronix.de <l.stach@pengutronix.de>; yuq825@gmail.com <yuq825@=
gmail.com>; eric@anholt.net <eric@anholt.net>; Deucher, Alexander <Alexande=
r.Deucher@amd.com>; gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>=
; ppaalanen@gmail.com <ppaalanen@gmail.com>; Wentland, Harry <Harry.Wentlan=
d@amd.com>
> > > > Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM=
 object
> > > > =

> > > > Mhm, I'm not aware of any let over pointer between TTM and GEM and =
we
> > > > worked quite hard on reducing the size of the amdgpu_bo, so another
> > > > extra pointer just for that corner case would suck quite a bit.
> > > We have a ton of other pointers in struct amdgpu_bo (or any of it's l=
ower
> > > things) which are fairly single-use, so I'm really not much seeing the
> > > point in making this a special case. It also means the lifetime manag=
ement
> > > becomes a bit iffy, since we can't throw away the dummy page then the=
 last
> > > reference to the bo is released (since we don't track it there), but =
only
> > > when the last pointer to the device is released. Potentially this mea=
ns a
> > > pile of dangling pages hanging around for too long.
> > Also if you really, really, really want to have this list, please don't
> > reinvent it since we have it already. drmm_ is exactly meant for resour=
ces
> > that should be freed when the final drm_device reference disappears.
> > -Daniel
> =

> =

> I maybe was eager to early, see i need to explicitly allocate the dummy p=
age
> using page_alloc so
> i cannot use drmm_kmalloc for this, so once again like with the list i ne=
ed
> to wrap it with a container struct
> which i can then allocate using drmm_kmalloc and inside there will be page
> pointer. But then
> on release it needs to free the page and so i supposedly need to use drmm=
_add_action
> to free the page before the container struct is released but drmm_kmalloc
> doesn't allow to set
> release action on struct allocation. So I created a new
> drmm_kmalloc_with_action API function
> but then you also need to supply the optional data pointer for the release
> action (the struct page in this case)
> and so this all becomes a bit overcomplicated (but doable). Is this extra
> API worth adding ? Maybe it can
> be useful in general.

drm_add_action_or_reset (for better control flow) has both a void * data
and a cleanup function (and it internally allocates the tracking structure
for that for you). So should work as-is? Allocating a tracking structure
for our tracking structure for a page would definitely be a bit too much.

Essentiall drmm_add_action is your kcalloc_with_action function you want,
as long as all you need is a single void * pointer (we could do the
kzalloc_with_action though, there's enough space, just no need yet for any
of the current users).
-Daniel

> =

> Andrey
> =

> =

> =

> > > If you need some ideas for redundant pointers:
> > > - destroy callback (kinda not cool to not have this const anyway), we
> > >    could refcount it all with the overall gem bo. Quite a bit of work.
> > > - bdev pointer, if we move the device ttm stuff into struct drm_devic=
e, or
> > >    create a common struct ttm_device, we can ditch that
> > > - We could probably merge a few of the fields and find 8 bytes somewh=
ere
> > > - we still have 2 krefs, would probably need to fix that before we can
> > >    merge the destroy callbacks
> > > =

> > > So there's plenty of room still, if the size of a bo struct is really=
 that
> > > critical. Imo it's not.
> > > =

> > > =

> > > > Christian.
> > > > =

> > > > Am 08.01.21 um 15:46 schrieb Andrey Grodzovsky:
> > > > > Daniel had some objections to this (see bellow) and so I guess I =
need
> > > > > you both to agree on the approach before I proceed.
> > > > > =

> > > > > Andrey
> > > > > =

> > > > > On 1/8/21 9:33 AM, Christian K=F6nig wrote:
> > > > > > Am 08.01.21 um 15:26 schrieb Andrey Grodzovsky:
> > > > > > > Hey Christian, just a ping.
> > > > > > Was there any question for me here?
> > > > > > =

> > > > > > As far as I can see the best approach would still be to fill th=
e VMA
> > > > > > with a single dummy page and avoid pointers in the GEM object.
> > > > > > =

> > > > > > Christian.
> > > > > > =

> > > > > > > Andrey
> > > > > > > =

> > > > > > > On 1/7/21 11:37 AM, Andrey Grodzovsky wrote:
> > > > > > > > On 1/7/21 11:30 AM, Daniel Vetter wrote:
> > > > > > > > > On Thu, Jan 07, 2021 at 11:26:52AM -0500, Andrey Grodzovs=
ky wrote:
> > > > > > > > > > On 1/7/21 11:21 AM, Daniel Vetter wrote:
> > > > > > > > > > > On Tue, Jan 05, 2021 at 04:04:16PM -0500, Andrey Grod=
zovsky wrote:
> > > > > > > > > > > > On 11/23/20 3:01 AM, Christian K=F6nig wrote:
> > > > > > > > > > > > > Am 23.11.20 um 05:54 schrieb Andrey Grodzovsky:
> > > > > > > > > > > > > > On 11/21/20 9:15 AM, Christian K=F6nig wrote:
> > > > > > > > > > > > > > > Am 21.11.20 um 06:21 schrieb Andrey Grodzovsk=
y:
> > > > > > > > > > > > > > > > Will be used to reroute CPU mapped BO's pag=
e faults once
> > > > > > > > > > > > > > > > device is removed.
> > > > > > > > > > > > > > > Uff, one page for each exported DMA-buf? That=
's not
> > > > > > > > > > > > > > > something we can do.
> > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > We need to find a different approach here.
> > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > Can't we call alloc_page() on each fault and =
link them together
> > > > > > > > > > > > > > > so they are freed when the device is finally =
reaped?
> > > > > > > > > > > > > > For sure better to optimize and allocate on dem=
and when we reach
> > > > > > > > > > > > > > this corner case, but why the linking ?
> > > > > > > > > > > > > > Shouldn't drm_prime_gem_destroy be good enough =
place to free ?
> > > > > > > > > > > > > I want to avoid keeping the page in the GEM objec=
t.
> > > > > > > > > > > > > =

> > > > > > > > > > > > > What we can do is to allocate a page on demand fo=
r each fault
> > > > > > > > > > > > > and link
> > > > > > > > > > > > > the together in the bdev instead.
> > > > > > > > > > > > > =

> > > > > > > > > > > > > And when the bdev is then finally destroyed after=
 the last
> > > > > > > > > > > > > application
> > > > > > > > > > > > > closed we can finally release all of them.
> > > > > > > > > > > > > =

> > > > > > > > > > > > > Christian.
> > > > > > > > > > > > Hey, started to implement this and then realized th=
at by
> > > > > > > > > > > > allocating a page
> > > > > > > > > > > > for each fault indiscriminately
> > > > > > > > > > > > we will be allocating a new page for each faulting =
virtual
> > > > > > > > > > > > address within a
> > > > > > > > > > > > VA range belonging the same BO
> > > > > > > > > > > > and this is obviously too much and not the intentio=
n. Should I
> > > > > > > > > > > > instead use
> > > > > > > > > > > > let's say a hashtable with the hash
> > > > > > > > > > > > key being faulting BO address to actually keep allo=
cating and
> > > > > > > > > > > > reusing same
> > > > > > > > > > > > dummy zero page per GEM BO
> > > > > > > > > > > > (or for that matter DRM file object address for non=
 imported
> > > > > > > > > > > > BOs) ?
> > > > > > > > > > > Why do we need a hashtable? All the sw structures to =
track this
> > > > > > > > > > > should
> > > > > > > > > > > still be around:
> > > > > > > > > > > - if gem_bo->dma_buf is set the buffer is currently e=
xported as
> > > > > > > > > > > a dma-buf,
> > > > > > > > > > >      so defensively allocate a per-bo page
> > > > > > > > > > > - otherwise allocate a per-file page
> > > > > > > > > > That exactly what we have in current implementation
> > > > > > > > > > =

> > > > > > > > > > =

> > > > > > > > > > > Or is the idea to save the struct page * pointer? Tha=
t feels a
> > > > > > > > > > > bit like
> > > > > > > > > > > over-optimizing stuff. Better to have a simple implem=
entation
> > > > > > > > > > > first and
> > > > > > > > > > > then tune it if (and only if) any part of it becomes =
a problem
> > > > > > > > > > > for normal
> > > > > > > > > > > usage.
> > > > > > > > > > Exactly - the idea is to avoid adding extra pointer to
> > > > > > > > > > drm_gem_object,
> > > > > > > > > > Christian suggested to instead keep a linked list of du=
mmy pages
> > > > > > > > > > to be
> > > > > > > > > > allocated on demand once we hit a vm_fault. I will then=
 also
> > > > > > > > > > prefault the entire
> > > > > > > > > > VA range from vma->vm_end - vma->vm_start to vma->vm_en=
d and map
> > > > > > > > > > them
> > > > > > > > > > to that single dummy page.
> > > > > > > > > This strongly feels like premature optimization. If you'r=
e worried
> > > > > > > > > about
> > > > > > > > > the overhead on amdgpu, pay down the debt by removing one=
 of the
> > > > > > > > > redundant
> > > > > > > > > pointers between gem and ttm bo structs (I think we still=
 have
> > > > > > > > > some) :-)
> > > > > > > > > =

> > > > > > > > > Until we've nuked these easy&obvious ones we shouldn't pl=
ay "avoid 1
> > > > > > > > > pointer just because" games with hashtables.
> > > > > > > > > -Daniel
> > > > > > > > =

> > > > > > > > Well, if you and Christian can agree on this approach and s=
uggest
> > > > > > > > maybe what pointer is
> > > > > > > > redundant and can be removed from GEM struct so we can use =
the
> > > > > > > > 'credit' to add the dummy page
> > > > > > > > to GEM I will be happy to follow through.
> > > > > > > > =

> > > > > > > > P.S Hash table is off the table anyway and we are talking o=
nly
> > > > > > > > about linked list here since by prefaulting
> > > > > > > > the entire VA range for a vmf->vma i will be avoiding redun=
dant
> > > > > > > > page faults to same VMA VA range and so
> > > > > > > > don't need to search and reuse an existing dummy page but s=
imply
> > > > > > > > create a new one for each next fault.
> > > > > > > > =

> > > > > > > > Andrey
> > > -- =

> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fbl=
og.ffwll.ch%2F&amp;data=3D04%7C01%7Candrey.grodzovsky%40amd.com%7C4b581c55d=
f204ca3d07408d8b64c1db8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637459=
785321798393%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DEvvAip8vs9fzVRS1rb0r5ODiBMn=
gxPuI9GKR2%2F%2B2LzE%3D&amp;reserved=3D0

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
