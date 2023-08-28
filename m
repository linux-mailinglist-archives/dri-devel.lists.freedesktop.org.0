Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145FE78B45A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CFB10E2FF;
	Mon, 28 Aug 2023 15:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728ED10E2FE;
 Mon, 28 Aug 2023 15:24:11 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 4A606660716E;
 Mon, 28 Aug 2023 16:24:08 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <55db-64ecb100-57-403f1500@96946290>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 28 Aug 2023 16:24:08 +0100
To: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
MIME-Version: 1.0
Message-ID: <6d93-64ecbc00-3-3c8ca040@163557744>
Subject: =?utf-8?q?Re=3A?= [PATCH v15 00/23] Add generic memory shrinker to 
 VirtIO-GPU and Panfrost DRM drivers
User-Agent: SOGoMail 5.8.4
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
Cc: Mark Rutland <mark.rutland@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, August 28, 2023 11:37 -03, "Helen Mae Koike Fornazier" <hele=
n.koike@collabora.com> wrote:

> On Sunday, August 27, 2023 14:54 -03, Dmitry Osipenko <dmitry.osipenk=
o@collabora.com> wrote:
>=20
> > This series:
> >=20
> >   1. Adds common drm-shmem memory shrinker
> >   2. Enables shrinker for VirtIO-GPU driver
> >   3. Switches Panfrost driver to the common shrinker
>=20
> Hi Dmitry,=20
>=20
> Would you mind testing with drm-ci? We virt-io tests there and it wou=
ld be
> really great to get your feedback of it.
>=20
> https://cgit.freedesktop.org/drm/drm/log/?h=3Dtopic/drm-ci

sorry, I forgot that you also need this patchset:
    https://lists.freedesktop.org/archives/dri-devel/2023-August/420063=
.html
to enable virtio=5Fgpu test job.

Thanks again.
Helen

>=20
> You need to merge your changes with the above tree.
> To configure it, you just need to have a tree on gitlab.freedesktop.o=
rg,
> go to the settings and change the CI/CD configuration file from .gitl=
ab-ci.yml
> to drivers/gpu/drm/ci/gitlab-ci.yml, and you can start a pipeline
> on your branch.
>=20
> at the time of this writting, gitlab.freedesktop.org is under mainten=
ance,
> but it should be back soon.
>=20
> Thank you!
> Helen
>=20
> >=20
> > Changelog:
> >=20
> > v15:- Moved drm-shmem reference counters to use kref that allows to
> >       optimize unlocked functions, like was suggested by Boris Brez=
illon.
> >=20
> >     - Changed drm/gem/shmem function names to use =5Flocked postfix=
 and
> >       dropped the =5Funlocked, making the naming scheme consistent =
across
> >       DRM code, like was suggested by Boris Brezillon.
> >=20
> >     - Added patch that fixes UAF in drm-shmem for drivers that impo=
rt
> >       dma-buf and then release buffer in the import error code path=
.
> >=20
> >     - Added patch that makes drm-shmem use new flag for SGT's get=5F=
pages()
> >       refcounting, preventing unbalanced refcounting when GEM is fr=
eed.
> >=20
> >     - Fixed guest blob pinning in virtio-gpu driver that was missed
> >       previously in the shrinker patch.
> >=20
> >     - Moved VC4 and virtio-gpu drivers to use drm=5Fgem=5Fput() in
> >       GEM-creation error code paths, which is now required by drm-s=
hmem
> >       and was missed in a previous patch versions.
> >=20
> >     - Virtio-GPU now attaches shmem pages to host on first use and =
not
> >       when BO is created. In older patch versions there was a poten=
tial
> >       race condition in the BO creation code path where both
> >       get=5Fsgt()+object=5Fattach() should've been made under same =
resv lock,
> >       otherwise pages could be evicted before attachment is invoked=
.
> >=20
> >     - Virtio-GPU and drm-shmem shrinker patches are split into smal=
ler
> >       ones.
> >=20
> > v14:- All the prerequisite reservation locking patches landed upstr=
eam,
> >       previously were a part of this series in v13 and older.
> >=20
> >         https://lore.kernel.org/dri-devel/20230529223935.2672495-1-=
dmitry.osipenko@collabora.com/
> >=20
> >     - Added patches to improve locked/unlocked function names, like=
 was
