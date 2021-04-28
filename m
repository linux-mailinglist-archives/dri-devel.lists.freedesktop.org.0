Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BB36DAE6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C0A6EB62;
	Wed, 28 Apr 2021 15:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FBA6E0F2;
 Wed, 28 Apr 2021 15:12:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQFi/crN7hZPEDYxQUTKaVrtzHvoaQZoKlDgYAEM5Cn5E1guge6mLdrr94Ku2eI5Ged1HZzKs6Nj4ZGUt1KaW4DeQCqBqYDLp945g3Hi5OAqYkZ2VCCukx4DReoD4ZUAVl3bTVvedCCuxaM47cmscMfqLDzthQs68N3Qw0iF7I92YPJSFHcgulOIhgd+Ns4KFOQx9hYKkLgWf+dvg2UQE94iCUwxrtFlTF4VDGM3BSiLd9Iy61eOqrKJ4RL774YSLklNdPvamqEluAzQSP+cOb+7KWbkty8icr7C+bLAOke+9gVePPvFsQyQ3F6zJdGxwfj4K5cx+huNO7L6kp8pRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d3MUsHpF+5lMWV2OlCiCiRjN9rC1uRiwID31o4G1TI=;
 b=fLsGG4wotWl45U9+kjUeFdP1a86N4chhArVOAoRqDeXMxbwcf1SXpfff31WWtUaS11sHvY5zoNXiCj/cpuBsJZrsh2Lis1Z0OBkjHQSXfc8tS4S/QvRdpwN77Ua8VLDoNK907PfikN4lSgwuhmV+cfJcIfxe8WESt5otUwStqdpq5x3sbpvdOGGARGWtOBwELjMkPCwuUhhHWP/kQ7ysKC/LLEFfwtgZOhLyRvSg6PbevuGemWHD7yo8ZPPHFp5KB2lXqsYecjdskVXScfsgu6YvZRu581VgiXlY/SJngnBr/kmUtHjvFZijHbhanhhAdCfS/zoOY3sNkDZtjGpoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+d3MUsHpF+5lMWV2OlCiCiRjN9rC1uRiwID31o4G1TI=;
 b=VXFmWbbwGM27V4HQ89Ybte1Id9A7NB5z1kH0OgzSTahGpXqyF6ZW1dxV7Z24b7dNqeOUwI0fz96wYpJ00E0Z8LAtzA03ViY8CsTOkkLYszqjtotGEGkMIn/jMc0TCWbgwMJDr0d4jeP16jyBoLd1E+HkELCrry6YqkArC1DWJ4c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:37 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:37 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 03/27] drm/amdgpu: Split amdgpu_device_fini into early and
 late
