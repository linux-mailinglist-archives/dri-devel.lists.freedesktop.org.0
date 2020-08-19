Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED9324944C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 07:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76956E19A;
	Wed, 19 Aug 2020 05:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700087.outbound.protection.outlook.com [40.107.70.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45789B18;
 Wed, 19 Aug 2020 05:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYKFdRuWSlBUhE5dkba8hixnHiD8fG4aU1BDkMEkABii1VaElnCo7vgl9Of4BEyG3KQZKloHMKF/EhqBkH1J6Yoa0SX7wOVPBStWWbNFDQbz/AEQH988x9Q992IsZstqpPHHXxbxr2sKFKEgShrRw1CbCur0r9rYHRjmVxXzK2x1UDm9PQusTlrosY/gjt9FIWiS7TZdnrW61B0/23V1FnD+BfBOOLRiCIvX0Rlco31/epLGcE1Gil72hC65ilXCdwbBzpFUZRr/YIQjnoer4kdGIfA6JL/JywA3AbOa33ZjEE2fWlcEDI97ZDxgoHXUO16j9iliSKaHYKkeROoD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xfxbr0r8PaliDgYAdQ+81TBjvuoGO5cL4xWkFKYzIk=;
 b=QZjkZGKKd3Lge18KB7+snRQObDxBoHlpJLb3MAhDVWWZeVfkUmIRQRCgR/vj2wI05lF1qQ7znS5gzil5hZ5G3tbrK9vT5gBd2Rrhqa/0cmkr87PdOJJn+ar1Wqpmf9zUFcsJsitSQfRE1FZ6l4/bK9g0MfOgS5MbExl4bHXvjfiv9U5OdriFJmYLdijTey/TJpegf2vzEf8JCctS0Ru6vf3CsCGGFN07CoTIvVJP2KTHv9IuoazQ7NFpMYy0wGtOCKrzCPoULMjwJ7OC9mEAD8BQUZnlnJl3R44sk20DOhDRdPBdDxb8ehMrML54BealQCmr5IDdcRjw5TPAVvVqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xfxbr0r8PaliDgYAdQ+81TBjvuoGO5cL4xWkFKYzIk=;
 b=Vlft8rIeuGZQBob7zTjW8l24s7Up7STcXqmdnkgBNehbccJTd+xdqPcKOKiyfIYlXTMdxVN56l+njczEedr8squtiwE4iydhXw9l7jNZP85O5T9xtgLaBaQu9XdM6lxAZiToD22EBWkFHr0W6AGwY/rCUulckIYrnMb2pWP7WhQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 05:00:59 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 05:00:59 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: Get DRM dev from adev by inline-f
Date: Wed, 19 Aug 2020 01:00:41 -0400
Message-Id: <20200819050042.7370-3-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.215.g878e727637
In-Reply-To: <20200819050042.7370-1-luben.tuikov@amd.com>
References: <20200819050042.7370-1-luben.tuikov@amd.com>
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Wed, 19 Aug 2020 05:00:58 +0000
X-Mailer: git-send-email 2.28.0.215.g878e727637
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e09fffa4-f624-4136-8a4a-08d843fcdcaa
X-MS-TrafficTypeDiagnostic: DM6PR12MB2618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB261823657227639B6161A4A8995D0@DM6PR12MB2618.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPpVBfXgzM5HDtJTPtkdHBcYBi4HXrphcAfHOVWc251v6Tg6g27WIDEbM3gmOx35oHsB3vVsCTKlm+pCCH7hTO8jhdDSN93v68mHgtuT22spqdY8yRw88zW5RLcQlU56Fxd9GtGaQvXyUJqAmtt3LbXOwd8U6+hRcb7NrzI1cU6kUBg762n4TLjPaGvrxFBmNBWDrraVo4T9e+CXLxwomUDiW+gMYjQcuMY8hNMJZ6TckMDkVBMETNPDa3ks7tTAj3TYDUhSdBfBxOaop8klPj3vfX3rthXBPkyNtKGfeVyM7jktRJrJQMRBjIw8coGK/2zZtEoMOm+OiuQKDRW8IwZUTd4JSijD38tgOU+u4h2bbALkj8PMM21vmnS2kuop10pAgzZp+Fur3gskKJ0LtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(110011004)(83380400001)(16576012)(66574015)(30864003)(316002)(2906002)(4326008)(36756003)(54906003)(8676002)(1076003)(478600001)(186003)(66556008)(66476007)(6486002)(44832011)(66946007)(5660300002)(52116002)(6666004)(8936002)(86362001)(956004)(2616005)(21314003)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ymsvgTA67nHK2QDzBu8xmj2wj4D/NQV/IQ7IAJ4K98OJmeba6iMuOCvXCjnJCQps3LiJ1oPaFRxFWFQkCPDWeiHZZufD+1TD6DFi5tow2C89NrCAGvFkovMGRhAY5ibwJ/PuJWCsZjHsptPjzO1udQgO77lMcAmYtYpJefVVJCWUBA54dC7pCwvbi/YdG6LVevALE+COZRzR/i3JO6WLPhlNixmChz1c4pwkzGYhEXfRwmUBxRQdoYiKAUYTMIiIwWn1leioX5G6jOt3KE90LfZWoBNAFHzBk3okT94ETj0fYIU93JQv1xNi9+SohXHTKkEsW8mZ4HW5MBCa+ZRHpX9orrtWFem4/yDfsad6IbT+KpIFPjVRH/UXJgCQmlpv+nHrO8qYNaF9gp0g8++XUC+nHE4TaGUj8dmEQRBxrARJNKX1LfPG/OvmE9FUtLRoyGqJ2e2S/94XY8pU3n2gTauVQPC+mHHqYHFLfVCrySwom3iCLHkJrhtcYXxlaF7/ryotbAxT6zNQl8zHR9o0GX16+VCYacOrZOcNpC6gMGy40rd0u89yZSoa1FtmotoHPz8e8Eu19hiUU0aMDx17PIpSr5RsAJUq4yB8Sv7VWWobembOaPHcgC6NJNKmdSZ++WDGbC5uMxe9pDk8C9/AQg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09fffa4-f624-4136-8a4a-08d843fcdcaa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 05:00:58.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FeFvenJyxruxxqsrHzbZgWWql/4WAUYkvG8MKtOCPqPoST762Cf8Sj2SRym5k0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2618
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
 Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a static inline adev_to_drm() to obtain
the DRM device pointer from an amdgpu_device pointer.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  |   6 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 178 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  26 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  34 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |   2 +-
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  46 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  46 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  46 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  46 ++---
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  36 ++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  84 ++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c |   4 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   4 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |   6 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 194 +++++++++---------
 33 files changed, 430 insertions(+), 425 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d75f6a29a0d2..735480cc7dcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -993,6 +993,11 @@ static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
 	return ddev->dev_private;
 }
 
+static inline struct drm_device *adev_to_drm(struct amdgpu_device *adev)
+{
+	return adev->ddev;
+}
+
 static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
 {
 	return container_of(bdev, struct amdgpu_device, mman.bdev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 913c8f0513bd..4a93b880c6bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -463,11 +463,11 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
 
 		if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
 			if (adev->flags & AMD_IS_PX) {
-				pm_runtime_get_sync(adev->ddev->dev);
+				pm_runtime_get_sync(adev_to_drm(adev)->dev);
 				/* Just fire off a uevent and let userspace tell us what to do */
-				drm_helper_hpd_irq_event(adev->ddev);
-				pm_runtime_mark_last_busy(adev->ddev->dev);
-				pm_runtime_put_autosuspend(adev->ddev->dev);
+				drm_helper_hpd_irq_event(adev_to_drm(adev));
+				pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+				pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			}
 		}
 		/* TODO: check other events */
@@ -817,7 +817,7 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 			struct drm_encoder *tmp;
 
 			/* Find the encoder controlling the brightness */
-			list_for_each_entry(tmp, &adev->ddev->mode_config.encoder_list,
+			list_for_each_entry(tmp, &adev_to_drm(adev)->mode_config.encoder_list,
 					    head) {
 				struct amdgpu_encoder *enc = to_amdgpu_encoder(tmp);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index b74846fc3933..d58148f455dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -119,7 +119,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 			.gpuvm_size = min(adev->vm_manager.max_pfn
 					  << AMDGPU_GPU_PAGE_SHIFT,
 					  AMDGPU_GMC_HOLE_START),
-			.drm_render_minor = adev->ddev->render->index,
+			.drm_render_minor = adev_to_drm(adev)->render->index,
 			.sdma_doorbell_idx = adev->doorbell_index.sdma_engine,
 
 		};
@@ -160,7 +160,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 					adev->doorbell_index.last_non_cp;
 		}
 
-		kgd2kfd_device_init(adev->kfd.dev, adev->ddev, &gpu_resources);
+		kgd2kfd_device_init(adev->kfd.dev, adev_to_drm(adev), &gpu_resources);
 	}
 }
 
@@ -479,7 +479,7 @@ int amdgpu_amdkfd_get_dmabuf_info(struct kgd_dev *kgd, int dma_buf_fd,
 		goto out_put;
 
 	obj = dma_buf->priv;
-	if (obj->dev->driver != adev->ddev->driver)
+	if (obj->dev->driver != adev_to_drm(adev)->driver)
 		/* Can't handle buffers from different drivers */
 		goto out_put;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 662cc414ceec..469352e2d6ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -148,7 +148,7 @@ void amdgpu_atombios_i2c_init(struct amdgpu_device *adev)
 
 			if (i2c.valid) {
 				sprintf(stmp, "0x%x", i2c.i2c_id);
-				adev->i2c_bus[i] = amdgpu_i2c_create(adev->ddev, &i2c, stmp);
+				adev->i2c_bus[i] = amdgpu_i2c_create(adev_to_drm(adev), &i2c, stmp);
 			}
 			gpio = (ATOM_GPIO_I2C_ASSIGMENT *)
 				((u8 *)gpio + sizeof(ATOM_GPIO_I2C_ASSIGMENT));
@@ -541,7 +541,7 @@ bool amdgpu_atombios_get_connector_info_from_object_table(struct amdgpu_device *
 		}
 	}
 
-	amdgpu_link_encoder_connector(adev->ddev);
+	amdgpu_link_encoder_connector(adev_to_drm(adev));
 
 	return true;
 }
