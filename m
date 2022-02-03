Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BD24A810F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157310EB06;
	Thu,  3 Feb 2022 09:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3053610EAA4;
 Thu,  3 Feb 2022 09:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGnqOW8C7tO2NZnWV8dccTJ0UXEzvNW0Ax/MX4rHVGy47KSTVthm+nskTqDOlcMw8gToLTL8X7jH2eVQeTYcOSddR9934LPyAw07pgydKLyTzXPnaeRvEYdJdgaZ96Q6t6ssLlgMY2JJ3OV5eAuV5JrftQGyHdXav0+MQGpQtZs0vaf4EBuvhYh+lhmjElYrjSt741kHo5y49S7PJoMl7XjQjF+A4pE6SKt2nFswLEZBvdR3BEwQVcaBm/B/9WH3aDjQ1Ob0CuclQk4+/m8aXGy9iFwrYhS7AyA0hI1CvDs9XiCr4C11kYLAZj6y3Sp6qk+BwM3Oz17iixKGmLgvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRYXJ6m9BxedCTB7VqzbVBvfezD/i3q7S6gdWZQFECI=;
 b=c0hGjvXAxtLVEmRjSNfjO8lIDDUvCYwZYcMHeONUf63se94nnnej5VcBLPROfFoT3hTjXOge68qOiAsr7LqtnVMhBiMzxpxzG+rKsBjkgXRIF7/4IqU8xSItlYt3qZMUa9hWRMiWDVfkmEhG4okrT7TkThrViI9+JTSNcblp5OX6DiA1nGlfUpQVSTHxiwLGkdDGYTIfKfgyECpSBldTNSJ+azCpQeVlwutAmv0GDu65RHYZ1C8FUoPCmz2G5R0pCmikPKiyfKX62apf4/jCl9weX2JwV0kt4qsSDtye7Gwth8wmFkRcrYHynDuY6tdJxND6Kmsb5ikwIft1rmZUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRYXJ6m9BxedCTB7VqzbVBvfezD/i3q7S6gdWZQFECI=;
 b=l9+EB+3xjziV27TrqL5d4nOXK4sevsvrBmZedzfCxcz8cSnFsnxc8IehseBuY8/1Uv/lIydBLG1eSnVCyC+0Wkk9W+ED75LdI6qd5EldTro9H9da+0tLb7N6VzXT0J8kmWy5toLNTsmmCldCV8q0Yeh1ShOpi+EBPZre7IIjOdI=
Received: from BN6PR11CA0061.namprd11.prod.outlook.com (2603:10b6:404:f7::23)
 by DM5PR12MB1818.namprd12.prod.outlook.com (2603:10b6:3:114::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 09:09:44 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::c7) by BN6PR11CA0061.outlook.office365.com
 (2603:10b6:404:f7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:43 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:41 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 16/24] drm/amdkfd: CRIU export BOs as prime dmabuf objects
Date: Thu, 3 Feb 2022 04:09:10 -0500
Message-ID: <20220203090918.11520-17-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 018982f5-d39f-4af4-106e-08d9e6f4eb00
X-MS-TrafficTypeDiagnostic: DM5PR12MB1818:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB18185846FA3566D6C0CF1E2CFE289@DM5PR12MB1818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmDvT4m+OwmVQhPgKU8YUE6SjoXjN6Zu3c3BHfZELpXTuWCeI5rHjL3sujtyi9qzyxXa2wd5lqDnMmQaIGUtynqKJF339qgO3Ky1wmbw4rGe2rEZPdMeQpRezUm419cL2kBBrTNzU6NxUClclblQi9+sMUNCxuc6zh0rUFw5840JAGhZXbpTrPzyfuGhZo0ZrDRWEHiCQAEvZIprn09GwmAzJuvUEAUoM+BbdomuTP/eYpeXxLoIpJmrye8NlSEbnQIDWAl2Vqp/uCo/mebK1ucogizcKp2sa0uqmcyTLaBwyPaLkt+W81b9JQwmxY1wNy8snHny7OanYBCvtuKqU7upWmvfQ4pYZPZqwoIMD/gKJtMgzY1oARgoV8UYambHDxTSreAl/HSoFw5La3/9FjA7VYr7ZRY5/v12qDDCAS5buwk5YDu1SAJvbR4fjWgEW6rXO1vFrQ4pUk62sJOoeJMEpoqZu2TzbjRH9yG72x2Ipcjk60ZeRSI7ofEUttKNLCZR9D9BOtg+c75QJe9pou+lR1YUoFit6eK28HRVHRjQ3eN/8vJ02ZLO21uUohWkcIAYkPUIwedASr1xgdccIYtUswsGwKZU2vcbF84ElHXl+a9ltnwh47/MZ9AKMW+Py7XtRT8Qn2eCknvbKh70WNiAWWODI/wNDaKtfpzUje6i9a9Bvjv3jTM2EOtyQRBWpbZWLJ9tbGaFPA08D86jLA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400004)(44832011)(7696005)(508600001)(2906002)(5660300002)(86362001)(6666004)(83380400001)(81166007)(40460700003)(356005)(36860700001)(26005)(47076005)(1076003)(426003)(316002)(54906003)(2616005)(336012)(186003)(70206006)(70586007)(8676002)(450100002)(8936002)(16526019)(6916009)(36756003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:43.8069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 018982f5-d39f-4af4-106e-08d9e6f4eb00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KFD buffer objects do not associate a GEM handle with them so cannot
directly be used with libdrm to initiate a system dma (sDMA) operation
to speedup the checkpoint and restore operation so export them as dmabuf
objects and use with libdrm helper (amdgpu_bo_import) to further process
the sdma command submissions.

With sDMA, we see huge improvement in checkpoint and restore operations
compared to the generic pci based access via host data path.

Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 71 +++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 69edeaf3893e..ab5107a3fe36 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -35,6 +35,7 @@
 #include <linux/mman.h>
 #include <linux/ptrace.h>
 #include <linux/dma-buf.h>
+#include <linux/fdtable.h>
 #include <asm/processor.h>
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
@@ -42,6 +43,7 @@
 #include "kfd_svm.h"
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
+#include "amdgpu_dma_buf.h"
 
 static long kfd_ioctl(struct file *, unsigned int, unsigned long);
 static int kfd_open(struct inode *, struct file *);
@@ -1936,6 +1938,33 @@ uint32_t get_process_num_bos(struct kfd_process *p)
 	return num_of_bos;
 }
 
