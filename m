Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8823ACCD6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 15:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F586EA1C;
	Fri, 18 Jun 2021 13:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA166EA16
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 13:54:13 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id bj15so9467274qkb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rSgB+R12YLlRSHtytwrk+O3jVIODLZnV8d4t5lBBaJ8=;
 b=BnP5TvRKZRid4C4rbwW/9Ps7DQjjIxRwWxokLDWxXkoKmxRYz0IBWzVFxbaMiFFTUs
 m+C7XjtjwvURxzesVa06s556yXxyswI2RKGokZBEVN+dBuCuIlFkizbnImkn+PEBA8Gv
 80or1G25gj/dGfGt/ttD5KQNSDUPTkpcIK6Vg90uvtpAhjU9p0WJ6GA5OU1rhiM1yxyf
 b0eYFtgpEShP1Ig866L0bhd2E8pno/98gnh28uGz5lsB/rHsQMeu61yBdIcdkWNie+tH
 CBk+a/dSEyxWhx6CykgxX+nFGfyBDJMQe0SzCBPiXpFKJtH1rkhv49jT+PK0zHGwgzF4
 n7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rSgB+R12YLlRSHtytwrk+O3jVIODLZnV8d4t5lBBaJ8=;
 b=s4OvMMAdoCx6nXnfYloX7kfGuAX8EwgOVWVahrw9wcoYuUpyZ7/qcleTt064dQzk7v
 dcMU+m6SAxxOXkaSWVNTZaQ+gshZjSonbHi2ogzEKxzyki0nmDpoUDtefQ8MfZ3QkZ4K
 oZ2IgvUTDHIINU2IA90NpupY7WblI1EMYjncqYHqBfLwUT6+KuP+OCyD769dJcaCbOAh
 9AaELEAtU6c0PUVHMUyhfU1yETVCcbTj0xA+v9Som34tOmBank1o14wmPjHzOczee1D9
 495gguMuyswTDaPATnk/AxUmaQxingkjHOyfb5qVIDTMC4e7NqNLul1+5/DNAd9QdBz5
 HcrA==
X-Gm-Message-State: AOAM531I5EUVOYj+thsu21wj+w0Hf3RTg0u918Fib3O1s2kXW5Khs3hL
 icJdML9FgyiHELLFjsKzQ49z8114TJUjkbNjzhilIA==
X-Google-Smtp-Source: ABdhPJzfSuekfIQPKBSAEaV1iYGjfkkWwwE2+s0v5QQRkqeKk2YC656jma6du6bcJbpfArVRgjoKjc4ZtODAiJk1qfQ=
X-Received: by 2002:a25:bd49:: with SMTP id p9mr13464648ybm.241.1624024452045; 
 Fri, 18 Jun 2021 06:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
In-Reply-To: <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 18 Jun 2021 08:54:01 -0500
Message-ID: <CAOFGe940Ojvupt3PRxHWFUeNuHjWJUs1173Fz-kH4FTA=tioEg@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 4:15 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.06.21 um 21:58 schrieb Daniel Vetter:
> > On Thu, Jun 17, 2021 at 09:37:36AM +0200, Christian K=C3=B6nig wrote:
> >> [SNIP]
> >>> But, to the broader point, maybe?  I'm a little fuzzy on exactly wher=
e
> >>> i915 inserts and/or depends on fences.
> >>>
> >>>> When you combine that with complex drivers which use TTM and buffer
> >>>> moves underneath you can construct an information leak using this an=
d
> >>>> give userspace access to memory which is allocated to the driver, bu=
t
> >>>> not yet initialized.
> >>>>
> >>>> This way you can leak things like page tables, passwords, kernel dat=
a
> >>>> etc... in large amounts to userspace and is an absolutely no-go for
> >>>> security.
> >>> Ugh...  Unfortunately, I'm really out of my depth on the implications
> >>> going on here but I think I see your point.
> >>>
> >>>> That's why I'm said we need to get this fixed before we upstream thi=
s
> >>>> patch set here and especially the driver change which is using that.
> >>> Well, i915 has had uAPI for a while to ignore fences.
> >> Yeah, exactly that's illegal.
> > You're a few years too late with closing that barn door. The following
> > drives have this concept
> > - i915
> > - msm
> > - etnaviv
> >
> > Because you can't write a competent vulkan driver without this.
>
> WHAT? ^^

