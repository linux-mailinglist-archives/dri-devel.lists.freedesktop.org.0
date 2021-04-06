Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1943E354A74
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0AA6E526;
	Tue,  6 Apr 2021 01:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA26E22F;
 Tue,  6 Apr 2021 01:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eD5dWmP6f9NfTrPA14A7uwlzEsccCcSJWGsNwqaRRtS3q3pBx4sqBRLKvKMhGcuFR6Vg+gXPqD7rXBB2ogKsKhTg1MN8aLaAbL7v51lPrAWTNiPA+5n0pi7UJBXBNs+Wr3S79KC/Lee4/RQ3noJpOs/iBNbn2+5IKmAkUwon/1nVyb01mzuSge+uJcWS6LWnLXDsC09FYPyDkYzdzjZy+BXxwzGen/2dl3DPtLYkxQ2JpLrTY+QAdILaliRoq8v0mzTXXgo1Yja6/OoXGPIsljvmP9Ou/objbzOohei6VFSlUGEdXTTYIr04tEhSXEwXFlGSQyunUK767hJQ3gvLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3abnI9I/zGQKPE8Eru/bBh2G11HK4QDGA8IKK1GibI8=;
 b=btRvgPaoCLd1DZ3yhuhYRdmNMbgczPEsA/cOD+/ZqiZt1CnqoIdkdVFUHmlCA6dt+wb4F17q6XuC2/sWGH4+I5pUlSIAQhJ9NMyhjet4cJ6Vn52Lqg52j7B0OpijvNeo3u0YqH3FGMV2R4iUYP+675/I0g8fXtHCfd/0tHVNn/glx1e2L0XWYgfIKpDkAcJxakr7WZVf+GfTMnUAyej+q6VdU6Xk1loacyiZMqra94h8I8Tp9N/VNpuBfBHiGXc6KhlRKQklCsKeuz4LyYakZeYKDv0EcHLDRuPN9a6JVEHHEpziQRT0O0Tj+ZaS2IlI4cxf+pNuDSJKQ+IwrAhSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3abnI9I/zGQKPE8Eru/bBh2G11HK4QDGA8IKK1GibI8=;
 b=cCXRLy85ZVJRIFfmokzSyAl4Scx/+GcwGzrqHXsebnbNd0heEOU6+fjUzm4MPf9/nIHIhwPj4m7CKJOZaXUPpCtekU59r1Ni+j3VPM52A0NXgzFmAAwCBpfRB71zVUx74kUVYvYj9Ow3Fq3by13p7WbtykFFEoWInrStgTxNm3E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:02 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:02 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/34] drm/amdkfd: register HMM device private zone
