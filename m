Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB003F60BA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 16:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B8689A08;
	Tue, 24 Aug 2021 14:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347B489786;
 Tue, 24 Aug 2021 14:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT1YnG7RdyFPmRfSXiQZdxJqP2Cy7RjK6FkVy6SuLebpe9M+3stWbek9zR1UpCgNHjmpQUF0pEyIaKFbMOlFO8N/TQw2+am4miHJi4yHd0I9Zef/nX0ZPY0IC6epHESlf+pNwdQOvLwkrYvQ6ZxhG2HrH1i3l4d40NRwitt6ImNhQ+N3b0KiPxLbZFEY+V8iTXY+9BBaHXLF4FNnDscpxZP186u6njIr4zbm++McXuL7+vLW1gjkDs2utITH30l+6vS0K8eSUIRi42j4uikBDB5wkGUfu+x0RTFv3L9UpW3582aDvhpbWRqoCqrJscb1AZFsIFz9cxXuKq0lZeDH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biRH/pDz6IDlLfYB2TCdYV8s7lNZiZ4Iz2cegLN/YYs=;
 b=mUcCVhhGUdc5pzJIBZZ2sM8ziIiivG5TlwpNRgl7pemwiSoKLhZ8fexsZ2p6YOXjmW99PbNl2OH5J0bc3eiHP6ZeGScGH0cvE5buL8uKyLA0Kn4u16AzKXBcFiwF0qiXgAs5YzBPR917oW8gYlwXmS2VsWsXAmXLHC3KbK3riLK0gq2xdbFSm26V+txjHJodktqZMYjWabY8bS6u6i55QudATS3QRnt3alAQFjbQSyxTc+kpbrqOOAZihnNu34vxhM0Cdo5wmFL3HM0Y6kj9m6tEw8m9Weq8PE9v++4gSdSAp0RixGWa9yMGqMm03rm7whQ9LwymZR3EsbEaGrBATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biRH/pDz6IDlLfYB2TCdYV8s7lNZiZ4Iz2cegLN/YYs=;
 b=I64d51AD4p0yohnoIMVCRAjTFO5JY9UNl4/Gry2qb9TDPQBl1sXL/xZn7FiHWtzA1ks7LhghhwDwgD2qjhSrO3dYHo5oyLttxLWB6U4uxUH9pMjUpSd3bP9xDiYwCM6sRhG+aYyERywJFF+IvlNwcO83hMolvM1iMYm3XsZdZhQhTj13Zl9ID+jXscN6PlzBvpWjEqlcVYa0oQ29BDhUS17CISdVuWEaa9kpjVjow48BG/TJBf36HQgAe8smroi4FaD/MQb3i65HmXgL2Nu53egumF9qYrANQlXEfbC2Er54iI4hF+WiMb7o6UtVDpSLY6FAdtnOeDo6v5aN7t6zcg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 14:26:19 +0000
Received: from DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5]) by DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5%9]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:26:19 +0000
From: Maor Gottlieb <maorg@nvidia.com>
To: dledford@redhat.com, jgg@nvidia.com, hch@infradead.org, leonro@nvidia.com
Cc: aelior@marvell.com, daniel@ffwll.ch, airlied@linux.ie,
 dennis.dalessandro@cornelisnetworks.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mkalderon@marvell.com,
 mike.marciniszyn@cornelisnetworks.com, mustafa.ismail@intel.com,
 rodrigo.vivi@intel.com, sroland@vmware.com, shiraz.saleem@intel.com,
 tzimmermann@suse.de, linux-graphics-maintainer@vmware.com,
 liweihang@huawei.com, liangwenpeng@huawei.com, yishaih@nvidia.com,
 zackr@vmware.com, zyjzyj2000@gmail.com
Subject: [PATCH rdma-next v4 1/3] lib/scatterlist: Provide a dedicated
 function to support table append
