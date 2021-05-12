Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736C37C006
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56996EC0F;
	Wed, 12 May 2021 14:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE95B6EC14;
 Wed, 12 May 2021 14:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jlohzi4jlJFCfQ+AbqnLz7TSTFLiT9vWHJoJWR59lWod+84YqXifufwXfvEgGQpy3zqAU1vaKcQ4U6H5W8aCf74b9c6tTbRZhtP/oMM16JA7b7CynijVc7oc0am+ZCufm/Ub2NDu5ovsdpDqTE6KL5VYZeEw8OrJXuGnqzfFz3gKqs17Lw9sBBTNERo7wRVtSLWgynF0JBayacOVwylX6e1fOPUYp22yvkgO47pbP5FgY9X0U9A5+P9SSh2OLQFcvXIDm50u6mmN0Z6qSJxQaC8h3aZpDC/VYsIhqCtT1L0r92RhKNScTXHogWw/PU6av9OQWHYTakuqvGDRXBYJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j+bM1q4z3pMJEkudykjSW5dJG+JuOaAr7e0M6/ckSw=;
 b=biGjpNvl7b82q+PwL9wI8EAepzxD3HsxeZfODkC2mE+0FKTOdqWv5Gh2ldi+ZZQ8vAsXVaRO5JZqyWMwA0lFPcaIv0alIq7y1DIqKAetjev88BlIiPaLsT6Op3755uHAz/3R2iV7jJr348cz3+JuVD2s/Fn4iorKAy0/zJOEZCvNRvhuxs65PA8J0BV49SFfhdXt246RlA8EWEwlhBS164x3jRCzkdWoawkxnSW5wXlV8ZLlJTWvhQM6lZjA3BGXZV24caAwp04dSgzrYeb0XDReGO6Dhwj3T8gJyXeK/1jOi/YN78e8S4d3Sm0vGnx2woIfTS21YR5DdTlHiyuR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j+bM1q4z3pMJEkudykjSW5dJG+JuOaAr7e0M6/ckSw=;
 b=ddjX09QaEOh1ra+Wyrm7sDzzGIWUBL4l2kZKVNMmrWjenI1ySrSTqeL7QJHR/lMS0XW7aJ7Vatspab4QN0Rg0uDLIC++eqgppd5iwjiCnpak4V12xjyRCSyi8LIZUhPvAkHDogDLGaWQYx4DbA/6jHe0QV62hy+0zv1/8f9zOxg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 14:27:26 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:26 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 08/16] drm/amdgpu: Convert driver sysfs attributes to
 static attributes
Date: Wed, 12 May 2021 10:26:40 -0400
Message-Id: <20210512142648.666476-9-andrey.grodzovsky@amd.com>
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
 Transport; Wed, 12 May 2021 14:27:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e3753d6-d2bd-40ed-d4b9-08d9155210f5
