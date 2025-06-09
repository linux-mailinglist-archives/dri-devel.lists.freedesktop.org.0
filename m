Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D3AD1708
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 04:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2510E1FC;
	Mon,  9 Jun 2025 02:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M5n05K0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2934C10E201;
 Mon,  9 Jun 2025 02:46:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 64E8DA4032B;
 Mon,  9 Jun 2025 02:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD64C4CEF3;
 Mon,  9 Jun 2025 02:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749437198;
 bh=oLMw9x+WtPbHGPX21gfOQ8knl48wXe3kHwwnOtKAizk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M5n05K0Km7kpuOmj70Xs5absUd89YGmrZr+yMqud5L0Qt575FV4G8v3fsEKU8QY0r
 iO5NX+VMLhPJDSXJMXqeDE30nzN6gf5sB2cKGjaHQj4JMh352jNax7BPKXiZgd8drX
 y3UznIkUrwIR9eums89f4oAER/ZzsjOxpz/0zWGOe63Bcu8mOfrlkoC26nzos7gHhJ
 /F2sPyrUe6wQcxASe0oqeSfBC5VkeE1yB1WdtN/xAO2sDMGWCdWPn0BhBMBQOEmYGf
 oy+Ld7kDCHeov0zKqBr1CGdmGEaHJP8aM2P7Ii14TRtCeyReN8SX1+3r2WV+MG5zgf
 qQDhZs69MiOAw==
From: Mario Limonciello <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list),
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM),
 linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
 Mario Limonciello <mario.limonciello@amd.com>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v3 1/5] PM: Use hibernate flows for system power off
Date: Sun,  8 Jun 2025 21:46:15 -0500
Message-ID: <20250609024619.407257-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609024619.407257-1-superm1@kernel.org>
References: <20250609024619.407257-1-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When the system is powered off the kernel will call device_shutdown()
which will issue callbacks into PCI core to wake up a device and call
it's shutdown() callback.  This will leave devices in ACPI D0 which can
cause some devices to misbehave with spurious wakeups and also leave some
devices on which will consume power needlessly.

The issue won't happen if the device is in D3 before system shutdown, so
putting device to low power state before shutdown solves the issue.

ACPI Spec 6.5, "7.4.2.5 System \_S4 State" says "Devices states are
compatible with the current Power Resource states. In other words, all
devices are in the D3 state when the system state is S4."

The following "7.4.2.6 System \_S5 State (Soft Off)" states "The S5
state is similar to the S4 state except that OSPM does not save any
context." so it's safe to assume devices should be at D3 for S5.

To accomplish this, introduce a new PMSG_POWEROFF event that the PM core
will use. During shutdown the use the new event to call all the device
hibernate callbacks when the kernel is compiled with hibernate support.
If compiled without hibernate support or hibernate fails fall back into
the previous shutdown flow.

Cc: AceLan Kao <acelan.kao@canonical.com>
Cc: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Merthan Karakaş <m3rthn.k@gmail.com>
Tested-by: Denis Benato <benato.denis96@gmail.com>
Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limonciello@amd.com/
Link: https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@kernel.org/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3:
 * Add new PMSG_POWEROFF and PM_EVENT_POWEROFF which alias to poweroff
   callbacks
 * Don't try to cleanup on dpm_suspend_start() or dpm_suspend_end() failures
   Jump right into normal shutdown flow instead.
---
 drivers/base/power/main.c    | 7 +++++++
 include/linux/pm.h           | 3 +++
 include/trace/events/power.h | 3 ++-
 kernel/reboot.c              | 6 ++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index eebe699fdf4f6..0215b20c5e2c8 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -85,6 +85,8 @@ static const char *pm_verb(int event)
 		return "restore";
 	case PM_EVENT_RECOVER:
 		return "recover";
+	case PM_EVENT_POWEROFF:
+		return "poweroff";
 	default:
 		return "(unknown PM event)";
 	}
@@ -355,6 +357,7 @@ static pm_callback_t pm_op(const struct dev_pm_ops *ops, pm_message_t state)
 	case PM_EVENT_FREEZE:
 	case PM_EVENT_QUIESCE:
 		return ops->freeze;
+	case PM_EVENT_POWEROFF:
 	case PM_EVENT_HIBERNATE:
 		return ops->poweroff;
 	case PM_EVENT_THAW:
