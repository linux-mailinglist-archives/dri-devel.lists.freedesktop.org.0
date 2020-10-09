Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DAD289381
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 21:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753D6EDE9;
	Fri,  9 Oct 2020 19:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815E56EDE0;
 Fri,  9 Oct 2020 19:52:55 +0000 (UTC)
IronPort-SDR: 7B+fkRDfv69MULhtFWZI2lD5wu5d1MbrAUATpUeIRUTWdVVEJEBeA92Lm93zKrgDK2pwEFZY06
 B8LyHhEXF5fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="152451048"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="152451048"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:55 -0700
IronPort-SDR: TN82OMSOJnR+1dzdu/wtYu+HarPMiqU5tCJLq9k+HDWuiKzSJliaVoZHfBedXzzykRk72guGi9
 gJFQG6Pg4N1Q==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="529053748"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:54 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 35/58] fs: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:10 -0700
Message-Id: <20201009195033.3208459-36-ira.weiny@intel.com>
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
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
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

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/aio.c              |  4 ++--
 fs/binfmt_elf.c       |  4 ++--
 fs/binfmt_elf_fdpic.c |  4 ++--
 fs/exec.c             | 10 +++++-----
 fs/io_uring.c         |  4 ++--
 fs/splice.c           |  4 ++--
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index d5ec30385566..27f95996d25f 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1223,10 +1223,10 @@ static long aio_read_events_ring(struct kioctx *ctx,
 		avail = min(avail, nr - ret);
 		avail = min_t(long, avail, AIO_EVENTS_PER_PAGE - pos);
 
-		ev = kmap(page);
+		ev = kmap_thread(page);
 		copy_ret = copy_to_user(event + ret, ev + pos,
 					sizeof(*ev) * avail);
-		kunmap(page);
+		kunmap_thread(page);
 
 		if (unlikely(copy_ret)) {
 			ret = -EFAULT;
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 13d053982dd7..1a332ef1ae03 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2430,9 +2430,9 @@ static int elf_core_dump(struct coredump_params *cprm)
 
 			page = get_dump_page(addr);
 			if (page) {
-				void *kaddr = kmap(page);
+				void *kaddr = kmap_thread(page);
 				stop = !dump_emit(cprm, kaddr, PAGE_SIZE);
-				kunmap(page);
+				kunmap_thread(page);
 				put_page(page);
 			} else
 				stop = !dump_skip(cprm, PAGE_SIZE);
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 50f845702b92..8fbe188e0fdd 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1542,9 +1542,9 @@ static bool elf_fdpic_dump_segments(struct coredump_params *cprm)
 			bool res;
 			struct page *page = get_dump_page(addr);
 			if (page) {
-				void *kaddr = kmap(page);
+				void *kaddr = kmap_thread(page);
 				res = dump_emit(cprm, kaddr, PAGE_SIZE);
-				kunmap(page);
+				kunmap_thread(page);
 				put_page(page);
 			} else {
 				res = dump_skip(cprm, PAGE_SIZE);
diff --git a/fs/exec.c b/fs/exec.c
index a91003e28eaa..3948b8511e3a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -575,11 +575,11 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 
 				if (kmapped_page) {
 					flush_kernel_dcache_page(kmapped_page);
-					kunmap(kmapped_page);
+					kunmap_thread(kmapped_page);
 					put_arg_page(kmapped_page);
 				}
 				kmapped_page = page;
-				kaddr = kmap(kmapped_page);
+				kaddr = kmap_thread(kmapped_page);
 				kpos = pos & PAGE_MASK;
 				flush_arg_page(bprm, kpos, kmapped_page);
 			}
@@ -593,7 +593,7 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 out:
 	if (kmapped_page) {
 		flush_kernel_dcache_page(kmapped_page);
-		kunmap(kmapped_page);
+		kunmap_thread(kmapped_page);
 		put_arg_page(kmapped_page);
 	}
 	return ret;
@@ -871,11 +871,11 @@ int transfer_args_to_stack(struct linux_binprm *bprm,
 
 	for (index = MAX_ARG_PAGES - 1; index >= stop; index--) {
 		unsigned int offset = index == stop ? bprm->p & ~PAGE_MASK : 0;
-		char *src = kmap(bprm->page[index]) + offset;
+		char *src = kmap_thread(bprm->page[index]) + offset;
 		sp -= PAGE_SIZE - offset;
 		if (copy_to_user((void *) sp, src, PAGE_SIZE - offset) != 0)
 			ret = -EFAULT;
-		kunmap(bprm->page[index]);
+		kunmap_thread(bprm->page[index]);
 		if (ret)
 			goto out;
 	}
diff --git a/fs/io_uring.c b/fs/io_uring.c
index aae0ef2ec34d..f59bb079822d 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2903,7 +2903,7 @@ static ssize_t loop_rw_iter(int rw, struct file *file, struct kiocb *kiocb,
 			iovec = iov_iter_iovec(iter);
 		} else {
 			/* fixed buffers import bvec */
-			iovec.iov_base = kmap(iter->bvec->bv_page)
+			iovec.iov_base = kmap_thread(iter->bvec->bv_page)
 						+ iter->iov_offset;
 			iovec.iov_len = min(iter->count,
 					iter->bvec->bv_len - iter->iov_offset);
@@ -2918,7 +2918,7 @@ static ssize_t loop_rw_iter(int rw, struct file *file, struct kiocb *kiocb,
 		}
 
 		if (iov_iter_is_bvec(iter))
-			kunmap(iter->bvec->bv_page);
+			kunmap_thread(iter->bvec->bv_page);
 
 		if (nr < 0) {
 			if (!ret)
diff --git a/fs/splice.c b/fs/splice.c
index ce75aec52274..190c4d218c30 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -815,9 +815,9 @@ static int write_pipe_buf(struct pipe_inode_info *pipe, struct pipe_buffer *buf,
 	void *data;
 	loff_t tmp = sd->pos;
 
-	data = kmap(buf->page);
+	data = kmap_thread(buf->page);
 	ret = __kernel_write(sd->u.file, data + buf->offset, sd->len, &tmp);
-	kunmap(buf->page);
+	kunmap_thread(buf->page);
 
 	return ret;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
