Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF389C358E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 01:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A72C10E3FB;
	Mon, 11 Nov 2024 00:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lrf5VPIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40DB10E3FA;
 Mon, 11 Nov 2024 00:53:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 195BC5C54AC;
 Mon, 11 Nov 2024 00:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB9AC4CED6;
 Mon, 11 Nov 2024 00:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731286389;
 bh=Z1QVcRNEajq+vvtRp+aYnLkCErRyzdCuKYY5Gom358E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lrf5VPIUItWcKVtrlMjZyA9tq+5oyRSxI+GpQOE4It5Fkefwo9OvtC99jBNEAmCVO
 /jB3FJ1h0OrzKq6rZO3CvgotIAATbQ1c7zaXUesKHVANqRnZE9aExWhcKF+HJdRfqq
 MNH2HDC3jfuxXoHT70TnTXw+m5EgHdVIBRTGI7dExUKfhaJ05nDo6wczsw8sN1zN14
 TUhUQr6YbDOedUUN5JyHBYo9kG/GVPCJxeamWdtcbATWWySK/aYoAEpy4N2wB0dL0k
 OXj7FNKqa1bAF+RgA2Jbro7kxneUAYLDi/Yrho3dK67Th8fBM5ZuogzGch/WAvDoeC
 vlrZ/CgdO2Wjw==
From: cel@kernel.org
To: <stable@vger.kernel.org>
Cc: yukuai1@huaweicloud.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, hughd@google.com,
 willy@infradead.org, gregkh@linuxfoundation.org, sashal@kernel.org,
 srinivasan.shanmugam@amd.com, chiahsuan.chung@amd.com, mingo@kernel.org,
 mgorman@techsingularity.net, yukuai3@huawei.com, chengming.zhou@linux.dev,
 zhangpeng.00@bytedance.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
Subject: [RFC PATCH 2/6 6.6] libfs: Add simple_offset_empty()
Date: Sun, 10 Nov 2024 19:52:38 -0500
Message-ID: <20241111005242.34654-3-cel@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111005242.34654-1-cel@kernel.org>
References: <20241111005242.34654-1-cel@kernel.org>
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

From: Chuck Lever <chuck.lever@oracle.com>

[ Upstream commit ecba88a3b32d733d41e27973e25b2bc580f64281 ]

For simple filesystems that use directory offset mapping, rely
strictly on the directory offset map to tell when a directory has
no children.

After this patch is applied, the emptiness test holds only the RCU
read lock when the directory being tested has no children.

In addition, this adds another layer of confirmation that
simple_offset_add/remove() are working as expected.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Link: https://lore.kernel.org/r/170820143463.6328.7872919188371286951.stgit@91.116.238.104.host.secureserver.net
Signed-off-by: Christian Brauner <brauner@kernel.org>
Stable-dep-of: 5a1a25be995e ("libfs: Add simple_offset_rename() API")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/libfs.c         | 32 ++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 mm/shmem.c         |  4 ++--
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 4a2205afcc88..66b428f3fc41 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -312,6 +312,38 @@ void simple_offset_remove(struct offset_ctx *octx, struct dentry *dentry)
 	offset_set(dentry, 0);
 }
 
+/**
+ * simple_offset_empty - Check if a dentry can be unlinked
+ * @dentry: dentry to be tested
+ *
+ * Returns 0 if @dentry is a non-empty directory; otherwise returns 1.
+ */
+int simple_offset_empty(struct dentry *dentry)
+{
+	struct inode *inode = d_inode(dentry);
+	struct offset_ctx *octx;
+	struct dentry *child;
+	unsigned long index;
+	int ret = 1;
+
+	if (!inode || !S_ISDIR(inode->i_mode))
+		return ret;
+
+	index = DIR_OFFSET_MIN;
+	octx = inode->i_op->get_offset_ctx(inode);
+	xa_for_each(&octx->xa, index, child) {
+		spin_lock(&child->d_lock);
+		if (simple_positive(child)) {
+			spin_unlock(&child->d_lock);
+			ret = 0;
+			break;
+		}
+		spin_unlock(&child->d_lock);
+	}
+
+	return ret;
+}
+
 /**
  * simple_offset_rename_exchange - exchange rename with directory offsets
  * @old_dir: parent of dentry being moved
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6c3d86532e3f..5104405ce3e6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3197,6 +3197,7 @@ struct offset_ctx {
 void simple_offset_init(struct offset_ctx *octx);
 int simple_offset_add(struct offset_ctx *octx, struct dentry *dentry);
 void simple_offset_remove(struct offset_ctx *octx, struct dentry *dentry);
+int simple_offset_empty(struct dentry *dentry);
 int simple_offset_rename_exchange(struct inode *old_dir,
 				  struct dentry *old_dentry,
 				  struct inode *new_dir,
diff --git a/mm/shmem.c b/mm/shmem.c
index 5d076022da24..e0d014eaaf73 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3373,7 +3373,7 @@ static int shmem_unlink(struct inode *dir, struct dentry *dentry)
 
 static int shmem_rmdir(struct inode *dir, struct dentry *dentry)
 {
-	if (!simple_empty(dentry))
+	if (!simple_offset_empty(dentry))
 		return -ENOTEMPTY;
 
 	drop_nlink(d_inode(dentry));
@@ -3430,7 +3430,7 @@ static int shmem_rename2(struct mnt_idmap *idmap,
 		return simple_offset_rename_exchange(old_dir, old_dentry,
 						     new_dir, new_dentry);
 
-	if (!simple_empty(new_dentry))
+	if (!simple_offset_empty(new_dentry))
 		return -ENOTEMPTY;
 
 	if (flags & RENAME_WHITEOUT) {
-- 
2.47.0

