Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA41354A94
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04CC6E56D;
	Tue,  6 Apr 2021 01:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E097D6E56D;
 Tue,  6 Apr 2021 01:47:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fif8X8393Qks9oOBWaYYYAlWGaQEr0crEz+2idO+Y03mhMkoiMG3a4KEQz6tUAD+lcWaNINAm0ZLIwWMmGUVtx+GI4ake3MBpS6iUbrytnTDBxKIcusvHy8h/UlUer9vtRXWz4vIztIwnvdO7rKS2MBU19b1Bpn86r8JZHwOZDxsUbRKBythPx88nlRaaq0xZA23dn2lqdnvmANM0uFod0mnLXXRKZX8di8y/RvoOV8B/iLi3ebkY6XrRjnhVHdc1B1KFm8N7WBp3oimVf5/XdOUAxbISrt1hrzfrxLcRmJI/vOpsAfNiMfmcowFeAvx48VE7h0epsaq2CXG4NILuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmU72E9fiCYd5yRReUGJInrcesOuBvJ8Fw5f9VktKxA=;
 b=GMzBrpXnJmkMMdt4M7tOQ4jVDVu8xgp1AN+ROJtOjTUgVULk6ZcQ7J43ccKlsEL8WP0dePCArBtgd9atS7JbfBt+VOwVkLAJ/N+vX8g7oyP+SnO8Rbald0d62AYbYD7LaPbtZwOVIzkZor+N8opAzZoUER+GouP7iNNHZhOLI2XjN46EFOyJtgnC7TcTIKxx3TukVkVx0K44cR6fXPCjTbtA0G7Pyo+hdS/lHBZWX58PZWuXfwCMmTl7yjs9o4ThElW7v7+2wEVMgAu20fKEYWrk+lup4phSqf64RE495A7XP4Zl6yVlSWI0pC5xcezIFeOR5dtQ7gamo5I8ZJH+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmU72E9fiCYd5yRReUGJInrcesOuBvJ8Fw5f9VktKxA=;
 b=ggm55LKuYLqTYIbwUtQkkmVilOQAQQ9qGwfI7PyBVymF3k29g2te+6iipXhp2Z+1VqB9t0eR/fVwW7OWWZl6XijyIScTIJ2XGKOdfiZ+027NrEJUw6FTila4iqlfEtXDNMX663JVO9WRRxvnjkX9RqZndC6Px186KvkmOsXom28=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:43 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:43 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 34/34] drm/amdkfd: Add CONFIG_HSA_AMD_SVM
