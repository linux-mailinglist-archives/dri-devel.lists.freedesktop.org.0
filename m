Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F12436DDE0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4CE6EC0C;
	Wed, 28 Apr 2021 17:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E386ECF4;
 Wed, 28 Apr 2021 17:08:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AEBC613B4;
 Wed, 28 Apr 2021 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619629679;
 bh=2WlyTpJhOK8+t2ttrlHtaM9093vyRXwgOV8boRvkLUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mFOXupRKqAdNV6IMJMsESi0bHn/cHvJDz10bhnQHmlWoPO1fyEB6oad7EyF/Ruowt
 gO0EbhYyvz3THC2JG1lDn9O5LQn6D/TC/yL3cZVUfeRYzl3w3dZ6iv8V7ofDljsPFW
 ZPqSntNyf8li5s/U0L5OvJubEEJo7q8WykY880mRcKmCZW0s4hQLlT1QaIZ/vhcP7w
 OsfjhBw5m2rXi9AmcDw1k5whb17kPWuO/GR/IvWryIE8vYTvCEh89nC6h/cmgLoPr2
 NB+EeeynBRvf/D7KL5GO0PTbe1X9wuLSr8+p7+smdmCg7D6xokBJHMFS0WW6hYPbEm
 MAjFU6BKrTYRg==
Date: Wed, 28 Apr 2021 12:07:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 00/27] RFC Support hot device unplug in amdgpu
Message-ID: <20210428170757.GA239840@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 11:11:40AM -0400, Andrey Grodzovsky wrote:
> Until now extracting a card either by physical extraction (e.g. eGPU with =

> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devi=
ces/device_id/remove) =

> would cause random crashes in user apps. The random crashes in apps were =

> mostly due to the app having mapped a device backed BO into its address =

> space was still trying to access the BO while the backing device was gone.
> To answer this first problem Christian suggested to fix the handling of m=
apped =

> memory in the clients when the device goes away by forcibly unmap all buf=
fers the =

> user processes has by clearing their respective VMAs mapping the device B=
Os. =

> Then when the VMAs try to fill in the page tables again we check in the f=
ault =

> handlerif the device is removed and if so, return an error. This will gen=
erate a =

> SIGBUS to the application which can then cleanly terminate.This indeed wa=
s done =

> but this in turn created a problem of kernel OOPs were the OOPSes were du=
e to the =

> fact that while the app was terminating because of the SIGBUSit would tri=
gger use =

> after free in the driver by calling to accesses device structures that we=
re already =

> released from the pci remove sequence.This was handled by introducing a '=
flush' =

> sequence during device removal were we wait for drm file reference to dro=
p to 0 =

> meaning all user clients directly using this device terminated.

If DRM includes cover letters in merges, maybe fix the below.  If they
also include the v2, v3, etc below, also consider picking a line
width and sticking to it.  It seems to be creeping wider every rev.

BO?
s/syfs/sysfs/
s/forcibly unmap/forcibly unmapping/
s/handlerif/handler if/
s/processes has/processes have/
s/terminate.This/terminate. This/
s/were the/where the/
s/SIGBUSit/SIGBUS it/
s/to accesses/to access/
s/sequence.This/sequence. This/
s/were we/where we/

> v2:
> Based on discussions in the mailing list with Daniel and Pekka [1] and ba=
sed on the document =

> produced by Pekka from those discussions [2] the whole approach with retu=
rning SIGBUS and =

> waiting for all user clients having CPU mapping of device BOs to die was =
dropped. =

> Instead as per the document suggestion the device structures are kept ali=
ve until =

> the last reference to the device is dropped by user client and in the mea=
nwhile all existing and new CPU mappings of the BOs =

> belonging to the device directly or by dma-buf import are rerouted to per=
 user =

> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' sec=
tion of [2] =

> since i am trying to get the minimal set of requirements that still give =
useful solution =

> to work and this is the'Requirements for Render and Cross-Device UAPI' se=
ction and so my =

> test case is removing a secondary device, which is render only and is not=
 involved =

> in KMS.
> =

> v3:
> More updates following comments from v2 such as removing loop to find DRM=
 file when rerouting =

> page faults to dummy page,getting rid of unnecessary sysfs handling refac=
toring and moving =

> prevention of GPU recovery post device unplug from amdgpu to scheduler la=
yer. =

> On top of that added unplug support for the IOMMU enabled system.
> =

> v4:
> Drop last sysfs hack and use sysfs default attribute.
> Guard against write accesses after device removal to avoid modifying rele=
ased memory.
> Update dummy pages handling to on demand allocation and release through d=
rm managed framework.
> Add return value to scheduler job TO handler (by Luben Tuikov) and use th=
is in amdgpu for prevention =

> of GPU recovery post device unplug
> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
> =

> v5:
> The most significant in this series is the improved protection from kerne=
l driver accessing MMIO ranges that were allocated
> for the device once the device is gone. To do this, first a patch 'drm/am=
dgpu: Unmap all MMIO mappings' is introduced.
> This patch unamps all MMIO mapped into the kernel address space in the fo=
rm of BARs and kernel BOs with CPU visible VRAM mappings.
> This way it helped to discover multiple such access points because a page=
 fault would be immediately generated on access. Most of them
> were solved by moving HW fini code into pci_remove stage (patch drm/amdgp=
u: Add early fini callback) and for some who =

> were harder to unwind drm_dev_enter/exit scoping was used. In addition al=
l the IOCTLs and all background work and timers =

