Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893076CADAC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D301810E704;
	Mon, 27 Mar 2023 18:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA17910E6C9;
 Mon, 27 Mar 2023 18:44:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP1mj7/DR15SJEoRqiZiW1CVn2d1urRwD2oIu8Bml+QR66angAVWXVKprkBVKltWao5mKJBHO0byY5t8963H9kFJcKqk4rMwS+DMyAa3j0KpuxSLSeUFz12Z3Qynib5jGWeBofO6uQbuDS8qDY7UFYxYe1AjU58nF9k03s2Ee6vIy+MJRHywp0WRsJImGkVZFRpugmRU/lM6MF/qJ7xxUaHlylLthhK8S/hLQzvELbf2Ymzsb6xglxC3hKdZ9eGmxpp37ViVI8bOFd/iAkdQbAG8dC2F6eUh8ji7GNsV/m+BOdntDkYAwLqhbHI/p3NytWTg3v42r8ENyt3VmAom6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMciIW2LnJlmp8Db1CT/qAm9JTD3BzUqRMnRVy31gwI=;
 b=TFRTKyHb3z2I9auLBJIkc+xadmP3U7s3wAbOzLMpLVg2NI6foTrOHuQr39Q2OonPCbzpZFllnwFu8TeX6x2HWNYM5dhS2Ttx/y8BmH2GbahgX6md3lQeT0b0He00B9Xvd8MXR4V9exgB2huV4KYqz6TefEwLkLasm4jarsCopOkuGCmXwMzjmNghT53cLdfn3x3tjX5aUWTqyFzQh+TszNXyse1oXGmtH8Z8PLt6rFwHH7al1GigzR07b1F0aHhprMfr++XjxOeVRgf1Nrn5/+UGulqDAySOoUryNzcEBfUdWflr1AcgNl/KOvmdlUKtgSPqDNOOKXZz997NkMVOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMciIW2LnJlmp8Db1CT/qAm9JTD3BzUqRMnRVy31gwI=;
 b=B5P5rBCTrNpiFr99koaDOwbfBnBS/qnXv0jSaOZz9Q31dt9DPVU50EleSHHez4CpjHKVgtiPks/e5x44RJEhXs6p6jLv31xnntJxjMXGQ92a540whdLVwke2+JZqQJ5WY4B0SP4G6xeU3edGd46kitUBDwNkIhQP0X014a3mnbY=
Received: from CY5PR15CA0088.namprd15.prod.outlook.com (2603:10b6:930:18::29)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:44:03 +0000
Received: from CY4PEPF0000C979.namprd02.prod.outlook.com
 (2603:10b6:930:18:cafe::3b) by CY5PR15CA0088.outlook.office365.com
 (2603:10b6:930:18::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Mon, 27 Mar 2023 18:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C979.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:44:03 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:44:00 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/34] drm/amdkfd: optimize gfx off enable toggle for debugging
Date: Mon, 27 Mar 2023 14:43:39 -0400
Message-ID: <20230327184339.125016-34-jonathan.kim@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C979:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef76216-6785-4eca-a041-08db2ef33cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A+ndAcE8Gy8e0h867BDS+AIiQEhceCXtKWhg9OBKvt8vDrfxQUu8tG1zt7vfnAUpCWLN6KD8QSDhMwWpXkhKPtkTHGjodndqZNDQzz9cy05Ggpt2DRJn2DWmUWV3iPazRWYJ58utdyIOt1doKla2i4BnK7BmDwIZHmG1ib7ZYbWfgqHQxipXs9PhjIpYW7UiDc9X9KjvNGy0GX7rS63ZR6dt1MJjiPYS7UewhqZOS79+aaDltb7zI8wWrXPFbFB/34k5kNemohlwA+sHagrhfxOOHw/Z2LBBJ1NJZR8nYpOMrXwXt9LiYWP8kwWM82H3joxYDMBovk+jHb8lqXCPlwOnQl/EIxu+vnJP4p1P2Ktp/fw2/XnrlbheGsqxQy3cgFuNG4xjI8a6sdGf/Bii2rNU158mhNJhAjYVbQLm24ehruzICY00AFsj/2mfkuyH000d0jgIeFH61Sszjf934RIhh60TN4YZJqDDKPANUObgatuW2I1Y8B6o0SMV1JWZndQaOykEhuP0bQBfCwBVik5zOdGJ/A6HqxMt6kBiyF77DFUVgyX3aa0F1tA3dthieCajtoIRL6G9K5pkK5ANiJD2bgP0sAKAmkvIk5JRTrIAVbmxrHv1Esi7wzQqpGylp+Bhl3JCptvyRaN82JeZ9e2rr20UdHFChAFcKesrxmYxwWVrCgkCC3x74Rsp+Fc5M5RPZTaBaJaFIVuAYYL9ZaPwwPDh43ha92yXtW/W8/oxa7HX5603UFgG0b1JcGkdyiALuy73/iLBbKAah8CEdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(81166007)(8676002)(70206006)(70586007)(4326008)(41300700001)(450100002)(16526019)(186003)(2906002)(83380400001)(82310400005)(30864003)(36756003)(36860700001)(5660300002)(44832011)(47076005)(356005)(86362001)(426003)(82740400003)(2616005)(336012)(40480700001)(6666004)(478600001)(54906003)(110136005)(7696005)(8936002)(26005)(1076003)(316002)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:44:03.6427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef76216-6785-4eca-a041-08db2ef33cf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C979.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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