@@ -389,6 +392,7 @@ static pm_callback_t pm_late_early_op(const struct dev_pm_ops *ops,
 	case PM_EVENT_FREEZE:
 	case PM_EVENT_QUIESCE:
 		return ops->freeze_late;
+	case PM_EVENT_POWEROFF:
 	case PM_EVENT_HIBERNATE:
 		return ops->poweroff_late;
 	case PM_EVENT_THAW:
@@ -423,6 +427,7 @@ static pm_callback_t pm_noirq_op(const struct dev_pm_ops *ops, pm_message_t stat
 	case PM_EVENT_FREEZE:
 	case PM_EVENT_QUIESCE:
 		return ops->freeze_noirq;
+	case PM_EVENT_POWEROFF:
 	case PM_EVENT_HIBERNATE:
 		return ops->poweroff_noirq;
 	case PM_EVENT_THAW:
@@ -1296,6 +1301,8 @@ static pm_message_t resume_event(pm_message_t sleep_state)
 		return PMSG_RECOVER;
 	case PM_EVENT_HIBERNATE:
 		return PMSG_RESTORE;
+	case PM_EVENT_POWEROFF:
+		return PMSG_ON;
 	}
 	return PMSG_ON;
 }
diff --git a/include/linux/pm.h b/include/linux/pm.h
index f0bd8fbae4f2c..cb66f47631a70 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -506,6 +506,7 @@ const struct dev_pm_ops name = { \
  * RECOVER	Creation of a hibernation image or restoration of the main
  *		memory contents from a hibernation image has failed, call
  *		->thaw() and ->complete() for all devices.
+ * POWEROFF	System will poweroff, call ->poweroff() for all devices.
  *
  * The following PM_EVENT_ messages are defined for internal use by
  * kernel subsystems.  They are never issued by the PM core.
@@ -536,6 +537,7 @@ const struct dev_pm_ops name = { \
 #define PM_EVENT_USER		0x0100
 #define PM_EVENT_REMOTE		0x0200
 #define PM_EVENT_AUTO		0x0400
+#define PM_EVENT_POWEROFF	0x0800
 
 #define PM_EVENT_SLEEP		(PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
 #define PM_EVENT_USER_SUSPEND	(PM_EVENT_USER | PM_EVENT_SUSPEND)
@@ -550,6 +552,7 @@ const struct dev_pm_ops name = { \
 #define PMSG_QUIESCE	((struct pm_message){ .event = PM_EVENT_QUIESCE, })
 #define PMSG_SUSPEND	((struct pm_message){ .event = PM_EVENT_SUSPEND, })
 #define PMSG_HIBERNATE	((struct pm_message){ .event = PM_EVENT_HIBERNATE, })
+#define PMSG_POWEROFF	((struct pm_message){ .event = PM_EVENT_POWEROFF, })
 #define PMSG_RESUME	((struct pm_message){ .event = PM_EVENT_RESUME, })
 #define PMSG_THAW	((struct pm_message){ .event = PM_EVENT_THAW, })
 #define PMSG_RESTORE	((struct pm_message){ .event = PM_EVENT_RESTORE, })
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 6c631eec23e32..8fa70f2397379 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -199,7 +199,8 @@ TRACE_EVENT(pstate_sample,
 		{ PM_EVENT_HIBERNATE, "hibernate" }, \
 		{ PM_EVENT_THAW, "thaw" }, \
 		{ PM_EVENT_RESTORE, "restore" }, \
-		{ PM_EVENT_RECOVER, "recover" })
+		{ PM_EVENT_RECOVER, "recover" }, \
+		{ PM_EVENT_POWEROFF, "poweroff" })
 
 DEFINE_EVENT(cpu, cpu_frequency,
 
diff --git a/kernel/reboot.c b/kernel/reboot.c
index ec087827c85cd..c8835f8e5f271 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -13,6 +13,7 @@
 #include <linux/kexec.h>
 #include <linux/kmod.h>
 #include <linux/kmsg_dump.h>
+#include <linux/pm.h>
 #include <linux/reboot.h>
 #include <linux/suspend.h>
 #include <linux/syscalls.h>
@@ -305,6 +306,11 @@ static void kernel_shutdown_prepare(enum system_states state)
 		(state == SYSTEM_HALT) ? SYS_HALT : SYS_POWER_OFF, NULL);
 	system_state = state;
 	usermodehelper_disable();
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+	if (!dpm_suspend_start(PMSG_POWEROFF) && !dpm_suspend_end(PMSG_POWEROFF))
+		return;
+	pr_emerg("Failed to power off devices, using shutdown instead.\n");
+#endif
 	device_shutdown();
 }
 /**
-- 
2.43.0

