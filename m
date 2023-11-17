Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1147EF2EB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 13:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A610E2F1;
	Fri, 17 Nov 2023 12:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CA410E737
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 10:04:10 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AH9Qdc8009283; Fri, 17 Nov 2023 10:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=DhkJnR22Jop4i2vHDhl5q1CKNIHtvIzQcFATKsxapzk=;
 b=XbbngjzR/GasnWiBpR6iA3hOUNgMPDZYP01zZ6vS0JkAVWksrAqw3xXIGCYnNks0QYZz
 usWp74Boqxfy+MrHgkhAYyE8a+0CJxq6aCMu0w8lFgn+h0gKmAdtoIZvgSqLzT23znia
 og2YDc6zZ7AZPaQL66Duwv3b54AGaTTrLTd6xiX3YNk/3GIq6dPPunP6+iQ79m+AoyKd
 +YGKOTLr01d3Fa1FZHAhTRWhvr7Qb7nkZQz1ldgd+jrk1Rooo3uXSml95x501W694pCO
 vBv9EcqexhzkWtdGQwoMrOs0BLAcgfny0GgMGCZjF2CO4oiKlX2NjumabqKBi9bXsMYa VQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue2na0g2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 10:03:57 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHA3uIm012999
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 10:03:56 GMT
Received: from hu-jasksing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 17 Nov 2023 02:03:51 -0800
From: Jaskaran Singh <quic_jasksing@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
 <christian.koenig@amd.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] dma-buf: heaps: Introduce cma_heap_add() for non-default
 CMA heap
Date: Fri, 17 Nov 2023 15:33:37 +0530
Message-ID: <20231117100337.5215-1-quic_jasksing@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5Mjj9yaE5YbLk6qMKCFvI8mWREOm329-
X-Proofpoint-ORIG-GUID: 5Mjj9yaE5YbLk6qMKCFvI8mWREOm329-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_07,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=627 phishscore=0 suspectscore=0 clxscore=1011 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311170074
X-Mailman-Approved-At: Fri, 17 Nov 2023 12:46:25 +0000
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
Cc: quic_vjitta@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Currently dma-buf heaps can handle only default CMA. This exposes
__add_cma_heap(), renamed to cma_heap_add(), as a public API to
initialize CMA heaps from a pointer to a CMA region.

At first, the driver calls of_reserved_mem_device_init() to set
memory-region property associated with reserved-memory defined as CMA
to the device. And when the driver calls this cma_heap_add() with the
struct cma attached to the device, the CMA will be added to dma-buf
heaps.

For example, prepare CMA node named "linux,cma@10000000" and
specify the node for memory-region property. After the above calls
in the driver, a device file "/dev/dma_heap/linux,cma@10000000"
associated with the CMA become available as dma-buf heaps.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
[quic_jasksing@quicinc.com: Use struct cma as the function argument]
Signed-off-by: Jaskaran Singh <quic_jasksing@quicinc.com>
---
Reviving this patch as per discussions on the MediaTek Secure Heap patch
series[1]. There is now a potential client of the cma_heap_add() API.

An unaddressed problem in this patch is the proper parsing of heap
names. Naming convention for fixed address heaps in the devicetree is of
the format "[heap name]@[fixed address]", for example
"audio-heap@88b00000". Exposing heaps this way to userspace could
prove erroneous as the usecases fulfilled by these heaps are the same
across individual SoCs. Userspace clients of these heaps might expect a
more consistent interface. Any feedback on this is appreciated.

Changes v1->v2:
- Change the function argument for dma_heap_add_cma() from struct
  device to struct cma as per the discussion on [1].
- In lieu of the above point, discard dma_heap_add_cma() and instead
  expose the existing __add_cma_heap() as cma_heap_add().
- Make minor modifications to the commit message based on the changes in
  this version. Retain most of the original commit message.

v1: https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/

[1] https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/T/#m5184a1e13767bb656a4a3d9bf5a1fd7450e42eb7

 drivers/dma-buf/heaps/cma_heap.c | 12 ++++++++++--
 include/linux/dma-heap.h         | 10 ++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index ee899f8e6721..b3bef8206e8b 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -367,7 +367,14 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __add_cma_heap(struct cma *cma, void *data)
+/**
+ * cma_heap_add - adds a CMA heap to dmabuf heaps
+ * @cma:       pointer to the CMA pool to register the heap for
+ * @data:      unused
+ *
+ * Returns 0 on success. Else, returns errno.
+ */
+int cma_heap_add(struct cma *cma, void *data)
 {
 	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
@@ -391,6 +398,7 @@ static int __add_cma_heap(struct cma *cma, void *data)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cma_heap_add);
 
 static int add_default_cma_heap(void)
 {
@@ -398,7 +406,7 @@ static int add_default_cma_heap(void)
 	int ret = 0;
 
 	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+		ret = cma_heap_add(default_cma, NULL);
 
 	return ret;
 }
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..adcd462825a8 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -12,6 +12,7 @@
 #include <linux/cdev.h>
 #include <linux/types.h>
 
+struct cma;
 struct dma_heap;
 
 /**
@@ -65,4 +66,13 @@ const char *dma_heap_get_name(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+#ifdef CONFIG_DMABUF_HEAPS_CMA
+int cma_heap_add(struct cma *cma, void *data);
+#else
+static inline int cma_heap_add(struct cma *cma, void *data)
+{
+	return -EINVAL;
+}
+#endif /* CONFIG_DMABUF_HEAPS_CMA */
+
 #endif /* _DMA_HEAPS_H */
-- 
2.17.1

