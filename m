Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB837BFF7
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CB86E507;
	Wed, 12 May 2021 14:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2046.outbound.protection.outlook.com [40.107.102.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449D5899F0;
 Wed, 12 May 2021 14:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDjKdmFDx6J4sJvCAv8mGUSpjQpWWUqFNWafsEh7aP9+OSfprhWD96ceGHyCYTLyoZSQfhWMdENfZnUy5YeblOOB8mrF6hqzkOba0IjBcB0cBUSjJCuLdoaneRFekUW/eQkPwrJKMexx6YTabHeYwg50nr5iAL07VI9Ov62cXk/mfQIrQpj5QRc/Fo2gVpht5ghS2aMXbo+APncC6htNq1BU+rj39CePbdxf4NhFARdYFPTLngD47rz/01wYRQtnlYUKV/ItV79qYdjejFav2206gb2aWKEz2Hre9JBPGbj5b+7+Wxd5lrQNHVzdQ/t5uFt/VdwAnbnKrRF3nHZeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x9LOr31QXQh26mL0MRx+84J3JNefHzW2myk9ZEcHMw=;
 b=QdeaMp/tfFyo8bSnV2j6s0zYMCp229n4aURnGQ5UJVbtbItYYzYwcqJ00baqz82zkkQ0vIprGJg7YG5umYNhargNpWEAqtSn4QaOqUOLvw/D0EE4uVZWphCsaDIqIv3rNwPM3Wt/ESivFupsSQUhtjKEOF8TAXLs3sf4/iqzBxqcy47/inCBktcVH176nToC7wPq9GVi5WPaQJAdrVnk94a69ZzD2z9XLuZMS1HZ16j1psP7MiJ1ixuSUEyCRTcGizUWhmq+1hpTPs4XlEYzvNon0F1LlmDiS87eED0kiBUCV0x/76qG9G9VBbTYpm+7Gx0p2tl0mNB7rjQ6pwlwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x9LOr31QXQh26mL0MRx+84J3JNefHzW2myk9ZEcHMw=;
 b=ofNVIaJIvhWUP4Vj7LrIRfI7si31+afqaT5VoCUPuOhQncIHJah4Mn9pf7aPz8xzL0UZPI6P+QItuRrIIWZQ7J4pMntdFeAQj4C4ZsnLUGE7DaW3Zgx8jj9zveYxhWKRVIH6KihEfZXAYmUP4oCawd8+0Ikb4qxyujWfDj6gjFQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:09 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:09 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 02/16] drm/amdgpu: Split amdgpu_device_fini into early and
 late