Date: Mon,  5 Apr 2021 21:46:10 -0400
Message-Id: <20210406014629.25141-16-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 356569e9-70e1-4128-53ee-08d8f89ddfa6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37923D1236CFFDE63A73329892769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQUygm1/1h64eSxNyzKmS5lHPZin8ZTNSGrGoST3ttqK0KI/goihIsjHuRBXNmruI8g6sgvoS8NgJyq3qo6QxSZm+AAsNpPiOrLjy+8HbXqxwU3t1BgW0kp6oxX0vIw/z51FFOifBM5cMm5+nuIpPRv44wnsztKP94xvTo+SWHlrhZVualZusRpSI17lwUzvc4jcJ+sjn2xun+lfhaSiZDqaw+xrdyFY+lIQpRO8cgo1GVGn+EL4U/yTyao9Wy2y6HbWtX8WTK03d2BcXqCw7w2heaQoTb4vRp3p59J/sPydmmh5Ejw3L83h+M0Raxxpw2smHgd2lpR6VDMo96yRPOWRyB6I3eNBIFcazLpd2hEOH8zFmeR+qdIUrA9AWfbHPxe8Ljc/UO1LSnU6eX5gyeYRNhf70vng6sJ9WjE8YbdXD8dnttJbnGTJJiZBoJDvN+/ZLrDlcMzdhlz0Q6CkqU/uxPJHknXN0iwCl8AfSpkuip9AYIfWP49b8o/G44DivygVPRW6yEWdE95LH8FH1ufdjOIITENY1OMQ1NyOkaqZQ02MFGsKWgYDlM9eQ+8yMS1SCl/IJ3Y7N9yXtOGbzvcUZBUxtHvqgofxwzIQOP1UEsrhOp9TY4n94R9CKI05D6gwUYKGzzHsaFDN/ipmZfvXGrCxAnqqbQi3SQ74/idbk2FENctSBmztKllKzoKc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(83380400001)(186003)(1076003)(4326008)(8936002)(38100700001)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6sA8vflU1oJmxbCM5REQAhZP4bvd9nOaXZ33KQRmzFvFeJVzl6A4zmjRimNs?=
 =?us-ascii?Q?T1fejac+YRRTNX5EwM2QkKh8By3ntn7CAFasUYRIFvT9glfcJNvtIPLJIgm1?=
 =?us-ascii?Q?1iYX5J1JxbxSRmyZcPzBEylWs9iEU1bIMvlEoHaqT+GDZRNyPR+KXGos0ki7?=
 =?us-ascii?Q?RSuPGsVvyq9CClM1nt3MVCZrA6uHITOhJHUp63ULTdNPLMZjMvznSCiETyCr?=
 =?us-ascii?Q?eZYF8DNydalr/HYjyyKh6XYWzNQBna/jnZitg9u3zfTehRrwbAENyH+5qn/N?=
 =?us-ascii?Q?CTcH7ijtJzVKbpmMC3d4U1Aq4AAvfj+8OgsbjEgXRvCmLcej1AHdedZbcv0r?=
 =?us-ascii?Q?ilNiG6SoEOPCYAoV/txPy3z9xtpU/ue9Tg3IHkkAJQ9w+HNnyMK0FoYuz6SU?=
 =?us-ascii?Q?gs36qJLwUJMXRPl4+hxPlb7hxc6k+S3rgpc78ffpEB9rgh1vqreyTMINlzMd?=
 =?us-ascii?Q?8aRjORRZaQTnlXIsVZ4WDg7cnX0ZmmkaLDXCXN3G3q8CAijBqBWYa8WBrMFC?=
 =?us-ascii?Q?PKWKZiRr5knPp+ca1MPrZ2XhzeGnjYTifS6s76IbOs3odV+okirF8lcDaZ34?=
 =?us-ascii?Q?uw4cHR87UL48DGM4Og8P1hZM0HE/uzj6bfIy7EyYP1dduwg5K/fzd9Ljhd4X?=
 =?us-ascii?Q?JWE0igqz3DCGOGsKw68jAdsQVcjCAS4/A75ypAVOCEWdmpUx/siINrYcVqIq?=
 =?us-ascii?Q?cVcR1Ca+bI3kGfpEVKYu8G/2oap8JimqOoV64QLNnGPCJdspgeUjNXnLbJdK?=
 =?us-ascii?Q?WHUl1kahmh5cmeP/UFyMRmCVQAJg9FBDZSn+qsun5Z2nnzt5mjVSrC1WwnJX?=
 =?us-ascii?Q?UghkEkrMmG4J4KQHuiIVi8+CjIzX5fRLnBDwWKUJm1zINiqipEEv7rSmosmn?=
 =?us-ascii?Q?z3RxhYvNlbqdWinYO5o6piQ34Dj0srGjf079ROgktZHsbTlGu9kBRphUIsFm?=
 =?us-ascii?Q?BU3LGVBHG6kEXcT4Ab2qXwLw0APqUf0LOhcvswrqaDttdB+caPEGCPRexjj2?=
 =?us-ascii?Q?4oZYlrfV6F/CgFkJJVU9aITw5XKoqafWcpzyiseVmYDAGPT4+84Yo7aI87/y?=
 =?us-ascii?Q?u0faAz9Xa1Dphotx4zwPVEQZ7CyoBEmu07IJuGvvj0rf/OnIE7ljN0L/kyAV?=
 =?us-ascii?Q?e9BFjT14PalLzaiUnj9WlOJ15junHMXZlW965DLfWGYBfQwkdMZhUmnqyRI9?=
 =?us-ascii?Q?zZ33/ozKht40hHzYzNb1VcjofbVOXicu1IGFyf6FRrFHQPpRBMIXwO35TEvx?=
 =?us-ascii?Q?KmyIovk23pAPLtZK+k0Vkxv3ma2HAULJ52GEMgbY+kH6AhLwLKp+NcRHDAJu?=
 =?us-ascii?Q?xQ46t/yXKsyuEqpr52DUpUhf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356569e9-70e1-4128-53ee-08d8f89ddfa6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:02.0560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jzEP/OoRDwnuSv0hlJAINUt2oMFJvEt2DTmieYRv6QLL1bDe2e714hEC3fkKw9XqGQsc7nBCXHyAaQrWElDUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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

From: Philip Yang <Philip.Yang@amd.com>

Register vram memory as MEMORY_DEVICE_PRIVATE type resource, to
allocate vram backing pages for page migration.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig       |   2 +
 drivers/gpu/drm/amd/amdkfd/Makefile      |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c  |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 103 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  48 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   3 +
 6 files changed, 162 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index f02c938f75da..fb8d85716599 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -8,6 +8,8 @@ config HSA_AMD
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
 	imply AMD_IOMMU_V2 if X86_64
 	select HMM_MIRROR
+	select ZONE_DEVICE
+	select DEVICE_PRIVATE
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
 	help
diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index 387ce0217d35..a93301dbc464 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -55,7 +55,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_dbgmgr.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
 		$(AMDKFD_PATH)/kfd_crat.o \
