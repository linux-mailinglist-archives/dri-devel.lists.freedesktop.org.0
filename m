Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784929C3592
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 01:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D356C10E400;
	Mon, 11 Nov 2024 00:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k543p4gD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29AC10E400;
 Mon, 11 Nov 2024 00:53:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE6085C559E;
 Mon, 11 Nov 2024 00:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C69C4CECF;
 Mon, 11 Nov 2024 00:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731286395;
 bh=cheGtrVFrxMD7UddlqYcWxRXeXiTalHU/TXmpLwYnLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k543p4gDIbH3NkLzJj34S7bHS+uDbygpE9kcK4a1Xs0xXeZFpl2+fmEcRbCDJjgPI
 pyeK/2NKMa0aXKDhYbuVz3JAdY2c8fikvdu2u41e+3O4y8p/P9PWNiEJySxlBUQtLR
 z46MtAPrxrvHJ0j79ygGb1jmpzBjXRcKUJ5ij0VAIdyoUEKI4ix6HsSnY8b08x3ddY
 3FZ3A6Pl4ZlKJYwSLsQZdeeu7HJikjHV0uhXQYpoWLJGq2xJBzPQUbp+dqiqt7owQ4
 kTp65YdpznYFFeUoSAIAWP/dH5jBTMuTH6VGjxyKEhBKkA0emLcsBvajMX5qYhWJJr
 bzSDRjvAtsXQg==
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
 Chuck Lever <chuck.lever@oracle.com>
Subject: [RFC PATCH 4/6 6.6] libfs: Add simple_offset_rename() API
Date: Sun, 10 Nov 2024 19:52:40 -0500
Message-ID: <20241111005242.34654-5-cel@kernel.org>
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

[ Upstream commit 5a1a25be995e1014abd01600479915683e356f5c ]

I'm about to fix a tmpfs rename bug that requires the use of
internal simple_offset helpers that are not available in mm/shmem.c

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Link: https://lore.kernel.org/r/20240415152057.4605-3-cel@kernel.org
Signed-off-by: Christian Brauner <brauner@kernel.org>
Stable-dep-of: ad191eb6d694 ("shmem: Fix shmem_rename2()")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/libfs.c         | 21 +++++++++++++++++++++
 include/linux/fs.h |  2 ++
 mm/shmem.c         |  3 +--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 9fec0113a83f..b2dcb15d993a 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -356,6 +356,27 @@ int simple_offset_empty(struct dentry *dentry)
 	return ret;
 }
 
+/**
+ * simple_offset_rename - handle directory offsets for rename
+ * @old_dir: parent directory of source entry
+ * @old_dentry: dentry of source entry
+ * @new_dir: parent_directory of destination entry
+ * @new_dentry: dentry of destination
+ *
+ * Caller provides appropriate serialization.
+ *
+ * Returns zero on success, a negative errno value on failure.
+ */
+int simple_offset_rename(struct inode *old_dir, struct dentry *old_dentry,
+			 struct inode *new_dir, struct dentry *new_dentry)
+{
+	struct offset_ctx *old_ctx = old_dir->i_op->get_offset_ctx(old_dir);
+	struct offset_ctx *new_ctx = new_dir->i_op->get_offset_ctx(new_dir);
+
+	simple_offset_remove(old_ctx, old_dentry);
+	return simple_offset_add(new_ctx, old_dentry);
+}
+
 /**
  * simple_offset_rename_exchange - exchange rename with directory offsets
  * @old_dir: parent of dentry being moved
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5104405ce3e6..e4d139fcaad0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3198,6 +3198,8 @@ void simple_offset_init(struct offset_ctx *octx);
 int simple_offset_add(struct offset_ctx *octx, struct dentry *dentry);
 void simple_offset_remove(struct offset_ctx *octx, struct dentry *dentry);
 int simple_offset_empty(struct dentry *dentry);
+int simple_offset_rename(struct inode *old_dir, struct dentry *old_dentry,
+			 struct inode *new_dir, struct dentry *new_dentry);
 int simple_offset_rename_exchange(struct inode *old_dir,
 				  struct dentry *old_dentry,
 				  struct inode *new_dir,
diff --git a/mm/shmem.c b/mm/shmem.c
index e0d014eaaf73..8e8998152a0f 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3439,8 +3439,7 @@ static int shmem_rename2(struct mnt_idmap *idmap,
 			return error;
 	}
 
-	simple_offset_remove(shmem_get_offset_ctx(old_dir), old_dentry);
-	error = simple_offset_add(shmem_get_offset_ctx(new_dir), old_dentry);
+	error = simple_offset_rename(old_dir, old_dentry, new_dir, new_dentry);
 	if (error)
 		return error;
 
-- 
2.47.0

