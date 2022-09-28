Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4535EDC40
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227C110E491;
	Wed, 28 Sep 2022 12:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C2F10E4B2;
 Wed, 28 Sep 2022 12:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVFfU8Ux64UNDQSQ1H9IRf1V+MR2WbdG8wttbfqFkG2sn/6a07mK1FW0izABo001jDJv5awg0BnCsHuVQez/0qtQvutwuKpbP4m/PPz/ijye9D+oekA/+A1yzbkQAuNuulKTscnj1Zh6cgnYR+HVzqrg9GuKsmTSxsKVWtrKCb9u/WUGKy7/iBKO5J2rKqaIXWdOygy8+YurWuKWbB1lkHasJlSMsJshrEipHR0SIngtug7EJ6BRrnnKGjsS9BFtz2+HIKNkYoh2f1yEelaB7QD8e8IXztO4pNZqNXP341A4WcAMvICCi+JbCnIA020WIkvPNsA8iyOv/FshDTcTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiMf8uPwmhpzqByf/TKsI/cucXcphTXO4Sgs7noQ56k=;
 b=OSYVmPpan+wOP4dZObNoCXsQLEsySBs+vF1CGQ9icB9NNKQ8q8YRCV5VBQsnT9eD9AHlkZvwBuE5nMm9FBjQR+gzgiKYkVk3OomEdI7DAzmpnqYoVqpGfp+7VOWTeeu4N2FzS8pn5N13x8zSStQa4aG0niafHi0csFNWBAE+QGc1lqCmqkxonKyULbtInRoGiV0onLyLc4oJ5JU1I20xMXISsE3fCQ+nODUh6x6S/g+tQJBF+HsjCmjfJGeR75+t+5ICu3D7bEtI7RCJMZcHGE9h6JIL7lVsAHr9AqRzG0DCY5RJb/u8TECrPGMhex9JiZdbZ7OUsepxOBZhRbQg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiMf8uPwmhpzqByf/TKsI/cucXcphTXO4Sgs7noQ56k=;
 b=lGBHngB5PGqXiimXsxd0FI+/M977+qKk4D+iF1ZxFP4OtcG06QM1Yr5oi8WZsxDNj2Lx+QrORO2bw627RvXEzfwXTZop/hy8IDiatJgBLGQZo9g/2ee5nC3i6XCRT+2aS9TQf7YckhsIU5gAe8atrZzMYjnxpwt7j8G5+w0rSDyaSv6QaqMjk9p3soe5sUqmQWtZw6pI2MjRPIXSDgukzZ2wEN2En5HTpJ/ptJY06siXqYwev0qXVJ8G2cbTS+GmUD63381zanRd+rDv/OIMSzS/DO9ifI27KhmeW4y9LZ3bD7b6MG5aVXePGxebyrQnd5/iy4EdCY1MMKRGAfIZcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:02:24 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 12:02:24 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2 7/8] nouveau/dmem: Evict device private memory during
 release
