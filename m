Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D9289378
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 21:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DAF6EDE7;
	Fri,  9 Oct 2020 19:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E386A6EDE0;
 Fri,  9 Oct 2020 19:52:51 +0000 (UTC)
IronPort-SDR: T9i+B1EDnC5ZCRs/Sm7hCUwec0poZ3FINLvMY2tyoMYxIT/0zj3msX4eiedKt5uPDPO7dXPRoC
 gcJflgauboSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397515"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397515"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:51 -0700
IronPort-SDR: raa31ON9t7yf3LIgfzeAsEKPUCppaesVfvBVJ2ruufMJvWsy9JzU1jTdgl2++U0w8tR7AuyOxm
 Q4+3OjaqYbiw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="298531317"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:50 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 34/58] fs/erofs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:09 -0700
Message-Id: <20201009195033.3208459-35-ira.weiny@intel.com>
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
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, ecryptfs@vger.kernel.org,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
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

Cc: Gao Xiang <xiang@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/erofs/super.c | 4 ++--
 fs/erofs/xattr.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ddaa516c008a..41696b60f1b3 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -139,7 +139,7 @@ static int erofs_read_superblock(struct super_block *sb)
 
 	sbi = EROFS_SB(sb);
 
-	data = kmap(page);
+	data = kmap_thread(page);
 	dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
 
 	ret = -EINVAL;
@@ -189,7 +189,7 @@ static int erofs_read_superblock(struct super_block *sb)
 	}
 	ret = 0;
 out:
-	kunmap(page);
+	kunmap_thread(page);
 	put_page(page);
 	return ret;
 }
diff --git a/fs/erofs/xattr.c b/fs/erofs/xattr.c
index c8c381eadcd6..1771baa99d77 100644
--- a/fs/erofs/xattr.c
+++ b/fs/erofs/xattr.c
@@ -20,7 +20,7 @@ static inline void xattr_iter_end(struct xattr_iter *it, bool atomic)
 {
 	/* the only user of kunmap() is 'init_inode_xattrs' */
 	if (!atomic)
-		kunmap(it->page);
+		kunmap_thread(it->page);
 	else
 		kunmap_atomic(it->kaddr);
 
@@ -96,7 +96,7 @@ static int init_inode_xattrs(struct inode *inode)
 	}
 
 	/* read in shared xattr array (non-atomic, see kmalloc below) */
-	it.kaddr = kmap(it.page);
+	it.kaddr = kmap_thread(it.page);
 	atomic_map = false;
 
 	ih = (struct erofs_xattr_ibody_header *)(it.kaddr + it.ofs);
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
