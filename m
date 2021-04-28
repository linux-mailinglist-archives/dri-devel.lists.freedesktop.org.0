Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05136DB07
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E996EB85;
	Wed, 28 Apr 2021 15:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FA96E0F5;
 Wed, 28 Apr 2021 15:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPH8hBYl72Mc6J2ncQgzHXDLu1AVaY6BWab9rxElh3tT3BRk65hNKUFqECRNx82vjntc+O9q4JFy/bEhfxxlQVM/uCtgm6RQbqNhRsJqLviMJ3BMid4d70wMAOFRVn/R2buK1zDuykDM7Ji6L+K6Rf+sBg1Uzkl7PSrO+gQZCgg8jPTp4KWthv6mq1FJA7uHdupj7wC5cuJKiSVbQk+wmIsKMet/jZgRh88IBw/PqyZs13CjCPblY90GXBmoEh1TSc+cYEm9cJHTLhVpFuRKFV6nrirTqT6ZCv6FiqRcIy6NRNQpKcuiUcDd99RwiZXBARvNjRsMGs+/DOe8d3kxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV16xVnQ4igK/MMYjr6sTVnZY2gMzJTw2X/+xlBmqIc=;
 b=jhB4sJorS3T0mqHq1oD/V9k9Jd1VZKVeBKMHPlr2f9yExZfz2oi95vQEyCvTt1BgTglnLDS1XhVIYnoPFtWJJ9JxwckggeiD0YJFx8E+0fuPRwESJmolQmszG53xmuwEuvliVzFj7FT6ECIYe0/d6VWPBdsTXlCRH6xy8UaCUn8SjP7+xvuYFRJc7KklC22a0vStYSja/SVhMDKORAoO43ki7R9DQRl6icDudN0h4r87YyVqRCF2aEXtGai4cD+ez8kTApEuaVv2qivqH9XaR1ICsMAILtHWIeqpESXdSy34bchALDA//3GAtwgo8q1ZKpnoYxzEyvTiIhKrs6EwFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV16xVnQ4igK/MMYjr6sTVnZY2gMzJTw2X/+xlBmqIc=;
 b=akOMQCHIJpZYHvHMUcdS9nkVE+I1OCiXMy/4xf7YX0WPZNY+SoAwaH95qZmXAtCtBwPfD1q0VM7LAJBliGnUEWmEdTsrJUF8Beg82G6E5PI+isBOvi1PruFniyVNTHgPXEbkODS5bHyM6NSGUGhdQYt9vurnOR2Dj3UK01KT0FA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:48 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:48 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 09/27] dmr/amdgpu: Move some sysfs attrs creation to
 default_attr