X-MS-TrafficTypeDiagnostic: SN6PR12MB2845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28456AF5162A7817BB97C6C0EA529@SN6PR12MB2845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NuHBhvPgseDyf/4H1ld5FZxFb7YL93e4NSR0VdOVJIvO4ZNcyQpXfBlfY4KC6V8e5z6OOaEp817+jghKDylxUrFxOyf7Ayjzl8hUZ32AkkXLVbBMKh+MvMEIxBI/epyIYkHVssBUJS65xBvpGVL9QhARV99WFhtWvXg4E4ATxKJXa6M47+l5P0fDfuLTUzfUZlxXAhrW5Yb5+UuWxT62NdTt5nElgRQlL1z/jGAhZqbHX8RGPamG6CeFVAC+b6HmeMZK8PAa/nfghMGGNGUFeqwjqWou3w1VfLhPzCFlurkg9V7WMnAhjqw0rIVg+nK3Ky0mjZL6nlg4Jw2sAfbIEGrHSZ3uFYt7dxagjViMcWQi7stWCXE4XnafDW6JrBhTU5/3RnCrjR2M/VY27S62/Px97+90CjeU68tyebjU1929JojzKLnpJWhedwANLHOd9UvYj8c84ncAhrh5sNkAfZ2DGTckHMvrhLrV5almfZmTyW6d+Sv8w62pY5chlEgQlzKZ59/LbzZa06+jSb7WzgQUQmKjn4Lw8GtgsowegP/uHZv94wyyGWxcFAzjyTFklAIjFt6w3pTbtjtrGLHBWzAe73sb0+uvvrlVRJj0TcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(6486002)(8676002)(54906003)(316002)(6512007)(16526019)(6636002)(478600001)(1076003)(186003)(4326008)(44832011)(2906002)(6506007)(8936002)(5660300002)(2616005)(38100700002)(66574015)(36756003)(86362001)(6666004)(66476007)(66946007)(66556008)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVRDMFF2RDR2U3JMNHQwUWtNZi9OcXZWcnozOThuNjJGTER4MUwrQkMrSks2?=
 =?utf-8?B?UENzZDF6T2dDbGdOOEpJOWVseUJ4cVpncU5vM2cyOHpuQ3piczlqL1A0SmNW?=
 =?utf-8?B?K3psY2JJQVRrOURhTmNINE1PMHRKU3VldlYzUjFib25ZMkF5dm91anJ6VW9M?=
 =?utf-8?B?MjVFUUk1VmxlM1JJVnQ1UW45ck10ekpzSytlVm1EQ29TSnRCVG1IbFY4Z2Jx?=
 =?utf-8?B?bFZtRHhlUWowOUh3UlFkWnNaamQ5YXp6TXp3cFZXQmt5UE5TdmN3RS9WU21v?=
 =?utf-8?B?NmY5NEQwRXByMk5ZdkZJQVFISVJ4ZTBQTHlKRmx1a1NKNmtneGE4S3hyTlZP?=
 =?utf-8?B?K0hkTzRxakJ2eWxiQ1prd09hdFB1NzdVbXhLUEttMC9FRDlVUStRcGdhOURJ?=
 =?utf-8?B?RU5kWVRscDhRVG0vVGdweEdNUmUvZ2ZBcVNhdEI3VW5RWUt2TlpxZXRGaUZr?=
 =?utf-8?B?SDBYMVNQZVFzd04wTDdwNTVRTGRDbDh2MzJKK1ZDVU42dm8xek1YSlNYeEs2?=
 =?utf-8?B?K2wvMnk3Q25hWUl4ajNzcjhJVWNYYlF3V1R3eDIrSGdDMDdUZHhiRm95NXMw?=
 =?utf-8?B?NjFKYUxXanFiOFU5Mlp5WVVCd0VjK0ZnZXM2T3A0YzA2N0I4U2dydFRtcU00?=
 =?utf-8?B?RkJBSllBNG1DRmNlb2Fxd2pyWGtqL0dWM1Q2UXRYbGVZMDZ1M0luTFRQbmtH?=
 =?utf-8?B?di93YU9UQ0lOQnNmNHY4K2U0RGRqOU9BL2o1QU9JZU9VNHZTREV1QThVenFG?=
 =?utf-8?B?YksxSWY1N3lFU2Q3ZXh6WW13VzdFSmcrUThST3UvWmhYYmxONVQvcEE4TlF5?=
 =?utf-8?B?ZWdHVkJuYU14NjczV2Vhd3hBT3l1QlhqcnVodzNJSkROZXc3LzJQNE9xNFVN?=
 =?utf-8?B?UVpzQVIxUnlWb1F3QTFvWW5UVTl4bkVnQUlROW1KL2ZVVWF0c3hYR3NLbzJ1?=
 =?utf-8?B?WFlZVmJjSnF0SUZoOVVoUUpkODFEZVQyZ05PZXRaUG54NHY5MW9WYTl6MDlp?=
 =?utf-8?B?WnVtb244TXU2RFpDaWxsVnVkWExBTDlwbUljWUlsQVMrWXBLd2dBc0R3TlQw?=
 =?utf-8?B?Y0JNbHdNYWdMRHk1ZjQwayt0WmdGSlJnYXFUUks4Y244ZzJyTDFTNy9LejF0?=
 =?utf-8?B?RUNacmZWZk1JbXhVUFBwLytWU0lrMlhhWi9OMUNKeFNYcW1IekFQcytLWUpO?=
 =?utf-8?B?cVA3ejVvY0k3T0lsbVNCWGVQcC9FWnhVeE5nTzg5SG9KQUZWWm93eTU4VmVE?=
 =?utf-8?B?SktSMmpEN0owOUVRL1kwL2ZlaVdlNjVyb20wa0VUODhOOEdWYUsvbGQxQWky?=
 =?utf-8?B?dk5YR3JtelBJN09BcWkzd1NZdGR1TjdOSXEwVFBwSGljeVJRR1cxV2RFQlEr?=
 =?utf-8?B?cWNRQUJZNGhha0g4RSttQnMxdzgvMUw4aWpxZVdwN21pQWg5SnA3ejVpWkJD?=
 =?utf-8?B?QSszSEMwL1VzdWtjczUvSmp4NWRHUzR1NDBQUjIvUTVWOWFMQVRDMEoyMTNq?=
 =?utf-8?B?WklWTUhHRjBQZWFZZUZUcDhtZjBSZ3VKQ2NEN2hXVWpxeGhNaWhyRHkzcWVE?=
 =?utf-8?B?ZDRKNEVwamVvd1dMU2ZnV25YSFlGVWx4K2dDaytOdVkwSkhTdlBoR3dpM2F1?=
 =?utf-8?B?R09BRzYzM0FSbk03OHFVdWJXNHlMSzBkc3BwYnFXdnJxU2IzNXNwQTNZL3BJ?=
 =?utf-8?B?d0xBNDFlQXBTT1ZYYnpJdE02M09vNFV0cDhnamk4WFhFSnVwRjlkb01OYXVC?=
 =?utf-8?B?Y2oxdzdrZUNWNWtSQWg0bUVMVVhPbjh6WVFCZWh0NlJzeGVrbHMydXZMcldN?=
 =?utf-8?B?Z0lWRE9XV2ErN1FvSWs0MHFQMnVSYUozZ3FiazBmOGkyRlY1RDhyVG1TRVBG?=
 =?utf-8?Q?LrPQv3ljBY9mo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3753d6-d2bd-40ed-d4b9-08d9155210f5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:26.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGm5T98Pb2GAiFQY/WpOdHyPNf/bkiMz44IsiNS+64QUwhrzZCSaZ/f4nTjekOleGhYOCmiLntMtDOFN3psVAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2845
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
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows to remove explicit creation and destruction
of those attrs and by this avoids warnings on device
finalizing post physical device extraction.

