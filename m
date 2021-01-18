Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79F2FAC1A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E69F6E5B9;
	Mon, 18 Jan 2021 21:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC916E5B2;
 Mon, 18 Jan 2021 21:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfvZnEOebs1JaZBIQyQ7PDRE48RD3RHsE0EOPqI1JDFyn53hJOBM0dy0qKyIPEHpqDiJNHfljC5f2LDW2hgMIEUKoqf2ezIIqwYFcPyYa3zePdedEmMinBaSHIfwjgTbDI+fUBiMA1zOpC5MxooHnFoIPuRRiSU2D6hsun7Sy9z5sgUcIIrdtAv7ldX7+mgFuBanjVv7r758YsjncWkxdaLElrU4ILmXZvVPPousjebdktDtjEhqPkVMBeEBXZLRJspnLdZHN4Oi86dgv5Lsl6J68mT2etRC9yk7mwgqQ6An2uOG00N7uyRhV4XSPuZVGPFpZ8DVETQBX0OHX80iDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PfpSublj3Y8be2ajDdC2ctToz/Q9I2bjgB+BMJxNH4=;
 b=byFl/JPzmyeZgbDKsNmFiU0trh7Ayobd4mIyUOh2Z4ej/SA1ZFJ5IXZZdwPpkbVA3lwWxDJOJO2KBYaey4Z6TBYAGmRIjTcm1QJHiKk/DHfO7Q+dYqT4qA9kqiW+FBvy/THPA3tJEZsJGwj+wrZ8LfO+qxe/YYAfdl8maa9jRXt3KzvJu046ZDF8Yo1Q8CGDwv78VQGLtDwaqKa2RQ/9ZAN1WIsS1CnuAii8TCnzJxMajzEjOJsTdwxdmZPlRxnp4QCnwSxCBPp0JaY2Xm/gfjS8sJyobphhaH6EFjDseMAxOSX4MCbQjMq7elQUv+Bs+EOWA1bWQGakx6EEsTb/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PfpSublj3Y8be2ajDdC2ctToz/Q9I2bjgB+BMJxNH4=;
 b=w8Fp69HhRbpmJd7fia1Tf7n7QftxzkaSPP9qDGiWYpCaCyoBknDmjtJV5Z6YM4k6+JjvWmLjaDZhqXlRpHs9987iWzMcLfzDZJpnBLexaeH/gsJmL2ldbu/jP9G03gsq1TDjLP+B/bH4W5UMtCKZ7wojSyiD6XljKU5oYVPS/ck=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:33 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:33 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 07/14] drm/amdgpu: Register IOMMU topology notifier per
 device.
