Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325CF876200
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 11:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8364810E8E6;
	Fri,  8 Mar 2024 10:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4193A10E8CC;
 Fri,  8 Mar 2024 10:31:37 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 428AVW3N4124820; Fri, 8 Mar 2024 16:01:32 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 428AVWrp4124815;
 Fri, 8 Mar 2024 16:01:32 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3] drm/amdgpu: add vm fault information to devcoredump
Date: Fri,  8 Mar 2024 16:01:30 +0530
Message-Id: <20240308103130.4124796-1-sunil.khatri@amd.com>
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

Add page fault information to the devcoredump.

Output of devcoredump:
**** AMDGPU Device Coredump ****
version: 1
kernel: 6.7.0-amd-staging-drm-next
module: amdgpu
time: 29.725011811
process_name: soft_recovery_p PID: 1720

Ring timed out details
IP Type: 0 Ring Name: gfx_0.0.0

[gfxhub] Page fault observed
Faulty page starting at address: 0x0000000000000000
Protection fault status register: 0x301031

VRAM is lost due to GPU reset!

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 147100c27c2d..6d059f853adc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -203,6 +203,18 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 			   coredump->ring->name);
 	}
 
+	if (coredump->adev) {
+		struct amdgpu_vm_fault_info *fault_info =
+			&coredump->adev->vm_manager.fault_info;
+
+		drm_printf(&p, "\n[%s] Page fault observed\n",
+			   fault_info->vmhub ? "mmhub" : "gfxhub");
+		drm_printf(&p, "Faulty page starting at address: 0x%016llx\n",
+			   fault_info->addr);
+		drm_printf(&p, "Protection fault status register: 0x%x\n\n",
+			   fault_info->status);
+	}
+
 	if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 	if (coredump->adev->reset_info.num_regs) {
-- 
2.34.1

