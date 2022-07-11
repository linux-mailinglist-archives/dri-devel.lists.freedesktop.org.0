Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF6570ACE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 21:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAA190C8B;
	Mon, 11 Jul 2022 19:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F141C90C8A;
 Mon, 11 Jul 2022 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z8NGkmDzUDegggn5+Y+uNCbKnEYMgN78CgR6w9hA/pU=; b=UgTwHes/dGGdf3jR2hd8U8mDZW
 K4jw+GZFxdigzeyLsyBJ0EYRPOSoM1aGLdMJgeIb3fyzrqzCLM/62XhSgGq9LbhSc7rniqYGUk3bU
 yhqtT3Q2mof+dTgOhynApE0DlzY6D+pzycrTrpE2o3RaMXYxF3BQNJkSOS7nspYPk6p3Y2ZERayz0
 EFQifYY9275JapsAo8UsYKhTs2Hr/+W8V/1S61wAKOBMnDYbn5W9cbDUim++NGHvsJBimBIYhJZNm
 KHVL8meXGl4PBaKj+wRmvrQy+TtST5vDGss5XFVMwQzSx4EpGLgiuCggWj4pydWOZODZI0QrqEQzx
 VdMYwfdA==;
Received: from [177.45.248.119] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oAzBn-00CKlY-Vq; Mon, 11 Jul 2022 21:35:28 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] drm/amd/pm: Implement get GFXOFF status for vangogh
Date: Mon, 11 Jul 2022 16:34:58 -0300
Message-Id: <20220711193458.158462-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement function to get current GFXOFF status for vangogh.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
Changes from v1:
- Squash commits in a single one

 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index e2d8ac90cf36..89504ff8e9ed 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -46,6 +46,18 @@
 #undef pr_info
 #undef pr_debug
 
+// Registers related to GFXOFF
+// addressBlock: smuio_smuio_SmuSmuioDec
+// base address: 0x5a000
+#define mmSMUIO_GFX_MISC_CNTL			0x00c5
+#define mmSMUIO_GFX_MISC_CNTL_BASE_IDX		0
+
+//SMUIO_GFX_MISC_CNTL
+#define SMUIO_GFX_MISC_CNTL__SMU_GFX_cold_vs_gfxoff__SHIFT	0x0
+#define SMUIO_GFX_MISC_CNTL__PWR_GFXOFF_STATUS__SHIFT		0x1
+#define SMUIO_GFX_MISC_CNTL__SMU_GFX_cold_vs_gfxoff_MASK	0x00000001L
+#define SMUIO_GFX_MISC_CNTL__PWR_GFXOFF_STATUS_MASK		0x00000006L
+
 #define FEATURE_MASK(feature) (1ULL << feature)
 #define SMC_DPM_FEATURE ( \
 	FEATURE_MASK(FEATURE_CCLK_DPM_BIT) | \
@@ -2045,6 +2057,31 @@ static int vangogh_mode2_reset(struct smu_context *smu)
 	return vangogh_mode_reset(smu, SMU_RESET_MODE_2);
 }
 
+/**
+ * vangogh_get_gfxoff_status - Get gfxoff status
+ *
+ * @smu: amdgpu_device pointer
+ *
+ * Get current gfxoff status
+ *
+ * Return:
+ * * 0	- GFXOFF (default if enabled).
+ * * 1	- Transition out of GFX State.
+ * * 2	- Not in GFXOFF.
+ * * 3	- Transition into GFXOFF.
+ */
+static u32 vangogh_get_gfxoff_status(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	u32 reg, gfxoff_status;
+
+	reg = RREG32_SOC15(SMUIO, 0, mmSMUIO_GFX_MISC_CNTL);
+	gfxoff_status = (reg & SMUIO_GFX_MISC_CNTL__PWR_GFXOFF_STATUS_MASK)
+		>> SMUIO_GFX_MISC_CNTL__PWR_GFXOFF_STATUS__SHIFT;
+
+	return gfxoff_status;
+}
+
 static int vangogh_get_power_limit(struct smu_context *smu,
 				   uint32_t *current_power_limit,
 				   uint32_t *default_power_limit,
@@ -2199,6 +2236,7 @@ static const struct pptable_funcs vangogh_ppt_funcs = {
 	.post_init = vangogh_post_smu_init,
 	.mode2_reset = vangogh_mode2_reset,
 	.gfx_off_control = smu_v11_0_gfx_off_control,
+	.get_gfx_off_status = vangogh_get_gfxoff_status,
 	.get_ppt_limit = vangogh_get_ppt_limit,
 	.get_power_limit = vangogh_get_power_limit,
 	.set_power_limit = vangogh_set_power_limit,
-- 
2.37.0

