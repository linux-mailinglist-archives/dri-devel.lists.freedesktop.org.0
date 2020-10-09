Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2EF289332
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 21:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89106EDD5;
	Fri,  9 Oct 2020 19:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D376D6EDD4;
 Fri,  9 Oct 2020 19:52:26 +0000 (UTC)
IronPort-SDR: 8FAXhc2SaFEogrVqPLzHfICpEUubqwLOKqLLa4T4gMSNSoodwslP+fVWACf4lMBPVBhLnFJfG0
 vgshO9E1/UCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="227179026"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="227179026"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:26 -0700
IronPort-SDR: enOwdrUvox960YRmC5C0rYPH71vGkXRrRSf++MkJJnBOIwe1z1BLjEriaudfjb7SF8F3v1X02a
 epHq/DZLuLjw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="355863002"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:25 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 27/58] fs/ubifs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:02 -0700
Message-Id: <20201009195033.3208459-28-ira.weiny@intel.com>
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
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
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
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/ubifs/file.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b77d1637bbbc..a3537447a885 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -111,7 +111,7 @@ static int do_readpage(struct page *page)
 	ubifs_assert(c, !PageChecked(page));
 	ubifs_assert(c, !PagePrivate(page));
 
-	addr = kmap(page);
+	addr = kmap_thread(page);
 
 	block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	beyond = (i_size + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT;
@@ -174,7 +174,7 @@ static int do_readpage(struct page *page)
 	SetPageUptodate(page);
 	ClearPageError(page);
 	flush_dcache_page(page);
-	kunmap(page);
+	kunmap_thread(page);
 	return 0;
 
 error:
@@ -182,7 +182,7 @@ static int do_readpage(struct page *page)
 	ClearPageUptodate(page);
 	SetPageError(page);
 	flush_dcache_page(page);
-	kunmap(page);
+	kunmap_thread(page);
 	return err;
 }
 
@@ -616,7 +616,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 	dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
 		inode->i_ino, page->index, i_size, page->flags);
 
-	addr = zaddr = kmap(page);
+	addr = zaddr = kmap_thread(page);
 
 	end_index = (i_size - 1) >> PAGE_SHIFT;
 	if (!i_size || page->index > end_index) {
@@ -692,7 +692,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 	SetPageUptodate(page);
 	ClearPageError(page);
 	flush_dcache_page(page);
-	kunmap(page);
+	kunmap_thread(page);
 	*n = nn;
 	return 0;
 
@@ -700,7 +700,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 	ClearPageUptodate(page);
 	SetPageError(page);
 	flush_dcache_page(page);
-	kunmap(page);
+	kunmap_thread(page);
 	ubifs_err(c, "bad data node (block %u, inode %lu)",
 		  page_block, inode->i_ino);
 	return -EINVAL;
@@ -918,7 +918,7 @@ static int do_writepage(struct page *page, int len)
 	/* Update radix tree tags */
 	set_page_writeback(page);
 
-	addr = kmap(page);
+	addr = kmap_thread(page);
 	block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	i = 0;
 	while (len) {
@@ -950,7 +950,7 @@ static int do_writepage(struct page *page, int len)
 	ClearPagePrivate(page);
 	ClearPageChecked(page);
 
-	kunmap(page);
+	kunmap_thread(page);
 	unlock_page(page);
 	end_page_writeback(page);
 	return err;
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
