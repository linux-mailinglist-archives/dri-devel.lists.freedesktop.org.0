Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A014F1CC3CB
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 20:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113EF6E3A4;
	Sat,  9 May 2020 18:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770077.outbound.protection.outlook.com [40.107.77.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C446E3A6;
 Sat,  9 May 2020 18:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTMPTDlnsmspcXu8gq8P3ZLwIBqO/SaimONwX+N2KecXJnjp8zVHda27HqbWFhgaBwpCusIz/Kxkh8x6KrXJcnrsIf0+ea0H9ncHwZ3+16qxgVddnqDoveVJZzDtUG7ifpETTwL2cdy3AJFh1lWpciTEzL7rr4MyfPv1Hv8ICHxS8NQq0QOKjMhdqoZzfq6akvkEY2AmYDzAokL7zQxv62gbfZKBRqBPA02FgMaFLgi6vjE60LLY+aqOoXkwlrOmPWJUyHQWSab18LoWlDK3SFSCIVVBQeea7erQ8CckEzF7qGhA99/Sz+lWDD6cCBcUMQJuo3XTwqV9FvAqU8R7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OuA9hcXlbpYuljuBqRSfrNrMlTppY5+Bg2sEvxGFd0=;
 b=aJwWXJhWlUOQRjnAu9U68ldwwDQ0EqCQaIQFRShvVstTyhCmSDOXLGTkdi6jGwapaE67FiKb+r5giXbbuU2yeOyw1Ar9eaW4J/noKKh+qEq84mq3V/pMCye5zuMTzET0VAo3ffE2NTZX9toMwZ0+fiHKZ4LU4TsOwqMvogbgK7HKRyApadem5t2Fb9cR9nP52z2y1ymAYDH9nQ1+zM4NmnHBgPes78DQjk95YYjdlP0/tcsz5wowRHI0s1Pf+SBkuUiUGNisk31DbdpOH30SsjvIVK6xHJStoxsXBQsEio8hmIlNHR7HOIc5nM5ySrdt2viIwGbg6RPuZ4PC+lp89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OuA9hcXlbpYuljuBqRSfrNrMlTppY5+Bg2sEvxGFd0=;
 b=z/p4HAg1ZoTCoOHFGQjR31Lb2J/Uf7jOejJOs0W6A7WkPQAmShHazHu1wN0gpDSaW56yZZsP/cGH/TMDyt79PTyaG2R2/0ca/5B40kIKTJ3yclzpnRHqhVJ8FxG55sjW4gBIy4gqSMVywJrmkuwGF48/MTdt0FKtJpYMHRDWfPk=
Received: from CO2PR18CA0051.namprd18.prod.outlook.com (2603:10b6:104:2::19)
 by DM5PR12MB1290.namprd12.prod.outlook.com (2603:10b6:3:74::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.33; Sat, 9 May 2020 18:52:18 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::f8) by CO2PR18CA0051.outlook.office365.com
 (2603:10b6:104:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 18:52:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 18:52:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:17 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:16 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 9 May 2020 13:52:16 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/amdgpu: Wait for all clients importing out dma-bufs.
Date: Sat, 9 May 2020 14:51:48 -0400
Message-ID: <1589050310-19666-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(33430700001)(81166007)(8936002)(82740400003)(4326008)(478600001)(7696005)(82310400002)(33440700001)(6666004)(5660300002)(86362001)(8676002)(47076004)(186003)(44832011)(2906002)(36756003)(2616005)(426003)(316002)(356005)(26005)(70586007)(110136005)(336012)(54906003)(70206006);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 217e7184-cc46-45af-eb9b-08d7f44a191f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1290:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1290B3CA7EEC1B5231B567BCEAA30@DM5PR12MB1290.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4sYVdKyx3BHt+EewDiVroL6QgdHogh75B+nWf0/klEE1BnZmaNmcquU9rTr0vhcnjR7EztFDEfMYUQ2w2+u7NEdET00oIk8p2FC5NUxZCzuOEHOhqQdX0HLRWqOSGZR8xjzNo+SJ/fqIWneCm161jH3hLaxfQ64YDtJqqzuKsDrU27stozx067x02SqXqnyITlxjoJph386Az6qqp+cS5JFQtsG7Aw/X1X2YCZiMu8PMXUzNSHprh+u+bkjBtpiko9ognq+idKTgmDij50XIBL94IQOJQPur57g1KBkeHhacaOizdxua+phvLdlUtXSHCkBm7ombtK6teGxkYksUcvsjxi/3fpy2YDYWtRQZLnTgbbMg8iMXFeX23JAllMvRcklUXshdXntz+c7RxAeQqQoDbF67TxUdaIDo66Zp9DPdWqh+0wfbmgdh5BX3l2GvHtoh44vhupWHb60fDEKAGzdxg/eklfs44UUyi7cjO4oRzQsv/mTKzYFDMLzNMDWa+ZDUQVKtiO4N7Qhcy0wOKn516T3BfBE2fGfGzTHMtDRyxqk+SoqDa4Xoap7rjuz1HONdQKD0zlkB+6LNrXkeUQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 18:52:18.0795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 217e7184-cc46-45af-eb9b-08d7f44a191f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1290
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also avoid GPU recovery if device is unplagged

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++++++
 4 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 79274d5..f212622 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -992,6 +992,7 @@ struct amdgpu_device {
 	char				serial[16];
 
 	wait_queue_head_t		user_clients_done;
+	atomic_t 			exported_dma_bufs_count;
 };
 
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index ffeb20f..479ff98 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -36,6 +36,7 @@
 #include "amdgpu_gem.h"
 #include "amdgpu_dma_buf.h"
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence-array.h>
 
@@ -116,6 +117,7 @@ int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
 		return ret;
 
 	ret = ttm_bo_mmap(vma->vm_file, vma, &adev->mman.bdev);
+
 	drm_vma_node_revoke(&obj->vma_node, vma->vm_file->private_data);
 
 	return ret;
@@ -179,6 +181,9 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	int r;
 
+	if (drm_dev_is_unplugged(adev->ddev))
+		return -ENODEV;
+
 	if (attach->dev->driver == adev->dev->driver)
 		return 0;
 
@@ -363,6 +368,19 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	return ret;
 }
 
+
+static void amdgpu_dma_buf_release(struct dma_buf *dma_buf)
+{
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(dma_buf->priv);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+
+	drm_gem_dmabuf_release(dma_buf);
+
+	atomic_dec(&adev->exported_dma_bufs_count);
+	wake_up(&adev->user_clients_done);
+
+}
+
 const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.attach = amdgpu_dma_buf_attach,
 	.detach = amdgpu_dma_buf_detach,
@@ -370,13 +388,14 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.unpin = amdgpu_dma_buf_unpin,
 	.map_dma_buf = amdgpu_dma_buf_map,
 	.unmap_dma_buf = amdgpu_dma_buf_unmap,
-	.release = drm_gem_dmabuf_release,
+	.release = amdgpu_dma_buf_release,
 	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
 	.vmap = drm_gem_dmabuf_vmap,
 	.vunmap = drm_gem_dmabuf_vunmap,
 };
 
