Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE29CD011A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012B910EF9B;
	Fri, 19 Dec 2025 13:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="MQA9y81M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA2D10EF9A;
 Fri, 19 Dec 2025 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1766151067;
 bh=s5/3r47hmOMQ1SBGWZoI5Mg/yig5s+i4+6MsbuhmtTY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MQA9y81M6qVrBdkEKBwkoxFb+6VMcYF3MjQEiOyhJH3663CSUcuURbllZcPhsmghJ
 Q+2+K9hhgl4e9+U7Iuk5hX/a+30zltbjOg/iMBgFhWR8sjQf6qFF641FGPqLUKTuJJ
 12DY8C7r2x14GlRFgzWd+QG5kgv5KtQ046dl5fkCGb1AidJvK8LrSOPjcIJLZPVraP
 3VdWWqjPDwGg1kfICmK6gH4IQNhlPM2O4zmRiBW9C2Bne5pn4zAObecigQUwyq9BbT
 aoKgVo0CbdOZL9iaZJQmRSzT4hxyGnR0hyDegHpE0QLILO0pQrwUeJAX9yQiY1/b5A
 KZm8/Tu3rD8hg==
Message-ID: <b2594616-df29-4fca-bf2c-11a46de3a529@lankhorst.se>
Date: Fri, 19 Dec 2025 14:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/24] Dynamic drm_pagemaps and Initial multi-device SVM
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com, Simona Vetter
 <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hey,

