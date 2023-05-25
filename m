Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C31A71125B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE9B10E71D;
	Thu, 25 May 2023 17:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B957410E6E6;
 Thu, 25 May 2023 17:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBbRXU9HyCYcjA6zyqD/+dnLQSoWtdmaQqbRWW1oLM6VN+nqpWTWnX56Orol0cOkhxiavcBtBj6acpKXi6gEoC3D4vSnGHJfYRefOdh4m3zWI2A4Fv8OgUKVRn9Y92tHnXFMWF5r+n5xLH3j+rWpM/jfa1U+fPhKfFeQ92ivbwkRmMtitA69gXWcibRSrmJk56IwrwhfU9aPmlIaISQiYc1GHHAabninaF/Z3IfcWzC2imu4naarBEFSonRW/Y/LjCL258unTQIWaMZUyUFritHqSRgXNYp3AbmQTtJ7pvh4JJJsvxVR9ULnHhLvz/maCiEWx1vBuLchyCklYXzzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJwTDSikZ5ePCRYoadoOSDF27cJTuLnMbgP5tZ6v4Yk=;
 b=eGV3rHvBCZ3Uoe1lVxgyZsEvq5d534s8QFtL7j9cO8rdDvF/+a9pC3BzuSCc1q8iJ1GztivvcGSCIa7kcXJPZ4hykLYn44y+63E3eIt1kJLRHIc4/2Wg1PD01ac6jaVa8T8wE37FtJ7InOG4XSPHYCeSszJuAGn22pVBccXWYF/23JevWAY/kECQOLZhgan1X1X1TM/qeFWXKcm7yCGZdR1aBcWP/u52YNQv30hjYVodArgaVDA4nm/HEr7VkFbVakKhMGA/Bwb5WBJ8Qdge/fV8Q3PM9XrSb701wRmiZWKQZzZrTakHAtc6dMYvetHM4hZ/IGGifLlnkz9214+o6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJwTDSikZ5ePCRYoadoOSDF27cJTuLnMbgP5tZ6v4Yk=;
 b=xkdaLspgTJ7mlH7c9vXiAnByiwIJHfJzqdHG5VhukHVWgrkk5QH83AGtNfU1vtO4a9FB3mpUthOhQ9v5BWOhZ2JTtmDk1Kwgppsb345V7B+MaQRASQds+ORhmq9nOQLdbLtbNzPtA3gVYhp4FkveOyQ1cOyb4f6nBLSCItl1CbI=
Received: from MW4PR03CA0141.namprd03.prod.outlook.com (2603:10b6:303:8c::26)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:07 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::aa) by MW4PR03CA0141.outlook.office365.com
 (2603:10b6:303:8c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:06 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:05 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 25/33] drm/amdkfd: add debug wave launch mode operation
Date: Thu, 25 May 2023 13:27:37 -0400
Message-ID: <20230525172745.702700-25-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 927d90da-bb18-429e-a329-08db5d45674d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RlQHdpywLvdysvZBoDvWvCeGbEawx+jQtQGg3/stQtk1NZM8FRNOnHXycsVfSRjhyKH62MYELmVPgEmzuOceUgr4EnAE01f3nnVJvLrWkb5/khZ/9Mv3O7z+ZMl/HsXxmBc41XCs6kj0XsxJkHBc9ymoALlcYmtHm9guUjoTqc9U6Wyk+xdLpyG1YE6GD+P7Ok19AdSfv95A6KMVFzDufYnd90ZsvYHhNaEt/0Cxfk8Og8Cr6YjQ6uKYUYoMrZZHhMHadqkwjSlvSWBx3teV/Xgt2FWsdPQP0CStI+6dcABbF/NymLW9j+ytQZhcHZJDdj4oCqQ+2Z/9u8s/PcfXMv2KB5hOsa2bNK6aXLaXVAY4Cz+2a5yVtcqAnmaMskXOjyf3/OotZPvA12KK0LYlMFxbhznC+0VDlE3JkE5e730wwnwjYWrV9QJ5/LNAYLA9e8aPAHMTpkxoDviqNPhmDcO7iYyo4GVfZNtjrQ17Egn/rf5WcfJHf77vR5fPmVTmudSuV/pTAaAxIg6gP1Ti4QYES3VugAYmbGqDHztqAZlluW2EdxXvL6Zw/vSpEEmpBYgBuii9tWBffBE6ItFGi7Sgo1nFkH3o3fP9t5PRRt+s4KzjQx0nfVtu2CqJcEKtz0NKt5L7X+xfCSivr6fk52O2pynS6yrjXW8PMBCapCvhwI9cjm+BCJs6lbpBYeYHGjMzI7icQopwDE++PtQq6kMoLqQBG98yUlB79I9In7RSmdDgfDzEHnCNXKWfe2YN2zUdpq098TljbRqyh352UWzV/+s98WKIDLP//DiRkc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(4326008)(6636002)(6666004)(1076003)(26005)(316002)(70206006)(70586007)(450100002)(7696005)(110136005)(41300700001)(478600001)(40480700001)(40460700003)(5660300002)(8936002)(8676002)(2616005)(86362001)(2906002)(30864003)(336012)(426003)(36756003)(356005)(81166007)(82740400003)(82310400005)(44832011)(16526019)(186003)(47076005)(36860700001)(83380400001)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:06.8918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 927d90da-bb18-429e-a329-08db5d45674d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow the debugger to set wave behaviour on to either normally operate,
halt at launch, trap on every instruction, terminate immediately or
stall on allocation.