Date: Wed, 28 Apr 2021 11:11:43 -0400
Message-Id: <20210428151207.1212258-4-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd8cd65-a85b-4c08-a13a-08d90a580efa
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44629A77737A7C202EA71A95EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oek5Bz5OAPnGhQykAqPI8KlfSyezy5IbQigx6nWAezODAT9xU0uzZTxC0pbVt49eyU+vf30XUX4ZB9Jo3Z5Le1pgw/LFNs27+cWVfPCoytnn/XoIjnL0itceoh5uhqm/CK2v9MiodaC0SkIXiUvezf+219QQ6Evx2cL3HqgwUTCcmR7YvSuOziear3moX+CajbmN2/YMqF/Mit+7NsPwNa91RlS9Xj+gERrCJA3tNdY1xmE3c4Ag20hCw1jYa0ieY3oSo0OEfDg2JaeHEl3orboGZ8oSD9t1/j7KTsSalDdaDkEpDx+32mOCMRUBxEKYFnYC3fPW6YXlp5Dht2mbKvPMGOMhV+fXiocMFiUhQBXjTpWAVOdFpQj8qTiZ9/hwW7L1QDgMLdXQJiDVhrA4+aOqYXHlfNhXTP5clS9+7eiXahkplkABqWM57tOVl5t9Enlok1XVTlxPP5RmvPDPEJhhJnvvN4DhhM61RZsL6JWottOOsWmvqA8YGpeuS6RcsGfVQZDXyyjCzdJXZHZVf/HZRLC/Cy8yfCxBvhE0SGLoYV9+OuoOSTD8mpX4AJcjxkJZDe4F8u8WbvFeu7mZ3BxSeGaC8SkKidGKZnDsImI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(6666004)(478600001)(30864003)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ddlo1cWyQ9ZE564eGlyWkW2w0/PoMHaUpEu32BWKDXFXkrsqgGzenFUESX0A?=
 =?us-ascii?Q?BaRdTEWwotmOA1FLMeWG2zU4Iwnfx901yiy8rjNuOQsvL0MMY/voa4MirR+c?=
 =?us-ascii?Q?75hUQmYpjuVBI/B7PIz8836PiaMDija8SWBb5NTw6o7qM/iZk28ut5PqwqPM?=
 =?us-ascii?Q?SrorZVgekVNrlGWzWeIgWT7pIlfIX2bfa83MkKp//mhHwJNTlUaJfm4E83H/?=
 =?us-ascii?Q?GEiIj40+SM4mxLq6lsuWbiskRK/cpDJf3VquLEXwUPLx2G72iPzRg8qGbfYa?=
 =?us-ascii?Q?1CXSuBKj0r19df0UgslC8mmyFbsUY6C0VnrjbCfGDr9zdx18A5Rn9EUKgMpE?=
 =?us-ascii?Q?9tELJl049kbE+yUNpOT/uYitlpkVO211z+JmuW4lSnD8T6zO+uRlU3MzAprl?=
 =?us-ascii?Q?apGemeYUDuXp8uwE9alVB0kskBbP1pdRjt4x8tIq1XAZmZcWvaehm3GjxZ6N?=
 =?us-ascii?Q?NYGvwifX+t/4+GEXwABfHY0A0qd3MiQv+MlLtvn5iiGYY1HE9Yf1HHGoUp1t?=
 =?us-ascii?Q?r4HpssM5gKdcHfoRXqPG4htDCxJCPgsyrsVFO39x+K/Vsc5fEE+SwakPjbXC?=
 =?us-ascii?Q?dAMuBcDnkpaxYcPAQJowHhnMWGh+z2X/5LMFLwz0xjFHFS9SbbkuNqwlnthN?=
 =?us-ascii?Q?MavHXSdDQkqEowcO8jwhGh59n4mgTDhpRK5mxezmzkVTMLONPXeOuI8VcJhz?=
 =?us-ascii?Q?yWj2t5J8uRCk3QAi/jL70wO561H9OEqWwNjgJ08hixLxUFkGm966X9b98qZ8?=
 =?us-ascii?Q?Dw957jdQ6TyeGvTdX37lkAmqsWe4Vm387ZULTjvMhUZn2NZ+XXwf25MzUmfn?=
 =?us-ascii?Q?7rWWIy5Q3JaOgw0Bqp1TDv7zZ/e4wONClF8JUXIPAAOrmwmFoUNalmd8BjB5?=
 =?us-ascii?Q?B0LMraf4PvtHizFHSgCPIkFRJ750aDQU2ermjlODzUGpU1KgPlIwGLhltppq?=
 =?us-ascii?Q?iSVfONksdSo3uL//QC2an/zRGF8+7cb6f1zrgB/FA0v1C44nzrhQFJPSUKwe?=
 =?us-ascii?Q?IRlgIjP89LOoqvRoL+Nsu0I0y4MVGLPrC5X4J9EesKxHohLcitF6byO1yl2Y?=
 =?us-ascii?Q?dGijYc3+4818kgfcxwK5swnZR7NpToINdcP3qIghxsik1oqQK5vLegC4WjJQ?=
 =?us-ascii?Q?yoLTbq6wLQUiFvSysMZDdMDOmbUpKm08ovkvinK7In4fooEXgZ3nmXSeHzzB?=
 =?us-ascii?Q?98/ajflSQeq/HMjzv3mUBpR+Sb26Lm6FY+ZFVXULdv9NaTTKDs96Nvw0aEVo?=
 =?us-ascii?Q?cZy+yGqqtoSx12AjSRTX4kIMRzEZOsl6nuDPIIWkuSvAelYdBrgcsM9Crvbs?=
 =?us-ascii?Q?nejhIXFjic6NV4WFZMRE4F+oSnr/X/oNYRhPfhtJaD3m9vfGa7SlySJ002z7?=
 =?us-ascii?Q?3A5qe2U7YvIqxB/ARbSnb0kigPmp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd8cd65-a85b-4c08-a13a-08d90a580efa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:37.5701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3lylv3bdgSyjGScgAN7h4CECg5i3Qy3R6BG6QxB91T3319nSIWsCqk1sO+ufISxCZI3qhMqYEzPRuSqrAFwFw==
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

