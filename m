Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FD2FAC19
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E136E5A9;
	Mon, 18 Jan 2021 21:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5195C6E5AE;
 Mon, 18 Jan 2021 21:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC0T/3g86MgugFxFReElKPeiKvyzI/ak0afpe7HJ6BtsAEfVIju75UuK9h++aBJC3yi1/L1sa+vQYHJamL858dRXRAXzuL7lnEAjVgF7HpAM0yZ81Umhvd1XLda5d5oXW3yfQ5ZsANEyzl2J7cfrMQssnP2t0UYZb66MzQKW4wc/L7PIhk6c2a+f1FB2Do+JqBjOh/iAc2QZ0ukCIQre6bKAZGsbp+n8tnym2cWGhsEOu0LEiUYCCs3AfoCtZQcM6jxa9fodbcJzxYml7OS7NmFXej6eboesjO0HP2MfT8/7e4V0s2+siRy/8TbVfMorWEWn0qUSXGxuyTw6ugr6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPNvRvOuYfpxDobhAFMQosfBhPUt43d2TbuLSB3GNcw=;
 b=P+D/QxPFSN0UQ6m3WrBXIAVIXArUoypvpDvfBObiroxLAU29xLgB4EZ+EGB3ivz4WMBE0sKTF6azHKgFHJRbXcKMxlbJ5JCdgW0MLdxjH1CuoNVWn4AVCPNxxsVSfKPTWbPkO+OKZdkDNSqPJCpYcwE23ExHwN5Fig/G9EKAU9+RrccbwBWrw8q6W4JELzGBEkAaXeLWklOmHoUOw4oIgtMpJtvVc1bj0gD1AmblCoJJuS63FLTDAGbJTORet63mCv5OEU8FtvZj/X9+nDtBuylzkUk+hlEGN90y7eL4LcDYNtQxuoi9vKqyDDxHVPvp8VJPhfcfnfVq2jAOXkjyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPNvRvOuYfpxDobhAFMQosfBhPUt43d2TbuLSB3GNcw=;
 b=oAsVk0YOs+U4wi9iW7uyp7fkZRJkd/HCPNRkfCHc69TQV/QruSxhbmorsffbow05t9/jS8q8JXa1U+8wCBE6of6PTOGDftH/U+Vr5TlT6AAbI8Z7TRyO+oaN4sWbDWbfM+OO2tqWIpfmiqqzMmpnx2hrPfTWRWWuKb0pHAHHQSg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:29 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:29 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 05/14] drm/amdgpu: Split amdgpu_device_fini into early and
 late
