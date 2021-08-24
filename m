Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CF83F60B9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 16:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A9E89709;
	Tue, 24 Aug 2021 14:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 894 seconds by postgrey-1.36 at gabe;
 Tue, 24 Aug 2021 14:41:28 UTC
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109A689709;
 Tue, 24 Aug 2021 14:41:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGJ4N+MJt4GD/zOQc1BjNqFvIxa0WfMbp53eAy1+qc4OxIM2xj93+pz0HXYQ+pcY8cH9gXr586ozFpQ8UN7sXaXS65fB6fQzyIebl0P10BGGMTRLpxTS81RWlEES1GeuF2ik1MU3xpY0BmCgT38/YVQ8UkvDMYKtWnzkUkZEXySgC6ehcZ13kBnff5NlUGoUTzTKtNf1pKfPXQCiN6KgqSHmfbb0vrRM+Dh/bFM0oQ/G6QY3CnQn1RJgfZ09DpFccI1Az16yfSGMpow8e4iyXRB49G/LQc+JiJWtuhVfeurmBw80F5dw1EMPC6gowenaJmokW2bc1T/7eAMNeFk38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRzyBcl0pw21zrHaH8kPwZ3c36vNspkw60ZUH4XSHtY=;
 b=PSm6lqMDgXJbD6PW3P4WARTwhNU9ZUs2QeD/ZWkrhveiu2gEPO8loa6i+yaJRjs0hyjfgMER38o00FV+7yy1/TScY/sOQYQTuYs8MKkVg2tPzD91VJ3Bs4CE2m+QiT8IV4wtVd72sQ/YmyBWvlciGIAqckQMfcvRVV1DmOt6bvtTX45/dNs448NTcOvWtJBYQQAGeu6VEQ6plPGwx+CmdPo58fnwSn//siwiZlt4Tb4ls1hRrBkoX9ibuxurNdOnGLAlVKYu4s5Vj817c4tgUP9oqkbRJieDQsSKobaNC+HJ8ZZZTFdWpv4vO0fz15D6oh+qnuipRtwHx/DKRxfedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRzyBcl0pw21zrHaH8kPwZ3c36vNspkw60ZUH4XSHtY=;
 b=shD+3R82AwOQxBBo8CENovdEufqveZ+DF+BcHId47BBzNW3CqKcv1v68dzT9RE5HYpvEs55xRlNnNpxPR8eRPc4QLGURJopVMXZlOlOmxIo+f97xenxgBldNvU1QuT6T9Cgym7Tjs9hO6knr5oWycpCV4bagZJ4pnIQzXME7cYHds4ZgHCjeSQ7uXtddD55XK1LgWEvSa/Of74zfO72P5x/B12IqbAlGHkmHk8xvx+x/vzzBu+OANoaF2ArYobC4SgQDpVgGV3Fku3PPgMMWR7vf+PgZGf3sjg9fGKnl7oYE+qVYTcT45v30IUKpoBeMnGfikDStBIV8HCnIdDWPfA==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 14:26:26 +0000