Date: Wed, 28 Apr 2021 11:11:49 -0400
Message-Id: <20210428151207.1212258-10-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3239da2b-0d71-42df-ca9e-08d90a581547
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44625706D21A84217BF028D6EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MvAoludBJ2Ya6iXNq6muBS7Gw5PsCnKuq8xT9lXvwK6rkNc/wHD3cUMFSg2XyWOCyCBxdmmC3EYZ/IfUbQk5V/bCoJRsDc6w6MKQD7qVSRjFPID3dYaM2tFgBhCRF74DW3oGtKecOJbBlzZwEOPQYSISNVPHO2uzMZvhKPX1gKT2v7tiXBOWVJfKdfgZVLoN1pXifgMs2B4huCGX0GptFok5/SFHGjNT6zg980xAJy/1P9qlLTHjDDd/aR9vzkMJDmk7GqbgiqgJx4NcDdFdh2m2rKFH2jVBsFlBdUJT+mTn2qZlK1hGlEyIXr4q80qenrphC5yD/qIJUzjpHxe06jt+T1+6du7G26FHsLUC+25YStALUq4bFLf5ocHOYC+Nrt5/LtKTVMZoc+NjOhfIw+70nWUmVw7gyLT5AqBMGS9QBR0Jo26Plp5IPD7WTRC1RtoijPsAIUCHi+VH0KdtN7ThORYf4KH7Hj5dwPDy6bE1UowRcyICscHM6ATgac5lhCb3zSRFCVqjhMLtz54NXeBYzWlicOiReWO3V0XIC8hhSoyq8joM4mgLgVR/mvy/J/5HeWkg8bFE8cXVohsQQJl0wE5i5oox+ptJ/O9ct/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?40IOY/rHkn2/XWhDEmMu0EEHk+sx9qU5D8umGdbPgJr+cWsQ3vGeR8Zks5U9?=
 =?us-ascii?Q?2SeO/O9q9ACZGyTsYGqpz1s1bzPfgkKCi10xzfYzKfCDjQxB9xA9csetuwHt?=
 =?us-ascii?Q?OlfEZ8NgmkAvg1Qd6RyWv7YoFmVgrZoDHRvXvwVzFxSN20AkUw7lWxgIfd+2?=
 =?us-ascii?Q?CiH2GpNQeDb16M1peOlJVngRpgl8F9W6IGfJejxNv3P/Bk/AGv0OeCxkJhec?=
 =?us-ascii?Q?ausETei1NeZ0zzVVXicO/5NBLBWg4SvyYx39196RdS6OA11fjc+fVshwEvji?=
 =?us-ascii?Q?Syi9MlqZ9S94WPTsVHWRQyOdWLxShIj71wIz8WU3PUlHWrJQCgkIprWJDo38?=
 =?us-ascii?Q?hsaJ9F5UwRWTyyhCv9Cwm0yPcz+utThkAea7TqVvKHBeTv66FI4zmPKZBnk4?=
 =?us-ascii?Q?co28gp06CgFEFOU6gTaDd9f0hLazDMRVKxGOZm5PalNBgiTxjpUNOJrJZaS7?=
 =?us-ascii?Q?wqVYnT8UfNmWQ6SznWHZJYSpEYO01IAgZyId6ykhXqXz/WrRQ5D/IPVeILDF?=
 =?us-ascii?Q?u+fsfwCn9EAheA/cVD3j2eOFcC+W2meQUNwiCYEHFJpfemXPs4CNoZoSWni5?=
 =?us-ascii?Q?Ko/VGI5AdlaDOhdczah1wH44zK/30znaXHd817Khv52xntFH1A1UBkje6FRT?=
 =?us-ascii?Q?QHhlU+1lIP5UxHYVTpNoy2wxGNQdOEvyb5aVzUyYkO0Iko/IMsS/TGcksxoL?=
 =?us-ascii?Q?Xk8KnKs26Ej6DZMdeU3zExF33xRjqD3g2qtIRX/fh2F2hkpH1TRKEXiy5Lxq?=
 =?us-ascii?Q?gjFmCG6cSLnNIJcnxVEobUXRobDpPZfW5dabSxG6ZZtdqSSdE8IU0hm0ktmS?=
 =?us-ascii?Q?Nwif+UjipgBJrYn4rl1QXGCM0e9kU8UhnfukWNrmRV5jvE0Ahg+/mTybMnEh?=
 =?us-ascii?Q?rxjm4082rLv18PA1b6pUkUju2+buUrxWvx/VQbSEorsqrXylJMUKgNBj92wb?=
 =?us-ascii?Q?nF6CANVnTZCQSakR/gOYETgdFZA05Xkbltq0n3zOPIXdqn47XfRoLyGUpN4E?=
 =?us-ascii?Q?nmMILREoT88UquM3H3Ekrplg/le019HekUigPwm4o0TtI4BZlRnbLIwCHFSg?=
 =?us-ascii?Q?BICVEsCv64mj0aHcKSSyeMhZRtxaoSSc8wbi+qKGaIGeS5pRC/hFLvFzZ5X7?=
 =?us-ascii?Q?0HV/Z5XzT7ULJhfJvt+f9jkxyuqWItY1OXgJeB4DOimE4yBALtFuDX2mf9mP?=
 =?us-ascii?Q?ITCvsEKwg58dt/rE9ApPSks5Ujxj2Do4Gf6Xbs6YIgLryuo3Tburhfa7IeB3?=
 =?us-ascii?Q?5b01iACKa+SpIo3+IrkkdbJ+zIscMl6sC9/aT3oBR83GWQ7VfCf+BaAQWr67?=
 =?us-ascii?Q?DVQGQTeeT2UbXxJx09qxDpYcOHJ3fJ5NO5T9ya9ohdW0Vtus9RxjfEgaWvLP?=
 =?us-ascii?Q?IkEVf2MJ0LKBQazsPDEXClHO2Rme?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3239da2b-0d71-42df-ca9e-08d90a581547
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:48.0841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbeDRCExMKF9vABJx3RvKX3YPJ2g4TNdSh/2gRwh9LP0qGcDJIXVJkvr4rI6Crq3nUqRqQCIckRjQFtYGtJK7Q==
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

This allows to remove explicit creation and destruction
of those attrs and by this avoids warnings on device
finilizing post physical device extraction.

