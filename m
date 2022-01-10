Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C1848A12F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 21:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665C510E5C0;
	Mon, 10 Jan 2022 20:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3111210E5A6;
 Mon, 10 Jan 2022 20:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh3ZaijhwGQwOlwYbMyXfZx7s3+Mzs6Z600i1VLwIGh6CjVAJ0vwUlM7rGZ4Fd53fKxPyb2wm66FtfStE3n3JzkbmZFb95xnSOuA2Zkl8fH0oT3BoCpd9brqum0/oIuagjN+lZoI2UpxegqTSZPvc1oLPLNXL/+2nJrEzA6Hy2yFoA0gnTjSHnCBtYLrm+9c9fwZWX4g4PofFRl9VjdXx2pcrJ2HmiKZj5wz8xdZYMJp8ygumEyxquEZXfGAYSG0An4I4pUbv+WYjhpy5HJLazCDEhZ3v3h5J78ShESYIpk9lvwKIKXdwH2CABJ1XYwHLlzaI5xNI4vjvQ53Ntp1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4Qg4xAHWI5Pnu9Oy4ePoVnwEJXQhxoVT1bSjVZSHMw=;
 b=GrqK2/b3ehJtjmnPgWIX3GJ+yuasITWhxslCY3gr0aI0862Dkb+FjNDdT92ybv4XKvQXIrcKH1LlD6hP2jq+XOMQhD3DtVL9Z4Cesy/H4IbZfmZ2BJfpCGr7iEsC56P9G3wjZd+v34EclI6QKciXBVrVTmffAIXpPz4uXjrDeIJfVGxFtRBdX8WEeQ78QFYtMjXxqesoiuogUoroRmHGUPX/8zcuvxWHMZT2s5zYv2DAJEXpGQ0C4C0EydL+AjeC96dxZ2xsFey16HMycVKD6YpybCpwmWgdU7SzW+bN2yKY12v/RN+j72zZkALBSPgNMBJ0CinkSIzQ8yNYRyZv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4Qg4xAHWI5Pnu9Oy4ePoVnwEJXQhxoVT1bSjVZSHMw=;
 b=IQH6eRmBpnnHZcdpuf4b/JdT5XiO6GYtzqJuWqJz0cRdPbIEX2AmotEyK2UezWyuTgs61zMYTzWGLP0JYR1Y53VPdmtftQbAOBl5gge/LmqxnbpnQuW+bg8sQBExDNQaf/t/1rOArvBbtviWX1ko2vWT59YbjK8NLuRbANI84Tc=
Received: from BN0PR07CA0008.namprd07.prod.outlook.com (2603:10b6:408:141::35)
 by MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 20:55:11 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::a9) by BN0PR07CA0008.outlook.office365.com
 (2603:10b6:408:141::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Mon, 10 Jan 2022 20:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 20:55:11 +0000
Received: from magnus.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 14:55:10 -0600
From: Daniel Phillips <daniel.phillips@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] Add available memory ioctl for libhsakmt
Date: Mon, 10 Jan 2022 12:54:57 -0800
Message-ID: <20220110205457.3165572-1-daniel.phillips@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea180e89-9bb4-46df-569c-08d9d47b7e48
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3613547B04579604AE9AEF1CE3509@MN2PR12MB3613.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMC6QIfVbODx949HP+DkOT+ckVGTiCGiEEIsbsKPP04p0Lt4GfYGq3gK3Nns2HHDoYiNiboWlpTn7BlO0vhfRq+qgHfM4AQeMwlqeBiKJCWrXdHhVfY3HOFehLH4XghpjBVSpkZTDizxPw3uGLKW+Sm3zDILil4OdJn/VeoZfGULIxjNJ6qSIG58la9o+IJqMH/iBsllz6drlraDvhM+5NUCEjRVB026MbwRlK8oXuX5SeJBXEGgDOV+HDmLWMQGJZdhLlziZwH2wiHIORXye1XovobrisoU2zy3RIEHdOvreMrnsZqtgn385RSaVB9qvwyJpGAcNnu/JXCezYI12i7lgwm7fyMMwMDoccP9KdXZZWbwU3XeFz7MTStx7sauER6GJRVSyN4Dwttws85mpplOeuw2UpoE1S2ww5RMyNxH2/asyynu/WmK7chTTglSKCXYjPQyScmRkwXRJzOpbX0Fv529hVs1H2W45Hh+MO8mk7IVYP1WYvEjIuA69Otld/tGN3z5NLxqOds6HhteSorUxmcn23w5nBcqSjXfU0oH9yuILCTyHSvMwTPszNq977VdpbSDVIHKjHPFhldTy/yjcUQbW+r1RExRyDri5sJd5ffyIkjkKYosXOf2IHY0RJJ94Kype0EC7lrnHggWk+ZEDnx7jokEeNbDTugJqe/n7jj9b8np6MqWaN7blS88uoZHMReQGPpBJBPJ6iMMEkbmNKg/YpHdP68S3f1PcbMrwQr+RB0w3ihJfyyRZmnGPT2VmureTcnE9J0L4Zn2gsNwpaBblyr6aJ7aVH6+y/6bqwDm6DTi+uwZNZ9su4sNKPGT+MNWHedXjPfBb2VLZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(5660300002)(426003)(82310400004)(44832011)(8936002)(36756003)(70206006)(316002)(70586007)(336012)(6666004)(1076003)(356005)(16526019)(186003)(40460700001)(81166007)(2906002)(26005)(110136005)(7696005)(508600001)(47076005)(450100002)(8676002)(4326008)(2616005)(36860700001)(83380400001)(86362001)(131093003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 20:55:11.4059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea180e89-9bb4-46df-569c-08d9d47b7e48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3613
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
Cc: Daniel Phillips <dphillip@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Phillips <dphillip@amd.com>

Add an ioctl to inquire memory available for allocation by libhsakmt
per node, allowing for space consumed by page translation tables.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h      |  1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c    | 14 ++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c        | 17 +++++++++++++++++
 include/uapi/linux/kfd_ioctl.h                  | 14 ++++++++++++--
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index fcbc8a9c9e06..64c6c36685d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -266,6 +266,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
 					void *drm_priv);
 uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
