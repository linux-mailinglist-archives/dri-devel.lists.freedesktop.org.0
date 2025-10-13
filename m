Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E2BD5939
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 19:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605FC10E4A6;
	Mon, 13 Oct 2025 17:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ERqtnaxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01D410E4A5;
 Mon, 13 Oct 2025 17:48:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 852B3439A6;
 Mon, 13 Oct 2025 17:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B6DC116D0;
 Mon, 13 Oct 2025 17:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760377706;
 bh=5WAuRoHX69rBGibbaw5bc/LE/1SwO8vg1g8NJeXy/nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ERqtnaxSzI5OuEB1q1eSX7n9zavJ17klzUfSyPVnP+qdq37rN8pWQufjgmWzSwRVh
 DbnPwgkUslj9+86SU5vYIn0gLTzsX6UFhONN7ypll07/96RFjW3j3Y9FHelrScNcVa
 M+ry+bDmUIA5WofsvWFCnY+4plq/EjBiW+h3au3IMznuPL813Rf1Wutz07BGo6u46U
 zVNDTdCOSfULDflg20tUwe0pyhb7/I+Q3jVwnfuyTqRL7Y/3PkPy3/wZrgXvJd0Xk6
 Z9bXnI2DVjB/jvZz2Xl0yOAoi9ZVR1DZN2+LFXWFWrh4N2yVhfHBNFtWYLPNkneTEV
 aK1+JziMFS7fw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: [RFC PATCH 3/3] PM: Drop pm_hibernate_is_recovering() and
 pm_hibernation_mode_is_suspend()
Date: Mon, 13 Oct 2025 12:47:11 -0500
Message-ID: <20251013174729.1101186-4-superm1@kernel.org>
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

All consumers in the kernel of pm_hibernate_is_recovering() and
pm_hibernation_mode_is_suspend() have been dropped.  Remove the symbols.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/base/power/main.c | 14 --------------
 include/linux/suspend.h   |  8 --------
 kernel/power/hibernate.c  | 11 -----------
 3 files changed, 33 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 58f5270a173e8..e2f23e62abb18 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -62,20 +62,6 @@ static pm_message_t pm_transition;
 static DEFINE_MUTEX(async_wip_mtx);
 static int async_error;
 
-/**
- * pm_hibernate_is_recovering - if recovering from hibernate due to error.
- *
- * Used to query if dev_pm_ops.thaw() is called for normal hibernation case or
- * recovering from some error.
- *
- * Return: true for error case, false for normal case.
- */
-bool pm_hibernate_is_recovering(void)
-{
-	return pm_transition.event == PM_EVENT_RECOVER;
-}
-EXPORT_SYMBOL_GPL(pm_hibernate_is_recovering);
-
 static const char *pm_verb(int event)
 {
 	switch (event) {
diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index 348831cdb60e4..f305fcc7a2cdc 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -420,12 +420,6 @@ static inline int hibernate_quiet_exec(int (*func)(void *data), void *data) {
 }
 #endif /* CONFIG_HIBERNATION */
 
-#if defined(CONFIG_HIBERNATION) && defined(CONFIG_SUSPEND)
-bool pm_hibernation_mode_is_suspend(void);
-#else
-static inline bool pm_hibernation_mode_is_suspend(void) { return false; }
-#endif
-
 int arch_resume_nosmt(void);
 
 #ifdef CONFIG_HIBERNATION_SNAPSHOT_DEV
@@ -486,7 +480,6 @@ extern unsigned int lock_system_sleep(void);
 extern void unlock_system_sleep(unsigned int);
 
 extern bool pm_sleep_transition_in_progress(void);
-bool pm_hibernate_is_recovering(void);
 
 #else /* !CONFIG_PM_SLEEP */
 
@@ -520,7 +513,6 @@ static inline unsigned int lock_system_sleep(void) { return 0; }
 static inline void unlock_system_sleep(unsigned int flags) {}
 
 static inline bool pm_sleep_transition_in_progress(void) { return false; }
-static inline bool pm_hibernate_is_recovering(void) { return false; }
 
 #endif /* !CONFIG_PM_SLEEP */
 
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 7af2e392c574a..ec02a8be20b30 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -80,17 +80,6 @@ static const struct platform_hibernation_ops *hibernation_ops;
 
 static atomic_t hibernate_atomic = ATOMIC_INIT(1);
 
-#ifdef CONFIG_SUSPEND
-/**
- * pm_hibernation_mode_is_suspend - Check if hibernation has been set to suspend
- */
-bool pm_hibernation_mode_is_suspend(void)
-{
-	return hibernation_mode == HIBERNATION_SUSPEND;
-}
-EXPORT_SYMBOL_GPL(pm_hibernation_mode_is_suspend);
-#endif
-
 bool hibernate_acquire(void)
 {
 	return atomic_add_unless(&hibernate_atomic, -1, 0);
-- 
2.43.0

