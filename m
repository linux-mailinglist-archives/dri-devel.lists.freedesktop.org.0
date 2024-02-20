Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5FC85C539
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A3B10E552;
	Tue, 20 Feb 2024 19:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EUG9WsN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F6310E54C;
 Tue, 20 Feb 2024 19:54:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41KJDVnD002669; Tue, 20 Feb 2024 19:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=C6UbKUV
 aoigUmaHW5mDyEs2eNwERzkmF21Ru0vTfCJ8=; b=EUG9WsN12MtjoYcCPK71Z+o
 jVqWFbAKo4QJU14NzmYi+eGs7gz3Q/c0H89da+QSJVr1jbEKaCBUMU+A7BzuI1+Y
 nPz3Vd0okc/SOCD4aUZUgHx3LndtDrxZ2r0tTJtRaZYqiJjmlFxfH+XX3fe9gwwt
 41M2omm2jBoVntpMbEHWmzTFPOnFeyQbraMJhCmmyd9q8mRBxvyPWZWsH5/R/Y3Q
 ASoEpnHF5Q9kDVgeUIzqOqe9IRuO+s8NyN05UsYG+IiTZ2Fei2/AX23HZJ7MAZwG
 KHRFDEOiw4PXsKWX41X4rfNpGMu0DGsU5gf1bNhP8b+si7ydLJEA/CTU+KMPAzA=
 =
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21s02t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:53:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KJrwk2030554
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 19:53:58 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 20 Feb 2024 11:53:57 -0800
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
 <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 1/2] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
Date: Tue, 20 Feb 2024 11:53:46 -0800
Message-ID: <20240220195348.1270854-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kVVNcvwvQwHPDp93LURhgKT9OwU_OzPu
X-Proofpoint-GUID: kVVNcvwvQwHPDp93LURhgKT9OwU_OzPu
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

intel_dp_vsc_sdp_pack() can be re-used by other DRM drivers as well.
Lets move this to drm_dp_helper to achieve this.

changes in v2:
	- rebased on top of drm-tip

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 78 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 71 +---------------------
 include/drm/display/drm_dp_helper.h     |  3 +
 3 files changed, 83 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 8d6ce46471ae..6c91f400ecb1 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2913,6 +2913,84 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
 }
 EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
 
+/**
+ * drm_dp_vsc_sdp_pack() - pack a given vsc sdp into generic dp_sdp
+ * @vsc: vsc sdp initialized according to its purpose as defined in
+ *       table 2-118 - table 2-120 in DP 1.4a specification
+ * @sdp: valid handle to the generic dp_sdp which will be packed
+ * @size: valid size of the passed sdp handle
+ *
+ * Returns length of sdp on success and error code on failure
+ */
+ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
+			    struct dp_sdp *sdp, size_t size)
+{
+	size_t length = sizeof(struct dp_sdp);
+
+	if (size < length)
+		return -ENOSPC;
+
+	memset(sdp, 0, size);
+
+	/*
+	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
+	 * VSC SDP Header Bytes
+	 */
+	sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
+	sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
+	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
+	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
+
+	if (vsc->revision == 0x6) {
+		sdp->db[0] = 1;
+		sdp->db[3] = 1;
+	}
+
+	/*
+	 * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
+	 * Format as per DP 1.4a spec and DP 2.0 respectively.
+	 */
+	if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
+		goto out;
+
+	/* VSC SDP Payload for DB16 through DB18 */
+	/* Pixel Encoding and Colorimetry Formats  */
+	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
+	sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
+
+	switch (vsc->bpc) {
+	case 6:
+		/* 6bpc: 0x0 */
+		break;
+	case 8:
+		sdp->db[17] = 0x1; /* DB17[3:0] */
+		break;
+	case 10:
+		sdp->db[17] = 0x2;
+		break;
+	case 12:
+		sdp->db[17] = 0x3;
+		break;
+	case 16:
+		sdp->db[17] = 0x4;
+		break;
+	default:
+		WARN(1, "Missing case %d\n", vsc->bpc);
+		return -EINVAL;
+	}
+
+	/* Dynamic Range and Component Bit Depth */
+	if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
+		sdp->db[17] |= 0x80;  /* DB17[7] */
+
+	/* Content Type */
+	sdp->db[18] = vsc->content_type & 0x7;
+
+out:
+	return length;
+}
+EXPORT_SYMBOL(drm_dp_vsc_sdp_pack);
+
 /**
  * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
  * @dpcd: DisplayPort configuration data
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 217196196e50..a9458df475e2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4089,73 +4089,6 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 	return false;
 }
 
-static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
-				     struct dp_sdp *sdp, size_t size)
-{
-	size_t length = sizeof(struct dp_sdp);
-
-	if (size < length)
-		return -ENOSPC;
-
-	memset(sdp, 0, size);
-
-	/*
-	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
-	 * VSC SDP Header Bytes
-	 */
-	sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
-	sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
-	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
-	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
-
-	if (vsc->revision == 0x6) {
-		sdp->db[0] = 1;
-		sdp->db[3] = 1;
-	}
-
-	/*
-	 * Revision 0x5 and revision 0x7 supports Pixel Encoding/Colorimetry
-	 * Format as per DP 1.4a spec and DP 2.0 respectively.
-	 */
-	if (!(vsc->revision == 0x5 || vsc->revision == 0x7))
-		goto out;
-
-	/* VSC SDP Payload for DB16 through DB18 */
-	/* Pixel Encoding and Colorimetry Formats  */
-	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
-	sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
-
-	switch (vsc->bpc) {
-	case 6:
-		/* 6bpc: 0x0 */
-		break;
-	case 8:
-		sdp->db[17] = 0x1; /* DB17[3:0] */
-		break;
-	case 10:
-		sdp->db[17] = 0x2;
-		break;
-	case 12:
-		sdp->db[17] = 0x3;
-		break;
-	case 16:
-		sdp->db[17] = 0x4;
-		break;
-	default:
-		MISSING_CASE(vsc->bpc);
-		break;
-	}
-	/* Dynamic Range and Component Bit Depth */
-	if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
-		sdp->db[17] |= 0x80;  /* DB17[7] */
-
-	/* Content Type */
-	sdp->db[18] = vsc->content_type & 0x7;
-
-out:
-	return length;
-}
-
 static ssize_t
 intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
 					 const struct hdmi_drm_infoframe *drm_infoframe,
@@ -4248,8 +4181,8 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
 
 	switch (type) {
 	case DP_SDP_VSC:
-		len = intel_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
-					    sizeof(sdp));
+		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
+					  sizeof(sdp));
 		break;
 	case HDMI_PACKET_TYPE_GAMUT_METADATA:
 		len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d02014a87f12..8474504d4c88 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -812,4 +812,7 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
 		       int bpp_x16, unsigned long flags);
 int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
 
+ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
+			    struct dp_sdp *sdp, size_t size);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
2.34.1