Legacy debug devices limited to pinning a single debug VMID for debugging
are the only devices that require disabling GFX OFF while accessing
debug registers.  Debug devices that support multi-process debugging
rely on the hardware scheduler to update debug registers and do not run
into GFX OFF access issues.

Remove KFD GFX OFF enable toggle clutter by moving these calls into the
KGD debug calls themselves.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  7 ++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 33 ++++++++++++++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 24 ++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 30 +++++------------
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 21 +-----------
 5 files changed, 73 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 6df215aba4c4..dec4a3381ccb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -350,6 +350,8 @@ static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
 				bool restore_dbg_registers,
 				uint32_t vmid)
 {
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
@@ -362,6 +364,8 @@ static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -375,6 +379,7 @@ static uint32_t kgd_arcturus_disable_debug_trap(struct amdgpu_device *adev,
 					bool keep_trap_enabled,
 					uint32_t vmid)
 {
+	amdgpu_gfx_off_ctrl(adev, false);
 
 	mutex_lock(&adev->grbm_idx_mutex);
 
@@ -388,6 +393,8 @@ static uint32_t kgd_arcturus_disable_debug_trap(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 const struct kfd2kgd_calls arcturus_kfd2kgd = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 444f9ea758d6..2132376e2107 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -753,12 +753,13 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
 				bool restore_dbg_registers,
 				uint32_t vmid)
 {
+	amdgpu_gfx_off_ctrl(adev, false);
 
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
 
-	/* assume gfx off is disabled for the debug session if rlc restore not supported. */
+	/* keep gfx off disabled for the debug session if rlc restore not supported. */
 	if (restore_dbg_registers) {
 		uint32_t data = 0;
 
@@ -783,6 +784,8 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -790,6 +793,8 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
 					bool keep_trap_enabled,
 					uint32_t vmid)
 {
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
@@ -800,6 +805,16 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
+	/*
+	 * Remove the extra gfx off disable reference from debug restore call
+	 * for asics that do not support rlc restore for debug registers.
+	 */
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 10) ||
+	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1))
+		amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -831,6 +846,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 {
 	uint32_t data, wave_cntl_prev;
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
@@ -852,6 +869,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -862,6 +881,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
 	uint32_t data = 0;
 	bool is_mode_set = !!wave_launch_mode;
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
@@ -876,6 +897,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -933,10 +956,14 @@ uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
 			VALID,
 			1);
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
 			(watch_id * TCP_WATCH_STRIDE)),
 			watch_address_cntl);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -947,10 +974,14 @@ uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
 
 	watch_address_cntl = 0;
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
 			(watch_id * TCP_WATCH_STRIDE)),
 			watch_address_cntl);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 87eef794d299..4b025fa0beb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -701,6 +701,8 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
 				bool restore_dbg_registers,
 				uint32_t vmid)
 {
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
@@ -711,6 +713,8 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -724,6 +728,8 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 					bool keep_trap_enabled,
 					uint32_t vmid)
 {
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
@@ -734,6 +740,8 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -765,6 +773,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 {
 	uint32_t data, wave_cntl_prev;
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
@@ -786,6 +796,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -796,6 +808,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
 	uint32_t data = 0;
 	bool is_mode_set = !!wave_launch_mode;
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	mutex_lock(&adev->grbm_idx_mutex);
 
 	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
@@ -810,6 +824,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
 
 	mutex_unlock(&adev->grbm_idx_mutex);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -867,10 +883,14 @@ uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
 			VALID,
 			1);
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
 			(watch_id * TCP_WATCH_STRIDE)),
 			watch_address_cntl);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
@@ -881,10 +901,14 @@ uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
 
 	watch_address_cntl = 0;
 
+	amdgpu_gfx_off_ctrl(adev, false);
+
 	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
 			(watch_id * TCP_WATCH_STRIDE)),
 			watch_address_cntl);
 
