Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE298CE03
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 09:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8818610E6AC;
	Wed,  2 Oct 2024 07:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lKzmc3vD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A8510E037
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 17:51:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491ASPSL022446;
 Tue, 1 Oct 2024 17:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:message-id:mime-version:subject:to; s=
 qcppdkim1; bh=d7E+Uzt0KOEWf8xQBkavhpXYt5BDcl9CW7dj6fKabZM=; b=lK
 zmc3vDRa0uwzvCundBbXTZu28HQatdSQoUiNJkRhysX7++kfePEct+sHz7du7IrR
 8RpBk3A/QtfsOmzoUJfhnSB/3qi/bShWbRV4M4qsI6ygzckRtiyHyPIhM7Rm+JMb
 /YbD6ARJAVA2lUTWpJKKBYcaDjjYaJnPBVzYK2IWiCZr4bgCFlqgfQl0RwzprYFx
 AQ6kYVWjTRlrJVhqcENyT7uDWIsFLhnhWQcEjJVjmCnSdLe90HKvfK/KQySw6Btg
 tBF6H0d6ZcT0s1bNVQPpv1xbaaRB0xeGHjqaHJjYSXBLAQrAk7CSNYGcdEDpUEGC
 ol52PgKAZjj9D1Nes1Dg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa6797ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2024 17:51:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491HpLnP026569
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 1 Oct 2024 17:51:21 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 1 Oct 2024 10:51:16 -0700
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
 <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>
CC: <joe@perches.com>, <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
 Pintu Kumar <quic_pintu@quicinc.com>
Subject: [PATCH 2/3] dma-buf/heaps: replace kmap_atomic with kmap_local_page
Date: Tue, 1 Oct 2024 23:20:57 +0530
Message-ID: <20241001175057.27172-1-quic_pintu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2Zqzfc03is92PVLNMTY_zqlxZYnE3d7t
X-Proofpoint-ORIG-GUID: 2Zqzfc03is92PVLNMTY_zqlxZYnE3d7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=807 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010114
X-Mailman-Approved-At: Wed, 02 Oct 2024 07:47:18 +0000
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

Use of kmap_atomic/kunmap_atomic is deprecated, use
kmap_local_page/kunmap_local instead.

This is reported by checkpatch.
Also fix repeated word issue.

WARNING: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' instead
+                       void *vaddr = kmap_atomic(page);

WARNING: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' instead
+                       kunmap_atomic(vaddr);

WARNING: Possible repeated word: 'by'
+                        * has been killed by by SIGKILL

total: 0 errors, 3 warnings, 405 lines checked

Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 93be88b805fe..8c55431cc16c 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -309,13 +309,13 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 		struct page *page = cma_pages;
 
 		while (nr_clear_pages > 0) {
-			void *vaddr = kmap_atomic(page);
+			void *vaddr = kmap_local_page(page);
 
 			memset(vaddr, 0, PAGE_SIZE);
-			kunmap_atomic(vaddr);
+			kunmap_local(vaddr);
 			/*
 			 * Avoid wasting time zeroing memory if the process
-			 * has been killed by by SIGKILL
+			 * has been killed by SIGKILL.
 			 */
 			if (fatal_signal_pending(current))
 				goto free_cma;
-- 
2.17.1

