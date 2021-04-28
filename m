Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FF136DB0B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40226EB89;
	Wed, 28 Apr 2021 15:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0991C6EB68;
 Wed, 28 Apr 2021 15:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtXV+4Sf0wuyhy2XhgsI1tsM2UVjOXkczRpM2zbWOtpITJt14Kzuuyyhyfa3lRg7I4FQdC3Dqpvjq4JzXq/GyN8z0bE+MUZkNeJa+DN8mZMhET1jn60cT4QdFBqgHUfPkWbA8u9houRfZspzeW39RGII6cSRM7mnfMNcGanaG+2XOkvU3kzhP9ZMdyj3Wbn9O2+zRTF2EWNJ5EFZJJuXK15zEcAeBhWQCAm6uGQUkItRMhoTIUPFCVpRbHGy3UYcOR2L2Ld7qkTomJ88Xc+tvfwnNepGBWnHS92ywDNHF7/hp0SBROb1WlvamUFamWww87UmbwnYiafU4Ps3MkaTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjhglDgmtQ+my03Pcogfas8bxrlRmGAUdzR53xIZWls=;
 b=O2C5TJjGQfjGNQABw2GFxNvnQYSu6IpzMVTGmOnaBzxJHyb6lPvDRSt+w0OEOGvZVAMbzNye3gY9MuL5Lw6hWg7EtQtQq34JPA8ZCZbEq6qG/yTdoQeog6hko+Q/GWiXhpbY6dcq7DvRYX6Rkk8dcMKxNp5lOW4+FPMOZtd+NL94zKJ7HlLKngl3/E57CyJypMKmsqzOF6nnHWpNupF0jkWcCBKhq6RBHZJ8bu3h6f2iiwTExxYJxg5IcaOclVevfEc6npGUYlI5BirQV22i6yQ0Z+wcanUEboA+7aIHtcCAwpxf93nw7btFrs0wsQsJ/W8GsfFldch+EUDQv/gXyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjhglDgmtQ+my03Pcogfas8bxrlRmGAUdzR53xIZWls=;
 b=2yyoJi52cjDqE8v4qPKQoGqGYcA52ZePCVWt6V1Vp+s8HPsQ73T2Ci5b6cJTrUlzM+BO4yC5AqWYrpWE20qH0jraSbx73rxT4l6d1jY6R2LRL/C7FDe9QiwbDG31NkzL/3OdvDiSjNWcjzYhulOzcstCK8qLh9KeuxTYWmU6B/g=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:01 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:01 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 16/27] drm/amdgpu: Unmap all MMIO mappings
