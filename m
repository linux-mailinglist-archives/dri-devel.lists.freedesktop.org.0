Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71ABDC8EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 06:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABECD10E6E9;
	Wed, 15 Oct 2025 04:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRjU/WUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF8B10E6E9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 04:59:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sfQd016165;
 Wed, 15 Oct 2025 04:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=S7cxMjN07Kb
 UzbGp0RRAY9q1RBefCfEuJyeBArzvxS8=; b=dRjU/WUI2WyKcMjnNo7ip5ikxKU
 aTK0V4nm54Mi6QFkpcsTVhAX27BJZ0bzl1lmXeftjUuMMytbIX0+eUCTA8w/Y0bV
 Us6kom9c0XWi1dOVjuIDmnRIo83IYXtlnwO+qLfBbtL7cS3tdzw+K9w9rgCJP6c8
 qLB7lv2F4XI1PpnAcLLEuxvrxudZVhbBrwlyV4asOlf0qhYq0lnYXHN7DZDO9rmY
 0l5FSqwJixnu4z3ePxhYZWu+9G1cT3wdhnm0cWPSFX2ielFuNyitWI+JzMMLaXBM
 qWzT3ucKgiFps6EM4tmDWKUdkqpDQR3qNEgHIxA1nIrqaBYv9Vmm41zJlnw==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5k70e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 04:59:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59F4xYBE022603; 
 Wed, 15 Oct 2025 04:59:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgambmdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 04:59:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59F4xXg3022598;
 Wed, 15 Oct 2025 04:59:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com
 [10.147.243.7])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59F4xXoB022583
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 04:59:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
 id 4CAA953B; Wed, 15 Oct 2025 10:29:32 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v2 2/3] misc: fastrpc: Add support for new DSP IOVA formatting
Date: Wed, 15 Oct 2025 10:27:01 +0530
Message-Id: <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AmS4aEJRxewCP6LSt8Ju1LHgtZAoqL_O
X-Proofpoint-ORIG-GUID: AmS4aEJRxewCP6LSt8Ju1LHgtZAoqL_O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX9jPjzLV7dmZh
 NVnz9FxUidbLYImvpy+yZrwWDuCmqo8S58Z/ZEd/tWo9NDNbJ09pnExnXYUbbzhad3W6dpnnPud
 hC3sZdqNeDMd5Q2x+43+W1jPFCQKVfNV3QF1Ot2VD4t5MlOJMU6einVZrTZirlMI33mqMLSHjng
 C8lwfQb7p39xr67Umh2QBkf04qplczs9/YkHr/Xf3v++VmnBajsbPcBYQ9p85s4TXy1EiCRdlQF
 iT7i9XQp6oAkj3QQSquHpkBYOmjYo7gG1HzRniBN+gIiMhSzJp8+tYI0m9s3BJ8gonahIci/Jf8
 9KMmIHoOkfNOmDexEksGNME/IhFBUnOevL8R21zbuZZ7rqMoF9El7xPR/8Cz/CY4iz/ClRl+mUE
 0ZHcMnaReIvPsNdPwgyYO7BvoYp48g==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef2a39 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-4e2_yvRbxqkDXL5fRYA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
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

Implement the new IOVA formatting required by the DSP architecture change
on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
physical address. This placement is necessary for the DSPs to correctly
identify streams and operate as intended.
To address this, set SID position to bit 56 based on SoC-specific compatible
string from the root node within the physical address; otherwise, default to
legacy 32-bit placement.
This change ensures consistent SID placement across DSPs.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 59 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 975be54a2491..1a5d620b23f2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -33,7 +33,6 @@
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
 #define FASTRPC_MAX_CRCLIST	64
-#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
@@ -105,6 +104,15 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Extract smmu pa from consolidated iova */
+#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
+/*
+ * Prepare the consolidated iova to send to dsp by prepending the sid
+ * to smmu pa at the appropriate position
+ */
+#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
+       (phys += sid << sid_pos)
+
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -257,6 +265,10 @@ struct fastrpc_session_ctx {
 	bool valid;
 };
 
+struct fastrpc_soc_data {
+	u32 sid_pos;
+};
+
 struct fastrpc_channel_ctx {
 	int domain_id;
 	int sesscount;
@@ -278,6 +290,7 @@ struct fastrpc_channel_ctx {
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
+	const struct fastrpc_soc_data *soc_data;
 };
 
 struct fastrpc_device {
@@ -387,7 +400,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  FASTRPC_PHYS(buf->dma_addr));
+			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
 	kfree(buf);
 }
 
@@ -437,8 +450,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf = *obuf;
 
 	if (fl->sctx && fl->sctx->sid)
-		buf->dma_addr += ((u64)fl->sctx->sid << 32);
-
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr, fl->cctx->soc_data->sid_pos);
 	return 0;
 }
 
@@ -682,7 +694,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
 		return -ENOMEM;
 
 	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
-			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
+			      IPA_TO_DMA_ADDR(buffer->dma_addr, buffer->fl->cctx->soc_data->sid_pos),
+			      buffer->size);
 	if (ret < 0) {
 		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
 		kfree(a);
@@ -731,7 +744,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 	dma_resv_assert_held(dmabuf->resv);
 
 	return dma_mmap_coherent(buf->dev, vma, buf->virt,
-				 FASTRPC_PHYS(buf->dma_addr), size);
+				 IPA_TO_DMA_ADDR(buf->dma_addr,
+				 buf->fl->cctx->soc_data->sid_pos), size);
 }
 
 static const struct dma_buf_ops fastrpc_dma_buf_ops = {
@@ -786,7 +800,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		map->dma_addr = sg_phys(map->table->sgl);
 	} else {
 		map->dma_addr = sg_dma_address(map->table->sgl);
-		map->dma_addr += ((u64)fl->sctx->sid << 32);
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
+				 map->dma_addr, fl->cctx->soc_data->sid_pos);
 	}
 	for_each_sg(map->table->sgl, sgl, map->table->nents,
 		sgl_index)
@@ -2283,6 +2298,19 @@ static int fastrpc_get_domain_id(const char *domain)
 	return -EINVAL;
 }
 
+static const struct fastrpc_soc_data kaanapali_soc_data = {
+	.sid_pos = 56,
+};
+
+static const struct fastrpc_soc_data default_soc_data = {
+	.sid_pos = 32,
+};
+
+static const struct of_device_id qcom_soc_match_table[] = {
+	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
+	{ },
+};
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2291,6 +2319,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	const char *domain;
 	bool secure_dsp;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
+	struct device_node *root;
+	const struct of_device_id *match;
+	const struct fastrpc_soc_data *soc_data = NULL;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return -ENODEV;
+
+	match = of_match_node(qcom_soc_match_table, root);
+	of_node_put(root);
+	if (!match || !match->data) {
+		 soc_data = &default_soc_data;
+		 dev_dbg(rdev, "no compatible SoC found at root node\n");
+	} else {
+		 soc_data = match->data;
+	}
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
 	if (err) {
@@ -2343,6 +2387,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
+	data->soc_data = soc_data;
 
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
-- 
2.34.1

