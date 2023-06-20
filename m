Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD17367A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BDB10E2A2;
	Tue, 20 Jun 2023 09:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAA110E2A2;
 Tue, 20 Jun 2023 09:25:44 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D2406606F8A;
 Tue, 20 Jun 2023 10:25:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687253143;
 bh=po+0w7hH7d94WQNfAnbrVCp8PuY7vjS5JdjWgMLN04A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IakTQrgPnE6U17ByX38rn6kOLSna7kaud66wBQKOr+Rgw9zNnxUg7zNn0S0ZB31B8
 B881y1t0TTidWNK3zjbxG9ACKZtvaq34xKAQIm3EokGQwG61L2qrCqBB46O0B1aNQg
 OiD5xwlyFNxoMkCI2RyJDV71MRMVUepyBiexohngvZRqWlMQQTrNpTPJvRccVK8huS
 2/FNyM4tvLsjuFDNELaU6eBFz3TyoN0DU8FvyYM43GDCtjQEqCXqHd45yFL50NvnGa
 rkvMQxK1LAsF6PhCo14WW2ZfpyenAEONtPJs0rpxHFygPyL+eqY6ckdUOuirIHh1Cl
 r4yDGxj8Pq7hA==
Date: Tue, 20 Jun 2023 11:25:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v5 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Message-ID: <20230620112540.19142ef3@collabora.com>
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Tue, 20 Jun 2023 02:42:03 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> This patch series provides a new UAPI for the Nouveau driver in order to
> support Vulkan features, such as sparse bindings and sparse residency.
>=20
> Furthermore, with the DRM GPUVA manager it provides a new DRM core featur=
e to
> keep track of GPU virtual address (VA) mappings in a more generic way.
>=20
> The DRM GPUVA manager is indented to help drivers implement userspace-man=
ageable
> GPU VA spaces in reference to the Vulkan API. In order to achieve this go=
al it
> serves the following purposes in this context.
>=20
>     1) Provide infrastructure to track GPU VA allocations and mappings,
>        making use of the maple_tree.
>=20
>     2) Generically connect GPU VA mappings to their backing buffers, in
>        particular DRM GEM objects.
>=20
>     3) Provide a common implementation to perform more complex mapping
>        operations on the GPU VA space. In particular splitting and merging
>        of GPU VA mappings, e.g. for intersecting mapping requests or part=
ial
>        unmap requests.
>=20
> The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, itself
> providing the following new interfaces.
>=20
>     1) Initialize a GPU VA space via the new DRM_IOCTL_NOUVEAU_VM_INIT io=
ctl
>        for UMDs to specify the portion of VA space managed by the kernel =
and
>        userspace, respectively.
>=20
>     2) Allocate and free a VA space region as well as bind and unbind mem=
ory
>        to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>=20
>     3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>=20
> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use of t=
he DRM
> scheduler to queue jobs and support asynchronous processing with DRM sync=
objs
> as synchronization mechanism.
>=20
> By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>=20
> The new VM_BIND UAPI for Nouveau makes also use of drm_exec (execution co=
ntext
> for GEM buffers) by Christian K=C3=B6nig. Since the patch implementing dr=
m_exec was
> not yet merged into drm-next it is part of this series, as well as a smal=
l fix
> for this patch, which was found while testing this series.
>=20
> This patch series is also available at [1].
>=20
> There is a Mesa NVK merge request by Dave Airlie [2] implementing the
> corresponding userspace parts for this series.
>=20
> The Vulkan CTS test suite passes the sparse binding and sparse residency =
test
> cases for the new UAPI together with Dave's Mesa work.
>=20
> There are also some test cases in the igt-gpu-tools project [3] for the n=
ew UAPI
> and hence the DRM GPU VA manager. However, most of them are testing the D=
RM GPU
> VA manager's logic through Nouveau's new UAPI and should be considered ju=
st as
> helper for implementation.
>=20
> However, I absolutely intend to change those test cases to proper kunit t=
est
> cases for the DRM GPUVA manager, once and if we agree on it's usefulness =
and
> design.
>=20
> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-n=
ext /
>     https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
> [2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
> [3] https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_=
vm_bind
>=20
> Changes in V2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Nouveau:
>     - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in fe=
nce
>       signalling critical sections. Updates to the VA space are split up =
in three
>       separate stages, where only the 2. stage executes in a fence signal=
ling
>       critical section:
>=20
>         1. update the VA space, allocate new structures and page tables
>         2. (un-)map the requested memory bindings
>         3. free structures and page tables
>=20
>     - Separated generic job scheduler code from specific job implementati=
ons.
>     - Separated the EXEC and VM_BIND implementation of the UAPI.
>     - Reworked the locking parts of the nvkm/vmm RAW interface, such that
>       (un-)map operations can be executed in fence signalling critical se=
ctions.
>=20
>   GPUVA Manager:
>     - made drm_gpuva_regions optional for users of the GPUVA manager
>     - allow NULL GEMs for drm_gpuva entries
>     - swichted from drm_mm to maple_tree for track drm_gpuva / drm_gpuva_=
region
>       entries
>     - provide callbacks for users to allocate custom drm_gpuva_op structu=
res to
>       allow inheritance
>     - added user bits to drm_gpuva_flags
>     - added a prefetch operation type in order to support generating pref=
etch
>       operations in the same way other operations generated
>     - hand the responsibility for mutual exclusion for a GEM's
>       drm_gpuva list to the user; simplified corresponding (un-)link func=
tions
>=20
>   Maple Tree:
>     - I added two maple tree patches to the series, one to support custom=
 tree
>       walk macros and one to hand the locking responsibility to the user =
of the
>       GPUVA manager without pre-defined lockdep checks.
>=20
> Changes in V3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Nouveau:
>     - Reworked the Nouveau VM_BIND UAPI to do the job cleanup (including =
page
>       table cleanup) within a workqueue rather than the job_free() callba=
ck of
>       the scheduler itself. A job_free() callback can stall the execution=
 (run()
>       callback) of the next job in the queue. Since the page table cleanup
>       requires to take the same locks as need to be taken for page table
>       allocation, doing it directly in the job_free() callback would still
>       violate the fence signalling critical path.
>     - Separated Nouveau fence allocation and emit, such that we do not vi=
olate
>       the fence signalling critical path in EXEC jobs.
>     - Implement "regions" (for handling sparse mappings through PDEs and =
dual
>       page tables) within Nouveau.
>     - Drop the requirement for every mapping to be contained within a reg=
ion.
>     - Add necassary synchronization of VM_BIND job operation sequences in=
 order
>       to work around limitations in page table handling. This will be add=
ressed
>       in a future re-work of Nouveau's page table handling.
>     - Fixed a couple of race conditions found through more testing. Thank=
s to
>       Dave for consitently trying to break it. :-)
>=20
>   GPUVA Manager:
>     - Implement pre-allocation capabilities for tree modifications within=
 fence