-		$(AMDKFD_PATH)/kfd_svm.o
+		$(AMDKFD_PATH)/kfd_svm.o \
+		$(AMDKFD_PATH)/kfd_migrate.o
 
 ifneq ($(CONFIG_AMD_IOMMU_V2),)
 AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 357b9bf62a1c..b31bae91fbd0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -30,6 +30,7 @@
 #include "kfd_iommu.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
+#include "kfd_migrate.h"
 
 #define MQD_SIZE_ALIGNED 768
 
@@ -814,6 +815,8 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 
 	kfd_cwsr_init(kfd);
 
+	svm_migrate_init((struct amdgpu_device *)kfd->kgd);
+
 	if (kfd_resume(kfd))
 		goto kfd_resume_error;
 
@@ -862,6 +865,7 @@ void kgd2kfd_device_exit(struct kfd_dev *kfd)
 {
 	if (kfd->init_complete) {
 		kgd2kfd_suspend(kfd, false);
+		svm_migrate_fini((struct amdgpu_device *)kfd->kgd);
 		device_queue_manager_uninit(kfd->dqm);
 		kfd_interrupt_exit(kfd);
 		kfd_topology_remove_device(kfd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
new file mode 100644
index 000000000000..4bb39c562665
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -0,0 +1,103 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/types.h>
+#include <linux/hmm.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include "amdgpu_sync.h"
+#include "amdgpu_object.h"
+#include "amdgpu_vm.h"
+#include "amdgpu_mn.h"
+#include "kfd_priv.h"
+#include "kfd_svm.h"
+#include "kfd_migrate.h"
+
+static void svm_migrate_page_free(struct page *page)
+{
+}
+
+/**
+ * svm_migrate_to_ram - CPU page fault handler
+ * @vmf: CPU vm fault vma, address
+ *
+ * Context: vm fault handler, mm->mmap_sem is taken
+ *
+ * Return:
+ * 0 - OK
+ * VM_FAULT_SIGBUS - notice application to have SIGBUS page fault
+ */
+static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
+{
+	return VM_FAULT_SIGBUS;
+}
+
+static const struct dev_pagemap_ops svm_migrate_pgmap_ops = {
+	.page_free		= svm_migrate_page_free,
+	.migrate_to_ram		= svm_migrate_to_ram,
+};
+
+int svm_migrate_init(struct amdgpu_device *adev)
+{
+	struct kfd_dev *kfddev = adev->kfd.dev;
+	struct dev_pagemap *pgmap;
+	struct resource *res;
+	unsigned long size;
+	void *r;
+
+	/* Page migration works on Vega10 or newer */
+	if (kfddev->device_info->asic_family < CHIP_VEGA10)
+		return -EINVAL;
+
+	pgmap = &kfddev->pgmap;
+	memset(pgmap, 0, sizeof(*pgmap));
+
+	/* TODO: register all vram to HMM for now.
+	 * should remove reserved size
+	 */
+	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
+	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+	if (IS_ERR(res))
+		return -ENOMEM;
+
+	pgmap->type = MEMORY_DEVICE_PRIVATE;
+	pgmap->nr_range = 1;
+	pgmap->range.start = res->start;
+	pgmap->range.end = res->end;
+	pgmap->ops = &svm_migrate_pgmap_ops;
+	pgmap->owner = adev;
+	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
+	r = devm_memremap_pages(adev->dev, pgmap);
+	if (IS_ERR(r)) {
+		pr_err("failed to register HMM device memory\n");
+		return PTR_ERR(r);
+	}
+
+	pr_info("HMM registered %ldMB device memory\n", size >> 20);
+
+	return 0;
+}
+
+void svm_migrate_fini(struct amdgpu_device *adev)
+{
+	memunmap_pages(&adev->kfd.dev->pgmap);
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
new file mode 100644
index 000000000000..98ab685d3e17
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef KFD_MIGRATE_H_
+#define KFD_MIGRATE_H_
+
+#include <linux/rwsem.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/sched/mm.h>
+#include <linux/hmm.h>
+#include "kfd_priv.h"
+#include "kfd_svm.h"
+
+#if defined(CONFIG_DEVICE_PRIVATE)
+int svm_migrate_init(struct amdgpu_device *adev);
+void svm_migrate_fini(struct amdgpu_device *adev);
+
+#else
+static inline int svm_migrate_init(struct amdgpu_device *adev)
+{
+	DRM_WARN_ONCE("DEVICE_PRIVATE kernel config option is not enabled, "
+		      "add CONFIG_DEVICE_PRIVATE=y in config file to fix\n");
+	return -ENODEV;
+}
+static inline void svm_migrate_fini(struct amdgpu_device *adev) {}
+#endif
+#endif /* KFD_MIGRATE_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 5c0efaaebd8c..ca1b0c518d46 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -322,6 +322,9 @@ struct kfd_dev {
 	unsigned int max_doorbell_slices;
 
 	int noretry;
+
+	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
+	struct dev_pagemap pgmap;
 };
 
 enum kfd_mempool {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
