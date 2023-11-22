Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552D7F4847
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 14:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2AB10E63C;
	Wed, 22 Nov 2023 13:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3845C10E631
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 13:48:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMCm85S020119; Wed, 22 Nov 2023 13:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yFVlfEta1AlqEBCGjV2ZWmy6xgPox6Zrn9VgPiKWHp0=;
 b=J6jxerl9D191YkK9beDjbU0oV+wOBNAvLc7U1wBREdRkYSsRIfl6niTX3BOnW3DlDtBY
 21aL7mxsJpegtyPorKXZ9HEzaXLCOLYGIrzYFccbPOtyAg50lHx9zZnD2RJdlat5Yjiy
 TWrzT/tkFPbb76C8PqEkIovMYkEVNONLJ1cqFA+T5AUmc40m/ezK+LGuLLhAvDMRIveq
 QiLTrR0t35DcOP1hv/5C8ox5UZoI08BNJCXdzLKOaDr5OynwLRj3egtgxhze9/DjsQmV
 4LRo6kcrfjv8qGXP9jb3K6eJOvD97sZKFAeKAFAem7mO8odHwcH450zm7HZaKCvWD8Mj 5A== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhey58kv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 13:48:24 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMDmNHR014703
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 13:48:23 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 05:48:19 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
 <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <quic_guptap@quicinc.com>
Subject: [PATCH 2/2] dma-buf: heaps: secure_heap: Add qcom secure system heap
Date: Wed, 22 Nov 2023 19:17:47 +0530
Message-ID: <128a84b983d1ddd192e98a42bc6a15030bb60d75.1700544802.git.quic_vjitta@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1700544802.git.quic_vjitta@quicinc.com>
References: <cover.1700544802.git.quic_vjitta@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3oe11wEQMEXdPBVDvkEMLtHC49khnTZy
X-Proofpoint-GUID: 3oe11wEQMEXdPBVDvkEMLtHC49khnTZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=827
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220097
X-Mailman-Approved-At: Wed, 22 Nov 2023 13:52:55 +0000
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
Cc: Vijayanand Jitta <quic_vjitta@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vijayanand Jitta <quic_vjitta@quicinc.com>

Add secure system for Pixel and Non pixel video usecases, this
allocates from system heap and secures using qcom_scm_aasign_mem.