v2: fixup with new kfd_node struct reference for mes check

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 12 +++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  1 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 25 +++++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  3 ++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  3 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 14 +++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 25 +++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 36 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  2 ++
 11 files changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index d7881bbd828d..774ecfc3451a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -107,6 +107,17 @@ static uint32_t kgd_aldebaran_set_wave_launch_trap_override(struct amdgpu_device
 	return data;
 }
 
+static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
+
+	return data;
+}
+
 const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -129,6 +140,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
 	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index ec2587664001..fbdc1b7b1e42 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -412,6 +412,7 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 7ea0362dcab3..a7a6edda557f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -856,6 +856,30 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 	return 0;
 }
 
+uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+	bool is_mode_set = !!wave_launch_mode;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+			VMID_MASK, is_mode_set ? 1 << vmid : 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+			MODE, is_mode_set ? wave_launch_mode : 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -944,6 +968,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 57339fa12807..3a6aca2b0eaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
@@ -36,6 +36,9 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 					     uint32_t trap_mask_request,
 					     uint32_t *trap_mask_prev,
 					     uint32_t kfd_dbg_trap_cntl_prev);
+uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
+					 uint8_t wave_launch_mode,
+					 uint32_t vmid);
 void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 7120927fed15..ed36b433a48b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -677,6 +677,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
-	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override
+	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
 
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index ae0c4707919f..9711d5128d09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -726,6 +726,17 @@ static uint32_t kgd_gfx_v11_set_wave_launch_trap_override(struct amdgpu_device *
 	return data;
 }
 
+static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
+
+	return data;
+}
+
 const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.program_sh_mem_settings = program_sh_mem_settings_v11,
 	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
@@ -745,5 +756,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
-	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
+	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 705669c26a1a..060331652573 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -792,6 +792,30 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 	return 0;
 }
 
+uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+	bool is_mode_set = !!wave_launch_mode;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+		VMID_MASK, is_mode_set ? 1 << vmid : 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+		MODE, is_mode_set ? wave_launch_mode : 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -1063,6 +1087,7 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 76812ddd35b1..18f4970ac8e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -74,6 +74,9 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
 					     uint32_t trap_override,
 					     uint32_t *trap_mask_supported);
+uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid);
 uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 					     uint32_t vmid,
 					     uint32_t trap_override,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e78103097162..4b45d4539d48 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2992,6 +2992,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				&args->launch_override.support_request_mask);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
+		r = kfd_dbg_trap_set_wave_launch_mode(target,
+				args->launch_mode.launch_mode);
+		break;
 	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
 	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
 	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 733390fb2459..53c3418562d4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -301,8 +301,10 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 {
 	int i;
 
-	if (!unwind)
+	if (!unwind) {
 		cancel_work_sync(&target->debug_event_workarea);
+		kfd_dbg_trap_set_wave_launch_mode(target, 0);
+	}
 
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
@@ -591,6 +593,38 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 	return r;
 }
 
+int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
+					uint8_t wave_launch_mode)
+{
+	int r = 0, i;
+
+	if (wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_NORMAL &&
+			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_HALT &&
+			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_DEBUG)
+		return -EINVAL;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+		pdd->spi_dbg_launch_mode = pdd->dev->kfd2kgd->set_wave_launch_mode(
+				pdd->dev->adev,
+				wave_launch_mode,
+				pdd->dev->vm_info.last_vmid_kfd);
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!pdd->dev->kfd->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r)
+			break;
+	}
+
+	return r;
+}
+
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index c9245221aa76..cb17869437c5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -48,6 +48,8 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 					uint32_t trap_mask_request,
 					uint32_t *trap_mask_prev,
 					uint32_t *trap_mask_supported);
+int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
+					uint8_t wave_launch_mode);
 
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
-- 
2.25.1

