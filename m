Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF936DB06
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044436EB83;
	Wed, 28 Apr 2021 15:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE16C6EB57;
 Wed, 28 Apr 2021 15:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJOre0fKxQ5qErjLk4lUTm6seVSqiqSisuKZy3/JOcJbUU1pH9474Obn/ItMl8ackmlgBxh8bxbdIUtDAM1sQftw7IcLaYDQqJsTCAxdtb+61J91DkWH8KLE7+rU3q+pS/sCJczSRhC/VnxViKn50l0MjAnGHnPzpraRVnMgN7aAZPNbLFxrpAotV70oSu1QHQOQAkGFNHls6Ez1n+ZjJoI9j/eGuLpOnT553GRhi9xLemdB+EpJ8qS2k/jVm/7Hk5AjQQO3rDy/kTk8NCVyT1meWZ6tp3VXUOe64KYXuwYe6LgGF3GOVAZGA0SgftjO1NUaVm37/2nTBlRJqpnz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm9+Re3MVZqxQaS+3rJ45V5zTs3+cQ6nUJPLgZ05SgI=;
 b=LFCKMRxgkDDzlVOiWnltGAVf4ugirUIFUMOiGAc51biUawYsGGUOm8UtigK6PUmtStNQhIDPGggQFvokgiPfhS1h6356+B2wXSnYhko2DfqzPmdtHpmJSQxhfDI0SwjD6J/Ak2CrTKCMyschemdz8AXGkpn9VyWyeObW9AV5NrLUlXZEo4S12paSbvOX/PFlx3TW8ZOTlFGYVXNNnwTMU9i476dYXvuJVyPblGem6W4vlz2PT+TfUx427pBOO9Dxn/+DJK5rz9oP0AoeA7s1HP2xkgdI+C8viq9tX2dnXv1WAYkxtbKcm0Myrvl71TtF0QrvKxBjNwx59wIse3q3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm9+Re3MVZqxQaS+3rJ45V5zTs3+cQ6nUJPLgZ05SgI=;
 b=PXRB0idEqdEsFf5iM6cpeeOBO8pX5UAjCelg1ns6XT0z491ES79neEtO5bs5d0XZw5Au9+ltUputpno438ytrRrmAc76qqYfCHbHkvPnibYEr7PixR3sIWdWViaoG18DSGH8/0Xy6+fcQNaNIuANjKSW11m9Q3LUPDJ1C6s278A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:42 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:42 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 06/27] drm/amdgpu: Handle IOMMU enabled case.
