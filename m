Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379E52A5CFB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 04:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C486E940;
	Wed,  4 Nov 2020 03:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B6F6E926;
 Wed,  4 Nov 2020 03:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TskDgZj4cs0fuJVuAbEhgpoSxPls1CdsdFrBn4Q+19VQCov1r9l2W5q+dTvrHIaOGYE6Muv9dlACzFzSfKfgbAP68q4lLmUmrrNlgHxg1AEfa9jB0U/vK29Yh7w/kDSGCcLEMDxNERsa4FvsA96i5ml+Fb32/zNz4Z84wUOUosVAXvK3GEY1bG9+pK26gzAdREgLcI1grQdBDZTit1UN7j16327IXS6IsFdACglzxRkUlTfw69pq9dWIB4ncIhaQpSpMBiepo+/X8x2KR9FX57OM0MXJJhhnPW81MwjPKI3RJH/W1Tf6IGK3XGtktejvkCs8+K9DLMFUsBT7OFU1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKdVy3L+i1pmqiTE7HqYcUPCDNEwNY2nzoMsrAlopDk=;
 b=d+nbFD7b+Ix0NFM8b5oMl0WJTr+Bx6gsm+rheMRkXDyGqx70kZ8may+fQEESUYyu+zcPanlqOmA8nS5KLcp9gXdI7IpK8HUPMMU7ScNTSmQJUVse1VWWBVLWe+57jh3/PuUm25CgKjqaRIFmRv9pLlKn+XoWQYr6mw2tdvvAP0pgIMbuHJGlFa6dLptvVMam6q7+kfN94bEsGVAfoPkZ/mHlzg9qBDtOmm2JQ6Z+oU6TDPGefLBk2vYglX1AJNpuaWbnlKGQ1GkQHQBUK+LxiJVuF9A7NfGePGR2clddPMqUa/nxtTjbTl+2/rUiocP9/SWGdJbQ+sUEzN+eHi2viQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKdVy3L+i1pmqiTE7HqYcUPCDNEwNY2nzoMsrAlopDk=;
 b=cfwWtphzEuYcqxXSfX0XdgUkKpfifWIPKLdGDPL8MRWWuJizWd/Rf0Kydl15H5O7HTSGJ1CY1OJ46/IGjJkvMrbKXVkdoPfkGGtaao2YkVZiygWhyNy6yrrfvpigjcGtdSzz7NRL+hiphyzdYVAFK2WtXu8Ad82MQ1xoPwhgIkE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1770.namprd12.prod.outlook.com (2603:10b6:3:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 03:11:49 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 03:11:49 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: Make struct drm_driver const
Date: Tue,  3 Nov 2020 22:11:29 -0500
Message-Id: <20201104031129.361178-3-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.154.g7f7ebe054a
In-Reply-To: <20201104031129.361178-1-luben.tuikov@amd.com>
References: <20201104031129.361178-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 03:11:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b67e9ef-6a8a-462b-181b-08d8806f5e14
X-MS-TrafficTypeDiagnostic: DM5PR12MB1770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB17708C18987B8DA3756D8F2899EF0@DM5PR12MB1770.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SyRzmKuKtGRLOq5wUUol4foXXGSKm0t+dFI7WVc5Y9xDX/7xqSOx0K1lYcgB1UD0OZJBn+wlbqfqlJIrHBhWAIDGqDe5VzMN9yqxT5WTbMq88gHsRGJoDVyNwsjUXcShfubtSeu1XS8SKSR9PgYN4Ea+6DRrSWAi0KAlOZRIqsfg1Cs5+XDVhMjEHLI5WaYTxtwrsWj6dFO4er0JMot1ChyUuUEe3Jz/F2+Q76K9T300FYvAxa7+Lq/xUSlxX4G2NOvu3eyP2Kz/hfKa6TxwRSR8zQ/T9EJfH5pQZxUkNZ4HaVVrVQCZnU2oMl9HwybdmLX9tg1EzdP8oW6k5CptLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(5660300002)(36756003)(186003)(7696005)(2906002)(44832011)(6486002)(16526019)(6666004)(26005)(478600001)(52116002)(2616005)(66946007)(8676002)(86362001)(66556008)(8936002)(54906003)(4326008)(956004)(83380400001)(1076003)(316002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nzYSsLkh/I+JQ3Qk4M9SlT7ZoppxppGEf2/wNBol93x4DdoB+9NNFCawibW6vdTxavoTJAfhfcBcwdzrXjguciHd+zumfY1ew+cjETAL7Fkd7jwHa3rSxJZlwiVbaj7d5kSEQyJyAyx9C/16VYtIGxmuM8tfADaoMnifFGRCg/fZWWEsB0z6IgmGEzKhw1S0o7M8D08tnkAezcrGz9fEsAmz6H7hpBqkdzjCU9iDLiMOyhxCYEHUS3mXiLPDUP52Mf+DY6cObV34nZugID11yp8SbQcdApWhOnCJ5R4MQRf7VoSv5Elblm9xtW3H5wpybPJfcCxRHkARclcdU9PDFwZpABHGyylGfdVH7P0aoh4Psh0ibN9NkCRrk0+7z+Qpgp2kF3NOAoMDzH0bd9e8l01hzP8g9wpfpldcXIH7FQ7hQR8T1sbP9irbcFVWELrCVlnnWVeqQI3oOzpu2uGHDNSJdX3pQ/uNrZqd9xFi8bYPGHtUizdKAXPv57pVwmYdd9guPLUw+Iik+GE5pt1G1acwQXrJvTY/Emq8B2T8KmheSGkVXIPjRKdzJ05cJMCbJlOhZXhetc8DOvXGPrABd/yo4KQMDivmUYuU2XqFLB8WhoXiHBInimcDAljPtig6PoGa3uOgWSiK+i7JER5fmQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b67e9ef-6a8a-462b-181b-08d8806f5e14
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 03:11:48.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3H35B4cx2TAUfnAbmIG7L/WxUeb8W0LsCkZCdHqKDkuwbALae5GbjNV+AHnWFNw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1770
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the definition of struct drm_driver
a constant, to follow the latest developments
in the DRM layer.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 32 +++++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 25 +------------------
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e5bee56e06d1..be304df7a8c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -40,6 +40,7 @@
 #include "amdgpu.h"
 #include "amdgpu_irq.h"
 #include "amdgpu_dma_buf.h"
+#include "amdgpu_sched.h"
 
 #include "amdgpu_amdkfd.h"
 
@@ -1105,7 +1106,7 @@ static const struct pci_device_id pciidlist[] = {
 
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
-static struct drm_driver kms_driver;
+static const struct drm_driver amdgpu_kms_driver;
 
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
@@ -1183,7 +1184,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	adev->dev  = &pdev->dev;
 	adev->pdev = pdev;
 	ddev = adev_to_drm(adev);
-	ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
+	ret = drm_dev_init(ddev, &amdgpu_kms_driver, &pdev->dev);
 	if (ret)
 		goto err_free;
 
@@ -1528,7 +1529,30 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
 	return 0;
 }
 
-static struct drm_driver kms_driver = {
+int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
+
+const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	/* KMS */
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(AMDGPU_FREESYNC, amdgpu_display_freesync_ioctl, DRM_MASTER)
+};
+
+static const struct drm_driver amdgpu_kms_driver = {
 	.driver_features =
 	    DRIVER_ATOMIC |
 	    DRIVER_GEM |
@@ -1539,6 +1563,7 @@ static struct drm_driver kms_driver = {
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
+	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.gem_free_object_unlocked = amdgpu_gem_object_free,
 	.gem_open_object = amdgpu_gem_object_open,
 	.gem_close_object = amdgpu_gem_object_close,
@@ -1597,7 +1622,6 @@ static int __init amdgpu_init(void)
 		goto error_fence;
 
 	DRM_INFO("amdgpu kernel modesetting enabled.\n");
-	kms_driver.num_ioctls = amdgpu_max_kms_ioctl;
 	amdgpu_register_atpx_handler();
 
 	/* Ignore KFD init failures. Normal when CONFIG_HSA_AMD is not set. */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index bf01744a38f8..4f72c096b3c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -29,7 +29,6 @@
 #include "amdgpu.h"
 #include <drm/drm_debugfs.h>
 #include <drm/amdgpu_drm.h>
-#include "amdgpu_sched.h"
 #include "amdgpu_uvd.h"
 #include "amdgpu_vce.h"
 #include "atom.h"
@@ -484,7 +483,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
  * etc. (all asics).
  * Returns 0 on success, -EINVAL on failure.
  */
-static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
+int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_amdgpu_info *info = data;
@@ -1247,28 +1246,6 @@ void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
 	amdgpu_irq_put(adev, &adev->crtc_irq, idx);
 }
 
-const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_VM, amdgpu_vm_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_SCHED, amdgpu_sched_ioctl, DRM_MASTER),
-	DRM_IOCTL_DEF_DRV(AMDGPU_BO_LIST, amdgpu_bo_list_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_FENCE_TO_HANDLE, amdgpu_cs_fence_to_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	/* KMS */
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_MMAP, amdgpu_gem_mmap_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_WAIT_IDLE, amdgpu_gem_wait_idle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_CS, amdgpu_cs_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_INFO, amdgpu_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_CS, amdgpu_cs_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_FENCES, amdgpu_cs_wait_fences_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_METADATA, amdgpu_gem_metadata_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(AMDGPU_FREESYNC, amdgpu_display_freesync_ioctl, DRM_MASTER)
-};
-const int amdgpu_max_kms_ioctl = ARRAY_SIZE(amdgpu_ioctls_kms);
-
 /*
  * Debugfs info
  */
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