Date: Wed, 28 Sep 2022 22:01:21 +1000
Message-Id: <66277601fb8fda9af408b33da9887192bf895bda.1664366292.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY0PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::21) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: eb695943-c5a0-4f81-6e03-08daa1494e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Arja5SDzACxxa41DQoRq+5Kf+Bwiskz8IA6LCuhkNEFAzJhXR5UHGXXL7Ik/yNFdHI1rwb5zhW3l9Hud+0pq2USguZBsw+hAtOD1foZusEQlkpVo3xvG7VB90DtITyMczCRRvJzsJBnO636Dh58ieUGRZjIK4QRlUBrC9/4vCFTfG5dScYupg7s9Bfh/4gels/eoBJQpYkXkQkVEjlkfOJ6SqTgrNRXwQNOYjIQEokNAFFAplx3i6pk/U+kCEMcWfAzgdqilq0fn/zSY3K8nh23QrYTLHfjPfwrQXapUXo7KtjL5pt5Qu+NfCFLdhX37Irw+NuYq/psDJSGbOVguFNbla9HXLswrSE7WsvFhijSWPG2+nYfri0Jt+2FiK9ONVNnjgWiAQsJRnkcoML5km2QeueYJ5LcDf83/nYbAzz5Ps+5nmqs8pAM+iqlzKsG6SMr0FUxWEbP4ASTH3ShbF7nYo7jaMiOBTp+RiFtLZ/xkbNoztsLxgZuzPpQYA6/rOOs9eSAmNDGXOPor002Sv+AKQCeFGuYJTkHD7qoWg8b6NqTxS3pSMMjfYlWmy3rx/wKmlkcg+quUGdkI6JgMWbrL61CFK16/dqNIRFmitiGweoC7tTQMS/dVBuzQ3Tdz8vQmyIghUQkYsSEgOVIhdwBiz/COGv4j9KBPTod19CcAZwt7SnjlK1o66Q9wnm42xy0N2ZnZVkRpNYKtyhQvjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(8936002)(478600001)(316002)(5660300002)(83380400001)(36756003)(6506007)(107886003)(6666004)(41300700001)(54906003)(6486002)(2906002)(66946007)(186003)(66556008)(2616005)(66476007)(4326008)(8676002)(26005)(86362001)(6512007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kmL+har2Xav8wqyZC/khsNbgUUdiQTqjj3Ujj/A/L8kYrzCsbGEzrMRmTEGl?=
 =?us-ascii?Q?7CGnCrgRN5CqnlKhHkX2squoLt6xI+RbMCTWzNYclaic8r6bCzcxA02ydZKO?=
 =?us-ascii?Q?/lNDfCz7LwL3Rh/PRcKHLU8CBrlVLpqId2aX8l31d9SABVI3FQS0xKexhIjk?=
 =?us-ascii?Q?yOs0HLFJ5CeKBiHbusn6JhlhxFCs9iIlmddBVeZ/3jaakyvzsBFb2PTDj7tW?=
 =?us-ascii?Q?FAkoJfEQgW2vYGhCBD2DPK9vsjAr9FvXiPvB2+jIwXuvr3adszFjj9XrlByS?=
 =?us-ascii?Q?gso2+FSm6sUACa11NrnpQkrXFzlZ1+AESqwAC72MRHHtCOsO7vMRf/BOOpy7?=
 =?us-ascii?Q?hiX6P/aG84N7uEDirE2Vk+CNy/W4vAyVIkb4CV+qiG5qjEER4eqObWruE3IO?=
 =?us-ascii?Q?SB35yxhwgYmqDc7ov6g7hWNDGgkaCOAssnhVwJy5+dQdCUwVNpcwFhu7XuRM?=
 =?us-ascii?Q?ak4GybSPo7QSz+GXoJS10HyNeLE1HtQ2rATtneEjELeWWKgs/DZNBpziuDhq?=
 =?us-ascii?Q?wnlvFH0oNwGI24KJLVZQ7d536psyqOwUVHtUqI1s/lQVIUyC89HZNDu1m4iN?=
 =?us-ascii?Q?P2XmwWfMzNiYzCkO7FD/CPgYIKD7Y8w7CAaV5+Ruo0Vqtf7IQep2ibDR3isF?=
 =?us-ascii?Q?qY7gR/H8V0Y3QAylBfXuP+Z2D3NPsM7nVkcMotQVnoFNGfo9bgbEpeHn37Tt?=
 =?us-ascii?Q?gcHo30RGfhhK8AjwB9WRvAU60PLhmpkLJ4zeY5IwS8+JAJShaxoG14R7y7lN?=
 =?us-ascii?Q?ctjZJshcPX6OHoAbxDus9VJrUF5zT6QdnJ5MxONdn++ZsMHq16ZNNoouhHYz?=
 =?us-ascii?Q?zbfTq6kvoyN453x2vnb517Zgpg/37x3qkR62vcvCvyYtee/q1DWj7xECvxiB?=
 =?us-ascii?Q?NUm+m900forIPOJWhvQGPFDPPxiA0z1ORxe7JavTE2fLF/uV4bPDIIX9tGMb?=
 =?us-ascii?Q?+yAUyzJJeRqPyCzIlvyBv+qOijLZ6TEdiutrMPnknggh+AS8PDj2CjKJU5Hj?=
 =?us-ascii?Q?62i7H/g5eyUPA+x+4nIJAGV0SuQHaoWp2rWNYVk9Z/Y0OEIch4Rfcce5bjo1?=
 =?us-ascii?Q?LMfFateG+g/dNAcJgC1aW2LACPeXmmmzuYL7a5ma7UnDGBDGgbLrx/Ptamgt?=
 =?us-ascii?Q?MiF7ar6uwxrVAVKbwefJ0D7LWPAycpdQCj2kL018gb94Km//K5acQq2eEj2n?=
 =?us-ascii?Q?ZNfPiP5wG6guFGDZy9eSjQoIEaGXGgSPXDc0Hpp6s/jZ+y/bB3Rq04my3/qB?=
 =?us-ascii?Q?KQnDFJPQVf4xnLYBmRcam4pa/A1PwAMtS5FbZ/8VbpZS5zAj/HuTiBmlggO5?=
 =?us-ascii?Q?l0EJKDlgjktG/yBfukAX7cNjNT4/tpq/ndoEgCnWh5GSGXheu44Vs6UOD7fX?=
 =?us-ascii?Q?0fklz4rTIUeH+zjmaiSoRHrfWmU4v8iB/cJt8D+OJASR0voYZv/IRz6fQI45?=
 =?us-ascii?Q?yj2lhxiDjmCcflz6PpVlvEjlv8MkCNp72gNOpYtIoCQo2acndOwgWO1kbE1i?=
 =?us-ascii?Q?ELzm3m26hLPVnDuQnC4Sn9wLQn/4yUATcD4eqiKTQZ4XIlGfITG4Xp5DIif2?=
 =?us-ascii?Q?gqsXpexaW9tR1aMJzAP0JLwb/iZDWbiVgrFN2krR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb695943-c5a0-4f81-6e03-08daa1494e55
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:02:24.6971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UZhIYBuFJ4j59BfUjyLjNKXg21Ejm1SGHcqPwPTPiwHkzt5AoMoYxIsqkW++igFxNlsGlBd4Jl8rztmFxtfCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the module is unloaded or a GPU is unbound from the module it is
possible for device private pages to still be mapped in currently
running processes. This can lead to a hangs and RCU stall warnings when
unbinding the device as memunmap_pages() will wait in an uninterruptible
state until all device pages have been freed which may never happen.

Fix this by migrating device mappings back to normal CPU memory prior to
freeing the GPU memory chunks and associated device private pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 48 +++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 65f51fb..5fe2091 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -367,6 +367,52 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
 	mutex_unlock(&drm->dmem->mutex);
 }
 