I think it's fair to say that you can't write a competent Vulkan
driver with implicit sync getting in the way.  Since AMD removes all
the implicit sync internally, this solves most of the problems there.
RADV does suffer some heartache around WSI which is related but I'd
hardly say that makes it incompetent.

> > This was discussed at absolute epic length in various xdcs iirc. We did=
 ignore a
> > bit the vram/ttm/bo-moving problem because all the people present were
> > hacking on integrated gpu (see list above), but that just means we need=
 to
> > treat the ttm_bo->moving fence properly.
>
> I should have visited more XDCs in the past, the problem is much larger
> than this.
>
> But I now start to understand what you are doing with that design and
> why it looks so messy to me, amdgpu is just currently the only driver
> which does Vulkan and complex memory management at the same time.

I'm reading "complex memory management" here and elsewhere as "has
VRAM".  All memory management is complex; shuffling to/from VRAM just
adds more layers.

> >> At least the kernel internal fences like moving or clearing a buffer o=
bject
> >> needs to be taken into account before a driver is allowed to access a
> >> buffer.
> > Yes i915 needs to make sure it never ignores ttm_bo->moving.
>
> No, that is only the tip of the iceberg. See TTM for example also puts
> fences which drivers needs to wait for into the shared slots. Same thing
> for use cases like clear on release etc....
>
>  From my point of view the main purpose of the dma_resv object is to
> serve memory management, synchronization for command submission is just
> a secondary use case.
>
> And that drivers choose to ignore the exclusive fence is an absolutely
> no-go from a memory management and security point of view. Exclusive
> access means exclusive access. Ignoring that won't work.
>
> The only thing which saved us so far is the fact that drivers doing this
> are not that complex.

I think there's something important in Daniel's list above with
drivers that have a "no implicit sync uAPI": None of them are TTM
based.  We (i915) have been doing our own thing for memory management
for a while and it may not follow your TTM mental model.  Sure,
there's a dma_resv in our BOs and we can import/export dma-buf but
that doesn't mean that, internally, we think of it the same way.  I
say this in very generic terms because there are a whole lot of
details that I don't know.  What I do know is that, whatever we're
doing, it's been pretty robust for many years.

That said, we are moving to TTM so, if I'm right that this is a GEM
<-> TTM conflict, we've got some thinking to do.

> BTW: How does it even work? I mean then you would run into the same
> problem as amdgpu with its page table update fences, e.g. that your
> shared fences might signal before the exclusive one.
>
> > For dma-buf this isn't actually a problem, because dma-buf are pinned. =
You
> > can't move them while other drivers are using them, hence there's not
> > actually a ttm_bo->moving fence we can ignore.
> >
> > p2p dma-buf aka dynamic dma-buf is a different beast, and i915 (and fwi=
w
> > these other drivers) need to change before they can do dynamic dma-buf.
> >
> >> Otherwise we have an information leak worth a CVE and that is certainl=
y not
> >> something we want.
> > Because yes otherwise we get a CVE. But right now I don't think we have
> > one.
>
> Yeah, agree. But this is just because of coincident and not because of
> good engineering :)
>
> > We do have a quite big confusion on what exactly the signaling ordering=
 is
> > supposed to be between exclusive and the collective set of shared fence=
s,
> > and there's some unifying that needs to happen here. But I think what
> > Jason implements here in the import ioctl is the most defensive version
> > possible, so really can't break any driver. It really works like you ha=
ve
> > an ad-hoc gpu engine that does nothing itself, but waits for the curren=
t
> > exclusive fence and then sets the exclusive fence with its "CS" complet=
ion
> > fence.
> >
> > That's imo perfectly legit use-case.
>
> The use case is certainly legit, but I'm not sure if merging this at the
> moment is a good idea.
>
> Your note that drivers are already ignoring the exclusive fence in the
> dma_resv object was eye opening to me. And I now have the very strong
> feeling that the synchronization and the design of the dma_resv object
> is even more messy then I thought it is.
>
> To summarize we can be really lucky that it didn't blow up into our
> faces already.
>
> > Same for the export one. Waiting for a previous snapshot of implicit
> > fences is imo perfectly ok use-case and useful for compositors - client
> > might soon start more rendering, and on some drivers that always result=
s
> > in the exclusive slot being set, so if you dont take a snapshot you
> > oversync real bad for your atomic flip.
>
> The export use case is unproblematic as far as I can see.

Then why are we holding it up?  I'm not asking to have import merged.
That's still labled RFC and I've said over and over that it's not
baked and I'm not convinced it helps all that much.