+	amdgpu_gfx_off_ctrl(adev, true);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index ead5afe4216b..131b9c25e3ec 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2752,7 +2752,6 @@ static int runtime_enable(struct kfd_process *p, uint64_t r_debug,
 			struct kfd_process_device *pdd = p->pdds[i];
 
 			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev)) {
-				amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
 				pdd->dev->kfd2kgd->enable_debug_trap(
 						pdd->dev->adev,
 						true,
@@ -2809,33 +2808,22 @@ static int runtime_disable(struct kfd_process *p)
 			return ret;
 	}
 
-	if (was_enabled && p->runtime_info.ttmp_setup) {
-		for (i = 0; i < p->n_pdds; i++) {
-			struct kfd_process_device *pdd = p->pdds[i];
-
-			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev))
-				amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
-		}
-	}
-
 	p->runtime_info.ttmp_setup = false;
 
 	/* disable ttmp setup */
 	for (i = 0; i < p->n_pdds; i++) {
 		struct kfd_process_device *pdd = p->pdds[i];
 
-		if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
-			pdd->spi_dbg_override =
-					pdd->dev->kfd2kgd->disable_debug_trap(
-					pdd->dev->adev,
-					false,
-					pdd->dev->vm_info.last_vmid_kfd);
+		pdd->spi_dbg_override =
+				pdd->dev->kfd2kgd->disable_debug_trap(
+				pdd->dev->adev,
+				false,
+				pdd->dev->vm_info.last_vmid_kfd);
 
-			if (!pdd->dev->shared_resources.enable_mes)
-				debug_refresh_runlist(pdd->dev->dqm);
-			else
-				kfd_dbg_set_mes_debug_mode(pdd);
-		}
+		if (!pdd->dev->shared_resources.enable_mes)
+			debug_refresh_runlist(pdd->dev->dqm);
+		else
+			kfd_dbg_set_mes_debug_mode(pdd);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 0ea85afcffd3..6e306defcc85 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -423,11 +423,9 @@ int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
 			return r;
 	}
 
-	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
 	pdd->watch_points[watch_id] = pdd->dev->kfd2kgd->clear_address_watch(
 							pdd->dev->adev,
 							watch_id);
-	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
 
 	if (!pdd->dev->shared_resources.enable_mes)
 		r = debug_map_and_unlock(pdd->dev->dqm);
@@ -458,7 +456,6 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
 		}
 	}
 
-	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
 	pdd->watch_points[*watch_id] = pdd->dev->kfd2kgd->set_address_watch(
 				pdd->dev->adev,
 				watch_address,
@@ -466,7 +463,6 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
 				*watch_id,
 				watch_mode,
 				pdd->dev->vm_info.last_vmid_kfd);
-	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
 
 	if (!pdd->dev->shared_resources.enable_mes)
 		r = debug_map_and_unlock(pdd->dev->dqm);
@@ -577,15 +573,11 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 
 		kfd_process_set_trap_debug_flag(&pdd->qpd, false);
 
-		/* GFX off is already disabled by debug activate if not RLC restore supported. */
-		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
-			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
 		pdd->spi_dbg_override =
 				pdd->dev->kfd2kgd->disable_debug_trap(
 				pdd->dev->adev,
 				target->runtime_info.ttmp_setup,
 				pdd->dev->vm_info.last_vmid_kfd);
-		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
 
 		if (!kfd_dbg_is_per_vmid_supported(pdd->dev) &&
 				release_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd))
@@ -684,14 +676,10 @@ int kfd_dbg_trap_activate(struct kfd_process *target)
 			}
 		}
 
-		/* Disable GFX OFF to prevent garbage read/writes to debug registers.
+		/*
 		 * If RLC restore of debug registers is not supported and runtime enable
 		 * hasn't done so already on ttmp setup request, restore the trap config registers.
-		 *
-		 * If RLC restore of debug registers is not supported, keep gfx off disabled for
-		 * the debug session.
 		 */
-		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
 		if (!(kfd_dbg_is_rlc_restore_supported(pdd->dev) ||
 						target->runtime_info.ttmp_setup))
 			pdd->dev->kfd2kgd->enable_debug_trap(pdd->dev->adev, true,
@@ -702,9 +690,6 @@ int kfd_dbg_trap_activate(struct kfd_process *target)
 					false,
 					pdd->dev->vm_info.last_vmid_kfd);
 
-		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
-			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
-
 		/**
 		 * Setting the debug flag in the trap handler requires that the TMA has been
 		 * allocated, which occurs during CWSR initialization.
@@ -836,7 +821,6 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
 
-		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
 		pdd->spi_dbg_override = pdd->dev->kfd2kgd->set_wave_launch_trap_override(
 				pdd->dev->adev,
 				pdd->dev->vm_info.last_vmid_kfd,
@@ -845,7 +829,6 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 				trap_mask_request,
 				trap_mask_prev,
 				pdd->spi_dbg_override);
-		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
 
 		if (!pdd->dev->shared_resources.enable_mes)
 			r = debug_refresh_runlist(pdd->dev->dqm);
@@ -872,12 +855,10 @@ int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
 
-		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
 		pdd->spi_dbg_launch_mode = pdd->dev->kfd2kgd->set_wave_launch_mode(
 				pdd->dev->adev,
 				wave_launch_mode,
 				pdd->dev->vm_info.last_vmid_kfd);
-		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
 
 		if (!pdd->dev->shared_resources.enable_mes)
 			r = debug_refresh_runlist(pdd->dev->dqm);
-- 
2.25.1

