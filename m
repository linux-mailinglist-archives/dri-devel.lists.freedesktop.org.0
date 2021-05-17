Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548CF38317A
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD686E9A9;
	Mon, 17 May 2021 14:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3848F6E9A9;
 Mon, 17 May 2021 14:40:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZiiicoryJRYv/P7WjRuBkMt9u/z6JJAhD0BF9gMvk0i4ELebH7PZl/VHpRox6rg3zWIp9ie7+MoEqV520p1tXlyDOM2N3g1rT7eBeMKh2Wnsblf082H89g9FHqy/OdvXNir0BYjzmdvUp8ZIAsUzb2/j5NG/M052xpINSccfrEwHDZCepLz0iif1Im/7kE20fFrJuk8sPCEzCPOxYOFp8K/7CkvaRk1g7PhuZYo8iP5HJWSvkPxV+WlZO9TclR/pxomZCu6mRL2nvGypClFiWa+Znz2/6IKjQE0FvIvpUUAk1LigJayp+cXPelKqnijXj0J8Ino6HJIamOFk1/Bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2+ciSyqGaKQsw6atyxM6OXfwpWjw87YBch7BoXb6K0=;
 b=CJHSvYf4/9Y89yyhGkGPXT+dO7KCeLR9v5bK3rffALV1hlVxgUmBy/xwDbyGQOok3DGGQZZ8z1doUMVGb2YfMdghaETexd+hDobskBq3DGXwMPxffgF/HI93Wd/op4re/n5T3uVItDma24uWPYUSHNaS7Sccydm1ArD5qXisLtbIa6lzJjJE0rBzrF8xBRg1cMAETMKxEgTiWrX3W6udHV1XV6wxJmM68Us18yVWYb5fAZiP+YTgKGgoehr0miiwjGrLPw9DoStFa1UEyZJJ5OPQWvmcdAofme0iZNVgazpufIU2IIDECTC1mEx3xuNjdbem5JNO5hlZGFf0NOMGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2+ciSyqGaKQsw6atyxM6OXfwpWjw87YBch7BoXb6K0=;
 b=znpGbNOduGBbv6lZSmFcTN/WUgxbl3afxziLMAm0HCfzd5hUegRTXcwmqyDV4u7uUSAO/8PnzoyoEGUcDKIWZyChC9sthmb2nZWSdooYI+Z7Omo+sEzC1ZhJJxKLq1vi7KV/490arExyAmdVKi0bR6bty8VH1l5wJpA0qMvXwpk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 14:40:12 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 14:40:12 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH] drm/amdgpu: Handle IOMMU enabled case.