+
 /**
  * amdgpu_gem_prime_export - &drm_driver.gem_prime_export implementation
  * @gobj: GEM BO
@@ -391,6 +410,7 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
 					int flags)
 {
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct dma_buf *buf;
 
 	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
@@ -398,8 +418,10 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
 		return ERR_PTR(-EPERM);
 
 	buf = drm_gem_prime_export(gobj, flags);
-	if (!IS_ERR(buf))
+	if (!IS_ERR(buf)) {
 		buf->ops = &amdgpu_dmabuf_ops;
+		atomic_inc(&((adev)->exported_dma_bufs_count));
+	}
 
 	return buf;
 }
@@ -558,5 +580,6 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 
 	get_dma_buf(dma_buf);
 	obj->import_attach = attach;
+
 	return obj;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 0531727..11410a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1146,7 +1146,9 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	drm_dev_unplug(dev);
 
 	amdgpu_force_unmap_user_space_mappings(dev);
-	wait_event(adev->user_clients_done, (dev->open_count == 0));
+	wait_event(adev->user_clients_done,
+		   !atomic_read(&dev->open_count) &&
+		   !atomic_read(&adev->exported_dma_bufs_count));
 
 	amdgpu_driver_unload_kms(dev);
 	pci_disable_device(pdev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 4720718..20cf36d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -28,6 +28,9 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 
+#include <drm/drm_drv.h>
+
+
 static void amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
@@ -37,6 +40,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
+
+	if (drm_dev_is_unplugged(adev->ddev)) {
+		DRM_WARN("amdgpu_job_timedout - device is unplugged, skiping!");
+		return;
+	}
+
 	if (amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
 		DRM_ERROR("ring %s timeout, but soft recovered\n",
 			  s_job->sched->name);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
