Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B899C3594
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 01:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A6010E402;
	Mon, 11 Nov 2024 00:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aMIYzEMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345BB10E402;
 Mon, 11 Nov 2024 00:53:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 20DA45C548D;
 Mon, 11 Nov 2024 00:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F69C4CEDA;
 Mon, 11 Nov 2024 00:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731286398;
 bh=Eq6hm/AurEpUBcGjs15qnEqlTE8OCuozLkUE85txKaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aMIYzEMNY9q4iFf2JUztZP3Jyhw3wEtFmFm9g1gY0/ekzc6Sm1//MNk70I+7KwldA
 7/eY37HChonjEeA2109emE/Syd1tdoK4X3vzsxDHeVEc7SN338hQcoXLla/Hz2eq2l
 8J5TzUVJosjhO11krG92weLktbMPDx+YF3N0M8SlyDq4JCNWlTP4fWqe1VB8ewQXt+
 4QJ0G6CXfvWQBdx+b9eYPSJJ6z/cXyMoRkxcuD3xg3AtkuFrpLKBfyHFGJBClHw5hV
 ge+cgqwUijpgvDIodDRso5iDS72XZie2UXIw8VTekxd3mGzAhY21s6Q+AUj2vc3IQB
 J8PSNpMRiiqyQ==
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
Subject: [RFC PATCH 5/6 6.6] shmem: Fix shmem_rename2()
Date: Sun, 10 Nov 2024 19:52:41 -0500
Message-ID: <20241111005242.34654-6-cel@kernel.org>
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

[ Upstream commit ad191eb6d6942bb835a0b20b647f7c53c1d99ca4 ]

When renaming onto an existing directory entry, user space expects
the replacement entry to have the same directory offset as the
original one.

Link: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15966
Fixes: a2e459555c5f ("shmem: stable directory offsets")
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Link: https://lore.kernel.org/r/20240415152057.4605-4-cel@kernel.org
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/libfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index b2dcb15d993a..a87005c89534 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -365,6 +365,9 @@ int simple_offset_empty(struct dentry *dentry)
  *
  * Caller provides appropriate serialization.
  *
+ * User space expects the directory offset value of the replaced
+ * (new) directory entry to be unchanged after a rename.
+ *
  * Returns zero on success, a negative errno value on failure.
  */
 int simple_offset_rename(struct inode *old_dir, struct dentry *old_dentry,
@@ -372,8 +375,14 @@ int simple_offset_rename(struct inode *old_dir, struct dentry *old_dentry,
 {
 	struct offset_ctx *old_ctx = old_dir->i_op->get_offset_ctx(old_dir);
 	struct offset_ctx *new_ctx = new_dir->i_op->get_offset_ctx(new_dir);
+	long new_offset = dentry2offset(new_dentry);
 
 	simple_offset_remove(old_ctx, old_dentry);
+
+	if (new_offset) {
+		offset_set(new_dentry, 0);
+		return simple_offset_replace(new_ctx, old_dentry, new_offset);
+	}
 	return simple_offset_add(new_ctx, old_dentry);
 }
 
-- 
2.47.0

