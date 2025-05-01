Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9670AA6533
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 23:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A8C10E366;
	Thu,  1 May 2025 21:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B/Aj37mG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243E310E359;
 Thu,  1 May 2025 21:17:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49B88A4C056;
 Thu,  1 May 2025 21:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEF1C4CEE4;
 Thu,  1 May 2025 21:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746134262;
 bh=K4MmJsFOqj06ZIIW69gO6jZf/P/l85wTBu93pWTfneY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B/Aj37mGi5OSNmI5h0L5No4Fqpc5O2v/in4ZNOTZ6H2la8yuKEfnIKBX2ZJgnkSqm
 i8TRhQglT8SPmcC6ASg1CjBkV/vXYCscHkUK3a0+HE0DfkyLsC36MStsqKTLRxu3P5
 yA1YqFFgIQov9wicqfwboedA+idpwfTS/o4+h4hw9673EewUkTDNMY9+5VoXQjkCh7
 blNwg9roVJzrbZjw/OceHMj27CF80bGpljYAA3Z/gBugHxIuc736ATqXFtNHPrm/X3
 i/amw22cnTc4BtJRLAQVsJ4S2fl+KmhDHN3dK57p++6sRSWh84Hmh1K53cHPRhWVPM
 qlZ2CXvToVnYg==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), Mario Limonciello <mario.limonciello@amd.com>
Subject: [RFC 1/2] PM: Add suspend and hibernate notifications for after freeze
Date: Thu,  1 May 2025 16:17:32 -0500
Message-ID: <20250501211734.2434369-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250501211734.2434369-1-superm1@kernel.org>
References: <20250501211734.2434369-1-superm1@kernel.org>
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

Suspend and hibernate notifications are available specifically when
the sequence starts and finishes.  However there are no notifications
during the process when tasks have been frozen.

Introduce two new events `PM_SUSPEND_POST_FREEZE` and
`PM_HIBERNATE_POST_FREEZE` that drivers can subscribe to and take
different actions specifically knowing userspace is frozen.

Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 Documentation/driver-api/pm/notifiers.rst | 19 ++++++++++++++++---
 include/linux/suspend.h                   | 14 ++++++++------
 kernel/power/hibernate.c                  |  9 +++++++--
 kernel/power/suspend.c                    | 13 +++++++++----
 4 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/Documentation/driver-api/pm/notifiers.rst b/Documentation/driver-api/pm/notifiers.rst
index 186435c43b77e..6a1912fbee214 100644
--- a/Documentation/driver-api/pm/notifiers.rst
+++ b/Documentation/driver-api/pm/notifiers.rst
@@ -32,6 +32,18 @@ will be called upon the following events by the PM core:
 	additional work is done between the notifiers and the invocation of PM
 	callbacks for the "freeze" transition.
 
+``PM_HIBERNATION_POST_FREEZE``
+	The system is going to hibernate and tasks have just been frozen.
+
+``PM_SUSPEND_PREPARE``
+	The system is going to suspend, tasks will be frozen immediately.  This
+	is different from ``PM_HIBERNATION_PREPARE`` above, because in this case
+	additional work is done between the notifiers and the invocation of PM
+	callbacks for the "freeze" transition.
+
+``PM_SUSPEND_POST_FREEZE``
+	The system is going to suspend and tasks have just been frozen.
+
 ``PM_POST_HIBERNATION``
 	The system memory state has been restored from a hibernation image or an
 	error occurred during hibernation.  Device restore callbacks have been
@@ -54,9 +66,10 @@ will be called upon the following events by the PM core:
 	resume callbacks have been executed and tasks have been thawed.
 
 It is generally assumed that whatever the notifiers do for