v5: Use newly added pci_driver.dev_groups directly

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 17 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 13 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 25 ++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 14 ++++-------
 4 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 86add0f4ea4d..0346e124ab8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1953,6 +1953,15 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
 static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
 		   NULL);
 
+static struct attribute *amdgpu_vbios_version_attrs[] = {
+	&dev_attr_vbios_version.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_vbios_version_attr_group = {
+	.attrs = amdgpu_vbios_version_attrs
+};
+
 /**
  * amdgpu_atombios_fini - free the driver info and callbacks for atombios
  *
@@ -1972,7 +1981,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
 	adev->mode_info.atom_context = NULL;
 	kfree(adev->mode_info.atom_card_info);
 	adev->mode_info.atom_card_info = NULL;
-	device_remove_file(adev->dev, &dev_attr_vbios_version);
 }
 
 /**
@@ -1989,7 +1997,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 {
 	struct card_info *atom_card_info =
 	    kzalloc(sizeof(struct card_info), GFP_KERNEL);
-	int ret;
 
 	if (!atom_card_info)
 		return -ENOMEM;
@@ -2027,12 +2034,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 		amdgpu_atombios_allocate_fb_scratch(adev);
 	}
 
-	ret = device_create_file(adev->dev, &dev_attr_vbios_version);
-	if (ret) {
-		DRM_ERROR("Failed to create device file for VBIOS version\n");
-		return ret;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 54cb5ee2f563..f799c40d7e72 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1605,6 +1605,18 @@ static struct pci_error_handlers amdgpu_pci_err_handler = {
 	.resume		= amdgpu_pci_resume,
 };
 
+extern const struct attribute_group amdgpu_vram_mgr_attr_group;
+extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
+extern const struct attribute_group amdgpu_vbios_version_attr_group;
+
+static const struct attribute_group *amdgpu_sysfs_groups[] = {
+	&amdgpu_vram_mgr_attr_group,
+	&amdgpu_gtt_mgr_attr_group,
+	&amdgpu_vbios_version_attr_group,
+	NULL,
+};
+
+
 static struct pci_driver amdgpu_kms_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1613,6 +1625,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.shutdown = amdgpu_pci_shutdown,
 	.driver.pm = &amdgpu_pm_ops,
 	.err_handler = &amdgpu_pci_err_handler,
+	.dev_groups = amdgpu_sysfs_groups,
 };
 
 static int __init amdgpu_init(void)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8980329cded0..3b7150e1c5ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -77,6 +77,16 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
 static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
 	           amdgpu_mem_info_gtt_used_show, NULL);
 
+static struct attribute *amdgpu_gtt_mgr_attributes[] = {
+	&dev_attr_mem_info_gtt_total.attr,
+	&dev_attr_mem_info_gtt_used.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_gtt_mgr_attr_group = {
+	.attrs = amdgpu_gtt_mgr_attributes
+};
+
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
 /**
  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
@@ -91,7 +101,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
 	uint64_t start, size;
-	int ret;
 
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
@@ -104,17 +113,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	spin_lock_init(&mgr->lock);
 	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
 
-	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
-	if (ret) {
-		DRM_ERROR("Failed to create device file mem_info_gtt_total\n");
-		return ret;
-	}
-	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_used);
-	if (ret) {
-		DRM_ERROR("Failed to create device file mem_info_gtt_used\n");
-		return ret;
-	}
-
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
@@ -144,9 +142,6 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
 
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
-
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index c89b66bb70e2..68369b38aebb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -154,7 +154,7 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
 static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
 		   amdgpu_mem_info_vram_vendor, NULL);
 
-static const struct attribute *amdgpu_vram_mgr_attributes[] = {
+static struct attribute *amdgpu_vram_mgr_attributes[] = {
 	&dev_attr_mem_info_vram_total.attr,
 	&dev_attr_mem_info_vis_vram_total.attr,
 	&dev_attr_mem_info_vram_used.attr,
@@ -163,6 +163,10 @@ static const struct attribute *amdgpu_vram_mgr_attributes[] = {
 	NULL
 };
 
+const struct attribute_group amdgpu_vram_mgr_attr_group = {
+	.attrs = amdgpu_vram_mgr_attributes
+};
+
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
 
 /**
@@ -176,7 +180,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	int ret;
 
 	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
@@ -187,11 +190,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
 
-	/* Add the two VRAM-related sysfs files */
-	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
-	if (ret)
-		DRM_ERROR("Failed to register sysfs\n");
-
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
@@ -229,8 +227,6 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
 
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
-
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