> >       suggested by Boris Brezillon for v13.
> >=20
> >     - Made all exported drm-shmem symbols GPL, like was previously
> >       discussed with Thomas Zimmermann on this series.
> >=20
> >     - Improved virtio-gpu shrinker patch. Now it won't detach purge=
d BO
> >       when userspace closes GEM. Crosvm (and not qemu) checks res=5F=
id on
> >       CMD=5FCTX=5FDETACH=5FRESOURCE and prints noisy error message =
if ID is
> >       invalid, which wasn't noticed before.
> >=20
> > v13:- Updated virtio-gpu shrinker patch to use drm=5Fgem=5Fshmem=5F=
object=5Fpin()
> >       directly instead of drm=5Fgem=5Fpin() and dropped patch that =
exported
> >       drm=5Fgem=5Fpin() functions, like was requested by Thomas Zim=
mermann in
> >       v12.
> >=20
> > v12:- Fixed the "no previous prototype for function" warning report=
ed by
> >       kernel build bot for v11.
> >=20
> >     - Fixed the missing reservation lock reported by Intel CI for V=
GEM
> >       driver. Other drivers using drm-shmem were affected similarly=
 to
> >       VGEM. The problem was in the dma-buf attachment code path tha=
t led
> >       to drm-shmem pinning function which assumed the held reservat=
ion lock
> >       by drm=5Fgem=5Fpin(). In the past that code path was causing =
trouble for
> >       i915 driver and we've changed the locking scheme for the atta=
chment
> >       code path in the dma-buf core to let exporters to handle the =
locking
> >       themselves. After a closer investigation, I realized that my =
assumption
> >       about testing of dma-buf export code path using Panfrost driv=
er was
> >       incorrect. Now I created additional local test to exrecise th=
e Panfrost
> >       export path. I also reproduced the issue reported by the Inte=
l CI for
> >       v10. It's all fixed now by making the drm=5Fgem=5Fshmem=5Fpin=
() to take the
> >       resv lock by itself.
> >=20
> >     - Patches are based on top of drm-tip, CC'd intel-gfx CI for te=
sting.
> >=20
> > v11:- Rebased on a recent linux-next. Added new patch as a result:
> >=20
> >         drm/shmem-helper: Export drm=5Fgem=5Fshmem=5Fget=5Fpages=5F=
sgt=5Flocked()
> >=20
> >         It's needed by the virtio-gpu driver to swap-in/unevict shm=
em
> >         object, previously get=5Fpages=5Fsgt() didn't use locking.
> >=20
> >     - Separated the "Add memory shrinker" patch into smaller parts =
to ease
> >       the reviewing, as was requested by Thomas Zimmermann:
> >=20
> >         drm/shmem-helper: Factor out pages alloc/release from
> >           drm=5Fgem=5Fshmem=5Fget/put=5Fpages()
> >         drm/shmem-helper: Add pages=5Fpin=5Fcount field
> >         drm/shmem-helper: Switch drm=5Fgem=5Fshmem=5Fvmap/vunmap to=
 use pin/unpin
