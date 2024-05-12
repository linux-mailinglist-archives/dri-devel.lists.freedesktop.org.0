Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB38C371B
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 17:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A78A10E29C;
	Sun, 12 May 2024 15:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRA50z/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7465310E265;
 Sun, 12 May 2024 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528189; x=1747064189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m7b0H2nPMXlW9qzhs8xhiDDvV+7cSUjEnIZn7N+Tdcw=;
 b=hRA50z/ZSfuqMGAOLiJ9I+F0AxS/2vqclEv2V3cXh/jQ1BfoSMD0gbtI
 PS19UNX2xMIFCmQPjG+ezxtQOnH0yjAMuVTUNtl8wTPvdtRmT3+BrWrna
 UVFaqXR/k+jmhro0/l1IvUiTyQyC3dyOei9fN439Ry5vFRhmL6iyjPH4S
 LU6JS+QBivW+eTgP58ZgyjLpFcRP3GkGX9SsWkX8s/hQxYAqmCEHFeNKP
 OiV9LnkjvAD5AzPLAP7rWTtzLjB1WvKq82MpzNc/xqDMX+Uotfw0dBNSc
 jferHLLTtCRAD2PfiVa7yZOjHUAhF0Se5jotJOUeSwXsc6f0Gi92dT2th w==;
X-CSE-ConnectionGUID: WJqFFQflT3aXfdWqqjNhcA==
X-CSE-MsgGUID: zqg8LBMnTf61d2vvOaCtng==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11403303"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="11403303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:29 -0700
X-CSE-ConnectionGUID: nHVtF9cFQjKA8GWpnQJQgg==
X-CSE-MsgGUID: HAVA9ftCSMCmQGlQ+KLyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34976565"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/4] libfs: add simple_read_from_iomem()
Date: Sun, 12 May 2024 17:36:03 +0200
Message-Id: <20240512153606.1996-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240512153606.1996-1-michal.wajdeczko@intel.com>
References: <20240512153606.1996-1-michal.wajdeczko@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's similar to simple_read_from_buffer() but instead allows to
copy data from the I/O memory in PAGE_SIZE chunks.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: linux-fsdevel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 fs/libfs.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 3a6f2cb364f8..be8aa42a2f11 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/namei.h>
 #include <linux/exportfs.h>
+#include <linux/io.h>
 #include <linux/iversion.h>
 #include <linux/writeback.h>
 #include <linux/buffer_head.h> /* sync_mapping_buffers */
@@ -1040,6 +1041,55 @@ void simple_release_fs(struct vfsmount **mount, int *count)
 }
 EXPORT_SYMBOL(simple_release_fs);
 
+/**
+ * simple_read_from_iomem - copy data from the I/O memory to user space
+ * @to: the user space buffer to read to
+ * @count: the maximum number of bytes to read
+ * @ppos: the current position in the buffer
+ * @from: the I/O memory to read from
+ * @available: the size of the iomem memory
+ *
+ * The simple_read_from_iomem() function reads up to @count bytes (but no
+ * more than %PAGE_SIZE bytes) from the I/O memory @from at offset @ppos
+ * into the user space address starting at @to.
+ *
+ * Return: On success, the number of bytes read is returned and the offset
+ * @ppos is advanced by this number, or negative value is returned on error.
+ */
+ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
+			       const volatile void __iomem *from, size_t available)
+{
+	loff_t pos = *ppos;
+	size_t ret;
+	void *buf;
+
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= available || !count)
+		return 0;
+	if (count > available - pos)
+		count = available - pos;
+	if (count > PAGE_SIZE)
+		count = PAGE_SIZE;
+
+	buf = kmalloc(count, GFP_NOWAIT | __GFP_NOWARN);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, from + pos, count);
+	ret = copy_to_user(to, buf, count);
+
+	kfree(buf);
+
+	if (ret == count)
+		return -EFAULT;
+
+	count -= ret;
+	*ppos = pos + count;
+	return count;
+}
+EXPORT_SYMBOL(simple_read_from_iomem);
+
 /**
  * simple_read_from_buffer - copy data from the buffer to user space
  * @to: the user space buffer to read to
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8dfd53b52744..eb4a7b10a1a0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3331,6 +3331,9 @@ extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 extern ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *ppos,
 		const void __user *from, size_t count);
 
+ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
+			       const volatile void __iomem *from, size_t available);
+
 struct offset_ctx {
 	struct maple_tree	mt;
 	unsigned long		next_offset;
-- 
2.43.0

