Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75C85063F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 21:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68FD10F310;
	Sat, 10 Feb 2024 20:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l91tVzqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7209910EBD6;
 Sat, 10 Feb 2024 20:28:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41AJs3jj006466; Sat, 10 Feb 2024 20:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=v/cHZYd
 b+yD6ktJd09VmLqkStpJ/Uz6jOGoktXVOW1M=; b=l91tVzqp06a0sFLYEJ+fokP
 CcgOjWtaY6+2KuLp2BxKIrQ4bSME7MUk7ieC6PPCEHgY5Q+J7ZYuqW4GPdT6b7/Z
 5hBDAN2BvBCM11fyNEXEQB5T7C4xuqB5p6+8m/Q0jNZaDwFN1tINdvIR196OXXLT
 yGEEZ2ni31GxQcDxL2vn539b8c2T+/nVsREZUvZ+CUPZo9AAgoT5MUp3tJewM3N+
 u7a95jhPL5HGnNECBi+4TGTzuMMlZrahcPSuopQW6iPvsCZuJ/bf5fbwQgPjJp2b
 3rDofCRizAWdQsXm3OboRTaBjNRQ2krwuzXub6sF2H0UJzFpfvsVXp5nRlIQJow=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62r10wvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 20:27:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41AKRS7V000637
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 20:27:28 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 10 Feb 2024 12:27:27 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Paloma Arellano <quic_parellan@quicinc.com>, <robdclark@gmail.com>,
 <freedreno@lists.freedesktop.org>, <dmitry.baryshkov@linaro.org>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <ville.syrjala@linux.intel.com>, <quic_jesszhan@quicinc.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] drm/dp: add an API to indicate if sink supports VSC SDP
Date: Sat, 10 Feb 2024 12:27:04 -0800
Message-ID: <20240210202704.977303-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: Xvou_y2_4PkG3udCr1hAp2zOZhzv3XWl
X-Proofpoint-ORIG-GUID: Xvou_y2_4PkG3udCr1hAp2zOZhzv3XWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_19,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402100171
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

From: Paloma Arellano <quic_parellan@quicinc.com>

YUV420 format is supported only in the VSC SDP packet and not through
MSA. Hence add an API which indicates the sink support which can be used
by the rest of the DP programming.

changes in v3:
	- fix the commit title prefix to drm/dp
	- get rid of redundant !!
	- break out this change from series [1] to get acks from drm core
	  maintainers

Changes in v2:
	- Move VSC SDP support check API from dp_panel.c to
	  drm_dp_helper.c

[1]: https://patchwork.freedesktop.org/series/129180/

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 21 +++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index b1ca3a1100da..7a851f92b249 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2916,6 +2916,27 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
 }
 EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
 
+/**
+ * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
+ * @aux: DisplayPort AUX channel
+ * @dpcd: DisplayPort configuration data
+ *
+ * Returns true if vsc sdp is supported, else returns false
+ */
+bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
+{
+	u8 rx_feature;
+
+	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
+		drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
+		return false;
+	}
+
+	return (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
+		(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
+}
+EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
+
 /**
  * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
  * @dpcd: DisplayPort configuration data
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 863b2e7add29..948381b2b0b1 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -100,6 +100,7 @@ struct drm_dp_vsc_sdp {
 
 void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
 			const struct drm_dp_vsc_sdp *vsc);
+bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
-- 
2.34.1

