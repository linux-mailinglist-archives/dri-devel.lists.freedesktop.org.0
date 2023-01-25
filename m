Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DAB67BB72
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C034410E84E;
	Wed, 25 Jan 2023 19:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168E010E391;
 Wed, 25 Jan 2023 19:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI7HxosHhWgULu099uYN20ezhHqTaeDcA6keZHoCG8BQo6yx/fJpcTQ6S1a+h+twYG5VEFNRnMoerzZxxL+msCnvuLQP06Tp7cPmdAwgoDlsplkNrwYJU1VS6/SgImLWhDDV68IzHdzeAlpzxdXV+7yfRZui6mKgCtI65o69cntHc5dpebZHPqVw6PBkNJv/fvo7kgwiXctSf9U7hl80NVhe8nreQFkyLeHeICqimXgJskwaBc3PUtl88nu0/T9RWF143Hf/RhT348tsiXCTHIwkYMlqe4HKes8DhkSQu0onWucs9HzNZFk/tsvDmVvvCu3MXcnPIXL0l1C5t5lUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAUw/tQg14gVsav2oa7Sab6Re7WZWKNQT4Jr5pgOfN4=;
 b=ha2krG7AjCX++fXX9wa0iYJ5cmYElV8XQAJz4Zb2jAuhwmCX5OXiPCQu5XXZwbhM27LnE4G7YgKk0wnuBuJJq5gd6B+AoI6i8UzbDWU/hXeQVhNio+cx/4v2J8e6PZen3qDfT2BTnL+OuuzNJ8Run6a1wBTp1UWKWyg5J71PzP47YSxPIt2enen5p1Qa7wipuYWI9ZHmP9UBZqWvozUme4w9NljeMZkcq59oC9n/tOBknkd9PNzvX0y99G2esBLpBUNg2eClC0D0OJhhYLoOSrOAIRwS07x3JAJIFMxnEHi0vWGp/QEJbrHmeJt5YzPBh2ko9CU5T0wE0tHhOG7OWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAUw/tQg14gVsav2oa7Sab6Re7WZWKNQT4Jr5pgOfN4=;
 b=qcOAd4e+NJTLYLhNoXht34uBjAqQr15bcxPnqqiWn3fyMguVI63BfWg+0FjKF09TQcE3IK2MDEQeb5FEUNtWF+Q46uXIeXWSHf5VHxyArwfKocYnUTcB2vuPlEcdtE12D4j5WFEE4sKFabY8pXH3XzlyyZ7/MjBeVMbei7QXxB4=
Received: from BN9PR03CA0694.namprd03.prod.outlook.com (2603:10b6:408:ef::9)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:22 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::ab) by BN9PR03CA0694.outlook.office365.com
 (2603:10b6:408:ef::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:21 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:18 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/32] drm/amdgpu: add configurable grace period for unmap
 queues
