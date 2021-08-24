Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD343F60B5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 16:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D1D89C6E;
	Tue, 24 Aug 2021 14:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E138189B11;
 Tue, 24 Aug 2021 14:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inDqqe53ExUqG/rdV3bcTjU5m+2xPtO9T7h68ybonP5gNRBJCx1Aas5B5MhipsHP/eWHCK+PVfu0M4PDZymEiwvrJA74lC6XQPKAIg7L9MVFzQxa8BGDFU6a9TdS9jbjUtyn5KibdThxmWr9LRZ0rAy05udHStjNOpPopQd3GpuBtPokeePHwrB4bgrz4NpILgeGJdd2rbpbg1R7UvTpp8HvcfKCySvlLJHiSK/G+ABIGhzBZmQsPCS1hUbHbsF4ey9LGuHxXYMNupBgOjGTOJWvlYhkkKeyJWmD0QVBO3Sdbi60wBxcX60Sj9Xd2h+K3139jr1T0KIBVnH2HDsF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwhjfCm04Ox7yYEvu1+OCDj27eHj9tcsX7ook1WiJKE=;
 b=NqtoQAVr5/OPXGZkaK9GxPjQdcmMYAMA9Tk+JWfCUMeO+Jby6NjqHuPlMojIicdHXjS4NSJFROytTTdnQ202kAk2zaMH/N/uWM8NyAT51r32X84gaHNAhqsbTbqnHs8XC1KYZ7DRKhxZX6iWImQhgaj2zhJ2NxauaBujgy+tKauvJxbwcfFO/PVLxXZP1zyPcXq3UjgMv2RrvwAyGRDJOa8bsG10U9pE4XwCB4JjmM8zQWRHK1mEjf74gHoQJNwUhsY1sxDtGdpcz1bHVpwgQRjiHYdz7XmNX0/CoIu+vvIlwrxnB3FHbRNqSKxUNzqsmxBEDRceMntI4ZPvqLPWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwhjfCm04Ox7yYEvu1+OCDj27eHj9tcsX7ook1WiJKE=;
 b=khengiBJgBoYZUzmc9quvitqpgAQZuBR05So6zMwwf+T7VQrk5kGEaCIp/e4xaLOItRm20NhNT16g2PIdChPWpP36xXjYehICAA4jzRbNu/CO5meOQo4xXtXxKKujT+rwAVvbYKzzmbec5qvABRLDRmqsdgZKMtKyZck+cHHM5ae1dmaPXR5Mqn92BfWAGmRr8rtsOUJ8YrO+TbRTT+X6bblSYB7o5C/78dvexVDXedQGSa3p2tM4fFU9o4gO1Vv+vI4sYH2YRPtL1qcH3OQlb6jBxUmmBAZU+g7hyp6DLwFO1GSPkn9I+0NKGdSWCTKEUa4saVwS57cg/7/wdQr0A==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 14:26:32 +0000
Received: from DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5]) by DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5%9]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:26:32 +0000
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
Subject: [PATCH rdma-next v4 3/3] RDMA: Use the sg_table directly and remove
 the opencoded version from umem
Date: Tue, 24 Aug 2021 17:25:31 +0300
Message-Id: <20210824142531.3877007-4-maorg@nvidia.com>
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
 Transport; Tue, 24 Aug 2021 14:26:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad510bb0-b55d-4dfe-e794-08d9670b2b3d
