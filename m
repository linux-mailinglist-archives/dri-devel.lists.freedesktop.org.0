Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195FF350DD8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC556EC61;
	Thu,  1 Apr 2021 04:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2FC6EC56;
 Thu,  1 Apr 2021 04:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWD9hVpahDPFOoWlY7j0djOaZGSfOsn7SwLuv3vMbwhN84DjzegPPmhqdr5ic+RVFuKZjlRXDcJEjeQusMV+2KU09/nGimrixAF+xn4xQSY5HJQyY+4bsJtr1EWWuCNRkO7DoAlWvtkcjaZQvDIEhtHwPE84YYYDNOKNAefPykKB9S8qNACt6++mr4ZGVFHGIvXwd3J/k54fASyJDXfjeKzqAa/x5Ir7nU4gpmbZhU3IsPvGPMu3S5GSgjizFocn2LVm7Sbwsx/GInumLs357EhFz59vSwi9zrwO7IudDQPE+lEIDufdwt6P/rBtGdobe+yEijUqCqOzQ3nint4uTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnhCRp/TEY/kH0GrFZ08XmNyAjnJBMhIEZxzSM/A2F8=;
 b=S55YsCcyVGQrxgww2plv+AvYu05Qb/PeVJe9icw97PlkXs3tgBdDMHJhNaL7ab8j6WuEfe3i5yWly6DuZekS7d0QJiEw41EbCXUimP/1XS02BUTZTYgFg2dL4W8hHqAKgaAWnEMxpi3mI+JkOO9E7Vo0DTpeuto58sQFdvWWvNRsdZYBJWYLF9ncKVUGp4psZmsvF/EXfwUppa4yJtm5oG3jZ9ZnskRRMhGOyeIw/BBvSUUBhiQpqAM3uvHGtFnK3rDzV1+k4v/bVHUuiDnHJ7nzCn7Ft0LSTDjKq+JF7MySzYSYlmV1RJpN/mIB4rOhKgIvgagJ3WU+osdtH7x8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnhCRp/TEY/kH0GrFZ08XmNyAjnJBMhIEZxzSM/A2F8=;
 b=FS0Yucf5BLw0qPKfeQlMDjxMxWNfwitJIH44WJ2kZYs/zHdOgonSe44cA2tfa/lX3/wrJPHrBUnhJXmgFkXahgu95c71UVRj1zMCSfp4h6imI0p7CfV4mZBUyuyB4n59PfWTIPkLKBLZa3hmVZZgG+4EQj2RiSmU1dotyQz8JMA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:43 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:43 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 34/34] drm/amdkfd: Add CONFIG_HSA_AMD_SVM
