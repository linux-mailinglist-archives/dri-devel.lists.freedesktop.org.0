Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC4D234FBF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 05:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8A26E106;
	Sat,  1 Aug 2020 03:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED67C6E106
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 03:41:20 +0000 (UTC)
IronPort-SDR: 9lJO/U11X3zrP/2oscsZXpXgb8OlmXdmnjBsLyOZWGB6vQq5B7qx0th7JLezfqZZHSwbRxkp1B
 brb3wzUVBgZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9699"; a="170007788"
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; d="scan'208";a="170007788"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 20:41:20 -0700
IronPort-SDR: TxwR/M8d52bA9HGOPqqFlTAEflpVkTxN+rc4KBs0C5ON7Y0dcqLOWDQTZ+sqfDFBr701ElUs7E
 MjR7k/BVmPdw==
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; d="scan'208";a="329492534"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 20:41:19 -0700
Subject: [PATCH v3 00/23] device-dax: Support sub-dividing soft-reserved ranges
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Fri, 31 Jul 2020 20:24:58 -0700
Message-ID: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
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
Cc: x86@kernel.org, David Hildenbrand <david@redhat.com>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 joao.m.martins@oracle.com, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 vishal.l.verma@intel.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v2 [1]:
- Rebase on next/master to resolve conflicts with pending mem-hotplug
  and memremap_pages() changes in -mm

- Drop attempt at a generic phys_to_target_node() implementation and
  just follow the default fallback approach taken with
  memory_add_physaddr_to_nid() (Mike)

- Fix test_hmm and other compilation fixups (Ralph)

- Integrate Joao's extensions to the device-dax sub-division interface
  (per-device align, user-directed extent allocation). (Joao)

[1]: http://lore.kernel.org/r/159457116473.754248.7879464730875147365.stgit@dwillia2-desk3.amr.corp.intel.com

---
Merge notes:

Andrew, this series is rebased on today's next/master to resolve
conflicts with some pending patches in -mm. I'd like to take it through
your tree given the intersections with memremap_pages() and memory
hotplug. If at all possible I'd like to see it in v5.10, but I realize
time is short. Outside of the Intel identified use cases for this Joao
has identified a use case for Oracle as well.

I would have sent this earlier save for the fact I am mostly offline
tending to a newborn these days. Vishal has stepped up to take on care
and feeding of this patchset if additional review / integration fixups
are needed.

The one test feedback this wants is from Justin (justin.he@arm.com), and
whether this lights up dax_kmem and now dax_hmem for him on arm64.
Otherwise, Joao has written unit tests for this in his enabling of the
daxctl userspace utility [2].

---
Cover:

The device-dax facility allows an address range to be directly mapped
through a chardev, or optionally hotplugged to the core kernel page
allocator as System-RAM. It is the mechanism for converting persistent
memory (pmem) to be used as another volatile memory pool i.e. the
current Memory Tiering hot topic on linux-mm.

In the case of pmem the nvdimm-namespace-label mechanism can sub-divide
it, but that labeling mechanism is not available / applicable to
soft-reserved ("EFI specific purpose") memory [3]. This series provides
a sysfs-mechanism for the daxctl utility to enable provisioning of
volatile-soft-reserved memory ranges.

The motivations for this facility are:

1/ Allow performance differentiated memory ranges to be split between
   kernel-managed and directly-accessed use cases.

2/ Allow physical memory to be provisioned along performance relevant
   address boundaries. For example, divide a memory-side cache [4] along
   cache-color boundaries.

3/ Parcel out soft-reserved memory to VMs using device-dax as a security
   / permissions boundary [5]. Specifically I have seen people (ab)using
   memmap=nn!ss (mark System-RAM as Persistent Memory) just to get the
   device-dax interface on custom address ranges. A follow-on for the VM
   use case is to teach device-dax to dynamically allocate 'struct page' at
   runtime to reduce the duplication of 'struct page' space in both the
   guest and the host kernel for the same physical pages.

[2]: http://lore.kernel.org/r/20200713160837.13774-11-joao.m.martins@oracle.com
[3]: http://lore.kernel.org/r/157309097008.1579826.12818463304589384434.stgit@dwillia2-desk3.amr.corp.intel.com
[4]: http://lore.kernel.org/r/154899811738.3165233.12325692939590944259.stgit@dwillia2-desk3.amr.corp.intel.com
[5]: http://lore.kernel.org/r/20200110190313.17144-1-joao.m.martins@oracle.com

