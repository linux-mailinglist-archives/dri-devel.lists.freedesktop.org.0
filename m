Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20F71124E
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 19:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2694710E700;
	Thu, 25 May 2023 17:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0BF10E6EE;
 Thu, 25 May 2023 17:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCriAp5H/IzfExzcmMXK5U+35ilW8o40mZGZJLnB0UBpi31EzX/a4w3PHbh6BZqNY+sq2jA04MNdqwBZcCt39SSrV/11upYLKh/4FapN+tRITOuzdz8JvNY0uq1XDFXdTekEmjP/RzlPSwHKaM+xrQ04BSEofhUILJM1H6BLEJFl3hhsrjWswTLk0lF8fhnsJQQs5xZ55KT3HboyyjcJl1/WYm54SEoIiE0L7T1XtzhoQa7ao6HHxYQ3BFQP0xMOGJcnt8Flqb5x8i1yiyIOSG9F5lb0LCH4ofzQB0NEYVRJTP1T3Z8czTQRhwD7WmMDHanG+fiWQDB86XUkBwSJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AjldWJhCG/sXlvFapLSRhRVquF2VPfz9f3GKf0gJIY=;
 b=lbb0AepEa7y3A4+F1V3XS7Gov355WreZtXBrjlckx8i5E/8UK2Q9aR1wLy4ET/g89g2hReKIl7rmGPuZSvRT+2QZYzshi3VSh8IFnBVMOPJ9TupyfhtLZg+qLYv7+wwN+ALq1sh0g4emy6yOe3ntC3tB2/JlIFOpMfw6Jto4WJpcMF3IwS6xB9sQbgQkOyHNV7m29twxHtprxnOkvnEj3/W+QC+qYdRdfR0n7CSJD70/iqcjIDeB9qP36QcdDHdJiQHsKIZFeD2vwKDA79EOzyUzqooLWZR85lyugpUeg2fLb1RrqVqbz6SMv6V5FatzKHharedH1AZk63zfRSONdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AjldWJhCG/sXlvFapLSRhRVquF2VPfz9f3GKf0gJIY=;
 b=zmX/c5Ec0KU6HPmY7yJA1aMrm7IqYeUbvq14tYEVt7fkwWqARJQXFt2FDHP1rfQFaFmGu46GidV6NmKn21nwf3/s+SNJrnSa/twIp9i7lECxH4raQawxlpvGYngAFNN6C4SG9UbNiG16C79xLaXfiw9msnZUKdkSTJYAkXT/xQM=
Received: from MW4PR03CA0139.namprd03.prod.outlook.com (2603:10b6:303:8c::24)
 by MN2PR12MB4455.namprd12.prod.outlook.com (2603:10b6:208:265::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:28:07 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::7) by MW4PR03CA0139.outlook.office365.com
 (2603:10b6:303:8c::24) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:28:07 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:28:06 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 27/33] drm/amdkfd: add debug set and clear address watch
 points operation
Date: Thu, 25 May 2023 13:27:39 -0400
Message-ID: <20230525172745.702700-27-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|MN2PR12MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: 980161a1-7aa4-4243-ff6c-08db5d4567ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YjMx1cZB1AGjE2MFAWnysOMXlA9Qv2HBFD26snY6Cj7mC67pRi+gJmPZGyRq9QlRzhOfxffiovCZ4HmHbBv4Rr3niGtMAyo8lZ556E9L1aw9DvZ2laHqJjXI/7m/UO+x6vhsRoqljjHEAHCS53wMITdTmWI12asIc1+Rl9RszjeuABkNdoKjBLarkCAEAr5T4sQtlJwfNGZKlo/M8gugKhRIoowognvD40IoH3f0nv/KjpSCtAOO7QaD/Hz0WlHngNTLDiD/VXI2fe15wOPP1ftR+2ujhe1SFCgIxt1qc4RVKNuG3uZ2/cf2hNp+mV2msFDf2AiEKnTLglwoOqMi9xa1Z2IZ3du+RxZvH4LxPvCZue/b0zk7bx25hdlLeIJeLKOGREUYjfb1vNS1ZSWT4yj6fQ1jFsIxKaGkVLljVjdf+p+xJQLgD5GkYgVO3y9QDyA3eVe5sWiqZUckFpdTlZ6EzLCJIQsbPFWyRk79QjPoE1pOZCBgBxB2d2Q3FPNlc7uvhjksEmpAzBH7gohxDwQGA+15xpxO+gogboxiFKGz9Wll//ttsuUkL5gT4/pttQ8J8bNsbV+rGX3gnPayXX65Vk9CuMvh2QSI4I1zVpnDVI7G38vxSHMT1uG3nAf7HBS26ngCEsEpa19znDan3HNerq+fijVngB9gm7QBo9z+vrk5lDRDknFe0gtnRAMa2I9b5UJYAZozwIIlPbsx8B99G18Z6qzHr7h6TFQJ1ut4Ei5qYD7AJhXru+sNxK8mJmfIyKlKKdxhbgwh8C3UvQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(8676002)(82310400005)(2906002)(44832011)(30864003)(8936002)(316002)(6636002)(450100002)(70586007)(70206006)(4326008)(478600001)(110136005)(83380400001)(2616005)(40460700003)(47076005)(6666004)(16526019)(186003)(36756003)(1076003)(426003)(41300700001)(26005)(86362001)(40480700001)(336012)(36860700001)(356005)(7696005)(82740400003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:28:07.5168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 980161a1-7aa4-4243-ff6c-08db5d4567ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4455
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

