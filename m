Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8227A73F335
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 06:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1423A10E285;
	Tue, 27 Jun 2023 04:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FE710E284;
 Tue, 27 Jun 2023 04:13:30 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35QMjDNN029311; Tue, 27 Jun 2023 04:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=qE1HJ292s3PXvLRoSr2Nw3hL8I7+kggKD9BrBYerbDA=;
 b=a5t50CXV4q8mIIpAJq12aaDS/qBcZvmjsY+27MVXUsvUPmreAXKZ5Gu40e0RceaWryoP
 6jUsKdSxVQ6o9vqZF8AAyCptj/QH330OLUNFvGLsb0iEQg0anIe+AkQqNLQgHiJ00vVl
 w6UDOrr7AFQzr6Ave5R9AnWibIJfNwnFYKmSXFMGXXnCf5wdYEIQZB0umN4Ae46UqhDH
 Mumx9Ekv08CvodsXBk+deCrb1YA3kgAZ2LhVXTgdRFHIguMJ3Ri1MJPKMcgQNe62yO34
 Nf0EPxwh44p4LHMlgY89Wq5qlLiYEK3Huv7JRo8F+K2i2YOI3R3E7O5c7rs392GbuUx5 4g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rds1u3yvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jun 2023 04:13:22 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 35R1DS8U026348; Tue, 27 Jun 2023 04:13:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3rdpxaehdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jun 2023 04:13:21 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35R4DLTQ009154;
 Tue, 27 Jun 2023 04:13:21 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3rdpxaeh80-1; Tue, 27 Jun 2023 04:13:21 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Subject: [PATCH next] drm/msm/a5xx: Fix a NULL dereference bug in
 a5xx_gpu_init()
Date: Mon, 26 Jun 2023 21:12:35 -0700
Message-ID: <20230627041250.3899791-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_01,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306270039
X-Proofpoint-GUID: yfOpun_fnhTicgyspkhXL1luRak9scc_
X-Proofpoint-ORIG-GUID: yfOpun_fnhTicgyspkhXL1luRak9scc_
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
Cc: Elliot Berman <quic_eberman@quicinc.com>, error27@gmail.com,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Adam Skladowski <a39.skl@gmail.com>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Mukesh Ojha <quic_mojha@quicinc.com>, harshit.m.mogalapalli@oracle.com,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch complains:
	drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1753
	a5xx_gpu_init() warn: variable dereferenced before
	check 'pdev' (see line 1746)

When no device is defined, dereferencing pdev is a NULL dereference.
Fix this by dereferencing pdev to get the config post the NULL check.

Fixes: 736a93273656 ("drm/msm/a5xx: really check for A510 in a5xx_gpu_init")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis, only compile tested.
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a99310b68793..adaf8f8e7f2d 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1743,7 +1743,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
-	struct adreno_platform_config *config = pdev->dev.platform_data;
+	struct adreno_platform_config *config;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1755,6 +1755,8 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(-ENXIO);
 	}
 
+	config = pdev->dev.platform_data;
+
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
 		return ERR_PTR(-ENOMEM);
-- 
2.39.3