+/*
+ * Evict all pages mapping a chunk.
+ */
+static void
+nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
+{
+	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
+	unsigned long *src_pfns, *dst_pfns;
+	dma_addr_t *dma_addrs;
+	struct nouveau_fence *fence;
+
+	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
+	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
+	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
+
+	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
+			npages);
+
+	for (i = 0; i < npages; i++) {
+		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
+			struct page *dpage;
+
+			/*
+			 * _GFP_NOFAIL because the GPU is going away and there
+			 * is nothing sensible we can do if we can't copy the
+			 * data back.
+			 */
+			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+			nouveau_dmem_copy_one(chunk->drm,
+					migrate_pfn_to_page(src_pfns[i]), dpage,
+					&dma_addrs[i]);
+		}
+	}
+
+	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
+	migrate_device_pages(src_pfns, dst_pfns, npages);
+	nouveau_dmem_fence_done(&fence);
+	migrate_device_finalize(src_pfns, dst_pfns, npages);
+	kfree(src_pfns);
+	kfree(dst_pfns);
+	for (i = 0; i < npages; i++)
+		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
+	kfree(dma_addrs);
+}
+
 void
 nouveau_dmem_fini(struct nouveau_drm *drm)
 {
@@ -378,8 +424,10 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 	mutex_lock(&drm->dmem->mutex);
 
 	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
+		nouveau_dmem_evict_chunk(chunk);
 		nouveau_bo_unpin(chunk->bo);
 		nouveau_bo_ref(NULL, &chunk->bo);
+		WARN_ON(chunk->callocated);
 		list_del(&chunk->list);
 		memunmap_pages(&chunk->pagemap);
 		release_mem_region(chunk->pagemap.range.start,
-- 
git-series 0.9.1
