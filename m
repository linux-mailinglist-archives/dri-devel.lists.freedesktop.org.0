Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF056BCE5D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228C10E1C9;
	Thu, 16 Mar 2023 11:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB08610E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4688F61FBC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1422EC4339B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966604;
 bh=yKOfGLaQwNENaIDhKHuYkS4Z3LK3UG8gtYieveeD/mg=;
 h=From:To:Subject:Date:From;
 b=lR5sN83zWLugzs5Dw+kIQGy+ZpKLfmAIwVz6c/pktbNoQnOExAMVz6MEsetbJJzJJ
 qdAwVu//QdjzJu5otgXYJBo7RQZOwv0BqWUmUHfxvlOQS6U9ECnuNsLLAIZRTlRik1
 z1Wug2H0eKpZKwNa5YsHK/RN77KdCuJKt89MkJOxoOIxIgnWtwI/uxeyFmnRrMuDZi
 cmJ8TgQq4ri5xemZnMXCxG/DB0Gz06RwmU4dsktLrEYJyXv61g8u3eS5IIdUWuhHuT
 CHyRUj+BFCaGhtpI7KGQu2BrteyY6lacnsc6wbTqJhPFxIi/BH0vlj61yfyV9KQX6z
 YXNZn7qWWk8Ow==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] accel/habanalabs: align to latest firmware specs
Date: Thu, 16 Mar 2023 13:36:31 +0200
Message-Id: <20230316113640.499267-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
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

Copy the most up-to-date interface files to the firmware.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c      |  2 +-
 .../habanalabs/include/common/cpucp_if.h      | 51 ++++++++++++++++++-
 .../habanalabs/include/common/hl_boot_if.h    | 47 +++++------------
 .../include/gaudi2/gaudi2_async_events.h      |  4 +-
 .../habanalabs/include/gaudi2/gaudi2_fw_if.h  |  5 +-
 5 files changed, 69 insertions(+), 40 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 8943dc9872da..21cf7180fe9f 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -9784,7 +9784,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		break;
 
 	case GAUDI2_EVENT_CPU_FP32_NOT_SUPPORTED:
-	case GAUDI2_EVENT_DEV_RESET_REQ:
+	case GAUDI2_EVENT_CPU_DEV_RESET_REQ:
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		error_count = GAUDI2_NA_EVENT_CAUSE;
 		is_critical = true;
diff --git a/drivers/accel/habanalabs/include/common/cpucp_if.h b/drivers/accel/habanalabs/include/common/cpucp_if.h
index d713252a4f13..bb65b9e2b424 100644
--- a/drivers/accel/habanalabs/include/common/cpucp_if.h
+++ b/drivers/accel/habanalabs/include/common/cpucp_if.h
@@ -33,6 +33,10 @@
 #define PLL_MAP_MAX_BITS	128
 #define PLL_MAP_LEN		(PLL_MAP_MAX_BITS / 8)
 
+enum eq_event_id {
+	EQ_EVENT_NIC_STS_REQUEST = 0,
+};
+
 /*
  * info of the pkt queue pointers in the first async occurrence
  */
@@ -354,9 +358,48 @@ struct hl_eq_addr_dec_intr_data {
 	__u8 pad[7];
 };
 
