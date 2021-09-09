Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEFC404AB0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050F56E593;
	Thu,  9 Sep 2021 11:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4436E593
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:47:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D461615E3;
 Thu,  9 Sep 2021 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188030;
 bh=TUaNbGijjf16dwoOSELXxmYWLOmllXRTFAu0Q8E1m3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pupc4SO8RA55+uOXpX/h92CEOHQ8+Ki1+KgEfOW4Q2Luf0Xj7+FLDgSlKXVDJStPT
 +MFP7ytzYQEI9A5aG1ltattw8+YpgdHxrJl1ZT4Q+7YVRBub1GWhFXPWpLHPHlaPmU
 lRIayaKbCRievy2iUltrDMO3fv8og66heUL01+vQCAqiS/5X/b6WzmaksreZeVYpCS
 CvXcFnp8rIFyWTmJ3z3p93+y8cSVH6M6Aftnizs/d+8iWeA6oW3ZyjlajyP6Yd7RDl
 TfY9qzk9iN4uaJP5hnVx/tXEQjN4zqFLNvlyKSmMtvFwPyueRSup3qXxj5k4OtWRKL
 kN01u75IYHH4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.13 027/219] drm: avoid blocking in
 drm_clients_info's rcu section
Date: Thu,  9 Sep 2021 07:43:23 -0400
Message-Id: <20210909114635.143983-27-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

[ Upstream commit 5eff9585de220cdd131237f5665db5e6c6bdf590 ]

Inside drm_clients_info, the rcu_read_lock is held to lock
pid_task()->comm. However, within this protected section, a call to
drm_is_current_master is made, which involves a mutex lock in a future
patch. However, this is illegal because the mutex lock might block
while in the RCU read-side critical section.

Since drm_is_current_master isn't protected by rcu_read_lock, we avoid
this by moving it out of the RCU critical section.

The following report came from intel-gfx ci's
igt@debugfs_test@read_all_entries testcase:

=============================
[ BUG: Invalid wait context ]
5.13.0-CI-Patchwork_20515+ #1 Tainted: G        W
-----------------------------
debugfs_test/1101 is trying to lock:
ffff888132d901a8 (&dev->master_mutex){+.+.}-{3:3}, at:
drm_is_current_master+0x1e/0x50
other info that might help us debug this:
context-{4:4}
3 locks held by debugfs_test/1101:
 #0: ffff88810fdffc90 (&p->lock){+.+.}-{3:3}, at:
 seq_read_iter+0x53/0x3b0
 #1: ffff888132d90240 (&dev->filelist_mutex){+.+.}-{3:3}, at:
 drm_clients_info+0x63/0x2a0
 #2: ffffffff82734220 (rcu_read_lock){....}-{1:2}, at:
 drm_clients_info+0x1b1/0x2a0
stack backtrace:
CPU: 8 PID: 1101 Comm: debugfs_test Tainted: G        W
5.13.0-CI-Patchwork_20515+ #1
Hardware name: Intel Corporation CometLake Client Platform/CometLake S
UDIMM (ERB/CRB), BIOS CMLSFWR1.R00.1263.D00.1906260926 06/26/2019
Call Trace:
 dump_stack+0x7f/0xad
 __lock_acquire.cold.78+0x2af/0x2ca
 lock_acquire+0xd3/0x300
 ? drm_is_current_master+0x1e/0x50
 ? __mutex_lock+0x76/0x970
 ? lockdep_hardirqs_on+0xbf/0x130
 __mutex_lock+0xab/0x970
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 drm_is_current_master+0x1e/0x50
 drm_clients_info+0x107/0x2a0
 seq_read_iter+0x178/0x3b0
 seq_read+0x104/0x150
 full_proxy_read+0x4e/0x80
 vfs_read+0xa5/0x1b0
 ksys_read+0x5a/0xd0
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20210712043508.11584-3-desmondcheongzx@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 3d7182001004..b0a826489488 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -91,6 +91,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	mutex_lock(&dev->filelist_mutex);
 	list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
 		struct task_struct *task;
+		bool is_current_master = drm_is_current_master(priv);
 
 		rcu_read_lock(); /* locks pid_task()->comm */
 		task = pid_task(priv->pid, PIDTYPE_PID);
@@ -99,7 +100,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(priv->pid),
 			   priv->minor->index,
-			   drm_is_current_master(priv) ? 'y' : 'n',
+			   is_current_master ? 'y' : 'n',
 			   priv->authenticated ? 'y' : 'n',
 			   from_kuid_munged(seq_user_ns(m), uid),
 			   priv->magic);
-- 
2.30.2