Some of the stuff in amdgpu_device_fini such as HW interrupts
disable and pending fences finilization must be done right away on
pci_remove while most of the stuff which relates to finilizing and
releasing driver data structures can be kept until
drm_driver.release hook is called, i.e. when the last device
reference is dropped.

v4: Change functions prefix early->hw and late->sw

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 15 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 26 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  3 ++-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  2 +-
 17 files changed, 79 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 1af2fa1591fd..fddb82897e5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1073,7 +1073,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_device *bdev)
 
 int amdgpu_device_init(struct amdgpu_device *adev,
 		       uint32_t flags);
-void amdgpu_device_fini(struct amdgpu_device *adev);
+void amdgpu_device_fini_hw(struct amdgpu_device *adev);
+void amdgpu_device_fini_sw(struct amdgpu_device *adev);
+
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
 
 void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
@@ -1289,6 +1291,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
+void amdgpu_driver_release_kms(struct drm_device *dev);
+
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 6447cd6ca5a8..8d22b79fc1cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3590,14 +3590,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
  * Tear down the driver info (all asics).
  * Called at driver shutdown.
  */
-void amdgpu_device_fini(struct amdgpu_device *adev)
+void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 {
 	dev_info(adev->dev, "amdgpu: finishing device.\n");
 	flush_delayed_work(&adev->delayed_init_work);
 	adev->shutdown = true;
 
-	kfree(adev->pci_state);
-
 	/* make sure IB test finished before entering exclusive mode
 	 * to avoid preemption on IB test
 	 * */
@@ -3614,11 +3612,24 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 		else
 			drm_atomic_helper_shutdown(adev_to_drm(adev));
 	}
-	amdgpu_fence_driver_fini(adev);
+	amdgpu_fence_driver_fini_hw(adev);
+
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
+	if (adev->ucode_sysfs_en)
+		amdgpu_ucode_sysfs_fini(adev);
+	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
+
+
 	amdgpu_fbdev_fini(adev);
+
+	amdgpu_irq_fini_hw(adev);
+}
+
+void amdgpu_device_fini_sw(struct amdgpu_device *adev)
+{
 	amdgpu_device_ip_fini(adev);
+	amdgpu_fence_driver_fini_sw(adev);
 	release_firmware(adev->firmware.gpu_info_fw);
 	adev->firmware.gpu_info_fw = NULL;
 	adev->accel_working = false;
@@ -3647,14 +3658,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 	adev->rmmio = NULL;
 	amdgpu_device_doorbell_fini(adev);
 
-	if (adev->ucode_sysfs_en)
-		amdgpu_ucode_sysfs_fini(adev);
-
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
 	if (adev->mman.discovery_bin)
 		amdgpu_discovery_fini(adev);
+
+	kfree(adev->pci_state);
+
 }
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 671ec1002230..54cb5ee2f563 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1249,14 +1249,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-#ifdef MODULE
-	if (THIS_MODULE->state != MODULE_STATE_GOING)
-#endif
-		DRM_ERROR("Hotplug removal is not supported\n");
 	drm_dev_unplug(dev);
 	amdgpu_driver_unload_kms(dev);
+
 	pci_disable_device(pdev);
-	pci_set_drvdata(pdev, NULL);
 }
 
 static void
@@ -1587,6 +1583,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
+	.release = &amdgpu_driver_release_kms,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 8e0a5650d383..34d51e962799 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -523,7 +523,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
  *
  * Tear down the fence driver for all possible rings (all asics).
  */
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
+void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 {
 	unsigned i, j;
 	int r;
@@ -544,6 +544,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
 		if (!ring->no_scheduler)
 			drm_sched_fini(&ring->sched);
 		del_timer_sync(&ring->fence_drv.fallback_timer);
+	}
+}
+
+void amdgpu_fence_driver_fini_sw(struct amdgpu_device *adev)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		if (!ring || !ring->fence_drv.initialized)
+			continue;
+
 		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
 			dma_fence_put(ring->fence_drv.fences[j]);
 		kfree(ring->fence_drv.fences);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index afbbec82a289..63e815c27585 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -49,6 +49,7 @@
 #include <drm/drm_irq.h>
 #include <drm/drm_vblank.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_ih.h"
 #include "atom.h"
