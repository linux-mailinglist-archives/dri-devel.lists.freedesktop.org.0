Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE4289255
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 21:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104836EDA2;
	Fri,  9 Oct 2020 19:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171D6EDA2;
 Fri,  9 Oct 2020 19:51:05 +0000 (UTC)
IronPort-SDR: lw6WG6RD8j/gPG5OEKiNjAcUmIw39/7MpAEtt8zn6W7ujJPBvRyIM/2+24GwYYXwvVuLZ0Ptty
 T6MrA7ybQEgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="153363379"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="153363379"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:03 -0700
IronPort-SDR: Zj7B8Ym6Opm+j7NgzILIxHvFMHLpJ+KeG5qMdRlGsqJzYlMhgHY+wciO+/VIwDrpca7gdal3tS
 LaUxL8Xa1x8w==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="343971995"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:02 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 05/58] kmap: Introduce k[un]map_thread
Date: Fri,  9 Oct 2020 12:49:40 -0700
Message-Id: <20201009195033.3208459-6-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

To correctly support the semantics of kmap() with Kernel protection keys
(PKS), kmap() may be required to set the protections on multiple
processors (globally).  Enabling PKS globally can be very expensive
depending on the requested operation.  Furthermore, enabling a domain
globally reduces the protection afforded by PKS.

Most kmap() (Aprox 209 of 229) callers use the map within a single thread and
have no need for the protection domain to be enabled globally.  However, the
remaining callers do not follow this pattern and, as best I can tell, expect
the mapping to be 'global' and available to any thread who may access the
mapping.[1]

We don't anticipate global mappings to pmem, however in general there is a
danger in changing the semantics of kmap().  Effectively, this would cause an
unresolved page fault with little to no information about why the failure
occurred.

To resolve this a number of options were considered.

1) Attempt to change all the thread local kmap() calls to kmap_atomic()[2]
2) Introduce a flags parameter to kmap() to indicate if the mapping should be
   global or not
3) Change ~20 call sites to 'kmap_global()' to indicate that they require a
   global enablement of the pages.
4) Change ~209 call sites to 'kmap_thread()' to indicate that the mapping is to
   be used within that thread of execution only

Option 1 is simply not feasible.  Option 2 would require all of the call sites
of kmap() to change.  Option 3 seems like a good minimal change but there is a
danger that new code may miss the semantic change of kmap() and not get the
behavior the developer intended.  Therefore, #4 was chosen.

Subsequent patches will convert most ~90% of the kmap callers to this new call
leaving about 10% of the existing kmap callers to enable PKS globally.

Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/linux/highmem.h | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 2a9806e3b8d2..ef7813544719 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -60,7 +60,7 @@ static inline void kmap_flush_tlb(unsigned long addr) { }
 #endif
 
 void *kmap_high(struct page *page);
-static inline void *kmap(struct page *page)
+static inline void *__kmap(struct page *page, bool global)
 {
 	void *addr;
 
@@ -74,20 +74,20 @@ static inline void *kmap(struct page *page)
 	 * Even non-highmem pages may have additional access protections which
 	 * need to be checked and potentially enabled.
 	 */
-	dev_page_enable_access(page, true);
+	dev_page_enable_access(page, global);
 	return addr;
 }
 
 void kunmap_high(struct page *page);
 
-static inline void kunmap(struct page *page)
+static inline void __kunmap(struct page *page, bool global)
 {
 	might_sleep();
 	/*
 	 * Even non-highmem pages may have additional access protections which
 	 * need to be checked and potentially disabled.
 	 */
-	dev_page_disable_access(page, true);
+	dev_page_disable_access(page, global);
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
@@ -160,10 +160,10 @@ static inline struct page *kmap_to_page(void *addr)
 
 static inline unsigned long totalhigh_pages(void) { return 0UL; }
 
-static inline void *kmap(struct page *page)
+static inline void *__kmap(struct page *page, bool global)
 {
 	might_sleep();
-	dev_page_enable_access(page, true);
+	dev_page_enable_access(page, global);
 	return page_address(page);
 }
 
@@ -171,9 +171,9 @@ static inline void kunmap_high(struct page *page)
 {
 }
 
-static inline void kunmap(struct page *page)
+static inline void __kunmap(struct page *page, bool global)
 {
-	dev_page_disable_access(page, true);
+	dev_page_disable_access(page, global);
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(page_address(page));
 #endif
@@ -238,6 +238,24 @@ static inline void kmap_atomic_idx_pop(void)
 
 #endif
 
+static inline void *kmap(struct page *page)
+{
+	return __kmap(page, true);
+}
+static inline void kunmap(struct page *page)
+{
+	__kunmap(page, true);
+}
+
+static inline void *kmap_thread(struct page *page)
+{
+	return __kmap(page, false);
+}
+static inline void kunmap_thread(struct page *page)
+{
+	__kunmap(page, false);
+}
+
 /*
  * Prevent people trying to call kunmap_atomic() as if it were kunmap()
  * kunmap_atomic() should get the return value of kmap_atomic, not the page.
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
