Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E966C558A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 20:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02A810E9DA;
	Wed, 22 Mar 2023 19:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013CD10E9D6;
 Wed, 22 Mar 2023 19:59:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9406B81DEC;
 Wed, 22 Mar 2023 19:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29956C433D2;
 Wed, 22 Mar 2023 19:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515153;
 bh=gelvFvMvURmRLNCZnWXCKgk4dLWxrbXorcbSCtb53hs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=snS5UCqOMLYx2u23uYPdpjR4lN9VoKTXh7dqodfom9hjWgW5oxD1lHKEomebejD3C
 pm1RTUN3lMBbO8ZWQgsMoJD8jF3JK1RvbJjt1IFVETfVALRCRcJrGdAAZLjmYVwrhz
 oj/aZsQBwddnRIafeOsLexnhazcsnir1GZBCVrvPlQIrsRpgY+8ZmyOMmXCKexgg7R
 E3EZQ//fnhKyq+X4IQZlIGuBIRgAD+A67+Q8Emj/bt+1KCg/BMt5nb0C1yaSnAtxO+
 QJsa47nqtvHumy5lZaoLN0OEDgrDdzuAsdXRHv6J/VrcPhZiOtxoDWjVc47VCt7eJ9
 qb27RhqN68IQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 37/45] drm/amdkfd: Fixed kfd_process cleanup on
 module exit.
Date: Wed, 22 Mar 2023 15:56:31 -0400
Message-Id: <20230322195639.1995821-37-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 David Belanger <david.belanger@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Belanger <david.belanger@amd.com>

[ Upstream commit 20bc9f76b6a2455c6b54b91ae7634f147f64987f ]

Handle case when module is unloaded (kfd_exit) before a process space
(mm_struct) is released.

v2: Fixed potential race conditions by removing all kfd_process from
the process table first, then working on releasing the resources.

v3: Fixed loop element access / synchronization.  Fixed extra empty lines.

Signed-off-by: David Belanger <david.belanger@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_module.c  |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 67 +++++++++++++++++++++---
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_module.c b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
index 09b966dc37681..aee2212e52f69 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_module.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
@@ -77,6 +77,7 @@ static int kfd_init(void)
 
 static void kfd_exit(void)
 {
+	kfd_cleanup_processes();
 	kfd_debugfs_fini();
 	kfd_process_destroy_wq();
 	kfd_procfs_shutdown();
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 552c3ac85a132..7dc55919993c0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -926,6 +926,7 @@ bool kfd_dev_is_large_bar(struct kfd_dev *dev);
 
 int kfd_process_create_wq(void);
 void kfd_process_destroy_wq(void);
+void kfd_cleanup_processes(void);
 struct kfd_process *kfd_create_process(struct file *filep);
 struct kfd_process *kfd_get_process(const struct task_struct *task);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 51b1683ac5c1e..4d9f2d1c49b1d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1167,6 +1167,17 @@ static void kfd_process_free_notifier(struct mmu_notifier *mn)
 	kfd_unref_process(container_of(mn, struct kfd_process, mmu_notifier));
 }
 
+static void kfd_process_notifier_release_internal(struct kfd_process *p)
+{
+	cancel_delayed_work_sync(&p->eviction_work);
+	cancel_delayed_work_sync(&p->restore_work);
+
+	/* Indicate to other users that MM is no longer valid */
+	p->mm = NULL;
+
+	mmu_notifier_put(&p->mmu_notifier);
+}
+
 static void kfd_process_notifier_release(struct mmu_notifier *mn,
 					struct mm_struct *mm)
 {
@@ -1181,17 +1192,22 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 		return;
 
 	mutex_lock(&kfd_processes_mutex);
+	/*
+	 * Do early return if table is empty.
+	 *
+	 * This could potentially happen if this function is called concurrently
+	 * by mmu_notifier and by kfd_cleanup_pocesses.
+	 *
+	 */
+	if (hash_empty(kfd_processes_table)) {
+		mutex_unlock(&kfd_processes_mutex);
+		return;
+	}
 	hash_del_rcu(&p->kfd_processes);
 	mutex_unlock(&kfd_processes_mutex);
 	synchronize_srcu(&kfd_processes_srcu);
 
-	cancel_delayed_work_sync(&p->eviction_work);
-	cancel_delayed_work_sync(&p->restore_work);
-
-	/* Indicate to other users that MM is no longer valid */
-	p->mm = NULL;
-
-	mmu_notifier_put(&p->mmu_notifier);
+	kfd_process_notifier_release_internal(p);
 }
 
 static const struct mmu_notifier_ops kfd_process_mmu_notifier_ops = {
@@ -1200,6 +1216,43 @@ static const struct mmu_notifier_ops kfd_process_mmu_notifier_ops = {
 	.free_notifier = kfd_process_free_notifier,
 };
 
+/*
+ * This code handles the case when driver is being unloaded before all
+ * mm_struct are released.  We need to safely free the kfd_process and
+ * avoid race conditions with mmu_notifier that might try to free them.
+ *
+ */
+void kfd_cleanup_processes(void)
+{
+	struct kfd_process *p;
+	struct hlist_node *p_temp;
+	unsigned int temp;
+	HLIST_HEAD(cleanup_list);
+
+	/*
+	 * Move all remaining kfd_process from the process table to a
+	 * temp list for processing.   Once done, callback from mmu_notifier
+	 * release will not see the kfd_process in the table and do early return,
+	 * avoiding double free issues.
+	 */
+	mutex_lock(&kfd_processes_mutex);
+	hash_for_each_safe(kfd_processes_table, temp, p_temp, p, kfd_processes) {
+		hash_del_rcu(&p->kfd_processes);
+		synchronize_srcu(&kfd_processes_srcu);
+		hlist_add_head(&p->kfd_processes, &cleanup_list);
+	}
+	mutex_unlock(&kfd_processes_mutex);
+
+	hlist_for_each_entry_safe(p, p_temp, &cleanup_list, kfd_processes)
+		kfd_process_notifier_release_internal(p);
+
+	/*
+	 * Ensures that all outstanding free_notifier get called, triggering
+	 * the release of the kfd_process struct.
+	 */
+	mmu_notifier_synchronize();
+}
+
 static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 {
 	unsigned long  offset;
-- 
2.39.2