Date: Thu,  1 Apr 2021 00:22:28 -0400
Message-Id: <20210401042228.1423-35-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f301773-859a-4fdf-e0f6-08d8f4c5de4c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222B5F32DA9FF7F7E34D70B927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5caSGpYXtyPRWoshexK3ssRDPUGKKcz26hi5ythRACE26t6oae+Hv3B0GJWRk91erWLmvQdqbD82Jh2dJ3OLSbk77EpZHpKVSE8O7/U4pYAbFODmJulX0LeJsy1DQ7uvy4oxczOvm/dh1+cmxpbn7qI4/+yqXguTSeL/C1WX//PxI94kx296uaBmGxG5qOARI5HwYW6zeljdeA4Lkwor0UzOFtJmGBRUqNrHbIdR0nFjZqoGa+v5tJfzL2VxMpDfBe6B3cAtbRC9Jz+yD8hK2twVCsiCw7TpKrPRNQTHUru4DMGnCB3TzYVGEiw8ffJRfqXyMLSb4QBUBQk3hVGzpPq7Js8wOyY6vJwjcarPNBJEKp6OMbIxVbjXu4Ynh5L1ueBG9mQf3JStO01rLQcEcyAcCAoqAm7K5JmnDC7bFkTs9e9qAJyduF5QDf8pauZRZPGaNBZLAYw3/0fX4Xj+dfw7GJTEvXhou3e1tdkYC1ebF5L99vd1F1xKiMC5s07b7MbaCGRwj7uMEgSGNvalJJI4/uIw/dnOzUa4Yw2JjYQ9aGkv1YRiEUzTuYTxiqaAiGPKlWQKBiNzsOjz+L4P3ersP715N2lOWE4lCGe82SX6q4dkd1FevJfp9NUyl6knLncu+MU5lGx+wRsc7VmF7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SLVRjDIKmr0oyf/8hZ1vHPJ99WzLQzh7poOdQ7LA0PPoksxBPcnPy5lnoFh1?=
 =?us-ascii?Q?cHX5HF2IRs/wfHHlFS9KmWcdeDuXtEMNtrc1pOHVfJKVteKg4NVk/1pNHMQs?=
 =?us-ascii?Q?DcQeYAJi+3MsEwaAC6ksYA4N/nfgpxRls+BlIJjNET0CBlKWgcq90+BRAFmF?=
 =?us-ascii?Q?VT3MJK/Iv6BwmIKaLoXqU3bTHsan2Dl9RC71sA24wQZOIDQBQVxIK1l08DjX?=
 =?us-ascii?Q?PzSyPbvaECQpDsgoBfYZzG9jqHv+Fvq5HrTJWXNqs8oQHtVv2Q7S/taG8Z1c?=
 =?us-ascii?Q?Zr/QIyhB9nIZFmsvcJYfd/lgGoDsurnmaVH+eDTClRq6ccuEr0fQENrwEVU7?=
 =?us-ascii?Q?eEr79+cZTbvgLpbzxmqn9xhKU1EnQz8kgwYiUXh+Pw3sWdPJBVpzqepNnR6K?=
 =?us-ascii?Q?mUxwALv/976ctpOYNjAubXC8FbDVlIUzelca1bze1zQ1HnjGBtJI2PM/60jK?=
 =?us-ascii?Q?aqwJ4fdCTSFVc8nPqzwH62QKAWOHRMRV0GcQRLOedOJ1MnvmJpK93NyaWYE2?=
 =?us-ascii?Q?yvGDslPa9kFkk5/s39Gp0hlkO9tsxRAz3/If+bcXVmMx/vO9RhxgnSRVmi5W?=
 =?us-ascii?Q?wwnPXY+3/yRApfVXytDrIvN+SKWO8ejkVeRiAsH6a63UPgD8ADUWHVsFzLgs?=
 =?us-ascii?Q?LooFooIOWNcoVik/mSWzRNX0LpWx955Wp0GuKagfjn6ywR7uhwaaKRZuv1Lg?=
 =?us-ascii?Q?XJLTGAzYe9LYQjvpG8IIaRfYcsb0wgVUZvoENYN+RiKk4/CDXd2F7X2Y+c6n?=
 =?us-ascii?Q?LZ2VqXQDQr8bg40nCnHHeXVAPJg4kkxShjfsEdcvHhDI3Bm181NiHrYZ/AUM?=
 =?us-ascii?Q?MY1gDbJ4vxiYqrC+HtmVpedsBjAjlLT+xK1SfOSTldVkhNqgAfDpENDBdKDZ?=
 =?us-ascii?Q?YJ6B1BFA05O1x/9DIAPgi8R4KzRS/P4BzpFd0MYd7eX9ZFGJiahLeWoFmd0K?=
 =?us-ascii?Q?Hw1ReKvB4FrBLRxMtmSK1RjBiNtm3BRaZTbmtlbh/HQHd7U6gZ9xDViaxOa4?=
 =?us-ascii?Q?6bWKOSZmxm08ymMcKo+3lUO+S9jzRywtbeXYoPwPBk0LG0m66iUtO7GlZ26M?=
 =?us-ascii?Q?h91w842ByyJWgUreI8ZYVA38JuOGnwUzs8Ep8i/33zSpfUL96DKCL47GeVwh?=
 =?us-ascii?Q?R5KMtXbqkpAk9Sddtw6GFRaKJ12IZ5R754bksu1DImOMUYyRuVSJStY1e2ce?=
 =?us-ascii?Q?6h1HA0/iyR9Cw0eBJb+k0F/dLEYhFVn/6caIul/GLhN/tbEAXOFa77L1PCr5?=
 =?us-ascii?Q?h+TZeVzETKygbR2ZOqTyBwggScvG55/hf99jMWZ3vsW9+8RHZv5J5kwoKhcL?=
 =?us-ascii?Q?/n+Go1eVGGWWSiV7dxCzWz0O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f301773-859a-4fdf-e0f6-08d8f4c5de4c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:15.0798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbyK64OtzRpQFh+hnkb9gUaWQXswh48b/wXauhMlDCF6upL35mWTt/x8w59ht/tctNcRQK1VHDZQwmhoWIA9ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Control whether to build SVM support into amdgpu with a Kconfig option.
