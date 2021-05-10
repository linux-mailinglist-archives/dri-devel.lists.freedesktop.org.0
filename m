Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D737940D
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F116E8AC;
	Mon, 10 May 2021 16:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C5C6E88B;
 Mon, 10 May 2021 16:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTe+9Al9HPlBMoLwvE/CRIAu3vCgw3JyUnpdLKjRJSA/BxFkoMpnmn2xIThK1KpRdljEshno9hw+9yO84hdxzI5fVMqC+012/KYJFytA/da50iPXGU5dn5lwJoxP24IuqSQf53MSQFVQBCpOrNL/2Z6O4d+mxUGwdyACbxCFmgl2ZH/dORBmc7cwm63vd4x0XrLL5LzLs7DIt3TvKEfrQGAlf+BTDIX3flBRB8jFPAdD20hMFFA2L0SHWLOeeHWrf7EvsmDb9yosW9dxJWvnjQ7zqziImST/uMFI4EDWG9aGzhfNk91MaSbCNB2xJnZ7z4JnNTYPgMoiHuZ64egZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x9LOr31QXQh26mL0MRx+84J3JNefHzW2myk9ZEcHMw=;
 b=Mf6DhPPQRHmqOgfLc2fsOWZ6kXTbDV5HoNUdJFGLFemDpWfBmeYsToJAxnqIel66PZLjDwXcReyaqwbVoPybpyihyAIm4dTNzDHBUiqTnwkWLfHDRwGpn5wNopnckLgv31YlebsNPVBNVs5KEZcH8oRIGn8QqRfQsC5YewZN7LiPPmE/l+hY1mki2G4dLD3WuTGHIxg4Rnwbx5i69vnf6uJ3ZUTANXRIwQUsaskWRLsXxTRS0AD+Rzt5nlj43TsA51n6CeMaBukPOuqJBHAhfQQhtoZkGIKqFK4qfw8ACQuwxKs9FFhM6YZm49lEx4juQBindShj1Yj/ye+6z6NHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x9LOr31QXQh26mL0MRx+84J3JNefHzW2myk9ZEcHMw=;
 b=32/tcg0Fri9wi1kijUGM2yxYG85sOgVUjsRMKF1JhoA37wA2oVC6A+FgE1y4L699/ZCdAVIoe6L1L8iTz7zTsVXFS59IaRSkgWfFrD75PWomQ5qVesm3RM95D725ybV1fd7jmq2l2/ojn1XvnHcpHPwGfe0NbSKZ2YfFPoA7BOo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:47 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:47 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 03/16] drm/amdgpu: Split amdgpu_device_fini into early and
 late
