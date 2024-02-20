Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A7685C53B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71B010E554;
	Tue, 20 Feb 2024 19:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MF31SjYL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B4F10E53D;
 Tue, 20 Feb 2024 19:54:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KJCd5p000605; Tue, 20 Feb 2024 19:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=kMBGN4lkN2oMFK9YeeSBL21U79zoUeATlaYcPPlP7IA=; b=MF
 31SjYLFCPOavY+iHqNC7LEiE0bFiu3Es+3fp9U9+ch0n7hU8W9ckeHWW9H3/hhns
 Qf8V3e4VZSPLJYh+cHzFTHcQN4W/wpKP2yykTlFUD5FCuL0lQFsc1LEoJ2JmQPkT
 WZXm/yXljyetwm2CQCX2q3SkNDe923tKBJlHJQjGHzW2YmdTegr/O/gT2imann5K
 eWRCKNsLPCmDD1Uev3MHtzzasa8d0KesKj1ifaOcY6ZowHHif+xXY6YDhQ6RuFtT
 vdRPhVeB1GL7E60IRV6MDRLcub4ycC4c2ZSUooKzZZPoGDvIFyE7lAGaTqkzzRiN
 s6bTT1QOs1Qw5FcQKTKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21s02t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:54:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KJs0wJ007926
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:54:00 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 20 Feb 2024 11:53:59 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <robdclark@gmail.com>,
 <freedreno@lists.freedesktop.org>, <dmitry.baryshkov@linaro.org>,
 <intel-gfx@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <quic_jesszhan@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/dp: drop the size parameter from
 drm_dp_vsc_sdp_pack()
Date: Tue, 20 Feb 2024 11:53:47 -0800
Message-ID: <20240220195348.1270854-2-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220195348.1270854-1-quic_abhinavk@quicinc.com>
References: <20240220195348.1270854-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -kJVHc1oYzxBTxEza_WBzv1l8isSsmoE
X-Proofpoint-GUID: -kJVHc1oYzxBTxEza_WBzv1l8isSsmoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200142
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

Currently the size parameter of drm_dp_vsc_sdp_pack() is always
the size of struct dp_sdp. Hence lets drop this parameter and
use sizeof() directly.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++------
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +--
 include/drm/display/drm_dp_helper.h     | 3 +--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6c91f400ecb1..10ee82e34de7 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2918,19 +2918,15 @@ EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
  * @vsc: vsc sdp initialized according to its purpose as defined in
  *       table 2-118 - table 2-120 in DP 1.4a specification
  * @sdp: valid handle to the generic dp_sdp which will be packed
- * @size: valid size of the passed sdp handle
  *
  * Returns length of sdp on success and error code on failure
  */
 ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
-			    struct dp_sdp *sdp, size_t size)
+			    struct dp_sdp *sdp)
 {
 	size_t length = sizeof(struct dp_sdp);
 
-	if (size < length)
-		return -ENOSPC;
-
-	memset(sdp, 0, size);
+	memset(sdp, 0, sizeof(struct dp_sdp));
 
 	/*
 	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a9458df475e2..e13121dc3a03 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4181,8 +4181,7 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
 
 	switch (type) {
 	case DP_SDP_VSC:
-		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
-					  sizeof(sdp));
+		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp);
 		break;
 	case HDMI_PACKET_TYPE_GAMUT_METADATA:
 		len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8474504d4c88..1f41994796d3 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -812,7 +812,6 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
 		       int bpp_x16, unsigned long flags);
 int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 
-ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
-			    struct dp_sdp *sdp, size_t size);
+ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
 
 #endif /* _DRM_DP_HELPER_H_ */
-- 
2.34.1