This makes it easier to disable it in production kernels if this new
feature causes problems in production environments.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig       | 15 +++++++++++-
 drivers/gpu/drm/amd/amdkfd/Makefile      |  9 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h | 17 +++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 30 ++++++++++++++++++++++++
 5 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 7880fc101a3b..d03a79e14126 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -8,8 +8,21 @@ config HSA_AMD
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
 	imply AMD_IOMMU_V2 if X86_64
 	select HMM_MIRROR
-	select DEVICE_PRIVATE
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
 	help
 	  Enable this if you want to use HSA features on AMD GPU devices.
+
+config HSA_AMD_SVM
+	bool "Enable HMM-based shared virtual memory manager"
+	depends on HSA_AMD
+	default y
+	select HMM_MIRROR
+	select MMU_NOTIFIER
+	select DEVICE_PRIVATE
+	help
+	  Enable this to use unified memory and managed memory in HIP. This
+	  memory manager supports two modes of operation. One based on
+	  preemptions and one based on page faults. To enable page fault
+	  based memory management on most GFXv9 GPUs, set the module
+	  parameter amdgpu.noretry=0.
diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index a93301dbc464..c4f3aff11072 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -54,9 +54,7 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_dbgdev.o \
 		$(AMDKFD_PATH)/kfd_dbgmgr.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
-		$(AMDKFD_PATH)/kfd_crat.o \
-		$(AMDKFD_PATH)/kfd_svm.o \
-		$(AMDKFD_PATH)/kfd_migrate.o
+		$(AMDKFD_PATH)/kfd_crat.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
@@ -65,3 +63,8 @@ endif
 ifneq ($(CONFIG_DEBUG_FS),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_debugfs.o
 endif
+
+ifneq ($(CONFIG_HSA_AMD_SVM),)
+AMDKFD_FILES += $(AMDKFD_PATH)/kfd_svm.o \
+		$(AMDKFD_PATH)/kfd_migrate.o
+endif
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9838d0cd1f51..f60c44dbae3e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1768,6 +1768,7 @@ static int kfd_ioctl_set_xnack_mode(struct file *filep,
 	return r;
 }
 
+#if IS_ENABLED(CONFIG_HSA_AMD_SVM)
 static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_svm_args *args = data;
@@ -1793,6 +1794,12 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 
 	return r;
 }
+#else
+static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
+{
+	return -EPERM;
+}
+#endif
 
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index bc680619d135..9119b75b3853 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -24,6 +24,8 @@
 #ifndef KFD_MIGRATE_H_
 #define KFD_MIGRATE_H_
 
+#if IS_ENABLED(CONFIG_HSA_AMD_SVM)
+
 #include <linux/rwsem.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -43,17 +45,20 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
 
-#if defined(CONFIG_DEVICE_PRIVATE)
 int svm_migrate_init(struct amdgpu_device *adev);
 void svm_migrate_fini(struct amdgpu_device *adev);
 
 #else
+
 static inline int svm_migrate_init(struct amdgpu_device *adev)
 {
-	DRM_WARN_ONCE("DEVICE_PRIVATE kernel config option is not enabled, "
-		      "add CONFIG_DEVICE_PRIVATE=y in config file to fix\n");
-	return -ENODEV;
+	return 0;
+}
+static inline void svm_migrate_fini(struct amdgpu_device *adev)
+{
+	/* empty */
 }
-static inline void svm_migrate_fini(struct amdgpu_device *adev) {}
-#endif
+
+#endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
+
 #endif /* KFD_MIGRATE_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index af853726b861..363c282f8747 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -24,6 +24,8 @@
 #ifndef KFD_SVM_H_
 #define KFD_SVM_H_
 
+#if IS_ENABLED(CONFIG_HSA_AMD_SVM)
+
 #include <linux/rwsem.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -172,4 +174,32 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 void svm_range_free_dma_mappings(struct svm_range *prange);
 void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm);
 
+#else
+
+struct kfd_process;
+
+static inline int svm_range_list_init(struct kfd_process *p)
+{
+	return 0;
+}
+static inline void svm_range_list_fini(struct kfd_process *p)
+{
+	/* empty */
+}
+
+static inline int svm_range_restore_pages(struct amdgpu_device *adev,
+					  unsigned int pasid, uint64_t addr)
+{
+	return -EFAULT;
+}
+
+static inline int svm_range_schedule_evict_svm_bo(
+		struct amdgpu_amdkfd_fence *fence)
+{
+	WARN_ONCE(1, "SVM eviction fence triggered, but SVM is disabled");
+	return -EINVAL;
+}
+
+#endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
+
 #endif /* KFD_SVM_H_ */
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