Date: Wed, 28 Apr 2021 11:11:46 -0400
Message-Id: <20210428151207.1212258-7-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 741b2d6c-1721-4dc0-2e38-08d90a581213
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462E07F7B9FEBD7C1899781EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0oxsyd3X2WBWWhb85203+iVuphChFTL92+PuRmRCci3O80x60NwvddIuqnhagi8la86dCjcfU0ljXLhDh3ofTJsVlVV4uvixSAiHB+Sk04sGLrgGa34Dj77l7wwmuULxL//Db1d6ZvIW9Lv1AzwOAIibcqoU1yVThy+/cn1XhhtM2ibo0jyEoTSGeW2+YvSF2s6NJHuwiy5XODSGlUAB2O+w3+PcNaIPnE4wLoMMlhylkoDpKS6nQ9u6IV10PMBluPXGYGv18ePuO9KRYII4vz7ckSmTjZgPKpAuFVtLTseKVUJpthRBYilm9cB8mrUOj/0sYLanaphWlzDPVLEszJ4Ss99VjtbFkdaknr+d+0AHivw2lJJDp/ujC1ewmDJJJAZCL4rkP1CDKTo3t0S9oHl6ZUYVyCM2vBQOyabF781dbPS8eCcl36OSppwWbtJTBAG+B/t/93hyknggutB0cP0YgWBzqstaWZsOcu36PPobIzp6q33fLHezPBzDAOknvNgno8SI80b7W+FtgYxVrO0ticnLhghRbkdmgLHEzPl3mYAt0Z92cBjbxiX+E/xEnQQlVSmSb/8znhN6Tx6jz4Galk1u/NPhfjXpKikUWu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(30864003)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6oFukTA0+165jaG6WQTqLY8YF+iDPmxTsDp5d4HduRGt5wmUk5MA43KadX3k?=
 =?us-ascii?Q?OdYqxQe0rycg583nQ8p9BYLO9j0WOOfzc9Zj8gjqT1cO/xuGa2x+D4RS3+Bt?=
 =?us-ascii?Q?3U8WCdU4YvJNPjLIsUD955Qxd8f8lyW0kgMtmcxeWDo2ogu7zxw7JtnA5KD4?=
 =?us-ascii?Q?GykWIaptKBBXRjGEvW5+pMhtsGX4yKL+QrC+lvqe6Upe3UjT4GHV1EvohHB2?=
 =?us-ascii?Q?G8MbMUL9toX8SbfdiAKOriZ1WxlE3mjdRLnMaEq3c0rzKk7Ft6wJ/yh1QAIj?=
 =?us-ascii?Q?h1vphTOOgwGw3kir+juqSzD650mGgzYU6mW3VwcpEBtiiRSS66NH9P+ukbAC?=
 =?us-ascii?Q?m+g9D7ustxb9xqkI8HohtUe2rOcqQ2BpjxE6HBm2XqlJUb+l56BGbsPOsg5h?=
 =?us-ascii?Q?NeMu+m88G6Ut//lXC6prjLAiN7PsE4CvWFbbXPSRLDBnofghmXcOoA0qHBGE?=
 =?us-ascii?Q?fciYFjmPujFh/i7m+O2JoJ9C/0zLMDv1c8g4C+Whnft/S4fdWDgSiftsWGUA?=
 =?us-ascii?Q?+8czvhX0oCO/z78fuEHFwXoHNa4n+AkA+fOH08cjXMDDWpD3eWckZwdXlUbF?=
 =?us-ascii?Q?pymSc9gkT5PZhT9GUfq/ocisIel7Y17dYexVgDyrcE/XmHamc2ykos1JCbRA?=
 =?us-ascii?Q?+XmlS6j6U/x/vi5Ld4XRg2GxmQC4GalS0yRAAUYQpVZcLHtNkjXX/dNf3viX?=
 =?us-ascii?Q?vg+JsIMj1xbmbBeM/tJIkzlvSd7EoFVAoHduk4LFkUmn9xFlQgbveYvUa8YK?=
 =?us-ascii?Q?1sk90pMSY52Kwm8XUkYeHRkIfey1yVZyXbgPRrEgnD19u8l/VKF6iwONvR4L?=
 =?us-ascii?Q?YAK4DyRrCJN0xDY/FZ194AZ3v9leduQBXxbLgAIcFY7PNarxyFXtgBClSii9?=
 =?us-ascii?Q?WHU0N8zmwY5Sy3zd5PUHwFm4unizpULUiq/SFlfyAcojlDDXKg/gedK8FyCf?=
 =?us-ascii?Q?La0XJKSLLq9bKrsrOLaAFemYlomVO1ch6YDH69NFYF89dwnCTr/dVmdk77TZ?=
 =?us-ascii?Q?fqcfZM9vkq5sF0HHFX5PQl260EZUbJgXVbqdSFeJtQqmgYfLWiIPq9gluXH1?=
 =?us-ascii?Q?GhbA1tD9FdgIbAnSwCj/Mm8gsgkDC+ybl1ycKGqlAJLs+vNWpRCkjF46bHmu?=
 =?us-ascii?Q?ZihM66cLO0WzFrhf+BNUsjvpooP/yiDU3jZjJUm1qIJH0STmNFE1TTQQO0z5?=
 =?us-ascii?Q?ttx5sp6fZNL+XRel2tP3h7LWijEt4uEQKYnNa9rV6XLXzJ/51H+yLWeESzmv?=
 =?us-ascii?Q?+YW89JIgsJ/2rKIw/D5NxS2FcbYQFFJWsJPsBCRs310dht6036+8cr7F+JMi?=
 =?us-ascii?Q?yAtfhVhumUj+zT6AQSBE2YboEm09+JKf/ygJ2O6UunwLUPBOa1MPG4Ussvcs?=
 =?us-ascii?Q?jEEYRVTi+KCR3gUQgUOsNizoKcfz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741b2d6c-1721-4dc0-2e38-08d90a581213
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:42.7621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WusCMnsELmbQTGD0cIxuQQM1S1yZmRWgyezUjXmyEyG+dWrgCPV9t+rNJ1WiJbK7OyrEV89q3OuxwekqRocmOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle all DMA IOMMU gropup related dependencies before the
group is removed.

