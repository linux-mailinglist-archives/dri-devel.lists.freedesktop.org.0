Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD80B21596
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 21:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDA710E533;
	Mon, 11 Aug 2025 19:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PXZvNHha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2A010E530;
 Mon, 11 Aug 2025 19:41:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CEAC943DFD;
 Mon, 11 Aug 2025 19:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5403C4CEF8;
 Mon, 11 Aug 2025 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754941283;
 bh=UGv8yMZlE7pfJwSGLN7xjf9pNffnerK8ACuf3st8kZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PXZvNHhalPpwKgkEGAM7UhVylOee8KOqIAP+0IQo71O0HM36Nck8sWeezIOPniQD8
 64NyAv7NMRYsD+NqlI+3NyKHGsF8iK901LIqHdZy9tyFSMmDjgKw6aRcndT2VAGIYW
 bwVxZftEW/QnfUkAws9pu+sZ4tybuFZmGqplQ36Fgk7mC+SfMjNlGdZXHWmsOrZG/e
 IGE//aw8yVq5182TM3+yHEnFDbNeNbIC9Z/IWRFb6NOMBMRTyJwfBtQLTROCZL8Uw5
 IwD0MyD2ZYg/SW9GboQ1+LyEHSlYhd8bGSSLadxAL1BHzsX5d1UN7yuVmEE9yWCD9u
 knqe3D47KLvCQ==
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
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v5 07/11] PCI: PM: Run bridge power up actions as part of
 restore phase
Date: Mon, 11 Aug 2025 14:40:58 -0500
Message-ID: <20250811194102.864225-8-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811194102.864225-1-superm1@kernel.org>
References: <20250811194102.864225-1-superm1@kernel.org>
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

Suspend resume actions will check the state of the device and whether
bus PM should be skipped.  These same actions make sense during hibernation
image restore.  Apply them there as well.

Tested-by: Eric Naim <dnaim@cachyos.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v5:
 * Split out patch
---
 drivers/pci/pci-driver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 571a3809f163a..fb6f1f60b2f1f 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1246,10 +1246,15 @@ static int pci_pm_restore_noirq(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
+	pci_power_t prev_state = pci_dev->current_state;
+	bool skip_bus_pm = pci_dev->skip_bus_pm;
 
 	pci_pm_default_resume_early(pci_dev);
 	pci_fixup_device(pci_fixup_resume_early, pci_dev);
 
+	if (!skip_bus_pm && prev_state == PCI_D3cold)
+		pci_pm_bridge_power_up_actions(pci_dev);
+
 	if (pci_has_legacy_pm_support(pci_dev))
 		return 0;
 
-- 
2.43.0