Date: Mon, 18 Jan 2021 16:01:14 -0500
Message-Id: <1611003683-3534-6-git-send-email-andrey.grodzovsky@amd.com>
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
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56a92fb7-e8fc-4cb7-40a8-08d8bbf45daf
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47672B2A71CC9607E796D8FFEAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jSeYC2PFKJG9gHCDPGrZlYXN1sp5Qtqp1T7D3Jani6+sEqKGltTtXGwbCHoOy6XB1K7uMlA9j9Dzv5aWQ4Hkn35VpHd4L9uvPsWVlqMZW2bCgqViZCi22kr8aARp4zYwQG92irCQuBKTFPe0fEEaUyt/PgS0WI8PjCfELwoLsIqmsSA9+jW5crE/N3Xmb6Q2HzVzFEXdJcvVr8PqgAIx5Sprjg/pDCPM1SavhN0U/HLDE+d8XKZlyyafZRxU9n+lfNLqt8fhbR/20PNudOya0YuWWgyPufwPblPXYuGqJPnFH73ZTCvW6scAodbeejtPf8yJRi4DUXlZDHswVDHCcF9kQAXzO0XfJIIMflf62+tTqCIP29R/wuLJofFAynd4VaRrvZNBFtIvYM1gHdv7vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(30864003)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wZycfGio+tpLS4gcia8nn6N9Mpv65c/POOLAqyAGhY1R8QGr45DvrUCBpOJw?=
 =?us-ascii?Q?A9wHiJAk6erS6KwW5n6UnGsrfm2XcUX4VmhkfjbmqnNeTKjDbxnP6ER9mfYa?=
 =?us-ascii?Q?lmqOUM6JCdTzmvUYYnZDzsbm5+Sa25gn0kmMPds/U2es3EZ3hJZGm1r9kjCL?=
 =?us-ascii?Q?mxyLDGWIWy17cr3T4/29y2mR5Is+hmCx18TB+TLPW+lmvO2V3ggSdDHRGvVu?=
 =?us-ascii?Q?rHXAnCNSL0WP72jqPRHngd0Zss5d2TRechSuc3xqU87yjgRsUYRedTUrQ0pJ?=
 =?us-ascii?Q?t1AslyL8BrSjKxmZhnExCu+wD/VYCZ5NXZmZn4/588ATfEU+gNQO7PpBxsIw?=
 =?us-ascii?Q?xrZcIFDvmtGOfVPp4LCPAJEobSZ6fGYIR9qCgd9GuOFCapu34qkLn77GeavV?=
 =?us-ascii?Q?Yiwm0uFTPbq4oJKbgZguoCybk5i+Uk7fFN4I+jQp6mphF8P1V/by6HkHREFh?=
 =?us-ascii?Q?ptydB1yVzvbu6ZeuVac2sFdKmlA5S3WlbaI9tGjoEoWF4NYFqq1REcU9kDQC?=
 =?us-ascii?Q?V4okV2NeuXJlO/ApsyqUSk7EEvxXwBGy0B+LgBUx3ULAW8SzGEhRDgLl9LOB?=
 =?us-ascii?Q?xPGZqTs+rN3aG1FvnLUgzDYRTv78bStAruUBMf6Vir4urnAxbaWLzjy7jXZw?=
 =?us-ascii?Q?tFwtsZdU7k6RctfyrzHU41N5AlFy/KujuoGE9T5qRS/DyLqLyXZZ1VoQPuWk?=
 =?us-ascii?Q?gDReqG+mAilsoWyybUJhur56p73joNm0zeusO6+lNfe5ILlePq5bD1tUq9rc?=
 =?us-ascii?Q?Vuew+5kiSEoRFRlNEqsDMoGOKFHcS6hkXKHgMseg4Iuf+RujbtNFThNFiQwS?=
 =?us-ascii?Q?Pbp3pM3AzysHzUCVK1mkajJQTEelev7VdvKTjcLcBpmfpk2g90mkShI8K0ug?=
 =?us-ascii?Q?j/f+/c/FOVF4xQWMUZupPaovfm+DQavrlJZ/lGSqImx8htPuK5tHO8E7102W?=
 =?us-ascii?Q?r3geO0x7pQUYkG/RntB6tmO/+kg8YXM4hJ988lvyYDvSqcgI4h7KRLrUhBb4?=
 =?us-ascii?Q?Zej1byQYExTUmRpjqS1+4NJ7G/M+qceu97AMN57HZ1WXu0k2YBoWVvs/gXml?=
 =?us-ascii?Q?BLe62PxBjN7UW96XLMmn6pRmrbK1s7AHLKcnRekhH/ihFZyIF/GeaLt/JYsV?=
 =?us-ascii?Q?7rCEyYZUyuf8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a92fb7-e8fc-4cb7-40a8-08d8bbf45daf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:29.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBhRGIcjINthvdSvoFipKemcN5oSN/KY4QfyHgzBJUiSwHKJG9M/24Yk1NFfl3l6c+P92OtLnuinsGd6Ms9BAw==
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

Some of the stuff in amdgpu_device_fini such as HW interrupts
disable and pending fences finilization must be done right away on
pci_remove while most of the stuff which relates to finilizing and
releasing driver data structures can be kept until
drm_driver.release hook is called, i.e. when the last device
reference is dropped.

v4: Change functions prefix early->hw and late->sw

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 ++++++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 15 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 26 ++++++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  3 ++-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  2 +-
 16 files changed, 78 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f77443c..478a7d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1060,7 +1060,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
 
 int amdgpu_device_init(struct amdgpu_device *adev,
 		       uint32_t flags);
-void amdgpu_device_fini(struct amdgpu_device *adev);
+void amdgpu_device_fini_hw(struct amdgpu_device *adev);
+void amdgpu_device_fini_sw(struct amdgpu_device *adev);
+
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
 
 void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
@@ -1273,6 +1275,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
+void amdgpu_driver_release_kms(struct drm_device *dev);
+
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 348ac67..90c8353 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3579,14 +3579,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
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
@@ -3603,11 +3601,24 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
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
@@ -3636,14 +3647,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
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
index 72efd57..9c0cd00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1238,14 +1238,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
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
@@ -1569,6 +1565,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
+	.release = &amdgpu_driver_release_kms,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index d56f402..e19b74c 100644
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
index bea57e8..2f1cfc5 100644
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
index ac527e5..392a732 100644
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
index b16b327..fee95d3 100644
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
@@ -1153,6 +1154,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
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
index c136bd4..87eaf13 100644
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
index 7112137..accb243 100644
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
index d374571..183d44a 100644
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
index da37f8a..ee824d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -290,7 +290,7 @@ static int cz_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index 37d8b6c..b24f6fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -290,7 +290,7 @@ static int iceland_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 7ba229e..c191410 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -716,7 +716,7 @@ static int navi10_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 51880f6..751307f 100644
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
index ce33199..729aaaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -301,7 +301,7 @@ static int tonga_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index e5ae31e..a342406 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -627,7 +627,7 @@ static int vega10_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
