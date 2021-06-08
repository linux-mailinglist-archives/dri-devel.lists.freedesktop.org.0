Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2137A39F90D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 16:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177B26E1A4;
	Tue,  8 Jun 2021 14:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8670F6E1A4;
 Tue,  8 Jun 2021 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UOUqanNFV7E9iFOGIGANmIM4i4Gh6l4SyO3xncINgRo=; b=SOVqCOqbuxbZuhUUVWAc01u3On
 DNpG+2B8W0ZYJPE9iiPQAdSr1lckOpe1bln4Z+tW3eDPHJuMdqMrZm2kZhxtdM6xffSOERzfRcRKl
 U9PkHttAu4TN2yf36y7qawawP5uHuH5MhmYhE2T7Uurc2sI8AuVTotPoVYELFy3dP3V3J5770YP1y
 Iq+cUBRmocOOt5IZBO9YEr9/YcXtAU1kOUnBfReYev8yjS+jqCsYDnA7pAh2q9/jz4o2f9oKuEK0Q
 waWajDen4OFWn+dr0KlTEWStILX9S7JiXEy2/1uTIxT5OfA/li+qWGWymU6x+Nn9yCqfvHaADRNrV
 FI/1B06A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lqcgn-00H1Gn-G0; Tue, 08 Jun 2021 14:26:52 +0000
Date: Tue, 8 Jun 2021 15:26:45 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [RFC PATCH v2 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
Message-ID: <YL9+JW1MPsANqqq1@casper.infradead.org>
References: <20210607204226.7743-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607204226.7743-1-alex.sierra@amd.com>
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 03:42:18PM -0500, Alex Sierra wrote:
> v1:
> https://lore.kernel.org/linux-mm/20210529064022.GB15834@lst.de/T/

Please copy and paste the rationale into followup patch series instead
of sending a link:

AMD is building a system architecture for the Frontier supercomputer with
a coherent interconnect between CPUs and GPUs. This hardware architecture
allows the CPUs to coherently access GPU device memory. We have hardware
in our labs and we are working with our partner HPE on the BIOS, firmware
and software for delivery to the DOE.

The system BIOS advertises the GPU device memory (aka VRAM) as SPM
(special purpose memory) in the UEFI system address map. The amdgpu driver
looks it up with lookup_resource and registers it with devmap as
MEMORY_DEVICE_GENERIC using devm_memremap_pages.

Now we're trying to migrate data to and from that memory using the
migrate_vma_* helpers so we can support page-based migration in our
unified memory allocations, while also supporting CPU access to those
pages.

This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages
behave correctly in the migrate_vma_* helpers. We are looking for feedback
about this approach. If we're close, what's needed to make our patches
acceptable upstream? If we're not close, any suggestions how else to
achieve what we are trying to do (i.e. page migration and coherent CPU
access to VRAM)?

This work is based on HMM and our SVM memory manager that was recently
upstreamed to Dave Airlie's drm-next branch
[https://cgit.freedesktop.org/drm/drm/log/?h=drm-next]. On top of that we
did some rework of our VRAM management for migrations to remove some
incorrect assumptions, allow partially successful migrations and GPU
memory mappings that mix pages in VRAM and system memory.
[https://patchwork.kernel.org/project/dri-devel/list/?series=489811]

> v2:
> This patch series version has merged "[RFC PATCH v3 0/2]
> mm: remove extra ZONE_DEVICE struct page refcount" patch series made by
> Ralph Campbell. It also applies at the top of these series, our changes
> to support device generic type in migration_vma helpers.
> This has been tested in systems with device memory that has coherent
> access by CPU.
> 
> Also addresses the following feedback made in v1:
> - Isolate in one patch kernel/resource.c modification, based
> on Christoph's feedback.
> - Add helpers check for generic and private type to avoid
> duplicated long lines.
> 
> I like to provide an overview of what each of the patches does in a series:
> 
> Patches 1-2: Rebased Ralph Campbell's ZONE_DEVICE page refcounting patches
> Patch 3: Export lookup_resource
> Patches 4-5: AMDGPU driver changes to register and use DEVICE_GENERIC memory
> Patches 6-8: Handle DEVICE_GENERIC memory in migration helpers
> 
> Alex Sierra (6):
>   kernel: resource: lookup_resource as exported symbol
>   drm/amdkfd: add SPM support for SVM
>   drm/amdkfd: generic type as sys mem on migration to ram
>   include/linux/mm.h: helpers to check zone device generic type
>   mm: add generic type support to migrate_vma helpers
>   mm: call pgmap->ops->page_free for DEVICE_GENERIC pages
> 
> Ralph Campbell (2):
>   ext4/xfs: add page refcount helper
>   mm: remove extra ZONE_DEVICE struct page refcount
> 
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 ++++--
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>  fs/dax.c                                 |  8 +--
>  fs/ext4/inode.c                          |  5 +-
>  fs/xfs/xfs_file.c                        |  4 +-
>  include/linux/dax.h                      | 10 ++++
>  include/linux/memremap.h                 |  7 +--
>  include/linux/mm.h                       | 52 +++---------------
>  kernel/resource.c                        |  2 +-
>  lib/test_hmm.c                           |  2 +-
>  mm/internal.h                            |  8 +++
>  mm/memremap.c                            | 69 +++++++-----------------
>  mm/migrate.c                             | 13 ++---
>  mm/page_alloc.c                          |  3 ++
>  mm/swap.c                                | 45 ++--------------
>  16 files changed, 83 insertions(+), 164 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