Shader read, write and atomic memory operations can be alerted to the
debugger as an address watch exception.

Allow the debugger to pass in a watch point to a particular memory
address per device.

Note that there exists only 4 watch points per devices to date, so have
the KFD keep track of what watch points are allocated or not.

v2: fixup with new kfd_node struct reference for mes and watch point
checks

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  51 +++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  78 ++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |   8 ++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |   5 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    |  52 ++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  77 ++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |   8 ++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  24 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 136 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   6 +-
 13 files changed, 452 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index 774ecfc3451a..efd6a72aab4e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -118,6 +118,55 @@ static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
 	return data;
 }
 
+#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
+static uint32_t kgd_gfx_aldebaran_set_address_watch(
+					struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 6);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	return watch_address_cntl;
+}
+
+uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	return 0;
+}
+
 const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -141,6 +190,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_aldebaran_set_address_watch,
+	.clear_address_watch = kgd_gfx_aldebaran_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index fbdc1b7b1e42..6df215aba4c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -413,6 +413,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v9_set_address_watch,
+	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index a7a6edda557f..8ad7a7779e14 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -880,6 +880,82 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
 	return 0;
 }
 
+#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
+uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VMID,
+			debug_vmid);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 7);
+
+	/* Turning off this watch point until we set all the registers */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			0);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	/* Enable the watch point */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
+uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
+
 /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -969,6 +1045,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v10_set_address_watch,
+	.clear_address_watch = kgd_gfx_v10_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 3a6aca2b0eaa..e6b70196071a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
@@ -39,6 +39,14 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
 					 uint8_t wave_launch_mode,
 					 uint32_t vmid);
+uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid);
+uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id);
 void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index ed36b433a48b..8c8437a4383f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -678,6 +678,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
-	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
-
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v10_set_address_watch,
+	.clear_address_watch = kgd_gfx_v10_clear_address_watch
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 9711d5128d09..52efa690a3c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -737,6 +737,54 @@ static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
 	return data;
 }
 
+#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
+static uint32_t kgd_gfx_v11_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 7);
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	return watch_address_cntl;
+}
+
+uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	return 0;
+}
+
 const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.program_sh_mem_settings = program_sh_mem_settings_v11,
 	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
@@ -757,5 +805,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
-	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
+	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v11_set_address_watch,
+	.clear_address_watch = kgd_gfx_v11_clear_address_watch
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 060331652573..a56c895e1cd9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -816,6 +816,81 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
 	return 0;
 }
 
+#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
+uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid)
+{
+	uint32_t watch_address_high;
+	uint32_t watch_address_low;
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	watch_address_low = lower_32_bits(watch_address);
+	watch_address_high = upper_32_bits(watch_address) & 0xffff;
+
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VMID,
+			debug_vmid);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MODE,
+			watch_mode);
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			MASK,
+			watch_address_mask >> 6);
+
+	/* Turning off this watch point until we set all the registers */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			0);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_high);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_low);
+
+	/* Enable the watch point */
+	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
+			TCP_WATCH0_CNTL,
+			VALID,
+			1);
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
+uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id)
+{
+	uint32_t watch_address_cntl;
+
+	watch_address_cntl = 0;
+
+	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
+			(watch_id * TCP_WATCH_STRIDE)),
+			watch_address_cntl);
+
+	return 0;
+}
+
 /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -1088,6 +1163,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v9_set_address_watch,