Date: Wed, 25 Jan 2023 14:53:40 -0500
Message-ID: <20230125195401.4183544-12-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: b269635b-1f62-4ce0-122a-08daff0df3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5N0ilnYaV7h7sDj9P67p9MhVgGuKCnkbxWX2vLxXPJugiWpr+MA2vVkujUnE++tbwfymddweYVv8HnuI6pCmaz9coeEEXBBvBp3DW16mYc6116uxhViKuqsTrsWqzzqjgCozaTdoiY7YRY0XsIoBE0OKFfm3A3KnxgpLmmrkHikAxTWIz94ghYyLORed+35VxBT4b6RLkyFUNJbEUZZquNu125MJMfFbQJaWLDgClmJSwdkovhuyWOGTYhvQL4JMTFL3XulXxCXb1ezAlpWiSkdoyDXdQXfG2LhFs7fO/qLm6yMSXhSoyB89I8lDdCPnSTf+pEr+1hrvOG47EoErJYU70MkNVzgpfocO99ThJX8QqQbRh04k1ynQ19ZGyPWNu9bUrsTH+4Gc9VCzGEPwmw+933NoQHKeAABab4UU4gNjgFqW9S3ELwob2se1fIeMMIqnVii4MwxkqolHLu5Hwvf7xIfv3IMmFHckVITE5SVXRk+QhTuxo02xykdvwsgNW0+UcM9KKY16oBfJ5khzfLpmN2NLOO20bSaSIamKbQUaYWx0l033pHuiW2ZiNMnhjbv7uVq9gDlsXg/ihe5dQ5+zvlctGT88LyhBWVz0uUo7x3aJN/HMUezWuunqLuMSuRygBHBWt1X0mlshtaojPA3Z0LuOTqP05APcq49UW+WYkZiW4zHWaovx4MO9c6kczCmX8Fem2Z7PbWR5SuyZrzP+WORXvNyN247l53FLcQc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(7696005)(186003)(82310400005)(86362001)(6666004)(26005)(478600001)(54906003)(66899018)(36860700001)(316002)(16526019)(40460700003)(110136005)(40480700001)(70206006)(450100002)(70586007)(8676002)(4326008)(81166007)(356005)(47076005)(426003)(41300700001)(2616005)(36756003)(336012)(8936002)(44832011)(1076003)(83380400001)(82740400003)(30864003)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:21.7411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b269635b-1f62-4ce0-122a-08daff0df3e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HWS schedule allows a grace period for wave completion prior to
preemption for better performance by avoiding CWSR on waves that can
potentially complete quickly. The debugger, on the other hand, will
want to inspect wave status immediately after it actively triggers
preemption (a suspend function to be provided).

To minimize latency between preemption and debugger wave inspection, allow
immediate preemption by setting the grace period to 0.

Note that setting the preepmtion grace period to 0 will result in an
infinite grace period being set due to a CP FW bug so set it to 1 for now.

v2: clarify purpose in the description of this patch

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  2 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 43 ++++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  6 ++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 43 ++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  9 ++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 61 ++++++++++++-----
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  2 +
 .../gpu/drm/amd/amdkfd/kfd_packet_manager.c   | 32 +++++++++
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 39 +++++++++++
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   | 65 +++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 ++
 13 files changed, 291 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index 89868f9927ae..a64a53f9efe6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -81,5 +81,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
 	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
+	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
+	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index d5bb86ccd617..ef8befc31fc6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -410,6 +410,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 				kgd_gfx_v9_set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_arcturus_enable_debug_trap,
 	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
+	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
+	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index c09b45de02d0..2491402afd58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -801,6 +801,47 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
 	return 0;
 }
 
+/* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
+ * The values read are:
+ *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
+ *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics Offloads.
+ *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
+ *     gws_wait_time            -- Wait Count for Global Wave Syncs.
+ *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
+ *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Message.
+ *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
+ *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
+ */
+void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev,
+					uint32_t *wait_times)
+
+{
+	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
+}
+
+void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
+						uint32_t wait_times,
+						uint32_t grace_period,
+						uint32_t *reg_offset,
+						uint32_t *reg_data)
+{
+	*reg_data = wait_times;
+
+	/*
+	 * The CP cannont handle a 0 grace period input and will result in
+	 * an infinite grace period being set so set to 1 to prevent this.
+	 */
+	if (grace_period == 0)
+		grace_period = 1;
+
+	*reg_data = REG_SET_FIELD(*reg_data,
+			CP_IQ_WAIT_TIME2,
+			SCH_WAVE,
+			grace_period);
+
+	*reg_offset = SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
+}
+
 static void program_trap_handler_settings(struct amdgpu_device *adev,
 		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
 {
@@ -845,5 +886,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
+	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
+	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 370d6c312981..0abc1e805180 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
@@ -26,3 +26,9 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
 uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
 					bool keep_trap_enabled,
 					uint32_t vmid);
+void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
+void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
+					       uint32_t wait_times,
+					       uint32_t grace_period,
+					       uint32_t *reg_offset,
+					       uint32_t *reg_data);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 73e3b9ae1fb0..c57f2a6b6e23 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -670,6 +670,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info = get_atc_vmid_pasid_mapping_info_v10_3,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base_v10_3,
 	.program_trap_handler_settings = program_trap_handler_settings_v10_3,