>       signalling critical sections.
>     - Implement accessors to to apply tree modification while walking the=
 GPUVA
>       tree in order to actually support processing of drm_gpuva_ops throu=
gh
>       callbacks in fence signalling critical sections rather than through
>       pre-allocated operation lists.
>     - Remove merging of GPUVAs; the kernel has limited to none knowlege a=
bout
>       the semantics of mapping sequences. Hence, merging is purely specul=
ative.
>       It seems that gaining a significant (or at least a measurable) perf=
ormance
>       increase through merging is way more likely to happen when userspac=
e is
>       responsible for merging mappings up to the next larger page size if
>       possible.
>     - Since merging was removed, regions pretty much loose their right to=
 exist.
>       They might still be useful for handling dual page tables or similar
>       mechanisms, but since Nouveau seems to be the only driver having a =
need
>       for this for now, regions were removed from the GPUVA manager.
>     - Fixed a couple of maple_tree related issues; thanks to Liam for hel=
ping me
>       out.
>=20
> Changes in V4:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Nouveau:
>     - Refactored how specific VM_BIND and EXEC jobs are created and how t=
heir
>       arguments are passed to the generic job implementation.
>     - Fixed a UAF race condition where bind job ops could have been freed
>       already while still waiting for a job cleanup to finish. This is du=
e to
>       in certain cases we need to wait for mappings actually being unmapp=
ed
>       before creating sparse regions in the same area.
>     - Re-based the code onto drm_exec v4 patch.
>=20
>   GPUVA Manager:
>     - Fixed a maple tree related bug when pre-allocating MA states.
>       (Boris Brezillion)
>     - Made struct drm_gpuva_fn_ops a const object in all occurrences.
>       (Boris Brezillion)
>=20
> Changes in V5:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Nouveau:
>     - Link and unlink GPUVAs outside the fence signalling critical path in
>       nouveau_uvmm_bind_job_submit() holding the dma-resv lock. Mutual ex=
clusion
>       of BO evicts causing mapping invalidation and regular mapping opera=
tions
>       is ensured with dma-fences.
>=20
>   GPUVA Manager:
>     - Removed the separate GEMs GPUVA list lock. Link and unlink as well =
as
>       iterating the GEM's GPUVA list should be protected with the GEM's d=
ma-resv
>       lock instead.
>     - Renamed DRM_GPUVA_EVICTED flag to DRM_GPUVA_INVALIDATED. Mappings d=
o not
>       get eviced, they might get invalidated due to eviction.
>     - Maple tree uses the 'unsinged long' type for node entries. While th=
is
>       works for GPU VA spaces larger than 32-bit on 64-bit kernel, the GP=
U VA
>       space is limited to 32-bit on 32-bit kernels as well.
>       As long as we do not have a 64-bit capable maple tree for 32-bit ke=
rnels,
>       the GPU VA manager contains checks to throw warnings when GPU VA en=
tries
>       exceed the maple tree's storage capabilities.
>     - Extended the Documentation and added example code as requested by D=
onald
>       Robson.
>=20
> Christian K=C3=B6nig (1):
>   drm: execution context for GEM buffers v4
>=20
> Danilo Krummrich (13):
>   maple_tree: split up MA_STATE() macro
>   drm: manager to keep track of GPUs VA mappings
>   drm: debugfs: provide infrastructure to dump a DRM GPU VA space

