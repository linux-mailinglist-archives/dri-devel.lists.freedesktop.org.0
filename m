Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C597B7476
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 01:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AC410E092;
	Tue,  3 Oct 2023 23:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5141B10E092;
 Tue,  3 Oct 2023 23:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696374277; x=1727910277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b/EAFviwjIkhRcjWTQN1BVxZ/F71IF9ah+TklmixhFU=;
 b=GC4/C4WA+jEvSacfCLAf3lBxsmFQg+R74xRNyg6T2W7qkpBd2VGHddxa
 BgKHO5liM9flVzALqLHS1gCu8Euh1FVWb22sq6eX7ifJ6h/7mg+DlOO4m
 h+qe5Muda3bxtdJZkPb4sbm2Wlum7TbMj6tktG9xD+FcRg1iwYeVIMRE2
 239Oq0sX7ugG4zZL+AAbYBDgugTZ2nWVFmltxhVoPNHRiN74zSGXGFdWW
 gtjZs/2ZJTDE+cCMChSLizp5bvR+EKDLbJQz50hVvqVUPv8lg/WK6Sn6U
 t9ICzjT6hi8uWv6QremaEUBF8a81l2xryptzDojw468f7v3djBSpL2QLW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="381867103"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="381867103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 16:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="816881366"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="816881366"
Received: from adelynhu-mobl1.gar.corp.intel.com (HELO intel.com)
 ([10.214.161.181])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 16:04:30 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: Deny copy-on-writes mmaps
Date: Wed,  4 Oct 2023 01:03:32 +0200
Message-Id: <20231003230332.513051-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Enforce that an mmap of a dmabuf is always using MAP_SHARED so that all
access (both read and writes) using the device memory and not a local
copy-on-write page in system memory.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 21916bba77d5..1ec297241842 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -25,6 +25,7 @@
 #include <linux/poll.h>
 #include <linux/dma-resv.h>
 #include <linux/mm.h>
+#include <linux/mman.h>
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 
@@ -128,6 +129,19 @@ static struct file_system_type dma_buf_fs_type = {
 	.kill_sb = kill_anon_super,
 };
 
+static unsigned long
+dma_buf_get_unmapped_area(struct file *file,
+			  unsigned long addr,
+			  unsigned long len,
+			  unsigned long pgoff,
+			  unsigned long flags)
+{
+	if ((flags & MAP_TYPE) == MAP_PRIVATE)
+		return -EINVAL;
+
+	return current->mm->get_unmapped_area(file, addr, len, pgoff, flags);
+}
+
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
@@ -508,6 +522,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_file_release,
+	.get_unmapped_area = dma_buf_get_unmapped_area,
 	.mmap		= dma_buf_mmap_internal,
 	.llseek		= dma_buf_llseek,
 	.poll		= dma_buf_poll,
-- 
2.40.1

