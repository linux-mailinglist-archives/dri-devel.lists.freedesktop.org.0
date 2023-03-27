Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80136CAD87
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3810110E6EC;
	Mon, 27 Mar 2023 18:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8FF10E6D1;
 Mon, 27 Mar 2023 18:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY2+nmWNZS8a2CncMrWQIQnxAtuV1WSokPruI6X911Uj5GNPLh3hVDthdBA3rXG0mxAao/xOcrmu2P2UOq9JmRjxx1PPnWzfysi6lC64FsZNbg/cqEsOJF14VPGDY1FflBlsEjdGLpmjNet7smmjQ+C9CcXKy5Xy3DZBFymo17pc3qsBKNkuwhq/Vkwr2FnoTlRa3MK/ypTMhnJiafQf3tPuqhuOEsESkxis352Mqj/GZhfEnjfCGT2FIhqbokyErw0obnvayj5qgnYvDhjVwueswO80ELTxfjJwgi2XuVnfqbnmaH8fzk0etoXWDSTqgNaCiKPgxllyEo75MZPEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HvqXpnF4iq8+n/2RmtCmrSa3TVheLCU1O+vf9zydIE=;
 b=iyeFjF9ex5l5en7WFIV+qB7KRmZPA1YLXpRBGj1ylZuNki2fd7CH39nZYxm6g9kKwfIXEXygfPU9tK9GHgO8d8oduV2wn4eA9WuS26giJXWrPk1RqzxT8huk3Ndba8LnentloKy6E/cFEqhqK9oYWbtVAkC6jEBfI2JecKMX9XLe/EkTI8nT/fiUuPHKIoPTWobuI3FNVLGgBtswRdmf6TyZzqvASXShi1AfQTNWn+5XBhGb+MMOoInQxCrih1dGChEoEYnQZCxkbF3ASkr9wHfFn+VT7Ny0QjfB/ZCjUNuzW2sqKMxINVXhrSpX0Mmne5aWVHyh6yWGPCGH203mSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HvqXpnF4iq8+n/2RmtCmrSa3TVheLCU1O+vf9zydIE=;
 b=2CZ/J53yvXqFbNvkCuEjhmaXUsLexjDDpi482lTOiLdNbeBjLhzPUvQgVichB/Vki0jmmpJcDwd88ZNro2TZt9DrXd+o913Oi7v67lL1wPG0OYcM/qhTmYUHNvJt8yhgXco47t+RFQgboFAsZI18hY9EwNgKc4Fhv6WlTlTwP30=
Received: from CY5PR18CA0008.namprd18.prod.outlook.com (2603:10b6:930:5::11)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:59 +0000
Received: from CY4PEPF0000C97C.namprd02.prod.outlook.com
 (2603:10b6:930:5:cafe::35) by CY5PR18CA0008.outlook.office365.com
 (2603:10b6:930:5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97C.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:58 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:58 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/34] drm/amdkfd: add debug set and clear address watch
 points operation