+enum hl_mme_acc_err_type {
+	MME_ACC_WBC_ERR_RESP_LEGACY,
+	MME_ACC_WBC_ERR_RESP_SET0_CH0,
+	MME_ACC_WBC_ERR_RESP_SET0_CH1,
+	MME_ACC_WBC_ERR_RESP_SET1_CH0,
+	MME_ACC_WBC_ERR_RESP_SET1_CH1,
+	MME_ACC_WBC_BUSER_NUMERICAL_INF_ERR_SET0_CH0,
+	MME_ACC_WBC_BUSER_NUMERICAL_INF_ERR_SET0_CH1,
+	MME_ACC_WBC_BUSER_NUMERICAL_NINF_ERR_SET0_CH0,
+	MME_ACC_WBC_BUSER_NUMERICAL_NINF_ERR_SET0_CH1,
+	MME_ACC_WBC_BUSER_NUMERICAL_NAN_ERR_SET0_CH0,
+	MME_ACC_WBC_BUSER_NUMERICAL_NAN_ERR_SET0_CH1,
+	MME_ACC_WBC_BUSER_RR_DBG_ERR_SET0_CH0,
+	MME_ACC_WBC_BUSER_RR_DBG_ERR_SET0_CH1,
+	MME_ACC_WBC_BUSER_NUMERICAL_INF_ERR_SET1_CH0,
+	MME_ACC_WBC_BUSER_NUMERICAL_INF_ERR_SET1_CH1,
+	MME_ACC_WBC_BUSER_NUMERICAL_NINF_ERR_SET1_CH0,
+	MME_ACC_WBC_BUSER_NUMERICAL_NINF_ERR_SET1_CH1,
+	MME_ACC_WBC_BUSER_NUMERICAL_NAN_ERR_SET1_CH0,
+	MME_ACC_WBC_BUSER_NUMERICAL_NAN_ERR_SET1_CH1,
+	MME_ACC_WBC_BUSER_RR_DBG_ERR_SET1_CH0,
+	MME_ACC_WBC_BUSER_RR_DBG_ERR_SET1_CH1,
+	MME_ACC_AP_STS_SRC_DNRM,
+	MME_ACC_AP_STS_SRC_INF,
+	MME_ACC_AP_STS_SRC_NINF,
+	MME_ACC_AP_STS_SRC_NAN,
+	MME_ACC_AP_STS_RES_INF,
+	MME_ACC_AP_STS_RES_NINF,
+	MME_ACC_AP_STS_RES_NAN
+};
+
+struct hl_eq_mme_acc_data {
+	__u8 mme_id;
+	__u8 err_type; /* enum hl_mme_acc_err_type */
+	__le16 ctx_id;
+	__u8 pad[4];
+};
+
 struct hl_eq_entry {
 	struct hl_eq_header hdr;
 	union {
+		__le64 data_placeholder;
 		struct hl_eq_ecc_data ecc_data;
 		struct hl_eq_hbm_ecc_data hbm_ecc_data;	/* Gaudi1 HBM */
 		struct hl_eq_sm_sei_data sm_sei_data;
@@ -661,6 +704,9 @@ enum pq_init_status {
  * CPUCP_PACKET_ACTIVE_STATUS_SET -
  *       LKD sends FW indication whether device is free or in use, this indication is reported
  *       also to the BMC.
+ *
+ * CPUCP_PACKET_REGISTER_INTERRUPTS -
+ *       Packet to register interrupts indicating LKD is ready to receive events from FW.
  */
 
 enum cpucp_packet_id {
@@ -725,6 +771,8 @@ enum cpucp_packet_id {
 	CPUCP_PACKET_RESERVED9,			/* not used */
 	CPUCP_PACKET_RESERVED10,		/* not used */
 	CPUCP_PACKET_RESERVED11,		/* not used */
+	CPUCP_PACKET_RESERVED12,		/* internal */
+	CPUCP_PACKET_REGISTER_INTERRUPTS,	/* internal */
 	CPUCP_PACKET_ID_MAX			/* must be last */
 };
 
@@ -1127,6 +1175,7 @@ struct cpucp_security_info {
  *                     (0 = functional 1 = binned)
  * @interposer_version: Interposer version programmed in eFuse
  * @substrate_version: Substrate version programmed in eFuse
+ * @fw_hbm_region_size: Size in bytes of FW reserved region in HBM.
  * @fw_os_version: Firmware OS Version
  */
 struct cpucp_info {
@@ -1154,7 +1203,7 @@ struct cpucp_info {
 	__u8 substrate_version;
 	__u8 reserved2;
 	struct cpucp_security_info sec_info;
-	__le32 reserved3;
+	__le32 fw_hbm_region_size;
 	__u8 pll_map[PLL_MAP_LEN];
 	__le64 mme_binning_mask;
 	__u8 fw_os_version[VERSION_MAX_LEN];
diff --git a/drivers/accel/habanalabs/include/common/hl_boot_if.h b/drivers/accel/habanalabs/include/common/hl_boot_if.h
index 2256add057c5..c58d76a2705c 100644
--- a/drivers/accel/habanalabs/include/common/hl_boot_if.h
+++ b/drivers/accel/habanalabs/include/common/hl_boot_if.h
@@ -770,15 +770,23 @@ enum hl_components {
 	HL_COMPONENTS_ARMCP,
 	HL_COMPONENTS_CPLD,
 	HL_COMPONENTS_UBOOT,
+	HL_COMPONENTS_FUSE,
 	HL_COMPONENTS_MAX_NUM = 16
 };
 
+#define NAME_MAX_LEN	32 /* bytes */
+struct hl_module_data {
+	__u8 name[NAME_MAX_LEN];
+	__u8 version[VERSION_MAX_LEN];
+};
+
 /**
  * struct hl_component_versions - versions associated with hl component.
  * @struct_size: size of all the struct (including dynamic size of modules).
  * @modules_offset: offset of the modules field in this struct.
  * @component: version of the component itself.
  * @fw_os: Firmware OS Version.
+ * @comp_name: Name of the component.
  * @modules_mask: i'th bit (from LSB) is a flag - on if module i in enum
  *              hl_modules is used.
  * @modules_counter: number of set bits in modules_mask.
@@ -791,45 +799,14 @@ struct hl_component_versions {
 	__le16 modules_offset;
 	__u8 component[VERSION_MAX_LEN];
 	__u8 fw_os[VERSION_MAX_LEN];
+	__u8 comp_name[NAME_MAX_LEN];
 	__le16 modules_mask;
 	__u8 modules_counter;
 	__u8 reserved[1];
-	__u8 modules[][VERSION_MAX_LEN];
-};
-
-/**
- * struct hl_fw_versions - all versions (fuse, cpucp's components with their
- *              modules)
- * @struct_size: size of all the struct (including dynamic size of components).
- * @components_offset: offset of the components field in this struct.
- * @fuse: silicon production FUSE information.
- * @components_mask: i'th bit (from LSB) is a flag - on if component i in enum
- *              hl_components is used.
- * @components_counter: number of set bits in components_mask.
- * @reserved: reserved for future use.
- * @components: versions of hl components. Index i corresponds to the i'th bit
- *              that is *on* in components_mask. For example, if
- *              components_mask=0b101, then *components represents arcpid and
- *              *(hl_component_versions*)((char*)components + 1') represents
- *              preboot, where 1' = components[0].struct_size.
- */
-struct hl_fw_versions {
-	__le16 struct_size;
-	__le16 components_offset;
-	__u8 fuse[VERSION_MAX_LEN];
-	__le16 components_mask;
-	__u8 components_counter;
-	__u8 reserved[1];
-	struct hl_component_versions components[];
+	struct hl_module_data modules[];
 };
 
-/* Max size of struct hl_component_versions */
-#define HL_COMPONENT_VERSIONS_MAX_SIZE \
-	(sizeof(struct hl_component_versions) + HL_MODULES_MAX_NUM * \
-	 VERSION_MAX_LEN)
-
-/* Max size of struct hl_fw_versions */
-#define HL_FW_VERSIONS_MAX_SIZE (sizeof(struct hl_fw_versions) + \
-		HL_COMPONENTS_MAX_NUM * HL_COMPONENT_VERSIONS_MAX_SIZE)
+/* Max size of fit size */
+#define HL_FW_VERSIONS_FIT_SIZE	4096
 
 #endif /* HL_BOOT_IF_H */
diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
index 50852cc80373..f661068d0c5f 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_async_events.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright 2018-2021 HabanaLabs, Ltd.
+ * Copyright 2018-2022 HabanaLabs, Ltd.
  * All Rights Reserved.
  *
  */
@@ -958,7 +958,7 @@ enum gaudi2_async_event_id {
 	GAUDI2_EVENT_CPU11_STATUS_NIC11_ENG1 = 1318,
 	GAUDI2_EVENT_ARC_DCCM_FULL = 1319,
 	GAUDI2_EVENT_CPU_FP32_NOT_SUPPORTED = 1320,
-	GAUDI2_EVENT_DEV_RESET_REQ = 1321,
+	GAUDI2_EVENT_CPU_DEV_RESET_REQ = 1321,
 	GAUDI2_EVENT_SIZE,
 };
 
diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
index 82f3ca2a3966..8522f24deac0 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
@@ -63,7 +63,10 @@ struct gaudi2_cold_rst_data {
 			u32 fake_sig_validation_en : 1;
 			u32 bist_skip_enable : 1;
 			u32 bist_need_iatu_config : 1;
-			u32 reserved : 24;
+			u32 fake_bis_compliant : 1;
+			u32 wd_rst_cause_arm : 1;
+			u32 wd_rst_cause_arcpid : 1;
+			u32 reserved : 21;
 		};
 		__le32 data;
 	};
-- 
2.40.0

