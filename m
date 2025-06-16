Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC1ADB7F6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 19:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DC010E390;
	Mon, 16 Jun 2025 17:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LtsrH6pR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9382110E089;
 Mon, 16 Jun 2025 17:50:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B99CC6154C;
 Mon, 16 Jun 2025 17:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047BAC4CEEA;
 Mon, 16 Jun 2025 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750096230;
 bh=o+5l+xciKuEuWPJqTjlSbYb3XN4X9RZAkcnaf/XM8Sc=;
 h=From:To:Cc:Subject:Date:From;
 b=LtsrH6pRnwpBx3mTKhdDLzNWFVK6FHY9n5KrT/J4L7oNSgAQP0vYlac0DBOm+oddS
 puztJhtv+bYpRSJtyAnzDCtVykjqLiWC5OIVn4iIg+bQ9a4BjVTU2226Axo9vTp4hu
 Th52v5pkg4T3iTPDjC/BYj2UKQAeN4v2CPaiFhZ4LoW1bDa0Gi4DM2VWYMsCYsPgjD
 YJKVutzkKdCratlVrUJAJSafIVNadv8D1Jg21nGLZ4tW/BtOlxWkMP9bo2Js/Cc58A
 PDzqTuNDkkKB6nxMXyjS+/O1YwaSUXQ3s6LD7ltBLysTe/TEnJFJMyvRVbDeZjqE3H
 7TuV/KMKvHLJA==
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
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 0/5] Improvements to S5 power consumption
Date: Mon, 16 Jun 2025 12:50:14 -0500
Message-ID: <20250616175019.3471583-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

A variety of issues both in function and in power consumption have been
raised as a result of devices not being put into a low power state when
the system is powered off.

There have been some localized changes[1] to PCI core to help these issues,
but they have had various downsides.

This series instead tries to use the S4 flow when the system is being
powered off.  This lines up the behavior with what other operating systems
do as well.  If for some reason that fails or is not supported, unwind and
do the previous S5 flow that will wake all devices and run their shutdown()
callbacks.

v3->v4:
 * Fix LKP robot failure
 * Rebase on v6.16-rc2

Previous submissions [1]:
Link: https://lore.kernel.org/linux-pm/CAJZ5v0hrKEJa8Ad7iiAvQ3d_0ysVhzZcXSYc5kkL=6vtseF+bg@mail.gmail.com/T/#m91e4eae868a7405ae579e89b135085f4906225d2
Link: https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@kernel.org/
Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limonciello@amd.com/ (v1)
Link: https://lore.kernel.org/linux-pm/20250514193406.3998101-1-superm1@kernel.org/ (v2)
Link: https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@kernel.org/ (v3)

Mario Limonciello (5):
  PM: Use hibernate flows for system power off
  PCI: Put PCIe ports with downstream devices into D3 at hibernate
  drm/amd: Avoid evicting resources at S5
  scsi: Add PM_EVENT_POWEROFF into suspend callbacks
  usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend callbacks

 drivers/base/power/main.c                  |  7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +
 drivers/pci/pci-driver.c                   | 94 ++++++++++++++--------
 drivers/scsi/mesh.c                        |  1 +
 drivers/scsi/stex.c                        |  1 +
 drivers/usb/host/sl811-hcd.c               |  1 +
 include/linux/pm.h                         |  3 +
 include/trace/events/power.h               |  3 +-
 kernel/reboot.c                            |  6 ++
 9 files changed, 86 insertions(+), 34 deletions(-)

-- 
2.43.0