Date: Mon, 17 May 2021 10:38:51 -0400
Message-Id: <20210517143851.475058-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <32b61077-f760-8fe0-c00f-256a97d2977e@amd.com>
References: <32b61077-f760-8fe0-c00f-256a97d2977e@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:e3b1:83be:2b02:85cb]
X-ClientProxiedBy: YT2PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::20) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:e3b1:83be:2b02:85cb) by
 YT2PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.54 via Frontend Transport; Mon, 17 May 2021 14:40:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa32c85-f2af-4a63-f4d6-08d91941ac3f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2800:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2800244256D3D3A224E4F2ECEA2D9@SN6PR12MB2800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTiYyOzu1Xl9l23mUknil75JegIoafk1Tg5o96QFCnhKqLILBqY0Pl95N+HaRk45KrOIqBaRY4ILjNhnggC0dnZMu2OCmnLGr7DXfPjQRQdukE3COMy5DKcn787reejCRKhOliHJZsk2QieBksT2zSNTwGlFu4S1EUDMs0GkbS4Sl5pxjP9VF/eHsM/QYmH5ib8+9/E3Lt9JjZOyXQM4Spo+Wt+LT9+JkQgrGizhEAtgOo9xtfI4KralG2Ggz5OkTjeWiZSNAGse1TFkxZD3d2KNph1RTY8M2KJZ/Sbb4dbnRshzbfhyFEWR+IiMuaCHkDs1Ickr1jqzCX7hp+TOzfifLdNIKOuzBydLajCAFgwWQmvqsd6hOyWu/FqPpV0EuJUFHg8wEvDvQeOuaRdrRRzua5RNM8hX4CYPq7i15rhRu6hjX4qH3ej1sE+iwgyLnqD7PxE/9U3944Ox1H1t59Nchz4wm5ba0JTYoCMZNApMmqPpH2HOxyjkfDLqmsQzC0lYVEp+E8RyIFUKzAEaGZ26+ne5/gACILGCh0/5JGp2ne5qxBSE8h09qjB3qpGQePnr84iY97XeMqmrgFyqqCG+WTbQFKFtr6NvPw5uvGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39850400004)(346002)(6636002)(36756003)(6486002)(2616005)(44832011)(38100700002)(478600001)(30864003)(8936002)(66476007)(6666004)(1076003)(6512007)(83380400001)(16526019)(66556008)(186003)(316002)(86362001)(52116002)(5660300002)(2906002)(8676002)(6506007)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GnB4sk/kVVR9agdW1miKEXfDSOwBJY3l6jO6uJk6xKGOJ8WLet1+ujn8wFel?=
 =?us-ascii?Q?uHLysuCZeLJWG9DQev+vnRfvxk6U/Z9EWBmDHVgxulPOekBV5VEouftPsuEr?=
 =?us-ascii?Q?lStRZSwydp/JRkXXua/had0WYbzCjED+6JHzcwwZBydpasqLexH0wU5hA7IS?=
 =?us-ascii?Q?ymFcXao6qeqiXjc/wibTFk3iztV23UqXuZGWS6Xz1lJxqguF4i08Qs4OofSc?=
 =?us-ascii?Q?0hBOhnMh1tJ2IAFFwDfooonRNf9pRy/oLbfKRF25rNUDH4+7q9t+q+vELHJk?=
 =?us-ascii?Q?6nV4KawlSzSNOuimLBmRvPT2aziV2Sb08CplsjcnpAAQm2Dzvgju9SI+dsw4?=
 =?us-ascii?Q?vxv8FFqRz78oFQHbr9YSh+1MoZqlW+5032GeAxneLBk+Y2swU5WcTk/tapqT?=
 =?us-ascii?Q?30npqycttQ+wXpHOTGtJXkbmhDaaaWinhKRibBP2wwIfpOzA45HQxTuv8k1S?=
 =?us-ascii?Q?mU8n3tcVFT5PopfM6Ea/KYzlsIvdsT0ZPSseDKwnlczg0Wt7Z01tJ9ClYzZY?=
 =?us-ascii?Q?hw1ymLW5ijo3wNvH054rO26m4WIuxoSXkdevbHoEWt9hb4FEhbzfp2lbTHNj?=
 =?us-ascii?Q?DSCCcF+UXK5mAW8KWMvuxPL34rP0LsU4vO3PVBd5YrsWRq04SgpO4DdGQzLE?=
 =?us-ascii?Q?9rhDb2CTb0yVsfe7WUSB3zBjASqvg0wKqGlOvf7ohqR7IsOnFeFnsmeV+Bw0?=
 =?us-ascii?Q?6sbgNKN3GeZgZ/OQlDzwGZQrW+SUWW0M/XgeWpZZQZWGaXkappEO+WQmpf1j?=
 =?us-ascii?Q?qvR3E+D3zOzHC7QsCowHzt6twQh/6AWgwEvHJb4T1BN4ZO5xevja+gbUPrPn?=
 =?us-ascii?Q?qZdKj0FCY4XndOKA233jVxeV3DQWY4WVxBC2OeKnp5Vb+IzzFNG0TCFczyZ2?=
 =?us-ascii?Q?giYqbmGMADiE73fwG25mBVVjJ1jnNNdH1tPXd0ttP6geyxYijLSYAMdbD9fU?=
 =?us-ascii?Q?fz/SWpG0ebgwRHfy+r0GxWtdQC7XBh8UZeeYUaBzhnGC15Vj53Nwtj3fy1FT?=
 =?us-ascii?Q?YN6v8IxTrPRXaJgicB+l0AlC2Rulk4vnSeQnoQYH8LYpv7KgwBYrurcg8vBk?=
 =?us-ascii?Q?7rWsC56zuqDtrzY3cuEQv83bsTTfOWKMykHKVDbsWK9jy3M2Ym59DZr9+v9x?=
 =?us-ascii?Q?firpeE6K6uWstLa7i/t46pWfc7WINvVz6IvTQXnIbMetPD6HM9ey74roKfUy?=
 =?us-ascii?Q?lPhpdO+fZe60CtXe3/5v6o/XNCNkmInFYXMn3lehTAUUqNZYjHnQvEkC0Dj1?=
 =?us-ascii?Q?Wus8rk8soSfy7IfdqGT9nsHvs03x25n56ztxlRiF8CtpydSh3CdPfQnOFltM?=
 =?us-ascii?Q?rXCP5cwNftNgSF69EwWDX8jCIwS8affAFW2gz2Atm6Pz1nWfZpwsXDBKI9Q9?=
 =?us-ascii?Q?GSBZtKsXl7MtkJeOdm2gB47JkBCu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa32c85-f2af-4a63-f4d6-08d91941ac3f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 14:40:11.9927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTpPJtgsb3bUSwRG1vujJ7HxKPzPsPtKbezcoRrZeyB6gTlKvrQNim2Q5FWJ2V20sxOsvh5E6NUyjpJAPWW1Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2800
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

