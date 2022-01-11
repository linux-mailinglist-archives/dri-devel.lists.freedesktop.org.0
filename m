Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0348A54C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 02:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F63910E1FC;
	Tue, 11 Jan 2022 01:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E7D10E1F0;
 Tue, 11 Jan 2022 01:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4lelFbtJUqljIVD0TFh++VQ9/mVx1vgZ9sRVVDgPCooJU+whOx1OaXuuEM5SKITfN8DVSLLpSmStyCpjiBHflCKuwqkcfmvvsgPKl19OBT7FNZnXtlW9FEJKC1csww1ZoqJ7CyxirfYoaReQAr4NMHxkKT4TfgzJFI3bmFcsfJkALqGn7psHNZdfXcR0FZ7evEtFNwYQaQ9AvZeql6PRBa4KpZsc7gnZ9If62I1hNqkNOXrcMs8UtdaN1NAp5PvcQFrtMr/FZQ8jJXNxl3Bo+jMPbSr9cX2rzUYSuRzG3v98CxWPwDZJoMOsPoBwrLdHGGHxXw6qJYMSmrmp115/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVBJLMt+011cOi/+gwwRIaOmmKpclsdeZGJrdDlr/M4=;
 b=Xi4LPB6l763wcRQjJRCFPYBM4ia9wrAQLQTygE3lqphjMMsf++cGjvOmR0QbviQfvt5hQPNuH1LHAH307SEPD483YqgX9jZVPamfCEtDZhG/Agk67MFko9A3Eskg/csC2mQF6Fi0RBsyTVppdsIomrUjm5g3/ekCykvlR9rMs6x17TEOisBXcwzlsjFPl7uVJ129dmV1+63zPg8brSEdsvxRvhdKDl11Cu1aAIimv8KLiAgMuQBIEZktBTrPVhLRVxL2PyH44V/eNb7B93c2wlyOBMmmf2JUxnU1rdQlnyLuIzeMVggme3fXTctvZRXACStm/TLF6YSQrfAfgTdLQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVBJLMt+011cOi/+gwwRIaOmmKpclsdeZGJrdDlr/M4=;
 b=if1yAUDV9tiis+IRz6srRdKgru1ZDSHI553rfdBzJEUW2ZwSeD0pEpBJYNbHG33fp9CPbbofVPYmCNwf0XNRbqXtjW7CSm7kXnsQKdhuOoXNA4PgtZPV3hUYJ9B9B3AYvziLkMYiEqmkKJdstVSjA39G68oLnCr2iQZ06MpvGdg=
Received: from DS7PR06CA0051.namprd06.prod.outlook.com (2603:10b6:8:54::21) by
 MWHPR1201MB0093.namprd12.prod.outlook.com (2603:10b6:301:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 01:47:05 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::a) by DS7PR06CA0051.outlook.office365.com
 (2603:10b6:8:54::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Tue, 11 Jan 2022 01:47:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Tue, 11 Jan 2022 01:47:04 +0000
Received: from magnus.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 19:47:03 -0600
From: Daniel Phillips <daniel.phillips@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] Add available memory ioctl for libhsakmt
Date: Mon, 10 Jan 2022 17:39:56 -0800
Message-ID: <20220111013955.3214767-1-daniel.phillips@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa6bf53-8128-4651-e6ca-08d9d4a44508
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0093:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0093E310C41ED742D2F1CC53E3519@MWHPR1201MB0093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmdnr7yR9/tq/W1TC1aGZvbIqWmEp1XQjbqdduSR+x2FM0A/KnzYAVQpU8a9Z4tsdCUPFoEYe/qL52iJhg1FJyc1/NULnbTXn7SN04hdWOY+IdWhvHLytlheUg7hD8dwnbmp4kZAsCWIZcC/Utav8/igHEV8UUo+KntKuq233aNRspaCs+o11Ah9g+7K46ns13D1LIRaWAckRvnlqEH3gPy2Rvp6Lk2IWDbitI5yBYpNNs3/6doA4R6G90NAnFM7NivxsVDV4pxrHHFxyK7R3XIVk+GMA4PBUIwO6+QS9Etq+dfVDNBbwUsp8Ero5Tkcn7gyo2zrqNWgG9ml47bLLmFUdmzOuHaFJ/O9eZ3kZIV5Dc51CS1QK2HoZ1nkOOqVkPMV9/yNXnoacJRgJ8Tc+OSX3KV+wDqoLX++RSvmnzkLAf34Gcb0clEBVrA6Dg9xFT+gGqvWYtEyvuUikn0foMwWW9crsgWkjT01Wz64UgURP3lycHwRDr6HMYzhhLC/+vQDd+eEmpsgBuqmLsGLM7K9+s14lFgwnSu4Pq9ig/6aGw/IW54MrfLJuvsfCjKYFHIDwmsV3Ef1YNYdwWfkcb1D5jcOEIabz50LhKSJWYV7qac+MYQW5KRiKI5rosetBOLweR3cmXPSqd6NjhJV8jElIhDlE3Rx7Kykw99EWm7I8J6FpFuGEzBSjihwNkJspULUHQRkOtZnxTVEX+R74iimnQ1GUJxGbewDOsk/6i9myRpkHj9Kd7EbjZFPLcnxKP99qGZDp2bjqG7ubaQPkM8pQ1gl9KX592QpsimEgNE1GD3WOsy0OU9wAioKvMdsb/OjB290aF//paCr6c4/qw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(7696005)(40460700001)(82310400004)(70206006)(70586007)(36860700001)(6666004)(2616005)(336012)(356005)(47076005)(81166007)(83380400001)(86362001)(186003)(4326008)(450100002)(110136005)(16526019)(2906002)(36756003)(5660300002)(26005)(508600001)(8676002)(316002)(426003)(44832011)(8936002)(1076003)(966005)(131093003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 01:47:04.6009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa6bf53-8128-4651-e6ca-08d9d4a44508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0093
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
Cc: Daniel Phillips <daniel.phillips@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an ioctl to inquire memory available for allocation by libhsakmt
per node, allowing for space consumed by page translation tables.

This ioctl is the underlying mechanism for the new memory availability
library call posted for review here:

   https://lists.freedesktop.org/archives/amd-gfx/2022-January/073352.html

Signed-off-by: Daniel Phillips <daniel.phillips@amd.com>

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