v5: Use newly added pci_driver.dev_groups directly

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 17 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 13 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 25 ++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 14 ++++-------
 4 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 494b2e1717d5..879ed3e50a6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1768,6 +1768,15 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
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
@@ -1787,7 +1796,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
 	adev->mode_info.atom_context = NULL;
 	kfree(adev->mode_info.atom_card_info);
 	adev->mode_info.atom_card_info = NULL;
-	device_remove_file(adev->dev, &dev_attr_vbios_version);
 }
 
 /**
@@ -1804,7 +1812,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 {
 	struct card_info *atom_card_info =
 	    kzalloc(sizeof(struct card_info), GFP_KERNEL);
-	int ret;
 
 	if (!atom_card_info)
 		return -ENOMEM;
@@ -1833,12 +1840,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
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
index 5ebed4c7d9c0..83006f45b10b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1766,6 +1766,18 @@ static struct pci_error_handlers amdgpu_pci_err_handler = {
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
@@ -1774,6 +1786,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.shutdown = amdgpu_pci_shutdown,
 	.driver.pm = &amdgpu_pm_ops,
 	.err_handler = &amdgpu_pci_err_handler,
+	.dev_groups = amdgpu_sysfs_groups,
 };
 
 static int __init amdgpu_init(void)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 72962de4c04c..a4404da8ca6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -75,6 +75,16 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
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
@@ -89,7 +99,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
 	uint64_t start, size;
-	int ret;
 
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
@@ -102,17 +111,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
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
@@ -142,9 +140,6 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
 
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
-
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 2344aba9dca3..8543d6486018 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -152,7 +152,7 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
 static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
 		   amdgpu_mem_info_vram_vendor, NULL);
 
-static const struct attribute *amdgpu_vram_mgr_attributes[] = {
+static struct attribute *amdgpu_vram_mgr_attributes[] = {
 	&dev_attr_mem_info_vram_total.attr,
 	&dev_attr_mem_info_vis_vram_total.attr,
 	&dev_attr_mem_info_vram_used.attr,
@@ -161,6 +161,10 @@ static const struct attribute *amdgpu_vram_mgr_attributes[] = {
 	NULL
 };
 
+const struct attribute_group amdgpu_vram_mgr_attr_group = {
+	.attrs = amdgpu_vram_mgr_attributes
+};
+
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
 
 /**
@@ -174,7 +178,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	int ret;
 
 	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
@@ -185,11 +188,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
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
@@ -227,8 +225,6 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
 
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
-
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
 }
-- 
2.25.1