> >>> Those changes are years in the past.  If we have a real problem here =
(not sure on
> >>> that yet), then we'll have to figure out how to fix it without nuking
> >>> uAPI.
> >> Well, that was the basic idea of attaching flags to the fences in the
> >> dma_resv object.
> >>
> >> In other words you clearly denote when you have to wait for a fence be=
fore
> >> accessing a buffer or you cause a security issue.
> > Replied somewhere else, and I do kinda like the flag idea. But the prob=
lem
> > is we first need a ton more encapsulation and review of drivers before =
we
> > can change the internals. One thing at a time.

I think I'm warming to flags as well.  I didn't like them at first but
I think they actually make quite a bit of sense.  Unlike the explicit
fence where ignoring it can lead to a security hole, the worst that
happens if someone forgets a flag somewhere is a bit of memory
corruption and garbage on-screen.  That seems fairly non-dangerous to
me.

> Ok how should we then proceed?
>
> The large patch set I've send out to convert all users of the shared
> fence list to a for_each API is a step into the right direction I think,
> but there is still a bit more todo.
>
> > And yes for amdgpu this gets triple-hard because you both have the
> > ttm_bo->moving fence _and_ the current uapi of using fence ownership _a=
nd_
> > you need to figure out how to support vulkan properly with true opt-in
> > fencing.
>
> Well I have been pondering on that for a bit and I came to the
> conclusion that it is actually not a problem at all.
>
> See radeon, nouveau, msm etc... all implement functions that they don't
> wait for fences from the same timeline, context, engine. That amdgpu
> doesn't wait for fences from the same process can be seen as just a
> special case of this.

That doesn't totally solve the issue, though.  RADV suffers in the WSI
arena today from too much cross-process implicit sharing.  I do think
you want some sort of "ignore implicit sync" API but, in this new
world of flags, it would look more like "don't bother looking for
shared fences flagged write".  You'd still respect the exclusive
fence, if there is one, and you'd still add a shared fence.  You just
wouldn't bother with implicit sync.  Should be safe, right?

--Jason