+	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
+	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 94a9fd9bd984..4a8bd266d3f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -737,6 +737,24 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 	return 0;
 }
 
+/* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
+ * The values read are:
+ *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
+ *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics Offloads.
+ *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
+ *     gws_wait_time            -- Wait Count for Global Wave Syncs.
+ *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
+ *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Message.
+ *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
+ *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
+ */
+void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev,
+					uint32_t *wait_times)
+
+{
+	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
+}
+
 void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t page_table_base)
 {
@@ -921,6 +939,29 @@ void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
 				adev->gfx.cu_info.max_waves_per_simd;
 }
 
+void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
+		uint32_t wait_times,
+		uint32_t grace_period,
+		uint32_t *reg_offset,
+		uint32_t *reg_data)
+{
+	*reg_data = wait_times;
+
+	/*
+	 * The CP cannont handle a 0 grace period input and will result in
+	 * an infinite grace period being set so set to 1 to prevent this.
+	 */
+	if (grace_period == 0)
+		grace_period = 1;
+
+	*reg_data = REG_SET_FIELD(*reg_data,
+			CP_IQ_WAIT_TIME2,
+			SCH_WAVE,
+			grace_period);
+
+	*reg_offset = SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
+}
+
 void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device *adev,
                         uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
 {
@@ -964,6 +1005,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
 	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
+	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
+	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index d39256162616..c0866497cb5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -20,8 +20,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-
-
 void kgd_gfx_v9_program_sh_mem_settings(struct amdgpu_device *adev, uint32_t vmid,
 		uint32_t sh_mem_config,
 		uint32_t sh_mem_ape1_base, uint32_t sh_mem_ape1_limit,
@@ -51,7 +49,6 @@ int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
 					uint32_t sq_cmd);
 bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
 					uint8_t vmid, uint16_t *p_pasid);
-
 void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
 			uint32_t vmid, uint64_t page_table_base);
 void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
@@ -67,3 +64,9 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
 uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 					bool keep_trap_enabled,
 					uint32_t vmid);
+void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
+void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
+					       uint32_t wait_times,
+					       uint32_t grace_period,
+					       uint32_t *reg_offset,
+					       uint32_t *reg_data);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index a2ac98d06e71..7556f80d41e4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -46,10 +46,13 @@ static int set_pasid_vmid_mapping(struct device_queue_manager *dqm,
 
 static int execute_queues_cpsch(struct device_queue_manager *dqm,
 				enum kfd_unmap_queues_filter filter,
-				uint32_t filter_param);
+				uint32_t filter_param,
+				uint32_t grace_period);
 static int unmap_queues_cpsch(struct device_queue_manager *dqm,
 				enum kfd_unmap_queues_filter filter,
-				uint32_t filter_param, bool reset);
+				uint32_t filter_param,
+				uint32_t grace_period,
+				bool reset);
 
 static int map_queues_cpsch(struct device_queue_manager *dqm);
 
@@ -839,7 +842,7 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 	if (dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) {
 		if (!dqm->dev->shared_resources.enable_mes)
 			retval = unmap_queues_cpsch(dqm,
-						    KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, false);
+						    KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD, false);
 		else if (prev_active)
 			retval = remove_queue_mes(dqm, q, &pdd->qpd);
 
@@ -1015,7 +1018,8 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 		retval = execute_queues_cpsch(dqm,
 					      qpd->is_debug ?
 					      KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES :
-					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
+					      USE_DEFAULT_GRACE_PERIOD);
 
 out:
 	dqm_unlock(dqm);
