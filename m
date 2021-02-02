Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C130C3F8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 16:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC5A6E1CF;
	Tue,  2 Feb 2021 15:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D916E106
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 15:38:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id m1so2702094wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 07:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KjehhPmgLoe4iCCf5r40YjfRxIKFOaCpyhiIJA3wb6w=;
 b=j0t24QT/Y5MbStRdJf9Sp3PsHPHQOJC/igJ3lf/yYqnJj4zzN4j1XnXVaVIzefX6Vy
 29wfrCA6CJfB4H19Jmgro80DBNUWWJ6PTAckaOEhdqFWgioSAzVCrkzrnqCTak4aO+79
 YcezY67Yi8mZGza08EcBYm3jCaQepi2DRvi88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KjehhPmgLoe4iCCf5r40YjfRxIKFOaCpyhiIJA3wb6w=;
 b=onpHiyb5H049hM69rDYBQwfgLc3RgwsDivrT7wtk4lwB82oqV6BSZ3N4d9HphiMaQx
 5UerRLsC+nkP5Nq5L7dKdXW11DOZPTELoBvy6Rms1qxOTq2l48PlKWChP9HO0U953efK
 6FqKcvUr7ZO9NO4dJuvorZ3UZZUFB74jySUiyAEmhHTq9bo/EEdyDxl9Xsuis7hc2s9v
 PHYb1fuaWhUYVf/O1EDodpfc5JYsLSHCUYzWzjDgSIRyrnZ+QJ09KjCU9vBBdZzGzxHK
 Nr019XVvQKw9zBmiVbdl7XfIzMJHjnFgdUZNhi3DKHzM7XfPB8mePGdPhRkBPuSYR1Y7
 08kQ==
X-Gm-Message-State: AOAM533LAYG6IBlOdgADDGCCXn6U9qe0tiyNuy4tKTrLJ6dMDBtZy9SW
 NX5E7uqemlWnBBfMB73w8ltYoA==
X-Google-Smtp-Source: ABdhPJzXgPJ1zqm1yJYmSjWrkJnCdRcmbPVl68ctfePeb/CA/K2Sgwh9GeK95kw0ZbSrGWOIEvAOJg==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr4065938wmb.160.1612280303772; 
 Tue, 02 Feb 2021 07:38:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 36sm34229498wrj.97.2021.02.02.07.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:38:22 -0800 (PST)
Date: Tue, 2 Feb 2021 16:38:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable
 page fault implications
Message-ID: <YBlx7eHGMhWUF0zy@phenom.ffwll.local>
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
 <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com>
 <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
 <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com>
 <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
 <d838b9a2-b728-5a69-ee61-1e1ee7cfa714@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d838b9a2-b728-5a69-ee61-1e1ee7cfa714@amd.com>
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
 Felix Kuehling <felix.kuehling@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <jglisse@redhat.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Back from vacations.

On Thu, Jan 28, 2021 at 04:46:55PM +0100, Christian K=F6nig wrote:
> Am 28.01.21 um 16:39 schrieb Felix Kuehling:
> > Am 2021-01-28 um 2:39 a.m. schrieb Christian K=F6nig:
> > > Am 27.01.21 um 23:00 schrieb Felix Kuehling:
> > > > Am 2021-01-27 um 7:16 a.m. schrieb Christian K=F6nig:
> > > > > Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
> > > > > > Op 27-01-2021 om 01:22 schreef Felix Kuehling:
> > > > > > > Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
> > > > > > > > Recently there was a fairly long thread about recoreable ha=
rdware
> > > > > > > > page
> > > > > > > > faults, how they can deadlock, and what to do about that.
> > > > > > > > =

> > > > > > > > While the discussion is still fresh I figured good time to =
try and
> > > > > > > > document the conclusions a bit.
> > > > > > > > =

> > > > > > > > References:
> > > > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehlin=
g%40amd.com%2F&amp;data=3D04%7C01%7Cfelix.kuehling%40amd.com%7C4e4884be55d7=
4c4dda1408d8c35fd0ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637474163=
592260552%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dy2VzC4vbfMi0ctyerAHfqODZ6tthz1=
FUDwpMCp0PIrQ%3D&amp;reserved=3D0
> > > > > > > > =

> > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > > > > > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > > > > > > > Cc: Jerome Glisse <jglisse@redhat.com>
> > > > > > > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > > > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > > > > Cc: linux-media@vger.kernel.org
> > > > > > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > > > > > -- =

> > > > > > > > I'll be away next week, but figured I'll type this up quick=
ly for
> > > > > > > > some
> > > > > > > > comments and to check whether I got this all roughly right.
> > > > > > > > =

> > > > > > > > Critique very much wanted on this, so that we can make sure=
 hw which
> > > > > > > > can't preempt (with pagefaults pending) like gfx10 has a cl=
ear
> > > > > > > > path to
> > > > > > > > support page faults in upstream. So anything I missed, got =
wrong or
> > > > > > > > like that would be good.
> > > > > > > > -Daniel
> > > > > > > > ---
> > > > > > > >  =A0=A0 Documentation/driver-api/dma-buf.rst | 66
> > > > > > > > ++++++++++++++++++++++++++++
> > > > > > > >  =A0=A0 1 file changed, 66 insertions(+)
> > > > > > > > =

> > > > > > > > diff --git a/Documentation/driver-api/dma-buf.rst
> > > > > > > > b/Documentation/driver-api/dma-buf.rst
> > > > > > > > index a2133d69872c..e924c1e4f7a3 100644
> > > > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > > > @@ -257,3 +257,69 @@ fences in the kernel. This means:
> > > > > > > >  =A0=A0=A0=A0 userspace is allowed to use userspace fencing=
 or long running
> > > > > > > > compute
> > > > > > > >  =A0=A0=A0=A0 workloads. This also means no implicit fencin=
g for shared
> > > > > > > > buffers in these
> > > > > > > >  =A0=A0=A0=A0 cases.
> > > > > > > > +
> > > > > > > > +Recoverable Hardware Page Faults Implications
> > > > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > +
> > > > > > > > +Modern hardware supports recoverable page faults, which ha=
s a
> > > > > > > > lot of
> > > > > > > > +implications for DMA fences.
> > > > > > > > +
> > > > > > > > +First, a pending page fault obviously holds up the work th=
at's
> > > > > > > > running on the
> > > > > > > > +accelerator and a memory allocation is usually required to=
 resolve
> > > > > > > > the fault.
> > > > > > > > +But memory allocations are not allowed to gate completion =
of DMA
> > > > > > > > fences, which
> > > > > > > > +means any workload using recoverable page faults cannot us=
e DMA
> > > > > > > > fences for
> > > > > > > > +synchronization. Synchronization fences controlled by user=
space
> > > > > > > > must be used
> > > > > > > > +instead.
> > > > > > > > +
> > > > > > > > +On GPUs this poses a problem, because current desktop comp=
ositor
> > > > > > > > protocols on
> > > > > > > > +Linus rely on DMA fences, which means without an entirely =
new
> > > > > > > > userspace stack
> > > > > > > > +built on top of userspace fences, they cannot benefit from
> > > > > > > > recoverable page
> > > > > > > > +faults. The exception is when page faults are only used as
> > > > > > > > migration hints and
> > > > > > > > +never to on-demand fill a memory request. For now this mea=
ns
> > > > > > > > recoverable page
> > > > > > > > +faults on GPUs are limited to pure compute workloads.
> > > > > > > > +
> > > > > > > > +Furthermore GPUs usually have shared resources between the=
 3D
