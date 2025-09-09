Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4DB50623
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 21:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606F310E7E6;
	Tue,  9 Sep 2025 19:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RSkozw1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3843010E7E1;
 Tue,  9 Sep 2025 19:17:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 200CB4379C;
 Tue,  9 Sep 2025 19:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4B2C4CEF4;
 Tue,  9 Sep 2025 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757445424;
 bh=gVzxOE/pl/exM5/3ViV8ssmW6tGDSsp+WYKa5FxPoEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RSkozw1g/nG+tUtkLwJcR5YP+2XwvAU++L0WUndrrz/c+jjIsjZLVcIdlHQHNZyg2
 il0Xe+pJk7IP0kyenCv5oitFAZB3uHCGXuQHm6eqP21QvXCOIr6y7y99FYK2r0Loa5
 /qfrvRMe2yAZDoN+IVzyENwZU+bpO5HxzRu08huVBQr/zmBi27gIPHhHwN82UrNXbg
 a/RMIiLygBst9XuqPL0YYkYuE+NzoS9sQD5NHiYvd//Wn87YYFnkGvmrsLgPnnwZpJ
 ws4lbjKAoOEzhCJ53lPNJOPQCRSixjZEkaTd6I44jjftM4WyFq77QM6pPyaU7ex/7k
 y3uBQcISsATrg==
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
Subject: [PATCH v7 12/12] Documentation: power: Add document on debugging
 shutdown hangs
Date: Tue,  9 Sep 2025 14:16:19 -0500
Message-ID: <20250909191619.2580169-13-superm1@kernel.org>
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

The kernel will attempt hibernation callbacks before shutdown callbacks.
If there is any problem with this, ideally a UART log should be captured
to debug the problem.  However if one isn't available users can use the
pstore functionality to retrieve logs.  Add a document explaining how
this works.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v7:
 * New patch
---
 Documentation/power/index.rst              |  1 +
 Documentation/power/shutdown-debugging.rst | 55 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/power/shutdown-debugging.rst

diff --git a/Documentation/power/index.rst b/Documentation/power/index.rst
index a0f5244fb4279..ea70633d9ce6c 100644
--- a/Documentation/power/index.rst
+++ b/Documentation/power/index.rst
@@ -19,6 +19,7 @@ Power Management
     power_supply_class
     runtime_pm
     s2ram
+    shutdown-debugging
     suspend-and-cpuhotplug
     suspend-and-interrupts
     swsusp-and-swap-files
diff --git a/Documentation/power/shutdown-debugging.rst b/Documentation/power/shutdown-debugging.rst
new file mode 100644
index 0000000000000..d4bf12000c1cd
--- /dev/null
+++ b/Documentation/power/shutdown-debugging.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Debugging Kernel Shutdown Hangs with pstore
++++++++++++++++++++++++++++++++++++++++++++
+
+Overview
+========
+When the system is shut down to either a halt or power off, the kernel will
+attempt to run hibernation calls for all devices. If this fails, the kernel will
+fall back to shutdown callbacks. If this process fails and the system hangs
+the kernel logs will need to be retrieved to debug the issue.
+
+On systems that have a UART available, it is best to configure the kernel to use
+this UART for kernel console output.
+
+If a UART isn't available, the ``pstore`` subsystem provides a mechanism to
+persist this data across a system reset, allowing it to be retrieved on the next
+boot.
+
+Kernel Configuration
+====================
+To enable ``pstore`` and enable saving kernel ring buffer logs, set the
+following kernel configuration options:
+
+* ``CONFIG_PSTORE=y``
+* ``CONFIG_PSTORE_CONSOLE=y``
+
+Additionally, enable a backend to store the data. Depending upon your platform
+some options include:
+
+* ``CONFIG_EFI_VARS_PSTORE=y``
+* ``CONFIG_PSTORE_RAM=y``
+* ``CONFIG_PSTORE_FIRMWARE=y``
+* ``CONFIG_PSTORE_BLK=y``
+
+Kernel Command-line Parameters
+==============================
+Add these parameters to your kernel command line:
+
+* ``printk.always_kmsg_dump=Y``
+	* Forces the kernel to dump the entire message buffer to pstore during
+		shutdown
+* ``efi_pstore.pstore_disable=N``
+	* For EFI-based systems, ensures the EFI backend is active
+
+Userspace Interaction and Log Retrieval
+=======================================
+On the next boot after a hang, pstore logs will be available in the pstore
+filesystem (``/sys/fs/pstore``) and can be retrieved by userspace.
+
+On systemd systems, the ``systemd-pstore`` service will help do the following:
+
+#. Locate pstore data in ``/sys/fs/pstore``
+#. Read and save it to ``/var/lib/systemd/pstore``
+#. Clear pstore data for the next event
-- 
2.43.0

