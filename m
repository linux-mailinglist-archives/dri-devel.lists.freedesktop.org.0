Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC12BBD3C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36D16E97F;
	Sat, 21 Nov 2020 05:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFA66E97F;
 Sat, 21 Nov 2020 05:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmvGUDzIXfYR4VXAU0RvMjrP/rn3EQGplLTT9HVKlmLkiQ5RnoQCCsWLfVnrDNuoMOwNTr2OGHLNQ1i+mVLeAJxsWFa2RnEYDJlzqfWrBhHuJVDvZrq4uhXBqOfg5JNKtQMGFIfwmNQAzNk3/URXRhXgFT1nBh4/r71/bKXlROtJCPrtcRSkKw38SjGpH5pDm4DB7EGPdkLdA07/8t9sOQPI715GQvCVhovtj0sFe3364ej62HsJ+A270r2Tmx+vqrZeG4YR8V9pqtPuHhrXa6cjqD3FCnaY6xAhB9d4phf7WFH7II6XtOtFYOrSLhWqeKehLC99wSAyVNJxL2H+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqY3MPoJ7E3Hjx+D7G/m1j0155nPBhXI6kjk17Om+1s=;
 b=Lw9/8lTLFmvdMiGyTqeYaJEtWvJlvxwxQkmrqk99SY1VsVoV7XV+h77YggeO2mSXF+SouXAg2ksgfhTrwJl6uUKZ4a1cXeSzi6eqyR0zGfHEqbQkVoqTZ3DAjWz3tqTgtNWfp3dyhZWkEIQaPuDBUnIzWedXwd8G1pGDFsLi0JxiFEdJFrQInFTTNco2PsDyhTbHYQuKBdgrgVPKZcplI+azAovZRzY6IjU4AJuz1h6PUHtvb9Kgfcw2JAnTlEWqlUrv8BFT+Z21v2xwtkKorILY8OncP2D3f7e65mpH35q+4HmsakaL+JHY/sXfDmLkbrSM8kRfSB8yjrvTLD6NoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqY3MPoJ7E3Hjx+D7G/m1j0155nPBhXI6kjk17Om+1s=;
 b=tAhDQ/fu/TysS1QPF2rpr7XJTj2clAeGGLIDMCV23sXev/ILzcXltEUpA8J4qtpxaUxrv4ZgM2XWbnaTG1QGPyEYiWOwim1BtjAAd5osRU+r5SdcpEJDywtaWSwBPHm+V8Idr5nS5xcX4rzeg6AYlTk9jRcGCeOyhgnckxpV9C4=
Received: from BN3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:400::39) by
 BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Sat, 21 Nov
 2020 05:22:08 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:400:0:cafe::2b) by BN3PR05CA0029.outlook.office365.com
 (2603:10b6:400::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.9 via Frontend
 Transport; Sat, 21 Nov 2020 05:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:22:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:22:03 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:22:02 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:22:02 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 11/12] drm/amdgpu: Register IOMMU topology notifier per
 device.
Date: Sat, 21 Nov 2020 00:21:21 -0500
Message-ID: <1605936082-3099-12-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 598de168-be40-4e39-64f9-08d88ddd63bb
X-MS-TrafficTypeDiagnostic: BY5PR12MB4274:
X-Microsoft-Antispam-PRVS: <BY5PR12MB427454AFA460AE8B92AD174CEAFE0@BY5PR12MB4274.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2TStV9/+mI28xHWBZj6E9dghlE48IgWRZVbIO9yu/BktHG+vGXd8HYfMcAfEwWyNNyZYA6s8MwWqFEb1mqZ9tcpWvLXxTG9o/8X71VEbo55m5uNBtgw9xweX4YSrDyXiRkrWxfIK6Zc1XK3n1/gTMD0fQPbVoSJVRFumDy31cUhdcN/uN4+9oMiGi9RlELzU/2aQ9XhUHSyKir0TQAjwk6jpLUsRaNdHxWymWjBK+buGmN4pfqVhbz4lpgHIYwY1UjRs7u5dvfAEMSfPpKEjDX9uMhGLyoBzZ0cjA50kpWG+TXBYE2LbAQeOcmi4ImFdX7RetHxpgeCXZcKF9vm+PrzvE+1GF4KTvQpiCXQtHx3QpX/6sAOO4rLki/e38sTJtiCLYRwJSgf6UIlUtP9vw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(6666004)(336012)(82310400003)(316002)(110136005)(5660300002)(36756003)(7416002)(7696005)(356005)(426003)(70206006)(81166007)(86362001)(26005)(2616005)(70586007)(54906003)(478600001)(2906002)(186003)(83380400001)(4326008)(8936002)(47076004)(44832011)(8676002)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:22:07.2989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 598de168-be40-4e39-64f9-08d88ddd63bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle all DMA IOMMU gropup related dependencies before the
group is removed.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 46 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
 6 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6243f6d..c41957e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -51,6 +51,7 @@
 #include <linux/dma-fence.h>
 #include <linux/pci.h>
 #include <linux/aer.h>
