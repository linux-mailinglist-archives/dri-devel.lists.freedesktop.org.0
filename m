Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7046CADAE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A1610E710;
	Mon, 27 Mar 2023 18:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D573010E6C9;
 Mon, 27 Mar 2023 18:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWfOHx9h8zdSzJ2I4MkZ2D0hRvUr73AZTYq1lir3A5+fehTCt4CEe0fFn1JhxuWCDWmZMef1kqMHS+nrovogTH3WG/lLAvl2/ieFDqQNbJDLiHtapFIy/CpBcdz27vo1GCUTZKqCSt5nyRf1CtQfjnNcWUXTbCiQBTME1taZQ52K38dbOwI8CMZZHDUXMwFQROm5qqZ/SnGDRQ1wylCYKlftqErGMkd8V0B8xVJK6T0FHcdQKWAMgBchVBiTb7b+gLBGz1Q147e9IZQn6kYvqDPyLo1fj31tFCjKCPU1K+AhAT8r9CAvQ0OqEg5XD90rRl/uFaXCExvccp34GMO75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDBdNXEVdBygSfICAItJ89V09GJJFp3JpdBmmw4HLQM=;
 b=MLzXwf2aK6xTDK1bXw/emIffuwJlDpvZH0+mIsbCYtQaTDiI9IIDS5GlINv64nnCH0W3NzU/90zic5t2NGU2CAq/NjwvilN70DvVhDsPVMfvjbVMJB16QggKmozicZW6nFCmH3gIsxhy1zQKdYokE5AWTkGROjzin3CcRS5JUb7gZ+WHN6js31m3sJbSUG7ZRBIHm4vtdYZtJ17w+34jLIr8LUdPJ+LFxY81Cg+RDm0y2vdK8CHqHYEUvdJn4HERQWqi426tKbT9cvClgVtwcmS74M4E8bg3lIgIsGfoNUKA1VIRkYqfsTGkPT47Q/nF8T5XfXYIv7+pJaxPBTr/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDBdNXEVdBygSfICAItJ89V09GJJFp3JpdBmmw4HLQM=;
 b=pQxw9epNFftIJAaB9/mVJAqZTcHugcmIN6mXdexBZbBVxJ8TQDCh4IlTrP30AXqr+umtb2Y8wyc9xNsVOKXZ+27BpXoXi3FUb88aItpCtiYFLTuxS5UnRTKLEXpUxCDj0Q7Qz+fkH7QX+SLqL+n0I/3kEAHvuSnQfA6hH32gU/Q=
Received: from CY8PR02CA0020.namprd02.prod.outlook.com (2603:10b6:930:4d::23)
 by CYYPR12MB8749.namprd12.prod.outlook.com (2603:10b6:930:c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 18:43:58 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::4c) by CY8PR02CA0020.outlook.office365.com
 (2603:10b6:930:4d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:58 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:57 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/34] drm/amdkfd: add debug wave launch mode operation
Date: Mon, 27 Mar 2023 14:43:30 -0400
Message-ID: <20230327184339.125016-25-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|CYYPR12MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d2da3f-849b-46f1-26f9-08db2ef339c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pqOImXCPHDTXqz81ajkE6hHDNBZy4jBo2Pjy4gMDO1atLLG9npiAluh6s0f2rNLjwaTFci1yX8FbDowr6d3YxSssLzlR1JQPHqdaEMRybwMLG+yYMwE8w7dr/q/SRf4N++RftuBKvJnCtDpTgWF2IPvOJ21libLDWP/72TUfPCT+6NZgDrom9DU1rfnOVXRjYyU8PGIkitVZVdh6+MY46znQAnjtDHS4V9DeQRFE7bmCQVX5ThXFajoI1a8kLN372974PJSdlz24p2Kbo1IYHeuMA8w4osHQvtLdIswmMWDsUDdA8QPcf0vEJ/izWrQjKYi1VInZaqn4DMLS2iaIfn/j4BHgkWwIENsTr3J+pJayglWqWXragOvm/wkFxmfWbxVa2acNn17Ka7A0tZSSNzFYwk0QQ8Mv7Wh5Bl6/YoIAYlc60kkAaJP30OdTE6mJRwq5Fi2zAAXPtEGX0nqtx0M8pALxN+6Ls9AxG84T636BtIeT834Eg0AJBgwGTo146hFVSXz6akCL477YrBKaOVuAfRluV0X7G7Bl1jx77uLY9FHGNe6i7wBDZwFf7wEiDVN7Vmu3EEf8/rZDAVCRYe44NpblJCAjq2+2zp8nZsxfX21mcZb20ZH8g2jF1w3/7rxqs3TbP6y6UK8LMOpkE4YeymcKhq33+A49LW7MvRPeB18H0QLnB23JVhV4eY1DH/95d4VP0W7V0RZ95nuY9Lzi17C2tbpD4zIryuF43Do9dfLx4MzUvWz/+5H9CtiLhGpbwq2xRhxREgd6Cqt9UQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(6666004)(54906003)(316002)(450100002)(40460700003)(426003)(8676002)(41300700001)(70206006)(356005)(70586007)(4326008)(7696005)(26005)(44832011)(1076003)(110136005)(2906002)(186003)(478600001)(83380400001)(82310400005)(2616005)(336012)(47076005)(16526019)(40480700001)(5660300002)(8936002)(81166007)(36860700001)(86362001)(82740400003)(30864003)(36756003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:58.3312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d2da3f-849b-46f1-26f9-08db2ef339c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8749
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow the debugger to set wave behaviour on to either normally operate,
halt at launch, trap on every instruction, terminate immediately or
stall on allocation.

v3: remove unrequired stall_launch reference in an earlier patch.
gfx off optimization will be addressed later.

v2: add gfx11 support and remove deprecated launch mode options

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
index 8e2468d02001..5ace6aa042c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -855,6 +855,30 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
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
@@ -942,6 +966,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 85c929fc2926..34c04a2bb83b 100644
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
index ae3ead207df4..8627c5458973 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -675,6 +675,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
-	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override
+	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
 
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 839094434a25..7ce596e10a62 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -725,6 +725,17 @@ static uint32_t kgd_gfx_v11_set_wave_launch_trap_override(struct amdgpu_device *
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
@@ -744,5 +755,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
-	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
+	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 16ecfa9ab49c..e7a83a2b7fde 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -789,6 +789,30 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
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
@@ -1059,6 +1083,7 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 47cff392b434..2a2ab42037e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -67,6 +67,9 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
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
index 10ded4141f9b..3b4dffbbc563 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2978,6 +2978,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index 3da287af9695..d131ff740fba 100644
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
+		if (!pdd->dev->shared_resources.enable_mes)
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
index 8b3a3d2f4e40..0d70f162d6d8 100644
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