@@ -1155,7 +1159,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 	}
 	if (!dqm->dev->shared_resources.enable_mes)
 		retval = execute_queues_cpsch(dqm,
-					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
 	qpd->evicted = 0;
 	eviction_duration = get_jiffies_64() - pdd->last_evict_timestamp;
 	atomic64_add(eviction_duration, &pdd->evict_duration_counter);
@@ -1490,6 +1494,9 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
 
 	init_sdma_bitmaps(dqm);
 
+	if (dqm->dev->kfd2kgd->get_iq_wait_times)
+		dqm->dev->kfd2kgd->get_iq_wait_times(dqm->dev->adev,
+					&dqm->wait_times);
 	return 0;
 }
 
@@ -1529,7 +1536,7 @@ static int start_cpsch(struct device_queue_manager *dqm)
 	dqm->is_resetting = false;
 	dqm->sched_running = true;
 	if (!dqm->dev->shared_resources.enable_mes)
-		execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+		execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
 	dqm_unlock(dqm);
 
 	return 0;
@@ -1554,7 +1561,7 @@ static int stop_cpsch(struct device_queue_manager *dqm)
 
 	if (!dqm->is_hws_hang) {
 		if (!dqm->dev->shared_resources.enable_mes)
-			unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, false);
+			unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD, false);
 		else
 			remove_all_queues_mes(dqm);
 	}
@@ -1596,7 +1603,8 @@ static int create_kernel_queue_cpsch(struct device_queue_manager *dqm,
 	list_add(&kq->list, &qpd->priv_queue_list);
 	increment_queue_count(dqm, qpd, kq->queue);
 	qpd->is_debug = true;
-	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
+			USE_DEFAULT_GRACE_PERIOD);
 	dqm_unlock(dqm);
 
 	return 0;
@@ -1610,7 +1618,8 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 	list_del(&kq->list);
 	decrement_queue_count(dqm, qpd, kq->queue);
 	qpd->is_debug = false;
