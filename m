Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D546532FB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26D10E458;
	Wed, 21 Dec 2022 15:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BA410E455;
 Wed, 21 Dec 2022 15:10:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLCp8hW005691; Wed, 21 Dec 2022 15:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=wY1NExqDqDzXSUoLUkd9icvRcHISZwHFBbiXiGLjU18=;
 b=IMjNmEm5TWITSHhb4i6iSnY8YzGIo0obXCfmoEojQRnyUh7oy3NkmxS3SEanqnis25uW
 CuzRWAb2vUwUEZCHVGme+XAwoCLPqjJ6QtvLhIji9NkBKm/ElfKtDW3fXTSy5K6RT7hT
 8e7LqirHCanS580SFZwWywkoaEX0nBjSWl/Gv3Vzol/fdUggUKqWCYp/gZkuDiiu4UT/
 z4oxvWaNcUpem5UaAwlp4WAIMRQY+3KmuzBtiBsGaq5tST0idtO+hnYb6YXtQrF6Ub7E
 Nwxmz2G+kRFiHWX+WoN02JGXowK01yZlgsn5wuxV+niUxodUYXPS6NPh9k5Mq7HWl11k qw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkkxct3aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLFAJat014447
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 15:10:19 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 07:10:14 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 2/4] drm/msm: Fix failure paths in msm_drm_init()
Date: Wed, 21 Dec 2022 20:39:57 +0530
Message-ID: <20221221203925.v2.2.I49dfc3654040be61702e491f1aa63d3a5f308852@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20221221203925.v2.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
References: <20221221203925.v2.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: z0sY5w4UyLCtM1Pk0LRPjEutvwkITRBd
X-Proofpoint-ORIG-GUID: z0sY5w4UyLCtM1Pk0LRPjEutvwkITRBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210126
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
Cc: Sean Paul <sean@poorly.run>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Brian Norris <briannorris@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Duoming Zhou <duoming@zju.edu.cn>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure that we do drm_dev_put() when there is an early return in
msm_drm_init().

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c                | 11 +++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index e75b97127c0d..b73031cd48e4 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -129,6 +129,9 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
 	}
 
 	priv = drm_dev->dev_private;
+	if (!priv->kms)
+		return;
+
 	kms = priv->kms;
 
 	if (kms->dump_worker)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index eb5b056ce3f7..544e041dd710 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -149,6 +149,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 
+	if (!priv->kms)
+		return;
+
 	kms->funcs->irq_uninstall(kms);
 	if (kms->irq_requested)
 		free_irq(kms->irq, dev);
@@ -265,8 +268,6 @@ static int msm_drm_uninit(struct device *dev)
 	component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
-	drm_dev_put(ddev);
-
 	destroy_workqueue(priv->wq);
 
 	return 0;
@@ -441,12 +442,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		return ret;
+		goto err_drm_dev_put;
 
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
-		return ret;
+		goto err_drm_dev_put;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -541,6 +542,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_msm_uninit:
 	msm_drm_uninit(dev);
+err_drm_dev_put:
+	drm_dev_put(ddev);
 	return ret;
 }
 
-- 
2.7.4