Date: Mon, 10 May 2021 12:36:12 -0400
Message-Id: <20210510163625.407105-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d56f206-11c4-4c5c-5ff2-08d913d1cdf8
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462463F12E37F564D1D711BEA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //jvJRMNpu2/zegt8mfyEyGF+wbYwmMlWgImVwMYu/JUTAQ4mMawAFaASQKzJyhXYyUOKV8rGpsXEwK/FVv+8mu2bkFeeOM1AYqkDwgloTJiHlqraHxsjjkc+w51ZsIhLrILFooQM8aOLN1mRll2kKBr6FBWZFH4BCPC1M6O/YR5AYIpWtHRDdnAMp5/6mDlg+ltl0TyF5aVcpQ4jmlYgoQ9jZqq0OLrKDTBAHsT+YgEQx2oVa5p82X68GePeoU9qeN4FLLyIf0bR2pmHUKG0m+RdX198J9BJHE4LIwFf6nN+kYOTjBgfTjqgp9rvxo9Nsz9CehLuEFipTIsXQ9JJw0952FkVyOGjjHujV7TQZE3MV8PMNN5HFLW8bKGQJqJa6VtVdGhnosMFAzi8hVd+nYKSgkdQ5M5Y+NpBEI3XyB0YgriaovKIjN7PASFdh5CuE2BufPiCDge81VikiuKZLu0/mZHEDMtG+aEjOGsBDD1m4yboZ27zBEKcyk9DRiidyMaGiJBKgyZC1CeXsm9Td6oXbEaucS9yTc+UVGopfLfYuOE+4e+ljGC2D1kRLe0MC+oONua53D31VNRSFOY4p7YX2nCaceT+eboSogXle0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(54906003)(66946007)(30864003)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWxBM0VtUlR2RU9zSG1oMHg4c2UrRVNVUThMUTE5a1E2ZXVMUDZBQStIYnFk?=
 =?utf-8?B?OThIaGR0ay9tek45MWJtdk5GVENjSXEwRnZUVWllcGdMcUk4WHFtZ2lkWHpv?=
 =?utf-8?B?eGYvQU9ZbEJsbjRqUFd6WFk3RVJJOFVVc0JQR21pMFIrKy85UXRtNGZCendi?=
 =?utf-8?B?d29FRzVWSHJHd1QyTkV1aGRMSmtZczYzRURKVlNtSXRPV0NZeEtNZ1MyWXBy?=
 =?utf-8?B?elB1cnhGZ0ROSnAyQ2VNeUd1ZVZsaGtLbDhWQ1pqZDMyRjBFK09uU3l4aXZu?=
 =?utf-8?B?WE5EcGdRMUs5UUhaZHRubllnWWZ3d3FzTEhtcld2NFo3U0ZsWkZuQ0NMREpz?=
 =?utf-8?B?bkwzQUVDSlFGYVAyOFo3MFVaem9GQ1NtdVRqRXpHYUR0RElmZ2R5VDBqUHpi?=
 =?utf-8?B?dWxiV1NEdENDTi81WkYxMlBURytnalpMb0RDZkZSUXZyTi9acktiUlFRQysw?=
 =?utf-8?B?bzlaUFdhamErRGN1ektxOXUwQ0ZLeXlpb3JEMG9BNTBpUEZGcjVvV1VmZ3My?=
 =?utf-8?B?K3hXRlMxZG9mczIyOUlJemlxZVB6QWgrKytUUGdLM1lBVmZ1YnNKby80R0ZG?=
 =?utf-8?B?TnZ4aUVyTDdyWDRrZjNzeUVCaEhWcE56S1VTckJtT2N5dVhkV1BpZWFIYXBB?=
 =?utf-8?B?bmpTZlBMTnc0UEhMVHQ5R0hQZkRGWnFzK3JhQW5SK2tKSVI3T2NJMkdDdXdl?=
 =?utf-8?B?ekVyQXZSZGJjYWEraU82MFNLMGo0Mk12WnVMaGV0NFYzZnhYaFN0b3cwYk81?=
 =?utf-8?B?TzZXUDIreXJTdDRPWkhyc0ErSlFGNEFXNEVHcGFqc01DZ1NTWGt5aHIzQkRP?=
 =?utf-8?B?R2xXa0NQVzU1SzNlaVZpU29PcUJvU1pMWkhneXFZWnM3eDJPbmpFR2VyVW80?=
 =?utf-8?B?NDRGZFQzdzlzMU1ZeHZmQTdlUUU2TjZ1ZFRndyt3MWtqTldQYnE1MEFXT2t4?=
 =?utf-8?B?ckNVSjdFc2wwTWtXYWZnaHBwWFJQejl4NlkxeHgreTFrd1Myam9mTUxsUjhL?=
 =?utf-8?B?M3BzU2MxNFhNQUtNbTJNYXY4KzR5TEdwS1ZGMStmeXQ4ZG1YY3llVG5NcUR4?=
 =?utf-8?B?UkttY2JxL2lpZ0ExZ3lEc3VKdDk4L2s3cHJkWGhoZThlWHhYQ1IyOTdFZG9p?=
 =?utf-8?B?ci9lN0Q0QmRyR1VtT05LOVBYWGVPMWkwd2JMdGJxT3JXbHM2dEI4ZkZIaHlK?=
 =?utf-8?B?YkRvSERUWDF5YmhtU2g5eklUKzQ4cEdPZThMdVRJcTBsS3phS05rVVE1czc2?=
 =?utf-8?B?eTJtWlNXcFFscE5hVW9wSTZLQUVKbVJUOE1KYzhzczh4U1UyZmdqV3NMSVln?=
 =?utf-8?B?K1hJcEZMRWd6emt4RUNJaTdzT2NRcng0ZkI1cllEV1ozdlRGZHJNWlBSUlFO?=
 =?utf-8?B?YlpvRmhNOURGVmMrUkhkK0YxWE9sNFd0NHFhR0l1NUhpSmdUb01jMllXWi9j?=
 =?utf-8?B?Mk5jUjg0SitpRTVQbkxnL1pGbGhqUXNWUHl1STNmTFJpVCthTjdRRyswTlJ3?=
 =?utf-8?B?OUkvSkF4QWdWN29pNzk5elQwRVBtVElvWmplT1ZJV2QycnFTN0NicWRsN0N1?=
 =?utf-8?B?ZkFpaGFXTkdOdC9SL3hCV2Z1MEM2SzNUV2s2dXFCZkdSMUp4SmZ3K2ZpV1pM?=
 =?utf-8?B?NGpOZ3dpbHpFZEQxeHJUUGVreTBmV010NVZuYXM4UjBUVGdxbkpkR21aSW51?=
 =?utf-8?B?WXRodDhldjhmOHcyeVM1MXYyVFA2UGZLazFsckdLQzF2TEYzL3BHZi93NGRv?=
 =?utf-8?B?QWxMUXRMWk1rODhKTXhFODJSWTdqUDRudFlxY0M4RnFVbFRCRCtyNG1UcWV0?=
 =?utf-8?B?ZGt5SUdpSTN4RDZzdFN2aTFqRXYxaFN3L3d0bC9OVlg1RS8vTjh3Z2pSZlFi?=
 =?utf-8?Q?ac92mJ96WrzGw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d56f206-11c4-4c5c-5ff2-08d913d1cdf8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:47.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqG7TWnqpjvUYDDVFzdQwFsOiej0qFZbchn4M4gVIa85XMhYjPUKVKMHGguEFntyZjNhI2C+bLHGK2f3p3n/RQ==
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

