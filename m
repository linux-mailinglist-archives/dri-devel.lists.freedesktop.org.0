Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55310B47082
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 16:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EF210E39F;
	Sat,  6 Sep 2025 14:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XAOKq3V6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4469110E39E;
 Sat,  6 Sep 2025 14:37:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AC2BD601DD;
 Sat,  6 Sep 2025 14:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BC4C4CEFA;
 Sat,  6 Sep 2025 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757169428;
 bh=pplrqkFQTtLalZ35q5dvN936yxvSvl8ERQoDKPqGGxk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XAOKq3V6oJArWb34lphOJZvL9RfS2hgdcttOxlUWc9/OWuRuoRn42zdrMnjE6IzlD
 lMRCACr0bYc5F+SrwvXNsUUFeU72skk3s9UZB8pt8sMAP+BqomCEtPMv6l0zDIsaTL
 ZVhFUZHuy2gj2FxTOawg4TzxOpyfnWcAIXDFK6ny+11jvf+CIY4PDkcXb0Pw+kR5oo
 RzltxLWOiy8kPwasCDsgRBe7Q37hGRFmVW+TuArjy0WGvrkyfbKtob1indEmoFaaSM
 qOUZwHks9hhDmUsGQ+NG/zprvxcaYZtBCfJGLK5bV0bQdiTTiuSpbmbbtMGSusKjyK
 QVmJKzQ7eZ1JA==
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
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v6 RESEND 04/11] USB: Pass PMSG_POWEROFF event to
 suspend_common() for poweroff with S4 flow
Date: Sat,  6 Sep 2025 09:36:35 -0500
Message-ID: <20250906143642.2590808-5-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250906143642.2590808-1-superm1@kernel.org>
References: <20250906143642.2590808-1-superm1@kernel.org>
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

If powering off the system with the S4 flow USB wakeup sources should
be ignored. Add a new callback hcd_pci_poweroff() which will differentiate
whether target state is S5 and pass PMSG_POWEROFF as the message so that
suspend_common() will avoid doing wakeups.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/usb/core/hcd-pci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index cd223475917ef..921d1d0940016 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
@@ -531,6 +532,13 @@ static int hcd_pci_freeze(struct device *dev)
 	return suspend_common(dev, PMSG_FREEZE);
 }
 
+static int hcd_pci_poweroff(struct device *dev)
+{
+	if (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF)
+		return suspend_common(dev, PMSG_POWEROFF);
+	return suspend_common(dev, PMSG_SUSPEND);
+}
+
 static int hcd_pci_suspend_noirq(struct device *dev)
 {
 	struct pci_dev		*pci_dev = to_pci_dev(dev);
@@ -602,6 +610,7 @@ static int hcd_pci_restore(struct device *dev)
 #define hcd_pci_suspend		NULL
 #define hcd_pci_freeze			NULL
 #define hcd_pci_suspend_noirq	NULL
+#define hcd_pci_poweroff	NULL
 #define hcd_pci_poweroff_late	NULL
 #define hcd_pci_resume_noirq	NULL
 #define hcd_pci_resume		NULL
@@ -639,7 +648,7 @@ const struct dev_pm_ops usb_hcd_pci_pm_ops = {
 	.freeze_noirq	= check_root_hub_suspended,
 	.thaw_noirq	= NULL,
 	.thaw		= hcd_pci_resume,
-	.poweroff	= hcd_pci_suspend,
+	.poweroff	= hcd_pci_poweroff,
 	.poweroff_late	= hcd_pci_poweroff_late,
 	.poweroff_noirq	= hcd_pci_suspend_noirq,
 	.restore_noirq	= hcd_pci_resume_noirq,
-- 
2.43.0