Received: from DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5]) by DM4PR12MB5296.namprd12.prod.outlook.com
 ([fe80::c064:2c9a:c2e2:29d5%9]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:26:26 +0000
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
Subject: [PATCH rdma-next v4 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
Date: Tue, 24 Aug 2021 17:25:30 +0300
Message-Id: <20210824142531.3877007-3-maorg@nvidia.com>
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
 Transport; Tue, 24 Aug 2021 14:26:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16489529-2078-4411-3029-08d9670b2793
X-MS-TrafficTypeDiagnostic: DM8PR12MB5400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB54001BBD785B31CAEE7700E7DEC59@DM8PR12MB5400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:274;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8TwUINLsnQS6NqhDQOIJGtrVsy+eBaq5U8hiAggLKd+dyDYK9L83JM0CdcjX4ZXKGR5s+xsjsU10JNiBiSYfqHkuFS/j+9k7kPp5ymHFb2+oVJxl2xKT79eRkJuNX3N8XUEa166qkKasXjus4Ppgs5B4WiFwG6ZjVQSVdrN9brumy0r3QlkvubdqAJC8xHvJHaOKclM5lCOpc8UYsf5Aq/A0QAILWE42ep5tpAOSRxxgs5DB/ciYRfR51tunKp2kFYKbYWT045Gq/dZlOLV8wOaJmWG03S0Y8p5u7RES7QhjgxMcHXSgO5jRlt3NqLY9U4XSlTTXFC4ew0CY2b3t1SXUNf/6Nhg9NMxTd/eaQgRw/SrTjE0SZLp90A/FUvkzk0D9O5C2hgBw2j7bwk9lax9LZYs93LVHozkChhPK0NnwFofrCOennPxDpGVyWkckxokwpn012UNF8wAn+WmBFsM1bDOlhJ/p+/mkYp/+G71KCs6n4NWQrodjWCjBmvZPkf27R1+JsP/Wg276eOW6Bn8E+7FlM3jYmOD5/JUpQ0ZEq7rV3kZobcLuwRZGyxrj+04KRiNppT6j/VXqDyZdQ82Rf4bu1BG+W5TLUmwWEbkXshtvJqmaq7fuPI6ZA7Vnw25tho5m20aQzuhN5F6vVLWCutaOCBQgqhqMb752uYn3tC5TSGabn0XS/x7KYK5/vaowk7ieBouIvVTFPQm6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5296.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(7416002)(1076003)(83380400001)(8936002)(316002)(956004)(2906002)(36756003)(6486002)(6666004)(26005)(2616005)(15650500001)(38100700002)(6636002)(30864003)(4326008)(66946007)(6506007)(508600001)(186003)(5660300002)(86362001)(52116002)(6512007)(66476007)(38350700002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wvyyO/lv9jI+cxHQZdeYQOzcS3Rj3LmoXjjkqU5Y0w7LIwW4ihIi/+M5PAqy?=
 =?us-ascii?Q?CBTIW9bpmlGy65m8Shg8/UfHfQ6VLn45QLFYXf9ZaD2Lb8sN3WOoIAISqIDc?=
 =?us-ascii?Q?OCkLa1eYiNl2y2NYqkyCe8b3+lp5nuRDEeIlPQeVxNJkbixjfWShCqSqO/Xi?=
 =?us-ascii?Q?85raKrr/XKNOlD7C7/QS5QjSDvRD0SzFrTvHI95O7PwKMGQPiiQLbSA2eTfC?=
 =?us-ascii?Q?R7Pcj5XFKwz1TiZYgTewXPLJPMjOqH4ujaLtigco/x43njiRoz7VKJO+wDwD?=
 =?us-ascii?Q?ek4wtuP9338fIoYZQMlF7jWPRueShl/DNxK6pICj57d3/CP5g6lpJDpTaInC?=
 =?us-ascii?Q?GhwoXL1dkmpqpU4+a4BsvX87V/p+2VKkLWD/t8DE3VTzVtuhaoTfZTn8VIGX?=
 =?us-ascii?Q?MQTXx2IZmXE+kooylTdjdvuHPjr3QcvsWa1Rz0dEmN71zgAKhGE5TnwJZPJO?=
 =?us-ascii?Q?Fx5rLR8baP8JT2md9pK/kAZKVMs5hpvfVZZ9lgqfh6GV3/Fju0Iag8KOQS6d?=
 =?us-ascii?Q?W6LBH3PCvzfFKofdB0cjU7Bwcs3IVy5+kSlc0hLwv+MNkRJaQEYivftkXYyr?=
 =?us-ascii?Q?KR1QWNMDG7b4d+MQ5uXMaNsoYkxUzXa1/1KzToGsDdg07tSPusDPZcgOGbfZ?=
 =?us-ascii?Q?+rA3FB+4GuTpdhLCbXtHS5QhwcIkrxBmXMdqITg/CT23Tes/4aQxAJuv7dGM?=
 =?us-ascii?Q?1R6wx0GA4WpE3psVCWcDL9YBmbIUqzmUD/j0ScSJSmsFJeTpop/FTspAaDLo?=
 =?us-ascii?Q?yz0pddc1aaj95q27r9Lhr8q5f6xaav4z2fZp1HzysvW55EMIcApzltuof7+g?=
 =?us-ascii?Q?THQ2T3DNbRZ0HmAGdxB9XXpPCdGa+IcZc/3oppTcph61s74364F2LSPfE2wb?=
 =?us-ascii?Q?N2LL/C+DVa7XkqPdyhXgAQoa18GAqKeXcZhQN0rApiSYjXqRpVUFBwgz5q3j?=
 =?us-ascii?Q?+reMa7H28pqq4qPjiuR2ARi6zy9I6CNdp8tk7C7dCdDUBGQmU+t24MwyhHV3?=
 =?us-ascii?Q?andMlX+PHYxzCT5is9y/oGstG5W5RnxGs6S8irYNqZoOyIEn046l8bOCu/Xy?=
 =?us-ascii?Q?gI2jIudzqbrV4cE+sw/w5F6qCb+rcjg7eqjsmdv5+/PJYe9aK1CqdpI+fDiv?=
 =?us-ascii?Q?D8V9lXEJYZpXBmzbVie2LBHGid5qwrUGmxMHiFLg6DhfwF4XW9aacGtocwAd?=
 =?us-ascii?Q?8S5YUILbEg0CnPT7p3XNq6yU5Tb3i0EeiCF1E4L1k3E+HbrPhZhY1v276a2d?=
 =?us-ascii?Q?7IXgfLLih7cphXbJNW6Ern1T2FdqNT9Q45LO8EgvBw1bXoah+PpmhBA76PD7?=
 =?us-ascii?Q?MPNPc9dgPbD3PCxBZAWds1Di?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16489529-2078-4411-3029-08d9670b2793
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5296.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:26:25.8284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mp8HSchVQ8leRzslVPb8yLjcZnkAJX6CEOclSrNxKnVu48yBz3R0lx3TGx8qgIR+Z2CtTyWRUisa093CIhiqvQ==
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

orig_nents should represent the number of entries with pages,
but __sg_alloc_table_from_pages sets orig_nents as the number of
total entries in the table. This is wrong when the API is used for
dynamic allocation where not all the table entries are mapped with
pages. It wasn't observed until now, since RDMA umem who uses this
API in the dynamic form doesn't use orig_nents implicit or explicit
by the scatterlist APIs.

Fix it by changing the append API to track the SG append table
state and have an API to free the append table according to the
total number of entries in the table.
Now all APIs set orig_nents as number of enries with pages.

Fixes: 07da1223ec93 ("lib/scatterlist: Add support in dynamic allocation of SG table from pages")
Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/core/umem.c   |  34 +++++----
 include/linux/scatterlist.h      |  19 +++--
 include/rdma/ib_umem.h           |   1 +
 lib/scatterlist.c                | 127 +++++++++++++++++++------------
 lib/sg_pool.c                    |   3 +-
 tools/testing/scatterlist/main.c |  45 ++++++-----
 6 files changed, 137 insertions(+), 92 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index b741758e528f..42481e7a72e8 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -59,7 +59,7 @@ static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int d
 		unpin_user_page_range_dirty_lock(sg_page(sg),
 			DIV_ROUND_UP(sg->length, PAGE_SIZE), make_dirty);
 
-	sg_free_table(&umem->sg_head);
+	sg_free_append_table(&umem->sgt_append);
 }
 
 /**
@@ -155,8 +155,7 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 	unsigned long dma_attr = 0;
 	struct mm_struct *mm;
 	unsigned long npages;
-	int ret;
-	struct scatterlist *sg = NULL;
+	int pinned, ret;
 	unsigned int gup_flags = FOLL_WRITE;
 
 	/*
@@ -216,28 +215,33 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 
 	while (npages) {
 		cond_resched();
-		ret = pin_user_pages_fast(cur_base,
+		pinned = pin_user_pages_fast(cur_base,
 					  min_t(unsigned long, npages,
 						PAGE_SIZE /
 						sizeof(struct page *)),
 					  gup_flags | FOLL_LONGTERM, page_list);
-		if (ret < 0)
+		if (pinned < 0) {
+			ret = pinned;
 			goto umem_release;
+		}
 
-		cur_base += ret * PAGE_SIZE;
-		npages -= ret;
-		sg = sg_alloc_append_table_from_pages(&umem->sg_head, page_list,
-				ret, 0, ret << PAGE_SHIFT,
-				ib_dma_max_seg_size(device), sg, npages,
-				GFP_KERNEL);
-		umem->sg_nents = umem->sg_head.nents;
-		if (IS_ERR(sg)) {
-			unpin_user_pages_dirty_lock(page_list, ret, 0);
-			ret = PTR_ERR(sg);
+		cur_base += pinned * PAGE_SIZE;
+		npages -= pinned;
+		ret = sg_alloc_append_table_from_pages(
+			&umem->sgt_append, page_list, pinned, 0,
+			pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
+			npages, GFP_KERNEL);
+		umem->sg_nents = umem->sgt_append.sgt.nents;
+		if (ret) {
+			memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
+			       sizeof(umem->sgt_append.sgt));
+			unpin_user_pages_dirty_lock(page_list, pinned, 0);
 			goto umem_release;
 		}
 	}
 
+	memcpy(&umem->sg_head.sgl, &umem->sgt_append.sgt,
+	       sizeof(umem->sgt_append.sgt));
 	if (access & IB_ACCESS_RELAXED_ORDERING)
 		dma_attr |= DMA_ATTR_WEAK_ORDERING;
 
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 5c700f2a0d18..266754a55327 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -39,6 +39,12 @@ struct sg_table {
 	unsigned int orig_nents;	/* original size of list */
 };
 
+struct sg_append_table {
+	struct sg_table sgt;		/* The scatter list table */
+	struct scatterlist *prv;	/* last populated sge in the table */
+	unsigned int total_nents;	/* Total entries in the table */
+};
+
 /*
  * Notes on SG table design.
  *
@@ -280,16 +286,17 @@ typedef struct scatterlist *(sg_alloc_fn)(unsigned int, gfp_t);
 typedef void (sg_free_fn)(struct scatterlist *, unsigned int);
 
 void __sg_free_table(struct sg_table *, unsigned int, unsigned int,
-		     sg_free_fn *);
+		     sg_free_fn *, unsigned int);
 void sg_free_table(struct sg_table *);
+void sg_free_append_table(struct sg_append_table *sgt);
 int __sg_alloc_table(struct sg_table *, unsigned int, unsigned int,
 		     struct scatterlist *, unsigned int, gfp_t, sg_alloc_fn *);
 int sg_alloc_table(struct sg_table *, unsigned int, gfp_t);
-struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
-		struct page **pages, unsigned int n_pages, unsigned int offset,
-		unsigned long size, unsigned int max_segment,
-		struct scatterlist *prv, unsigned int left_pages,
-		gfp_t gfp_mask);
+int sg_alloc_append_table_from_pages(struct sg_append_table *sgt,
+				     struct page **pages, unsigned int n_pages,
+				     unsigned int offset, unsigned long size,
+				     unsigned int max_segment,
+				     unsigned int left_pages, gfp_t gfp_mask);
 int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 				      unsigned int n_pages, unsigned int offset,
 				      unsigned long size,
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 676c57f5ca80..33cb23b2ee3c 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -26,6 +26,7 @@ struct ib_umem {
 	u32 is_odp : 1;
 	u32 is_dmabuf : 1;
 	struct work_struct	work;
+	struct sg_append_table  sgt_append;
 	struct sg_table sg_head;
 	int             nmap;
 	unsigned int    sg_nents;
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 611c63d4a958..b587f90cca28 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -182,6 +182,7 @@ static void sg_kfree(struct scatterlist *sg, unsigned int nents)
  * @nents_first_chunk: Number of entries int the (preallocated) first
  * 	scatterlist chunk, 0 means no such preallocated first chunk
  * @free_fn:	Free function
+ * @num_ents:	Number of entries in the table
  *
  *  Description:
  *    Free an sg table previously allocated and setup with
@@ -190,7 +191,8 @@ static void sg_kfree(struct scatterlist *sg, unsigned int nents)
  *
  **/
 void __sg_free_table(struct sg_table *table, unsigned int max_ents,
-		     unsigned int nents_first_chunk, sg_free_fn *free_fn)
+		     unsigned int nents_first_chunk, sg_free_fn *free_fn,
+		     unsigned int num_ents)
 {
 	struct scatterlist *sgl, *next;
 	unsigned curr_max_ents = nents_first_chunk ?: max_ents;
@@ -199,8 +201,8 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 		return;
 
 	sgl = table->sgl;
-	while (table->orig_nents) {
-		unsigned int alloc_size = table->orig_nents;
+	while (num_ents) {
+		unsigned int alloc_size = num_ents;
 		unsigned int sg_size;
 
 		/*
@@ -218,7 +220,7 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 			next = NULL;
 		}
 
-		table->orig_nents -= sg_size;
+		num_ents -= sg_size;
 		if (nents_first_chunk)
 			nents_first_chunk = 0;
 		else
@@ -231,6 +233,19 @@ void __sg_free_table(struct sg_table *table, unsigned int max_ents,
 }
 EXPORT_SYMBOL(__sg_free_table);
 
+/**
+ * sg_free_append_table - Free a previously allocated append sg table.
+ * @table:	 The mapped sg append table header
+ *
+ **/
+void sg_free_append_table(struct sg_append_table *table)
+{
+	__sg_free_table(&table->sgt, SG_MAX_SINGLE_ALLOC, false, sg_kfree,
+			table->total_nents);
+}
+EXPORT_SYMBOL(sg_free_append_table);
+
+
 /**
  * sg_free_table - Free a previously allocated sg table
  * @table:	The mapped sg table header
@@ -238,7 +253,8 @@ EXPORT_SYMBOL(__sg_free_table);
  **/
 void sg_free_table(struct sg_table *table)
 {
-	__sg_free_table(table, SG_MAX_SINGLE_ALLOC, false, sg_kfree);
+	__sg_free_table(table, SG_MAX_SINGLE_ALLOC, false, sg_kfree,
+			table->orig_nents);
 }
 EXPORT_SYMBOL(sg_free_table);
 
@@ -359,13 +375,14 @@ int sg_alloc_table(struct sg_table *table, unsigned int nents, gfp_t gfp_mask)
 	ret = __sg_alloc_table(table, nents, SG_MAX_SINGLE_ALLOC,
 			       NULL, 0, gfp_mask, sg_kmalloc);
 	if (unlikely(ret))
-		__sg_free_table(table, SG_MAX_SINGLE_ALLOC, 0, sg_kfree);
+		__sg_free_table(table, SG_MAX_SINGLE_ALLOC, 0, sg_kfree,
+				table->orig_nents);
 
 	return ret;
 }
 EXPORT_SYMBOL(sg_alloc_table);
 
-static struct scatterlist *get_next_sg(struct sg_table *table,
+static struct scatterlist *get_next_sg(struct sg_append_table *table,
 				       struct scatterlist *cur,
 				       unsigned long needed_sges,
 				       gfp_t gfp_mask)
@@ -386,54 +403,52 @@ static struct scatterlist *get_next_sg(struct sg_table *table,
 		return ERR_PTR(-ENOMEM);
 	sg_init_table(new_sg, alloc_size);
 	if (cur) {
+		table->total_nents += alloc_size - 1;
 		__sg_chain(next_sg, new_sg);
-		table->orig_nents += alloc_size - 1;
 	} else {
-		table->sgl = new_sg;
-		table->orig_nents = alloc_size;
-		table->nents = 0;
+		table->sgt.sgl = new_sg;
+		table->total_nents = alloc_size;
 	}
 	return new_sg;
 }
 
 /**
- * sg_alloc_append_table_from_pages - Allocate and initialize an sg table from
- *			         an array of pages
- * @sgt:	 The sg table header to use
- * @pages:	 Pointer to an array of page pointers
- * @n_pages:	 Number of pages in the pages array
+ * sg_alloc_append_table_from_pages - Allocate and initialize an append sg
+ *                                    table from an array of pages
+ * @sgt_append:  The sg append table to use
+ * @pages:       Pointer to an array of page pointers
+ * @n_pages:     Number of pages in the pages array
  * @offset:      Offset from start of the first page to the start of a buffer
  * @size:        Number of valid bytes in the buffer (after offset)
  * @max_segment: Maximum size of a scatterlist element in bytes
- * @prv:	 Last populated sge in sgt
  * @left_pages:  Left pages caller have to set after this call
  * @gfp_mask:	 GFP allocation mask
  *
  * Description:
- *    If @prv is NULL, allocate and initialize an sg table from a list of pages,
- *    else reuse the scatterlist passed in at @prv.
- *    Contiguous ranges of the pages are squashed into a single scatterlist
- *    entry up to the maximum size specified in @max_segment.  A user may
- *    provide an offset at a start and a size of valid data in a buffer
- *    specified by the page array.
+ *    In the first call it allocate and initialize an sg table from a list of
+ *    pages, else reuse the scatterlist from sgt_append. Contiguous ranges of
+ *    the pages are squashed into a single scatterlist entry up to the maximum
+ *    size specified in @max_segment.  A user may provide an offset at a start
+ *    and a size of valid data in a buffer specified by the page array. The
+ *    returned sg table is released by sg_free_append_table
  *
  * Returns:
- *   Last SGE in sgt on success, PTR_ERR on otherwise.
- *   The allocation in @sgt must be released by sg_free_table.
+ *   0 on success, negative error on failure
  *
  * Notes:
  *   If this function returns non-0 (eg failure), the caller must call
- *   sg_free_table() to cleanup any leftover allocations.
+ *   sg_free_append_table() to cleanup any leftover allocations.
+ *
+ *   In the fist call, sgt_append must by initialized.
  */
-struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
+int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 		struct page **pages, unsigned int n_pages, unsigned int offset,
 		unsigned long size, unsigned int max_segment,
-		struct scatterlist *prv, unsigned int left_pages,
-		gfp_t gfp_mask)
+		unsigned int left_pages, gfp_t gfp_mask)
 {
 	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
 	unsigned int added_nents = 0;
-	struct scatterlist *s = prv;
+	struct scatterlist *s = sgt_append->prv;
 
 	/*
 	 * The algorithm below requires max_segment to be aligned to PAGE_SIZE
@@ -441,25 +456,26 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 	 */
 	max_segment = ALIGN_DOWN(max_segment, PAGE_SIZE);
 	if (WARN_ON(max_segment < PAGE_SIZE))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
-	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
-		return ERR_PTR(-EOPNOTSUPP);
+	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && sgt_append->prv)
+		return -EOPNOTSUPP;
 
-	if (prv) {
-		unsigned long paddr = (page_to_pfn(sg_page(prv)) * PAGE_SIZE +
-				       prv->offset + prv->length) /
-				      PAGE_SIZE;
+	if (sgt_append->prv) {
+		unsigned long paddr =
+			(page_to_pfn(sg_page(sgt_append->prv)) * PAGE_SIZE +
+			 sgt_append->prv->offset + sgt_append->prv->length) /
+			PAGE_SIZE;
 
 		if (WARN_ON(offset))
-			return ERR_PTR(-EINVAL);
+			return -EINVAL;
 
 		/* Merge contiguous pages into the last SG */
-		prv_len = prv->length;
+		prv_len = sgt_append->prv->length;
 		while (n_pages && page_to_pfn(pages[0]) == paddr) {
-			if (prv->length + PAGE_SIZE > max_segment)
+			if (sgt_append->prv->length + PAGE_SIZE > max_segment)
 				break;
-			prv->length += PAGE_SIZE;
+			sgt_append->prv->length += PAGE_SIZE;
 			paddr++;
 			pages++;
 			n_pages--;
@@ -496,15 +512,16 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		}
 
 		/* Pass how many chunks might be left */
-		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask);
+		s = get_next_sg(sgt_append, s, chunks - i + left_pages,
+				gfp_mask);
 		if (IS_ERR(s)) {
 			/*
 			 * Adjust entry length to be as before function was
 			 * called.
 			 */
-			if (prv)
-				prv->length = prv_len;
-			return s;
+			if (sgt_append->prv)
+				sgt_append->prv->length = prv_len;
+			return PTR_ERR(s);
 		}
 		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
 		sg_set_page(s, pages[cur_page],
@@ -514,11 +531,13 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
 		offset = 0;
 		cur_page = j;
 	}
-	sgt->nents += added_nents;
+	sgt_append->sgt.nents += added_nents;
+	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
+	sgt_append->prv = s;
 out:
 	if (!left_pages)
 		sg_mark_end(s);
-	return s;
+	return 0;
 }
 EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
 
@@ -550,8 +569,18 @@ int sg_alloc_table_from_pages_segment(struct sg_table *sgt, struct page **pages,
 				unsigned long size, unsigned int max_segment,
 				gfp_t gfp_mask)
 {
-	return PTR_ERR_OR_ZERO(sg_alloc_append_table_from_pages(sgt, pages,
-			n_pages, offset, size, max_segment, NULL, 0, gfp_mask));
+	struct sg_append_table append = {};
+	int err;
+
+	err = sg_alloc_append_table_from_pages(&append, pages, n_pages, offset,
+					       size, max_segment, 0, gfp_mask);
+	if (err) {
+		sg_free_append_table(&append);
+		return err;
+	}
+	memcpy(sgt, &append.sgt, sizeof(*sgt));
+	WARN_ON(append.total_nents != sgt->orig_nents);
+	return 0;
 }
 EXPORT_SYMBOL(sg_alloc_table_from_pages_segment);
 
diff --git a/lib/sg_pool.c b/lib/sg_pool.c
index db29e5c1f790..a0b1a52cd6f7 100644
--- a/lib/sg_pool.c
+++ b/lib/sg_pool.c
@@ -90,7 +90,8 @@ void sg_free_table_chained(struct sg_table *table,
 	if (nents_first_chunk == 1)
 		nents_first_chunk = 0;
 
-	__sg_free_table(table, SG_CHUNK_SIZE, nents_first_chunk, sg_pool_free);
+	__sg_free_table(table, SG_CHUNK_SIZE, nents_first_chunk, sg_pool_free,
+			table->orig_nents);
 }
 EXPORT_SYMBOL_GPL(sg_free_table_chained);
 
diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index c2ff9179c2cc..08465a701cd5 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -85,43 +85,46 @@ int main(void)
 
 	for (i = 0, test = tests; test->expected_segments; test++, i++) {
 		int left_pages = test->pfn_app ? test->num_pages : 0;
+		struct sg_append_table append = {};
 		struct page *pages[MAX_PAGES];
-		struct sg_table st;
-		struct scatterlist *sg = NULL;
 		int ret;
 
 		set_pages(pages, test->pfn, test->num_pages);
 
-		if (test->pfn_app) {
-			sg = sg_alloc_append_table_from_pages(
-				&st, pages, test->num_pages, 0, test->size,
-				test->max_seg, NULL, left_pages, GFP_KERNEL);
-			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
-		} else {
+		if (test->pfn_app)
+			ret = sg_alloc_append_table_from_pages(
+				&append, pages, test->num_pages, 0, test->size,
+				test->max_seg, left_pages, GFP_KERNEL);
+		else
 			ret = sg_alloc_table_from_pages_segment(
-				&st, pages, test->num_pages, 0, test->size,
-				test->max_seg, GFP_KERNEL);
-			assert(ret == test->alloc_ret);
-		}
+				&append.sgt, pages, test->num_pages, 0,
+				test->size, test->max_seg, GFP_KERNEL);
+
+		assert(ret == test->alloc_ret);
 
 		if (test->alloc_ret)
 			continue;
 
 		if (test->pfn_app) {
 			set_pages(pages, test->pfn_app, test->num_pages);
-			sg = sg_alloc_append_table_from_pages(
-				&st, pages, test->num_pages, 0, test->size,
-				test->max_seg, sg, 0, GFP_KERNEL);
+			ret = sg_alloc_append_table_from_pages(
+				&append, pages, test->num_pages, 0, test->size,
+				test->max_seg, 0, GFP_KERNEL);
 
-			assert(PTR_ERR_OR_ZERO(sg) == test->alloc_ret);
+			assert(ret == test->alloc_ret);
 		}
 
-		VALIDATE(st.nents == test->expected_segments, &st, test);
+		VALIDATE(append.sgt.nents == test->expected_segments,
+			 &append.sgt, test);
 		if (!test->pfn_app)
-			VALIDATE(st.orig_nents == test->expected_segments, &st,
-				 test);
-
-		sg_free_table(&st);
+			VALIDATE(append.sgt.orig_nents ==
+					 test->expected_segments,
+				 &append.sgt, test);
+
+		if (test->pfn_app)
+			sg_free_append_table(&append);
+		else
+			sg_free_table(&append.sgt);
 	}
 
 	assert(i == (sizeof(tests) / sizeof(tests[0])) - 1);
-- 
2.25.4

