Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ECAB29679
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 04:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96E10E333;
	Mon, 18 Aug 2025 02:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PJlq2ayQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071D710E32B;
 Mon, 18 Aug 2025 02:01:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B58D5C57BF;
 Mon, 18 Aug 2025 02:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8EDC4CEEB;
 Mon, 18 Aug 2025 02:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755482476;
 bh=nP9n5VGF2FskJeZ1oNEb2BbawXh/NPFp8tsiOD47chk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PJlq2ayQKJAgj5A4Paj5fnHMw9r7Il4FJ0cVzz/w+gIthXJqpCHX5lUMkJd94O5s4
 ckzEaD99szLB8JVS8928eYI3FYznyaAcnSzIz8fM0zZmmnuX6aslIyV8SWb5lhF7D/
 p9uZGDIzCLUK/BcLqSuUXTS6ZbLYlKn9AWIk5ps/oJwhOSfMezUEkpUuDpRaGboE0J
 4WhKkaIOfLWyGBNltxCTyMFG/CDgsjIfgyUoc04dMKa5TwnAfnMCa9VNXPdsVMF/cc
 6rSKWantk8A3e0l4OX8Z+sHNKvX489QgL/HSbr8/8sWFcE7pfSipyK3gMra3mt5MQi
 GdRAIMQGIay/A==
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
Subject: [PATCH v6 02/11] scsi: Add PM_EVENT_POWEROFF into suspend callbacks
Date: Sun, 17 Aug 2025 21:00:52 -0500
Message-ID: <20250818020101.3619237-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818020101.3619237-1-superm1@kernel.org>
References: <20250818020101.3619237-1-superm1@kernel.org>
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

When the ACPI core uses hibernation callbacks for shutdown drivers
will receive PM_EVENT_POWEROFF and should handle it the same as
PM_EVENT_HIBERNATE would have been used.

Tested-by: Eric Naim <dnaim@cachyos.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v5:
 * Re-order
v4:
 * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
---
 drivers/scsi/mesh.c | 1 +
 drivers/scsi/stex.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/scsi/mesh.c b/drivers/scsi/mesh.c
index 1c15cac41d805..768b85eecc8fd 100644
--- a/drivers/scsi/mesh.c
+++ b/drivers/scsi/mesh.c
@@ -1762,6 +1762,7 @@ static int mesh_suspend(struct macio_dev *mdev, pm_message_t mesg)
 	case PM_EVENT_SUSPEND:
 	case PM_EVENT_HIBERNATE:
 	case PM_EVENT_FREEZE:
+	case PM_EVENT_POWEROFF:
 		break;
 	default:
 		return 0;
diff --git a/drivers/scsi/stex.c b/drivers/scsi/stex.c
index 63ed7f9aaa937..ee9372e1f7f07 100644
--- a/drivers/scsi/stex.c
+++ b/drivers/scsi/stex.c
@@ -1965,6 +1965,7 @@ static int stex_choice_sleep_mic(struct st_hba *hba, pm_message_t state)
 	case PM_EVENT_SUSPEND:
 		return ST_S3;
 	case PM_EVENT_HIBERNATE:
+	case PM_EVENT_POWEROFF:
 		hba->msi_lock = 0;
 		return ST_S4;
 	default:
-- 
2.43.0

