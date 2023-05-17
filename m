Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39770724B
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C80010E46F;
	Wed, 17 May 2023 19:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14B210E285
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:36:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HJUD5O032198; Wed, 17 May 2023 19:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=fTsutD9Vqk1D3BruN6SC+FdMXKpivSXo9+eArJoaL7g=;
 b=VMGMKNxaWdpcWwSPyj485E/vQKi3u3PZCWpDihGuEgUfMEHVLDgXqmrVLViTVsYG6YyE
 4AvxGxNgADnCHhTZtH+m/HTJ71Qmq/H9bg+y6Gh3K/SNarnS0p+go6RcmsF8nh4L5orF
 Pg6ffJzctkkLYEJh5F//9ENZJb+r1x0kq0VZ+00yNbszOmK7/nL/N2GY/kY11stJgkjY
 +HX6fu8JSs4D6RFG+gIj0iaqLc37D1uP7SOhw0vxgug7YBzyVQn1TsiSRr0AS3XX2tA/
 XwDq9RTshDHaMmF72HbanT6suGghkrAoTb30P8JX0Hq73hwenCnEfm/+BHxhCVG57/ze UA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmt5gsqf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 19:36:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HJa6rV014873
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 19:36:06 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 12:36:05 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>
Subject: [PATCH 1/5] accel/qaic: Validate user data before grabbing any lock
Date: Wed, 17 May 2023 13:35:36 -0600
Message-ID: <20230517193540.14323-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517193540.14323-1-quic_jhugo@quicinc.com>
References: <20230517193540.14323-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3O-TTuFTvDloDqY-u71EDHa3sI5Msn2Z
X-Proofpoint-ORIG-GUID: 3O-TTuFTvDloDqY-u71EDHa3sI5Msn2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170161
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Validating user data does not need to be protected by any lock and it is
safe to move it out of critical region.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_control.c | 12 ++----
 drivers/accel/qaic/qaic_data.c    | 61 ++++++++++++-------------------
 2 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 9f216eb6f76e..9e39b1a324f7 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1249,7 +1249,7 @@ static int qaic_manage(struct qaic_device *qdev, struct qaic_user *usr, struct m
 
 int qaic_manage_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
-	struct qaic_manage_msg *user_msg;
+	struct qaic_manage_msg *user_msg = data;
 	struct qaic_device *qdev;
 	struct manage_msg *msg;
 	struct qaic_user *usr;
@@ -1258,6 +1258,9 @@ int qaic_manage_ioctl(struct drm_device *dev, void *data, struct drm_file *file_
 	int usr_rcu_id;
 	int ret;
 
+	if (user_msg->len > QAIC_MANAGE_MAX_MSG_LENGTH)
+		return -EINVAL;
+
 	usr = file_priv->driver_priv;
 
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
@@ -1275,13 +1278,6 @@ int qaic_manage_ioctl(struct drm_device *dev, void *data, struct drm_file *file_
 		return -ENODEV;
 	}
 
-	user_msg = data;
-
-	if (user_msg->len > QAIC_MANAGE_MAX_MSG_LENGTH) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	msg = kzalloc(QAIC_MANAGE_MAX_MSG_LENGTH + sizeof(*msg), GFP_KERNEL);
 	if (!msg) {
 		ret = -ENOMEM;
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c0a574cd1b35..7a4397e3122b 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -663,6 +663,10 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (args->pad)
 		return -EINVAL;
 
+	size = PAGE_ALIGN(args->size);
+	if (size == 0)
+		return -EINVAL;
+
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
 	if (!usr->qddev) {
@@ -677,12 +681,6 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 		goto unlock_dev_srcu;
 	}
 
-	size = PAGE_ALIGN(args->size);
-	if (size == 0) {
-		ret = -EINVAL;
-		goto unlock_dev_srcu;
-	}
-
 	bo = qaic_alloc_init_bo();
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
@@ -936,6 +934,22 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	struct qaic_bo *bo;
 	int ret;
 
+	if (args->hdr.count == 0)
+		return -EINVAL;
+
+	arg_size = args->hdr.count * sizeof(*slice_ent);
+	if (arg_size / args->hdr.count != sizeof(*slice_ent))
+		return -EINVAL;
+
+	if (args->hdr.size == 0)
+		return -EINVAL;
+
+	if (!(args->hdr.dir == DMA_TO_DEVICE || args->hdr.dir == DMA_FROM_DEVICE))
+		return -EINVAL;
+
+	if (args->data == 0)
+		return -EINVAL;
+
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
 	if (!usr->qddev) {
@@ -950,43 +964,17 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 		goto unlock_dev_srcu;
 	}
 
-	if (args->hdr.count == 0) {
-		ret = -EINVAL;
-		goto unlock_dev_srcu;
-	}
-
-	arg_size = args->hdr.count * sizeof(*slice_ent);
-	if (arg_size / args->hdr.count != sizeof(*slice_ent)) {
-		ret = -EINVAL;
-		goto unlock_dev_srcu;
-	}
-
 	if (args->hdr.dbc_id >= qdev->num_dbc) {
 		ret = -EINVAL;
 		goto unlock_dev_srcu;
 	}
 
-	if (args->hdr.size == 0) {
-		ret = -EINVAL;
-		goto unlock_dev_srcu;
-	}
-
-	if (!(args->hdr.dir == DMA_TO_DEVICE  || args->hdr.dir == DMA_FROM_DEVICE)) {
-		ret = -EINVAL;
-		goto unlock_dev_srcu;
-	}
-
 	dbc = &qdev->dbc[args->hdr.dbc_id];
 	if (dbc->usr != usr) {
 		ret = -EINVAL;
 		goto unlock_dev_srcu;
 	}
 
-	if (args->data == 0) {
-		ret = -EINVAL;
-		goto unlock_dev_srcu;
-	}
-
 	user_data = u64_to_user_ptr(args->data);
 
 	slice_ent = kzalloc(arg_size, GFP_KERNEL);
@@ -1316,7 +1304,6 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	received_ts = ktime_get_ns();
 
 	size = is_partial ? sizeof(*pexec) : sizeof(*exec);
-
 	n = (unsigned long)size * args->hdr.count;
 	if (args->hdr.count == 0 || n / args->hdr.count != size)
 		return -EINVAL;
@@ -1665,6 +1652,9 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 	int rcu_id;
 	int ret;
 
+	if (args->pad != 0)
+		return -EINVAL;
+
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
 	if (!usr->qddev) {
@@ -1679,11 +1669,6 @@ int qaic_wait_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *file
 		goto unlock_dev_srcu;
 	}
 
-	if (args->pad != 0) {
-		ret = -EINVAL;
-		goto unlock_dev_srcu;
-	}
-
 	if (args->dbc_id >= qdev->num_dbc) {
 		ret = -EINVAL;
 		goto unlock_dev_srcu;
-- 
2.40.1