X-MS-TrafficTypeDiagnostic: DM8PR12MB5400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB54004245690473CEE9C12CD8DEC59@DM8PR12MB5400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:277;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PcjZLUqXZXWlGBCeitTt25thK8DszZypS1AdsRPlsg48UP4MKNJac0WKosz350pquO8gkef9gAlSSzrQAyAcAL+4QyAQWqKUjxK4taRziqq4bQ7ZWpRhF1WTwkZRc2MTqSJEosIyOh37w3b7mRiGUKFRzKgaXnWMRVyR1R7dcPw04YoPEaIm7tigxBxtkO1uE9wLvi/XYFs5d7LSTnKOGL+FmbgDPab4HQuvDYnr1ijR245+WKwngiHQDNEJWucXUNtcj+pqc2Ae9BfZ9Gkmtq1elNzC60FdWHq0BBSNFRZdkwnWPn6OdSGhkAeDlsb4MMLbwecYDujT0xL8gYsMYFCIT7N9FBn5Nv9JewyEwZhj4m2WLGdBSbcP1RlzyOkySUHVkwHB7JZoVu5XGXVhtDDCvZu/oeXMe19+QFzE5UPN4kL6c5p6RNKAcnHwuUsqb6YBTD8Qapix8ivM2ldqAQtlg1MBsRsS0j6smU4fxJaf2JsM9m1zbUUTsmIqglBG/a6lNyT/jC5ZfCm5mfQQoOoOL5wlmuTWz8fFokyajZXOOtCRpl8rR/Hxut8Z0HEPMgBsseg9VnJHTmcPXcLfOuFhico8Ouef+CqJkW8uiEggLS+iQmajUiKPobSZk3uXWjaHV/Y8usSLICREClIw1ywLTm2aV5+E8n0ESvviaDG6Ei0U+6h8gfmmcZiCaXo6V+KLfhhusRhSoUbsjhllKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5296.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(7416002)(1076003)(83380400001)(8936002)(316002)(956004)(2906002)(36756003)(6486002)(6666004)(26005)(2616005)(38100700002)(6636002)(30864003)(4326008)(66946007)(6506007)(508600001)(186003)(5660300002)(86362001)(52116002)(6512007)(66476007)(38350700002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iKRIDa+uyxEEj8iIbRY2qo5iFqm+Fn5EXShXodPPNbgNLRDHadt8VV5jg6BX?=
 =?us-ascii?Q?h0w3wDEEUL91NCBtGwILHF4QS6IOghFUsa1a9yOZksVM2RejVt2AtkBPKqEi?=
 =?us-ascii?Q?3X87HK5y8yhdCA3QSKRiS1JM8HTbsCb8uyPSMZVPL8ke0JwD3KZtjWWXg1fk?=
 =?us-ascii?Q?3329cVOjeUUKfksvHTHVGBkazKaXfIdReEsCbbFs9nYs13PL/fUhZbo18v21?=
 =?us-ascii?Q?UOsPgIyoqjsfMxjTuMHaqqUK71dIvtYFu3pJ9PkHtGfS/fWiIQ2nHOEHMtj7?=
 =?us-ascii?Q?iX+3QLJ7qjSjVoKOz+EwNNAxSb7hMrZbqlL9YwLM3l9RzYKhgSOeCFInpTaZ?=
 =?us-ascii?Q?rlQFeeqAIEQb7Mvn9Gd4FROccWV0ZkAD0qCL+0L0i7+m+OwWAhmhSf/4o/JF?=
 =?us-ascii?Q?6s9PRHVdrd0V/JE2rzUMlAx43OtsgPuYvYLPdrxtneaUD+pYpw7i5ky1nt/C?=
 =?us-ascii?Q?zvHBr+aheDI46ADX2DFbO5n43QheUNdy8aAFkjHE0ybhJC7wYBpkO9KrOIFN?=
 =?us-ascii?Q?H1d0F3VYcOgWljJ398NuIdtLVGDcinoeLIgXl9N5TWR+DieMEPdj7OH3KrSA?=
 =?us-ascii?Q?48stMcSfw5kz3113mSYsOhz7DqJX1ivj8mjdiRL6jYnYVL+XlCwkG8AL5AVG?=
 =?us-ascii?Q?5FB8BbDFYqnhTAb/Rx/yp5IqeExRN773ppiMxwJn4YKIPyC1ryQQDX0xSe30?=
 =?us-ascii?Q?xsVjKwoFfrta64fGLlBUlQPWQAv+wRgp2llZUWtZy9R4W67LiOieElu8GYFO?=
 =?us-ascii?Q?MJfPjRRn6BdWCnzxbLYDnDVZLYhalraHcQ7OvQLpYHVqxcGGub7UfQXTAjAJ?=
 =?us-ascii?Q?daPuD5/ce18JLgx3leIxgDcI2MKLGK97dvVAZQTU96apg2nJ+rGGKyZQ5L+C?=
 =?us-ascii?Q?nYsuaCcPs+K0dr8uEUafJbRXet/+gRg+VCIS9BexqqCb7Pd9y1bVDG4EjZxT?=
 =?us-ascii?Q?mB9v/y8aN6B6QdugHTQ9KJEIynzpdHKK5h7e05kQPKiDz1jwAdsVGgwldml3?=
 =?us-ascii?Q?hBMkMtMlWiGINyLusD85hMIDAwEj+ZfzVr0EYSxze/J3aqRfIHJTArNuLWqg?=
 =?us-ascii?Q?A+OxknFn3C8s2FwiIflpDM+A8VldNyBgk9mEY945/0U/BBnQXZwlM9CVb6JL?=
 =?us-ascii?Q?jb1SNJnUngZRPTpFSglNhdjR4mFUzJ+s+7DR8cwxnRoQutFBRYd9kqVtmAcC?=
 =?us-ascii?Q?ODLDp1/Pq1WG7HjfvCBo/JNY1UUjLXOmkobcNn2pqJnbLYhjN9RCuGsL6RaE?=
 =?us-ascii?Q?96qsC8m8arL4/9xm2YtYGDKfvbQ3ZtDt29qpFWCXfx3IjO2CWLCabc6T4tnB?=
 =?us-ascii?Q?8td82JaxHul5NjICWC+2MM+i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad510bb0-b55d-4dfe-e794-08d9670b2b3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5296.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:26:31.9833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otsTosQT3TOBwwbjMAglgLzqXVDalEn2hS35cJ84sJAMqnc8YpSvSTUBdm3oiY3XvbJe4hSU3PslR+S+medCVg==
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

This allows using the normal sg_table APIs and makes all the code
cleaner. Remove sgt, nents and nmapd from ib_umem.

Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/infiniband/core/umem.c          | 32 +++++++++----------------
 drivers/infiniband/core/umem_dmabuf.c   |  5 ++--
 drivers/infiniband/hw/hns/hns_roce_db.c |  4 ++--
 drivers/infiniband/hw/irdma/verbs.c     |  2 +-
 drivers/infiniband/hw/mlx4/doorbell.c   |  3 ++-
 drivers/infiniband/hw/mlx4/mr.c         |  4 ++--
 drivers/infiniband/hw/mlx5/doorbell.c   |  3 ++-
 drivers/infiniband/hw/mlx5/mr.c         |  3 ++-
 drivers/infiniband/hw/qedr/verbs.c      |  2 +-
 drivers/infiniband/sw/rdmavt/mr.c       |  2 +-
 drivers/infiniband/sw/rxe/rxe_mr.c      |  2 +-
 include/rdma/ib_umem.h                  | 10 ++++----
 include/rdma/ib_verbs.h                 | 28 ++++++++++++++++++++++
 13 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index 42481e7a72e8..86d479772fbc 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -51,11 +51,11 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 	struct scatterlist *sg;
 	unsigned int i;
 
-	if (umem->nmap > 0)
-		ib_dma_unmap_sg(dev, umem->sg_head.sgl, umem->sg_nents,
-				DMA_BIDIRECTIONAL);
+	if (dirty)
+		ib_dma_unmap_sgtable_attrs(dev, &umem->sgt_append.sgt,
+					   DMA_BIDIRECTIONAL, 0);
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->sg_nents, i)
+	for_each_sgtable_sg(&umem->sgt_append.sgt, sg, i)
 		unpin_user_page_range_dirty_lock(sg_page(sg),
 			DIV_ROUND_UP(sg->length, PAGE_SIZE), make_dirty);
 