+	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 18f4970ac8e4..5f54bff0db49 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -84,6 +84,14 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 					     uint32_t trap_mask_request,
 					     uint32_t *trap_mask_prev,
 					     uint32_t kfd_dbg_trap_cntl_prev);
+uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t watch_id,
+					uint32_t watch_mode,
+					uint32_t debug_vmid);
+uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
+					uint32_t watch_id);
 void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index adda60273456..e88be582d44d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2880,6 +2880,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 	struct mm_struct *mm = NULL;
 	struct pid *pid = NULL;
 	struct kfd_process *target = NULL;
+	struct kfd_process_device *pdd = NULL;
 	int r = 0;
 
 	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
@@ -2957,6 +2958,20 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 		goto unlock_out;
 	}
 
+	if (args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ||
+	    args->op == KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH) {
+		int user_gpu_id = kfd_process_get_user_gpu_id(target,
+				args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ?
+					args->set_node_address_watch.gpu_id :
+					args->clear_node_address_watch.gpu_id);
+
+		pdd = kfd_process_device_data_by_id(target, user_gpu_id);
+		if (user_gpu_id == -EINVAL || !pdd) {
+			r = -ENODEV;
+			goto unlock_out;
+		}
+	}
+
 	switch (args->op) {
 	case KFD_IOC_DBG_TRAP_ENABLE:
 		if (target != p)
@@ -3009,7 +3024,16 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				(uint32_t *)args->resume_queues.queue_array_ptr);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
+		r = kfd_dbg_trap_set_dev_address_watch(pdd,
+				args->set_node_address_watch.address,
+				args->set_node_address_watch.mask,
+				&args->set_node_address_watch.id,
+				args->set_node_address_watch.mode);
+		break;
 	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
+		r = kfd_dbg_trap_clear_dev_address_watch(pdd,
+				args->clear_node_address_watch.id);
+		break;
 	case KFD_IOC_DBG_TRAP_SET_FLAGS:
 	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
 	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index f4d3dfb35cb3..4b36cc8b5fb7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -24,6 +24,8 @@
 #include "kfd_device_queue_manager.h"
 #include <linux/file.h>
 
+#define MAX_WATCH_ADDRESSES	4
+
 void debug_event_write_work_handler(struct work_struct *work)
 {
 	struct kfd_process *process;
@@ -289,6 +291,139 @@ int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
 						pdd->watch_points, flags);
 }
 