@@ -1995,7 +1995,7 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 		return -ENOMEM;
 
 	adev->mode_info.atom_card_info = atom_card_info;
-	atom_card_info->dev = adev->ddev;
+	atom_card_info->dev = adev_to_drm(adev);
 	atom_card_info->reg_read = cail_reg_read;
 	atom_card_info->reg_write = cail_reg_write;
 	/* needed for iio ops */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 3bce625189ce..3d7508788eb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -1521,7 +1521,7 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 		      struct amdgpu_hpd *hpd,
 		      struct amdgpu_router *router)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	struct amdgpu_connector *amdgpu_connector;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 0e01f971b027..9fddf4b71b2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -69,8 +69,8 @@ int amdgpu_debugfs_add_files(struct amdgpu_device *adev,
 	adev->debugfs_count = i;
 #if defined(CONFIG_DEBUG_FS)
 	drm_debugfs_create_files(files, nfiles,
-				 adev->ddev->primary->debugfs_root,
-				 adev->ddev->primary);
+				 adev_to_drm(adev)->primary->debugfs_root,
+				 adev_to_drm(adev)->primary);
 #endif
 	return 0;
 }
@@ -147,7 +147,7 @@ static void amdgpu_debugfs_autodump_init(struct amdgpu_device *adev)
 	init_waitqueue_head(&adev->autodump.gpu_hang);
 
 	debugfs_create_file("amdgpu_autodump", 0600,
-		adev->ddev->primary->debugfs_root,
+		adev_to_drm(adev)->primary->debugfs_root,
 		adev, &autodump_debug_fops);
 }
 
@@ -223,23 +223,23 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 
 	*pos &= (1UL << 22) - 1;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	if (use_bank) {
 		if ((sh_bank != 0xFFFFFFFF && sh_bank >= adev->gfx.config.max_sh_per_se) ||
 		    (se_bank != 0xFFFFFFFF && se_bank >= adev->gfx.config.max_shader_engines)) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return -EINVAL;
 		}
@@ -288,8 +288,8 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 	if (pm_pg_lock)
 		mutex_unlock(&adev->pm.mutex);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -336,15 +336,15 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -354,8 +354,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 		value = RREG32_PCIE(*pos >> 2);
 		r = put_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return r;
 		}
@@ -366,8 +366,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -395,15 +395,15 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -412,8 +412,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 
 		r = get_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return r;
 		}
@@ -426,8 +426,8 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct file *f, const char __user
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -455,15 +455,15 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -473,8 +473,8 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 		value = RREG32_DIDT(*pos >> 2);
 		r = put_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return r;
 		}
@@ -485,8 +485,8 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -514,15 +514,15 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -531,8 +531,8 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 
 		r = get_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return r;
 		}
@@ -545,8 +545,8 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct file *f, const char __user
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -574,15 +574,15 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -592,8 +592,8 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 		value = RREG32_SMC(*pos);
 		r = put_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return r;
 		}
@@ -604,8 +604,8 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -633,15 +633,15 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -650,8 +650,8 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 
 		r = get_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			amdgpu_virt_disable_access_debugfs(adev);
 			return r;
 		}
@@ -664,8 +664,8 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct file *f, const char __user *
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	amdgpu_virt_disable_access_debugfs(adev);
 	return result;
@@ -792,22 +792,22 @@ static ssize_t amdgpu_debugfs_sensor_read(struct file *f, char __user *buf,
 
 	valuesize = sizeof(values);
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_dpm_read_sensor(adev, idx, &values[0], &valuesize);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r) {
 		amdgpu_virt_disable_access_debugfs(adev);
@@ -874,15 +874,15 @@ static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
 	wave = (*pos & GENMASK_ULL(36, 31)) >> 31;
 	simd = (*pos & GENMASK_ULL(44, 37)) >> 37;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_virt_enable_access_debugfs(adev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -897,8 +897,8 @@ static ssize_t amdgpu_debugfs_wave_read(struct file *f, char __user *buf,
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (!x) {
 		amdgpu_virt_disable_access_debugfs(adev);
@@ -972,7 +972,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	if (!data)
 		return -ENOMEM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0)
 		goto err;
 
@@ -995,8 +995,8 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
 	mutex_unlock(&adev->grbm_idx_mutex);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	while (size) {
 		uint32_t value;
@@ -1018,7 +1018,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 	return result;
 
 err:
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	kfree(data);
 	return r;
 }
@@ -1043,9 +1043,9 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1054,8 +1054,8 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 
 		r = get_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			return r;
 		}
 
@@ -1067,8 +1067,8 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return result;
 }
@@ -1092,7 +1092,7 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 	if (size & 0x3 || *pos & 0x3)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0)
 		return r;
 
@@ -1101,15 +1101,15 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 
 		r = amdgpu_get_gfx_off_status(adev, &value);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			return r;
 		}
 
 		r = put_user(value, (uint32_t *)buf);
 		if (r) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			return r;
 		}
 
@@ -1119,8 +1119,8 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 		size -= 4;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return result;
 }
@@ -1212,7 +1212,7 @@ static const char *debugfs_regs_names[] = {
  */
 int amdgpu_debugfs_regs_init(struct amdgpu_device *adev)
 {
-	struct drm_minor *minor = adev->ddev->primary;
+	struct drm_minor *minor = adev_to_drm(adev)->primary;
 	struct dentry *ent, *root = minor->debugfs_root;
 	unsigned int i;
 
@@ -1237,7 +1237,7 @@ static int amdgpu_debugfs_test_ib(struct seq_file *m, void *data)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1296,7 +1296,7 @@ static int amdgpu_debugfs_evict_vram(struct seq_file *m, void *data)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1317,7 +1317,7 @@ static int amdgpu_debugfs_evict_gtt(struct seq_file *m, void *data)
 
 	r = pm_runtime_get_sync(dev->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -1518,9 +1518,9 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
 	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
 		return -EINVAL;
 
-	ret = pm_runtime_get_sync(adev->ddev->dev);
+	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
@@ -1533,8 +1533,8 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
 		return 0;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (ret)
 		return -EINVAL;
@@ -1554,7 +1554,7 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 
 	adev->debugfs_preempt =
 		debugfs_create_file("amdgpu_preempt_ib", 0600,
-				    adev->ddev->primary->debugfs_root, adev,
+				    adev_to_drm(adev)->primary->debugfs_root, adev,
 				    &fops_ib_preempt);
 	if (!(adev->debugfs_preempt)) {
 		DRM_ERROR("unable to create amdgpu_preempt_ib debugsfs file\n");
@@ -1563,7 +1563,7 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 
 	adev->smu.debugfs_sclk =
 		debugfs_create_file("amdgpu_force_sclk", 0200,
-				    adev->ddev->primary->debugfs_root, adev,
+				    adev_to_drm(adev)->primary->debugfs_root, adev,
 				    &fops_sclk_set);
 	if (!(adev->smu.debugfs_sclk)) {
 		DRM_ERROR("unable to create amdgpu_set_sclk debugsfs file\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ba83c9c9c674..07012d71eeea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1509,7 +1509,7 @@ static void amdgpu_device_enable_virtual_display(struct amdgpu_device *adev)
 	adev->enable_virtual_display = false;
 
 	if (amdgpu_virtual_display) {
-		struct drm_device *ddev = adev->ddev;
+		struct drm_device *ddev = adev_to_drm(adev);
 		const char *pci_address_name = pci_name(ddev->pdev);
 		char *pciaddstr, *pciaddstr_tmp, *pciaddname_tmp, *pciaddname;
 
@@ -2872,13 +2872,13 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 	if (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
 
 		task_barrier_enter(&hive->tb);
-		adev->asic_reset_res = amdgpu_device_baco_enter(adev->ddev);
+		adev->asic_reset_res = amdgpu_device_baco_enter(adev_to_drm(adev));
 
 		if (adev->asic_reset_res)
 			goto fail;
 
 		task_barrier_exit(&hive->tb);
-		adev->asic_reset_res = amdgpu_device_baco_exit(adev->ddev);
+		adev->asic_reset_res = amdgpu_device_baco_exit(adev_to_drm(adev));
 
 		if (adev->asic_reset_res)
 			goto fail;
@@ -2894,7 +2894,7 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 fail:
 	if (adev->asic_reset_res)
 		DRM_WARN("ASIC reset failed with error, %d for drm dev, %s",
-			 adev->asic_reset_res, adev->ddev->unique);
+			 adev->asic_reset_res, adev_to_drm(adev)->unique);
 }
 
 static int amdgpu_device_get_job_timeout_settings(struct amdgpu_device *adev)
@@ -3241,7 +3241,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	}
 
 	/* init the mode config */
-	drm_mode_config_init(adev->ddev);
+	drm_mode_config_init(adev_to_drm(adev));
 
 	r = amdgpu_device_ip_init(adev);
 	if (r) {
@@ -3383,9 +3383,9 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 	amdgpu_irq_disable_all(adev);
 	if (adev->mode_info.mode_config_initialized){
 		if (!amdgpu_device_has_dc_support(adev))
-			drm_helper_force_disable_all(adev->ddev);
+			drm_helper_force_disable_all(adev_to_drm(adev));
 		else
-			drm_atomic_helper_shutdown(adev->ddev);
+			drm_atomic_helper_shutdown(adev_to_drm(adev));
 	}
 	amdgpu_fence_driver_fini(adev);
 	if (adev->pm_sysfs_en)
@@ -3409,7 +3409,7 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 	     amdgpu_has_atpx_dgpu_power_cntl()) &&
 	    !pci_is_thunderbolt_attached(adev->pdev))
 		vga_switcheroo_unregister_client(adev->pdev);
-	if (amdgpu_device_supports_boco(adev->ddev))
+	if (amdgpu_device_supports_boco(adev_to_drm(adev)))
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
 	vga_client_register(adev->pdev, NULL, NULL, NULL);
 	if (adev->rio_mem)
@@ -4049,7 +4049,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
 
 			if (r) {
 				DRM_ERROR("ASIC reset failed with error, %d for drm dev, %s",
-					 r, tmp_adev->ddev->unique);
+					 r, adev_to_drm(tmp_adev)->unique);
 				break;
 			}
 		}
@@ -4416,7 +4416,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		/*TODO Should we stop ?*/
 		if (r) {
 			DRM_ERROR("GPU pre asic reset failed with err, %d for drm dev, %s ",
-				  r, tmp_adev->ddev->unique);
+				  r, adev_to_drm(tmp_adev)->unique);
 			tmp_adev->asic_reset_res = r;
 		}
 	}