> >   I'm pretty sure it's doable, I'm just not finding any time
> > anywhere to hack on these patches - too many other fires :-(
>
> Well I'm here. Let's just agree on the direction and I can do the coding.
>
> What I need help with is all the auditing. For example I still haven't
> wrapped my head around how i915 does the synchronization.
>
> Best regards,
> Christian.
>
> >
> > Cheers, Daniel
> >
> >> Christian.
> >>
> >>> --Jason
> >>>
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>> Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> >>>>> Modern userspace APIs like Vulkan are built on an explicit
> >>>>> synchronization model.  This doesn't always play nicely with the
> >>>>> implicit synchronization used in the kernel and assumed by X11 and
> >>>>> Wayland.  The client -> compositor half of the synchronization isn'=
t too
> >>>>> bad, at least on intel, because we can control whether or not i915
> >>>>> synchronizes on the buffer and whether or not it's considered writt=
en.
> >>>>>
> >>>>> The harder part is the compositor -> client synchronization when we=
 get
> >>>>> the buffer back from the compositor.  We're required to be able to
> >>>>> provide the client with a VkSemaphore and VkFence representing the =
point
> >>>>> in time where the window system (compositor and/or display) finishe=
d
> >>>>> using the buffer.  With current APIs, it's very hard to do this in =
such
> >>>>> a way that we don't get confused by the Vulkan driver's access of t=
he
> >>>>> buffer.  In particular, once we tell the kernel that we're renderin=
g to
> >>>>> the buffer again, any CPU waits on the buffer or GPU dependencies w=
ill
> >>>>> wait on some of the client rendering and not just the compositor.
> >>>>>
> >>>>> This new IOCTL solves this problem by allowing us to get a snapshot=
 of
> >>>>> the implicit synchronization state of a given dma-buf in the form o=
f a
> >>>>> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT =
only,
> >>>>> instead of CPU waiting directly, it encapsulates the wait operation=
, at
> >>>>> the current moment in time, in a sync_file so we can check/wait on =
it
> >>>>> later.  As long as the Vulkan driver does the sync_file export from=
 the
> >>>>> dma-buf before we re-introduce it for rendering, it will only conta=
in
> >>>>> fences from the compositor or display.  This allows to accurately t=
urn
> >>>>> it into a VkFence or VkSemaphore without any over- synchronization.
> >>>>>
> >>>>> This patch series actually contains two new ioctls.  There is the e=
xport
> >>>>> one mentioned above as well as an RFC for an import ioctl which pro=
vides
> >>>>> the other half.  The intention is to land the export ioctl since it=
 seems
> >>>>> like there's no real disagreement on that one.  The import ioctl, h=
owever,
> >>>>> has a lot of debate around it so it's intended to be RFC-only for n=
ow.
> >>>>>
> >>>>> Mesa MR: https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F4037&=
amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cf8e28d7c4683432bf24008d93=
1ca5a63%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637595567453821101%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;sdata=3DTAFUHFCSFcfrP7bjkBtVin4VX2vC6OakwbrqwlZOW8c=
%3D&amp;reserved=3D0
> >>>>> IGT tests: https://nam11.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90490%2F&amp;data=3D04%7C0=
1%7Cchristian.koenig%40amd.com%7Cf8e28d7c4683432bf24008d931ca5a63%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637595567453821101%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;sdata=3Dlbn%2B81KXds9pYnFUYWi9hzLNP3PLKij4RVjV97UyZ3s%3D&amp;reserve=
d=3D0
> >>>>>
> >>>>> v10 (Jason Ekstrand, Daniel Vetter):
> >>>>>     - Add reviews/acks
> >>>>>     - Add a patch to rename _rcu to _unlocked
> >>>>>     - Split things better so import is clearly RFC status
> >>>>>
> >>>>> v11 (Daniel Vetter):
> >>>>>     - Add more CCs to try and get maintainers
> >>>>>     - Add a patch to document DMA_BUF_IOCTL_SYNC
> >>>>>     - Generally better docs
> >>>>>     - Use separate structs for import/export (easier to document)
> >>>>>     - Fix an issue in the import patch
> >>>>>
> >>>>> v12 (Daniel Vetter):
> >>>>>     - Better docs for DMA_BUF_IOCTL_SYNC
> >>>>>
> >>>>> v12 (Christian K=C3=B6nig):
> >>>>>     - Drop the rename patch in favor of Christian's series
> >>>>>     - Add a comment to the commit message for the dma-buf sync_file=
 export
> >>>>>       ioctl saying why we made it an ioctl on dma-buf
> >>>>>
> >>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> >>>>> Cc: Dave Airlie <airlied@redhat.com>
> >>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>>>> Cc: Daniel Stone <daniels@collabora.com>
> >>>>> Cc: mesa-dev@lists.freedesktop.org
> >>>>> Cc: wayland-devel@lists.freedesktop.org
> >>>>> Test-with: 20210524205225.872316-1-jason@jlekstrand.net
> >>>>>
> >>>>> Christian K=C3=B6nig (1):
> >>>>>      dma-buf: Add dma_fence_array_for_each (v2)
> >>>>>
> >>>>> Jason Ekstrand (5):
> >>>>>      dma-buf: Add dma_resv_get_singleton (v6)
> >>>>>      dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
> >>>>>      dma-buf: Add an API for exporting sync files (v12)
> >>>>>      RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unl=
ocked
> >>>>>      RFC: dma-buf: Add an API for importing sync files (v7)
> >>>>>
> >>>>>     Documentation/driver-api/dma-buf.rst |   8 ++
> >>>>>     drivers/dma-buf/dma-buf.c            | 103 ++++++++++++++++++++=
+++++
> >>>>>     drivers/dma-buf/dma-fence-array.c    |  27 +++++++
> >>>>>     drivers/dma-buf/dma-resv.c           | 110 ++++++++++++++++++++=
+++++++
> >>>>>     include/linux/dma-fence-array.h      |  17 +++++
> >>>>>     include/linux/dma-resv.h             |   2 +
> >>>>>     include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++=
++++-
> >>>>>     7 files changed, 369 insertions(+), 1 deletion(-)
> >>>>>
> >> _______________________________________________
> >> mesa-dev mailing list
> >> mesa-dev@lists.freedesktop.org
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
sts.freedesktop.org%2Fmailman%2Flistinfo%2Fmesa-dev&amp;data=3D04%7C01%7Cch=
ristian.koenig%40amd.com%7Cf8e28d7c4683432bf24008d931ca5a63%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637595567453821101%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DQxQDoUKzo57tmQxD0aEjPs8ATpCOBQiQ5W%2FDh8dbEqU%3D&amp;reserved=3D0
>
