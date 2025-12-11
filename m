Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA97CB574C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 11:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE4110E7D5;
	Thu, 11 Dec 2025 10:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2dFDH62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D0110E7CF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 10:09:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BB9ZREE1054833; Thu, 11 Dec 2025 10:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iiYtERK5lDS
 jU0f7TnMrdUzOzeVIfDyXuyD3Ay+56Fk=; b=j2dFDH62SWidfTwwYK+uRupV80O
 +ICsjsjWNnRD7eJXS6u1gUeBnS79XHt7IwnJJhsHzPEo9rFHhe0VXxTYMk+3shHT
 p5/RYwxwLkRxMtfkWMtxEQ6NPs1pIyGX3YnpMDJoZLGptr8hYIgcNlg9sEUrkkiQ
 Vt4A6UVtTldPmOFrIUBZIXl0bczdRmJLpTjOLoF7J9RQw+wmj7t0PbZZX4q+EPsf
 D5UzcOwHkBCOWXczzNNd2wRPiliaMJjk+tbrLtEfaMQGMlUrqCaW1f/Y6BauGGHX
 64h36SyU2fqGzSKo23cUOQ2oXJHa5XGD5znj4qz1Wzb1eel1UjsHp/7A5rg==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx1yav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBA9kaV013920; 
 Thu, 11 Dec 2025 10:09:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4avdjnuppp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BBA9kKr013904;
 Thu, 11 Dec 2025 10:09:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BBA9jwA013896
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 10:09:46 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id A6DD756A; Thu, 11 Dec 2025 15:39:44 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: [PATCH v6 4/4] misc: fastrpc: Update dma_bits for CDSP support on
 Kaanapali SoC
Date: Thu, 11 Dec 2025 15:39:33 +0530
Message-Id: <20251211100933.1285093-5-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r9lxgX0muM-eLe9b-Ua8Suynkwm33XWk
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a986d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pfE1wiWnY1F2L3mdSfMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NyBTYWx0ZWRfX7g28sQSf5yvk
 pUJ8L3wid5/PpsB0PD6EIPLTHLKndsiw55KKIaf+TgNdHMdhyx2vc0jIyrcLDz8ptwCgFjdLeRx
 GVW800EIOXM7rxrJjMWLOsO8xZLRuZz5bezjELi5ODcldmVd1C6GPkA0w6fClxJJAlBE5LRGwPQ
 QKDIgTBmClsrMXkBukOKvTBP3mvHUFOUjSRYKa1gUS9svNeF3h5AwvsizPPXFRb8TTZ4iuReIay
 aRe6K9JEwT3TpDDPOKrfC2vC9ttq6JEwOg78YY7HVHikrlrymJ6OpdGXvpQJ4tBQIKzZbhiv5PY
 d54xKSkQkUrwp/+Qp5hek5I1t1Q9CEReTdpUflNoBb8hyweVG2rJp1Ug0jbOHZ1uUwf1l2P9Wzw
 KCtXtU6LtWfBfWH8YSHvSAfns+J39g==
X-Proofpoint-ORIG-GUID: r9lxgX0muM-eLe9b-Ua8Suynkwm33XWk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110077
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

DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access. This is being upgraded to
34-bit PA + 4-bit SID due to a hardware revision in CDSP for
Kaanapali SoC, which expands the DMA addressable range.
Update DMA bits configuration in the driver to support CDSP on
Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
it to 34-bit based on CDSP and OF matching on the fastrpc node.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af92876f1cc1..333be4c4f10b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -276,6 +276,8 @@ struct fastrpc_session_ctx {
 
 struct fastrpc_soc_data {
 	u32 sid_pos;
+	u32 dma_addr_bits_cdsp;
+	u32 dma_addr_bits_default;
 };
 
 struct fastrpc_channel_ctx {
@@ -2202,6 +2204,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
+	u32 dma_bits;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2215,12 +2218,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		return -ENOSPC;
 	}
+	dma_bits = cctx->soc_data->dma_addr_bits_default;
 	sess = &cctx->session[cctx->sesscount++];
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
 	dev_set_drvdata(dev, sess);
 
+	if (cctx->domain_id == CDSP_DOMAIN_ID)
+		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
+
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2235,9 +2242,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		}
 	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
-	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
+	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
-		dev_err(dev, "32-bit DMA enable failed\n");
+		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
 		return rc;
 	}
 
@@ -2324,10 +2331,14 @@ static int fastrpc_get_domain_id(const char *domain)
 
 static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.sid_pos = 56,
+	.dma_addr_bits_cdsp = 34,
+	.dma_addr_bits_default = 32,
 };
 
 static const struct fastrpc_soc_data default_soc_data = {
 	.sid_pos = 32,
+	.dma_addr_bits_cdsp = 32,
+	.dma_addr_bits_default = 32,
 };
 
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
-- 
2.34.1