@@ -4452,7 +4452,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		}
 
 		if (!amdgpu_device_has_dc_support(tmp_adev) && !job_signaled) {
-			drm_helper_resume_force_mode(tmp_adev->ddev);
+			drm_helper_resume_force_mode(adev_to_drm(tmp_adev));
 		}
 
 		tmp_adev->asic_reset_res = 0;
@@ -4627,7 +4627,7 @@ int amdgpu_device_baco_enter(struct drm_device *dev)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 
-	if (!amdgpu_device_supports_baco(adev->ddev))
+	if (!amdgpu_device_supports_baco(adev_to_drm(adev)))
 		return -ENOTSUPP;
 
 	if (ras && ras->supported)
@@ -4642,7 +4642,7 @@ int amdgpu_device_baco_exit(struct drm_device *dev)
 	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
 	int ret = 0;
 
-	if (!amdgpu_device_supports_baco(adev->ddev))
+	if (!amdgpu_device_supports_baco(adev_to_drm(adev)))
 		return -ENOTSUPP;
 
 	ret = amdgpu_dpm_baco_exit(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 719cb1a9c055..68e658998b55 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -93,7 +93,7 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
 	 * targeted by the flip
 	 */
 	if (amdgpu_crtc->enabled &&
-	    (amdgpu_display_get_crtc_scanoutpos(adev->ddev, work->crtc_id, 0,
+	    (amdgpu_display_get_crtc_scanoutpos(adev_to_drm(adev), work->crtc_id, 0,
 						&vpos, &hpos, NULL, NULL,
 						&crtc->hwmode)
 	     & (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK)) ==
@@ -619,59 +619,59 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 	int sz;
 
 	adev->mode_info.coherent_mode_property =
-		drm_property_create_range(adev->ddev, 0 , "coherent", 0, 1);
+		drm_property_create_range(adev_to_drm(adev), 0, "coherent", 0, 1);
 	if (!adev->mode_info.coherent_mode_property)
 		return -ENOMEM;
 
 	adev->mode_info.load_detect_property =
-		drm_property_create_range(adev->ddev, 0, "load detection", 0, 1);
+		drm_property_create_range(adev_to_drm(adev), 0, "load detection", 0, 1);
 	if (!adev->mode_info.load_detect_property)
 		return -ENOMEM;
 
-	drm_mode_create_scaling_mode_property(adev->ddev);
+	drm_mode_create_scaling_mode_property(adev_to_drm(adev));
 
 	sz = ARRAY_SIZE(amdgpu_underscan_enum_list);
 	adev->mode_info.underscan_property =
-		drm_property_create_enum(adev->ddev, 0,
-				    "underscan",
-				    amdgpu_underscan_enum_list, sz);
+		drm_property_create_enum(adev_to_drm(adev), 0,
+					 "underscan",
+					 amdgpu_underscan_enum_list, sz);
 
 	adev->mode_info.underscan_hborder_property =
-		drm_property_create_range(adev->ddev, 0,
-					"underscan hborder", 0, 128);
+		drm_property_create_range(adev_to_drm(adev), 0,
+					  "underscan hborder", 0, 128);
 	if (!adev->mode_info.underscan_hborder_property)
 		return -ENOMEM;
 
 	adev->mode_info.underscan_vborder_property =
-		drm_property_create_range(adev->ddev, 0,
-					"underscan vborder", 0, 128);
+		drm_property_create_range(adev_to_drm(adev), 0,
+					  "underscan vborder", 0, 128);
 	if (!adev->mode_info.underscan_vborder_property)
 		return -ENOMEM;
 
 	sz = ARRAY_SIZE(amdgpu_audio_enum_list);
 	adev->mode_info.audio_property =
-		drm_property_create_enum(adev->ddev, 0,
+		drm_property_create_enum(adev_to_drm(adev), 0,
 					 "audio",
 					 amdgpu_audio_enum_list, sz);
 
 	sz = ARRAY_SIZE(amdgpu_dither_enum_list);
 	adev->mode_info.dither_property =
-		drm_property_create_enum(adev->ddev, 0,
+		drm_property_create_enum(adev_to_drm(adev), 0,
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
 	if (amdgpu_device_has_dc_support(adev)) {
 		adev->mode_info.abm_level_property =
-			drm_property_create_range(adev->ddev, 0,
-						"abm level", 0, 4);
+			drm_property_create_range(adev_to_drm(adev), 0,
+						  "abm level", 0, 4);
 		if (!adev->mode_info.abm_level_property)
 			return -ENOMEM;
 		adev->mode_info.freesync_property =
-			drm_property_create_bool(adev->ddev, 0, "freesync");
+			drm_property_create_bool(adev_to_drm(adev), 0, "freesync");
 		if (!adev->mode_info.freesync_property)
 			return -ENOMEM;
 		adev->mode_info.freesync_capable_property =
-			drm_property_create_bool(adev->ddev,
+			drm_property_create_bool(adev_to_drm(adev),
 						 0,
 						 "freesync_capable");
 		if (!adev->mode_info.freesync_capable_property)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 25ddb482466a..88ebdb3b3c7d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -135,7 +135,7 @@ static int amdgpufb_create_pinned_object(struct amdgpu_fbdev *rfbdev,
 			       AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS     |
 			       AMDGPU_GEM_CREATE_VRAM_CLEARED;
 
-	info = drm_get_format_info(adev->ddev, mode_cmd);
+	info = drm_get_format_info(adev_to_drm(adev), mode_cmd);
 	cpp = info->cpp[0];
 
 	/* need to align pitch with crtc limits */
@@ -231,7 +231,7 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 		goto out;
 	}
 
-	ret = amdgpu_display_framebuffer_init(adev->ddev, &rfbdev->rfb,
+	ret = amdgpu_display_framebuffer_init(adev_to_drm(adev), &rfbdev->rfb,
 					      &mode_cmd, gobj);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
@@ -254,7 +254,7 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 	drm_fb_helper_fill_info(info, &rfbdev->helper, sizes);
 
 	/* setup aperture base/size for vesafb takeover */
-	info->apertures->ranges[0].base = adev->ddev->mode_config.fb_base;
+	info->apertures->ranges[0].base = adev_to_drm(adev)->mode_config.fb_base;
 	info->apertures->ranges[0].size = adev->gmc.aper_size;
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
@@ -270,7 +270,7 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 	DRM_INFO("fb depth is %d\n", fb->format->depth);
 	DRM_INFO("   pitch is %d\n", fb->pitches[0]);
 
-	vga_switcheroo_client_fb_set(adev->ddev->pdev, info);
+	vga_switcheroo_client_fb_set(adev_to_drm(adev)->pdev, info);
 	return 0;
 
 out:
@@ -318,7 +318,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 		return 0;
 
 	/* don't init fbdev if there are no connectors */
-	if (list_empty(&adev->ddev->mode_config.connector_list))
+	if (list_empty(&adev_to_drm(adev)->mode_config.connector_list))
 		return 0;
 
 	/* select 8 bpp console on low vram cards */
@@ -332,10 +332,10 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 	rfbdev->adev = adev;
 	adev->mode_info.rfbdev = rfbdev;
 
-	drm_fb_helper_prepare(adev->ddev, &rfbdev->helper,
-			&amdgpu_fb_helper_funcs);
+	drm_fb_helper_prepare(adev_to_drm(adev), &rfbdev->helper,
+			      &amdgpu_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(adev->ddev, &rfbdev->helper);
+	ret = drm_fb_helper_init(adev_to_drm(adev), &rfbdev->helper);
 	if (ret) {
 		kfree(rfbdev);
 		return ret;
@@ -343,7 +343,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 
 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	if (!amdgpu_device_has_dc_support(adev))
-		drm_helper_disable_unused_functions(adev->ddev);
+		drm_helper_disable_unused_functions(adev_to_drm(adev));
 
 	drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
 	return 0;
@@ -354,7 +354,7 @@ void amdgpu_fbdev_fini(struct amdgpu_device *adev)
 	if (!adev->mode_info.rfbdev)
 		return;
 
-	amdgpu_fbdev_destroy(adev->ddev, adev->mode_info.rfbdev);
+	amdgpu_fbdev_destroy(adev_to_drm(adev), adev->mode_info.rfbdev);
 	kfree(adev->mode_info.rfbdev);
 	adev->mode_info.rfbdev = NULL;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index cfccd3d33341..fe2d495d08ab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -155,7 +155,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
 		       seq);
 	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
 			       seq, flags | AMDGPU_FENCE_FLAG_INT);
-	pm_runtime_get_noresume(adev->ddev->dev);
+	pm_runtime_get_noresume(adev_to_drm(adev)->dev);
 	ptr = &ring->fence_drv.fences[seq & ring->fence_drv.num_fences_mask];
 	if (unlikely(rcu_dereference_protected(*ptr, 1))) {
 		struct dma_fence *old;
@@ -284,8 +284,8 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
 			BUG();
 
 		dma_fence_put(fence);
-		pm_runtime_mark_last_busy(adev->ddev->dev);
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 	} while (last_seq != seq);
 
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 4935585ee91b..35baea5c89ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -92,7 +92,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 
 void amdgpu_gem_force_release(struct amdgpu_device *adev)
 {
-	struct drm_device *ddev = adev->ddev;
+	struct drm_device *ddev = adev_to_drm(adev);
 	struct drm_file *file;
 
 	mutex_lock(&ddev->filelist_mutex);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 411c84194f97..47cad23a6b9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -253,7 +253,7 @@ void amdgpu_i2c_add(struct amdgpu_device *adev,
 		    const struct amdgpu_i2c_bus_rec *rec,
 		    const char *name)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	int i;
 
 	for (i = 0; i < AMDGPU_MAX_I2C_BUS; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 508cb34a9142..300ac73b4738 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -85,7 +85,7 @@ static void amdgpu_hotplug_work_func(struct work_struct *work)
 {
 	struct amdgpu_device *adev = container_of(work, struct amdgpu_device,
 						  hotplug_work);
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
@@ -268,9 +268,9 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 		if (!adev->enable_virtual_display)
 			/* Disable vblank IRQs aggressively for power-saving */
 			/* XXX: can this be enabled for DC? */
-			adev->ddev->vblank_disable_immediate = true;
+			adev_to_drm(adev)->vblank_disable_immediate = true;
 
-		r = drm_vblank_init(adev->ddev, adev->mode_info.num_crtc);
+		r = drm_vblank_init(adev_to_drm(adev), adev->mode_info.num_crtc);
 		if (r)
 			return r;
 
@@ -284,14 +284,14 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 
 	adev->irq.installed = true;
 	/* Use vector 0 for MSI-X */
-	r = drm_irq_install(adev->ddev, pci_irq_vector(adev->pdev, 0));
+	r = drm_irq_install(adev_to_drm(adev), pci_irq_vector(adev->pdev, 0));
 	if (r) {
 		adev->irq.installed = false;
 		if (!amdgpu_device_has_dc_support(adev))
 			flush_work(&adev->hotplug_work);
 		return r;
 	}
-	adev->ddev->max_vblank_count = 0x00ffffff;
+	adev_to_drm(adev)->max_vblank_count = 0x00ffffff;
 
 	DRM_DEBUG("amdgpu: irq initialized.\n");
 	return 0;
@@ -311,7 +311,7 @@ void amdgpu_irq_fini(struct amdgpu_device *adev)
 	unsigned i, j;
 
 	if (adev->irq.installed) {
-		drm_irq_uninstall(adev->ddev);
+		drm_irq_uninstall(adev_to_drm(adev));
 		adev->irq.installed = false;
 		if (adev->irq.msi_enabled)
 			pci_free_irq_vectors(adev->pdev);
@@ -522,7 +522,7 @@ void amdgpu_irq_gpu_reset_resume_helper(struct amdgpu_device *adev)
 int amdgpu_irq_get(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 		   unsigned type)
 {
-	if (!adev->ddev->irq_enabled)
+	if (!adev_to_drm(adev)->irq_enabled)
 		return -ENOENT;
 
 	if (type >= src->num_types)
@@ -552,7 +552,7 @@ int amdgpu_irq_get(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 int amdgpu_irq_put(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 		   unsigned type)
 {
-	if (!adev->ddev->irq_enabled)
+	if (!adev_to_drm(adev)->irq_enabled)
 		return -ENOENT;
 
 	if (type >= src->num_types)
@@ -583,7 +583,7 @@ int amdgpu_irq_put(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 bool amdgpu_irq_enabled(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 			unsigned type)
 {
-	if (!adev->ddev->irq_enabled)
+	if (!adev_to_drm(adev)->irq_enabled)
 		return false;
 
 	if (type >= src->num_types)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 4cb750ed6851..d0ad186d1cc0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -555,7 +555,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 	bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
 	if (bo == NULL)
 		return -ENOMEM;
-	drm_gem_private_object_init(adev->ddev, &bo->tbo.base, size);
+	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
 	INIT_LIST_HEAD(&bo->shadow_list);
 	bo->vm_bo = NULL;
 	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 1311d6aec5d4..69af462db34d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -226,7 +226,7 @@ static int init_pmu_by_type(struct amdgpu_device *adev,
 	pmu_entry->pmu.attr_groups = attr_groups;
 	pmu_entry->pmu_perf_type = pmu_perf_type;
 	snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d",
-				pmu_file_prefix, adev->ddev->primary->index);
+				pmu_file_prefix, adev_to_drm(adev)->primary->index);
 
 	ret = perf_pmu_register(&pmu_entry->pmu, pmu_name, -1);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
index 87cbc9011b2d..8da5356c36f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
@@ -46,7 +46,7 @@ static ssize_t amdgpu_rap_debugfs_write(struct file *f, const char __user *buf,
 	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
 	struct ta_rap_shared_memory *rap_shared_mem;
 	struct ta_rap_cmd_output_data *rap_cmd_output;
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	uint32_t op;
 	int ret;
 
@@ -116,7 +116,7 @@ static const struct file_operations amdgpu_rap_debugfs_ops = {
 void amdgpu_rap_debugfs_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev->ddev->primary;
+	struct drm_minor *minor = adev_to_drm(adev)->primary;
 
 	if (!adev->psp.rap_context.rap_initialized)
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 866373c95cae..2cd506c0f5c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1197,7 +1197,7 @@ static int amdgpu_ras_sysfs_remove_all(struct amdgpu_device *adev)
 static void amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)
 {
 	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
-	struct drm_minor *minor = adev->ddev->primary;
+	struct drm_minor *minor = adev_to_drm(adev)->primary;
 
 	con->dir = debugfs_create_dir(RAS_FS_NAME, minor->debugfs_root);
 	debugfs_create_file("ras_ctrl", S_IWUGO | S_IRUGO, con->dir,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 6d4fc79bf84a..15ee13c3bd9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -420,7 +420,7 @@ int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
 			     struct amdgpu_ring *ring)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct drm_minor *minor = adev->ddev->primary;
+	struct drm_minor *minor = adev_to_drm(adev)->primary;
 	struct dentry *ent, *root = minor->debugfs_root;
 	char name[32];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0d56eb9ff982..463cfe46058e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1926,8 +1926,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	/* No others user of address space so set it to 0 */
 	r = ttm_bo_device_init(&adev->mman.bdev,
 			       &amdgpu_bo_driver,
-			       adev->ddev->anon_inode->i_mapping,
-			       adev->ddev->vma_offset_manager,
+			       adev_to_drm(adev)->anon_inode->i_mapping,
+			       adev_to_drm(adev)->vma_offset_manager,
 			       dma_addressing_limited(adev->dev));
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
@@ -2611,7 +2611,7 @@ int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
 #if defined(CONFIG_DEBUG_FS)
 	unsigned count;
 
-	struct drm_minor *minor = adev->ddev->primary;
+	struct drm_minor *minor = adev_to_drm(adev)->primary;
 	struct dentry *ent, *root = minor->debugfs_root;
 
 	for (count = 0; count < ARRAY_SIZE(ttm_debugfs_entries); count++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index ae720a6dc5a0..273d541ebca8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -45,7 +45,7 @@ void amdgpu_virt_init_setting(struct amdgpu_device *adev)
 	if (adev->mode_info.num_crtc == 0)
 		adev->mode_info.num_crtc = 1;
 	adev->enable_virtual_display = true;
-	adev->ddev->driver->driver_features &= ~DRIVER_ATOMIC;
+	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
 	adev->cg_flags = 0;
 	adev->pg_flags = 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index a9acc747b31e..b33b895bbd46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -308,7 +308,7 @@ static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
 
 
 remove_link:
-	sysfs_remove_link(&adev->dev->kobj, adev->ddev->unique);
+	sysfs_remove_link(&adev->dev->kobj, adev_to_drm(adev)->unique);
 
 remove_file:
 	device_remove_file(adev->dev, &dev_attr_xgmi_device_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index a7466f3562bc..8339c8c3a328 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -1673,7 +1673,7 @@ amdgpu_atombios_encoder_set_crtc_source(struct drm_encoder *encoder)
 void
 amdgpu_atombios_encoder_init_dig(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_encoder *encoder;
 
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 0d0b73e846f5..7fcbef7cfb5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -328,7 +328,7 @@ static void dce_v10_0_hpd_set_polarity(struct amdgpu_device *adev,
  */
 static void dce_v10_0_hpd_init(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -383,7 +383,7 @@ static void dce_v10_0_hpd_init(struct amdgpu_device *adev)
  */
 static void dce_v10_0_hpd_fini(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -2701,7 +2701,7 @@ static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)
 	if (amdgpu_crtc == NULL)
 		return -ENOMEM;
 
-	drm_crtc_init(adev->ddev, &amdgpu_crtc->base, &dce_v10_0_crtc_funcs);
+	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v10_0_crtc_funcs);
 
 	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
 	amdgpu_crtc->crtc_id = index;
@@ -2709,8 +2709,8 @@ static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)
 
 	amdgpu_crtc->max_cursor_width = 128;
 	amdgpu_crtc->max_cursor_height = 128;
-	adev->ddev->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
-	adev->ddev->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
+	adev_to_drm(adev)->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
+	adev_to_drm(adev)->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
 
 	switch (amdgpu_crtc->crtc_id) {
 	case 0:
@@ -2792,24 +2792,24 @@ static int dce_v10_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.funcs = &amdgpu_mode_funcs;
+	adev_to_drm(adev)->mode_config.funcs = &amdgpu_mode_funcs;
 
-	adev->ddev->mode_config.async_page_flip = true;
+	adev_to_drm(adev)->mode_config.async_page_flip = true;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
-	adev->ddev->mode_config.preferred_depth = 24;
-	adev->ddev->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.preferred_depth = 24;
+	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
-	adev->ddev->mode_config.fb_base = adev->gmc.aper_base;
+	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
 	/* allocate crtcs */
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
@@ -2819,7 +2819,7 @@ static int dce_v10_0_sw_init(void *handle)
 	}
 
 	if (amdgpu_atombios_get_connector_info_from_object_table(adev))
-		amdgpu_display_print_display_setup(adev->ddev);
+		amdgpu_display_print_display_setup(adev_to_drm(adev));
 	else
 		return -EINVAL;
 
@@ -2832,7 +2832,7 @@ static int dce_v10_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	drm_kms_helper_poll_init(adev->ddev);
+	drm_kms_helper_poll_init(adev_to_drm(adev));
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
@@ -2844,13 +2844,13 @@ static int dce_v10_0_sw_fini(void *handle)
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
 
-	drm_kms_helper_poll_fini(adev->ddev);
+	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
 	dce_v10_0_audio_fini(adev);
 
 	dce_v10_0_afmt_fini(adev);
 
-	drm_mode_config_cleanup(adev->ddev);
+	drm_mode_config_cleanup(adev_to_drm(adev));
 	adev->mode_info.mode_config_initialized = false;
 
 	return 0;
@@ -3157,14 +3157,14 @@ static int dce_v10_0_pageflip_irq(struct amdgpu_device *adev,
 	if (amdgpu_crtc == NULL)
 		return 0;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	works = amdgpu_crtc->pflip_works;
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED) {
 		DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status = %d != "
 						 "AMDGPU_FLIP_SUBMITTED(%d)\n",
 						 amdgpu_crtc->pflip_status,
 						 AMDGPU_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 		return 0;
 	}
 
@@ -3176,7 +3176,7 @@ static int dce_v10_0_pageflip_irq(struct amdgpu_device *adev,
 	if (works->event)
 		drm_crtc_send_vblank_event(&amdgpu_crtc->base, works->event);
 
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
 	drm_crtc_vblank_put(&amdgpu_crtc->base);
 	schedule_work(&works->unpin_work);
@@ -3245,7 +3245,7 @@ static int dce_v10_0_crtc_irq(struct amdgpu_device *adev,
 			DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 		if (amdgpu_irq_enabled(adev, source, irq_type)) {
-			drm_handle_vblank(adev->ddev, crtc);
+			drm_handle_vblank(adev_to_drm(adev), crtc);
 		}
 		DRM_DEBUG("IH: D%d vblank\n", crtc + 1);
 
@@ -3485,7 +3485,7 @@ static void dce_v10_0_encoder_add(struct amdgpu_device *adev,
 				 uint32_t supported_device,
 				 u16 caps)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_encoder *encoder;
 	struct amdgpu_encoder *amdgpu_encoder;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 29407ae183a3..26c481e989d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -346,7 +346,7 @@ static void dce_v11_0_hpd_set_polarity(struct amdgpu_device *adev,
  */
 static void dce_v11_0_hpd_init(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -400,7 +400,7 @@ static void dce_v11_0_hpd_init(struct amdgpu_device *adev)
  */
 static void dce_v11_0_hpd_fini(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -2809,7 +2809,7 @@ static int dce_v11_0_crtc_init(struct amdgpu_device *adev, int index)
 	if (amdgpu_crtc == NULL)
 		return -ENOMEM;
 
-	drm_crtc_init(adev->ddev, &amdgpu_crtc->base, &dce_v11_0_crtc_funcs);
+	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v11_0_crtc_funcs);
 
 	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
 	amdgpu_crtc->crtc_id = index;
@@ -2817,8 +2817,8 @@ static int dce_v11_0_crtc_init(struct amdgpu_device *adev, int index)
 
 	amdgpu_crtc->max_cursor_width = 128;
 	amdgpu_crtc->max_cursor_height = 128;
-	adev->ddev->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
-	adev->ddev->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
+	adev_to_drm(adev)->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
+	adev_to_drm(adev)->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
 
 	switch (amdgpu_crtc->crtc_id) {
 	case 0:
@@ -2913,24 +2913,24 @@ static int dce_v11_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.funcs = &amdgpu_mode_funcs;
+	adev_to_drm(adev)->mode_config.funcs = &amdgpu_mode_funcs;
 
-	adev->ddev->mode_config.async_page_flip = true;
+	adev_to_drm(adev)->mode_config.async_page_flip = true;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
-	adev->ddev->mode_config.preferred_depth = 24;
-	adev->ddev->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.preferred_depth = 24;
+	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
-	adev->ddev->mode_config.fb_base = adev->gmc.aper_base;
+	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
 
 	/* allocate crtcs */
@@ -2941,7 +2941,7 @@ static int dce_v11_0_sw_init(void *handle)
 	}
 
 	if (amdgpu_atombios_get_connector_info_from_object_table(adev))
-		amdgpu_display_print_display_setup(adev->ddev);
+		amdgpu_display_print_display_setup(adev_to_drm(adev));
 	else
 		return -EINVAL;
 
@@ -2954,7 +2954,7 @@ static int dce_v11_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	drm_kms_helper_poll_init(adev->ddev);
+	drm_kms_helper_poll_init(adev_to_drm(adev));
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
@@ -2966,13 +2966,13 @@ static int dce_v11_0_sw_fini(void *handle)
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
 
-	drm_kms_helper_poll_fini(adev->ddev);
+	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
 	dce_v11_0_audio_fini(adev);
 
 	dce_v11_0_afmt_fini(adev);
 
-	drm_mode_config_cleanup(adev->ddev);
+	drm_mode_config_cleanup(adev_to_drm(adev));
 	adev->mode_info.mode_config_initialized = false;
 
 	return 0;
@@ -3283,14 +3283,14 @@ static int dce_v11_0_pageflip_irq(struct amdgpu_device *adev,
 	if(amdgpu_crtc == NULL)
 		return 0;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	works = amdgpu_crtc->pflip_works;
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED){
 		DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status = %d != "
 						 "AMDGPU_FLIP_SUBMITTED(%d)\n",
 						 amdgpu_crtc->pflip_status,
 						 AMDGPU_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 		return 0;
 	}
 
@@ -3302,7 +3302,7 @@ static int dce_v11_0_pageflip_irq(struct amdgpu_device *adev,
 	if(works->event)
 		drm_crtc_send_vblank_event(&amdgpu_crtc->base, works->event);
 
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
 	drm_crtc_vblank_put(&amdgpu_crtc->base);
 	schedule_work(&works->unpin_work);
@@ -3372,7 +3372,7 @@ static int dce_v11_0_crtc_irq(struct amdgpu_device *adev,
 			DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 		if (amdgpu_irq_enabled(adev, source, irq_type)) {
-			drm_handle_vblank(adev->ddev, crtc);
+			drm_handle_vblank(adev_to_drm(adev), crtc);
 		}
 		DRM_DEBUG("IH: D%d vblank\n", crtc + 1);
 
@@ -3611,7 +3611,7 @@ static void dce_v11_0_encoder_add(struct amdgpu_device *adev,
 				 uint32_t supported_device,
 				 u16 caps)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_encoder *encoder;
 	struct amdgpu_encoder *amdgpu_encoder;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index d6ebeff41677..e21a57bfcab6 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -279,7 +279,7 @@ static void dce_v6_0_hpd_set_polarity(struct amdgpu_device *adev,
  */
 static void dce_v6_0_hpd_init(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -324,7 +324,7 @@ static void dce_v6_0_hpd_init(struct amdgpu_device *adev)
  */
 static void dce_v6_0_hpd_fini(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -2591,7 +2591,7 @@ static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
 	if (amdgpu_crtc == NULL)
 		return -ENOMEM;
 
-	drm_crtc_init(adev->ddev, &amdgpu_crtc->base, &dce_v6_0_crtc_funcs);
+	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v6_0_crtc_funcs);
 
 	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
 	amdgpu_crtc->crtc_id = index;
@@ -2599,8 +2599,8 @@ static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
 
 	amdgpu_crtc->max_cursor_width = CURSOR_WIDTH;
 	amdgpu_crtc->max_cursor_height = CURSOR_HEIGHT;
-	adev->ddev->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
-	adev->ddev->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
+	adev_to_drm(adev)->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
+	adev_to_drm(adev)->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
 
 	amdgpu_crtc->crtc_offset = crtc_offsets[amdgpu_crtc->crtc_id];
 
@@ -2669,20 +2669,20 @@ static int dce_v6_0_sw_init(void *handle)
 
 	adev->mode_info.mode_config_initialized = true;
 
-	adev->ddev->mode_config.funcs = &amdgpu_mode_funcs;
-	adev->ddev->mode_config.async_page_flip = true;
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
-	adev->ddev->mode_config.preferred_depth = 24;
-	adev->ddev->mode_config.prefer_shadow = 1;
-	adev->ddev->mode_config.fb_base = adev->gmc.aper_base;
+	adev_to_drm(adev)->mode_config.funcs = &amdgpu_mode_funcs;
+	adev_to_drm(adev)->mode_config.async_page_flip = true;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.preferred_depth = 24;
+	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
 	/* allocate crtcs */
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
@@ -2693,7 +2693,7 @@ static int dce_v6_0_sw_init(void *handle)
 
 	ret = amdgpu_atombios_get_connector_info_from_object_table(adev);
 	if (ret)
-		amdgpu_display_print_display_setup(adev->ddev);
+		amdgpu_display_print_display_setup(adev_to_drm(adev));
 	else
 		return -EINVAL;
 
@@ -2706,7 +2706,7 @@ static int dce_v6_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	drm_kms_helper_poll_init(adev->ddev);
+	drm_kms_helper_poll_init(adev_to_drm(adev));
 
 	return r;
 }
@@ -2717,12 +2717,12 @@ static int dce_v6_0_sw_fini(void *handle)
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
 
-	drm_kms_helper_poll_fini(adev->ddev);
+	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
 	dce_v6_0_audio_fini(adev);
 	dce_v6_0_afmt_fini(adev);
 
-	drm_mode_config_cleanup(adev->ddev);
+	drm_mode_config_cleanup(adev_to_drm(adev));
 	adev->mode_info.mode_config_initialized = false;
 
 	return 0;
@@ -2967,7 +2967,7 @@ static int dce_v6_0_crtc_irq(struct amdgpu_device *adev,
 			DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 		if (amdgpu_irq_enabled(adev, source, irq_type)) {
-			drm_handle_vblank(adev->ddev, crtc);
+			drm_handle_vblank(adev_to_drm(adev), crtc);
 		}
 		DRM_DEBUG("IH: D%d vblank\n", crtc + 1);
 		break;
@@ -3036,14 +3036,14 @@ static int dce_v6_0_pageflip_irq(struct amdgpu_device *adev,
 	if (amdgpu_crtc == NULL)
 		return 0;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	works = amdgpu_crtc->pflip_works;
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED){
 		DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status = %d != "
 						"AMDGPU_FLIP_SUBMITTED(%d)\n",
 						amdgpu_crtc->pflip_status,
 						AMDGPU_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 		return 0;
 	}
 
@@ -3055,7 +3055,7 @@ static int dce_v6_0_pageflip_irq(struct amdgpu_device *adev,
 	if (works->event)
 		drm_crtc_send_vblank_event(&amdgpu_crtc->base, works->event);
 
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
 	drm_crtc_vblank_put(&amdgpu_crtc->base);
 	schedule_work(&works->unpin_work);
@@ -3297,7 +3297,7 @@ static void dce_v6_0_encoder_add(struct amdgpu_device *adev,
 				 uint32_t supported_device,
 				 u16 caps)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_encoder *encoder;
 	struct amdgpu_encoder *amdgpu_encoder;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 48ebe6a786f4..ba3a9783142c 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -273,7 +273,7 @@ static void dce_v8_0_hpd_set_polarity(struct amdgpu_device *adev,
  */
 static void dce_v8_0_hpd_init(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -318,7 +318,7 @@ static void dce_v8_0_hpd_init(struct amdgpu_device *adev)
  */
 static void dce_v8_0_hpd_fini(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 	u32 tmp;
@@ -2609,7 +2609,7 @@ static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
 	if (amdgpu_crtc == NULL)
 		return -ENOMEM;
 
-	drm_crtc_init(adev->ddev, &amdgpu_crtc->base, &dce_v8_0_crtc_funcs);
+	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v8_0_crtc_funcs);
 
 	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
 	amdgpu_crtc->crtc_id = index;
@@ -2617,8 +2617,8 @@ static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
 
 	amdgpu_crtc->max_cursor_width = CIK_CURSOR_WIDTH;
 	amdgpu_crtc->max_cursor_height = CIK_CURSOR_HEIGHT;
-	adev->ddev->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
-	adev->ddev->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
+	adev_to_drm(adev)->mode_config.cursor_width = amdgpu_crtc->max_cursor_width;
+	adev_to_drm(adev)->mode_config.cursor_height = amdgpu_crtc->max_cursor_height;
 
 	amdgpu_crtc->crtc_offset = crtc_offsets[amdgpu_crtc->crtc_id];
 
@@ -2689,24 +2689,24 @@ static int dce_v8_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.funcs = &amdgpu_mode_funcs;
+	adev_to_drm(adev)->mode_config.funcs = &amdgpu_mode_funcs;
 
-	adev->ddev->mode_config.async_page_flip = true;
+	adev_to_drm(adev)->mode_config.async_page_flip = true;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
-	adev->ddev->mode_config.preferred_depth = 24;
-	adev->ddev->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.preferred_depth = 24;
+	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
-	adev->ddev->mode_config.fb_base = adev->gmc.aper_base;
+	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
 	/* allocate crtcs */
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
@@ -2716,7 +2716,7 @@ static int dce_v8_0_sw_init(void *handle)
 	}
 
 	if (amdgpu_atombios_get_connector_info_from_object_table(adev))
-		amdgpu_display_print_display_setup(adev->ddev);
+		amdgpu_display_print_display_setup(adev_to_drm(adev));
 	else
 		return -EINVAL;
 
@@ -2729,7 +2729,7 @@ static int dce_v8_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	drm_kms_helper_poll_init(adev->ddev);
+	drm_kms_helper_poll_init(adev_to_drm(adev));
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
@@ -2741,13 +2741,13 @@ static int dce_v8_0_sw_fini(void *handle)
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
 
-	drm_kms_helper_poll_fini(adev->ddev);
+	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
 	dce_v8_0_audio_fini(adev);
 
 	dce_v8_0_afmt_fini(adev);
 
-	drm_mode_config_cleanup(adev->ddev);
+	drm_mode_config_cleanup(adev_to_drm(adev));
 	adev->mode_info.mode_config_initialized = false;
 
 	return 0;
@@ -3057,7 +3057,7 @@ static int dce_v8_0_crtc_irq(struct amdgpu_device *adev,
 			DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
 
 		if (amdgpu_irq_enabled(adev, source, irq_type)) {
-			drm_handle_vblank(adev->ddev, crtc);
+			drm_handle_vblank(adev_to_drm(adev), crtc);
 		}
 		DRM_DEBUG("IH: D%d vblank\n", crtc + 1);
 		break;
@@ -3126,14 +3126,14 @@ static int dce_v8_0_pageflip_irq(struct amdgpu_device *adev,
 	if (amdgpu_crtc == NULL)
 		return 0;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	works = amdgpu_crtc->pflip_works;
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED){
 		DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status = %d != "
 						"AMDGPU_FLIP_SUBMITTED(%d)\n",
 						amdgpu_crtc->pflip_status,
 						AMDGPU_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 		return 0;
 	}
 
@@ -3145,7 +3145,7 @@ static int dce_v8_0_pageflip_irq(struct amdgpu_device *adev,
 	if (works->event)
 		drm_crtc_send_vblank_event(&amdgpu_crtc->base, works->event);
 
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
 	drm_crtc_vblank_put(&amdgpu_crtc->base);
 	schedule_work(&works->unpin_work);
@@ -3373,7 +3373,7 @@ static void dce_v8_0_encoder_add(struct amdgpu_device *adev,
 				 uint32_t supported_device,
 				 u16 caps)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_encoder *encoder;
 	struct amdgpu_encoder *amdgpu_encoder;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 5bc784531e65..cc93577dee03 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -235,7 +235,7 @@ static int dce_virtual_crtc_init(struct amdgpu_device *adev, int index)
 	if (amdgpu_crtc == NULL)
 		return -ENOMEM;
 
-	drm_crtc_init(adev->ddev, &amdgpu_crtc->base, &dce_virtual_crtc_funcs);
+	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_virtual_crtc_funcs);
 
 	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
 	amdgpu_crtc->crtc_id = index;
@@ -374,24 +374,24 @@ static int dce_virtual_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev->ddev->max_vblank_count = 0;
+	adev_to_drm(adev)->max_vblank_count = 0;
 
-	adev->ddev->mode_config.funcs = &amdgpu_mode_funcs;
+	adev_to_drm(adev)->mode_config.funcs = &amdgpu_mode_funcs;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
-	adev->ddev->mode_config.preferred_depth = 24;
-	adev->ddev->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.preferred_depth = 24;
+	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
-	adev->ddev->mode_config.fb_base = adev->gmc.aper_base;
+	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r)
 		return r;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
 	/* allocate crtcs, encoders, connectors */
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
@@ -403,7 +403,7 @@ static int dce_virtual_sw_init(void *handle)
 			return r;
 	}
 
-	drm_kms_helper_poll_init(adev->ddev);
+	drm_kms_helper_poll_init(adev_to_drm(adev));
 
 	adev->mode_info.mode_config_initialized = true;
 	return 0;
@@ -415,9 +415,9 @@ static int dce_virtual_sw_fini(void *handle)
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
 
-	drm_kms_helper_poll_fini(adev->ddev);
+	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
-	drm_mode_config_cleanup(adev->ddev);
+	drm_mode_config_cleanup(adev_to_drm(adev));
 	/* clear crtcs pointer to avoid dce irq finish routine access freed data */
 	memset(adev->mode_info.crtcs, 0, sizeof(adev->mode_info.crtcs[0]) * AMDGPU_MAX_CRTCS);
 	adev->mode_info.mode_config_initialized = false;
@@ -602,7 +602,7 @@ static int dce_virtual_connector_encoder_init(struct amdgpu_device *adev,
 	if (!encoder)
 		return -ENOMEM;
 	encoder->possible_crtcs = 1 << index;
-	drm_encoder_init(adev->ddev, encoder, &dce_virtual_encoder_funcs,
+	drm_encoder_init(adev_to_drm(adev), encoder, &dce_virtual_encoder_funcs,
 			 DRM_MODE_ENCODER_VIRTUAL, NULL);
 	drm_encoder_helper_add(encoder, &dce_virtual_encoder_helper_funcs);
 
@@ -613,7 +613,7 @@ static int dce_virtual_connector_encoder_init(struct amdgpu_device *adev,
 	}
 
 	/* add a new connector */
-	drm_connector_init(adev->ddev, connector, &dce_virtual_connector_funcs,
+	drm_connector_init(adev_to_drm(adev), connector, &dce_virtual_connector_funcs,
 			   DRM_MODE_CONNECTOR_VIRTUAL);
 	drm_connector_helper_add(connector, &dce_virtual_connector_helper_funcs);
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
@@ -663,14 +663,14 @@ static int dce_virtual_pageflip(struct amdgpu_device *adev,
 	if (amdgpu_crtc == NULL)
 		return 0;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	works = amdgpu_crtc->pflip_works;
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED) {
 		DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status = %d != "
 			"AMDGPU_FLIP_SUBMITTED(%d)\n",
 			amdgpu_crtc->pflip_status,
 			AMDGPU_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 		return 0;
 	}
 
@@ -682,7 +682,7 @@ static int dce_virtual_pageflip(struct amdgpu_device *adev,
 	if (works->event)
 		drm_crtc_send_vblank_event(&amdgpu_crtc->base, works->event);
 
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
 	drm_crtc_vblank_put(&amdgpu_crtc->base);
 	amdgpu_bo_unref(&works->old_abo);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 41e6e146e1b9..892f8e3ab40b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -268,7 +268,7 @@ static struct amdgpu_crtc *
 get_crtc_by_otg_inst(struct amdgpu_device *adev,
 		     int otg_inst)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_crtc *crtc;
 	struct amdgpu_crtc *amdgpu_crtc;
 
@@ -320,7 +320,7 @@ static void dm_pflip_high_irq(void *interrupt_params)
 		return;
 	}
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED){
 		DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status = %d !=AMDGPU_FLIP_SUBMITTED(%d) on crtc:%d[%p] \n",
@@ -328,7 +328,7 @@ static void dm_pflip_high_irq(void *interrupt_params)
 						 AMDGPU_FLIP_SUBMITTED,
 						 amdgpu_crtc->crtc_id,
 						 amdgpu_crtc);
-		spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 		return;
 	}
 
@@ -380,7 +380,7 @@ static void dm_pflip_high_irq(void *interrupt_params)
 		e->sequence = drm_crtc_vblank_count(&amdgpu_crtc->base);
 		e->pipe = amdgpu_crtc->crtc_id;
 
-		list_add_tail(&e->base.link, &adev->ddev->vblank_event_list);
+		list_add_tail(&e->base.link, &adev_to_drm(adev)->vblank_event_list);
 		e = NULL;
 	}
 
@@ -393,7 +393,7 @@ static void dm_pflip_high_irq(void *interrupt_params)
 		amdgpu_get_vblank_counter_kms(&amdgpu_crtc->base);
 
 	amdgpu_crtc->pflip_status = AMDGPU_FLIP_NONE;
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
 	DRM_DEBUG_DRIVER("crtc:%d[%p], pflip_stat:AMDGPU_FLIP_NONE, vrr[%d]-fp %d\n",
 			 amdgpu_crtc->crtc_id, amdgpu_crtc,
@@ -429,7 +429,7 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 			/* BTR processing for pre-DCE12 ASICs */
 			if (acrtc_state->stream &&
 			    adev->family < AMDGPU_FAMILY_AI) {
-				spin_lock_irqsave(&adev->ddev->event_lock, flags);
+				spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 				mod_freesync_handle_v_update(
 				    adev->dm.freesync_module,
 				    acrtc_state->stream,
@@ -439,7 +439,7 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 				    adev->dm.dc,
 				    acrtc_state->stream,
 				    &acrtc_state->vrr_params.adjust);
-				spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+				spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 			}
 		}
 	}
@@ -489,7 +489,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
 	if (adev->family < AMDGPU_FAMILY_AI)
 		return;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 
 	if (acrtc_state->stream && acrtc_state->vrr_params.supported &&
 	    acrtc_state->freesync_config.state == VRR_STATE_ACTIVE_VARIABLE) {
@@ -522,7 +522,7 @@ static void dm_crtc_high_irq(void *interrupt_params)
 		acrtc->pflip_status = AMDGPU_FLIP_NONE;
 	}
 
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 }
 
 static int dm_set_clockgating_state(void *handle,
@@ -850,7 +850,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 #endif
 	int r;
 
-	adev->dm.ddev = adev->ddev;
+	adev->dm.ddev = adev_to_drm(adev);
 	adev->dm.adev = adev;
 
 	/* Zero all the fields */
@@ -986,10 +986,10 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	/* TODO: Add_display_info? */
 
 	/* TODO use dynamic cursor width */
-	adev->ddev->mode_config.cursor_width = adev->dm.dc->caps.max_cursor_size;
-	adev->ddev->mode_config.cursor_height = adev->dm.dc->caps.max_cursor_size;
+	adev_to_drm(adev)->mode_config.cursor_width = adev->dm.dc->caps.max_cursor_size;
+	adev_to_drm(adev)->mode_config.cursor_height = adev->dm.dc->caps.max_cursor_size;
 
-	if (drm_vblank_init(adev->ddev, adev->dm.display_indexes_num)) {
+	if (drm_vblank_init(adev_to_drm(adev), adev->dm.display_indexes_num)) {
 		DRM_ERROR(
 		"amdgpu: failed to initialize sw for display support.\n");
 		goto error;
@@ -1390,7 +1390,7 @@ static int dm_late_init(void *handle)
 	bool ret = true;
 
 	if (!adev->dm.fw_dmcu)
-		return detect_mst_link_for_all_connectors(adev->ddev);
+		return detect_mst_link_for_all_connectors(adev_to_drm(adev));
 
 	dmcu = adev->dm.dc->res_pool->dmcu;
 
@@ -1420,7 +1420,7 @@ static int dm_late_init(void *handle)
 	if (!ret)
 		return -EINVAL;
 
-	return detect_mst_link_for_all_connectors(adev->ddev);
+	return detect_mst_link_for_all_connectors(adev_to_drm(adev));
 }
 
 static void s3_handle_mst(struct drm_device *dev, bool suspend)
@@ -1672,9 +1672,9 @@ static int dm_suspend(void *handle)
 	}
 
 	WARN_ON(adev->dm.cached_state);
-	adev->dm.cached_state = drm_atomic_helper_suspend(adev->ddev);
+	adev->dm.cached_state = drm_atomic_helper_suspend(adev_to_drm(adev));
 
-	s3_handle_mst(adev->ddev, true);
+	s3_handle_mst(adev_to_drm(adev), true);
 
 	amdgpu_dm_irq_suspend(adev);
 
@@ -1828,7 +1828,7 @@ static void dm_gpureset_commit_state(struct dc_state *dc_state,
 static int dm_resume(void *handle)
 {
 	struct amdgpu_device *adev = handle;
-	struct drm_device *ddev = adev->ddev;
+	struct drm_device *ddev = adev_to_drm(adev);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_connector *connector;
@@ -2443,7 +2443,7 @@ static void handle_hpd_rx_irq(void *param)
 
 static void register_hpd_handlers(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct amdgpu_dm_connector *aconnector;
 	const struct dc_link *dc_link;
@@ -2874,18 +2874,18 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 
 	adev->mode_info.mode_config_initialized = true;
 
-	adev->ddev->mode_config.funcs = (void *)&amdgpu_dm_mode_funcs;
-	adev->ddev->mode_config.helper_private = &amdgpu_dm_mode_config_helperfuncs;
+	adev_to_drm(adev)->mode_config.funcs = (void *)&amdgpu_dm_mode_funcs;
+	adev_to_drm(adev)->mode_config.helper_private = &amdgpu_dm_mode_config_helperfuncs;
 
-	adev->ddev->mode_config.max_width = 16384;
-	adev->ddev->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = 16384;
+	adev_to_drm(adev)->mode_config.max_height = 16384;
 
-	adev->ddev->mode_config.preferred_depth = 24;
-	adev->ddev->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.preferred_depth = 24;
+	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 	/* indicates support for immediate flip */
-	adev->ddev->mode_config.async_page_flip = true;
+	adev_to_drm(adev)->mode_config.async_page_flip = true;
 
-	adev->ddev->mode_config.fb_base = adev->gmc.aper_base;
+	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -2899,7 +2899,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 
 	dc_resource_state_copy_construct_current(adev->dm.dc, state->context);
 
-	drm_atomic_private_obj_init(adev->ddev,
+	drm_atomic_private_obj_init(adev_to_drm(adev),
 				    &adev->dm.atomic_obj,
 				    &state->base,
 				    &dm_atomic_state_funcs);
@@ -3064,13 +3064,13 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 	props.type = BACKLIGHT_RAW;
 
 	snprintf(bl_name, sizeof(bl_name), "amdgpu_bl%d",
-			dm->adev->ddev->primary->index);
+		 adev_to_drm(dm->adev)->primary->index);
 
 	dm->backlight_dev = backlight_device_register(bl_name,
-			dm->adev->ddev->dev,
-			dm,
-			&amdgpu_dm_backlight_ops,
-			&props);
+						      adev_to_drm(dm->adev)->dev,
+						      dm,
+						      &amdgpu_dm_backlight_ops,
+						      &props);
 
 	if (IS_ERR(dm->backlight_dev))
 		DRM_ERROR("DM: Backlight registration failed!\n");
@@ -3467,7 +3467,7 @@ static ssize_t s3_debug_store(struct device *device,
 	if (ret == 0) {
 		if (s3_state) {
 			dm_resume(adev);
-			drm_kms_helper_hotplug_event(adev->ddev);
+			drm_kms_helper_hotplug_event(adev_to_drm(adev));
 		} else
 			dm_suspend(adev);
 	}
@@ -3594,7 +3594,7 @@ static int dm_early_init(void *handle)
 	 */
 #if defined(CONFIG_DEBUG_KERNEL_DC)
 	device_create_file(
-		adev->ddev->dev,
+		adev_to_drm(adev)->dev,
 		&dev_attr_s3_debug);
 #endif
 
@@ -6071,7 +6071,7 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	num_formats = get_plane_formats(plane, plane_cap, formats,
 					ARRAY_SIZE(formats));
 
-	res = drm_universal_plane_init(dm->adev->ddev, plane, possible_crtcs,
+	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
 				       &dm_plane_funcs, formats, num_formats,
 				       NULL, plane->type, NULL);
 	if (res)
@@ -6919,7 +6919,7 @@ static void update_freesync_state_on_stream(
 	if (!new_stream->timing.h_total || !new_stream->timing.v_total)
 		return;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	vrr_params = new_crtc_state->vrr_params;
 
 	if (surface) {
@@ -6972,7 +6972,7 @@ static void update_freesync_state_on_stream(
 			      (int)new_crtc_state->base.vrr_enabled,
 			      (int)vrr_params.state);
 
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 }
 
 static void pre_update_freesync_state_on_stream(
@@ -6995,7 +6995,7 @@ static void pre_update_freesync_state_on_stream(
 	if (!new_stream->timing.h_total || !new_stream->timing.v_total)
 		return;
 
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	vrr_params = new_crtc_state->vrr_params;
 
 	if (new_crtc_state->vrr_supported &&
@@ -7018,7 +7018,7 @@ static void pre_update_freesync_state_on_stream(
 			sizeof(vrr_params.adjust)) != 0);
 
 	new_crtc_state->vrr_params = vrr_params;
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 }
 
 static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
@@ -7830,7 +7830,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	 * send vblank event on all events not handled in flip and
 	 * mark consumed event for drm_atomic_helper_commit_hw_done
 	 */
-	spin_lock_irqsave(&adev->ddev->event_lock, flags);
+	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 
 		if (new_crtc_state->event)
@@ -7838,7 +7838,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 
 		new_crtc_state->event = NULL;
 	}
-	spin_unlock_irqrestore(&adev->ddev->event_lock, flags);
+	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
 	/* Signal HW programming completion */
 	drm_atomic_helper_commit_hw_done(state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 1d7b6ba0defa..2a55a92f49ab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -2214,7 +2214,7 @@ static int force_timing_sync_set(void *data, u64 val)
 
 	adev->dm.force_timing_sync = (bool)val;
 
-	amdgpu_dm_trigger_timing_sync(adev->ddev);
+	amdgpu_dm_trigger_timing_sync(adev_to_drm(adev));
 
 	return 0;
 }
@@ -2273,7 +2273,7 @@ int dtn_debugfs_init(struct amdgpu_device *adev)
 		.llseek = default_llseek
 	};
 
-	struct drm_minor *minor = adev->ddev->primary;
+	struct drm_minor *minor = adev_to_drm(adev)->primary;
 	struct dentry *root = minor->debugfs_root;
 	int ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index cbcf504f73a5..357778556b06 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -719,7 +719,7 @@ void amdgpu_dm_set_irq_funcs(struct amdgpu_device *adev)
  */
 void amdgpu_dm_hpd_init(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 
@@ -755,7 +755,7 @@ void amdgpu_dm_hpd_init(struct amdgpu_device *adev)
  */
 void amdgpu_dm_hpd_fini(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter iter;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 41df8128125e..18692d622da5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -304,7 +304,7 @@ static const struct drm_encoder_funcs amdgpu_dm_encoder_funcs = {
 void
 dm_dp_create_fake_mst_encoders(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	int i;
 
 	for (i = 0; i < adev->dm.display_indexes_num; i++) {
@@ -450,7 +450,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	aconnector->mst_mgr.cbs = &dm_mst_cbs;
 	drm_dp_mst_topology_mgr_init(
 		&aconnector->mst_mgr,
-		dm->adev->ddev,
+		adev_to_drm(dm->adev),
 		&aconnector->dm_dp_aux.aux,
 		16,
 		4,
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index f10064d0cb58..52d1d608c294 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -122,7 +122,7 @@ void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
 
 void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
 {
-	struct drm_device *ddev = adev->ddev;
+	struct drm_device *ddev = adev_to_drm(adev);
 	struct drm_crtc *crtc;
 	struct amdgpu_crtc *amdgpu_crtc;
 
@@ -143,7 +143,7 @@ void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
 
 u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_crtc *crtc;
 	struct amdgpu_crtc *amdgpu_crtc;
 	u32 vblank_in_pixels;
@@ -170,7 +170,7 @@ u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev)
 
 u32 amdgpu_dpm_get_vrefresh(struct amdgpu_device *adev)
 {
-	struct drm_device *dev = adev->ddev;
+	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_crtc *crtc;
 	struct amdgpu_crtc *amdgpu_crtc;
 	u32 vrefresh = 0;
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index d01675bf83b4..45c227066f16 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1903,7 +1903,7 @@ static ssize_t amdgpu_get_thermal_throttling_logging(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
 	return snprintf(buf, PAGE_SIZE, "%s: thermal throttling logging %s, with interval %d seconds\n",
-			adev->ddev->unique,
+			adev_to_drm(adev)->unique,
 			atomic_read(&adev->throttling_logging_enabled) ? "enabled" : "disabled",
 			adev->throttling_logging_rs.interval / HZ + 1);
 }
@@ -2199,9 +2199,9 @@ static ssize_t amdgpu_hwmon_show_temp(struct device *dev,
 	if (channel >= PP_TEMP_MAX)
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -2226,8 +2226,8 @@ static ssize_t amdgpu_hwmon_show_temp(struct device *dev,
 		break;
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
@@ -2332,9 +2332,9 @@ static ssize_t amdgpu_hwmon_get_pwm1_enable(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	ret = pm_runtime_get_sync(adev->ddev->dev);
+	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
@@ -2342,16 +2342,16 @@ static ssize_t amdgpu_hwmon_get_pwm1_enable(struct device *dev,
 		pwm_mode = smu_get_fan_control_mode(&adev->smu);
 	} else {
 		if (!adev->powerplay.pp_funcs->get_fan_control_mode) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			return -EINVAL;
 		}
 
 		pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return sprintf(buf, "%i\n", pwm_mode);
 }
@@ -2372,9 +2372,9 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(struct device *dev,
 	if (err)
 		return err;
 
-	ret = pm_runtime_get_sync(adev->ddev->dev);
+	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
@@ -2382,16 +2382,16 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(struct device *dev,
 		smu_set_fan_control_mode(&adev->smu, value);
 	} else {
 		if (!adev->powerplay.pp_funcs->set_fan_control_mode) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			return -EINVAL;
 		}
 
 		amdgpu_dpm_set_fan_control_mode(adev, value);
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return count;
 }
@@ -2422,9 +2422,9 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	err = pm_runtime_get_sync(adev->ddev->dev);
+	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2435,15 +2435,15 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
 
 	if (pwm_mode != AMD_FAN_CTRL_MANUAL) {
 		pr_info("manual fan speed control should be enabled first\n");
-		pm_runtime_mark_last_busy(adev->ddev->dev);
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return -EINVAL;
 	}
 
 	err = kstrtou32(buf, 10, &value);
 	if (err) {
-		pm_runtime_mark_last_busy(adev->ddev->dev);
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2456,8 +2456,8 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
 	else
 		err = -EINVAL;
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -2476,9 +2476,9 @@ static ssize_t amdgpu_hwmon_get_pwm1(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	err = pm_runtime_get_sync(adev->ddev->dev);
+	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2489,8 +2489,8 @@ static ssize_t amdgpu_hwmon_get_pwm1(struct device *dev,
 	else
 		err = -EINVAL;
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -2511,9 +2511,9 @@ static ssize_t amdgpu_hwmon_get_fan1_input(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	err = pm_runtime_get_sync(adev->ddev->dev);
+	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2524,8 +2524,8 @@ static ssize_t amdgpu_hwmon_get_fan1_input(struct device *dev,
 	else
 		err = -EINVAL;
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -2545,17 +2545,17 @@ static ssize_t amdgpu_hwmon_get_fan1_min(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_MIN_FAN_RPM,
 				   (void *)&min_rpm, &size);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
@@ -2575,17 +2575,17 @@ static ssize_t amdgpu_hwmon_get_fan1_max(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_MAX_FAN_RPM,
 				   (void *)&max_rpm, &size);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
@@ -2604,9 +2604,9 @@ static ssize_t amdgpu_hwmon_get_fan1_target(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	err = pm_runtime_get_sync(adev->ddev->dev);
+	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2617,8 +2617,8 @@ static ssize_t amdgpu_hwmon_get_fan1_target(struct device *dev,
 	else
 		err = -EINVAL;
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -2638,9 +2638,9 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	err = pm_runtime_get_sync(adev->ddev->dev);
+	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2650,15 +2650,15 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
 		pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
 
 	if (pwm_mode != AMD_FAN_CTRL_MANUAL) {
-		pm_runtime_mark_last_busy(adev->ddev->dev);
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return -ENODATA;
 	}
 
 	err = kstrtou32(buf, 10, &value);
 	if (err) {
-		pm_runtime_mark_last_busy(adev->ddev->dev);
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2669,8 +2669,8 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
 	else
 		err = -EINVAL;
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -2689,9 +2689,9 @@ static ssize_t amdgpu_hwmon_get_fan1_enable(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	ret = pm_runtime_get_sync(adev->ddev->dev);
+	ret = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return ret;
 	}
 
@@ -2699,16 +2699,16 @@ static ssize_t amdgpu_hwmon_get_fan1_enable(struct device *dev,
 		pwm_mode = smu_get_fan_control_mode(&adev->smu);
 	} else {
 		if (!adev->powerplay.pp_funcs->get_fan_control_mode) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			return -EINVAL;
 		}
 
 		pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return sprintf(buf, "%i\n", pwm_mode == AMD_FAN_CTRL_AUTO ? 0 : 1);
 }
@@ -2737,9 +2737,9 @@ static ssize_t amdgpu_hwmon_set_fan1_enable(struct device *dev,
 	else
 		return -EINVAL;
 
-	err = pm_runtime_get_sync(adev->ddev->dev);
+	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2747,15 +2747,15 @@ static ssize_t amdgpu_hwmon_set_fan1_enable(struct device *dev,
 		smu_set_fan_control_mode(&adev->smu, pwm_mode);
 	} else {
 		if (!adev->powerplay.pp_funcs->set_fan_control_mode) {
-			pm_runtime_mark_last_busy(adev->ddev->dev);
-			pm_runtime_put_autosuspend(adev->ddev->dev);
+			pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+			pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 			return -EINVAL;
 		}
 		amdgpu_dpm_set_fan_control_mode(adev, pwm_mode);
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return count;
 }
@@ -2771,9 +2771,9 @@ static ssize_t amdgpu_hwmon_show_vddgfx(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -2781,8 +2781,8 @@ static ssize_t amdgpu_hwmon_show_vddgfx(struct device *dev,
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_VDDGFX,
 				   (void *)&vddgfx, &size);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
@@ -2812,9 +2812,9 @@ static ssize_t amdgpu_hwmon_show_vddnb(struct device *dev,
 	if  (!(adev->flags & AMD_IS_APU))
 		return -EINVAL;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -2822,8 +2822,8 @@ static ssize_t amdgpu_hwmon_show_vddnb(struct device *dev,
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_VDDNB,
 				   (void *)&vddnb, &size);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
@@ -2850,9 +2850,9 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -2860,8 +2860,8 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GPU_POWER,
 				   (void *)&query, &size);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
@@ -2891,9 +2891,9 @@ static ssize_t amdgpu_hwmon_show_power_cap_max(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -2907,8 +2907,8 @@ static ssize_t amdgpu_hwmon_show_power_cap_max(struct device *dev,
 		size = snprintf(buf, PAGE_SIZE, "\n");
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return size;
 }
@@ -2925,9 +2925,9 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -2941,8 +2941,8 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct device *dev,
 		size = snprintf(buf, PAGE_SIZE, "\n");
 	}
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return size;
 }
@@ -2970,9 +2970,9 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
 	value = value / 1000000; /* convert to Watt */
 
 
-	err = pm_runtime_get_sync(adev->ddev->dev);
+	err = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (err < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return err;
 	}
 
@@ -2983,8 +2983,8 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
 	else
 		err = -EINVAL;
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (err)
 		return err;
@@ -3003,9 +3003,9 @@ static ssize_t amdgpu_hwmon_show_sclk(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -3013,8 +3013,8 @@ static ssize_t amdgpu_hwmon_show_sclk(struct device *dev,
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GFX_SCLK,
 				   (void *)&sclk, &size);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
@@ -3040,9 +3040,9 @@ static ssize_t amdgpu_hwmon_show_mclk(struct device *dev,
 	if (adev->in_gpu_reset)
 		return -EPERM;
 
-	r = pm_runtime_get_sync(adev->ddev->dev);
+	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
 	if (r < 0) {
-		pm_runtime_put_autosuspend(adev->ddev->dev);
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
 	}
 
@@ -3050,8 +3050,8 @@ static ssize_t amdgpu_hwmon_show_mclk(struct device *dev,
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GFX_MCLK,
 				   (void *)&mclk, &size);
 
-	pm_runtime_mark_last_busy(adev->ddev->dev);
-	pm_runtime_put_autosuspend(adev->ddev->dev);
+	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
+	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	if (r)
 		return r;
-- 
2.28.0.215.g878e727637

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