+#define KFD_DEBUGGER_INVALID_WATCH_POINT_ID -1
+static int kfd_dbg_get_dev_watch_id(struct kfd_process_device *pdd, int *watch_id)
+{
+	int i;
+
+	*watch_id = KFD_DEBUGGER_INVALID_WATCH_POINT_ID;
+
+	spin_lock(&pdd->dev->kfd->watch_points_lock);
+
+	for (i = 0; i < MAX_WATCH_ADDRESSES; i++) {
+		/* device watchpoint in use so skip */
+		if ((pdd->dev->kfd->alloc_watch_ids >> i) & 0x1)
+			continue;
+
+		pdd->alloc_watch_ids |= 0x1 << i;
+		pdd->dev->kfd->alloc_watch_ids |= 0x1 << i;
+		*watch_id = i;
+		spin_unlock(&pdd->dev->kfd->watch_points_lock);
+		return 0;
+	}
+
+	spin_unlock(&pdd->dev->kfd->watch_points_lock);
+
+	return -ENOMEM;
+}
+
+static void kfd_dbg_clear_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
+{
+	spin_lock(&pdd->dev->kfd->watch_points_lock);
+
+	/* process owns device watch point so safe to clear */
+	if ((pdd->alloc_watch_ids >> watch_id) & 0x1) {
+		pdd->alloc_watch_ids &= ~(0x1 << watch_id);
+		pdd->dev->kfd->alloc_watch_ids &= ~(0x1 << watch_id);
+	}
+
+	spin_unlock(&pdd->dev->kfd->watch_points_lock);
+}
+
+static bool kfd_dbg_owns_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
+{
+	bool owns_watch_id = false;
+
+	spin_lock(&pdd->dev->kfd->watch_points_lock);
+	owns_watch_id = watch_id < MAX_WATCH_ADDRESSES &&
+			((pdd->alloc_watch_ids >> watch_id) & 0x1);
+
+	spin_unlock(&pdd->dev->kfd->watch_points_lock);
+
+	return owns_watch_id;
+}
+
+int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
+					uint32_t watch_id)
+{
+	int r;
+
+	if (!kfd_dbg_owns_dev_watch_id(pdd, watch_id))
+		return -EINVAL;
+
+	if (!pdd->dev->kfd->shared_resources.enable_mes) {
+		r = debug_lock_and_unmap(pdd->dev->dqm);
+		if (r)
+			return r;
+	}
+
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+	pdd->watch_points[watch_id] = pdd->dev->kfd2kgd->clear_address_watch(
+							pdd->dev->adev,
+							watch_id);
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+	if (!pdd->dev->kfd->shared_resources.enable_mes)
+		r = debug_map_and_unlock(pdd->dev->dqm);
+	else
+		r = kfd_dbg_set_mes_debug_mode(pdd);
+
+	kfd_dbg_clear_dev_watch_id(pdd, watch_id);
+
+	return r;
+}
+
+int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t *watch_id,
+					uint32_t watch_mode)
+{
+	int r = kfd_dbg_get_dev_watch_id(pdd, watch_id);
+
+	if (r)
+		return r;
+
+	if (!pdd->dev->kfd->shared_resources.enable_mes) {
+		r = debug_lock_and_unmap(pdd->dev->dqm);
+		if (r) {
+			kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
+			return r;
+		}
+	}
+
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+	pdd->watch_points[*watch_id] = pdd->dev->kfd2kgd->set_address_watch(
+				pdd->dev->adev,
+				watch_address,
+				watch_address_mask,
+				*watch_id,
+				watch_mode,
+				pdd->dev->vm_info.last_vmid_kfd);
+	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+	if (!pdd->dev->kfd->shared_resources.enable_mes)
+		r = debug_map_and_unlock(pdd->dev->dqm);
+	else
+		r = kfd_dbg_set_mes_debug_mode(pdd);
+
+	/* HWS is broken so no point in HW rollback but release the watchpoint anyways */
+	if (r)
+		kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
+
+	return 0;
+}
+
+static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
+{
+	int i, j;
+
+	for (i = 0; i < target->n_pdds; i++)
+		for (j = 0; j < MAX_WATCH_ADDRESSES; j++)
+			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
+}
+
+
 /* kfd_dbg_trap_deactivate:
  *	target: target process
  *	unwind: If this is unwinding a failed kfd_dbg_trap_enable()
@@ -303,6 +438,7 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 
 	if (!unwind) {
 		cancel_work_sync(&target->debug_event_workarea);
+		kfd_dbg_clear_process_address_watch(target);
 		kfd_dbg_trap_set_wave_launch_mode(target, 0);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index cb17869437c5..7f0757c2af2c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -50,7 +50,13 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 					uint32_t *trap_mask_supported);
 int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
 					uint8_t wave_launch_mode);
-
+int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
+					uint32_t watch_id);
+int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
+					uint64_t watch_address,
+					uint32_t watch_address_mask,
+					uint32_t *watch_id,
+					uint32_t watch_mode);
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
 					unsigned int queue_id,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 1eb57a4798f4..5b0f3be7d15f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -802,6 +802,8 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	if (kfd_resume_iommu(kfd))
 		goto kfd_resume_iommu_error;
 
+	spin_lock_init(&kfd->watch_points_lock);
+
 	kfd->init_complete = true;
 	dev_info(kfd_device, "added device %x:%x\n", kfd->adev->pdev->vendor,
 		 kfd->adev->pdev->device);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 05da43bf233a..8ec87bc8ba82 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -381,6 +381,10 @@ struct kfd_dev {
 
 	struct kfd_node *nodes[MAX_KFD_NODES];
 	unsigned int num_nodes;
+
+	/* Track per device allocated watch points */
+	uint32_t alloc_watch_ids;
+	spinlock_t watch_points_lock;
 };
 
 enum kfd_mempool {
@@ -833,6 +837,7 @@ struct kfd_process_device {
 	uint32_t spi_dbg_override;
 	uint32_t spi_dbg_launch_mode;
 	uint32_t watch_points[4];
+	uint32_t alloc_watch_ids;
 
 	/*
 	 * If this process has been checkpointed before, then the user
@@ -989,7 +994,6 @@ struct kfd_process {
 	struct semaphore runtime_enable_sema;
 	bool is_runtime_retry;
 	struct kfd_runtime_info runtime_info;
-
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
-- 
2.25.1