Date: Tue, 24 Aug 2021 17:25:29 +0300
Message-Id: <20210824142531.3877007-2-maorg@nvidia.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210824142531.3877007-1-maorg@nvidia.com>
References: <20210824142531.3877007-1-maorg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0191.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::28) To DM4PR12MB5296.namprd12.prod.outlook.com
 (2603:10b6:5:39d::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dev-l-vrt-201.mtl.labs.mlnx (94.188.199.18) by
 AM0PR02CA0191.eurprd02.prod.outlook.com (2603:10a6:20b:28e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 14:26:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2605e176-cc4d-479a-65e1-08d9670b239f
X-MS-TrafficTypeDiagnostic: DM8PR12MB5400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5400618A3CACF3BE51B2A62CDEC59@DM8PR12MB5400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdae4DIP9BuXEgYjBGyPat8PzLvpbmm4octVZtZmoLVZEd2ZIGvHMC9A+UrH7xaAzreHN5mtKMhxuxVDhnFsYgwUw1kiFi8s3XFhqqIMTmstJ+Oc+kFuurMzMmaN9LMK7Si4UyZRuUwEusrWR+rIZ5o2u8iSIhG7r3K/VB9BJR3dJaALUVlJjMMWEw6dRguAMaBR+AlWAucj/VOjjVwSDzJUe0fe8jTwGdE96C9T4AbbmGIuVVA6LAxwfaT18R0HZQ/eXGF0JlgaIpnghgiumJEn6rG6r0v2lGxwSx63W9YjRQUelrDrBfr8Rdg1gakYuiWEbyTDxLEd3iF4mZkNXsAapCWDdh/EbkZKIxPqyobGxDAnDw1mOCU8XR3vRM0qtr0Mpgs153BEJry1sUcRao8e2a0ZbYgtmcB+kaoiZqJdh9VWZ8oI6y+maCO6xO0W4+iZTMsfN6gV6duRmKXsZea3Dcp7TYe1QJahIu3E6/F4jt/wnQDcQ7QP6hfzpa3c3DoewDgOsr42He0jttGQbdJUu1B0EeDz9d+xevM4fDiNVOoDOUddSCP0jddyxiUyj6fti/NHgZXNYHq9fI1AAY9ZkT5tkBkFtNXEcyTK5miqBiEGVqn7gsz+Pd+t+NZnP6XL+pxEkmGz73KC7GcuU/9O18u8dgmD8eVmWqXdPq8GBT2gZ2FR9qOgBjeg8x78qQ77D8jjeBhILWCbUx7V5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5296.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(7416002)(1076003)(83380400001)(8936002)(316002)(956004)(2906002)(36756003)(6486002)(6666004)(26005)(2616005)(38100700002)(6636002)(30864003)(4326008)(66946007)(6506007)(508600001)(186003)(5660300002)(86362001)(52116002)(6512007)(66476007)(38350700002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?28X/2Z6JCC0gFeCReyf89HM4aW85ZYbDyaTPhlQNqU0BZgfHa+7DhtD+Rfp4?=
 =?us-ascii?Q?4BzAQLV8u5z7TjU2PpXmLGwxT9kRyoUrzcnNxS1fXQ6VcrCnZbtBjHueZpgV?=
 =?us-ascii?Q?6neCP+aMTxHw+Nanyt/94S4TR+d43XZDIWyDQsvGVM77D9H9potTtDHKX7T8?=
 =?us-ascii?Q?zSAHIUVR2SVXE1Z9Y/z9p6nfhmxVWi1tbASPFXesq2oa32EVP+j+KgL212fc?=
 =?us-ascii?Q?B3PxCaWpfvF3kEBxM2TBIdJgrmVkml4OH5X7ZPUqf4JM9kmEvyY796kci1RV?=
 =?us-ascii?Q?4muPtIj8VFphBi+lTXWb89m2otbD8RM1Wh8CQCaYncjPE7h/oYiXTgTojPDO?=
 =?us-ascii?Q?DGWaHrprTbRw5SifVHgqEEn7RrTtmkCxlIzsw7mRKWMo8zpr4H536ps3XSB5?=
 =?us-ascii?Q?G1rnfMc9GfwQ6DXWSL+rX4BTbKfng7ly5yINT/GJyffA7vWn5hCu0XTWa28f?=
 =?us-ascii?Q?3QWnKpYgA1wSYAoVQIVX3hlXkiB8/4D9BgZBrbEtvA/hiOQOYSK8eKtVwet9?=
 =?us-ascii?Q?EJ30Wt0ojt9TxX7TRo4pOzhvLkgTVVtmOa/4gB7TN69O67Gqy2/Yc8FFXjcu?=
 =?us-ascii?Q?AsYNNKp18/5/opCJ4CBLE18kSvCg3cPcgvSmG/1g9YmeIbEoKglxtvwRRCYA?=
 =?us-ascii?Q?KeFXT2ZOvE0zaml028q2NlhWryP4Tk8dMTPTT+p3l1qz5pjIXeNqS0lSfW4p?=
 =?us-ascii?Q?u0ovBWk+mLiZlui5kfm2yqO1fC8K6ngc5Vjo8+nVMaAv60Hdijh4MoYHdEN9?=
 =?us-ascii?Q?piYIkurE6t1CBhR+fobhsKvwxE1QU71mNq2b4UJHqaIxRTDPM7ycUnxIh+IK?=
 =?us-ascii?Q?HKhZKoEfscNKhx1ko/eWVle4hLdm0eYVtikscvybdGcsf+dTPgTWcntc3j75?=
 =?us-ascii?Q?oHq/8KkvV/odsyx+iVHdc4XwcAv2E/8CKYaPyqepqdxgcI6+zy0mlh+q5o6O?=
 =?us-ascii?Q?yp6z6Je8Ri/dk1bofN6bdVM8dr8c8KihPUC3bnRcCHOdR7H9IoP8YOllLIwJ?=
 =?us-ascii?Q?dI2KNQUztKdVr9hrx8S0aHy5Ica2ig9yJq/55xsliRQ52RKRAQa5nz3E//++?=
 =?us-ascii?Q?OX6v6WRVFAT8dZvVrgcigacTCYd+mBgbvE4xbOYwcSSh+CvmirnCZCY2cQdC?=
 =?us-ascii?Q?QT+lQZUP8in1oK9RQeqbBOsQaFFvc0d3APks3ErecWIycyU94dFtuDVi0xWb?=
 =?us-ascii?Q?5poWwOejsUK+cQC/yVx9UwRAr8slyNeC80BYo19XpblSXm4bVRGg51jbMDxS?=
 =?us-ascii?Q?F7Ylo8rhX9nJRIh1zs4tgzOH8117pM4HqzmTpXdgB1zE6LoBg3i9A4V9cg4Y?=
 =?us-ascii?Q?rq7x0PcmXvAW2ZPIyutDUAx2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2605e176-cc4d-479a-65e1-08d9670b239f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5296.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:26:19.3657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgE5XNCcI1JZWRAlZ5bJRtXU6UieHS+x47ZQzfOWctZ3NSsMHcmcvpcZtTW5wbtKM7/WS9P6PREDtx0tWmXUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5400
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RDMA is the only in-kernel user that uses __sg_alloc_table_from_pages to
append pages dynamically. In the next patch. That mode will be extended
and that function will get more parameters. So separate it into a unique
function to make such change more clear.

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/gpu/drm/drm_prime.c                 | 13 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 11 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  | 14 +++-----
 drivers/infiniband/core/umem.c              |  4 +--
 include/linux/scatterlist.h                 | 39 ++++++++++++++++++---
 lib/scatterlist.c                           | 36 ++++++++++---------
 tools/testing/scatterlist/main.c            | 25 +++++++++----
 7 files changed, 90 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..cf3278041f9c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -807,8 +807,8 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 				       struct page **pages, unsigned int nr_pages)
 {
 	struct sg_table *sg;
-	struct scatterlist *sge;
 	size_t max_segment = 0;
+	int err;
 
 	sg = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
 	if (!sg)
@@ -818,13 +818,12 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		max_segment = dma_max_mapping_size(dev->dev);
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
-	sge = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
-					  nr_pages << PAGE_SHIFT,
-					  max_segment,
-					  NULL, 0, GFP_KERNEL);
-	if (IS_ERR(sge)) {
+	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
+						nr_pages << PAGE_SHIFT,
+						max_segment, GFP_KERNEL);
+	if (err) {
 		kfree(sg);
-		sg = ERR_CAST(sge);
+		sg = ERR_PTR(err);
 	}
 	return sg;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 7487bab11f0b..458f797a9e1e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -133,7 +133,6 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	unsigned int max_segment = i915_sg_segment_size();
 	struct sg_table *st;
 	unsigned int sg_page_sizes;
-	struct scatterlist *sg;
 	struct page **pvec;
 	int ret;
 
@@ -153,13 +152,11 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
 	spin_unlock(&i915->mm.notifier_lock);
 
 alloc_table:
-	sg = __sg_alloc_table_from_pages(st, pvec, num_pages, 0,
-					 num_pages << PAGE_SHIFT, max_segment,
-					 NULL, 0, GFP_KERNEL);
-	if (IS_ERR(sg)) {
-		ret = PTR_ERR(sg);
+	ret = sg_alloc_table_from_pages_segment(st, pvec, num_pages, 0,
+						num_pages << PAGE_SHIFT,
+						max_segment, GFP_KERNEL);
+	if (ret)
 		goto err;
-	}
 
 	ret = i915_gem_gtt_prepare_pages(obj, st);
 	if (ret) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 0488042fb287..fc372d2e52a1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -363,7 +363,6 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 	int ret = 0;
 	static size_t sgl_size;
 	static size_t sgt_size;
-	struct scatterlist *sg;
 
 	if (vmw_tt->mapped)
 		return 0;
@@ -386,15 +385,12 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		if (unlikely(ret != 0))
 			return ret;
 
-		sg = __sg_alloc_table_from_pages(&vmw_tt->sgt, vsgt->pages,
-				vsgt->num_pages, 0,
-				(unsigned long) vsgt->num_pages << PAGE_SHIFT,
-				dma_get_max_seg_size(dev_priv->drm.dev),
-				NULL, 0, GFP_KERNEL);
-		if (IS_ERR(sg)) {
-			ret = PTR_ERR(sg);
+		ret = sg_alloc_table_from_pages_segment(
+			&vmw_tt->sgt, vsgt->pages, vsgt->num_pages, 0,
+			(unsigned long)vsgt->num_pages << PAGE_SHIFT,
+			dma_get_max_seg_size(dev_priv->drm.dev), GFP_KERNEL);
+		if (ret)
 			goto out_sg_alloc_fail;
-		}
 
 		if (vsgt->num_pages > vmw_tt->sgt.orig_nents) {
 			uint64_t over_alloc =
diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 0eb40025075f..b741758e528f 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -226,8 +226,8 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 
 		cur_base += ret * PAGE_SIZE;
 		npages -= ret;
-		sg = __sg_alloc_table_from_pages(&umem->sg_head, page_list, ret,
-				0, ret << PAGE_SHIFT,
+		sg = sg_alloc_append_table_from_pages(&umem->sg_head, page_list,
+				ret, 0, ret << PAGE_SHIFT,
 				ib_dma_max_seg_size(device), sg, npages,
 				GFP_KERNEL);
 		umem->sg_nents = umem->sg_head.nents;
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index ecf87484814f..5c700f2a0d18 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -285,14 +285,45 @@ void sg_free_table(struct sg_table *);
 int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int,
 		     struct scatterlist *, unsigned int, gfp_t, sg_alloc_fn *);
 int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);
-struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
+struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
 		struct scatterlist *prv, unsigned int left_pages,
 		gfp_t gfp_mask);
-int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
-			      unsigned int n_pages, unsigned int offset,
-			      unsigned long size, gfp_t gfp_mask);
+int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
+				      unsigned int n_pages, unsigned int offset,
+				      unsigned long size,
+				      unsigned int max_segment, gfp_t gfp_mask);
+
+/**
+ * sg_alloc_table_from_pages - Allocate and initialize an sg table from
+ *			       an array of pages
+ * @sgt:	 The sg table header to use
+ * @pages:	 Pointer to an array of page pointers
+ * @n_pages:	 Number of pages in the pages array
+ * @offset:      Offset from start of the first page to the start of a buffer
+ * @size:        Number of valid bytes in the buffer (after offset)
+ * @gfp_mask:	 GFP allocation mask
+ *
+ *  Description:
+ *    Allocate and initialize an sg table from a list of pages. Contiguous
+ *    ranges of the pages are squashed into a single scatterlist node. A user
+ *    may provide an offset at a start and a size of valid data in a buffer
+ *    specified by the page array. The returned sg table is released by
+ *    sg_free_table.
+ *
+ * Returns:
+ *   0 on success, negative error on failure
+ */
+static inline int sg_alloc_table_from_pages(struct sg_table *sgt,
+					    struct page **pages,
+					    unsigned int n_pages,
+					    unsigned int offset,
+					    unsigned long size, gfp_t gfp_mask)
+{
+	return sg_alloc_table_from_pages_segment(sgt, pages, n_pages, offset,
+						 size, UINT_MAX, gfp_mask);
+}
 
 #ifdef CONFIG_SGL_ALLOC
 struct scatterlist *sgl_alloc_order(unsigned long long length,
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 27efa6178153..611c63d4a958 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -397,7 +397,7 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
 }
 
 /**
- * __sg_alloc_table_from_pages - Allocate and initialize an sg table from
+ * sg_alloc_append_table_from_pages - Allocate and initialize an sg table from
  *			         an array of pages
  * @sgt:	 The sg table header to use
  * @pages:	 Pointer to an array of page pointers
@@ -425,7 +425,7 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
  *   If this function returns non-0 (eg failure), the caller must call
  *   sg_free_table() to cleanup any leftover allocations.
  */
-struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
+struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
 		struct scatterlist *prv, unsigned int left_pages,
@@ -520,36 +520,40 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
 		sg_mark_end(s);
 	return s;
 }
-EXPORT_SYMBOL(__sg_alloc_table_from_pages);
+EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
 
 /**
- * sg_alloc_table_from_pages - Allocate and initialize an sg table from
- *			       an array of pages
+ * sg_alloc_table_from_pages_segment - Allocate and initialize an sg table from
+ *                                     an array of pages and given maximum
+ *                                     segment.
  * @sgt:	 The sg table header to use
  * @pages:	 Pointer to an array of page pointers
  * @n_pages:	 Number of pages in the pages array
  * @offset:      Offset from start of the first page to the start of a buffer
  * @size:        Number of valid bytes in the buffer (after offset)
+ * @max_segment: Maximum size of a scatterlist element in bytes
  * @gfp_mask:	 GFP allocation mask
  *
  *  Description:
  *    Allocate and initialize an sg table from a list of pages. Contiguous
- *    ranges of the pages are squashed into a single scatterlist node. A user
- *    may provide an offset at a start and a size of valid data in a buffer
- *    specified by the page array. The returned sg table is released by
- *    sg_free_table.
+ *    ranges of the pages are squashed into a single scatterlist node up to the
+ *    maximum size specified in @max_segment. A user may provide an offset at a
+ *    start and a size of valid data in a buffer specified by the page array.
  *
- * Returns:
+ *    The returned sg table is released by sg_free_table.
+ *
+ *  Returns:
  *   0 on success, negative error on failure
  */
