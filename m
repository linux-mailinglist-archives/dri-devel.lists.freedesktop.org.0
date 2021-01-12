Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2832F2AC6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 10:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B365891B1;
	Tue, 12 Jan 2021 09:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C9891B1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 09:07:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i9so1625208wrc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 01:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YSwJ+RS6nur6fVNaq5vhxbXXOQNX53Az5libCYUiB3Y=;
 b=C//T1xXMhVPU6lK9LfGa6ehCnNj7Hw5pTFHh7kH9iTU7HSfy9HOhDeg9rn3YsI12NZ
 +iuNl7Uejv+gMTpCjv5Yyt16/qFbhpE5N2HyRZM/nUgskyEHKHhdzwy+SC77Zi7Tsy9u
 BjCmpCR++WEsgOpapUpTozKw4aEvHpj5+3CR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YSwJ+RS6nur6fVNaq5vhxbXXOQNX53Az5libCYUiB3Y=;
 b=Ii2E1W4l3FW+KD6oT4iFTlifE/p73a3c+mWXmDEgKuLBzlhxd+ocFBC8q3rPZ9HZvy
 kKmJ95U6y2u1poPZEJsgx0JgqZPM2pEnvKRzD8LXXIu7BF0zKC5FyG/qp/3FqfN66ayz
 hQ1KE0ZWh4YYt6kemar1/GJPfURRwnDAbuIIS/ZV5ZTqrcLZdIBKCDi3g8IPnbWgN5fV
 3qgK10lxJXp2Xu0VT4Zi8VKnTQkUHNqFjbLeL8BgvuH3xWEIOd03dq87Xjrs+zo1yNGd
 BdmY+SwVug3wQnTs5nhhGFUoT0QeYU4BK7HWh+/VHDp14AWG/2cu06OH9+g4DSbh9Kqw
 7Tng==
X-Gm-Message-State: AOAM531NT/PaFsB+exJgI4G9ZcgedpdroM9WHHL/V8c5Jp0Hru0RtXA/
 NVCWnbNIwuxuRyzpCHTzPVfdKw==
X-Google-Smtp-Source: ABdhPJxWdStEIWOML8ICgbMinlCPCzXiAxrd0CVg2jMlbRDn5zJkru7SkaRRjb7aQ2tfaFmOi4F9ng==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr3302021wrp.14.1610442455865; 
 Tue, 12 Jan 2021 01:07:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s25sm4189399wrs.49.2021.01.12.01.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:07:35 -0800 (PST)
Date: Tue, 12 Jan 2021 10:07:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
Message-ID: <X/1m1XqojsAf+Pcw@phenom.ffwll.local>
References: <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local>
 <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
 <da936412-c40a-7e29-f1a4-f155c85d3836@amd.com>
 <8ad009f7-060e-c14a-808f-cbda95c56f6e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ad009f7-060e-c14a-808f-cbda95c56f6e@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 01:31:00PM -0500, Andrey Grodzovsky wrote:
> =

> On 1/11/21 12:41 PM, Andrey Grodzovsky wrote:
> > =

> > On 1/11/21 11:15 AM, Daniel Vetter wrote:
> > > On Mon, Jan 11, 2021 at 05:13:56PM +0100, Daniel Vetter wrote:
> > > > On Fri, Jan 08, 2021 at 04:49:55PM +0000, Grodzovsky, Andrey wrote:
> > > > > Ok then, I guess I will proceed with the dummy pages list impleme=
ntation then.
> > > > > =

> > > > > Andrey
> > > > > =

