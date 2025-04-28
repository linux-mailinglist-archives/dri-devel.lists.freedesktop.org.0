Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF26A9EA30
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 10:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FB610E3C2;
	Mon, 28 Apr 2025 08:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fXEmuUy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA6D10E3B9;
 Mon, 28 Apr 2025 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745827225;
 bh=b9oeHMakjkQ95OUEN5nOPD7sS9lnOO4xBk40QU8YcW4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fXEmuUy61vh5yac+eVHBqbxi4jE1YC/ycpVA6EzYL842JzvzNwBuM6T+m5XQgmM0B
 KKLQf8r2p5D6iJOw5ekiNcDidQx4n+6ddiULOS3Yme/EEn7aDx2h4xKr8RhZfcPSMM
 GFnXbIgGZr7wHqRBgKlpmqifHr8sEHIr+BpUElR5GIoxj+pyKOk858csdjQVdgu3j5
 4RZhi/FQi/aFpYmWx/LOwHp8yrctnlGRrcECpwX9/gEb4F2b9pIf9n+VvovMVM93i8
 CCXqSlX70DlFyMyakI7XnZZ9YfnHgpmlu4pQk/+B0Ya20dScJSdUeZzqxLhLe9cdF2
 U48KbrsldBXoA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 10D7517E0F66;
 Mon, 28 Apr 2025 10:00:25 +0200 (CEST)
Date: Mon, 28 Apr 2025 10:00:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Christian Koenig <christian.koenig@amd.com>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH] drm/doc: Start documenting aspects specific to
 tile-based renderers
Message-ID: <20250428100020.0df24938@collabora.com>
In-Reply-To: <be01aea3-1fc6-48f8-b8ad-83464e260c5c@arm.com>
References: <20250418122524.410448-1-boris.brezillon@collabora.com>
 <be01aea3-1fc6-48f8-b8ad-83464e260c5c@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

Hi Steve,

On Wed, 23 Apr 2025 10:41:53 +0100
Steven Price <steven.price@arm.com> wrote:

> On 18/04/2025 13:25, Boris Brezillon wrote:
> > Tile-based GPUs come with a set of constraints that are not present
> > when immediate rendering is used. This new document tries to explain
> > the differences between tile/immediate rendering, the problems that
> > come with tilers, and how we plan to address them.
> > 
> > This is just a started point, this document will be updated with new
> > materials as we refine the libraries we add to help deal with
> > tilers, and have more drivers converted to follow the rules listed
> > here.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Seems like a good starting point, a few minor comments below. We really
> need some non-Mali input too though.

Totally agree with that, my view on this problem is certainly biased.

