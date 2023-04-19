Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEE26E7729
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEE810E91E;
	Wed, 19 Apr 2023 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com
 [14.137.139.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBC510E91E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:06:34 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4Q1blR23TYz9xFqq
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:56:03 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.45.152.239])
 by APP1 (Coremail) with SMTP id LxC2BwAXi_aYvD9k7TY6Ag--.1944S7;
 Wed, 19 Apr 2023 11:06:04 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kim Phillips <kim.phillips@amd.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Muchun Song <muchun.song@linux.dev>, Ondrej Zary <linux@zary.sk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Won Chung <wonchung@google.com>,
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 iommu@lists.linux.dev (open list:DMA MAPPING HELPERS)
Subject: [PATCH v2 5/7] swiotlb: Add a boot option to enable dynamic bounce
 buffers
Date: Wed, 19 Apr 2023 12:03:57 +0200
Message-Id: <05e2e9f6bcde2a184844206f4d586328c967652e.1681898595.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
References: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwAXi_aYvD9k7TY6Ag--.1944S7
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1kXFWrJw13ArWrGry8Xwb_yoW7Ww17pr
 W09a4fKFs7JF18Z34DCa17GF1Fka1I9ay3JFWrWryFyr98WrnYqwnrKr4YqF1Fy3y0vF47
 ZFy5ZF4Ykr17t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmEb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
 Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
 rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
 AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrV
 C2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
 7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262
 kKe7AKxVWUtVW8ZwCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcI
 k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4U
 JVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8yxR3UUUUU==
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
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
Cc: petr@tesarici.cz, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Roberto Sassu <roberto.sassu@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

The main goal of allocating bounce buffers dynamically is to allow
allocating a minimal fixed swiotlb at boot time but avoid hard
limits on the amount of I/O that can be handled later.

Compared to fixed IO TLB slots, dynamic allocation of bounce buffers
typically increases the worst-case I/O latency and may also reduce
performance for some workloads.

I did some basic testing with fio against a QEMU SATA drive backed
by a RAM block device in the host to minimize external factors. The
kernel was booted with "swiotlb=force,dynamic". I performed testing
of single-threaded I/O of 4-KiB segments, single-threaded I/O of
1-MiB segments, and 4-core parallel I/O of 64-KiB segments. The last
column is the coefficient of variance in 5 runs of the test:

               Read  Write  Coeff
single 4-KiB  +1.9%  +1.9%  1.7%
single 1-MiB  -8.1%  -8.2%  2.2%
parallel      -9.4%  -9.5%  2.6%

There is a slight increase in bandwidth for single-threaded 4-KiB
segments. This is because the buddy allocator is quite efficient for
order-0 allocations, so the overhead is offset by faster allocation
from an almost empty fixed swiotlb (which is still used for buffers
smaller than one page).

Anyway, since the feature is new and does not benefit all
workloads, make it disabled by default and let people turn it on
with "swiotlb=dynamic" if needed. Since this option can be combined
with "force", the parser is modified to allow multiple options
separated by commas.

A new bool field is added to struct io_tlb_mem to tell whether
dynamic allocations are allowed. This field is always false for DMA
restricted pools. It is also false for other software IO TLBs
unless "swiotlb=dynamic" was specified.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++++-
 include/linux/swiotlb.h                       |  3 ++-
 kernel/dma/swiotlb.c                          | 20 ++++++++++++++-----
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6221a1d057dd..c8bc0c8b8df6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6110,14 +6110,18 @@
 			Execution Facility on pSeries.
 
 	swiotlb=	[ARM,IA-64,PPC,MIPS,X86]
-			Format: { <int> [,<int>] | force | noforce }
+			Format: { <int> [,<int>] [,option-list] | option-list }
 			<int> -- Number of I/O TLB slabs
 			<int> -- Second integer after comma. Number of swiotlb
 				 areas with their own lock. Will be rounded up
 				 to a power of 2.
+			<option-list> -- Comma-separated list of options.
+
+			Available options:
 			force -- force using of bounce buffers even if they
 			         wouldn't be automatically used by the kernel
 			noforce -- Never use bounce buffers (for debugging)
+			dynamic -- allow dynamic allocation of bounce buffers
 
 	switches=	[HW,M68k]
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 0856eddb9063..e614aa0f4f64 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -98,6 +98,7 @@ struct io_tlb_mem {
 	bool late_alloc;
 	bool force_bounce;
 	bool for_alloc;
+	bool allow_dyn;
 	unsigned int nareas;
 	unsigned int area_nslabs;
 	struct io_tlb_area *areas;
@@ -142,7 +143,7 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 
 	return mem &&
 		(is_swiotlb_fixed(mem, paddr) ||
-		 is_swiotlb_dyn(dev, paddr));
+		 (mem->allow_dyn && is_swiotlb_dyn(dev, paddr)));
 }
 
 static inline bool is_swiotlb_force_bounce(struct device *dev)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f4faee38ead9..4899fb0e4331 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -86,6 +86,7 @@ struct io_tlb_dyn_slot {
 
 static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
+static bool swiotlb_dynamic;
 
 struct io_tlb_mem io_tlb_default_mem;
 
@@ -167,10 +168,18 @@ setup_io_tlb_npages(char *str)
 		swiotlb_adjust_nareas(simple_strtoul(str, &str, 0));
 	if (*str == ',')
 		++str;
-	if (!strcmp(str, "force"))
-		swiotlb_force_bounce = true;
-	else if (!strcmp(str, "noforce"))
-		swiotlb_force_disable = true;
+	while (str && *str) {
+		char *opt = strsep(&str, ",");
+
+		if (!strcmp(opt, "force"))
+			swiotlb_force_bounce = true;
+		else if (!strcmp(opt, "noforce"))
+			swiotlb_force_disable = true;
+		else if (!strcmp(opt, "dynamic"))
+			swiotlb_dynamic = true;
+		else
+			pr_warn("Invalid swiotlb option: %s", opt);
+	}
 
 	return 0;
 }
@@ -287,6 +296,7 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	mem->area_nslabs = nslabs / mem->nareas;
 
 	mem->force_bounce = swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
+	mem->allow_dyn = swiotlb_dynamic;
 
 	for (i = 0; i < mem->nareas; i++) {
 		spin_lock_init(&mem->areas[i].lock);
@@ -1070,7 +1080,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	}
 
 	tlb_addr = (phys_addr_t)DMA_MAPPING_ERROR;
-	if (!is_swiotlb_for_alloc(dev))
+	if (mem->allow_dyn)
 		tlb_addr = swiotlb_dyn_map(dev, orig_addr, alloc_size,
 					   alloc_align_mask, dir, attrs);
 	if (tlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
-- 
2.25.1

