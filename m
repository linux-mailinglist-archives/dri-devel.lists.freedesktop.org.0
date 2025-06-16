Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE97ADB7FF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 19:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6D110E34E;
	Mon, 16 Jun 2025 17:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lz69+ILc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226110E346;
 Mon, 16 Jun 2025 17:50:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E045A5C64B0;
 Mon, 16 Jun 2025 17:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC6CC4CEEE;
 Mon, 16 Jun 2025 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750096237;
 bh=EYdTArwvin65wexM18vPdaMIRqB0lvbLE4DDyu8zn9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lz69+ILcUuW20dCmN1poltLdx3jHTjFuwNxjysxjh9HKN99J4nnLGkDxnl2O8sSWq
 GD/ai/Wx01l2Xu3m5hHjOnDtU1Ulgo2NWQaSdWNdC/UsRJg0gsRk3TPPLQMrZgs3bj
 xJlN2rDUmCe8YgjRmvg+Wplm58bA47FO1fWVGjToAIVCvsBCUk4xtxxbPuiBS8KoHD
 TVbt+RmJssWrj0TdRCD0ODjeY7OPEKJ96hErIZU4Yp9gkJyx2VHLG0v8mRYliXpjzy
 dECJR74IrtAV8DKICBdt6a10wV0HgL1kr/jWC76bQUdMNjpwBaHDUcSPsUMh/WIm6f
 RP9Jkjv7DdPYw==
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
 Denis Benato <benato.denis96@gmail.com>,
 =?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>
Subject: [PATCH v4 3/5] drm/amd: Avoid evicting resources at S5
Date: Mon, 16 Jun 2025 12:50:17 -0500
Message-ID: <20250616175019.3471583-4-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616175019.3471583-1-superm1@kernel.org>
References: <20250616175019.3471583-1-superm1@kernel.org>
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

Normally resources are evicted on dGPUs at suspend or hibernate and
on APUs at hibernate.  These steps are unnecessary when using the S4
callbacks to put the system into S5.

Cc: AceLan Kao <acelan.kao@canonical.com>
Cc: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Denis Benato <benato.denis96@gmail.com>
Cc: Merthan Karakaş <m3rthn.k@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3: https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@kernel.org/T/#me6db0fb946e3d604a8f3d455128844ed802c82bb
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8edd88328749b..c5d8f6d551238 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4966,6 +4966,10 @@ static int amdgpu_device_evict_resources(struct amdgpu_device *adev)
 	if (!adev->in_s4 && (adev->flags & AMD_IS_APU))
 		return 0;
 
+	/* No need to evict when going to S5 through S4 callbacks */
+	if (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF)
+		return 0;
+
 	ret = amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
 	if (ret)
 		DRM_WARN("evicting device resources failed\n");
-- 
2.43.0