Date: Wed, 28 Apr 2021 11:11:56 -0400
Message-Id: <20210428151207.1212258-17-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d62ad35b-6987-48a5-f5cb-08d90a581d36
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2749651FC180E83CC859ABAFEA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9ibYGomiqBI52axkuhjNcBXz1DdkJlZiw/ZfXg2vzqeAqzcmwfVpekx9Fu6Dp/6UgxiZLl51aODmmphSzlEXz3K7lh/lthLZo9M3SrHW5uH9oXwXWonOD15GRVwDRCahA/ks2d5HHMZyDEtDQDrkSePmVne2XEv2K8A0KW4aZYcgqRpKMNjnJwPhwsDLVQDIBP7DLm0UWOdgOf/Vm82jqhm5Up5BnGNaDzoUNVEER9bYybJoNWBjlX1Glw59KjvfkUnuCBa4mVRsu6SxwBT9MBvZKoHiojlR8VOzr5SkV5voWYhzeBjA1y8mbGdVZQi3XINoGgP4X2ynlcA7Drblj3dJ/9ibJe7+cq6uWzjSRttWyZZ6kqShl/ZaZc2hoNyv03on5as5eY7VbCrH8GyVINqX36i4HWSMBXTNRjS62xaayRrGV7EU/wCF+Kdx6po9p+mBz+Ipy7xBYwvqCpB/P8EsQxojc360UzShnbJXGyyoJqP/qI7V5jbgz+aglIk4u6+GZcOoveA+/O/slWC9ZM/cRG5yulM9yK/7I6XMX1VtsMNHysjWXom7U36eWIhuwwphLpyXMIZHSM7ebbpV+qafA6st8Hr3sIMvcpc1Mk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pzsxGMqynz4O6kpnz0PofWMFzDvDUTmLgL/4hglX9Tp7NqDFYL/ywrPji+d6?=
 =?us-ascii?Q?a7XtbkVQnie6Nq6fqSGGpCFqvjRddawRmfrQXcqzF/NuK/oHY6iU4wd88oVL?=
 =?us-ascii?Q?KaovfaBvAuAB8BOeR2cJOa1jVtYUs6YrGc75CgSB9do+0mTgniJaUfCEOy6o?=
 =?us-ascii?Q?qTk5vy1CrRGnhAvmqOYb0HE4HPQU0MKP1YdS56e4dVgD9LugdOXCSJMDYtJP?=
 =?us-ascii?Q?Ue6Z0dh1uDCyTmKK+DfF8CcslV0o5+K4e3p+IoOHseQyVfQwVnYRpmV0ODFa?=
 =?us-ascii?Q?KYB9LG5GogZ9doC6BvE+phZeihkMANbZkB42+7cF73iXNL2K1t0ZNQ+O/hOt?=
 =?us-ascii?Q?oxVKPPdZPc7pWXBk5qbJ4hXkKFiRxEqt4lMKHSZg9Dj0MC6nsGx29uO5MdP+?=
 =?us-ascii?Q?+2pFOIha5321pPAyuMgRVorrmlGAAp81rxIVePouS4Whiv7mlNRzftkLFrzX?=
 =?us-ascii?Q?D5I9sNwhVFMaz6GgxEqvSp3Bx0OaH6MwkwIcd3WAxvtjO/7gkq7A9et3shw8?=
 =?us-ascii?Q?TcwVQta7rO0V896MYRZHnsFvXNL6TmSutBH4F7vM/tbEYa2QnzWOwdz1LeOm?=
 =?us-ascii?Q?qM0UEGQxBJzIbh9z+/SQYI3/yGZjLue3zIDY37e/HI4nab1BzgrStFcuJ00a?=
 =?us-ascii?Q?xhrHHFjAihxe4S3Zv1w2pWNlqtgO4atSAvRiO/ZOqtlZt2o5NAHdyfIyK8fF?=
 =?us-ascii?Q?5TAAF0CO3tvVby4LAo/BGHNaFC7ulyXZ9JowvjALR9IY0aI3gih/tWl30agp?=
 =?us-ascii?Q?AKuidA4TtZaK9NSTMFgPzCGxPmkO1IFRtMrrYKQtDPhDb4Vv2ylwMbG9i3d9?=
 =?us-ascii?Q?ycw1mrQvOLAC6QDE4mcaHEIIlAS5jvjIGfTZTcf7dgKDRlehZKXYm+DgvXn1?=
 =?us-ascii?Q?YmQN1mH5xJOP2Ypj3nAhDDMM9rwGuNQO+D3t+v93rpReipjKILwRd6ZGftLB?=
 =?us-ascii?Q?VZw6qGAvq75AoqeWNKLHJYCjeJxTQRtL+L5s7NHUgt0grxMy0U6jjZqB1DRR?=
 =?us-ascii?Q?arzrRtFHWIoLrsZ8aKtm9dEFnYAxZGa/oJ3WvJ3qWU3mNAreXmLb3Iy9s9CN?=
 =?us-ascii?Q?+LhmBcqCc8DVBWaDV8A+cuVZ+orA0/s2eYtvJopyPqoCJYAT3cnK8BKu97K5?=
 =?us-ascii?Q?qZBzopAVDBDTHezVIo5E6aCB8kriNC50Rz8ZUibLDDOEkMoHCE8fqIrwT/VP?=
 =?us-ascii?Q?0ltSyQQAv8JcLtdbtIc7kx49GXfuPZgMrYTdChqqOyKGTzjJY17Iqs+BZJXe?=
 =?us-ascii?Q?Q/1kKyUkneRXpYVmv/1+UQYB51mHsQcpf5n0o0TLgJQF9TakcuEX432FYUlk?=
 =?us-ascii?Q?Eb6GlyjruQ7xHjIfCvrkU6bZdw+/uF5kH/q/62Yny1bdiPNwp2QJZ5gIsZYu?=
 =?us-ascii?Q?NGlqpVOIvziA9iiCcbEgEuKxvynn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62ad35b-6987-48a5-f5cb-08d90a581d36
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:01.4256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdYEHD4UvdFRqLzFlslahYehOXgVm9XBdHQeePEc8uvrgJu6wKNVcaxb1BVs9scSodU2XEZfGR/GRq5DwLiSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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

