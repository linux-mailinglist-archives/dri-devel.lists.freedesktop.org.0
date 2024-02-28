Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B727186B886
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 20:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A464410E312;
	Wed, 28 Feb 2024 19:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dnr0I0WC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CE210E287;
 Wed, 28 Feb 2024 19:47:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41SIhofu018782; Wed, 28 Feb 2024 19:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=/GMSX6sWWOsoo4/guSjduizGVhX6C3jE3qMT/B6BT0I=; b=dn
 r0I0WCLmpJ7yRgeUxarmRSqJbqgKA0DIbaxz5n531Wdam9NfI+pHS6Ka3Q8xDpD8
 NUmJEYWo1+tKl+cNLcC0NDuPW8AujlvYJYNMsS+Bdw0+G9l9bOad8pRDVDJbZUsW
 lHc2nNT2kJaEDIdPGz+IuFfMIZBj8it4bRRVTnLXgkSgL926y0uGRdtW4q+z/W0j
 m6JsfrohLIxuISjXCwsGXjpC4uTF+6TzDduDS5OVkkECoF8GgoEELV/uG4G66hS2
 RK6udHpvSuvfmtb8lJxnp1xZucj2uc9uKqOkYxDpKaVYw/TLxsfTjNxv0G0eCLCQ
 2BfUmSLUkzfFPv5FvjUw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj1d9sqhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 19:47:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SJlmjc022155
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 19:47:48 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 28 Feb 2024 11:47:48 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <quic_parellan@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drm/msm/dpu: drop dpu_kms from
 _dpu_kms_initialize_writeback
Date: Wed, 28 Feb 2024 11:47:30 -0800
Message-ID: <20240228194730.619204-2-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
References: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: E7B4iOBq6kJLWRIraPW-OwGfl0u8BEd1
X-Proofpoint-ORIG-GUID: E7B4iOBq6kJLWRIraPW-OwGfl0u8BEd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280156
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

Following the pattern of other interfaces, lets align writeback
as well by dropping the dpu_kms parameter in its _dpu_kms_initialize_*
function.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ab924ac78c9b..382ef4c8e8eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -620,13 +620,12 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 }
 
 static int _dpu_kms_initialize_writeback(struct drm_device *dev,
-		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
+		struct msm_drm_private *priv, u32 maxlinewidth,
 		const u32 *wb_formats, int n_formats)
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
 	const enum dpu_wb wb_idx = WB_2;
-	u32 maxlinewidth;
 	int rc;
 
 	memset(&info, 0, sizeof(info));
@@ -636,8 +635,6 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	info.h_tile_instance[0] = wb_idx;
 	info.intf_type = INTF_WB;
 
-	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
-
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
 	if (IS_ERR(encoder)) {
 		DPU_ERROR("encoder init failed for dsi display\n");
@@ -690,9 +687,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	if (dpu_kms->catalog->wb_count) {
 		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
 			if (dpu_kms->catalog->wb[i].id == WB_2) {
-				rc = _dpu_kms_initialize_writeback(dev, priv, dpu_kms,
-						dpu_kms->catalog->wb[i].format_list,
-						dpu_kms->catalog->wb[i].num_formats);
+				u32 wb_maxlinewidth = dpu_kms->catalog->wb[i].maxlinewidth;
+				const u32 *wb_formats = dpu_kms->catalog->wb[i].format_list;
+				u32 n_formats = dpu_kms->catalog->wb[i].num_formats;
+
+				rc = _dpu_kms_initialize_writeback(dev, priv, wb_maxlinewidth,
+								   wb_formats, n_formats);
 				if (rc) {
 					DPU_ERROR("initialize_WB failed, rc = %d\n", rc);
 					return rc;
-- 
2.34.1

