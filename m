Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267CD88C54A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 15:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42D810E4B0;
	Tue, 26 Mar 2024 14:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BAB10E4B0;
 Tue, 26 Mar 2024 14:38:05 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 42QEbt622292989; Tue, 26 Mar 2024 20:07:55 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 42QEbshY2292982;
 Tue, 26 Mar 2024 20:07:54 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu: add support of bios dump in devcoredump
Date: Tue, 26 Mar 2024 20:07:50 +0530
Message-Id: <20240326143750.2292945-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

dump the bios binary in the devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 44c5da8aa9ce..f33963d777eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -132,6 +132,26 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 	drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
 	drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
 
+	/* Dump BIOS */
+	if (coredump->adev->bios && coredump->adev->bios_size) {
+		int i = 0;
+
+		drm_printf(&p, "BIOS Binary dump\n");
+		drm_printf(&p, "Valid BIOS  Size:%d bytes type:%s\n",
+			   coredump->adev->bios_size,
+			   coredump->adev->is_atom_fw ?
+			   "Atom bios":"Non Atom Bios");
+
+		while (i < coredump->adev->bios_size) {
+			/* Printing 15 bytes in a line */
+			if (i % 15 == 0)
+				drm_printf(&p, "\n");
+			drm_printf(&p, "0x%x \t", coredump->adev->bios[i]);
+			i++;
+		}
+		drm_printf(&p, "\n");
+	}
+
 	/* Add ring buffer information */
 	drm_printf(&p, "Ring buffer information\n");
 	for (int i = 0; i < coredump->adev->num_rings; i++) {
-- 
2.34.1