For merging the pagemap patches through drm-xe:

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2025-12-19 kl. 12:32, skrev Thomas Hellström:
> This series aims at providing an initial implementation of multi-device
> SVM, where communitcation with peers (migration and direct execution out
> of peer memory) uses some form of fast interconnect. In this series
> we're using pcie p2p.
> 
> In a multi-device environment, the struct pages for device-private memory
> (the dev_pagemap) may take up a significant amount of system memory. We
> therefore want to provide a means of revoking / removing the dev_pagemaps
> not in use. In particular when a device is offlined, we want to block
> migrating *to* the device memory and migrate data already existing in the
> devices memory to system. The dev_pagemap then becomes unused and can be
> removed.
> 
> Removing and setting up a large dev_pagemap is also quite time-consuming,
> so removal of unused dev_pagemaps only happens on system memory pressure
> using a shrinker.
> 
> Patch 1 is a small debug printout fix.
> Patch 2 removes some dead code.
> Patch 3 fixes a condition where memory was used while being cleared.
> Patches 4-9 deals with dynamic drm_pagemaps as described above.
> Patches 10-14 adds infrastructure to handle remote drm_pagemaps with
> fast interconnects.
> Patch 15 extends the xe madvise() UAPI to handle remote drm_pagemaps.
> Patch 16 adds a pcie-p2p dma SVM interconnect to the xe driver.
> Patch 17 adds some SVM-related debug printouts for xe.
> Patch 18 adds documentation on how the drm_pagemaps are reference counted.
> Patch 19 Cleans up the usage of the dev_private owner.
> Patch 20 Introduces a gpusvm function to scan the current CPU address space.
> Patch 21 Uses the above function in Xe to avoid unnecessary migrations.
> Patch 22 Adds drm_pagemap support for p2p destination migration.
> Patch 23 Adds drm_pagemap support for p2p source migration.
> Patch 24 Adds an rwsem to optionally serialize migration.
> 
> What's still missing is implementation of migration policies.
> That will be implemented in follow-up series. 
> 
> v2:
> - Address review comments from Matt Brost.
> - Fix compilation issues reported by automated testing
> - Add patch 1, 17.
> - What's now patch 16 was extended to support p2p migration.
> v3:
> - Add patches 2, 18, 19, 10, 22. Main functionality is the address space
>   scan to avoid unnecessary migration, and p2p source migration which
>   is needed on Xe to decompress and to flush out the L2 cache.
> - Rework what's now Patch 21 slightly.
> - Minor fixes all over the place.
> v4:
> - Fix a build error (CI)
> - Fix possibly incorrect waiting for the pre_migrate_fence.
> v5:
> - New patch: broken out from patch 22: drm/pagemap: Remove some dead code
>   (Matt Brost)
> - New patch:  drm/xe/svm: Serialize migration to device if racing
>   (Matt Brost)
> - Fix a UAF in what's now patch 3. (CI)
> - Release the migrate fence early in patch 3.
> - Address review comments to patch 3. See the patch for details.
> - Address review comments to patch 22. See the patch for details.
> - Rebase, update R-Bs.
> v6:
> - Fix in patch 3. (Matt Brost)
> - Rebase patch 23 on fix in patch 3.
> - Update R-Bs.
> 
> Test-with: 20251204085432.35023-1-nishit.sharma@intel.com
> 
> Thomas Hellström (24):
>   drm/xe/svm: Fix a debug printout
>   drm/pagemap: Remove some dead code
>   drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before
>     use
>   drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap
>   drm/pagemap: Add a refcounted drm_pagemap backpointer to struct
>     drm_pagemap_zdd
>   drm/pagemap, drm/xe: Manage drm_pagemap provider lifetimes
>   drm/pagemap: Add a drm_pagemap cache and shrinker
>   drm/xe: Use the drm_pagemap cache and shrinker
>   drm/pagemap: Remove the drm_pagemap_create() interface
>   drm/pagemap_util: Add a utility to assign an owner to a set of
>     interconnected gpus
>   drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
>   drm/xe: Pass a drm_pagemap pointer around with the memory advise
>     attributes
>   drm/xe: Use the vma attibute drm_pagemap to select where to migrate
>   drm/xe: Simplify madvise_preferred_mem_loc()
>   drm/xe/uapi: Extend the madvise functionality to support foreign
>     pagemap placement for svm
>   drm/xe: Support pcie p2p dma as a fast interconnect
>   drm/xe/vm: Add a couple of VM debug printouts
>   drm/xe/svm: Document how xe keeps drm_pagemap references
>   drm/pagemap, drm/xe: Clean up the use of the device-private page owner
>   drm/gpusvm: Introduce a function to scan the current migration state
>   drm/xe: Use drm_gpusvm_scan_mm()
>   drm/pagemap, drm/xe: Support destination migration over interconnect
>   drm/pagemap: Support source migration over interconnect
>   drm/xe/svm: Serialize migration to device if racing
> 
>  drivers/gpu/drm/Makefile             |   3 +-
>  drivers/gpu/drm/drm_gpusvm.c         | 124 +++++
>  drivers/gpu/drm/drm_pagemap.c        | 565 +++++++++++++++++----
>  drivers/gpu/drm/drm_pagemap_util.c   | 568 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |  20 +
>  drivers/gpu/drm/xe/xe_device.h       |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_migrate.c      |  29 +-
>  drivers/gpu/drm/xe/xe_migrate.h      |   6 +-
>  drivers/gpu/drm/xe/xe_svm.c          | 721 ++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_svm.h          |  85 +++-
>  drivers/gpu/drm/xe/xe_tile.c         |  34 +-
>  drivers/gpu/drm/xe/xe_tile.h         |  21 +
>  drivers/gpu/drm/xe/xe_userptr.c      |   2 +-
>  drivers/gpu/drm/xe/xe_vm.c           |  65 ++-
>  drivers/gpu/drm/xe/xe_vm.h           |   1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c   | 106 +++-
>  drivers/gpu/drm/xe/xe_vm_types.h     |  21 +-
>  drivers/gpu/drm/xe/xe_vram_types.h   |  15 +-
>  include/drm/drm_gpusvm.h             |  29 ++
>  include/drm/drm_pagemap.h            | 128 ++++-
>  include/drm/drm_pagemap_util.h       |  92 ++++
>  include/uapi/drm/xe_drm.h            |  18 +-
>  23 files changed, 2359 insertions(+), 301 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>  create mode 100644 include/drm/drm_pagemap_util.h
> 