> are now protected with drm_dev_enter/exit at their root in an attempt tha=
t after drm_dev_unplug is finished none of them =

> run anymore and the pci_remove thread is the only thread executing which =
might touch the HW. To prevent deadlocks in such =

> case against threads stuck on various HW or SW fences patches 'drm/amdgpu=
: Finalise device fences on device remove' =A0
> and drm/amdgpu: Add rw_sem to pushing job into sched queue' take care of =
force signaling all such existing fences =

> and rejecting any newly added ones.
> =

> With these patches I am able to gracefully remove the secondary card usin=
g sysfs remove hook while glxgears is running off of secondary =

> card (DRI_PRIME=3D1) without kernel oopses or hangs and keep working with=
 the primary card or soft reset the device without hangs or oopses.
> Also as per Daniel's comment I added 3 tests to IGT [4] to core_hotunplug=
 test suite - remove device while commands are submitted, =

> exported BO and exported fence (not pushed yet).
> Also now it's possible to plug back the device after unplug =

> Also some users now can successfully use those patches with eGPU boxes[3].
> =

> =

> =

> =

> TODOs for followup work:
> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and=
 allocations) (Daniel)
> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging p=
rimary, display connected card.
> =

> [1] - Discussions during v4 of the patchset https://lists.freedesktop.org=
/archives/amd-gfx/2021-January/058595.html
> [2] - drm/doc: device hot-unplug for userspace https://www.spinics.net/li=
sts/dri-devel/msg259755.html
> [3] - Related gitlab ticket https://gitlab.freedesktop.org/drm/amd/-/issu=
es/1081
> [4] - https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/mas=
ter
> =

> Andrey Grodzovsky (27):
>   drm/ttm: Remap all page faults to per process dummy page.
>   drm/ttm: Expose ttm_tt_unpopulate for driver use
>   drm/amdgpu: Split amdgpu_device_fini into early and late
>   drm/amdkfd: Split kfd suspend from devie exit
>   drm/amdgpu: Add early fini callback
>   drm/amdgpu: Handle IOMMU enabled case.
>   drm/amdgpu: Remap all page faults to per process dummy page.
>   PCI: add support for dev_groups to struct pci_device_driver
>   dmr/amdgpu: Move some sysfs attrs creation to default_attr
>   drm/amdgpu: Guard against write accesses after device removal
>   drm/sched: Make timeout timer rearm conditional.
>   drm/amdgpu: Prevent any job recoveries after device is unplugged.
>   drm/amdgpu: When filizing the fence driver. stop scheduler first.
>   drm/amdgpu: Fix hang on device removal.
>   drm/scheduler: Fix hang when sched_entity released
>   drm/amdgpu: Unmap all MMIO mappings
>   drm/amdgpu: Add rw_sem to pushing job into sched queue
>   drm/sched: Expose drm_sched_entity_kill_jobs
>   drm/amdgpu: Finilise device fences on device remove.
>   drm: Scope all DRM IOCTLs  with drm_dev_enter/exit
>   drm/amdgpu: Add support for hot-unplug feature at DRM level.
>   drm/amd/display: Scope all DM queued work with drm_dev_enter/exit
>   drm/amd/powerplay: Scope all PM queued work with drm_dev_enter/exit
>   drm/amdkfd: Scope all KFD queued work with drm_dev_enter/exit
>   drm/amdgpu: Scope all amdgpu queued work with drm_dev_enter/exit
>   drm/amd/display: Remove superflous drm_mode_config_cleanup
>   drm/amdgpu: Verify DMA opearations from device are done
> =

>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  18 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  |  17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  13 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 353 ++++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  34 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  34 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c      |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h      |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |   9 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  25 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        | 228 +++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |  61 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h       |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  33 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c      |  28 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  41 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |   7 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 115 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  56 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |  70 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |  52 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  21 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  74 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |  45 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  83 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  14 +-
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c           |   3 +-
>  drivers/gpu/drm/amd/amdgpu/cz_ih.c            |   3 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c         |  10 +-
>  drivers/gpu/drm/amd/amdgpu/iceland_ih.c       |   3 +-
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |   5 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        |  44 +--
>  drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |   8 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |   8 +-
>  drivers/gpu/drm/amd/amdgpu/si_ih.c            |   3 +-
>  drivers/gpu/drm/amd/amdgpu/tonga_ih.c         |   3 +-
>  drivers/gpu/drm/amd/amdgpu/vce_v4_0.c         |  26 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |  22 +-
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   5 +-
>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   3 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c    |  14 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  13 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    | 124 +++---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c |  24 +-
>  drivers/gpu/drm/amd/include/amd_shared.h      |   2 +
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  44 ++-
>  .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c |   2 +
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  26 +-
>  drivers/gpu/drm/drm_ioctl.c                   |  15 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      |   6 +-
>  drivers/gpu/drm/scheduler/sched_main.c        |  35 +-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c               |  79 +++-
>  drivers/gpu/drm/ttm/ttm_tt.c                  |   1 +
>  drivers/pci/pci-driver.c                      |   1 +
>  include/drm/drm_drv.h                         |   6 +
>  include/drm/gpu_scheduler.h                   |   1 +
>  include/drm/ttm/ttm_bo_api.h                  |   2 +
>  include/linux/pci.h                           |   3 +
>  64 files changed, 1388 insertions(+), 633 deletions(-)
> =

> -- =

> 2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