> > > > > ________________________________
> > > > > From: Koenig, Christian <Christian.Koenig@amd.com>
> > > > > Sent: 08 January 2021 09:52
> > > > > To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Daniel
> > > > > Vetter <daniel@ffwll.ch>
> > > > > Cc: amd-gfx@lists.freedesktop.org
> > > > > <amd-gfx@lists.freedesktop.org>;
> > > > > dri-devel@lists.freedesktop.org
> > > > > <dri-devel@lists.freedesktop.org>; daniel.vetter@ffwll.ch
> > > > > <daniel.vetter@ffwll.ch>; robh@kernel.org <robh@kernel.org>;
> > > > > l.stach@pengutronix.de <l.stach@pengutronix.de>;
> > > > > yuq825@gmail.com <yuq825@gmail.com>; eric@anholt.net
> > > > > <eric@anholt.net>; Deucher, Alexander
> > > > > <Alexander.Deucher@amd.com>; gregkh@linuxfoundation.org
> > > > > <gregkh@linuxfoundation.org>; ppaalanen@gmail.com
> > > > > <ppaalanen@gmail.com>; Wentland, Harry
> > > > > <Harry.Wentland@amd.com>
> > > > > Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or G=
EM object
> > > > > =

> > > > > Mhm, I'm not aware of any let over pointer between TTM and GEM an=
d we
> > > > > worked quite hard on reducing the size of the amdgpu_bo, so anoth=
er
> > > > > extra pointer just for that corner case would suck quite a bit.
> > > > We have a ton of other pointers in struct amdgpu_bo (or any of it's=
 lower
> > > > things) which are fairly single-use, so I'm really not much seeing =
the
> > > > point in making this a special case. It also means the lifetime man=
agement
> > > > becomes a bit iffy, since we can't throw away the dummy page then t=
he last
> > > > reference to the bo is released (since we don't track it there), bu=
t only
> > > > when the last pointer to the device is released. Potentially this m=
eans a
> > > > pile of dangling pages hanging around for too long.
> > > Also if you really, really, really want to have this list, please don=
't
> > > reinvent it since we have it already. drmm_ is exactly meant for reso=
urces
> > > that should be freed when the final drm_device reference disappears.
> > > -Daniel
> > =

> > =

> > Can you elaborate ? We still need to actually implement the list but you
> > want me to use
> > drmm_add_action for it's destruction instead of explicitly doing it
> > (like I'm already doing from=A0 ttm_bo_device_release) ?
> > =

> > Andrey
> =

> =

> Oh, i get it i think, you want me to allocate each page using drmm_kzalloc
> so when drm_dev dies it will be freed on it's own.
> Great idea and makes my implementation much less cumbersome.

That was my idea, but now after a night's worth of sleep I'm not so sure
it's a bright one: We don't just want 4k of memory, we want a page. And
I'm not sure kzalloc will give us that (plus using a slab page for mmap
might result in fireworks shows).

So maybe just drmm_add_action_or_reset (since I'm also not sure we can
just use the lists in struct page itself for the page we got when we use
alloc_page).
-Daniel

> =

> Andrey
> =

> =

> > =

> > =

> > > > If you need some ideas for redundant pointers:
> > > > - destroy callback (kinda not cool to not have this const anyway), =
we
> > > > =A0=A0 could refcount it all with the overall gem bo. Quite a bit o=
f work.
> > > > - bdev pointer, if we move the device ttm stuff into struct drm_dev=
ice, or
> > > > =A0=A0 create a common struct ttm_device, we can ditch that
> > > > - We could probably merge a few of the fields and find 8 bytes some=
where
> > > > - we still have 2 krefs, would probably need to fix that before we =
can
> > > > =A0=A0 merge the destroy callbacks
> > > > =

> > > > So there's plenty of room still, if the size of a bo struct is real=
ly that
> > > > critical. Imo it's not.
> > > > =

> > > > =

> > > > > Christian.
> > > > > =

> > > > > Am 08.01.21 um 15:46 schrieb Andrey Grodzovsky:
> > > > > > Daniel had some objections to this (see bellow) and so I guess =
I need
> > > > > > you both to agree on the approach before I proceed.
> > > > > > =

> > > > > > Andrey
> > > > > > =

> > > > > > On 1/8/21 9:33 AM, Christian K=F6nig wrote:
> > > > > > > Am 08.01.21 um 15:26 schrieb Andrey Grodzovsky:
> > > > > > > > Hey Christian, just a ping.
> > > > > > > Was there any question for me here?
> > > > > > > =

> > > > > > > As far as I can see the best approach would still be to fill =
the VMA
> > > > > > > with a single dummy page and avoid pointers in the GEM object.
> > > > > > > =

> > > > > > > Christian.
> > > > > > > =

> > > > > > > > Andrey
> > > > > > > > =

> > > > > > > > On 1/7/21 11:37 AM, Andrey Grodzovsky wrote:
> > > > > > > > > On 1/7/21 11:30 AM, Daniel Vetter wrote:
> > > > > > > > > > On Thu, Jan 07, 2021 at 11:26:52AM -0500, Andrey Grodzo=
vsky wrote:
> > > > > > > > > > > On 1/7/21 11:21 AM, Daniel Vetter wrote:
> > > > > > > > > > > > On Tue, Jan 05, 2021 at 04:04:16PM -0500, Andrey Gr=
odzovsky wrote:
> > > > > > > > > > > > > On 11/23/20 3:01 AM, Christian K=F6nig wrote:
> > > > > > > > > > > > > > Am 23.11.20 um 05:54 schrieb Andrey Grodzovsky:
> > > > > > > > > > > > > > > On 11/21/20 9:15 AM, Christian K=F6nig wrote:
> > > > > > > > > > > > > > > > Am 21.11.20 um 06:21 schrieb Andrey Grodzov=
sky:
> > > > > > > > > > > > > > > > > Will be used to reroute CPU mapped BO's p=
age faults once
> > > > > > > > > > > > > > > > > device is removed.
> > > > > > > > > > > > > > > > Uff, one page for each exported DMA-buf? Th=
at's not
> > > > > > > > > > > > > > > > something we can do.
> > > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > > We need to find a different approach here.
> > > > > > > > > > > > > > > > =

> > > > > > > > > > > > > > > > Can't we call alloc_page() on each fault an=
d link them together
> > > > > > > > > > > > > > > > so they are freed when the device is finall=
y reaped?
> > > > > > > > > > > > > > > For sure better to optimize and allocate on d=
emand when we reach
> > > > > > > > > > > > > > > this corner case, but why the linking ?
> > > > > > > > > > > > > > > Shouldn't drm_prime_gem_destroy be good enoug=
h place to free ?
> > > > > > > > > > > > > > I want to avoid keeping the page in the GEM obj=
ect.
> > > > > > > > > > > > > > =

> > > > > > > > > > > > > > What we can do is to allocate a page on demand =
for each fault
> > > > > > > > > > > > > > and link
> > > > > > > > > > > > > > the together in the bdev instead.
> > > > > > > > > > > > > > =

> > > > > > > > > > > > > > And when the bdev is then finally destroyed aft=
er the last
> > > > > > > > > > > > > > application
> > > > > > > > > > > > > > closed we can finally release all of them.
> > > > > > > > > > > > > > =

> > > > > > > > > > > > > > Christian.
> > > > > > > > > > > > > Hey, started to implement this and then realized =
that by
> > > > > > > > > > > > > allocating a page
> > > > > > > > > > > > > for each fault indiscriminately
> > > > > > > > > > > > > we will be allocating a new page for each faultin=
g virtual
> > > > > > > > > > > > > address within a
> > > > > > > > > > > > > VA range belonging the same BO
> > > > > > > > > > > > > and this is obviously too much and not the intent=
ion. Should I
> > > > > > > > > > > > > instead use
> > > > > > > > > > > > > let's say a hashtable with the hash
> > > > > > > > > > > > > key being faulting BO address to actually keep al=
locating and
> > > > > > > > > > > > > reusing same
> > > > > > > > > > > > > dummy zero page per GEM BO
> > > > > > > > > > > > > (or for that matter DRM file object address for n=
on imported
> > > > > > > > > > > > > BOs) ?
> > > > > > > > > > > > Why do we need a hashtable? All the sw structures t=
o track this
> > > > > > > > > > > > should
> > > > > > > > > > > > still be around:
> > > > > > > > > > > > - if gem_bo->dma_buf is set the buffer is currently=
 exported as
> > > > > > > > > > > > a dma-buf,
> > > > > > > > > > > > =A0=A0=A0=A0 so defensively allocate a per-bo page
> > > > > > > > > > > > - otherwise allocate a per-file page
> > > > > > > > > > > That exactly what we have in current implementation
> > > > > > > > > > > =

> > > > > > > > > > > =

> > > > > > > > > > > > Or is the idea to save the struct page * pointer? T=
hat feels a
> > > > > > > > > > > > bit like
> > > > > > > > > > > > over-optimizing stuff. Better to have a simple impl=
ementation
> > > > > > > > > > > > first and
> > > > > > > > > > > > then tune it if (and only if) any part of it become=
s a problem
> > > > > > > > > > > > for normal
> > > > > > > > > > > > usage.
> > > > > > > > > > > Exactly - the idea is to avoid adding extra pointer to
> > > > > > > > > > > drm_gem_object,
> > > > > > > > > > > Christian suggested to instead keep a linked list of =
dummy pages
> > > > > > > > > > > to be
> > > > > > > > > > > allocated on demand once we hit a vm_fault. I will th=
en also
> > > > > > > > > > > prefault the entire
> > > > > > > > > > > VA range from vma->vm_end - vma->vm_start to vma->vm_=
end and map
> > > > > > > > > > > them
> > > > > > > > > > > to that single dummy page.
> > > > > > > > > > This strongly feels like premature optimization. If you=
're worried
> > > > > > > > > > about
> > > > > > > > > > the overhead on amdgpu, pay down the debt by removing o=
ne of the
> > > > > > > > > > redundant
> > > > > > > > > > pointers between gem and ttm bo structs (I think we sti=
ll have
> > > > > > > > > > some) :-)
> > > > > > > > > > =