Date: Mon,  5 Apr 2021 21:46:29 -0400
Message-Id: <20210406014629.25141-35-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45585f71-3241-44be-68ba-08d8f89de5ee
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB415968DD899F89034692D4B392769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bG2BwUzKyhfnDr3wwpq8yq68+YtwGmkslYzHVjzz29gMDDt4cLAjPwkHUhHqPopfNcm+VT+lgeN0bQt/Cbk6Y5L0swr1JJyV9o0bbBej7znJmUuictwxEYRleWl+2drCtZBMn7ii6i26GkZGYq8TIplhUMlVsK/dTJHnKZAEXpPTyYMaFRtytDTt7m7f8uw/EeHB63EIeovVG8GuJ0dBy2JePwi6C9zSJ9woPR73fFEpEIE+94jNF/mPFH4p3a4PNgIEpFUN2M6PK25dcHJmE8GCp8wXbE3JjE+JIhxynSLtY1TxQJbGQWS0Tf/VxTUe1+zGz5KEGXouGjIq5H6OCGH0OePuMoa2NFYgfTAr4NaQZ3DBIRikvAd8DdKJRsV8RHi0cFoPtqN986MtbXQLbrM/VWfEA/+fXL4DX5RT/WFS00Hfr+WlZLUBcveCvIsvJj2uWYsXK9jOeU06wHM9WF9HxLYIcVHJoPMUyhR5K95gmXLlxVPp1xprV0m1UxOZJ9kH+iWwxT7G+vfjFoqY99dcWQl+1oPaqrpvSnDuiqjN8oqqqVUB6qs4v5u4UekabcfmJX8/YOShYKuOnzc4K5TJ5swvORtycMS3/Nr5ix1MWAmII3O3AR/3hRE/ZhL9u2ATmLnY2xKGl4fi7hEBdrsMCFarlWV1Nbp7h66GNHaasRqVr8K4A7uN0/D265EU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y4AAdlZi+Nf9u13jM6CjhsuV2HeyyhWQWSdi3eTFlRGWEYyhMsAFOHNo5Qic?=
 =?us-ascii?Q?9DiOVr3I3iX+DYJSBsd3OsRkhARu2SSrat9uneh/wsjzvCkmM/yJzFLNkF+E?=
 =?us-ascii?Q?ivwfSAyJ3D6xvFiTQpXvTEb1XRNFeyUMT0n7JOiuAyDdjRFTgT+ZRUJ5DxXj?=
 =?us-ascii?Q?QytZfachOeEbH0Z43KD3jPiItrMdFxsxtt2g3NONKbD8/CfP66DJHEgvW2VK?=
 =?us-ascii?Q?2a6RFTOH08q14Lbk9ihvni/m8tHxHTlJ44b3y7o3G3v6GxJ9ze/1S7EXPzxO?=
 =?us-ascii?Q?xHlD9VtNF1IukDvkXftkRubxzug8BPaKOHVP9wG3MP1aMaAlkXJR8txPj/mC?=
 =?us-ascii?Q?/Mrdirz4mkcTTlsjCAGbuz4vtdMfHxvesfNq67GQx/DFcLIHq6NawL/tcBGq?=
 =?us-ascii?Q?QUtxiE/FWvcuSP1r016dClP/oyy0j04q16eW8uHK6yjmJ0XadaVi73F3tAMA?=
 =?us-ascii?Q?c92doLipeiWeSioornt7bG3Fim6I6srUcDritU67ddw/sdPjmuvt1F/ogQdi?=
 =?us-ascii?Q?P5Lc+fPcQrJFzIytbMbU9nGXk10tb1gzTsFpQes0lJJrewOXQwrwR267tXlI?=
 =?us-ascii?Q?lgamsMStLU5lx8bDSfIcwh2usVExiC8r1IR7WY/SaE7sblQMzygSb4zhEQaP?=
 =?us-ascii?Q?h1VQuhilOdKj9kJvYiHIHNTzoq8eSFsObXSpnqbWXwY4vIefhevUgIdKXNr7?=
 =?us-ascii?Q?oGMwN69yz2DeoEMooSntZPLruo150YQ3+Ppkui00krQUk+sddKLRNQ9tHult?=
 =?us-ascii?Q?hbYA+zcJknXPqSUGDWZTyi7v/OBrQtNn84/qIbU+DM3YmMp1OcxPZDzJjJ4q?=
 =?us-ascii?Q?yrX6fhh1WmEZRQzfXL/pncE2IKjb8MUw4LUtzqo401fRCZ/UQjnLDyBgrt9J?=
 =?us-ascii?Q?Gan56wv3c5HAN/+I3XP3oAArXv9hqhIP/K2luMNs4cq+q/m8VN9Hqkca6tHH?=
 =?us-ascii?Q?aTg2L2vwe2dVCvisnr0QCyoWrWlJWRcOLbR0k86ahKOAb+W7WawZJXwAYOf7?=
 =?us-ascii?Q?oETkduzSRNq0D/vkRDfMGCShD9SzN2Nv8Oynm+5TfqgkIq6/sIuTiJ8NWuRC?=
 =?us-ascii?Q?fg6aV4SrsUjiBaYCzRg/u0c33eqxo9fo0VR69Uu1YJImaMcPwtpnWrxKmnBc?=
 =?us-ascii?Q?pif1Xqddby5w5DjPf9MUESbno4v3lqIttYcCK3aKWc1QANlcjnnTV2EBOL4L?=
 =?us-ascii?Q?oAOf5UegqBHvTUEx2pQk62DHtAsXm606f8ju7PNOsXK+aaWOdZ7V7aVIIFlm?=
 =?us-ascii?Q?r91T8qpz+grqQyDcOiW/lTkiec8a21/2+NuVOBUY8dYiBA9b/BAz8o8faMtR?=
 =?us-ascii?Q?STSSDS+wiNiGwNaW+DTFa9ML?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45585f71-3241-44be-68ba-08d8f89de5ee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:12.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xq9HT4+uUM8Xr7PDo1TeFLGbGuzhGIxswXez7V3daQptHExxoBanW2Mllw2XjXMBMJqwVk3JyW9dfXXjwNrqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Control whether to build SVM support into amdgpu with a Kconfig option.
This makes it easier to disable it in production kernels if this new
feature causes problems in production environments.

Use "depends on" instead of "select" for DEVICE_PRIVATE, as is
recommended for visible options.

Reviewed-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig       | 15 ++++++++++--
 drivers/gpu/drm/amd/amdkfd/Makefile      |  9 ++++---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h | 17 +++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 30 ++++++++++++++++++++++++
 5 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index fb8d85716599..8cc0a76ddf9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -8,9 +8,20 @@ config HSA_AMD
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
 	imply AMD_IOMMU_V2 if X86_64
 	select HMM_MIRROR
-	select ZONE_DEVICE
-	select DEVICE_PRIVATE
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
 	help
 	  Enable this if you want to use HSA features on AMD GPU devices.
+
+config HSA_AMD_SVM
+	bool "Enable HMM-based shared virtual memory manager"
+	depends on HSA_AMD && DEVICE_PRIVATE
+	default y
+	select HMM_MIRROR
+	select MMU_NOTIFIER
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
