Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E658F4DF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 01:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E0494FEC;
	Wed, 10 Aug 2022 23:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF1494FD2;
 Wed, 10 Aug 2022 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+33GfJ5uYaCIBPv0pByo5XIS/m0wlUqh+SvLy3XAm6E=; b=At07KXQAjbH2qq7NAW1khPT7kj
 gwrgPzptSNa7FIE0yyxcEjFA6zF0gENxjXEB7ty34+/X6KNJpgCejbLNMGAWCis5K7/G2eSduaYfk
 XY+gkrZBq/aAFAK64r0UIZyDPSLGr6/EIsjbyfwDRKT9Y4rw21SC1MZQk3vYM0IYoX2VWAc5cX9uL
 ZMOKLe0BAFGqM67HGWEOeYpY+M+XPsBrio9hioPjIBoUIgRRz+6v6L8yxQBxWwKKK56777IZGeWRh
 ZcM0QVZ6R3REEJAZlaInA5Q13oXZROihxdlBJdK3f5YUsIdO1igcF2TBhjbRmkYnAD3upm3EMMFif
 kmZ3GuiA==;
Received: from [191.17.41.12] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oLv8p-004r9g-Sk; Thu, 11 Aug 2022 01:29:36 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tom St Denis <tom.stdenis@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v3 2/4] drm/amd/pm: Implement GFXOFF's entry count and
 residency for vangogh
Date: Wed, 10 Aug 2022 20:28:56 -0300
Message-Id: <20220810232858.11844-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810232858.11844-1-andrealmeid@igalia.com>
References: <20220810232858.11844-1-andrealmeid@igalia.com>
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

Implement functions to get and set GFXOFF's entry count and residency
for vangogh.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 .../pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h    |  5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |  5 +-
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 76 +++++++++++++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h
index fe130a497d6c..7471e2df2828 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h
@@ -108,7 +108,10 @@
 #define PPSMC_MSG_SetSlowPPTLimit                      0x4A
 #define PPSMC_MSG_GetFastPPTLimit                      0x4B
 #define PPSMC_MSG_GetSlowPPTLimit                      0x4C
-#define PPSMC_Message_Count                            0x4D
+#define PPSMC_MSG_GetGfxOffStatus		       0x50
+#define PPSMC_MSG_GetGfxOffEntryCount		       0x51
+#define PPSMC_MSG_LogGfxOffResidency		       0x52
+#define PPSMC_Message_Count                            0x53
 
 //Argument for PPSMC_MSG_GfxDeviceDriverReset
 enum {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index 19084a4fcb2b..76fb6cbbc09c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@ -235,7 +235,10 @@
 	__SMU_DUMMY_MAP(UnforceGfxVid),           \
 	__SMU_DUMMY_MAP(HeavySBR),			\
 	__SMU_DUMMY_MAP(SetBadHBMPagesRetiredFlagsPerChannel), \
-	__SMU_DUMMY_MAP(EnableGfxImu),
+	__SMU_DUMMY_MAP(EnableGfxImu),			\
+	__SMU_DUMMY_MAP(GetGfxOffStatus),		 \
+	__SMU_DUMMY_MAP(GetGfxOffEntryCount),		 \
+	__SMU_DUMMY_MAP(LogGfxOffResidency),
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(type)	SMU_MSG_##type
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 89504ff8e9ed..847990145dcd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -138,6 +138,9 @@ static struct cmn2asic_msg_mapping vangogh_message_map[SMU_MSG_MAX_COUNT] = {
 	MSG_MAP(SetSlowPPTLimit,                    PPSMC_MSG_SetSlowPPTLimit,						0),
 	MSG_MAP(GetFastPPTLimit,                    PPSMC_MSG_GetFastPPTLimit,						0),
 	MSG_MAP(GetSlowPPTLimit,                    PPSMC_MSG_GetSlowPPTLimit,						0),
+	MSG_MAP(GetGfxOffStatus,		    PPSMC_MSG_GetGfxOffStatus,						0),
+	MSG_MAP(GetGfxOffEntryCount,		    PPSMC_MSG_GetGfxOffEntryCount,					0),
+	MSG_MAP(LogGfxOffResidency,		    PPSMC_MSG_LogGfxOffResidency,					0),
 };
 
 static struct cmn2asic_mapping vangogh_feature_mask_map[SMU_FEATURE_COUNT] = {
@@ -2200,6 +2203,76 @@ static int vangogh_set_power_limit(struct smu_context *smu,
 	return ret;
 }
 
+/**
+ * vangogh_set_gfxoff_residency
+ *
+ * @smu: amdgpu_device pointer
+ * @start: start/stop residency log
+ *
+ * This function will be used to log gfxoff residency
+ *
+ *
+ * Returns standard response codes.
+ */
+static u32 vangogh_set_gfxoff_residency(struct smu_context *smu, bool start)
+{
+	int ret = 0;
+	u32 residency;
+	struct amdgpu_device *adev = smu->adev;
+
+	if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
+		return 0;
+
+	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_LogGfxOffResidency,
+					      start, &residency);
+
+	if (!start)
+		adev->gfx.gfx_off_residency = residency;
+
+	return ret;
+}
+
+/**
+ * vangogh_get_gfxoff_residency
+ *
+ * @smu: amdgpu_device pointer
+ *
+ * This function will be used to get gfxoff residency.
+ *
+ * Returns standard response codes.
+ */
+static u32 vangogh_get_gfxoff_residency(struct smu_context *smu, uint32_t *residency)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	*residency = adev->gfx.gfx_off_residency;
+
+	return 0;
+}
+
+/**
+ * vangogh_get_gfxoff_entrycount - get gfxoff entry count
+ *
+ * @smu: amdgpu_device pointer
+ *
+ * This function will be used to get gfxoff entry count
+ *
+ * Returns standard response codes.
+ */
+static u32 vangogh_get_gfxoff_entrycount(struct smu_context *smu, uint64_t *entrycount)
+{
+	int ret = 0, value = 0;
+	struct amdgpu_device *adev = smu->adev;
+
+	if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
+		return 0;
+
+	ret = smu_cmn_send_smc_msg(smu, SMU_MSG_GetGfxOffEntryCount, &value);
+	*entrycount = value + adev->gfx.gfx_off_entrycount;
+
+	return ret;
+}
+
 static const struct pptable_funcs vangogh_ppt_funcs = {
 
 	.check_fw_status = smu_v11_0_check_fw_status,
@@ -2237,6 +2310,9 @@ static const struct pptable_funcs vangogh_ppt_funcs = {
 	.mode2_reset = vangogh_mode2_reset,
 	.gfx_off_control = smu_v11_0_gfx_off_control,
 	.get_gfx_off_status = vangogh_get_gfxoff_status,
+	.get_gfx_off_entrycount = vangogh_get_gfxoff_entrycount,
+	.get_gfx_off_residency = vangogh_get_gfxoff_residency,
+	.set_gfx_off_residency = vangogh_set_gfxoff_residency,
 	.get_ppt_limit = vangogh_get_ppt_limit,
 	.get_power_limit = vangogh_get_power_limit,
 	.set_power_limit = vangogh_set_power_limit,
-- 
2.37.1