@@ -111,7 +111,7 @@ unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 	/* offset into first SGL */
 	pgoff = umem->address & ~PAGE_MASK;
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sgt_append.sgt, sg, i) {
 		/* Walk SGL and reduce max page size if VA/PA bits differ
 		 * for any address.
 		 */
@@ -121,7 +121,7 @@ unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
 		 * the maximum possible page size as the low bits of the iova
 		 * must be zero when starting the next chunk.
 		 */
-		if (i != (umem->nmap - 1))
+		if (i != (umem->sgt_append.sgt.nents - 1))
 			mask |= va;
 		pgoff = 0;
 	}
@@ -231,30 +231,19 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 			&umem->sgt_append, page_list, pinned, 0,
 			pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
 			npages, GFP_KERNEL);
-		umem->sg_nents = umem->sgt_append.sgt.nents;
 		if (ret) {
-			memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
-			       sizeof(umem->sgt_append.sgt));
 			unpin_user_pages_dirty_lock(page_list, pinned, 0);
 			goto umem_release;
 		}
 	}
 
-	memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
-	       sizeof(umem->sgt_append.sgt));
 	if (access & IB_ACCESS_RELAXED_ORDERING)
 		dma_attr |= DMA_ATTR_WEAK_ORDERING;
 
-	umem->nmap =
-		ib_dma_map_sg_attrs(device, umem->sg_head.sgl, umem->sg_nents,
-				    DMA_BIDIRECTIONAL, dma_attr);
-
-	if (!umem->nmap) {
-		ret = -ENOMEM;
+	ret = ib_dma_map_sgtable_attrs(device, &umem->sgt_append.sgt,
+				       DMA_BIDIRECTIONAL, dma_attr);
+	if (ret)
 		goto umem_release;
-	}
-
-	ret = 0;
 	goto out;
 
 umem_release:
@@ -314,7 +303,8 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
 		return -EINVAL;
 	}
 
-	ret = sg_pcopy_to_buffer(umem->sg_head.sgl, umem->sg_nents, dst, length,
+	ret = sg_pcopy_to_buffer(umem->sgt_append.sgt.sgl,
+				 umem->sgt_append.sgt.orig_nents, dst, length,
 				 offset + ib_umem_offset(umem));
 
 	if (ret < 0)
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index c6e875619fac..e824baf4640d 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -55,9 +55,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 		cur += sg_dma_len(sg);
 	}
 
-	umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
-	umem_dmabuf->umem.sg_head.nents = nmap;
-	umem_dmabuf->umem.nmap = nmap;
+	umem_dmabuf->umem.sgt_append.sgt.sgl = umem_dmabuf->first_sg;
+	umem_dmabuf->umem.sgt_append.sgt.nents = nmap;
 	umem_dmabuf->sgt = sgt;
 
 wait_fence:
diff --git a/drivers/infiniband/hw/hns/hns_roce_db.c b/drivers/infiniband/hw/hns/hns_roce_db.c
index d40ea3d87260..751470c7a2ce 100644
--- a/drivers/infiniband/hw/hns/hns_roce_db.c
+++ b/drivers/infiniband/hw/hns/hns_roce_db.c
@@ -42,8 +42,8 @@ int hns_roce_db_map_user(struct hns_roce_ucontext *context, unsigned long virt,
 
 found:
 	offset = virt - page_addr;
-	db->dma = sg_dma_address(page->umem->sg_head.sgl) + offset;
-	db->virt_addr = sg_virt(page->umem->sg_head.sgl) + offset;
+	db->dma = sg_dma_address(page->umem->sgt_append.sgt.sgl) + offset;
+	db->virt_addr = sg_virt(page->umem->sgt_append.sgt.sgl) + offset;
 	db->u.user_page = page;
 	refcount_inc(&page->refcount);
 
diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index 9b8c451e2426..e8089da1b770 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -2231,7 +2231,7 @@ static void irdma_copy_user_pgaddrs(struct irdma_mr *iwmr, u64 *pbl,
 	pinfo = (level == PBLE_LEVEL_1) ? NULL : palloc->level2.leaf;
 
 	if (iwmr->type == IRDMA_MEMREG_TYPE_QP)
-		iwpbl->qp_mr.sq_page = sg_page(region->sg_head.sgl);
+		iwpbl->qp_mr.sq_page = sg_page(region->sgt_append.sgt.sgl);
 
 	rdma_umem_for_each_dma_block(region, &biter, iwmr->page_size) {
 		*pbl = rdma_block_iter_dma_address(&biter);
diff --git a/drivers/infiniband/hw/mlx4/doorbell.c b/drivers/infiniband/hw/mlx4/doorbell.c
index d41f03ccb0e1..9bbd695a9fd5 100644
--- a/drivers/infiniband/hw/mlx4/doorbell.c
+++ b/drivers/infiniband/hw/mlx4/doorbell.c
@@ -75,7 +75,8 @@ int mlx4_ib_db_map_user(struct ib_udata *udata, unsigned long virt,
 	list_add(&page->list, &context->db_page_list);
 
 found:
-	db->dma = sg_dma_address(page->umem->sg_head.sgl) + (virt & ~PAGE_MASK);
+	db->dma = sg_dma_address(page->umem->sgt_append.sgt.sgl) +
+		  (virt & ~PAGE_MASK);
 	db->u.user_page = page;
 	++page->refcnt;
 
diff --git a/drivers/infiniband/hw/mlx4/mr.c b/drivers/infiniband/hw/mlx4/mr.c
index 50becc0e4b62..04a67b481608 100644
--- a/drivers/infiniband/hw/mlx4/mr.c
+++ b/drivers/infiniband/hw/mlx4/mr.c
@@ -200,7 +200,7 @@ int mlx4_ib_umem_write_mtt(struct mlx4_ib_dev *dev, struct mlx4_mtt *mtt,
 	mtt_shift = mtt->page_shift;
 	mtt_size = 1ULL << mtt_shift;
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sgt_append.sgt, sg, i) {
 		if (cur_start_addr + len == sg_dma_address(sg)) {
 			/* still the same block */
 			len += sg_dma_len(sg);
@@ -273,7 +273,7 @@ int mlx4_ib_umem_calc_optimal_mtt_size(struct ib_umem *umem, u64 start_va,
 
 	*num_of_mtts = ib_umem_num_dma_blocks(umem, PAGE_SIZE);
 
-	for_each_sg(umem->sg_head.sgl, sg, umem->nmap, i) {
+	for_each_sgtable_dma_sg(&umem->sgt_append.sgt, sg, i) {
 		/*
 		 * Initialization - save the first chunk start as the
 		 * current_block_start - block means contiguous pages.
diff --git a/drivers/infiniband/hw/mlx5/doorbell.c b/drivers/infiniband/hw/mlx5/doorbell.c
index 9ca2e61807ec..6398e2f48579 100644
--- a/drivers/infiniband/hw/mlx5/doorbell.c
+++ b/drivers/infiniband/hw/mlx5/doorbell.c
@@ -78,7 +78,8 @@ int mlx5_ib_db_map_user(struct mlx5_ib_ucontext *context, unsigned long virt,
 	list_add(&page->list, &context->db_page_list);
 
 found:
-	db->dma = sg_dma_address(page->umem->sg_head.sgl) + (virt & ~PAGE_MASK);
+	db->dma = sg_dma_address(page->umem->sgt_append.sgt.sgl) +
+		  (virt & ~PAGE_MASK);
 	db->u.user_page = page;
 	++page->refcnt;
 
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 3263851ea574..d1eb49dbca15 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1226,7 +1226,8 @@ int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 	orig_sg_length = sg.length;
 
 	cur_mtt = mtt;
-	rdma_for_each_block (mr->umem->sg_head.sgl, &biter, mr->umem->nmap,
+	rdma_for_each_block (mr->umem->sgt_append.sgt.sgl, &biter,
+			     mr->umem->sgt_append.sgt.nents,
 			     BIT(mr->page_shift)) {
 		if (cur_mtt == (void *)mtt + sg.length) {
 			dma_sync_single_for_device(ddev, sg.addr, sg.length,
diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
index 16d4c0228d76..fc081c5629ee 100644
--- a/drivers/infiniband/hw/qedr/verbs.c
+++ b/drivers/infiniband/hw/qedr/verbs.c
@@ -1481,7 +1481,7 @@ static int qedr_init_srq_user_params(struct ib_udata *udata,
 		return PTR_ERR(srq->prod_umem);
 	}
 
-	sg = srq->prod_umem->sg_head.sgl;
+	sg = srq->prod_umem->sgt_append.sgt.sgl;
 	srq->hw_srq.phy_prod_pair_addr = sg_dma_address(sg);
 
 	return 0;
diff --git a/drivers/infiniband/sw/rdmavt/mr.c b/drivers/infiniband/sw/rdmavt/mr.c
index 34b7af6ab9c2..dfb99a56d952 100644
--- a/drivers/infiniband/sw/rdmavt/mr.c
+++ b/drivers/infiniband/sw/rdmavt/mr.c
@@ -410,7 +410,7 @@ struct ib_mr *rvt_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 	mr->mr.page_shift = PAGE_SHIFT;
 	m = 0;
 	n = 0;
-	for_each_sg_page (umem->sg_head.sgl, &sg_iter, umem->nmap, 0) {
+	for_each_sgtable_page (&umem->sgt_append.sgt, &sg_iter, 0) {
 		void *vaddr;
 
 		vaddr = page_address(sg_page_iter_page(&sg_iter));
diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
index 1ee5bd8291e5..16de1bc6db6e 100644
--- a/drivers/infiniband/sw/rxe/rxe_mr.c
+++ b/drivers/infiniband/sw/rxe/rxe_mr.c
@@ -141,7 +141,7 @@ int rxe_mr_init_user(struct rxe_pd *pd, u64 start, u64 length, u64 iova,
 	if (length > 0) {
 		buf = map[0]->buf;
 
-		for_each_sg_page(umem->sg_head.sgl, &sg_iter, umem->nmap, 0) {
+		for_each_sgtable_page (&umem->sgt_append.sgt, &sg_iter, 0) {
 			if (num_buf >= RXE_BUF_PER_MAP) {
 				map++;
 				buf = map[0]->buf;
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 33cb23b2ee3c..62f8e0604207 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -27,9 +27,6 @@ struct ib_umem {
 	u32 is_dmabuf : 1;
 	struct work_struct	work;
 	struct sg_append_table  sgt_append;
-	struct sg_table sg_head;
-	int             nmap;
-	unsigned int    sg_nents;
 };
 
 struct ib_umem_dmabuf {
@@ -57,7 +54,7 @@ static inline int ib_umem_offset(struct ib_umem *umem)
 static inline unsigned long ib_umem_dma_offset(struct ib_umem *umem,
 					       unsigned long pgsz)
 {
-	return (sg_dma_address(umem->sg_head.sgl) + ib_umem_offset(umem)) &
+	return (sg_dma_address(umem->sgt_append.sgt.sgl) + ib_umem_offset(umem)) &
 	       (pgsz - 1);
 }
 
@@ -78,7 +75,8 @@ static inline void __rdma_umem_block_iter_start(struct ib_block_iter *biter,
 						struct ib_umem *umem,
 						unsigned long pgsz)
 {
-	__rdma_block_iter_start(biter, umem->sg_head.sgl, umem->nmap, pgsz);
+	__rdma_block_iter_start(biter, umem->sgt_append.sgt.sgl,
+				umem->sgt_append.sgt.nents, pgsz);
 }
 
 /**
@@ -129,7 +127,7 @@ static inline unsigned long ib_umem_find_best_pgoff(struct ib_umem *umem,
 						    unsigned long pgsz_bitmap,
 						    u64 pgoff_bitmask)
 {
-	struct scatterlist *sg = umem->sg_head.sgl;
+	struct scatterlist *sg = umem->sgt_append.sgt.sgl;
 	dma_addr_t dma_addr;
 
 	dma_addr = sg_dma_address(sg) + (umem->address & ~PAGE_MASK);
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index aa7806335cba..4b50d9a3018a 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -4085,6 +4085,34 @@ static inline void ib_dma_unmap_sg_attrs(struct ib_device *dev,
 				   dma_attrs);
 }
 
+/**
+ * ib_dma_map_sgtable_attrs - Map a scatter/gather table to DMA addresses
+ * @dev: The device for which the DMA addresses are to be created
+ * @sg: The sg_table object describing the buffer
+ * @direction: The direction of the DMA
+ * @attrs: Optional DMA attributes for the map operation
+ */
+static inline int ib_dma_map_sgtable_attrs(struct ib_device *dev,
+					   struct sg_table *sgt,
+					   enum dma_data_direction direction,
+					   unsigned long dma_attrs)
+{
+	if (ib_uses_virt_dma(dev)) {
+		ib_dma_virt_map_sg(dev, sgt->sgl, sgt->orig_nents);
+		return 0;
+	}
+	return dma_map_sgtable(dev->dma_device, sgt, direction, dma_attrs);
+}
+
+static inline void ib_dma_unmap_sgtable_attrs(struct ib_device *dev,
+					      struct sg_table *sgt,
+					      enum dma_data_direction direction,
+					      unsigned long dma_attrs)
+{
+	if (!ib_uses_virt_dma(dev))
+		dma_unmap_sgtable(dev->dma_device, sgt, direction, dma_attrs);
+}
+
 /**
  * ib_dma_map_sg - Map a scatter/gather list to DMA addresses
  * @dev: The device for which the DMA addresses are to be created
-- 
2.25.4