+#include <linux/notifier.h>
 
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -1044,6 +1045,10 @@ struct amdgpu_device {
 
 	bool                            in_pci_err_recovery;
 	struct pci_saved_state          *pci_state;
+
+	struct notifier_block		nb;
+	struct blocking_notifier_head	notifier;
+	struct list_head		device_bo_list;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 96368a8..bc84c20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -70,6 +70,8 @@
 #include <drm/task_barrier.h>
 #include <linux/pm_runtime.h>
 
+#include <linux/iommu.h>
+
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
@@ -3179,6 +3181,39 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 };
 
 
+static int amdgpu_iommu_group_notifier(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, nb);
+	struct amdgpu_bo *bo = NULL;
+
+	/*
+	 * Following is a set of IOMMU group dependencies taken care of before
+	 * device's IOMMU group is removed
+	 */
+	if (action == IOMMU_GROUP_NOTIFY_DEL_DEVICE) {
+
+		spin_lock(&ttm_bo_glob.lru_lock);
+		list_for_each_entry(bo, &adev->device_bo_list, bo) {
+			if (bo->tbo.ttm)
+				ttm_tt_unpopulate(bo->tbo.ttm);
+		}
+		spin_unlock(&ttm_bo_glob.lru_lock);
+
+		if (adev->irq.ih.use_bus_addr)
+			amdgpu_ih_ring_fini(adev, &adev->irq.ih);
+		if (adev->irq.ih1.use_bus_addr)
+			amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
+		if (adev->irq.ih2.use_bus_addr)
+			amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
+
+		amdgpu_gart_dummy_page_fini(adev);
+	}
+
+	return NOTIFY_OK;
+}
+
+
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3283,6 +3318,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 
+	INIT_LIST_HEAD(&adev->device_bo_list);
+
 	adev->gfx.gfx_off_req_count = 1;
 	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
 
@@ -3553,6 +3590,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (amdgpu_device_cache_pci_state(adev->pdev))
 		pci_restore_state(pdev);
 
+	BLOCKING_INIT_NOTIFIER_HEAD(&adev->notifier);
+	adev->nb.notifier_call = amdgpu_iommu_group_notifier;
+
+	if (adev->dev->iommu_group) {
+		r = iommu_group_register_notifier(adev->dev->iommu_group, &adev->nb);
+		if (r)
+			goto failed;
+	}
+
 	return 0;
 
 failed:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index e01e681..34c17bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
  *
  * Frees the dummy page used by the driver (all asics).
  */
-static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
 {
 	if (!adev->dummy_page_addr)
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
index afa2e28..5678d9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
@@ -61,6 +61,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
 void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
 int amdgpu_gart_init(struct amdgpu_device *adev);
 void amdgpu_gart_fini(struct amdgpu_device *adev);
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
 int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
 		       int pages);
 int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index b191701..731c9889 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -94,6 +94,10 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
 	}
 	amdgpu_bo_unref(&bo->parent);
 
+	spin_lock(&ttm_bo_glob.lru_lock);
+	list_del(&bo->bo);
+	spin_unlock(&ttm_bo_glob.lru_lock);
+
 	kfree(bo->metadata);
 	kfree(bo);
 }
@@ -616,6 +620,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 	if (bp->type == ttm_bo_type_device)
 		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
 
+	INIT_LIST_HEAD(&bo->bo);
+
+	spin_lock(&ttm_bo_glob.lru_lock);
+	list_add_tail(&bo->bo, &adev->device_bo_list);
+	spin_unlock(&ttm_bo_glob.lru_lock);
+
 	return 0;
 
 fail_unreserve:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 621c0bf..b53b7e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -112,6 +112,8 @@ struct amdgpu_bo {
 	struct list_head		shadow_list;
 
 	struct kgd_mem                  *kfd_bo;
+
+	struct list_head 		bo;
 };
 
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
