Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB58990E5D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 21:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7110EA9E;
	Fri,  4 Oct 2024 19:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GnUVUwcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC00C10EA9E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 19:33:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AQHIZ025744;
 Fri, 4 Oct 2024 19:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=StmBWnSRDLVfS6eE/CCTjG
 XamkLdbGRsuS1izIF7V94=; b=GnUVUwcpovyONPJqSVSraZboVgG2uizYZZ148m
 p45z80AWLyHzZygmp9Bp0RI0J4xfw0/4UDyblnWByZOGYf/KpKp/MeBdAkcD3Rdj
 ATqshd7bjnYHevNBRf/APu4T00JIZHEH2bij34qVVqN6FGAnrwGvN4V/bhMvrG+8
 dmvqRfKQLFWqwnH7MVjBIGz7noJbEeSzDXvlqySec0qVo7DO3CmotZeTmMAKzb3k
 J4Ker+behj4KyIUTa88aWGKDLVNIGXN7l3SW81cpnJrH6ZeInIHG9Vw+bu0wJ2ee
 j+s54qZW9D4qbzZy+W4PbtEhFv5jE8Iu4bQOMmKfgCpc1mlw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kk3mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 19:33:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494JXAx7030679
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 19:33:10 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 12:33:09 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <jacek.lawrynowicz@linux.intel.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Fix the for loop used to walk SG table
Date: Fri, 4 Oct 2024 13:32:52 -0600
Message-ID: <20241004193252.3888544-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7arbgIB6DgR4AEQta1Pnj2nMfdZIjFus
X-Proofpoint-GUID: 7arbgIB6DgR4AEQta1Pnj2nMfdZIjFus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040135
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

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Only for_each_sgtable_dma_sg() should be used to walk through a SG table
to grab correct bus address and length pair after calling DMA MAP API on
a SG table as DMA MAP APIs updates the SG table and for_each_sgtable_sg()
walks through the original SG table.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_control.c | 2 +-
 drivers/accel/qaic/qaic_data.c    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 9e8a8cbadf6b..d8bdab69f800 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -496,7 +496,7 @@ static int encode_addr_size_pairs(struct dma_xfer *xfer, struct wrapper_list *wr
 	nents = sgt->nents;
 	nents_dma = nents;
 	*size = QAIC_MANAGE_EXT_MSG_LENGTH - msg_hdr_len - sizeof(**out_trans);
-	for_each_sgtable_sg(sgt, sg, i) {
+	for_each_sgtable_dma_sg(sgt, sg, i) {
 		*size -= sizeof(*asp);
 		/* Save 1K for possible follow-up transactions. */
 		if (*size < SZ_1K) {
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index e86e71c1cdd8..c20eb63750f5 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -184,7 +184,7 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
 	nents = 0;
 
 	size = size ? size : PAGE_SIZE;
-	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
+	for_each_sgtable_dma_sg(sgt_in, sg, j) {
 		len = sg_dma_len(sg);
 
 		if (!len)
@@ -221,7 +221,7 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
 
 	/* copy relevant sg node and fix page and length */
 	sgn = sgf;
-	for_each_sgtable_sg(sgt, sg, j) {
+	for_each_sgtable_dma_sg(sgt, sg, j) {
 		memcpy(sg, sgn, sizeof(*sg));
 		if (sgn == sgf) {
 			sg_dma_address(sg) += offf;
@@ -301,7 +301,7 @@ static int encode_reqs(struct qaic_device *qdev, struct bo_slice *slice,
 	 * fence.
 	 */
 	dev_addr = req->dev_addr;
-	for_each_sgtable_sg(slice->sgt, sg, i) {
+	for_each_sgtable_dma_sg(slice->sgt, sg, i) {
 		slice->reqs[i].cmd = cmd;
 		slice->reqs[i].src_addr = cpu_to_le64(slice->dir == DMA_TO_DEVICE ?
 						      sg_dma_address(sg) : dev_addr);
-- 
2.34.1