@@ -313,6 +314,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
 	return 0;
 }
 
+
+void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
+{
+	if (adev->irq.installed) {
+		drm_irq_uninstall(&adev->ddev);
+		adev->irq.installed = false;
+		if (adev->irq.msi_enabled)
+			pci_free_irq_vectors(adev->pdev);
+
+		if (!amdgpu_device_has_dc_support(adev))
+			flush_work(&adev->hotplug_work);
+	}
+}
+
 /**
  * amdgpu_irq_fini - shut down interrupt handling
  *
@@ -322,19 +337,10 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
  * functionality, shuts down vblank, hotplug and reset interrupt handling,
  * turns off interrupts from all sources (all ASICs).
  */
-void amdgpu_irq_fini(struct amdgpu_device *adev)
+void amdgpu_irq_fini_sw(struct amdgpu_device *adev)
 {
 	unsigned i, j;
 
-	if (adev->irq.installed) {
-		drm_irq_uninstall(adev_to_drm(adev));
-		adev->irq.installed = false;
-		if (adev->irq.msi_enabled)
-			pci_free_irq_vectors(adev->pdev);
-		if (!amdgpu_device_has_dc_support(adev))
-			flush_work(&adev->hotplug_work);
-	}
-
 	for (i = 0; i < AMDGPU_IRQ_CLIENTID_MAX; ++i) {
 		if (!adev->irq.client[i].sources)
 			continue;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
index ac527e5deae6..392a7324e2b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
@@ -104,7 +104,8 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev);
 irqreturn_t amdgpu_irq_handler(int irq, void *arg);
 
 int amdgpu_irq_init(struct amdgpu_device *adev);
-void amdgpu_irq_fini(struct amdgpu_device *adev);
+void amdgpu_irq_fini_sw(struct amdgpu_device *adev);
+void amdgpu_irq_fini_hw(struct amdgpu_device *adev);
 int amdgpu_irq_add_id(struct amdgpu_device *adev,
 		      unsigned client_id, unsigned src_id,
 		      struct amdgpu_irq_src *source);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 64beb3399604..1af3fba7bfd4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -29,6 +29,7 @@
 #include "amdgpu.h"
 #include <drm/drm_debugfs.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu_uvd.h"
 #include "amdgpu_vce.h"
 #include "atom.h"
@@ -93,7 +94,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	}
 
 	amdgpu_acpi_fini(adev);
-	amdgpu_device_fini(adev);
+	amdgpu_device_fini_hw(adev);
 }
 
 void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
@@ -1151,6 +1152,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
+
+void amdgpu_driver_release_kms(struct drm_device *dev)
+{
+	struct amdgpu_device *adev = drm_to_adev(dev);
+
+	amdgpu_device_fini_sw(adev);
+	pci_set_drvdata(adev->pdev, NULL);
+}
+
 /*
  * VBlank related functions.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 1fb2a91ad30a..c0a16eac4923 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2142,6 +2142,7 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
 	if (!con)
 		return 0;
 
+
 	/* Need disable ras on all IPs here before ip [hw/sw]fini */
 	amdgpu_ras_disable_all_features(adev, 0);
 	amdgpu_ras_recovery_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 56acec1075ac..0f195f7bf797 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -107,7 +107,8 @@ struct amdgpu_fence_driver {
 };
 
 int amdgpu_fence_driver_init(struct amdgpu_device *adev);
-void amdgpu_fence_driver_fini(struct amdgpu_device *adev);
+void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev);
+void amdgpu_fence_driver_fini_sw(struct amdgpu_device *adev);
 void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);
 
 int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index d3745711d55f..183d44a6583c 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -309,7 +309,7 @@ static int cik_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index 307c01301c87..d32743949003 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -301,7 +301,7 @@ static int cz_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index cc957471f31e..da96c6013477 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -300,7 +300,7 @@ static int iceland_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index f4e4040bbd25..5eea4550b856 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -569,7 +569,7 @@ static int navi10_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 51880f6ef634..751307f3252c 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -175,7 +175,7 @@ static int si_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 249fcbee7871..973d80ec7f6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -312,7 +312,7 @@ static int tonga_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 88626d83e07b..2d0094c276ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -523,7 +523,7 @@ static int vega10_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 5a3c867d5881..9059b21b079f 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -558,7 +558,7 @@ static int vega20_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