-	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
+	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
+			USE_DEFAULT_GRACE_PERIOD);
 	/*
 	 * Unconditionally decrement this counter, regardless of the queue's
 	 * type.
@@ -1687,7 +1696,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 
 		if (!dqm->dev->shared_resources.enable_mes)
 			retval = execute_queues_cpsch(dqm,
-					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
 		else
 			retval = add_queue_mes(dqm, q, qpd);
 		if (retval)
@@ -1776,7 +1785,9 @@ static int map_queues_cpsch(struct device_queue_manager *dqm)
 /* dqm->lock mutex has to be locked before calling this function */
 static int unmap_queues_cpsch(struct device_queue_manager *dqm,
 				enum kfd_unmap_queues_filter filter,
-				uint32_t filter_param, bool reset)
+				uint32_t filter_param,
+				uint32_t grace_period,
+				bool reset)
 {
 	int retval = 0;
 	struct mqd_manager *mqd_mgr;
@@ -1788,6 +1799,12 @@ static int unmap_queues_cpsch(struct device_queue_manager *dqm,
 	if (!dqm->active_runlist)
 		return retval;
 
+	if (grace_period != USE_DEFAULT_GRACE_PERIOD) {
+		retval = pm_update_grace_period(&dqm->packet_mgr, grace_period);
+		if (retval)
+			return retval;
+	}
+
 	retval = pm_send_unmap_queue(&dqm->packet_mgr, filter, filter_param, reset);
 	if (retval)
 		return retval;
@@ -1820,6 +1837,13 @@ static int unmap_queues_cpsch(struct device_queue_manager *dqm,
 		return -ETIME;
 	}
 
+	/* We need to reset the grace period value for this device */
+	if (grace_period != USE_DEFAULT_GRACE_PERIOD) {
+		if (pm_update_grace_period(&dqm->packet_mgr,
+					USE_DEFAULT_GRACE_PERIOD))
+			pr_err("Failed to reset grace period\n");
+	}
+
 	pm_release_ib(&dqm->packet_mgr);
 	dqm->active_runlist = false;
 
@@ -1835,7 +1859,7 @@ static int reset_queues_cpsch(struct device_queue_manager *dqm,
 	dqm_lock(dqm);
 
 	retval = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_BY_PASID,
-			pasid, true);
+			pasid, USE_DEFAULT_GRACE_PERIOD, true);
 
 	dqm_unlock(dqm);
 	return retval;
@@ -1844,13 +1868,14 @@ static int reset_queues_cpsch(struct device_queue_manager *dqm,
 /* dqm->lock mutex has to be locked before calling this function */
 static int execute_queues_cpsch(struct device_queue_manager *dqm,
 				enum kfd_unmap_queues_filter filter,
-				uint32_t filter_param)
+				uint32_t filter_param,
+				uint32_t grace_period)
 {
 	int retval;
 
 	if (dqm->is_hws_hang)
 		return -EIO;
-	retval = unmap_queues_cpsch(dqm, filter, filter_param, false);
+	retval = unmap_queues_cpsch(dqm, filter, filter_param, grace_period, false);
 	if (retval)
 		return retval;
 
@@ -1908,7 +1933,8 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 		if (!dqm->dev->shared_resources.enable_mes) {
 			decrement_queue_count(dqm, qpd, q);
 			retval = execute_queues_cpsch(dqm,
-						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
+						      USE_DEFAULT_GRACE_PERIOD);
 			if (retval == -ETIME)
 				qpd->reset_wavefronts = true;
 		} else {
@@ -2193,7 +2219,7 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
 	}
 
 	if (!dqm->dev->shared_resources.enable_mes)
-		retval = execute_queues_cpsch(dqm, filter, 0);
+		retval = execute_queues_cpsch(dqm, filter, 0, USE_DEFAULT_GRACE_PERIOD);
 
 	if ((!dqm->is_hws_hang) && (retval || qpd->reset_wavefronts)) {
 		pr_warn("Resetting wave fronts (cpsch) on dev %p\n", dqm->dev);
@@ -2537,7 +2563,8 @@ int dqm_debugfs_hang_hws(struct device_queue_manager *dqm)
 		return r;
 	}
 	dqm->active_runlist = true;
-	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
+	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES,
+				0, USE_DEFAULT_GRACE_PERIOD);
 	dqm_unlock(dqm);
 
 	return r;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index a537b9ef3e16..fb48b124161f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -37,6 +37,7 @@
 
 #define KFD_MES_PROCESS_QUANTUM		100000
 #define KFD_MES_GANG_QUANTUM		10000
+#define USE_DEFAULT_GRACE_PERIOD 0xffffffff
 
 struct device_process_node {
 	struct qcm_process_device *qpd;
@@ -256,6 +257,7 @@ struct device_queue_manager {
 	struct work_struct	hw_exception_work;
 	struct kfd_mem_obj	hiq_sdma_mqd;
 	bool			sched_running;
+	uint32_t		wait_times;
 };
 
 void device_queue_manager_init_cik(
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
index ed02b6d8bf63..c57f9a46dfcc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
@@ -369,6 +369,38 @@ int pm_send_query_status(struct packet_manager *pm, uint64_t fence_address,
 	return retval;
 }
 
+int pm_update_grace_period(struct packet_manager *pm, uint32_t grace_period)
+{
+	int retval = 0;
+	uint32_t *buffer, size;
+
+	size = pm->pmf->set_grace_period_size;
+
+	mutex_lock(&pm->lock);
+
+	if (size) {
+		kq_acquire_packet_buffer(pm->priv_queue,
+			size / sizeof(uint32_t),
+			(unsigned int **)&buffer);
+
+		if (!buffer) {
+			pr_err("Failed to allocate buffer on kernel queue\n");
+			retval = -ENOMEM;
+			goto out;
+		}
+
+		retval = pm->pmf->set_grace_period(pm, buffer, grace_period);
+		if (!retval)
+			kq_submit_packet(pm->priv_queue);
+		else
+			kq_rollback_packet(pm->priv_queue);
+	}
+
+out:
+	mutex_unlock(&pm->lock);
+	return retval;
+}
+
 int pm_send_unmap_queue(struct packet_manager *pm,
 			enum kfd_unmap_queues_filter filter,
 			uint32_t filter_param, bool reset)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 18250845a989..f0cdc8695b8c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -251,6 +251,41 @@ static int pm_map_queues_v9(struct packet_manager *pm, uint32_t *buffer,
 	return 0;
 }
 
+static int pm_set_grace_period_v9(struct packet_manager *pm,
+		uint32_t *buffer,
+		uint32_t grace_period)
+{
+	struct pm4_mec_write_data_mmio *packet;
+	uint32_t reg_offset = 0;
+	uint32_t reg_data = 0;
+
+	pm->dqm->dev->kfd2kgd->build_grace_period_packet_info(
+			pm->dqm->dev->adev,
+			pm->dqm->wait_times,
+			grace_period,
+			&reg_offset,
+			&reg_data);
+
+	if (grace_period == USE_DEFAULT_GRACE_PERIOD)
+		reg_data = pm->dqm->wait_times;
+
+	packet = (struct pm4_mec_write_data_mmio *)buffer;
+	memset(buffer, 0, sizeof(struct pm4_mec_write_data_mmio));
+
+	packet->header.u32All = pm_build_pm4_header(IT_WRITE_DATA,
+					sizeof(struct pm4_mec_write_data_mmio));
+
+	packet->bitfields2.dst_sel  = dst_sel___write_data__mem_mapped_register;
+	packet->bitfields2.addr_incr =
+			addr_incr___write_data__do_not_increment_address;
+
+	packet->bitfields3.dst_mmreg_addr = reg_offset;
+
+	packet->data = reg_data;
+
+	return 0;
+}
+
 static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
 			enum kfd_unmap_queues_filter filter,
 			uint32_t filter_param, bool reset)
@@ -333,6 +368,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs = {
 	.set_resources		= pm_set_resources_v9,
 	.map_queues		= pm_map_queues_v9,
 	.unmap_queues		= pm_unmap_queues_v9,
+	.set_grace_period       = pm_set_grace_period_v9,
 	.query_status		= pm_query_status_v9,
 	.release_mem		= NULL,
 	.map_process_size	= sizeof(struct pm4_mes_map_process),
@@ -340,6 +376,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs = {
 	.set_resources_size	= sizeof(struct pm4_mes_set_resources),
 	.map_queues_size	= sizeof(struct pm4_mes_map_queues),
 	.unmap_queues_size	= sizeof(struct pm4_mes_unmap_queues),
+	.set_grace_period_size  = sizeof(struct pm4_mec_write_data_mmio),
 	.query_status_size	= sizeof(struct pm4_mes_query_status),
 	.release_mem_size	= 0,
 };
@@ -350,6 +387,7 @@ const struct packet_manager_funcs kfd_aldebaran_pm_funcs = {
 	.set_resources		= pm_set_resources_v9,
 	.map_queues		= pm_map_queues_v9,
 	.unmap_queues		= pm_unmap_queues_v9,
+	.set_grace_period       = pm_set_grace_period_v9,
 	.query_status		= pm_query_status_v9,
 	.release_mem		= NULL,
 	.map_process_size	= sizeof(struct pm4_mes_map_process_aldebaran),
@@ -357,6 +395,7 @@ const struct packet_manager_funcs kfd_aldebaran_pm_funcs = {
 	.set_resources_size	= sizeof(struct pm4_mes_set_resources),
 	.map_queues_size	= sizeof(struct pm4_mes_map_queues),
 	.unmap_queues_size	= sizeof(struct pm4_mes_unmap_queues),
+	.set_grace_period_size  = sizeof(struct pm4_mec_write_data_mmio),
 	.query_status_size	= sizeof(struct pm4_mes_query_status),
 	.release_mem_size	= 0,
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
index a666710ed403..795001c947e1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
@@ -583,6 +583,71 @@ struct pm4_mec_release_mem {
 
 #endif
 
+#ifndef PM4_MEC_WRITE_DATA_DEFINED
+#define PM4_MEC_WRITE_DATA_DEFINED
+
+enum WRITE_DATA_dst_sel_enum {
+	dst_sel___write_data__mem_mapped_register = 0,
+	dst_sel___write_data__tc_l2 = 2,
+	dst_sel___write_data__gds = 3,
+	dst_sel___write_data__memory = 5,
+	dst_sel___write_data__memory_mapped_adc_persistent_state = 6,
+};
+
+enum WRITE_DATA_addr_incr_enum {
+	addr_incr___write_data__increment_address = 0,
+	addr_incr___write_data__do_not_increment_address = 1
+};
+
+enum WRITE_DATA_wr_confirm_enum {
+	wr_confirm___write_data__do_not_wait_for_write_confirmation = 0,
+	wr_confirm___write_data__wait_for_write_confirmation = 1
+};
+
+enum WRITE_DATA_cache_policy_enum {
+	cache_policy___write_data__lru = 0,
+	cache_policy___write_data__stream = 1
+};
+
+
+struct pm4_mec_write_data_mmio {
+	union {
+		union PM4_MES_TYPE_3_HEADER header;     /*header */
+		unsigned int ordinal1;
+	};
+
+	union {
+		struct {
+			unsigned int reserved1:8;
+			unsigned int dst_sel:4;
+			unsigned int reserved2:4;
+			unsigned int addr_incr:1;
+			unsigned int reserved3:2;
+			unsigned int resume_vf:1;
+			unsigned int wr_confirm:1;
+			unsigned int reserved4:4;
+			unsigned int cache_policy:2;
+			unsigned int reserved5:5;
+		} bitfields2;
+		unsigned int ordinal2;
+	};
+
+	union {
+		struct {
+			unsigned int dst_mmreg_addr:18;
+			unsigned int reserved6:14;
+		} bitfields3;
+		unsigned int ordinal3;
+	};
+
+	uint32_t reserved7;
+
+	uint32_t data;
+
+};
+
+#endif
+
 enum {
 	CACHE_FLUSH_AND_INV_TS_EVENT = 0x00000014
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 62b75ba28425..d557a7ae756c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1300,6 +1300,8 @@ struct packet_manager_funcs {
 	int (*unmap_queues)(struct packet_manager *pm, uint32_t *buffer,
 			enum kfd_unmap_queues_filter mode,
 			uint32_t filter_param, bool reset);
+	int (*set_grace_period)(struct packet_manager *pm, uint32_t *buffer,
+			uint32_t grace_period);
 	int (*query_status)(struct packet_manager *pm, uint32_t *buffer,
 			uint64_t fence_address,	uint64_t fence_value);
 	int (*release_mem)(uint64_t gpu_addr, uint32_t *buffer);
@@ -1310,6 +1312,7 @@ struct packet_manager_funcs {
 	int set_resources_size;
 	int map_queues_size;
 	int unmap_queues_size;
+	int set_grace_period_size;
 	int query_status_size;
 	int release_mem_size;
 };
@@ -1332,6 +1335,8 @@ int pm_send_unmap_queue(struct packet_manager *pm,
 
 void pm_release_ib(struct packet_manager *pm);
 
+int pm_update_grace_period(struct packet_manager *pm, uint32_t grace_period);
+
 /* Following PM funcs can be shared among VI and AI */
 unsigned int pm_build_pm4_header(unsigned int opcode, size_t packet_size);
 
-- 
2.25.1