+static int criu_get_prime_handle(struct drm_gem_object *gobj, int flags,
+				      u32 *shared_fd)
+{
+	struct dma_buf *dmabuf;
+	int ret;
+
+	dmabuf = amdgpu_gem_prime_export(gobj, flags);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		pr_err("dmabuf export failed for the BO\n");
+		return ret;
+	}
+
+	ret = dma_buf_fd(dmabuf, flags);
+	if (ret < 0) {
+		pr_err("dmabuf create fd failed, ret:%d\n", ret);
+		goto out_free_dmabuf;
+	}
+
+	*shared_fd = ret;
+	return 0;
+
+out_free_dmabuf:
+	dma_buf_put(dmabuf);
+	return ret;
+}
+
 static int criu_checkpoint_bos(struct kfd_process *p,
 			       uint32_t num_bos,
 			       uint8_t __user *user_bos,
@@ -1997,6 +2026,14 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 					goto exit;
 				}
 			}
+			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+				ret = criu_get_prime_handle(&dumper_bo->tbo.base,
+						bo_bucket->alloc_flags &
+						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0,
+						&bo_bucket->dmabuf_fd);
+				if (ret)
+					goto exit;
+			}
 			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
 				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
 					KFD_MMAP_GPU_ID(pdd->dev->id);
@@ -2041,6 +2078,10 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 	*priv_offset += num_bos * sizeof(*bo_privs);
 
 exit:
+	while (ret && bo_index--) {
+		if (bo_buckets[bo_index].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+			close_fd(bo_buckets[bo_index].dmabuf_fd);
+	}
 
 	kvfree(bo_buckets);
 	kvfree(bo_privs);
@@ -2141,16 +2182,28 @@ static int criu_checkpoint(struct file *filep,
 		ret = kfd_criu_checkpoint_queues(p, (uint8_t __user *)args->priv_data,
 						 &priv_offset);
 		if (ret)
-			goto exit_unlock;
+			goto close_bo_fds;
 
 		ret = kfd_criu_checkpoint_events(p, (uint8_t __user *)args->priv_data,
 						 &priv_offset);
 		if (ret)
-			goto exit_unlock;
+			goto close_bo_fds;
 
 		/* TODO: Dump SVM-Ranges */
 	}
 
+close_bo_fds:
+	if (ret) {
+		/* If IOCTL returns err, user assumes all FDs opened in criu_dump_bos are closed */
+		uint32_t i;
+		struct kfd_criu_bo_bucket *bo_buckets = (struct kfd_criu_bo_bucket *) args->bos;
+
+		for (i = 0; i < num_bos; i++) {
+			if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+				close_fd(bo_buckets[i].dmabuf_fd);
+		}
+	}
+
 exit_unlock:
 	mutex_unlock(&p->mutex);
 	if (ret)
@@ -2345,6 +2398,7 @@ static int criu_restore_bos(struct kfd_process *p,
 		struct kfd_criu_bo_priv_data *bo_priv;
 		struct kfd_dev *dev;
 		struct kfd_process_device *pdd;
+		struct kgd_mem *kgd_mem;
 		void *mem;
 		u64 offset;
 		int idr_handle;
@@ -2484,6 +2538,15 @@ static int criu_restore_bos(struct kfd_process *p,
 		}
 
 		pr_debug("map memory was successful for the BO\n");
+		/* create the dmabuf object and export the bo */
+		kgd_mem = (struct kgd_mem *)mem;
+		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+			ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base,
+						    DRM_RDWR,
+						    &bo_bucket->dmabuf_fd);
+			if (ret)
+				goto exit;
+		}
 	} /* done */
 
 	if (flush_tlbs) {
@@ -2511,6 +2574,10 @@ static int criu_restore_bos(struct kfd_process *p,
 		ret = -EFAULT;
 
 exit:
+	while (ret && i--) {
+		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+			close_fd(bo_buckets[i].dmabuf_fd);
+	}
 	kvfree(bo_buckets);
 	kvfree(bo_privs);
 	return ret;
-- 
2.17.1

