Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11763C5C09B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E81C10EA0D;
	Fri, 14 Nov 2025 08:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRhXR1vZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFB510EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:41:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE83Hvl1582950; Fri, 14 Nov 2025 08:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2cS2BtErjyY
 yRZPNiD7GL3okIO5nA0lihGeBRe0V/1Y=; b=pRhXR1vZmPEbonfXct/1HPPZE1l
 iojotwrmiTeJjwpdzckUZuXmzr+HcC/3DE9dnmv0bY8XjCuKB/+V9QDOSoTi4NLo
 P565TzNZk5zWbaRdAmJ+Yk7nSjReDHISVnsnVQYc1H0zW63aNedzh+0A1iAqk7LY
 Xb07URNqLAtmZd0SLzBGjmjzutMD2e7aeo0MYJb3wsDMTF2sbA0MVQPe6DeBkqnO
 PKNvfGTKt5/eDvvqnjWfIGD8vRGNMkjyir+XMy/cRre6ZOmlv/PGDCy1d1xDbT+b
 59LOdY25YgFWYMxBe9vF6W/oF2X7xjh3p7RQo6qHimjacQ+G/ObyZD8EAUg==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fsfum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8fpLn001493; 
 Fri, 14 Nov 2025 08:41:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxn3dmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:51 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8fp6L001488;
 Fri, 14 Nov 2025 08:41:51 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AE8fpfv001484
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 08:41:51 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 259E2534; Fri, 14 Nov 2025 14:11:50 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v3 4/4] misc: fastrpc: Update dma_bits for CDSP support on
 Kaanapali SoC
Date: Fri, 14 Nov 2025 14:11:42 +0530
Message-Id: <20251114084142.3386682-5-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916eb52 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pfE1wiWnY1F2L3mdSfMA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: cnX0oeIqxa9h6MZbRsDn3Nka7He5Rn_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2OCBTYWx0ZWRfX4IQH0ffK8IGw
 xZTPUvjaeeKavFhGUAtM9WbH/TeaV+RySv3ZnitWzuMuTreXj0MPS/cc1Gd//1OKYkWNJnjX6sN
 KW2N/Yt3vUoZIDdYeg/3zozO9J7Zhf/QxdaJijV2u3KKCycc21k2LdPp1+OmZ4Ldsd7PPO+KZSL
 ZaN7WpknT6mTL60rRrzoo1tKKg+O2zEbtOB45c/RBVLXP811rsQfI/YBMppx+zRGID61EVHxCoq
 s58yckTyic3mrCK1OyuLiY/plKP7WN4Wbc5V194jtI6G8yDUAhoZ1srneVjavEBVZ0LMp4fWPed
 VFau7e+8T24Jfj04tdYAlC3Ll6LeWGA7ciEIQb58vaao0cR1QWmcxrIDAhq70HmUZGu8Gruf150
 UFt03HmPOpL0HiOjP34K692kIawVQA==
X-Proofpoint-ORIG-GUID: cnX0oeIqxa9h6MZbRsDn3Nka7He5Rn_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140068
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
index bcf3c7f8d3e9..2eb8d37cd9b4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -267,6 +267,8 @@ struct fastrpc_session_ctx {
 
 struct fastrpc_soc_data {
 	u32 sid_pos;
+	u32 cdsp_dma_bits;
+	u32 dsp_default_dma_bits;
 };
 
 struct fastrpc_channel_ctx {
@@ -2186,6 +2188,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
+	u32 dma_bits;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2199,12 +2202,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		return -ENOSPC;
 	}
+	dma_bits = cctx->soc_data->dsp_default_dma_bits;
 	sess = &cctx->session[cctx->sesscount++];
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
 	dev_set_drvdata(dev, sess);
 
+	if (cctx->domain_id == CDSP_DOMAIN_ID)
+		dma_bits = cctx->soc_data->cdsp_dma_bits;
+
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2219,9 +2226,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
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
 
@@ -2308,10 +2315,14 @@ static int fastrpc_get_domain_id(const char *domain)
 
 static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.sid_pos = 56,
+	.cdsp_dma_bits = 34,
+	.dsp_default_dma_bits = 32,
 };
 
 static const struct fastrpc_soc_data default_soc_data = {
 	.sid_pos = 32,
+	.cdsp_dma_bits = 32,
+	.dsp_default_dma_bits = 32,
 };
 
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
-- 
2.34.1