Change-Id: If0702f85bff651843c6a5c83694043364229e66b
Signed-off-by: Vijayanand Jitta <quic_vjitta@quicinc.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 163 +++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index 04e2ee000e19..cdcf4b3f5333 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -58,6 +58,11 @@ enum secure_memory_type {
 	 * protect it, then the detail memory management also is inside the TEE.
 	 */
 	SECURE_MEMORY_TYPE_MTK_CM_CMA	= 2,
+	/*
+	 * QCOM secure system heap, use system heap to alloc/free.
+	 * and use qcom_scm_assign_mem to secure the memory.
+	 */
+	SECURE_MEMORY_TYPE_QCOM_SYSTEM	= 3,
 };
 
 struct secure_buffer {
@@ -69,6 +74,7 @@ struct secure_buffer {
 	 */
 	u32				sec_handle;
 	struct page			*cma_page;
+	struct sg_table			sg_table;
 };
 
 #define TEE_MEM_COMMAND_ID_BASE_MTK	0x10000
@@ -329,11 +335,26 @@ static int secure_heap_qcom_secure_memory(struct secure_heap *sec_heap,
 	next[0].vmid = data->vmid;
 	next[0].perm = data->perm;
 
-
-	ret = qcom_scm_assign_mem(page_to_phys(sec_buf->cma_page),
+	if (sec_heap->mem_type == SECURE_MEMORY_TYPE_CMA) {
+		ret = qcom_scm_assign_mem(page_to_phys(sec_buf->cma_page),
 				sec_buf->size, &src_perms,
 				next, 1);
+	} else if (sec_heap->mem_type == SECURE_MEMORY_TYPE_QCOM_SYSTEM) {
+		struct sg_table *table;
+		struct scatterlist *sg;
+		int i = 0;
+
+		table = &sec_buf->sg_table;
+		for_each_sgtable_sg(table, sg, i) {
+			struct page *page = sg_page(sg);
 
+			ret = qcom_scm_assign_mem(page_to_phys(page),
+				page_size(page), &src_perms,
+				next, 1);
+			if (ret)
+				break;
+		}
+	}
 	return ret;
 }
 
@@ -347,9 +368,24 @@ static void secure_heap_qcom_unsecure_memory(struct secure_heap *sec_heap,
 	next[0].vmid = QCOM_SCM_VMID_HLOS;
 	next[0].perm = QCOM_SCM_PERM_RWX;
 
-	qcom_scm_assign_mem(page_to_phys(sec_buf->cma_page),
+	if (sec_heap->mem_type == SECURE_MEMORY_TYPE_CMA) {
+		qcom_scm_assign_mem(page_to_phys(sec_buf->cma_page),
 				sec_buf->size, &src_perms,
 				next, 1);
+	} else if (sec_heap->mem_type == SECURE_MEMORY_TYPE_QCOM_SYSTEM) {
+		struct sg_table *table;
+		struct scatterlist *sg;
+		int i = 0;
+
+		table = &sec_buf->sg_table;
+		for_each_sgtable_sg(table, sg, i) {
+			struct page *page = sg_page(sg);
+
+			qcom_scm_assign_mem(page_to_phys(page),
+				page_size(page), &src_perms,
+				next, 1);
+		}
+	}
 }
 
 const struct secure_heap_prv_data qcom_cma_sec_mem_data = {
@@ -361,6 +397,117 @@ const struct secure_heap_prv_data qcom_cma_sec_mem_data = {
 	.unsecure_the_memory    = secure_heap_qcom_unsecure_memory,
 };
 
+/* Using system heap allocator */
+#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
+#define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
+				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
+				| __GFP_COMP)
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
+static const unsigned int orders[] = {8, 4, 0};
+#define NUM_ORDERS ARRAY_SIZE(orders)
+
+static struct page *alloc_largest_available(unsigned long size,
+					    unsigned int max_order)
+{
+	struct page *page;
+	int i;
+
+	for (i = 0; i < NUM_ORDERS; i++) {
+		if (size <  (PAGE_SIZE << orders[i]))
+			continue;
+		if (max_order < orders[i])
+			continue;
+
+		page = alloc_pages(order_flags[i], orders[i]);
+		if (!page)
+			continue;
+		return page;
+	}
+	return NULL;
+}
+
+static int qcom_system_secure_memory_allocate(struct secure_heap *sec_heap,
+				      struct secure_buffer *sec_buf)
+{
+	unsigned long size_remaining = sec_buf->size;
+	unsigned int max_order = orders[0];
+	struct sg_table *table;
+	struct scatterlist *sg;
+	struct list_head pages;
+	struct page *page, *tmp_page;
+	int i = 0, ret = -ENOMEM;
+
+	INIT_LIST_HEAD(&pages);
+	while (size_remaining > 0) {
+		/*
+		 * Avoid trying to allocate memory if the process
+		 * has been killed by SIGKILL
+		 */
+		if (fatal_signal_pending(current)) {
+			return -EINTR;
+		}
+
+		page = alloc_largest_available(size_remaining, max_order);
+		if (!page)
+			goto free;
+
+		list_add_tail(&page->lru, &pages);
+		size_remaining -= page_size(page);
+		max_order = compound_order(page);
+		i++;
+	}
+	table = &sec_buf->sg_table;
+	if (sg_alloc_table(table, i, GFP_KERNEL))
+		goto free;
+
+	sg = table->sgl;
+	list_for_each_entry_safe(page, tmp_page, &pages, lru) {
+		sg_set_page(sg, page, page_size(page), 0);
+		sg = sg_next(sg);
+		list_del(&page->lru);
+	}
+	return 0;
+free:
+	list_for_each_entry_safe(page, tmp_page, &pages, lru)
+		__free_pages(page, compound_order(page));
+
+	return ret;
+}
+
+static void qcom_system_secure_memory_free(struct secure_heap *sec_heap,
+				   struct secure_buffer *sec_buf)
+{
+	struct sg_table *table;
+	struct scatterlist *sg;
+	int i;
+
+	table = &sec_buf->sg_table;
+	for_each_sgtable_sg(table, sg, i) {
+		struct page *page = sg_page(sg);
+
+		__free_pages(page, compound_order(page));
+	}
+	sg_free_table(table);
+}
+
+const struct secure_heap_prv_data qcom_system_pixel_sec_mem_data = {
+	.vmid           = QCOM_SCM_VMID_CP_PIXEL,
+	.perm		= QCOM_SCM_PERM_RW,
+	.memory_alloc	= qcom_system_secure_memory_allocate,
+	.memory_free	= qcom_system_secure_memory_free,
+	.secure_the_memory	= secure_heap_qcom_secure_memory,
+	.unsecure_the_memory	= secure_heap_qcom_unsecure_memory,
+};
+
+const struct secure_heap_prv_data qcom_system_non_pixel_sec_mem_data = {
+	.vmid           = QCOM_SCM_VMID_CP_NON_PIXEL,
+	.perm		= QCOM_SCM_PERM_RW,
+	.memory_alloc	= qcom_system_secure_memory_allocate,
+	.memory_free	= qcom_system_secure_memory_free,
+	.secure_the_memory	= secure_heap_qcom_secure_memory,
+	.unsecure_the_memory	= secure_heap_qcom_unsecure_memory,
+};
+
 static int secure_heap_secure_memory_allocate(struct secure_heap *sec_heap,
 					      struct secure_buffer *sec_buf)
 {
@@ -585,6 +732,16 @@ static struct secure_heap secure_heaps[] = {
 		.mem_type	= SECURE_MEMORY_TYPE_MTK_CM_CMA,
 		.data		= &mtk_sec_mem_data_cma,
 	},
+	{
+		.name		= "secure_system_pixel",
+		.mem_type	= SECURE_MEMORY_TYPE_QCOM_SYSTEM,
+		.data		= &qcom_system_pixel_sec_mem_data,
+	},
+	{
+		.name		= "secure_system_non_pixel",
+		.mem_type	= SECURE_MEMORY_TYPE_QCOM_SYSTEM,
+		.data		= &qcom_system_non_pixel_sec_mem_data,
+	},
 };
 
 static int __init secure_cma_init(struct reserved_mem *rmem)
-- 
2.34.1