---

Dan Williams (19):
      x86/numa: Cleanup configuration dependent command-line options
      x86/numa: Add 'nohmat' option
      efi/fake_mem: Arrange for a resource entry per efi_fake_mem instance
      ACPI: HMAT: Refactor hmat_register_target_device to hmem_register_device
      resource: Report parent to walk_iomem_res_desc() callback
      mm/memory_hotplug: Introduce default phys_to_target_node() implementation
      ACPI: HMAT: Attach a device for each soft-reserved range
      device-dax: Drop the dax_region.pfn_flags attribute
      device-dax: Move instance creation parameters to 'struct dev_dax_data'
      device-dax: Make pgmap optional for instance creation
      device-dax: Kill dax_kmem_res
      device-dax: Add an allocation interface for device-dax instances
      device-dax: Introduce 'seed' devices
      drivers/base: Make device_find_child_by_name() compatible with sysfs inputs
      device-dax: Add resize support
      mm/memremap_pages: Convert to 'struct range'
      mm/memremap_pages: Support multiple ranges per invocation
      device-dax: Add dis-contiguous resource support
      device-dax: Introduce 'mapping' devices

Joao Martins (4):
      device-dax: Make align a per-device property
      device-dax: Add an 'align' attribute
      dax/hmem: Introduce dax_hmem.region_idle parameter
      device-dax: Add a range mapping allocation attribute


 arch/powerpc/kvm/book3s_hv_uvmem.c     |   14 
 arch/x86/include/asm/numa.h            |    8 
 arch/x86/kernel/e820.c                 |   16 
 arch/x86/mm/numa.c                     |   11 
 arch/x86/mm/numa_emulation.c           |    3 
 arch/x86/xen/enlighten_pv.c            |    2 
 drivers/acpi/numa/hmat.c               |   76 --
 drivers/acpi/numa/srat.c               |    9 
 drivers/base/core.c                    |    2 
 drivers/dax/Kconfig                    |    4 
 drivers/dax/Makefile                   |    3 
 drivers/dax/bus.c                      | 1055 ++++++++++++++++++++++++++++++--
 drivers/dax/bus.h                      |   28 +
 drivers/dax/dax-private.h              |   40 +
 drivers/dax/device.c                   |  132 ++--
 drivers/dax/hmem.c                     |   56 --
 drivers/dax/hmem/Makefile              |    6 
 drivers/dax/hmem/device.c              |  100 +++
 drivers/dax/hmem/hmem.c                |   65 ++
 drivers/dax/kmem.c                     |  199 +++---
 drivers/dax/pmem/compat.c              |    2 
 drivers/dax/pmem/core.c                |   22 -
 drivers/firmware/efi/x86_fake_mem.c    |   12 
 drivers/gpu/drm/nouveau/nouveau_dmem.c |   15 
 drivers/nvdimm/badrange.c              |   26 -
 drivers/nvdimm/claim.c                 |   13 
 drivers/nvdimm/nd.h                    |    3 
 drivers/nvdimm/pfn_devs.c              |   13 
 drivers/nvdimm/pmem.c                  |   27 -
 drivers/nvdimm/region.c                |   21 -
 drivers/pci/p2pdma.c                   |   12 
 include/acpi/acpi_numa.h               |   14 
 include/linux/dax.h                    |    8 
 include/linux/memory_hotplug.h         |    5 
 include/linux/memremap.h               |   11 
 include/linux/range.h                  |    6 
 kernel/resource.c                      |   11 
 lib/test_hmm.c                         |   15 
 mm/memory_hotplug.c                    |   10 
 mm/memremap.c                          |  299 +++++----
 tools/testing/nvdimm/dax-dev.c         |   22 -
 tools/testing/nvdimm/test/iomap.c      |    2 
 42 files changed, 1810 insertions(+), 588 deletions(-)
 delete mode 100644 drivers/dax/hmem.c
 create mode 100644 drivers/dax/hmem/Makefile
 create mode 100644 drivers/dax/hmem/device.c
 create mode 100644 drivers/dax/hmem/hmem.c

base-commit: 01830e6c042e8eb6eb202e05d7df8057135b4c26
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
