Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6FB29684
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 04:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B985410E33A;
	Mon, 18 Aug 2025 02:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CMAISsBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EED510E33D;
 Mon, 18 Aug 2025 02:01:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F3E455C5618;
 Mon, 18 Aug 2025 02:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E864C116B1;
 Mon, 18 Aug 2025 02:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755482496;
 bh=3S7JR1J0KLdyO8pzE3T0jrrcCJZbmsNBb/5yq5sNZ4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CMAISsBjUgA4fctYz+4cet0OK/3k219Lmk3YdowyIwCoe92HwH6npZNtE35zyIohk
 NUBeSAPtfEbp7/LSC6Pxz+FdCjG3kJwjsRqFiyWVlQ86Aq9q5BQ7B/V1IZ4TYcm9GG
 mogNnwJTXsc65r3YKG1UazHpeyCCeoPJRde1tNfDDOaD6H/VyqFViYo9kGsKMnN8q/
 wHIrsi22IgbLkpgj5uI7APahyk0OJKRlUfPmqAizUai/nWwKPcpzf+fqr4iCIA/CKM
 e2H09L5epXfBbONFv/5WNxtan5mZYLfGsrV6j5vi4ikev/0CbGiw8ZRLhqHKLMcOJY
 nf4MDGmhJ7ARQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
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
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v6 11/11] PM: Use hibernate flows for system power off
Date: Sun, 17 Aug 2025 21:01:01 -0500
Message-ID: <20250818020101.3619237-12-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818020101.3619237-1-superm1@kernel.org>
References: <20250818020101.3619237-1-superm1@kernel.org>
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

To accomplish this, use the PMSG_POWEROFF event to call all the device
hibernate callbacks when the kernel is compiled with hibernate support.
If compiled without hibernate support or hibernate fails fall back into
the previous shutdown flow.

Cc: AceLan Kao <acelan.kao@canonical.com>
Cc: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Merthan Karakaş <m3rthn.k@gmail.com>
Tested-by: Eric Naim <dnaim@cachyos.org>
Tested-by: Denis Benato <benato.denis96@gmail.com>
Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limonciello@amd.com/
Link: https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@kernel.org/
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v5:
 * split to multiple commits, re-order
v4:
 * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
v3:
 * Add new PMSG_POWEROFF and PM_EVENT_POWEROFF which alias to poweroff
   callbacks
 * Don't try to cleanup on dpm_suspend_start() or dpm_suspend_end() failures
   Jump right into normal shutdown flow instead.
 * https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@kernel.org/T/#me6db0fb946e3d604a8f3d455128844ed802c82bb
---
 kernel/reboot.c | 6 ++++++
 1 file changed, 6 insertions(+)

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