> > > > > > > > > > Until we've nuked these easy&obvious ones we shouldn't =
play "avoid 1
> > > > > > > > > > pointer just because" games with hashtables.
> > > > > > > > > > -Daniel
> > > > > > > > > =

> > > > > > > > > Well, if you and Christian can agree on this approach and=
 suggest
> > > > > > > > > maybe what pointer is
> > > > > > > > > redundant and can be removed from GEM struct so we can us=
e the
> > > > > > > > > 'credit' to add the dummy page
> > > > > > > > > to GEM I will be happy to follow through.
> > > > > > > > > =

> > > > > > > > > P.S Hash table is off the table anyway and we are talking=
 only
> > > > > > > > > about linked list here since by prefaulting
> > > > > > > > > the entire VA range for a vmf->vma i will be avoiding red=
undant
> > > > > > > > > page faults to same VMA VA range and so
> > > > > > > > > don't need to search and reuse an existing dummy page but=
 simply
> > > > > > > > > create a new one for each next fault.
> > > > > > > > > =

> > > > > > > > > Andrey
> > > > -- =

> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
blog.ffwll.ch%2F&amp;data=3D04%7C01%7Candrey.grodzovsky%40amd.com%7C25b0797=
44d6149f8f2d508d8b65825c6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374=
59836996005995%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dh5dB%2FP90Gt6t6Oxp%2B9BZz=
k3YH%2BdYUp3hLQ%2B9bhNMOJM%3D&amp;reserved=3D0
> > > > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7Can=
drey.grodzovsky%40amd.com%7C25b079744d6149f8f2d508d8b65825c6%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637459836996015986%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DY5I5d5g1OIaV5lhmeZpSnM0Y10fTGNW%2Fc2G9O5LPn2g%3D&amp;reserved=3D0
> > =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
