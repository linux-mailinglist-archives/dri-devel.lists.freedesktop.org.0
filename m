Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F037AD1710
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 04:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F5010E235;
	Mon,  9 Jun 2025 02:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UZvKR70r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A9B10E21E;
 Mon,  9 Jun 2025 02:46:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 979DC4AC4D;
 Mon,  9 Jun 2025 02:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18763C4CEF5;
 Mon,  9 Jun 2025 02:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749437205;
 bh=kU6/5PrnoLPvsSRESMinNLoRD724Pj4qIwsER9avoT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UZvKR70rBdP3dlik5UAP5m+f8VYflYUmi6Tv6l+mEvoC6VJoRyzu72O2599XlVn6o
 lTbUVQVIXEEJ5cIkl8pyOEmdDI0u+JD3VgxZdsCcuspODUmLpVKUQeOYStOAqyfGXi
 8+hE9sFcPQSXmOwE2dZ7B+78khv437ikXt8MvsaU+SCwJv3ERtK89bUgI8FyUURrln
 9Z93cSsv/BfCw9XgQWzpUOo3PHl8nMgL9M6EjIAT/aUDdd0bjtam5aFsMD7tA7tN6y
 IrtbehRzta/vL2J+cYTVxEnBuZIm84+eMthlOe9pjxOuqjTjeqSwvMXcScVRtb8dbN
 QdaudT+cjQWow==
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
Subject: [PATCH v3 5/5] usb: sl811-hcd: Add PM_EVENT_POWEROFF into suspend
 callbacks
Date: Sun,  8 Jun 2025 21:46:19 -0500
Message-ID: <20250609024619.407257-6-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609024619.407257-1-superm1@kernel.org>
References: <20250609024619.407257-1-superm1@kernel.org>
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

When the ACPI core uses hibernation callbacks for shutdown drivers
will receive PM_EVENT_POWEROFF and should handle it the same as
PM_EVENT_HIBERNATE would have been used.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/usb/host/sl811-hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index ea3cab99c5d40..5d6dba681e503 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1748,6 +1748,7 @@ sl811h_suspend(struct platform_device *dev, pm_message_t state)
 		break;
 	case PM_EVENT_SUSPEND:
 	case PM_EVENT_HIBERNATE:
+	case PM_EVENT_POWEROFF:
 	case PM_EVENT_PRETHAW:		/* explicitly discard hw state */
 		port_power(sl811, 0);
 		break;
-- 
2.43.0