> >         drm/shmem-helper: Factor out unpinning part from drm=5Fgem=5F=
shmem=5Fpurge()
> >=20
> >     - Addessed the v10 review comments from Thomas Zimmermann: retu=
rn errno
> >       instead of bool, sort code alphabetically, rename function an=
d etc
> >       minor changes.
> >=20
> >     - Added new patch to remove the "map->is=5Fiomem" from drm-shme=
m, as
> >       was suggested by Thomas Zimmermann.
> >=20
> >     - Added acks and r-b's that were given to v10.
> >=20
> > v10:- Was partially applied to misc-fixes/next.
> >=20
> >       https://lore.kernel.org/dri-devel/6c16f303-81df-7ebe-85e9-51b=
b40a8b301@collabora.com/T/
> >=20
> > Dmitry Osipenko (23):
> >   drm/shmem-helper: Fix UAF in error path when freeing SGT of impor=
ted
> >     GEM
> >   drm/shmem-helper: Use flag for tracking page count bumped by
> >     get=5Fpages=5Fsgt()
> >   drm/gem: Change locked/unlocked postfix of drm=5Fgem=5Fv/unmap() =
function
> >     names
> >   drm/gem: Add =5Flocked postfix to functions that have unlocked
> >     counterpart
> >   drm/v3d: Replace open-coded drm=5Fgem=5Fshmem=5Ffree() with
> >     drm=5Fgem=5Fobject=5Fput()
> >   drm/virtio: Replace drm=5Fgem=5Fshmem=5Ffree() with drm=5Fgem=5Fo=
bject=5Fput()
> >   drm/shmem-helper: Make all exported symbols GPL
> >   drm/shmem-helper: Refactor locked/unlocked functions
> >   drm/shmem-helper: Remove obsoleted is=5Fiomem test
> >   locking/refcount, kref: Add kref=5Fput=5Fww=5Fmutex()
> >   dma-resv: Add kref=5Fput=5Fdma=5Fresv()
> >   drm/shmem-helper: Add and use pages=5Fpin=5Fcount
> >   drm/shmem-helper: Use kref for pages=5Fuse=5Fcount
> >   drm/shmem-helper: Add and use lockless drm=5Fgem=5Fshmem=5Fget=5F=
pages()
> >   drm/shmem-helper: Switch drm=5Fgem=5Fshmem=5Fvmap/vunmap to use p=
in/unpin
> >   drm/shmem-helper: Use kref for vmap=5Fuse=5Fcount
> >   drm/shmem-helper: Add and use drm=5Fgem=5Fshmem=5Fresv=5Fassert=5F=
held() helper
> >   drm/shmem-helper: Add memory shrinker
> >   drm/shmem-helper: Export drm=5Fgem=5Fshmem=5Fget=5Fpages=5Fsgt=5F=
locked()
> >   drm/virtio: Pin display framebuffer BO
> >   drm/virtio: Attach shmem BOs dynamically
> >   drm/virtio: Support memory shrinking
> >   drm/panfrost: Switch to generic memory shrinker
> >=20
> >  drivers/gpu/drm/drm=5Fclient.c                  |   6 +-
> >  drivers/gpu/drm/drm=5Fgem.c                     |  26 +-
> >  drivers/gpu/drm/drm=5Fgem=5Fframebuffer=5Fhelper.c  |   6 +-
> >  drivers/gpu/drm/drm=5Fgem=5Fshmem=5Fhelper.c        | 616 ++++++++=
+++++++---
> >  drivers/gpu/drm/drm=5Finternal.h                |   4 +-
> >  drivers/gpu/drm/drm=5Fprime.c                   |   4 +-
> >  drivers/gpu/drm/lima/lima=5Fgem.c               |  11 +-
> >  drivers/gpu/drm/lima/lima=5Fsched.c             |   4 +-
> >  drivers/gpu/drm/panfrost/Makefile             |   1 -
> >  drivers/gpu/drm/panfrost/panfrost=5Fdevice.h    |   4 -
> >  drivers/gpu/drm/panfrost/panfrost=5Fdrv.c       |  29 +-
> >  drivers/gpu/drm/panfrost/panfrost=5Fdump.c      |   4 +-
> >  drivers/gpu/drm/panfrost/panfrost=5Fgem.c       |  36 +-
> >  drivers/gpu/drm/panfrost/panfrost=5Fgem.h       |   9 -
> >  .../gpu/drm/panfrost/panfrost=5Fgem=5Fshrinker.c  | 122 ----
> >  drivers/gpu/drm/panfrost/panfrost=5Fjob.c       |  18 +-
> >  drivers/gpu/drm/panfrost/panfrost=5Fmmu.c       |   4 +-
> >  drivers/gpu/drm/panfrost/panfrost=5Fperfcnt.c   |   6 +-
> >  drivers/gpu/drm/v3d/v3d=5Fbo.c                  |  26 +-
> >  drivers/gpu/drm/virtio/virtgpu=5Fdrv.h          |  22 +-
> >  drivers/gpu/drm/virtio/virtgpu=5Fgem.c          |  80 +++
> >  drivers/gpu/drm/virtio/virtgpu=5Fioctl.c        |  57 +-
> >  drivers/gpu/drm/virtio/virtgpu=5Fkms.c          |   8 +
> >  drivers/gpu/drm/virtio/virtgpu=5Fobject.c       | 147 ++++-
> >  drivers/gpu/drm/virtio/virtgpu=5Fplane.c        |  17 +-
> >  drivers/gpu/drm/virtio/virtgpu=5Fsubmit.c       |  15 +-
> >  drivers/gpu/drm/virtio/virtgpu=5Fvq.c           |  40 ++
> >  include/drm/drm=5Fdevice.h                      |  10 +-
> >  include/drm/drm=5Fgem.h                         |   6 +-
> >  include/drm/drm=5Fgem=5Fshmem=5Fhelper.h            | 141 +++-
> >  include/linux/dma-resv.h                      |   9 +
> >  include/linux/kref.h                          |  12 +
> >  include/linux/refcount.h                      |   5 +
> >  include/uapi/drm/virtgpu=5Fdrm.h                |  14 +
> >  lib/refcount.c                                |  34 +
> >  35 files changed, 1167 insertions(+), 386 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/panfrost/panfrost=5Fgem=5Fshrin=
ker.c
> >=20
> > --=20
> > 2.41.0
> >
>