Date: Mon, 18 Jan 2021 16:01:16 -0500
Message-Id: <1611003683-3534-8-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dabe95af-f14f-4b55-d368-08d8bbf45ff3
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767220288150B1BB1489ADBEAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2YqEXsmnlUw0Cc/m4u8GGhc9fOuRZj1o36PGuMREQZDDevFqNplj6XbYCftrHxUkd4XtBusFdtRkArWZ/WVdNekQpkUKOqg/kKNchDekFCB7AAxDIDo8YpAn2w71/5E4Q5FuB/ftHlhZkEqj8BULTES8lhhUXm/uT/IznSSJZV0MdIXzNI0MPzEJEeM0/5pxY9WAfPGf+mcsYb3AJTmalwo89reX+3PHSS7WVuBOILtTb49YNClLxvIyEoGfRThcw7F3oQ+h08ciTKI8mCWjK4vBRcWVd1v5UcdeQRZaJbLZ9Wc9l6Ug3bFviUK30icZ21oimTIlPlnV6n09XhXH7tQ3fGGbBVmPdirMDkw0RmlH/Kf7LXoxmMGL0cFBYblT5JQHjRdt7tYqqw0c5mGuMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?p55WdWnf3CyJrxza/vPha4vlCTVW3WnwXBkBNGII+zR4OaurFSF2d5MjiLwH?=
 =?us-ascii?Q?3mEk78HVlpd9SpVnWJt4h0Q4A2UvAX8vkYU3UVgw5DlkZrRfDyDUrcEFTq0H?=
 =?us-ascii?Q?8ZcY0akLQMyxDo1XNKRYHGwextJmX+jKxOkb/2/J+XXLJ/zg8XnFskRJJoTa?=
 =?us-ascii?Q?ZaQLIm3pvZwgb7xpTJ5hfm8D+DaFuoavoSF+vYECCHl2azicGRIw43HpXU2t?=
 =?us-ascii?Q?8KYgHLIgGWk/Ao0z8SM3lTsoonw150LtMMIjSHrci2iGxPSvUsK38qf0wxgG?=
 =?us-ascii?Q?55SOVMbK1epZV2mSt8fSb9mPz8lBQX92qRATIoKjPNs5NVTQzhGYct182PEO?=
 =?us-ascii?Q?EkyDmkbLz+3e2+ptuLMEHR/4k90GI75X/oyAB4AxvBDD3ZdVdd0B1UlAclGq?=
 =?us-ascii?Q?jN9+NjjvSGUPwkivKeKFd1SZV+iOSImgR8jyv3gllvOAAL2rdHob9TGzoUmu?=
 =?us-ascii?Q?3RH+9eqhFJ0SeCVQapmSVUffe7TUEQ20TAJZ/mXchZF6O/qGslbJIqviLK4T?=
 =?us-ascii?Q?MXq4uG06WTCG83WIxS3yhSW9i155QhF9IpA9PWGBYqSo9IIRtcgmezRWOFUK?=
 =?us-ascii?Q?DuqnM6YXNS6zC4WFhHz5XtEDq5v7Sp34cNs6xnoRFjTX4W1OePI3Stepd6Nn?=
 =?us-ascii?Q?5XLmtIjDUATvlQLFh6OlIUqwNL/lVLH6fqsVkq7+4C2Ssc6lj59FR3yecv8C?=
 =?us-ascii?Q?Vy/HjdD7/ZNq2BYuMc2SLxYM63f36KhDJN750cIDl/l8ccvZi+YH57+02oL/?=
 =?us-ascii?Q?h5R3pCF8slPO+D/+N4KHcD6MPrJz8W2uj9j1eDihujcOLGHAVP1oaT5XZke/?=
 =?us-ascii?Q?Lq4/zsxf4imke0f3l9Qr1IwllsUwp90ggKS3BFgOIrulUfOdezWXsqxmYfFm?=
 =?us-ascii?Q?8CqG4cQojGZrviBK+xjzlBfyztyrPeLkIZNZyhMwdr/kOIYoCJpJT5OWBhgf?=
 =?us-ascii?Q?2v/LNBSoH7pLNOPal3GePMK7h9EOj/qGhxhr52GV07jtun15Zfz4A7GScs4n?=
 =?us-ascii?Q?iQiPW8l7pFnO/B5ChoK3LK9vU2Z8Xxb19K5bzmJk00VNrcz4L9YR86DrcXaK?=
 =?us-ascii?Q?nWpDeu5lfbDXU5+jHh6YeBGwVEi+KmByG7zYRRmL6sWcOT4iHekQ4U6yECJU?=
 =?us-ascii?Q?bHSJgrq9vke8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabe95af-f14f-4b55-d368-08d8bbf45ff3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:33.1543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8UcuFLycGT8JJjlaPjlggulrO+wDRCEAYXmY11JxYzpgpoUAypFCczzHS0vxKT4eTqu6YP4ulzXRmivAJSwPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
index 478a7d8..2953420 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -51,6 +51,7 @@
 #include <linux/dma-fence.h>
 #include <linux/pci.h>
 #include <linux/aer.h>
+#include <linux/notifier.h>
 
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -1041,6 +1042,10 @@ struct amdgpu_device {
 
 	bool                            in_pci_err_recovery;
 	struct pci_saved_state          *pci_state;
+
+	struct notifier_block		nb;
+	struct blocking_notifier_head	notifier;
+	struct list_head		device_bo_list;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 45e23e3..e99f4f1 100644
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
@@ -3200,6 +3202,39 @@ static const struct attribute *amdgpu_dev_attributes[] = {
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
+				ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
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
@@ -3304,6 +3339,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 
+	INIT_LIST_HEAD(&adev->device_bo_list);
+
 	adev->gfx.gfx_off_req_count = 1;
 	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
 
@@ -3575,6 +3612,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
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
index 0db9330..486ad6d 100644
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
index 6cc9919..4a1de69 100644
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
@@ -613,6 +617,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
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
index 9ac3756..5ae8555 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -110,6 +110,8 @@ struct amdgpu_bo {
 	struct list_head		shadow_list;
 
 	struct kgd_mem                  *kfd_bo;
+
+	struct list_head		bo;
 };
 
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
