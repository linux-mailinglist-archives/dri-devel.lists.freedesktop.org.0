Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DEA80A8FC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F71A10EACE;
	Fri,  8 Dec 2023 16:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745B210EACC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:31:47 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8FZ4GT010525; Fri, 8 Dec 2023 16:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=mavRttr6BbHy1RLRGGoNVm1FePt2nUgLEcyeWpv3uws=;
 b=IhnuIfmL4Dy2dH4x1HSrz0xuvkbQUDDvcTxozp63BO32hEVtm2xtP5BwxmcHsmnWapcV
 ar6O1DAtOoe8Y4KxL0zriBHejT9OFkLc+GTMhgxhwJ1l7bNKGHChat3LdUCLwZQDvFXn
 UAdnAvBEqxWo79O7UEE3hbJzBAMI4+deXZetpz79PQRPQBCzd1acILJOxtN8mkFnyCRV
 I8ga3HdGujTzGb9vipLDFRw1Kr2FEirzXPkx8HZsXtjkqaIGbmv7nRDQDnHg6QzBmVvP
 TXu8iqCWnw1mUSgJ5tWj7lNcOf0XlfdWb2MvoKdICW4pRHsXMK5yQS5kszyEFYf27ico Cw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uv5wpg63p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 16:31:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GVSSt015877
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 16:31:28 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:31:27 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 1/2] accel/qaic: Fix GEM import path code
Date: Fri, 8 Dec 2023 09:31:00 -0700
Message-ID: <20231208163101.1295769-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
References: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2F-XN8eTc5JpVqkQ0bN6pw1yvFC4EHzb
X-Proofpoint-ORIG-GUID: 2F-XN8eTc5JpVqkQ0bN6pw1yvFC4EHzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=949 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Do not modify the size of dmabuf as it is immutable.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 4a8e43a7a6a4..d42f002bc0cf 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -777,7 +777,6 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
 	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
 	struct qaic_bo *bo;
-	size_t size;
 	int ret;
 
 	bo = qaic_alloc_init_bo();
@@ -795,13 +794,12 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
 		goto attach_fail;
 	}
 
-	size = PAGE_ALIGN(attach->dmabuf->size);
-	if (size == 0) {
+	if (!attach->dmabuf->size) {
 		ret = -EINVAL;
 		goto size_align_fail;
 	}
 
-	drm_gem_private_object_init(dev, obj, size);
+	drm_gem_private_object_init(dev, obj, attach->dmabuf->size);
 	/*
 	 * skipping dma_buf_map_attachment() as we do not know the direction
 	 * just yet. Once the direction is known in the subsequent IOCTL to
-- 
2.34.1

