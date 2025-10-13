Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C762BD5933
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 19:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3794C10E49A;
	Mon, 13 Oct 2025 17:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mB1kSfTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F41610E4A3;
 Mon, 13 Oct 2025 17:48:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B439745722;
 Mon, 13 Oct 2025 17:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A64C4CEFE;
 Mon, 13 Oct 2025 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760377703;
 bh=ZE1Ye8qUp4WKzIc4tbshXNmSkf6yIHsgJ+Q+4UTx8Ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mB1kSfTcR7Z5FBAekoDX2XH5f/HTDxdT7uzpzLbp62Gr+hOS2Tp3WV/p6LDe4+knn
 L2xmlo3pcx5RpdGep6+pVcz/WYC59mMDZsoEwbL83gdeOy+aAWmDec7DdHfVexnQLb
 kxqe6pRLQ7Px8dscuHpxfVFnjBzmiqN9mqXkVKQnnDlJMTBhbYHdS/7fSoPjoPBAi0
 oWbQeS854WKOWOe6WfIR9ejOFT9L6aTJq3mQJe+dNhfvOVe3dtTWSXz7VqG+xguauf
 TbXvQukt+bXgeRUKmnnEIRzx402TCl+O7Iem9NiiclLe9sD/BLJc7Lmp3Tv3X7D2rD
 EXW0K8YpTK7SA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: [RFC PATCH 1/3] PM: hibernate: Nominally skip thaw sequence for all
 devices
Date: Mon, 13 Oct 2025 12:47:09 -0500
Message-ID: <20251013174729.1101186-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013174729.1101186-1-superm1@kernel.org>
References: <20251013174729.1101186-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

After the hibernation snapshot is created all devices will have
their thaw() callback called before the next stage.  For the most
common scenarios of hibernation this is not necessary because the
device will be powered off anyway.

If the hibernation snapshot was successfully created skip thawing
devices until it's needed for userspace created hibernation image
or hybrid sleep. To accomplish this use PMSG_INVALID in
hibernation_snapshot() and set the dpm functions to skip running.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/base/power/main.c |  6 ++++++
 kernel/power/hibernate.c  | 13 ++++++++++---
 kernel/power/user.c       |  3 +++
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 8179fd53171dc..58f5270a173e8 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -1143,6 +1143,9 @@ void dpm_resume(pm_message_t state)
 	struct device *dev;
 	ktime_t starttime = ktime_get();
 
+	if (state.event == PM_EVENT_INVALID)
+		return;
+
 	trace_suspend_resume(TPS("dpm_resume"), state.event, true);
 
 	pm_transition = state;
@@ -1245,6 +1248,9 @@ void dpm_complete(pm_message_t state)
 {
 	struct list_head list;
 
+	if (state.event == PM_EVENT_INVALID)
+		return;
+
 	trace_suspend_resume(TPS("dpm_complete"), state.event, true);
 
 	INIT_LIST_HEAD(&list);
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index aadf82f57e868..7af2e392c574a 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -480,13 +480,14 @@ int hibernation_snapshot(int platform_mode)
 	if (error || !in_suspend)
 		swsusp_free();
 
-	msg = in_suspend ? (error ? PMSG_RECOVER : PMSG_THAW) : PMSG_RESTORE;
+	msg = in_suspend ? (error ? PMSG_RECOVER : PMSG_INVALID) : PMSG_RESTORE;
 	dpm_resume(msg);
 
-	if (error || !in_suspend)
+	if (error || !in_suspend) {
 		pm_restore_gfp_mask();
+		console_resume_all();
+	}
 
-	console_resume_all();
 	dpm_complete(msg);
 
  Close:
@@ -707,7 +708,13 @@ static void power_down(void)
 
 #ifdef CONFIG_SUSPEND
 	if (hibernation_mode == HIBERNATION_SUSPEND) {
+		/* recover from hibernation_snapshot() */
+		dpm_resume(PMSG_THAW);
+		console_resume_all();
+		dpm_complete(PMSG_THAW);
 		pm_restore_gfp_mask();
+
+		/* run suspend sequence */
 		error = suspend_devices_and_enter(mem_sleep_current);
 		if (!error)
 			goto exit;
diff --git a/kernel/power/user.c b/kernel/power/user.c
index 3f9e3efb9f6e7..d70c963b1ba88 100644
--- a/kernel/power/user.c
+++ b/kernel/power/user.c
@@ -310,6 +310,9 @@ static long snapshot_ioctl(struct file *filp, unsigned int cmd,
 		pm_restore_gfp_mask();
 		error = hibernation_snapshot(data->platform_support);
 		if (!error) {
+			dpm_resume(PMSG_THAW);
+			console_resume_all();
+			dpm_complete(PMSG_THAW);
 			error = put_user(in_suspend, (int __user *)arg);
 			data->ready = !freezer_test_done && !error;
 			freezer_test_done = false;
-- 
2.43.0