Access to those must be prevented post pci_remove

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 38 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 28 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  5 +++
 4 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 30a24db5f4d1..3e4755fc10c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1056,6 +1056,11 @@ struct amdgpu_device {
 	struct pci_saved_state          *pci_state;
 
 	struct list_head                device_bo_list;
+
+	/* List of all MMIO BOs */
+	struct list_head                mmio_list;
+	struct mutex                    mmio_list_lock;
+
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 22b09c4db255..3ddad6cba62d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3320,6 +3320,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	INIT_LIST_HEAD(&adev->shadow_list);
 	mutex_init(&adev->shadow_list_lock);
 
+	INIT_LIST_HEAD(&adev->mmio_list);
+	mutex_init(&adev->mmio_list_lock);
+
 	INIT_DELAYED_WORK(&adev->delayed_init_work,
 			  amdgpu_device_delayed_init_work_handler);
 	INIT_DELAYED_WORK(&adev->gfx.gfx_off_delay_work,
@@ -3636,6 +3639,36 @@ static void amdgpu_clear_dma_mappings(struct amdgpu_device *adev)
 	spin_unlock(&adev->mman.bdev.lru_lock);
 }
 
+static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
+{
+	struct amdgpu_bo *bo;
+
+	/* Clear all CPU mappings pointing to this device */
+	unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
+
+	/* Unmap all MMIO mapped kernel BOs */
+	mutex_lock(&adev->mmio_list_lock);
+	list_for_each_entry(bo, &adev->mmio_list, mmio_list) {
+		amdgpu_bo_kunmap(bo);
+		if (*bo->kmap_ptr)
+			*bo->kmap_ptr = NULL;
+	}
+	mutex_unlock(&adev->mmio_list_lock);
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
@@ -3683,6 +3716,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_clear_dma_mappings(adev);
 
 	amdgpu_gart_dummy_page_fini(adev);
+
+	amdgpu_device_unmap_mmio(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
@@ -3713,9 +3748,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	if (adev->rio_mem)
 		pci_iounmap(adev->pdev, adev->rio_mem);
 	adev->rio_mem = NULL;
-	iounmap(adev->rmmio);
-	adev->rmmio = NULL;
-	amdgpu_device_doorbell_fini(adev);
 
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 62d829f5e62c..9b05e3b96fa0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -531,6 +531,9 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
 		return -ENOMEM;
 	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
 	INIT_LIST_HEAD(&bo->shadow_list);
+
+	INIT_LIST_HEAD(&bo->mmio_list);
+
 	bo->vm_bo = NULL;
 	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
 		bp->domain;
@@ -774,9 +777,21 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 	if (r)
 		return r;
 
-	if (ptr)
+	if (bo->kmap.bo_kmap_type == ttm_bo_map_iomap) {
+		struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+
+		mutex_lock(&adev->mmio_list_lock);
+		list_add_tail(&bo->mmio_list, &adev->mmio_list);
+		mutex_unlock(&adev->mmio_list_lock);
+	}
+
+	if (ptr) {
 		*ptr = amdgpu_bo_kptr(bo);
 
+		if (bo->kmap.bo_kmap_type == ttm_bo_map_iomap)
+			bo->kmap_ptr = ptr;
+	}
+
 	return 0;
 }
 
@@ -804,8 +819,17 @@ void *amdgpu_bo_kptr(struct amdgpu_bo *bo)
  */
 void amdgpu_bo_kunmap(struct amdgpu_bo *bo)
 {
-	if (bo->kmap.bo)
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+
+	if (bo->kmap.bo) {
+		if (bo->kmap.bo_kmap_type == ttm_bo_map_iomap) {
+			mutex_lock(&adev->mmio_list_lock);
+			list_del_init(&bo->mmio_list);
+			mutex_unlock(&adev->mmio_list_lock);
+		}
+
 		ttm_bo_kunmap(&bo->kmap);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 5ae8555ef275..3129d9bbfa22 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -112,6 +112,11 @@ struct amdgpu_bo {
 	struct kgd_mem                  *kfd_bo;
 
 	struct list_head		bo;
+
+	struct list_head                mmio_list;
+	/* Address of kernel VA pointer to MMIO so they can be updated post remap */
+	void				**kmap_ptr;
+
 };
 
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
