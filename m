Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C4CB2878
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 10:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E1010E6B2;
	Wed, 10 Dec 2025 09:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YamZISxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E637010E6B1;
 Wed, 10 Dec 2025 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765358524;
 bh=YfsF1JLP3HHQTIOiPuocEzd5F4DWI8E+N59UvNMiB/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YamZISxUJCeNuZQ4cLLLOLIdtVMVe6wgq6Acm3l3SCWc8LBNrAuOdbd9UFFCGGn9D
 zLZjxn9tsGDRSS1j4VEUoCPro12h69yrpxcx9gXWyk6fss6BX7wPAQ40U3d9ofpS+m
 oM0J7Grk6JDtzM/nDe1x1n38/5ZP77irSVVgBmzIj0B10V0+lqxGs7674zABrO1HNb
 bT46PYPJ4UA+tj31f0YTQQ8p2Nirpu1+MHm1/egyY5dIsY7JRyxWkwlaTuWGxYCv4q
 nvYFn1obMgZKC6GUQk8eRiToTEjkfdydqz8KHQo/xuvluUGN4fTnKDgeXIuV0/j9w0
 nhEKqjDnbuJjQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 814D317E04D6;
 Wed, 10 Dec 2025 10:22:03 +0100 (CET)
Date: Wed, 10 Dec 2025 10:21:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: Re: [RFC][PATCH 00/13] drm: Introduce GEM-UMA memory management
Message-ID: <20251210102157.76f4ec8f@fedora>
In-Reply-To: <44d3e6c9-6759-4a76-9016-c9749badab94@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209152734.6851f3ac@fedora>
 <2b95d76e-2672-4cae-a545-73c407f2b20c@suse.de>
 <20251209163011.436e613b@fedora>
 <44d3e6c9-6759-4a76-9016-c9749badab94@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, 10 Dec 2025 08:34:02 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 09.12.25 um 16:30 schrieb Boris Brezillon:
> > On Tue, 9 Dec 2025 15:51:21 +0100
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >  
> >> Hi
> >>
> >> Am 09.12.25 um 15:27 schrieb Boris Brezillon:  
> >>> On Tue,  9 Dec 2025 14:41:57 +0100
> >>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>     
> >>>> Duplicate GEM-SHMEM to GEM-UMA. Convert all DRM drivers for UMA
> >>>> systems if they currently use GEM-SHMEM.
> >>>>
> >>>> Many DRM drivers for hardware with Unified Memory Architecture (UMA)
> >>>> currently builds upon GEM-SHMEM and extends the helpers with features
> >>>> for managing the GPU MMU. This allows the GPU to access the GEM buffer
> >>>> content for its operation.
> >>>>
> >>>> There is another, larger, set of DRM drivers that use GEM-SHMEM merely
> >>>> as buffer management with no hardware support. These drivers copy the
> >>>> buffer content to the GPU on each page flip. The GPU itself has no direct
> >>>> access. Hardware of this type is usually in servers, behind slow busses
> >>>> (SPI, USB), or provided by firmware (drivers in sysfb/).
> >>>>
> >>>> After some discussion with Boris on the future of GEM-SHMEM, it seems
> >>>> to me that both use cases more and more diverge from each other. The
> >>>> most prominent example is the implementation of gem_prime_import,
> >>>> where both use cases use distinct approaches.
> >>>>
> >>>> So we discussed the introduction of a GEM-UMA helper library for
> >>>> UMA-based hardware. GEM-UMA will remain flexible enough for drivers
> >>>> to extend it for their use case. GEM-SHMEM will become focused on the
> >>>> simple-hardware use case. The benefit for both libraries is that they
> >>>> will be easier to understand and maintain. GEM-SHMEM can be simplified
> >>>> signiifcantly, I think.
> >>>>
> >>>> This RFC series introduces GEM-UMA and converts the UMA-related drivers.
> >>>>
> >>>> Patches 1 and 2 fix issues in GEM-SHMEM, so that we don't duplicate
> >>>> errornous code.
> >>>>
> >>>> Patch 3 copies GEM-SHMEM to GEM-UMA. Patch 4 then does soem obvious
> >>>> cleanups of unnecessary code.  
> >>> Instead of copying the code as-is, I'd rather take a step back and think
> >>> about what we need and how we want to handle more complex stuff, like
> >>> reclaim. I've started working on a shrinker for panthor [1], and as part
> >>> of this series, I've added a commit implementing just enough to replace
> >>> what gem-shmem currently provides. Feels like the new GEM-UMA thing
> >>> could be designed on a composition rather than inheritance model,
> >>> where we have sub-components (backing, cpu_map, gpu_map) that can be
> >>> pulled in and re-used by the driver implementation. The common helpers
> >>> would take those sub-components instead of a plain GEM object. That
> >>> would leave the drivers free of how their internal gem_object fields are
> >>> laid out and wouldn't require overloading the ->gem_create_object()
> >>> function. It seems to be that it would better match the model you were
> >>> describing the other day.  
> >> Yeah, I've seen your update to that series. Making individual parts of
> >> the memory manager freely composable with each other is a fine idea.
> >>
> >> But the flipside is that I also want the simple drivers to move away
> >> from the flexible approach that GEM-SHMEM currently takes. There are
> >> many drivers that do not need or want that. These drivers benefit from
> >> something that is self contained. Many of the drivers are also hardly
> >> maintained, so simplifying things will also be helpful.
> >>
> >> I could have added a new GEM implementation for these drivers, but there
> >> are less UMA drivers to convert and the GEM-UMA naming generally fits
> >> better than GEM-SHMEM.
> >>
> >> I'd rather have GEM-UMA and evolve it from where it stands now; and also
> >> evolve GEM-SHMEM in a different direction. There's a difference in
> >> concepts here.  
> > Problem is, we'll be stuck trying to evolve gem-uma to something
> > cleaner because of the existing abuse of gem-shmem that you're moving
> > to gem-uma, so I'm not sure I like the idea to be honest. I'm all for
> > this gem-uma thing, but I'm not convinced rushing it in is the right
> > solution.  
> 
> The abuse you're talking about is what you mentioned about ivpu? How it 
> uses the gem-shmem internals, right? Ivpu can get its own copy of 
> gem-shmem, so that the developers can work it out.