Date: Mon, 27 Mar 2023 14:43:32 -0400
Message-ID: <20230327184339.125016-27-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97C:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a855c3-0152-47aa-0bdf-08db2ef33a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pQkQrWAIjgY/cqURwHlOW1s5fSexW4p23NaztXLHZSCNKA/N52OVjvOdwdZNLxaEVqLGRjSzGLmoC84Gfc5iNOuKTAhKW/MgXmEBHNXDEla8vFq5FFBWrZuPm6Ui36EK3cVDGNeBT1Nz/2iXMwO/OR/zyj6JdInVQtC0qS/4RJa7VJCX1tIBkD4y/XFuIoLRX3KjkH+3vpjTAZsRkfkAV+CP13wYexBAI77UyUxGCGs7FO28+3mh5R0cKSr23zk5GLIKUaJWYgGKAVQduFpKzOYUoWCrVxOdgQ7/QgXq2Mbx/IBXw6/NlYRl6UbwI+HENHuBwXlHONp+SLEVkNrBm1plU95QXI/Re+AMzr1qMS+QMwYTT1oqfOSHpVdqcS5ElScpIAcrivOljsp/vMTZ4aHqrsK9lih58uvYilAfH1x1NIP20hVeQXTINB7sJbfyZEj2mrVmNqc6VLr2MAIWVfeu0jfRQ2+YZx9Pjfe+x9cCJuuJD6rIpXWaPxapHvNqj+gLkxPpz7q15wHe25+ByO2AauA4tgjCkIidVrz4tSLpbX8VC6Sj23++3ab1JonvmEMYc03qEsxtIy+avMgVwuF2MRsED5d5GJAGWoGxpqh0url3ghiWCeX1EAqkRN/SNGASQdf6ZbseIgIhhaFACN5KIFFnq1uyo+/U3pXxBKrn/2l+gHpyjKubAvBEA0YOeDYVZezIhN36YwbqxYrJcgMf1Slmdh6vFMKivXB7cDk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(81166007)(8676002)(70206006)(70586007)(4326008)(41300700001)(450100002)(16526019)(186003)(2906002)(83380400001)(82310400005)(30864003)(36756003)(36860700001)(5660300002)(44832011)(47076005)(356005)(86362001)(426003)(82740400003)(2616005)(336012)(40480700001)(6666004)(478600001)(54906003)(110136005)(7696005)(8936002)(26005)(1076003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:58.7826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a855c3-0152-47aa-0bdf-08db2ef33a0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
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

Shader read, write and atomic memory operations can be alerted to the
debugger as an address watch exception.

Allow the debugger to pass in a watch point to a particular memory
address per device.

Note that there exists only 4 watch points per devices to date, so have
the KFD keep track of what watch points are allocated or not.

v4: fixup bad indentation

v3: add gfx11 support.
cleanup gfx9 kgd calls to set and clear address watch.
use per device spinlock to set watch points.
fixup runlist refresh calls on set/clear address watch.

v2: change dev_id arg to gpu_id for consistency

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
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
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   6 +-
 13 files changed, 451 insertions(+), 5 deletions(-)

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
index 5ace6aa042c1..444f9ea758d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -879,6 +879,82 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
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
@@ -967,6 +1043,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v10_set_address_watch,
+	.clear_address_watch = kgd_gfx_v10_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 34c04a2bb83b..334ff16e25db 100644
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
index 8627c5458973..ee36ba045dcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -676,6 +676,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
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
index 7ce596e10a62..8d899013d5a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -736,6 +736,54 @@ static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
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
@@ -756,5 +804,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
-	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
+	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v11_set_address_watch,
+	.clear_address_watch = kgd_gfx_v11_clear_address_watch
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index e7a83a2b7fde..87eef794d299 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -813,6 +813,81 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
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
@@ -1084,6 +1159,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
 	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
+	.set_address_watch = kgd_gfx_v9_set_address_watch,
+	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 2a2ab42037e4..ba52b61b68c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -77,6 +77,14 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
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
index e62d050a31e3..194221ab0f25 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2866,6 +2866,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 	struct mm_struct *mm = NULL;
 	struct pid *pid = NULL;
 	struct kfd_process *target = NULL;
+	struct kfd_process_device *pdd = NULL;
 	int r = 0;
 
 	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
@@ -2943,6 +2944,20 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
@@ -2995,7 +3010,16 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
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
index d17e2c03502f..4b8b71b1a322 100644
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
+	spin_lock(&pdd->dev->watch_points_lock);
+
+	for (i = 0; i < MAX_WATCH_ADDRESSES; i++) {
+		/* device watchpoint in use so skip */
+		if ((pdd->dev->alloc_watch_ids >> i) & 0x1)
+			continue;
+
+		pdd->alloc_watch_ids |= 0x1 << i;
+		pdd->dev->alloc_watch_ids |= 0x1 << i;
+		*watch_id = i;
+		spin_unlock(&pdd->dev->watch_points_lock);
+		return 0;
+	}
+
+	spin_unlock(&pdd->dev->watch_points_lock);
+
+	return -ENOMEM;
+}
+
+static void kfd_dbg_clear_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
+{
+	spin_lock(&pdd->dev->watch_points_lock);
+
+	/* process owns device watch point so safe to clear */
+	if ((pdd->alloc_watch_ids >> watch_id) & 0x1) {
+		pdd->alloc_watch_ids &= ~(0x1 << watch_id);
+		pdd->dev->alloc_watch_ids &= ~(0x1 << watch_id);
+	}
+
+	spin_unlock(&pdd->dev->watch_points_lock);
+}
+
+static bool kfd_dbg_owns_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
+{
+	bool owns_watch_id = false;
+
+	spin_lock(&pdd->dev->watch_points_lock);
+	owns_watch_id = watch_id < MAX_WATCH_ADDRESSES &&
+			((pdd->alloc_watch_ids >> watch_id) & 0x1);
+
+	spin_unlock(&pdd->dev->watch_points_lock);
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
+	if (!pdd->dev->shared_resources.enable_mes) {
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
+	if (!pdd->dev->shared_resources.enable_mes)
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
+	if (!pdd->dev->shared_resources.enable_mes) {
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
+	if (!pdd->dev->shared_resources.enable_mes)
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
index 0d70f162d6d8..63c716ce5ab9 100644
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
index 92b5b90ffdc0..379eb357d13f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -641,6 +641,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	}
 
 	kfd_smi_init(kfd);
+	spin_lock_init(&kfd->watch_points_lock);
 
 	kfd->init_complete = true;
 	dev_info(kfd_device, "added device %x:%x\n", kfd->adev->pdev->vendor,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 5f148d0136e6..dd084888258d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -348,6 +348,10 @@ struct kfd_dev {
 
 	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
 	struct dev_pagemap pgmap;
+
+	/* Track per device allocated watch points */
+	uint32_t alloc_watch_ids;
+	spinlock_t watch_points_lock;
 };
 
 enum kfd_mempool {
@@ -799,6 +803,7 @@ struct kfd_process_device {
 	uint32_t spi_dbg_override;
 	uint32_t spi_dbg_launch_mode;
 	uint32_t watch_points[4];
+	uint32_t alloc_watch_ids;
 
 	/*
 	 * If this process has been checkpointed before, then the user
@@ -955,7 +960,6 @@ struct kfd_process {
 	struct semaphore runtime_enable_sema;
 	bool is_runtime_retry;
 	struct kfd_runtime_info runtime_info;
-
 };
 
 #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
-- 
2.25.1

