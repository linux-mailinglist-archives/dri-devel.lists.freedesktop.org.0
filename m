Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1950239EC2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 07:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66506E1E9;
	Mon,  3 Aug 2020 05:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BF06E1E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 05:19:16 +0000 (UTC)
IronPort-SDR: +fFuAW3B+MmpwhUPZ+XjknflccE5DUfZFm2h4jdjRRhduNLSl738vPnCYp7FHqdIejq2kWNpJL
 bCHDVIxupu0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="236912234"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="236912234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:19:16 -0700
IronPort-SDR: tRc5FfBYtgkxrQasf2CoiKdYkaJgZ+TQxSo7NSUfVXubARTu0J1yE4qGSRKMMSvMAxCbfefDHy
 ylgtynKOm6zA==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="291927658"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:19:16 -0700
Subject: [PATCH v4 06/23] mm/memory_hotplug: Introduce default
 phys_to_target_node() implementation
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Sun, 02 Aug 2020 22:02:57 -0700
Message-ID: <159643097768.4062302.3135192588966888630.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
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
Cc: ard.biesheuvel@linaro.org, Jia He <justin.he@arm.com>,
 linux-acpi@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 peterz@infradead.org, vishal.l.verma@intel.com, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 joao.m.martins@oracle.com, linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to set a fallback value for dev_dax->target_node,
introduce generic fallback helpers for phys_to_target_node()

A generic implementation based on node-data or memblock was proposed,
but as noted by Mike:

    "Here again, I would prefer to add a weak default for
     phys_to_target_node() because the "generic" implementation is not really
     generic.

     The fallback to reserved ranges is x86 specfic because on x86 most of
     the reserved areas is not in memblock.memory. AFAIK, no other
     architecture does this."

The info message in the generic memory_add_physaddr_to_nid()
implementation is fixed up to properly reflect that
memory_add_physaddr_to_nid() communicates "online" node info and
phys_to_target_node() indicates "target / to-be-onlined" node info.

Cc: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Jia He <justin.he@arm.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/mm/numa.c             |    1 -
 include/linux/memory_hotplug.h |    5 +++++
 include/linux/numa.h           |   11 -----------
 mm/memory_hotplug.c            |   10 +++++++++-
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index f3805bbaa784..c62e274d52d0 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -917,7 +917,6 @@ int phys_to_target_node(phys_addr_t start)
 
 	return meminfo_to_nid(&numa_reserved_meminfo, start);
 }
-EXPORT_SYMBOL_GPL(phys_to_target_node);
 
 int memory_add_physaddr_to_nid(u64 start)
 {
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 375515803cd8..dcdc7d6206d5 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -151,11 +151,16 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
 
 #ifdef CONFIG_NUMA
 extern int memory_add_physaddr_to_nid(u64 start);
+extern int phys_to_target_node(u64 start);
 #else
 static inline int memory_add_physaddr_to_nid(u64 start)
 {
 	return 0;
 }
+static inline int phys_to_target_node(u64 start)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
diff --git a/include/linux/numa.h b/include/linux/numa.h
index a42df804679e..8cb33ccfb671 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -23,22 +23,11 @@
 #ifdef CONFIG_NUMA
 /* Generic implementation available */
 int numa_map_to_online_node(int node);
-
-/*
- * Optional architecture specific implementation, users need a "depends
- * on $ARCH"
- */
-int phys_to_target_node(phys_addr_t addr);
 #else
 static inline int numa_map_to_online_node(int node)
 {
 	return NUMA_NO_NODE;
 }
-
-static inline int phys_to_target_node(phys_addr_t addr)
-{
-	return NUMA_NO_NODE;
-}
 #endif
 
 #endif /* _LINUX_NUMA_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index dcdf3271f87e..426b79adf529 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -353,11 +353,19 @@ int __ref __add_pages(int nid, unsigned long pfn, unsigned long nr_pages,
 #ifdef CONFIG_NUMA
 int __weak memory_add_physaddr_to_nid(u64 start)
 {
-	pr_info_once("Unknown target node for memory at 0x%llx, assuming node 0\n",
+	pr_info_once("Unknown online node for memory at 0x%llx, assuming node 0\n",
 			start);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
+
+int __weak phys_to_target_node(u64 start)
+{
+	pr_info_once("Unknown target node for memory at 0x%llx, assuming node 0\n",
+			start);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phys_to_target_node);
 #endif
 
 /* find the smallest valid pfn in the range [start_pfn, end_pfn) */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
