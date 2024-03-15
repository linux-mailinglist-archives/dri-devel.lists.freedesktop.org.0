Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06187CD10
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 13:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788710F13E;
	Fri, 15 Mar 2024 12:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA0910F13E;
 Fri, 15 Mar 2024 12:13:23 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 42FCDHcQ406627; Fri, 15 Mar 2024 17:43:17 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 42FCDGq3406620;
 Fri, 15 Mar 2024 17:43:16 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu: add the hw_ip version of all IP's
Date: Fri, 15 Mar 2024 17:43:15 +0530
Message-Id: <20240315121315.406601-1-sunil.khatri@amd.com>
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

Add all the IP's version information on a SOC to the
devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index a0dbccad2f53..3d4bfe0a5a7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -29,6 +29,43 @@
 #include "sienna_cichlid.h"
 #include "smu_v13_0_10.h"
 
+const char *hw_ip_names[MAX_HWIP] = {
+	[GC_HWIP]		= "GC",
+	[HDP_HWIP]		= "HDP",
+	[SDMA0_HWIP]		= "SDMA0",
+	[SDMA1_HWIP]		= "SDMA1",
+	[SDMA2_HWIP]		= "SDMA2",
+	[SDMA3_HWIP]		= "SDMA3",
+	[SDMA4_HWIP]		= "SDMA4",
+	[SDMA5_HWIP]		= "SDMA5",
+	[SDMA6_HWIP]		= "SDMA6",
+	[SDMA7_HWIP]		= "SDMA7",
+	[LSDMA_HWIP]		= "LSDMA",
+	[MMHUB_HWIP]		= "MMHUB",
+	[ATHUB_HWIP]		= "ATHUB",
+	[NBIO_HWIP]		= "NBIO",
+	[MP0_HWIP]		= "MP0",
+	[MP1_HWIP]		= "MP1",
+	[UVD_HWIP]		= "UVD/JPEG/VCN",
+	[VCN1_HWIP]		= "VCN1",
+	[VCE_HWIP]		= "VCE",
+	[VPE_HWIP]		= "VPE",
+	[DF_HWIP]		= "DF",
+	[DCE_HWIP]		= "DCE",
+	[OSSSYS_HWIP]		= "OSSSYS",
+	[SMUIO_HWIP]		= "SMUIO",
+	[PWR_HWIP]		= "PWR",
+	[NBIF_HWIP]		= "NBIF",
+	[THM_HWIP]		= "THM",
+	[CLK_HWIP]		= "CLK",
+	[UMC_HWIP]		= "UMC",
+	[RSMU_HWIP]		= "RSMU",
+	[XGMI_HWIP]		= "XGMI",
+	[DCI_HWIP]		= "DCI",
+	[PCIE_HWIP]		= "PCIE",
+};
+
+
 int amdgpu_reset_init(struct amdgpu_device *adev)
 {
 	int ret = 0;
@@ -196,6 +233,31 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 			   coredump->reset_task_info.process_name,
 			   coredump->reset_task_info.pid);
 
+	/* GPU IP's information of the SOC */
+	if (coredump->adev) {
+
+		drm_printf(&p, "\nIP Information\n");
+		drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
+		drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
+		drm_printf(&p, "SOC External Revision id: %d\n",
+			   coredump->adev->external_rev_id);
+
+		for (int i = 1; i < MAX_HWIP; i++) {
+			for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
+				int ver = coredump->adev->ip_versions[i][j];
+
+				if (ver)
+					drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
+						   hw_ip_names[i], i, j,
+						   IP_VERSION_MAJ(ver),
+						   IP_VERSION_MIN(ver),
+						   IP_VERSION_REV(ver),
+						   IP_VERSION_VARIANT(ver),
+						   IP_VERSION_SUBREV(ver));
+			}
+		}
+	}
+
 	if (coredump->ring) {
 		drm_printf(&p, "\nRing timed out details\n");
 		drm_printf(&p, "IP Type: %d Ring Name: %s\n",
-- 
2.34.1