> > > > > > > > rendering and
> > > > > > > > +compute side, like compute units or command submission eng=
ines. If
> > > > > > > > both a 3D
> > > > > > > > +job with a DMA fence and a compute workload using recovera=
ble page
> > > > > > > > faults are
> > > > > > > > +pending they could deadlock:
> > > > > > > > +
> > > > > > > > +- The 3D workload might need to wait for the compute job t=
o finish
> > > > > > > > and release
> > > > > > > > +=A0 hardware resources first.
> > > > > > > > +
> > > > > > > > +- The compute workload might be stuck in a page fault, bec=
ause the
> > > > > > > > memory
> > > > > > > > +=A0 allocation is waiting for the DMA fence of the 3D work=
load to
> > > > > > > > complete.
> > > > > > > > +
> > > > > > > > +There are a few ways to prevent this problem:
> > > > > > > > +
> > > > > > > > +- Compute workloads can always be preempted, even when a p=
age
> > > > > > > > fault is pending
> > > > > > > > +=A0 and not yet repaired. Not all hardware supports this.
> > > > > > > > +
> > > > > > > > +- DMA fence workloads and workloads which need page fault =
handling
> > > > > > > > have
> > > > > > > > +=A0 independent hardware resources to guarantee forward pr=
ogress.
> > > > > > > > This could be
> > > > > > > > +=A0 achieved through e.g. through dedicated engines and mi=
nimal
> > > > > > > > compute unit
> > > > > > > > +=A0 reservations for DMA fence workloads.
> > > > > > > > +
> > > > > > > > +- The reservation approach could be further refined by only
> > > > > > > > reserving the
> > > > > > > > +=A0 hardware resources for DMA fence workloads when they a=
re
> > > > > > > > in-flight. This must
> > > > > > > > +=A0 cover the time from when the DMA fence is visible to o=
ther
> > > > > > > > threads up to
> > > > > > > > +=A0 moment when fence is completed through dma_fence_signa=
l().
> > > > > > > > +
> > > > > > > > +- As a last resort, if the hardware provides no useful res=
ervation
> > > > > > > > mechanics,
> > > > > > > > +=A0 all workloads must be flushed from the GPU when switch=
ing
> > > > > > > > between jobs
> > > > > > > > +=A0 requiring DMA fences or jobs requiring page fault hand=
ling: This
> > > > > > > > means all DMA
> > > > > > > > +=A0 fences must complete before a compute job with page fa=
ult
> > > > > > > > handling can be
> > > > > > > > +=A0 inserted into the scheduler queue. And vice versa, bef=
ore a DMA
> > > > > > > > fence can be
> > > > > > > > +=A0 made visible anywhere in the system, all compute workl=
oads must
> > > > > > > > be preempted
> > > > > > > > +=A0 to guarantee all pending GPU page faults are flushed.
> > > > > > > I thought of another possible workaround:
> > > > > > > =

> > > > > > >  =A0=A0=A0 * Partition the memory. Servicing of page faults w=
ill use a
> > > > > > > separate
> > > > > > >  =A0=A0=A0=A0=A0 memory pool that can always be allocated fro=
m without
> > > > > > > waiting for
> > > > > > >  =A0=A0=A0=A0=A0 fences. This includes memory for page tables=
 and memory for
> > > > > > >  =A0=A0=A0=A0=A0 migrating data to. You may steal memory from=
 other processes
> > > > > > > that
> > > > > > >  =A0=A0=A0=A0=A0 can page fault, so no fence waiting is neces=
sary. Being able to
> > > > > > >  =A0=A0=A0=A0=A0 steal memory at any time also means there ar=
e basically no
> > > > > > >  =A0=A0=A0=A0=A0 out-of-memory situations you need to worry a=
bout. Even page
> > > > > > > tables
> > > > > > >  =A0=A0=A0=A0=A0 (except the root page directory of each proc=
ess) can be
> > > > > > > stolen in
> > > > > > >  =A0=A0=A0=A0=A0 the worst case.
> > > > > > I think 'overcommit' would be a nice way to describe this. But =
I'm not
> > > > > > sure how easy this is to implement in practice. You would basic=
ally
> > > > > > need
> > > > > > to create your own memory manager for this.

Yeah when we discussed this at intel we've come across this one too, but
for the practical reasons laid out below this one is going to be very
hard.

Some more of the things I've dug out when looking into whether this is
feasible below.

> > > > > Well you would need a completely separate pool for both device as=
 well
> > > > > as system memory.
> > > > > =

> > > > > E.g. on boot we say we steal X GB system memory only for HMM.
> > > > Why? The GPU driver doesn't need to allocate system memory for HMM.
> > > > Migrations to system memory are handled by the kernel's handle_mm_f=
ault
> > > > and page allocator and swap logic.
> > > And that one depends on dma_fence completion because you can easily
> > > need to wait for an MMU notifier callback.
> > I see, the GFX MMU notifier for userpointers in amdgpu currently waits
> > for fences. For the KFD MMU notifier I am planning to fix this by
> > causing GPU page faults instead of preempting the queues. Can we limit
> > userptrs in amdgpu to engines that can page fault. Basically make it
> > illegal to attach userptr BOs to graphics CS BO lists, so they can only
> > be used in user mode command submissions, which can page fault. Then the
> > GFX MMU notifier could invalidate PTEs and would not have to wait for
> > fences.
> =

