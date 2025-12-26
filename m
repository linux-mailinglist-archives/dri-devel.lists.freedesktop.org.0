Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63ACCDE686
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 08:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753D11BF68;
	Fri, 26 Dec 2025 07:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FR9YVqRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C145011BF68
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 07:05:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BPNugwt3634479; Fri, 26 Dec 2025 07:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=jvFS/69PzEc
 WHl3Hqe8ueX1yuMTuNSHSys3sPH2aIGg=; b=FR9YVqRx8ansJ5vNhh7YgRg5atL
 WyS26W4OLapvsteFw64r467+fyrQMZIFEdn3aDK5Zxfnpf/ZzmeDBzNPrZNUR5b1
 c1WSeik1tH0nifPq3dIKwdo39cVHgKsGWugqDmupWPiBX5R3VDtVJNxL6Y/ejzZr
 jsn8oCDJnvkWELYma8mdpLc+vMcU9u6dIPKrytrJrrkZVnaTSicVohu6dMaZFcU3
 5C2JhG1A22efhUIYVX8R7OAQAlpcuEl1TBRY9cjgt2VOO5P6l1ToKeIIYwjFeCZh
 Se51BergoztyE64P9JRnXqIAGA1wtd35PFgmiiR4m0naZA/ah7jendr4ejA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kywk6jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Dec 2025 07:05:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQ75kpT023406; 
 Fri, 26 Dec 2025 07:05:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn69yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Dec 2025 07:05:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BQ75jRS023400;
 Fri, 26 Dec 2025 07:05:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BQ75jUv023399
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Dec 2025 07:05:45 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 57E64576; Fri, 26 Dec 2025 12:35:44 +0530 (+0530)
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
Subject: [PATCH v7 4/4] misc: fastrpc: Update dma_bits for CDSP support on
 Kaanapali SoC
Date: Fri, 26 Dec 2025 12:35:34 +0530
Message-Id: <20251226070534.602021-5-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA2NCBTYWx0ZWRfX5NeebwY+bsmc
 bC4zhJcTM2E7EfzHgMWvjDkhOkB9R+Q5QKVJDqgERRGf2PwlHPiOCcTUjHaGnS2P7YaLD3YKied
 Pkn1f0GYX+W408LFMXvTJH/d47X+GVn9pCMqJJSFWHt6EOhtypthsfCRe1Jh/DuwvneUvvcGTMh
 4j4DMG+jHroOJSK3dCbj4e6iOrKK11z3XF2OrVO4vQT2JvZ6yFhWez6gyVbQ86udCzEgcTGD5WB
 xuypq2ySGcuvD+q1kToGFDIYxAGLLX10PlO92BQK9hBo+vd6qHz3dC2gFCWkvF6oxB1ieGTzWEe
 b0tinMurgx6YFFFKJVvKwh/T8Pe+vt5ETxcXrDuC7paV2ystgU6ept/0JwUEOdVCbOepfFo+MHt
 XMS/7Ht1NKWxw19RifH2S4Y2+iCf6moEIR6TONzRodsuzL6je0d4w4HN6XT8g/VO3ol3ASIHMxt
 7GXwSRRFgucMQW5bcwg==
X-Proofpoint-GUID: DeK9FdxI0cMHuKgQa3Usrs7UXJO-5wiO
X-Authority-Analysis: v=2.4 cv=MKVtWcZl c=1 sm=1 tr=0 ts=694e33cd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pfE1wiWnY1F2L3mdSfMA:9
X-Proofpoint-ORIG-GUID: DeK9FdxI0cMHuKgQa3Usrs7UXJO-5wiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260064
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
index fcc80206b7c4..4f5a79c50f58 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -259,6 +259,8 @@ struct fastrpc_session_ctx {
 
 struct fastrpc_soc_data {
 	u32 sid_pos;
+	u32 dma_addr_bits_cdsp;
+	u32 dma_addr_bits_default;
 };
 
 struct fastrpc_channel_ctx {
@@ -2197,6 +2199,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
+	u32 dma_bits;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2210,12 +2213,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
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
 
@@ -2230,9 +2237,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
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
 
@@ -2319,10 +2326,14 @@ static int fastrpc_get_domain_id(const char *domain)
 
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

