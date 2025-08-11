Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C609B21583
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 21:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FB010E2FC;
	Mon, 11 Aug 2025 19:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZAB9MgbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0A510E2F9;
 Mon, 11 Aug 2025 19:41:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D50315C61CB;
 Mon, 11 Aug 2025 19:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE53C4CEF8;
 Mon, 11 Aug 2025 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754941268;
 bh=viw9iEJbruaVRxAarn3h2rKViXu80X2SSEHAI5fBb3I=;
 h=From:To:Cc:Subject:Date:From;
 b=ZAB9MgbQl5azLDLqPZGXaRHb5QIXky3OWVFKLqnaVaBcyHH02XATaTwWiD/JRiFPv
 HY/TDgVR3pOlZG+NWoZsd9BAlmMtwWANONIoQLLi8jcP9gb0KKHdD1i6IMDX+VeTZg
 cNpD8z/MYYjqYKQwrTrtInt0pZMdBCBgb07zU2vreyJlu0DvWLU86lvkqEtdTfgqO+
 0BfyhNCyRKAqkfo7poiCwzBrid9WtVZ35SDsRs6CYfl7dA0ThWL//YagUm8vJHz9sN
 vTa5xbUL2TZYQb12/nmtH2MI7hONMU0KyMWwvEtfOxQQ4m5Txl1cpC+wIZKz+Wew/9
 w5T9jk8b8LUNw==
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
Subject: [PATCH v5 00/11] Improvements to S5 power consumption
Date: Mon, 11 Aug 2025 14:40:51 -0500
Message-ID: <20250811194102.864225-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

A variety of issues both in function and in power consumption have been
raised as a result of devices not being put into a low power state when
the system is powered off.

There have been some localized changes[1] to PCI core to help these issues,
but they have had various downsides.

This series instead tries to use the S4 flow when the system is being
powered off.  This lines up the behavior with what other operating systems
do as well.  If for some reason that fails or is not supported, run their
shutdown() callbacks.

Cc: AceLan Kao <acelan.kao@canonical.com>
Cc: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Merthan Karakaş <m3rthn.k@gmail.com>
Cc: Eric Naim <dnaim@cachyos.org>
---
v4->v5:
 * Rebase on v6.17-rc1
 * Re-order series to be more bisectable for issues
 * Add tags where relevant
 * Split up PCI patches into more easily reviewable "chunks".

Mario Limonciello (AMD) (11):
  PM: Introduce new PMSG_POWEROFF event
  scsi: Add PM_EVENT_POWEROFF into suspend callbacks
  usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend callbacks
  USB: Pass PMSG_POWEROFF event to suspend_common() for poweroff with S4
    flow
  PCI: PM: Disable device wakeups when halting system through S4 flow
  PCI: PM: Split out code from pci_pm_suspend_noirq() into helper
  PCI: PM: Run bridge power up actions as part of restore phase
  PCI: PM: Use pci_power_manageable() in pci_pm_poweroff_noirq()
  PCI: Put PCIe ports with downstream devices into D3 at hibernate
  drm/amd: Avoid evicting resources at S5
  PM: Use hibernate flows for system power off

 drivers/base/power/main.c                  |  7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +
 drivers/pci/pci-driver.c                   | 99 +++++++++++++++-------
 drivers/scsi/mesh.c                        |  1 +
 drivers/scsi/stex.c                        |  1 +
 drivers/usb/core/hcd-pci.c                 | 10 ++-
 drivers/usb/host/sl811-hcd.c               |  1 +
 include/linux/pm.h                         |  5 +-
 include/trace/events/power.h               |  3 +-
 kernel/reboot.c                            |  6 ++
 10 files changed, 102 insertions(+), 35 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.43.0

