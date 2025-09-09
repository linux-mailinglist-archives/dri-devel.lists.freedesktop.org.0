Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE061B50601
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 21:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCDE10E7CF;
	Tue,  9 Sep 2025 19:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BVHyg5bk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3931910E7CA;
 Tue,  9 Sep 2025 19:16:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8CB86023C;
 Tue,  9 Sep 2025 19:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9C2C4CEF9;
 Tue,  9 Sep 2025 19:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757445397;
 bh=Z0Bj4Ll54YlhPfK6ZUBkHEGSY87cJ6XGtlr9uAmXAcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BVHyg5bkVOGdAmecnhS6qJZVhmcU8SswbC7jZE18kraD4NDXxa2PnARyVrdQ21nNk
 wQTGP0b1dTAL1nW63AFwcY3vHBNDQ91ut0l9+I364Zf4IvDCUCMnr52NMH5ZEQQnxV
 g5DX0gz98aDZBx3EU0yQhPbM1rAwobpX8r7ezV9RfqyAbppWctYPIH3YRgq6kGjmed
 KYnbqkpsIvRRaYmWpjbwO8sO2jg2xFCfiffdlfLV0RFeIb6TsJsnuk74fYtM7h5TDf
 leu4e5xfoV3jWRZ3PP9YsUQqAbrTfXkn/6UXsTPbX6iugjYXGO2qIHCDJcD5pmewf2
 fNF8uIsehROOg==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), 
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM),
 linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
 linux-trace-kernel@vger.kernel.org (open list:TRACING),
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v7 01/12] PM: Introduce new PMSG_POWEROFF event
Date: Tue,  9 Sep 2025 14:16:08 -0500
Message-ID: <20250909191619.2580169-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909191619.2580169-1-superm1@kernel.org>
References: <20250909191619.2580169-1-superm1@kernel.org>
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

PMSG_POWEROFF will be used for the PM core to allow differentiating between
a hibernation or shutdown sequence when re-using callbacks.

This event should not have wakeups enabled so update PMSG_NO_WAKEUP() to
match it as well.

Tested-by: Eric Naim <dnaim@cachyos.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v7:
 * Reword commit
v5:
 * Re-order and split
 * Add tags
v4:
 * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
---
 drivers/base/power/main.c    | 7 +++++++
 include/linux/pm.h           | 5 ++++-
 include/trace/events/power.h | 3 ++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 2ea6e05e6ec90..86661c94e8cef 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -99,6 +99,8 @@ static const char *pm_verb(int event)
 		return "restore";
 	case PM_EVENT_RECOVER:
 		return "recover";
+	case PM_EVENT_POWEROFF:
+		return "poweroff";
 	default:
 		return "(unknown PM event)";
 	}
@@ -369,6 +371,7 @@ static pm_callback_t pm_op(const struct dev_pm_ops *ops, pm_message_t state)
 	case PM_EVENT_FREEZE:
 	case PM_EVENT_QUIESCE:
 		return ops->freeze;
+	case PM_EVENT_POWEROFF:
 	case PM_EVENT_HIBERNATE:
 		return ops->poweroff;
 	case PM_EVENT_THAW:
@@ -403,6 +406,7 @@ static pm_callback_t pm_late_early_op(const struct dev_pm_ops *ops,
 	case PM_EVENT_FREEZE:
 	case PM_EVENT_QUIESCE:
 		return ops->freeze_late;
+	case PM_EVENT_POWEROFF:
 	case PM_EVENT_HIBERNATE:
 		return ops->poweroff_late;
 	case PM_EVENT_THAW:
@@ -437,6 +441,7 @@ static pm_callback_t pm_noirq_op(const struct dev_pm_ops *ops, pm_message_t stat
 	case PM_EVENT_FREEZE:
 	case PM_EVENT_QUIESCE:
 		return ops->freeze_noirq;
+	case PM_EVENT_POWEROFF:
 	case PM_EVENT_HIBERNATE:
 		return ops->poweroff_noirq;
 	case PM_EVENT_THAW:
@@ -1370,6 +1375,8 @@ static pm_message_t resume_event(pm_message_t sleep_state)
 		return PMSG_RECOVER;
 	case PM_EVENT_HIBERNATE:
 		return PMSG_RESTORE;
+	case PM_EVENT_POWEROFF:
+		return PMSG_ON;
 	}
 	return PMSG_ON;
 }
diff --git a/include/linux/pm.h b/include/linux/pm.h
index cc7b2dc28574c..892bd93f13dad 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -507,6 +507,7 @@ const struct dev_pm_ops name = { \
  * RECOVER	Creation of a hibernation image or restoration of the main
  *		memory contents from a hibernation image has failed, call
  *		->thaw() and ->complete() for all devices.
+ * POWEROFF	System will poweroff, call ->poweroff() for all devices.
  *
  * The following PM_EVENT_ messages are defined for internal use by
  * kernel subsystems.  They are never issued by the PM core.
@@ -537,6 +538,7 @@ const struct dev_pm_ops name = { \
 #define PM_EVENT_USER		0x0100
 #define PM_EVENT_REMOTE		0x0200
 #define PM_EVENT_AUTO		0x0400
+#define PM_EVENT_POWEROFF	0x0800
 
 #define PM_EVENT_SLEEP		(PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
 #define PM_EVENT_USER_SUSPEND	(PM_EVENT_USER | PM_EVENT_SUSPEND)
@@ -551,6 +553,7 @@ const struct dev_pm_ops name = { \
 #define PMSG_QUIESCE	((struct pm_message){ .event = PM_EVENT_QUIESCE, })
 #define PMSG_SUSPEND	((struct pm_message){ .event = PM_EVENT_SUSPEND, })
 #define PMSG_HIBERNATE	((struct pm_message){ .event = PM_EVENT_HIBERNATE, })
+#define PMSG_POWEROFF	((struct pm_message){ .event = PM_EVENT_POWEROFF, })
 #define PMSG_RESUME	((struct pm_message){ .event = PM_EVENT_RESUME, })
 #define PMSG_THAW	((struct pm_message){ .event = PM_EVENT_THAW, })
 #define PMSG_RESTORE	((struct pm_message){ .event = PM_EVENT_RESTORE, })
@@ -568,7 +571,7 @@ const struct dev_pm_ops name = { \
 
 #define PMSG_IS_AUTO(msg)	(((msg).event & PM_EVENT_AUTO) != 0)
 #define PMSG_NO_WAKEUP(msg)	(((msg).event & \
-				(PM_EVENT_FREEZE | PM_EVENT_QUIESCE)) != 0)
+				(PM_EVENT_FREEZE | PM_EVENT_QUIESCE | PM_EVENT_POWEROFF)) != 0)
 /*
  * Device run-time power management status.
  *
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 82904291c2b81..370f8df2fdb4b 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -179,7 +179,8 @@ TRACE_EVENT(pstate_sample,
 		{ PM_EVENT_HIBERNATE, "hibernate" }, \
 		{ PM_EVENT_THAW, "thaw" }, \
 		{ PM_EVENT_RESTORE, "restore" }, \
-		{ PM_EVENT_RECOVER, "recover" })
+		{ PM_EVENT_RECOVER, "recover" }, \
+		{ PM_EVENT_POWEROFF, "poweroff" })
 
 DEFINE_EVENT(cpu, cpu_frequency,
 
-- 
2.43.0