> 
> > ---
> >  Documentation/gpu/drm-tile-based-renderer.rst | 201 ++++++++++++++++++
> >  Documentation/gpu/index.rst                   |   1 +
> >  2 files changed, 202 insertions(+)
> >  create mode 100644 Documentation/gpu/drm-tile-based-renderer.rst
> > 
> > diff --git a/Documentation/gpu/drm-tile-based-renderer.rst b/Documentation/gpu/drm-tile-based-renderer.rst
> > new file mode 100644
> > index 000000000000..19b56b9476fc
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-tile-based-renderer.rst
> > @@ -0,0 +1,201 @@
> > +==================================================
> > +Infrastructure and tricks for tile-based renderers
> > +==================================================
> > +
> > +All lot of embedded GPUs are using tile-based rendering instead of immediate
> > +rendering. This mode of rendering has various implications that we try to
> > +document here along with some hints about how to deal with some of the
> > +problems that surface with tile-based renderers.
> > +
> > +The main idea behind tile-based rendering is to batch processing of nearby
> > +pixels during the fragment shading phase to limit the traffic on the memory
> > +bus by making optimal use of the various caches present in the GPU. Unlike
> > +immediate rendering, where primitives generated by the geometry stages of
> > +the pipeline are directly consumed by the fragment stage, tilers have to
> > +record primitives in bins that are somehow attached to tiles (the
> > +granularity of the tile being GPU-specific). This data is usually stored
> > +in memory, and pulled back when the fragment stage is executed.
> > +
> > +This approach has several issues that most drivers need to handle somehow,
> > +sometimes with a bit of help from the hardware.
> > +
> > +Issues at hand
> > +==============
> > +
> > +Tiler memory
> > +------------
> > +
> > +The amount of memory needed to store primitives data and metadata is hard
> > +to guess ahead of time, because it depends on various parameters that are
> > +not in control of the UMD (UserMode Driver). Here is a non-exhaustive list
> > +of things that may complicate the calculation of the memory needed to store
> > +primitive information:
> > +
> > +- Primitives distribution across tiles is hard to guess: the binning process
> > +  is about assigning each primitive to the set tiles it covers. The more tiles
> > +  being covered the more memory is needed to record those. We can estimate
> > +  the worst case scenario by assuming all primitives will cover all tiles but
> > +  this will lead to over-allocation most of the time, which is not good
> > +- Indirect draws: the number of vertices comes from a GPU buffer that might
> > +  be filled by previous GPU compute jobs. This means we only know the number
> > +  of vertices when the GPU executes the draw, and thus can't guess how much
> > +  memory will be needed for those and allocate a GPU buffer that's big enough
> > +  to hold those
> > +- Complex geometry pipelines: if you throw geometry/tesselation/mesh shaders
> > +  it gets even trickier to guess the number of primitives from the number
> > +  of vertices passed to the vertex shader.
> > +
> > +For all these reasons, the tiler usually allocates memory dynamically, but
> > +DRM has not been designed with this use case in mind. Drivers will address
> > +these problems differently based on the functionality provided by their
> > +hardware, but all of them almost certainly have to deal with this somehow.
> > +
> > +The easy solution is to statically allocate a huge buffer to pick from when
> > +tiler memory is needed, and fail the rendering when this buffer is depleted.
> > +Some drivers try to be smarter to avoid reserving a lot of memory upfront.
> > +Instead, they start with an almost empty buffer and progressively populate it
> > +when the GPU faults on an address sitting in the tiler buffer range. This
> > +works okay most of the time but it falls short when the system is under
> > +memory pressure, because the memory request is not guaranteed to be satisfied.
> > +In that case, the driver either fails the rendering, or, if the hardware
> > +allows it, it tries to flush the primitives that have been processed and
> > +triggers a fragment job that will consume those primitives and free up some
> > +memory to be recycled and make further progress on the tiling step. This is
> > +usually referred as partial/incremental rendering (it might have other names).
> > +
> > +Compute based emulation of geometry stages
> > +------------------------------------------
> > +
> > +More and more hardware vendors don't bother providing hardware support for
> > +geometry/tesselation/mesh stages, since those can be emulated with compute
> > +shaders. But the same problem we have with tiler memory exists with those
> > +intermediate compute-emulated stages, because transient data shared between
> > +stages need to be stored in memory for the next stage to consume, and this
> > +bubbles up until the tiling stage is reached, because ultimately, what the
> > +tiling stage will need to process is a set of vertices it can turn into
> > +primitives, like would happen if the application had emulated the geometry,
> > +tesselation or mesh stages with compute.
> > +
> > +Unlike tiling, where the hardware can provide a fallback to recycle memory,
> > +there is no way the intermediate primitives can be flushed up to the framebuffer,
> > +because it's a purely software emulation here. This being said, the same
> > +"start small, grow on-demand" can be applied to avoid over-allocating memory
> > +upfront.
> > +
> > +On-demand memory allocation
> > +---------------------------
> > +
> > +As explained in previous sections, on-demand allocation is a central piece
> > +of tile-based renderer if we don't want to over-allocate, which is bad for
> > +integrated GPUs who share their memory with the rest of the system.
> > +
> > +The problem with on-demand allocation is that suddenly, GPU accesses can
> > +fail on OOM, and the DRM components (drm_gpu_scheduler and drm_gem mostly)
> > +were not designed for that. Those are assuming that buffers memory is  
> 
> NIT: s/buffers/buffer's/
> 
> > +populated at job submission time, and will stay around for the job lifetime.
> > +If a GPU fault happens, it's the user fault, and the context can be flagged  
> 
> NIT: s/user/user's/
> 
> > +unusable. On-demand allocation is usually implemented as allocation-on-fault,
> > +and the dma_fence contract prevents us from blocking on allocations in that
> > +path (GPU fault handlers are in the dma-fence signalling path). So now we
> > +have GPU allocations that will be satisfied most of the time, but can fail
> > +occasionally. And this is not great, because an allocation failure might
> > +kill the user GPU context (VK_DEVICE_LOST in Vulkan terms), without the
> > +application having dong anything wrong. So, we need something that makes those
> > +allocation failures rare enough that most users won't experience them, and
> > +we need a fallback for when this happens to try to avoid them on the next
> > +user attempt to submit a graphics job.
> > +
> > +The plan
> > +========
> > +
> > +On-demand allocation rules
> > +--------------------------
> > +
> > +First of all, all allocations happening in the fault handler path must
> > +be using GFP_NOWAIT. With this flag, low-hanging fruit can be picked
> > +(clean FS cache will be flushed for instance), but an error will be
> > +returned if no memory is readily available. GFP_NOWAIT will also trigger
> > +background reclaim to hopefully free-up some memory for our future
> > +requests.
> > +
> > +How to deal with allocation failures
> > +------------------------------------
> > +
> > +The first trick here is to try to guess approximately how much memory
> > +will be needed, and force-populate on-demand buffers with that amount
> > +of memory when the job is started. It's not about guessing the worst
> > +case scenario here, but more the most likely case, probably with a
> > +reasonable margin, so that the job is likely to succeed when this amount
> > +of memory is provided by the KMD.
> > +
> > +The second trick to try to avoid over-allocation, even with this
> > +sub-optimistic estimate, is to have a shared pool of memory that can be
> > +used by all GPU contexts when they need tiler/geometry memory. This
> > +implies returning chunks to this pool at some point, so other contexts
> > +can re-use those. Details about what this global memory pool implementation
> > +would look like is currently undefined, but it needs to be filled to
> > +guarantee that pre-allocation requests for on-demand buffers used by a
> > +GPU job can be satisfied in the fault handler path.  
> 
> Note one thing I haven't seen discussed is that across multiple contexts
> it's possible to prioritise jobs that free memory. E.g. a fragment job
> can be run to free up memory from a tiler heap, allowing pages to be
> returned to the global pool. This might imply a uAPI extension allowing
> a fragment job to automatically drop memory from a BO so that the kernel
> can have confidence that it will actually free up memory.
> 
> Sadly I don't think it's plausible to wait in the fault handler for a
> fragment job to complete to free up memory - so the best we can do here
> is postpone *starting* a vertex+tiler job if we're short on memory and
> have fragment jobs to run.