Date: Wed, 12 May 2021 10:26:34 -0400
Message-Id: <20210512142648.666476-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0253bf37-5a2c-4721-510c-08d915520672
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4576CFD42802412E743934DDEA529@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUk+g7dHrI/2cpfTZMzVHbrE68z9KQCltBgvxkrHHkQZLPm3U+TSkvl8SmsKqSfvX4lXXj7xS9Ho1ncs3YnzLGUifHwd9F3h/GGCgGLfvBGjM3rIWCC9Cp+luHcLbJVUJry1et6LbHPQDL3RW9edjuFxK8XXn4s0bCNVeeqN+zgWkqbVJ6aXj6RHxqAOsVA9cZt0dkBpK55/foIW799VORZawC13914WJqxV094xFDpYruNwtJSKB9hmPyWmBhZ4Hvlaqi32q2Bow/BKjHw+AIDsfdMny4Jf51/1MeGZyZJIozZd2w6XeNv48KCGsqVMa0O7F0ZI0NPf3rhzbbnBcR8a2OPJlowOIsHgbFyBTK7tpfJjSlImczmeulsK00L/k5w0B5VshKhQrvqCgB7j2DCJUdselzTiNvB5x+4ndTUw0lmCz3vYn5uIgbddjGqUtNLYGBYBSNBR6+6prR2WUJsMcy9//+EOLYqj/gmag9kEUQ291m1tji8B2WbivGAaLQ3VtU7bzipuF8MoGOMlIA0vUNY7hcAOdPDTttGI4DcWFJuH1W+bn6sfMmXTzSq7G0cpWPFbSrOUb5YJZs6alk49x8Q6oxnw54oRzeBmEUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(66574015)(38100700002)(5660300002)(1076003)(6666004)(186003)(316002)(16526019)(8676002)(83380400001)(66476007)(2906002)(6636002)(86362001)(30864003)(52116002)(36756003)(54906003)(2616005)(66946007)(66556008)(8936002)(6512007)(6506007)(44832011)(478600001)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dld6MHNJUk9HTGRDRElIZE5LOUQyNEF6ZThkLzYzSVAvbGRLYVY0SGVEeDdl?=
 =?utf-8?B?UVo0WTNSaHZDb2p4NkIyY1FpeUN5ejdvbnRBNEl2UHd3NEJaTm54YUZrd2lW?=
 =?utf-8?B?UHloTHdRMm0yUUdteUdsZ0lMa1lCWUhRMkovbEtoMDZvWUg2VFU2SXRnbVFF?=
 =?utf-8?B?TUtKS0haQlJIOWxwbjJmQ3E5TjAyUURrb1htYUdDVjBlWlJwckw1S1lTaXo0?=
 =?utf-8?B?WkM3Z2lkSWdLUTBHSWRMMG1JbDJZeDM0eUtsTUpPVm1IVnFmMVRtRTQvQW4r?=
 =?utf-8?B?QVMwUDVwRzRmaXJBajczKzFubndhU21CYXZXblYvcDNGTkt1eTBKb1BrVmd1?=
 =?utf-8?B?NEZ6cW1RSG1aelBKWVc1S3dERzVxT2N2ald3RS84UHk3RjFWOTBLTmtVSUY4?=
 =?utf-8?B?cHZFQWh0UXUwdlV1UlpZYXNNcXRPNVdQSmVzUmthVi9OZmU1eS9obVl5RzhQ?=
 =?utf-8?B?N01LOXJMWDN1T1BMY0k1TEFRUVU4Uk8rOUZZNFBna2VCNzNZaVpIWml1SEtm?=
 =?utf-8?B?d2l4Yk9hTCt0bXVud2QveXUwRm4wNVN4aHd5REt5T2szOHJwbDAvYjQxLzdY?=
 =?utf-8?B?Y2RlNU9XN1FPaERqZjhkeU5RZE14aENqZU1YOTRtNklrMXhUQ3RzTXJESWVj?=
 =?utf-8?B?K2doSEY3aG50UWx1eGY5Z05JWW9ZZFBDV1JYWktVUG51ekFPOTVFNGI5QnVj?=
 =?utf-8?B?czYvZldvVjREeStzWkNsOVRIQjJueDFhYVlSS2RnWnZvcDAwL3NiYUw0YldP?=
 =?utf-8?B?Njc2TVIvV1YvYVIzakF0NTRacmlnUXFxaFc4YlUvSVBjU1VWTTkyQjlaS3FJ?=
 =?utf-8?B?VFZNU2hJUXdtTndqVVMzRDRKcFJoRkZGMnNMNm1RaFd1VXQ0RUJTTzI5WUkr?=
 =?utf-8?B?dXZCandabkpBVlZhb0J1bzNOTlJNSWlraXJNZVc5bTdxc2lDZG1DNTFDNFNM?=
 =?utf-8?B?d1FzZGJmWlBNK3Z3WnluVVVHejRNMEZuenlGNmJ0d0gxUlNOMkt5cmFaaDY1?=
 =?utf-8?B?Z2pFRzlBK2RNMml6UHk0NEZxZm1MVGtvTlZlUElqN0pnT0JibDdFL3pBYldJ?=
 =?utf-8?B?SlM1djQ5M3ErQVFHZlZCTDJoVWF4SUZBb1k0WXZ1SzU0eldNNXQwbmFtMDJC?=
 =?utf-8?B?cFJCQXVDenJ4SkU0b1ZLQlpaTnRhQmwydVM3dTN1L3RlTG8rTEdlUTlWWFI1?=
 =?utf-8?B?bTBsemprVVVZUWowWVNTNXlmaXJPVHZtZWR4ekNIUG1kQ2x2eUFrMmlOQXd3?=
 =?utf-8?B?VFhlVktObHZ3VTdlczFMRm85SElGT1lQSldKWE53WWs0Z2lJY3pMcThKblVY?=
 =?utf-8?B?bm1jVUR6ZEdWWWJ0MVBpdjF4UTVwM1hVcDNsOUpuMFNvSkxpWkhCb1d5cGl1?=
 =?utf-8?B?aTd4T1loTDNMZTVERmpCYkJqK05WdDJJOXYzNnlkRkkzQW5NZE45My9Gb0JU?=
 =?utf-8?B?a2dXQ0w5ZXVRZzBxT09Wd016YlVQNldkMDZDZU43d25adTNkSFJZM3d3Sk9M?=
 =?utf-8?B?eS9COHN6cSt6WTRDM3NWWEpwdkc0OEdoby9oazIwbndRb2c3S2U5bGMvNFpU?=
 =?utf-8?B?eTFIOGtOMWlKcDhXeFFCYUs5U1pNZ1BCa1l1V2dhNUVWVys0VEZBMkw0eExi?=
 =?utf-8?B?NjJSVnNCZFRTM3MvVEdLVU9kbWFiVVBTZDFLMEE1dWphTlpwRmFYMTNpSDhy?=
 =?utf-8?B?cC9GZnZHSExhY2Q4WUdyVWdmQVVlbEFkbWZPYW9EREpORGc4SUpIV3dGcXhh?=
 =?utf-8?B?MTBSS1NUVWJaWXJyZjJjd0lkUkFpaDI0NDcwVHhwdzh6RjJwQ3E0TWZlejJW?=
 =?utf-8?B?Sk1OL1FGMzZ1OG1xNnd1TThOTGNJeDJEWGNGUHRldURTRGNkT21VZUtiaFky?=
 =?utf-8?Q?PtsYntI+vc0nk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0253bf37-5a2c-4721-510c-08d915520672
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:09.3090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dqpu5joRz6BGJNehmMl+PCCBrx7jQbRLMZE7yu9B29TKGAaVHPoeo31BumGwC1Og8ScfzV7utj9JeSGIeV4PmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
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
index 380801b59b07..d830a541ba89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1099,7 +1099,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_device *bdev)
 
 int amdgpu_device_init(struct amdgpu_device *adev,
 		       uint32_t flags);