There's that one, but there's also panfrost/lima manually filling the
pages array for their on-fault-allocation mechanism, and probably other
funky stuff I didn't notice yet.

> There's no benefit in 
> sharing code at all cost. Code sharing only make sense if the callers 
> are conceptually aligned on what the callee does.

At this point I think I'm clear on what you think about code sharing,
and I can pretty safely say I don't fully agree with you on this point
:P. IMHO, there's benefit in sharing code when the rules are clearly
defined, but gem-shmem has been so lax that we reached a point where it
has become the far west, and everyone happily manipulates gem_shmem
internals without the core helpers knowing. That's when it becomes a
mess, on that, I agree.

> 
> Also what stops you from fixing any of this in the context of gem-uma?

That's exactly what I want to do, except that, rather than fixing it,
I'd like to get it right from the start and progressively move existing
GPU/accel drivers using gem-shmem to gem-uma. If you blindly move every
GPU/accel drivers currently using gem-shmem to gem-uma (which is just a
rebranded gem-shmem), you're just moving the problem, you're not
solving it. And all of a sudden, gem-uma, which I wanted to be this
clean slate with well defined rules, on top of which we can more
easily add building blocks for advanced stuff (reclaim, sparse
allocation, ...), is back to this far west.

> It should even be easier, as you won't have to keep my use cases in mind.

I might be wrong, but KMS use cases are probably not the problematic
ones.

> 
> In parallel, gem-shmem could go in its own direction.

My understanding is that you're primarily targeting KMS drivers, so why
don't you fork gem-shem with something called gem-shmem-for-kms (or
gem-shmem-dumb) that does just enough for you, and nothing more?

I'm saying that with a bit of sarcasm, and I certainly get how painful
it is to go and patch all KMS drivers to rename things. But if you think
about it for a second, it's just as painful (if not more) to fork
gem-uma in all users that might get in the way of a cleaner
abstraction. Not only that, but all of a sudden, you need a lot more
synchronization to get that approved, and until that happens, you're
blocked on the real stuff: designing something that's sounds for
more complex use cases GPU/accel drivers care about.

> I'd like to do 
> some changes and simplifications there, which conflict with where 
> gem-uma will be heading.

Just to be clear, I'm not going to block this if that's the direction
people want to take, but I wanted to point out that making it easier for
you might mean making others' life harder. When I initially proposed to
fork gem-shmem it was not with the goal of pulling all current
GPU/accel users in directly, but rather design something that provides
the same set of features (with the ability to add more), with better
defined rules, so we don't end up in the same situation. What you're
doing here is the opposite: gem-uma becomes the gem-shmem's
forget-about box, and as a result, it becomes someone else's problem.

Regards,

Boris