-``PM_HIBERNATION_PREPARE``, should be undone for ``PM_POST_HIBERNATION``.
-Analogously, operations carried out for ``PM_SUSPEND_PREPARE`` should be
-reversed for ``PM_POST_SUSPEND``.
+``PM_HIBERNATION_PREPARE`` and ``PM_HIBERNATION_POST_FREEZE``, should be undone
+for ``PM_POST_HIBERNATION``.
+Analogously, operations carried out for ``PM_SUSPEND_PREPARE`` and ``PM_SUSPEND_POST_FREEZE``
+should be reversed for ``PM_POST_SUSPEND``.
 
 Moreover, if one of the notifiers fails for the ``PM_HIBERNATION_PREPARE`` or
 ``PM_SUSPEND_PREPARE`` event, the notifiers that have already succeeded for that
diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index da6ebca3ff774..704e6579b0df6 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -422,12 +422,14 @@ static inline int is_hibernate_resume_dev(dev_t dev) { return 0; }
 #endif
 
 /* Hibernation and suspend events */
-#define PM_HIBERNATION_PREPARE	0x0001 /* Going to hibernate */
-#define PM_POST_HIBERNATION	0x0002 /* Hibernation finished */
-#define PM_SUSPEND_PREPARE	0x0003 /* Going to suspend the system */
-#define PM_POST_SUSPEND		0x0004 /* Suspend finished */
-#define PM_RESTORE_PREPARE	0x0005 /* Going to restore a saved image */
-#define PM_POST_RESTORE		0x0006 /* Restore failed */
+#define PM_HIBERNATION_PREPARE		0x0001 /* Going to hibernate */
+#define PM_HIBERNATION_POST_FREEZE	0x0002 /* Prepared for hibernation and tasks have been frozen */
+#define PM_POST_HIBERNATION		0x0003 /* Hibernation finished */
+#define PM_SUSPEND_PREPARE		0x0004 /* Going to suspend the system */
+#define PM_SUSPEND_POST_FREEZE		0x0005 /* Prepared and tasks have been frozen */
+#define PM_POST_SUSPEND			0x0006 /* Suspend finished */
+#define PM_RESTORE_PREPARE		0x0007 /* Going to restore a saved image */
+#define PM_POST_RESTORE			0x0008 /* Restore failed */
 
 extern struct mutex system_transition_mutex;
 
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index f0db9d1896e80..f896056ad2e5d 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -783,11 +783,15 @@ int hibernate(void)
 	if (error)
 		goto Exit;
 
+	error = pm_notifier_call_chain_robust(PM_HIBERNATION_POST_FREEZE, PM_POST_HIBERNATION);
+	if (error)
+		goto Thaw;
+
 	lock_device_hotplug();
 	/* Allocate memory management structures */
 	error = create_basic_memory_bitmaps();
 	if (error)
-		goto Thaw;
+		goto Unlock_hotplug;
 
 	error = hibernation_snapshot(hibernation_mode == HIBERNATION_PLATFORM);
 	if (error || freezer_test_done)
@@ -833,8 +837,9 @@ int hibernate(void)
 
  Free_bitmaps:
 	free_basic_memory_bitmaps();
- Thaw:
+ Unlock_hotplug:
 	unlock_device_hotplug();
+ Thaw:
 	if (snapshot_test) {
 		pm_pr_dbg("Checking hibernation image\n");
 		error = swsusp_check(false);
diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 8eaec4ab121d4..bc6654e8cdc80 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -377,13 +377,18 @@ static int suspend_prepare(suspend_state_t state)
 	trace_suspend_resume(TPS("freeze_processes"), 0, true);
 	error = suspend_freeze_processes();
 	trace_suspend_resume(TPS("freeze_processes"), 0, false);
-	if (!error)
-		return 0;
+	if (error)
+		goto Restore;
+	error = pm_notifier_call_chain_robust(PM_SUSPEND_POST_FREEZE, PM_POST_SUSPEND);
+	if (error)
+		goto Thaw;
 
-	dpm_save_failed_step(SUSPEND_FREEZE);
-	pm_notifier_call_chain(PM_POST_SUSPEND);
+	return 0;
+ Thaw:
+	suspend_thaw_processes();
  Restore:
 	pm_restore_console();
+	dpm_save_failed_step(SUSPEND_FREEZE);
 	return error;
 }
 
-- 
2.43.0

