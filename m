Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7448337C01E
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0704E6EC23;
	Wed, 12 May 2021 14:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA096EC24;
 Wed, 12 May 2021 14:27:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deTgeZwP3+Wb/n0Zkxc1CkgFhsxd9lU38sNGFdk+CmesjSyFCk1gIG3qf7vi0v81fO9DsnK2J6T2U0TMbd2sNcrXf3otD5jvQYKB6dig/8Y1SohgvmIeD/YZKniPPFdYDeKCN2hEQ47lIkFswIicByqLTahXQOmdquI0nT9CNuEPg0s6um3x1EX23lNoayrc9uCR4oDzcwj1dPXeoK4/DuYMUBtW/VmURr9/gYfIS5owQBTZdQ9yR3rINz7sK38oZH3iTvwsm4TV7Czpld5qKNxP+aislMtkLuRHbArUE7XTlEVSqr0dc+CATnMBcx2q9CAdjZ5+I6UrBKoJCylIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NnAB5+Ww9eG0XsaV8ZDYC8M60EqyqkYdAAVZSiV2A0=;
 b=TgPlZfcKjvB9+qMWkNoFAalyl9kj9LVLcK22BCEArdElvjB3p0iS0X7V/onOEksZuQ7Lw3PgmCNZtw8ui71npzKIfKT3We3f+WOAx20ZzWtGCDm1ZHvo4j4m94c9x7vG6wJ3FzRA7KgO5/gA8vFaXIefS2WnGJjhGq8VYl6+50ngtozkbUOgnieFArWa+9DPlw0Nt5HbDJk8mLwiYAtw9XvnZDJIFCxmOCjj5R9suk84hlvY+cJ2KnIecNkykHVKAEvdrqqmu3MwHom4bZRqILDt2ms04d2ABnWiupYMwJwhXR7ktMxC0mAIfRmCqZWbIo1JshG9RbnZcYlEYMb+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NnAB5+Ww9eG0XsaV8ZDYC8M60EqyqkYdAAVZSiV2A0=;
 b=tTdXw8lp418J/vNQyU/MJy550CQmdXYyA0DnjQ77/NEZ6nJ/ahNBjKJz2/6de23xJGJX7Rf+Tnro8ehfiTiyPUZhU7UdzRX1uEjgyRAIpjshIfilATfJM6eK1bEonweFYXnPH59Ubj9CHnBPHWnByiNnoafHFffGS5lBpko6fkw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2655.namprd12.prod.outlook.com (2603:10b6:805:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:44 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:44 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 16/16] drm/amdgpu: Unmap all MMIO mappings
Date: Wed, 12 May 2021 10:26:48 -0400
Message-Id: <20210512142648.666476-17-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
 Transport; Wed, 12 May 2021 14:27:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcabf876-1041-47ff-84cf-08d915521b65