-int sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
-			      unsigned int n_pages, unsigned int offset,
-			      unsigned long size, gfp_t gfp_mask)
+int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
+				unsigned int n_pages, unsigned int offset,
+				unsigned long size, unsigned int max_segment,
+				gfp_t gfp_mask)
 {
-	return PTR_ERR_OR_ZERO(__sg_alloc_table_from_pages(sgt, pages, n_pages,
-			offset, size, UINT_MAX, NULL, 0, gfp_mask));
+	return PTR_ERR_OR_ZERO(sg_alloc_append_table_from_pages(sgt, pages,
+			n_pages, offset, size, max_segment, NULL, 0, gfp_mask));
 }
-EXPORT_SYMBOL(sg_alloc_table_from_pages);
+EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
 
 #ifdef CONFIG_SGL_ALLOC
 
diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index 652254754b4c..c2ff9179c2cc 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -87,28 +87,39 @@ int main(void)
 		int left_pages = test->pfn_app ? test->num_pages : 0;
 		struct page *pages[MAX_PAGES];
 		struct sg_table st;
-		struct scatterlist *sg;
+		struct scatterlist *sg = NULL;
+		int ret;
 
 		set_pages(pages, test->pfn, test->num_pages);
 
-		sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
-				test->size, test->max_seg, NULL, left_pages, GFP_KERNEL);
-		assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
+		if (test->pfn_app) {
+			sg = sg_alloc_append_table_from_pages(
+				&st, pages, test->num_pages, 0, test->size,
+				test->max_seg, NULL, left_pages, GFP_KERNEL);
+			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
+		} else {
+			ret = sg_alloc_table_from_pages_segment(
+				&st, pages, test->num_pages, 0, test->size,
+				test->max_seg, GFP_KERNEL);
+			assert(ret == test->alloc_ret);
+		}
 
 		if (test->alloc_ret)
 			continue;
 
 		if (test->pfn_app) {
 			set_pages(pages, test->pfn_app, test->num_pages);
-			sg = __sg_alloc_table_from_pages(&st, pages, test->num_pages, 0,
-					test->size, test->max_seg, sg, 0, GFP_KERNEL);
+			sg = sg_alloc_append_table_from_pages(
+				&st, pages, test->num_pages, 0, test->size,
+				test->max_seg, sg, 0, GFP_KERNEL);
 
 			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
 		}
 
 		VALIDATE(st.nents == test->expected_segments, &st, test);
 		if (!test->pfn_app)
-			VALIDATE(st.orig_nents == test->expected_segments, &st, test);
+			VALIDATE(st.orig_nents == test->expected_segments, &st,
+				 test);
 
 		sg_free_table(&st);
 	}
-- 
2.25.4

