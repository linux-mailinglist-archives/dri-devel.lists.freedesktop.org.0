Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0070494A
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E2A10E333;
	Tue, 16 May 2023 09:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762C910E330
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDD5C636E9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B040EC4339B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229440;
 bh=k+hWrusBTEtxxWNAQpYkerFhQJQvWi8au3CEeP2O+Ng=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aI9dCetfM5lrVHgKB3O1weQD0+Xlj4exE9t+JAi0LaKJwt5HQ++6z0gLbEJzwodU1
 L24x8i+43Uuxrjnqf1XfMpYNmDiuGbqKayKD2Hj/UgvgE9kvPT7W385ILzkAvcG6b/
 CQdvrTOQfCeuhl3rHE7lpcPqPWkMTDlG5E0AwjOgtULrn7tQBV5poz5cUl4Et7kchq
 VgzLZcnt9Dpr2DU+arvmFVKDh1qTnD/9pcOUm9rzA5kSlomp0C2KNCPOeYaE/CM4W4
 0T5AeNshrX6DVBMJ4FBozp8OmkBK8mrGXJ+uxdM8uo1OR3S5JwqB0Mwmq118+4lXQ5
 RSgnmUdVFe6Wg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] accel/habanalabs: align to latest firmware specs
Date: Tue, 16 May 2023 12:30:22 +0300
Message-Id: <20230516093030.1220526-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516093030.1220526-1-ogabbay@kernel.org>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
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

Update the firmware common interface files with the latest version.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/include/common/cpucp_if.h      | 18 ++++----
 .../habanalabs/include/common/hl_boot_if.h    | 41 ++++---------------
 2 files changed, 16 insertions(+), 43 deletions(-)