X-MS-TrafficTypeDiagnostic: SN6PR12MB2655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26557AE040269F77A4517889EA529@SN6PR12MB2655.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHIgZw0bCU+e5LPxxYCPoFpOLfblmadpSunkm4SL/uaCncgpa8xBffu30WkV+/SZh4Q3bYu3Rk/8T6x0sVBnBG3F5bUmP8ii5Zq+yXg8bCQILaI3CjTeldmaDnlvm8EgO3ULq0JBwIPV6GctebubQ1zOnHeuammf0PmjxOIsktMss55fLKo+RO22PUaDl/yOG1dFNIwVVUfSWAGeSz9CWx+wW2k4HdCP5i1tL175g4im50j0DfozxoPMiJ7HDGHffJbu0P4y63zQ3i30zf+7bp3fyj1kX4VTtY04L5IMsNReHBJdunWmukosRAloVdb6JHBQXh8Em0P8zv2nCNF2LW7AnsEzhJyOeEQT2v4GNgujDIUVTKpG2bTyj/wdaqDadFInmmyjsIJe073gFWa3xxC7sCJQRyW27/gZPeYxoxlckE0Cmi+s9/pfhsAB3Uel+M1NopGwCnpKKESQu0y5AOiklW1dpX7+N5SpfUNHBNdx6w5oPb+NSatLAch9/qsQDlYRlUYqxwjhj91UINV7Y905JzjGDGnuj0BKNupYYInzV56UUi5AjP/1J6Fkx/d12RRfxeelDSmDX+2opqSXgqPTqqcWMDNnFLwbg5+ymY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(86362001)(316002)(186003)(16526019)(66476007)(1076003)(6486002)(36756003)(52116002)(2906002)(5660300002)(8676002)(6636002)(478600001)(6512007)(38100700002)(66556008)(66946007)(4326008)(8936002)(6506007)(44832011)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w0r2yDCUioNpiEusHbk3eUAgHiF2sJvUDzmJ6eQR4hhz55Xtqopqh+TrwjL6?=
 =?us-ascii?Q?M8D1m9SP33Ka+FuT6zimg4ZfENJAa4hVgqIVupU7WmhMvyRBNziADkCIHfwe?=
 =?us-ascii?Q?da5C+2rxEJeALJ/MxvnJyutdwI8UPwfKQkEr9AwmrjftFrVghbZpvcwbJutd?=
 =?us-ascii?Q?XD1i2xQDB2wiBhppSP52+A//vUpbuvj2lvEUbq6SvtOSHwQxJU3iLkiprJqF?=
 =?us-ascii?Q?LTd03zBhNZJtAJ02+N0U8ONMu7uhCzhkqZ7IsIZYzA9MAYctCULapoVBACqD?=
 =?us-ascii?Q?tx599vAaEgBZQ4roWTvDElAl1cJDUA7qP2cy9RXnYUSUWEkzTJ+OXc+iejH0?=
 =?us-ascii?Q?tCVWc1pfX1WaooqvRCsShXn1kUMLyR+MxO7a40mTKG7/Jyzwzl1SfKM3sHvU?=
 =?us-ascii?Q?tCx7YJjKFZ4dIF5Q0XJosDWj3ItjPYKmfEjKSR4gG5Tw4O/2Pa3+Jac0amT8?=
 =?us-ascii?Q?H3J50M3KNUUXjJLPNL/UC8pg/kAAftM3ziyEi4RYgNOMAT+9cJrYj1UCXzaD?=
 =?us-ascii?Q?oCgZ9vf3sLtnW9+daq0L4JMF9sgiQr//MH1fjH2BxhQ7lAVR+FDBhVezO+6Y?=
 =?us-ascii?Q?CWMHva9H2G5PHhod1wxvCNeBObzzVVL9iqYtGXyQlyHontT5LPxSXq0pkQKh?=
 =?us-ascii?Q?LzrCuogZKLEuG66u9geMHRhVleVHp4PVtRcA47zgHPV51mFqfSJ/z1SzzmEN?=
 =?us-ascii?Q?FMT2NvY6hKNqT6sX1fETwtGf61zxTZFT1UqotbP/TB0+48OAKp65cXbL2rBg?=
 =?us-ascii?Q?nppfwu2LL0WiOc6/uZ8rVEwizona8N8/Eg5GJDOLduDpaFgj3nGzx1jGM+CE?=
 =?us-ascii?Q?8pY51wgcNbKyN/XhdXAsr78N8rWqi30lz27i6MrX4WsAS4QpNter/lrQBCKc?=
 =?us-ascii?Q?60rs6TYx2yyrRSIkCgxbfOlPVC9b3meTGedemknM01+cXRdF1LUU5Gpi5U5r?=
 =?us-ascii?Q?aeqlpDP7Y9qmE4X2Ws8T/pu4zH9ZAA2ssf//NnJ2slP0QgcbjL11J0ecSKxW?=
 =?us-ascii?Q?iot7erZpK/aDJUlWJaYR0qTLGd5zDLyY9J11vriKfxjFJdtqVL+ix2vFEtGq?=
 =?us-ascii?Q?VPpIZA4oD4yAMRNNi3pVowL7T7wM0Te1irMIKoGG34L6Eu6MfzeIBkjGE4oM?=
 =?us-ascii?Q?J5DCljTtqHMvhfVPySp08VY98F0v7HlvNqyiTWTFdtGQ8wQkbxOlheRFwnM1?=
 =?us-ascii?Q?E8wPPyQB8ku13uBnCNhKpDriXrNXwQgA7Ynq3fYkr61MGd2YUA3Z0kIzULbf?=
 =?us-ascii?Q?YNlZolyda7CdoxzwQTxKuQ3XbVhMpXgmXwTXEJ+vAw+G29PjmYbcHDMWGZ1y?=
 =?us-ascii?Q?gO0+monuiIanCgFl+bl6o154dRUE+cqeIkMwQ3E1jJCTkcyUs8WO7trsLr6q?=
 =?us-ascii?Q?uyF1IY1wP82NKETe9YHC7kTbMKvC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcabf876-1041-47ff-84cf-08d915521b65
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:44.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bfjgrLBjIFeZqvkyt/QvyRz6ce+owinfKVhc2jOmFqO02Y/4suI7oA/Ab31XoOjy+mQjnrLyqnZl66XqjcY5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2655
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Access to those must be prevented post pci_remove

v6: Drop BOs list, unampping VRAM BAR is enough.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 +++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f7cca25c0fa0..73cbc3c7453f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3666,6 +3666,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	return r;
 }
 
+static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
+{
+	/* Clear all CPU mappings pointing to this device */
+	unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
+
+	/* Unmap all mapped bars - Doorbell, registers and VRAM */
+	amdgpu_device_doorbell_fini(adev);
+
+	iounmap(adev->rmmio);
+	adev->rmmio = NULL;
+	if (adev->mman.aper_base_kaddr)
+		iounmap(adev->mman.aper_base_kaddr);
+	adev->mman.aper_base_kaddr = NULL;
+
+	/* Memory manager related */
+	arch_phys_wc_del(adev->gmc.vram_mtrr);
+	arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
+}
+
 /**
  * amdgpu_device_fini - tear down the driver
  *
@@ -3712,6 +3731,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_device_ip_fini_early(adev);
 
 	amdgpu_gart_dummy_page_fini(adev);
+
+	amdgpu_device_unmap_mmio(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
@@ -3739,9 +3760,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	}
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_register(adev->pdev, NULL, NULL, NULL);
-	iounmap(adev->rmmio);
-	adev->rmmio = NULL;
-	amdgpu_device_doorbell_fini(adev);
 
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 0adffcace326..882fb49f3c41 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -533,6 +533,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 		return -ENOMEM;
 	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
 	INIT_LIST_HEAD(&bo->shadow_list);
+
 	bo->vm_bo = NULL;
 	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
 		bp->domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0d54e70278ca..58ad2fecc9e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
 	amdgpu_ttm_fw_reserve_vram_fini(adev);
 
-	if (adev->mman.aper_base_kaddr)
-		iounmap(adev->mman.aper_base_kaddr);
-	adev->mman.aper_base_kaddr = NULL;
-
 	amdgpu_vram_mgr_fini(adev);
 	amdgpu_gtt_mgr_fini(adev);
 	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
-- 
2.25.1