Problem:
Handle all DMA IOMMU group related dependencies before the
group is removed. Those manifest themself in that when IOMMU
enabled DMA map/unmap is dependent on the presence of IOMMU
group the device belongs to but, this group is released once
the device is removed from PCI topology.

Fix:
Expedite all such unmap operations to pci remove driver callback.

v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
v6: Drop the BO unamp list
v7:
Drop amdgpu_gart_fini
In amdgpu_ih_ring_fini do uncinditional  check (!ih->ring)
to avoid freeing uniniitalized rings.
Call amdgpu_ih_ring_fini unconditionally.
v8: Add deatiled explanation

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 14 +-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     |  6 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  5 +++++
 drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
 drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  4 ----
 drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  4 ----
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  4 ----
 18 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 18598eda18f6..a0bff4713672 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3256,7 +3256,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 	NULL
 };
 
-
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 		amdgpu_ucode_sysfs_fini(adev);
 	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
 
-
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
 
 	amdgpu_device_ip_fini_early(adev);
+
+	amdgpu_gart_dummy_page_fini(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index c5a9a4fb10d2..6460cf723f0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
  *
  * Frees the dummy page used by the driver (all asics).
  */
-static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
 {
 	if (!adev->dummy_page_addr)
 		return;
@@ -365,15 +365,3 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
 
 	return 0;
 }
-
-/**
- * amdgpu_gart_fini - tear down the driver info for managing the gart
- *
- * @adev: amdgpu_device pointer
- *
- * Tear down the gart driver info and free the dummy page (all asics).
- */
-void amdgpu_gart_fini(struct amdgpu_device *adev)
-{
-	amdgpu_gart_dummy_page_fini(adev);
-}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
index a25fe97b0196..030b9d4c736a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
@@ -57,7 +57,7 @@ void amdgpu_gart_table_vram_free(struct amdgpu_device *adev);
 int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
 void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
 int amdgpu_gart_init(struct amdgpu_device *adev);
-void amdgpu_gart_fini(struct amdgpu_device *adev);
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
 int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
 		       int pages);
 int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
index faaa6aa2faaf..433469ace6f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
@@ -115,9 +115,11 @@ int amdgpu_ih_ring_init(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih,
  */
 void amdgpu_ih_ring_fini(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih)
 {
+
+	if (!ih->ring)
+		return;
+
 	if (ih->use_bus_addr) {
-		if (!ih->ring)
-			return;
 
 		/* add 8 bytes for the rptr/wptr shadows and
 		 * add them to the end of the ring allocation.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 233b64dab94b..32ce0e679dc7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -361,6 +361,11 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
 		if (!amdgpu_device_has_dc_support(adev))
 			flush_work(&adev->hotplug_work);
 	}
+
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
+	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 183d44a6583c..df385ffc9768 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index d32743949003..b8c47e0cf37a 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 2bfd620576f2..5e8bfcdd422e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -954,7 +954,6 @@ static int gmc_v10_0_sw_init(void *handle)
 static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
 {
 	amdgpu_gart_table_vram_free(adev);
-	amdgpu_gart_fini(adev);
 }
 
 static int gmc_v10_0_sw_fini(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 405d6ad09022..0e81e03e9b49 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -898,7 +898,6 @@ static int gmc_v6_0_sw_fini(void *handle)
 	amdgpu_vm_manager_fini(adev);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 	release_firmware(adev->gmc.fw);
 	adev->gmc.fw = NULL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 210ada2289ec..0795ea736573 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1085,7 +1085,6 @@ static int gmc_v7_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 	release_firmware(adev->gmc.fw);
 	adev->gmc.fw = NULL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index c1bd190841f8..dbf2e5472069 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1194,7 +1194,6 @@ static int gmc_v8_0_sw_fini(void *handle)
 	kfree(adev->gmc.vm_fault_info);
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 	release_firmware(adev->gmc.fw);
 	adev->gmc.fw = NULL;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index c82d82da2c73..5ed0adae05cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1601,7 +1601,6 @@ static int gmc_v9_0_sw_fini(void *handle)
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_unref(&adev->gmc.pdb0_bo);
 	amdgpu_bo_fini(adev);
-	amdgpu_gart_fini(adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index da96c6013477..ddfe4eaeea05 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 5eea4550b856..941d464a2b47 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -570,10 +570,6 @@ static int navi10_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 751307f3252c..9a24f17a5750 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 973d80ec7f6c..b08905d1c00f 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index dead9c2fbd4c..32ec4b8e806a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -514,10 +514,6 @@ static int vega10_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 58993ae1fe11..f51dfc38ac65 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -566,10 +566,6 @@ static int vega20_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
-- 
2.25.1