v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  9 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 ++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
 drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
 drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  3 ---
 drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  3 ---
 14 files changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index fddb82897e5d..30a24db5f4d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1054,6 +1054,8 @@ struct amdgpu_device {
 
 	bool                            in_pci_err_recovery;
 	struct pci_saved_state          *pci_state;
+
+	struct list_head                device_bo_list;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 46d646c40338..91594ddc2459 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -70,6 +70,7 @@
 #include <drm/task_barrier.h>
 #include <linux/pm_runtime.h>
 
+
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
@@ -3211,7 +3212,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 	NULL
 };
 
-
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3316,6 +3316,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
 
+	INIT_LIST_HEAD(&adev->device_bo_list);
+
 	adev->gfx.gfx_off_req_count = 1;
 	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
 
@@ -3601,6 +3603,28 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	return r;
 }
 
+static void amdgpu_clear_dma_mappings(struct amdgpu_device *adev)
+{
+	struct amdgpu_bo *bo = NULL;
+
+	/*
+	 * Unmaps all DMA mappings before device will be removed from it's
+	 * IOMMU group otherwise in case of IOMMU enabled system a crash
+	 * will happen.
+	 */
+
+	spin_lock(&adev->mman.bdev.lru_lock);
+	while (!list_empty(&adev->device_bo_list)) {
+		bo = list_first_entry(&adev->device_bo_list, struct amdgpu_bo, bo);
+		list_del_init(&bo->bo);
+		spin_unlock(&adev->mman.bdev.lru_lock);
+		if (bo->tbo.ttm)
+			ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
+		spin_lock(&adev->mman.bdev.lru_lock);
+	}
+	spin_unlock(&adev->mman.bdev.lru_lock);
+}
+
 /**
  * amdgpu_device_fini - tear down the driver
  *
@@ -3639,12 +3663,15 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 		amdgpu_ucode_sysfs_fini(adev);
 	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
 
-
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
 
 	amdgpu_device_ip_fini_early(adev);
+
+	amdgpu_clear_dma_mappings(adev);
+
+	amdgpu_gart_dummy_page_fini(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index fde2d899b2c4..49cdcaf8512d 100644
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
@@ -397,5 +397,4 @@ void amdgpu_gart_fini(struct amdgpu_device *adev)
 	vfree(adev->gart.pages);
 	adev->gart.pages = NULL;
 #endif
-	amdgpu_gart_dummy_page_fini(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
index afa2e2877d87..5678d9c105ab 100644
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 63e815c27585..a922154953a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -326,6 +326,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
 		if (!amdgpu_device_has_dc_support(adev))
 			flush_work(&adev->hotplug_work);
 	}
+
+	if (adev->irq.ih_soft.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
+	if (adev->irq.ih.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih);
+	if (adev->irq.ih1.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
+	if (adev->irq.ih2.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 485f249d063a..62d829f5e62c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -68,8 +68,13 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
 		list_del_init(&bo->shadow_list);
 		mutex_unlock(&adev->shadow_list_lock);
 	}
-	amdgpu_bo_unref(&bo->parent);
 
+
+	spin_lock(&adev->mman.bdev.lru_lock);
+	list_del(&bo->bo);
+	spin_unlock(&adev->mman.bdev.lru_lock);
+
+	amdgpu_bo_unref(&bo->parent);
 	kfree(bo->metadata);
 	kfree(bo);
 }
@@ -585,6 +590,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 	if (bp->type == ttm_bo_type_device)
 		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
 
+	INIT_LIST_HEAD(&bo->bo);
+
+	spin_lock(&adev->mman.bdev.lru_lock);
+	list_add_tail(&bo->bo, &adev->device_bo_list);
+	spin_unlock(&adev->mman.bdev.lru_lock);
+
 	return 0;
 
 fail_unreserve:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 9ac37569823f..5ae8555ef275 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -110,6 +110,8 @@ struct amdgpu_bo {
 	struct list_head		shadow_list;
 
 	struct kgd_mem                  *kfd_bo;
+
+	struct list_head		bo;
 };
 
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 183d44a6583c..df385ffc9768 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index d32743949003..b8c47e0cf37a 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index da96c6013477..ddfe4eaeea05 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 5eea4550b856..e171a9e78544 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 751307f3252c..9a24f17a5750 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 973d80ec7f6c..b08905d1c00f 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 2d0094c276ca..8c8abc00f710 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -525,9 +525,6 @@ static int vega10_ih_sw_fini(void *handle)
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