diff --git a/drivers/accel/habanalabs/include/common/cpucp_if.h b/drivers/accel/habanalabs/include/common/cpucp_if.h
index f68308cc2524..33807b839c37 100644
--- a/drivers/accel/habanalabs/include/common/cpucp_if.h
+++ b/drivers/accel/habanalabs/include/common/cpucp_if.h
@@ -359,7 +359,7 @@ struct hl_eq_entry {
 	union {
 		__le64 data_placeholder;
 		struct hl_eq_ecc_data ecc_data;
-		struct hl_eq_hbm_ecc_data hbm_ecc_data;	/* Gaudi1 HBM */
+		struct hl_eq_hbm_ecc_data hbm_ecc_data;	/* Obsolete */
 		struct hl_eq_sm_sei_data sm_sei_data;
 		struct cpucp_pkt_sync_err pkt_sync_err;
 		struct hl_eq_fw_alive fw_alive;
@@ -653,7 +653,7 @@ enum pq_init_status {
  *       which address is passed via the CpuCp packet. In addition, the host's driver
  *       passes the max size it allows the CpuCP to write to the structure, to prevent
  *       data corruption in case of mismatched driver/FW versions.
- *       Relevant only to Gaudi.
+ *       Obsolete.
  *
  * CPUCP_PACKET_GENERIC_PASSTHROUGH -
  *      Generic opcode for all firmware info that is only passed to host
@@ -868,19 +868,19 @@ struct cpucp_array_data_packet {
 enum cpucp_led_index {
 	CPUCP_LED0_INDEX = 0,
 	CPUCP_LED1_INDEX,
-	CPUCP_LED2_INDEX
+	CPUCP_LED2_INDEX,
+	CPUCP_LED_MAX_INDEX = CPUCP_LED2_INDEX
 };
 
 /*
  * enum cpucp_packet_rc - Error return code
  * @cpucp_packet_success	-> in case of success.
- * @cpucp_packet_invalid	-> this is to support Goya and Gaudi platform.
+ * @cpucp_packet_invalid	-> this is to support first generation platforms.
  * @cpucp_packet_fault		-> in case of processing error like failing to
  *                                 get device binding or semaphore etc.
- * @cpucp_packet_invalid_pkt	-> when cpucp packet is un-supported. This is
- *                                 supported Greco onwards.
+ * @cpucp_packet_invalid_pkt	-> when cpucp packet is un-supported.
  * @cpucp_packet_invalid_params	-> when checking parameter like length of buffer
- *				   or attribute value etc. Supported Greco onwards.
+ *				   or attribute value etc.
  * @cpucp_packet_rc_max		-> It indicates size of enum so should be at last.
  */
 enum cpucp_packet_rc {
@@ -1365,7 +1365,7 @@ struct cpucp_dev_info_signed {
 #define DCORE_MON_REGS_SZ	512
 /*
  * struct dcore_monitor_regs_data - DCORE monitor regs data.
- * the structure follows sync manager block layout. relevant only to Gaudi.
+ * the structure follows sync manager block layout. Obsolete.
  * @mon_pay_addrl: array of payload address low bits.
  * @mon_pay_addrh: array of payload address high bits.
  * @mon_pay_data: array of payload data.
@@ -1380,7 +1380,7 @@ struct dcore_monitor_regs_data {
 	__le32 mon_status[DCORE_MON_REGS_SZ];
 };
 
-/* contains SM data for each SYNC_MNGR (relevant only to Gaudi) */
+/* contains SM data for each SYNC_MNGR (Obsolete) */
 struct cpucp_monitor_dump {
 	struct dcore_monitor_regs_data sync_mngr_w_s;
 	struct dcore_monitor_regs_data sync_mngr_e_s;
diff --git a/drivers/accel/habanalabs/include/common/hl_boot_if.h b/drivers/accel/habanalabs/include/common/hl_boot_if.h
index c58d76a2705c..cff79f7f9f75 100644
--- a/drivers/accel/habanalabs/include/common/hl_boot_if.h
+++ b/drivers/accel/habanalabs/include/common/hl_boot_if.h
@@ -35,6 +35,7 @@ enum cpu_boot_err {
 	CPU_BOOT_ERR_TPM_FAIL = 20,
 	CPU_BOOT_ERR_TMP_THRESH_INIT_FAIL = 21,
 	CPU_BOOT_ERR_EEPROM_FAIL = 22,
+	CPU_BOOT_ERR_ENG_ARC_MEM_SCRUB_FAIL = 23,
 	CPU_BOOT_ERR_ENABLED = 31,
 	CPU_BOOT_ERR_SCND_EN = 63,
 	CPU_BOOT_ERR_LAST = 64 /* we have 2 registers of 32 bits */
@@ -51,6 +52,7 @@ enum cpu_boot_err {
 		 (1 << CPU_BOOT_ERR_DEVICE_UNUSABLE_FAIL) |	\
 		 (1 << CPU_BOOT_ERR_BINNING_FAIL) |		\
 		 (1 << CPU_BOOT_ERR_DRAM_SKIPPED) |		\
+		 (1 << CPU_BOOT_ERR_ENG_ARC_MEM_SCRUB_FAIL) |	\
 		 (1 << CPU_BOOT_ERR_EEPROM_FAIL))
 
 /*
@@ -132,6 +134,9 @@ enum cpu_boot_err {
  * CPU_BOOT_ERR_EEPROM_FAIL		Failed reading EEPROM data. Defaults
  *					are used.
  *
+ * CPU_BOOT_ERR_ENG_ARC_MEM_SCRUB_FAIL	Failed scrubbing the Engines/ARCFarm
+ *					memories. Boot disabled until reset.
+ *
  * CPU_BOOT_ERR0_ENABLED		Error registers enabled.
  *					This is a main indication that the
  *					running FW populates the error
@@ -157,6 +162,7 @@ enum cpu_boot_err {
 #define CPU_BOOT_ERR0_TPM_FAIL			(1 << CPU_BOOT_ERR_TPM_FAIL)
 #define CPU_BOOT_ERR0_TMP_THRESH_INIT_FAIL	(1 << CPU_BOOT_ERR_TMP_THRESH_INIT_FAIL)
 #define CPU_BOOT_ERR0_EEPROM_FAIL		(1 << CPU_BOOT_ERR_EEPROM_FAIL)
+#define CPU_BOOT_ERR0_ENG_ARC_MEM_SCRUB_FAIL	(1 << CPU_BOOT_ERR_ENG_ARC_MEM_SCRUB_FAIL)
 #define CPU_BOOT_ERR0_ENABLED			(1 << CPU_BOOT_ERR_ENABLED)
 #define CPU_BOOT_ERR1_ENABLED			(1 << CPU_BOOT_ERR_ENABLED)
 
@@ -744,36 +750,6 @@ struct comms_status {
 	};
 };
 
-/**
- * HL_MODULES_MAX_NUM is determined by the size of modules_mask in struct
- *      hl_component_versions
- */
-enum hl_modules {
-	HL_MODULES_BOOT_INFO = 0,
-	HL_MODULES_EEPROM,
-	HL_MODULES_FDT,
-	HL_MODULES_I2C,
-	HL_MODULES_LZ4,
-	HL_MODULES_MBEDTLS,
-	HL_MODULES_MAX_NUM = 16
-};
-
-/**
- * HL_COMPONENTS_MAX_NUM is determined by the size of components_mask in
- *      struct cpucp_versions
- */
-enum hl_components {
-	HL_COMPONENTS_PID = 0,
-	HL_COMPONENTS_MGMT,
-	HL_COMPONENTS_PREBOOT,
-	HL_COMPONENTS_PPBOOT,
-	HL_COMPONENTS_ARMCP,
-	HL_COMPONENTS_CPLD,
-	HL_COMPONENTS_UBOOT,
-	HL_COMPONENTS_FUSE,
-	HL_COMPONENTS_MAX_NUM = 16
-};
-
 #define NAME_MAX_LEN	32 /* bytes */
 struct hl_module_data {
 	__u8 name[NAME_MAX_LEN];
@@ -787,8 +763,6 @@ struct hl_module_data {
  * @component: version of the component itself.
  * @fw_os: Firmware OS Version.
  * @comp_name: Name of the component.
- * @modules_mask: i'th bit (from LSB) is a flag - on if module i in enum
- *              hl_modules is used.
  * @modules_counter: number of set bits in modules_mask.
  * @reserved: reserved for future use.
  * @modules: versions of the component's modules. Elborated explanation in
@@ -800,9 +774,8 @@ struct hl_component_versions {
 	__u8 component[VERSION_MAX_LEN];
 	__u8 fw_os[VERSION_MAX_LEN];
 	__u8 comp_name[NAME_MAX_LEN];
-	__le16 modules_mask;
 	__u8 modules_counter;
-	__u8 reserved[1];
+	__u8 reserved[3];
 	struct hl_module_data modules[];
 };
 
-- 
2.40.1