Core drm patches are=20

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

The only thing I'm worried about is the 'sync mapping requests have to
go through the async path and wait for all previous async requests to
be processed' problem I mentioned in one of your previous submission,
but I'm happy leave that for later.

>   drm/nouveau: new VM_BIND uapi interfaces
>   drm/nouveau: get vmm via nouveau_cli_vmm()
>   drm/nouveau: bo: initialize GEM GPU VA interface
>   drm/nouveau: move usercopy helpers to nouveau_drv.h
>   drm/nouveau: fence: separate fence alloc and emit
>   drm/nouveau: fence: fail to emit when fence context is killed
>   drm/nouveau: chan: provide nouveau_channel_kill()
>   drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
>   drm/nouveau: implement new VM_BIND uAPI
>   drm/nouveau: debugfs: implement DRM GPU VA debugfs
>=20
>  Documentation/gpu/driver-uapi.rst             |   11 +
>  Documentation/gpu/drm-mm.rst                  |   54 +
>  drivers/gpu/drm/Kconfig                       |    6 +
>  drivers/gpu/drm/Makefile                      |    3 +
>  drivers/gpu/drm/drm_debugfs.c                 |   41 +
>  drivers/gpu/drm/drm_exec.c                    |  278 +++
>  drivers/gpu/drm/drm_gem.c                     |    3 +
>  drivers/gpu/drm/drm_gpuva_mgr.c               | 1971 ++++++++++++++++
>  drivers/gpu/drm/nouveau/Kbuild                |    3 +
>  drivers/gpu/drm/nouveau/Kconfig               |    2 +
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |    9 +-
>  drivers/gpu/drm/nouveau/include/nvif/if000c.h |   26 +-
>  drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   19 +-
>  .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   20 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c       |   24 +
>  drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |  204 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.c        |   22 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   39 +
>  drivers/gpu/drm/nouveau/nouveau_dmem.c        |    9 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |   27 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |   94 +-
>  drivers/gpu/drm/nouveau/nouveau_exec.c        |  418 ++++
>  drivers/gpu/drm/nouveau/nouveau_exec.h        |   54 +
>  drivers/gpu/drm/nouveau/nouveau_fence.c       |   23 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.h       |    5 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |   62 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
>  drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |  461 ++++
>  drivers/gpu/drm/nouveau/nouveau_sched.h       |  123 +
>  drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 1979 +++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  107 +
>  drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
>  drivers/gpu/drm/nouveau/nvif/vmm.c            |  100 +-
>  .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  213 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  197 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   25 +
>  .../drm/nouveau/nvkm/subdev/mmu/vmmgf100.c    |   16 +-
>  .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   16 +-
>  .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c |   27 +-
>  include/drm/drm_debugfs.h                     |   25 +
>  include/drm/drm_drv.h                         |    6 +
>  include/drm/drm_exec.h                        |  119 +
>  include/drm/drm_gem.h                         |   52 +
>  include/drm/drm_gpuva_mgr.h                   |  682 ++++++
>  include/linux/maple_tree.h                    |    7 +-
>  include/uapi/drm/nouveau_drm.h                |  209 ++
>  51 files changed, 7566 insertions(+), 242 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_exec.c
>  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
>  create mode 100644 include/drm/drm_exec.h
>  create mode 100644 include/drm/drm_gpuva_mgr.h
>=20
>=20
> base-commit: 2222dcb0775d36de28992f56455ab3967b30d380

