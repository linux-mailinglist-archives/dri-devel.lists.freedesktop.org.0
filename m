Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D02FAC20
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052EC6E5C1;
	Mon, 18 Jan 2021 21:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEAA6E5C0;
 Mon, 18 Jan 2021 21:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVVDXWjP5WjwUXDqXqmh7p/UxQseTc7PRgGJNyd0DjjzNQRGMCdtAmwnun7OxK/KatRMpPf2Pl2oq5WrKQmX3+chil9t9X36V/L+nUPA71kGM5ELMHKRS6IbVEX1Uj8xDXqh0LkXSQXERR2zOG3TLfij8nchVimJEfoh60+ceRh9ln/qlUZnKmsrrlCXjlt6VwABleDalLIjLPZfQFR4NJJ5nj47cGTOxWnAcrwnIy8YRY6jZKlJIuKqVu2PHyE8xyRs7eH/5R6BzS71uyrUX2WzRM7hli46ke7tXTjj+QxNk63DsPhyuLwRB3fqwlTzFhJoloGxIQ4zCVKxtk6PAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZJkk8cFpYaKfEzH4uzSnGT5LR4Ffy0zVO+eOOmvhKU=;
 b=jEx2w8c5sTMtwVOtl/yfht60yK8Fq5LfiCDPJk7KZlVmbqQC6v2M3MoO7nM7CsTumTFwOJ+QVBG/kCT4/PBxdiMoY97s8ONwGhtJ24J/eJ8k72zh1Mh/qU7dBZI73rr1EQW/syjylY1c6w2LCsld4TjpYBaZQWKxIVgoW4DkRwGHKvFW952T7IYplr7fzr7Ebt1ESCrzP81MkwVBfqxARknTS+arBq3X3gnuvqijDAcMU/9XQ/xg5EY15rT6vqqmFqFN9Ffk6mbLNDJ/T8loKCWgaNoPhT6T2C2HDf+vXK8j2D8FLC5iWyL/yoYxM9+FMH/3CZItyhIKGfGhz4E6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZJkk8cFpYaKfEzH4uzSnGT5LR4Ffy0zVO+eOOmvhKU=;
 b=mfYc1INl73q//jWcREZmAsZ8TIn6GZLO4p738Ufz4cw30UH0e7NCXUvZI6VbIS2Gr2F+5CtrvtRlFi5zLfdJT1e7po55cwE0e6XN4BDCMf14rZscW0P1LgP0+EC4U17A/WtXpxpOk7n7LOnffmSZkaQQDi+wP/jGvJPj9D7oqfM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:39 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:39 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 10/14] dmr/amdgpu: Move some sysfs attrs creation to
 default_attr