-void amdgpu_device_fini(struct amdgpu_device *adev);
+void amdgpu_device_fini_hw(struct amdgpu_device *adev);
+void amdgpu_device_fini_sw(struct amdgpu_device *adev);
+
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
 
 void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
@@ -1319,6 +1321,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
+void amdgpu_driver_release_kms(struct drm_device *dev);
+
 int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
 int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
 int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b4ad1c055c70..3760ce7d8ff8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3648,15 +3648,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
  * Tear down the driver info (all asics).
  * Called at driver shutdown.
  */
-void amdgpu_device_fini(struct amdgpu_device *adev)
+void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 {
 	dev_info(adev->dev, "amdgpu: finishing device.\n");
 	flush_delayed_work(&adev->delayed_init_work);
 	ttm_bo_lock_delayed_workqueue(&adev->mman.bdev);
 	adev->shutdown = true;
 
-	kfree(adev->pci_state);
-
 	/* make sure IB test finished before entering exclusive mode
 	 * to avoid preemption on IB test
 	 * */
@@ -3673,11 +3671,24 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
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
@@ -3703,14 +3714,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
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
index 6cf573293823..5ebed4c7d9c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1311,14 +1311,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
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
@@ -1748,6 +1744,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
+	.release = &amdgpu_driver_release_kms,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 47ea46859618..1ffb36bd0b19 100644
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
@@ -545,6 +545,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
 				       ring->fence_drv.irq_type);
 
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
index 90f50561b43a..233b64dab94b 100644
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
@@ -348,6 +349,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
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
@@ -357,19 +372,10 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
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
index cf6116648322..78ad4784cc74 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
@@ -103,7 +103,8 @@ void amdgpu_irq_disable_all(struct amdgpu_device *adev);
 irqreturn_t amdgpu_irq_handler(int irq, void *arg);
 
 int amdgpu_irq_init(struct amdgpu_device *adev);
-void amdgpu_irq_fini(struct amdgpu_device *adev);
+void amdgpu_irq_fini_sw(struct amdgpu_device *adev);
+void amdgpu_irq_fini_hw(struct amdgpu_device *adev);
 int amdgpu_irq_add_id(struct amdgpu_device *adev,
 		      unsigned client_id, unsigned src_id,
 		      struct amdgpu_irq_src *source);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 39ee88d29cca..f3ecada208b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -28,6 +28,7 @@
 
 #include "amdgpu.h"
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu_uvd.h"
 #include "amdgpu_vce.h"
 #include "atom.h"
@@ -92,7 +93,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
 	}
 
 	amdgpu_acpi_fini(adev);
-	amdgpu_device_fini(adev);
+	amdgpu_device_fini_hw(adev);
 }
 
 void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
@@ -1219,6 +1220,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
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
index 0541196ae1ed..844a667f655b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2325,6 +2325,7 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
 	if (!adev->ras_features || !con)
 		return 0;
 
+
 	/* Need disable ras on all IPs here before ip [hw/sw]fini */
 	amdgpu_ras_disable_all_features(adev, 0);
 	amdgpu_ras_recovery_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index ca1622835296..e7d3d0dbdd96 100644
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
index ca8efa5c6978..dead9c2fbd4c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -513,7 +513,7 @@ static int vega10_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 8a122b413bf5..58993ae1fe11 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -565,7 +565,7 @@ static int vega20_ih_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	amdgpu_irq_fini(adev);
+	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-- 
2.25.1