> It's not only the MMU notifier, the TTM shrinker I'm adding needs to wait
> for dma_fences as well.
> =

> And apart from that we can't limit userptrs since they are part of the UA=
PI
> and Vulkan/OpenGL.

So when I looked I noticed that ->mmap has already a GFP flag, but it
seems largely defunct. It's in struct vm_fault.gfp_mask.

We could also set a PF thread flag somehow to limit this.

But the real risk I'm seeing is that this means we're running the entire
page faulthandler from any fs/driver/whatever under a more limited memory
allocation policy, and experience from other areas says that's very
fragile and prone to blow up real bad. Other examples are loopback block
device (running file i/o under GFP_NOIO because it's a block device) or
nfs, which runs the network stack under GFP_NOFS. I've chatted with some
fs people, and they strongly recommend against these kind of magic
"everything I call here has a limited memory allocation scope" tricks.

That's why I didn't bring it up, but I think for completeness I can
mention this and explain why it's very hard to implement and probably not
going to happen.

> > > As Maarten wrote when you want to go down this route you need a
> > > complete separate memory management parallel to the one of the kernel.
> > Not really. I'm trying to make the GPU memory management more similar to
> > what the kernel does for system memory.
> > =

> > I understood Maarten's comment as "I'm creating a new memory manager and
> > not using TTM any more". This is true. The idea is that this portion of
> > VRAM would be managed more like system memory.
> =

> I don't think that will fly. We can have the backing store which TTM uses
> for allocation shared with HMM.
> =

> But essentially both TTM allocations needs to be able to put pressure on =
HMM
> allocations as well as the other way around.

Yeah that's another reason why I think full split isn't good, as soon as
you run desktop stuff with mixed workload we want the 2 worlds to press
against each another and figure out a fair memory split. Also when we go
into stuff like cgroups I don't think users want to manage these 2 worlds
explicitly, especially if we want to keep the road open to transition vk
(and maybe also gl/libva) over to the explicit userspace fencing world.

I'll try and respin the patch with the suggestion from Christian and this
thread here address and then resend the patch.

Cheers, Daniel

> =

> Regards,
> Christian.
> =

> > =

> > Regards,
> >  =A0 Felix
> > =

> > =

> > > Regards,
> > > Christian.
> > > =

> > > >  =A0 It doesn't depend on any fences, so
> > > > it cannot deadlock with any GPU driver-managed memory. The GPU driv=
er
> > > > gets involved in the MMU notifier to invalidate device page tables.=
 But
> > > > that also doesn't need to wait for any fences.
> > > > =

> > > > And if the kernel runs out of pageable memory, you're in trouble an=
yway.
> > > > The OOM killer will step in, nothing new there.
> > > > =

> > > > Regards,
> > > >  =A0=A0 Felix
> > > > =

> > > > =

> > > > > > But from a design point of view, definitely a valid solution.
> > > > > I think the restriction above makes it pretty much unusable.
> > > > > =

> > > > > > But this looks good, those solutions are definitely the valid
> > > > > > options we
> > > > > > can choose from.
> > > > > It's certainly worth noting, yes. And just to make sure that nobo=
dy
> > > > > has the idea to reserve only device memory.
> > > > > =

> > > > > Christian.
> > > > > =

> > > > > > ~Maarten
> > > > > > =

> > > > _______________________________________________
> > > > Linaro-mm-sig mailing list
> > > > Linaro-mm-sig@lists.linaro.org
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=3D04%7C01%7=
Cfelix.kuehling%40amd.com%7C4e4884be55d74c4dda1408d8c35fd0ab%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637474163592260552%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DgQj51eDK8OUWoQcbYliY639jOPleRjyLY3Q16nj2PL0%3D&amp;reserved=3D0
> > > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