Date: Mon, 18 Jan 2021 16:01:19 -0500
Message-Id: <1611003683-3534-11-git-send-email-andrey.grodzovsky@amd.com>
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
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a26aff8-3467-468b-72e0-08d8bbf463f8
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767564AE6877B9FD192B272EAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHy78ggpsj1/WUVFhYq0ryOFSOHnLGQOEdAjB8yGskYz6MjzqF9tAQHmtDEyChNvOyupWlBfNIBaxoXM344cPNMYWgAfFfGYpHKsfzez4QsbVjX6xSL8Rg7T1b5j+s/wm/taRSOljXYUEqooW+xCwl9xzGzVLMmZp39IG6VP3FhFTN6Sdut4bdXqpxEnVnmd2nFCI/fZOVkM1SKEJw/PBa/qXxSh7d834kiDpxeceyF6Bj2lP2dbmpFpsvbK4xaOOwbKOV5lvVAZ1ags0YKJ1/thra/6uSEI/zV0O+lM6sErMptjWJvSW1bTtprUWiDcqxS5tGzyC4cIoZ6dCwZJMR5EZVNk2DasA1GJIECBIXJZ0X34+OvD3/gVnJL6wxhOdeTisx7v01clYeOfzCMmzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wDa78jxgb5WF1s/4lHr5GglVsNG7tCcnv0p8QTuocwtSfmOjw7+GfKVQyb5e?=
 =?us-ascii?Q?KgjDdS3u2ZBXkamAJOwTn0GRTf4ZeRuOLbKCV2CrQSY3L4ELnMD4Lvm0ARAN?=
 =?us-ascii?Q?EZToLy8xD2qD2lmlXvBINzm/xR6dFWJzFo+PEdCXCcrg/qDW4Jiql6iY/KX8?=
 =?us-ascii?Q?ZnX5jxl2H6i7kFedg/KWeMR8gRiRhjj82iWot6JfH9JPjQvJy6g7OgbR8Fh3?=
 =?us-ascii?Q?Hd3FIpjg4+qyevS8MpJzXtkxjXc7YzzyhmWd2oD+7Tr34eXQ0tW+yQKLIvz3?=
 =?us-ascii?Q?lrqwqUeAW5kIdhAck0FcAQbdTed5O6pVvid89szMdpNeH7y1XWJsVZosWPir?=
 =?us-ascii?Q?xJsTlYOVS/oY+GuxlgR4Qft08sGaucXFOoFfT4ppWxFLN6TJuSUfa1UV6VkT?=
 =?us-ascii?Q?oKeQAYPvpmfJaOnfCdy3lrh1qQZw1/cWgeqPzchTAdCGwQFCBN/i3mLZsB6N?=
 =?us-ascii?Q?40uzvotSvgEzBJ4fm9/OdbuMCYJ27ng1/VA0sdtpDyeiUzauuf59Ir1USFTI?=
 =?us-ascii?Q?v3ekuxdxLLrySflo1sqD+V3sciz1CmLoOH2taXjp9VF+HL2vNFFWB4yDVzXb?=
 =?us-ascii?Q?3JJjBeKDbDFNcZJ5cYphTa+oA7qBmQds1twp04pg/B5fi8QSfngq0IcNmmMd?=
 =?us-ascii?Q?7+ELyucOvD6qAgXNfeaTIrwgib1WCbFqN7I32tpG8OhSWj4ZLeIIAhnae1g3?=
 =?us-ascii?Q?IgOMHlFnDRxCfxLPkBpNBQAYwg40yh0/zDo5TmVtshkwDI8QwwTaNXgBPEHV?=
 =?us-ascii?Q?mG2WMI9Ob3TEDx7n6f8LdROjHBL92GjTc2n8UL566lQKZdC8qTV0koUthfXf?=
 =?us-ascii?Q?SRA1u81E+rINLjfdCEf1AKgHv/ZPber1h/5erndhUorhqEs+6nKYyojYXjqg?=
 =?us-ascii?Q?/eLxD77v5Ju/X7oZCChIkeU/LlVarE5eeqb4JS4JTSToltFSeO//0LlULDsG?=
 =?us-ascii?Q?izfSt1TTxzyKPpuHTi/t5iUgi6LM2FF2tGaJKy9D1ufl5Qa+R7Z2xac0hE7P?=
 =?us-ascii?Q?3SoNz2czvemKBROWm06y+RuwH1iBwTr1/DLdxqgnoYJIwgC4ggr0CVQ9+e58?=
 =?us-ascii?Q?Kq8mTj/aRJyziHdIgzUTSKICvVDqkarxsYBTxoXBWhgpPuwwVNayqg9AK4eH?=
 =?us-ascii?Q?vhKWxLWXH2Vo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a26aff8-3467-468b-72e0-08d8bbf463f8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:39.7895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/W/3D8bkDM5kvgRS41XLA5xFKfwGp/BCB+ZgHcf7RI8VyGh6I7Tnj/VZ/bYFBiiXNmIvCq5pwDni111rU20Fw==
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

This allows to remove explicit creation and destruction
of those attrs and by this avoids warnings on device
finilizing post physical device extraction.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 17 +++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 13 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 25 ++++++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 14 +++++---------
 4 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 86add0f..0346e12 100644
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
index 9c0cd00..8fddd74 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1587,6 +1587,18 @@ static struct pci_error_handlers amdgpu_pci_err_handler = {
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
@@ -1595,6 +1607,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.shutdown = amdgpu_pci_shutdown,
 	.driver.pm = &amdgpu_pm_ops,
 	.err_handler = &amdgpu_pci_err_handler,
+	.driver.dev_groups = amdgpu_sysfs_groups,
 };
 
 static int __init amdgpu_init(void)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8980329..3b7150e 100644
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
index d2de2a7..9158d11 100644
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
