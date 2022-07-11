Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D3D570A9A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 21:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DA38E8ED;
	Mon, 11 Jul 2022 19:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B908E6C5;
 Mon, 11 Jul 2022 19:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JNV6gBlFKpE5Sku4/hH2lTFvl7x+/bQwXOO7dBTV2Qk=; b=naH+ihJXx5mGCV/kABr0P97Z7X
 AIntrUY+bEzSCb+uJroM7Vn4+hlJ8i17IJDr1jWLi5IhdUftMxg5x1zDbn5p1/5qbSvRdEgLhh9w1
 8SpaUz14ZDLI0FVwvqzuBbMLihlTkYMC2OW/vScKv/gEdEuu1zhy7zIFxd7sm69Ycfjbsm4K31SGl
 QeBCVfUK7IIgmNzz4eyDiIvpy31KHw+6ZjHWldL6zulLpvP8SKnv8gAfnUFSkfRVB1ZZVd+99GJac
 gtla2Mn9CnWE+AKARm8LeBlOuVTepMUEJwkkhv3lpB8FWV2CddVc1K546vZ/S/YJFfbJtYR6oJ7aq
 yDPBzbsA==;
Received: from [177.45.248.119] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oAyxJ-00CJom-W5; Mon, 11 Jul 2022 21:20:30 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amd/pm: Implement get GFXOFF status for vangogh
Date: Mon, 11 Jul 2022 16:19:53 -0300
Message-Id: <20220711191953.145518-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711191953.145518-1-andrealmeid@igalia.com>
References: <20220711191953.145518-1-andrealmeid@igalia.com>
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
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index e2d8ac90cf36..c6aca79376b8 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -2045,6 +2045,31 @@ static int vangogh_mode2_reset(struct smu_context *smu)
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
@@ -2199,6 +2224,7 @@ static const struct pptable_funcs vangogh_ppt_funcs = {
 	.post_init = vangogh_post_smu_init,
 	.mode2_reset = vangogh_mode2_reset,
 	.gfx_off_control = smu_v11_0_gfx_off_control,
+	.get_gfx_off_status = vangogh_get_gfxoff_status,
 	.get_ppt_limit = vangogh_get_ppt_limit,
 	.get_power_limit = vangogh_get_power_limit,
 	.set_power_limit = vangogh_set_power_limit,
-- 
2.37.0