Right, we'll have to do with an internal dma_fence (returned
through drm_sched_ops::prepare_job()) that's controlling access to this
memory pool, so we're sure all currently queued tiler jobs (those
passed to ::run_job()) can have their estimated memory allocation
satisfied. But because it's just an estimate, there's still no guarantee
that the job won't try to allocate more, and thus no guarantee that
the job will always succeed.

> 
> > +
> > +As a last resort, we can try to allocate with GFP_ATOMIC if everything
> > +else fails, but this is a dangerous game, because we would be stealing
> > +memory from the atomic reserve, so it's not entirely clear if this is
> > +better than failing the job at this point.
> > +
> > +Ideas on how to make allocation failures decrease over time
> > +-----------------------------------------------------------
> > +
> > +When an on-demand allocation fails and the hardware doesn't have a
> > +flush-primitives fallback, we usually can't do much apart from failing the
> > +whole job. But it's important to try to avoid future allocation failures
> > +when the application creates a new context. There's no clear path for
> > +how to guess the actual size to force-populate on the next attempt. One
> > +option is to have a simple heuristics, like double the current resident size,
> > +but this has the downside of potentially taking a few attempts before reaching
> > +the stability point. Another option is to repeatedly map a dummy page at the
> > +fault addresses, so we can get a sense of how much memory was needed for this
> > +particular job.  
> 
> We'd have to double check that we don't cause extra problems with an
> aliasing heap like that. The tiler might attempt to read back data which
> could cause 'interesting' errors if it's getting clobbered.

Yeah, I thought about that too :-(.

> Given this
> is just a heuristic it might be ok, but it definitely needs more research.

I should probably make it clear that these options are based on
speculations about how the HW works, and they might prove impossible to
implement in practice. The reason I have them listed here is so Sima's
suggestions don't get lost in the original thread.

Thanks for reviewing the piece of doc. I'll leave a bit more time for
others to chime in, and post of v2 addressing your comments.

Boris