+size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct amdgpu_device *adev, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 86a1a6c109d9..b7490a659173 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -190,6 +190,20 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct amdgpu_device *adev,
 	return ret;
 }
 
+size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
+{
+	uint64_t reserved_for_pt =
+		ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
+	size_t available_memory;
+
+	spin_lock(&kfd_mem_limit.mem_limit_lock);
+	available_memory =
+		adev->gmc.real_vram_size -
+		adev->kfd.vram_used - reserved_for_pt;
+	spin_unlock(&kfd_mem_limit.mem_limit_lock);
+	return available_memory;
+}
+
 static void unreserve_mem_limit(struct amdgpu_device *adev,
 		uint64_t size, u32 alloc_flag)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 4bfc0c8ab764..5c2f6d97ff1c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -486,6 +486,20 @@ static int kfd_ioctl_get_queue_wave_state(struct file *filep,
 	return r;
 }
 
+static int kfd_ioctl_get_available_memory(struct file *filep,
+			         struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_get_available_memory_args *args = data;
+	struct kfd_dev *dev;
+
+	dev = kfd_device_by_id(args->gpu_id);
+	if (!dev)
+		return -EINVAL;
+
+	args->available = amdgpu_amdkfd_get_available_memory(dev->adev);
+	return 0;
+}
+
 static int kfd_ioctl_set_memory_policy(struct file *filep,
 					struct kfd_process *p, void *data)
 {
@@ -1959,6 +1973,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
 			kfd_ioctl_set_xnack_mode, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
+			kfd_ioctl_get_available_memory, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index af96af174dc4..94a99add2432 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -32,9 +32,10 @@
  * - 1.4 - Indicate new SRAM EDC bit in device properties
  * - 1.5 - Add SVM API
  * - 1.6 - Query clear flags in SVM get_attr API
+ * - 1.7 - Add available_memory ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 6
+#define KFD_IOCTL_MINOR_VERSION 7
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
@@ -98,6 +99,12 @@ struct kfd_ioctl_get_queue_wave_state_args {
 	__u32 pad;
 };
 
+struct kfd_ioctl_get_available_memory_args {
+	__u64 available;	/* from KFD */
+	__u32 gpu_id;		/* to KFD */
+	__u32 pad;
+};
+
 /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_policy */
 #define KFD_IOC_CACHE_POLICY_COHERENT 0
 #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
@@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_SET_XNACK_MODE		\
 		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
 
+#define AMDKFD_IOC_AVAILABLE_MEMORY		\
+		AMDKFD_IOR(0x22, struct kfd_ioctl_get_available_memory_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x22
+#define AMDKFD_COMMAND_END		0x23
 
 #endif
-- 
2.34.1

