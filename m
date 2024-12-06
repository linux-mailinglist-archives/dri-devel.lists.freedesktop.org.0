Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38F9E65BD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B935010EFFB;
	Fri,  6 Dec 2024 04:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QNQwzsi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D203510F00C;
 Fri,  6 Dec 2024 04:33:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaosY031775;
 Fri, 6 Dec 2024 04:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sHhPrZC4fwH9JnzLdLuC3GOU3TmlXWYio2FxTvHV/ZA=; b=QNQwzsi195jBOID7
 SObJNO5CBU+cSgvOXdEXsi7UkzBORIaDhyN+81TdB26vT1qkxxfngSrds08SQ7e3
 PGqxK5fC28PrQxlhWlVwQABEpdl14Z8f1b30Q/C+KVbiGbqplmVVxFGCZAvZHicw
 kfFeyEeGaRkgXX+l4jrlNKNWUM1w5TJgWrPv+hfH9YYNf1Genzr7/6zDKU8RwNp8
 efAmPTNDkAPSkIYf7yapljwG/IjF2Jz5G+nr/T2MH692634tw3uVANYMNrc3692q
 y99phLLRE2fisROgTuNEu59BkyRv8jFWBmQgCS/3quWHH+DyivfGA9joKNO0TKj5
 imTyNg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be171vmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wiuv006116
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:44 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:43 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:05 -0800
Subject: [PATCH 34/45] drm/msm/dp: add support to re-use and clear the
 panel edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-34-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3144;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=Duteyo4dprnKFdoQfs41gAv1uMhk2yO4HwSHbTQpa7I=;
 b=LNr86Ohre93aRS54RJGHZLUurk9G2lBm3vx/D3bPwJKkBM8sSikF8K1Ov9+xLV3k3vQKUBOfu
 9S8hblV1L8fAR2zzxHESzSBkhXHqigkWe1jU3CPyNnZzdFVQ1tSShjz
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZUdApP4mgfjxlo-6QdpilWKLpNb-dIKw
X-Proofpoint-ORIG-GUID: ZUdApP4mgfjxlo-6QdpilWKLpNb-dIKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
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

During certain cases, the dp mst connector's panel edid can be
re-used such as getting multiple get_modes() without irq_hpd and
should be cleared in cases when the connector is destroyed or when
irq hpd is received. Add support to handle these cases for the
mst_connector's panel edid.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 2d92084586b466d4953429e8a6fbf766d081cb9f..15c61fd37c418889074222c0f576778adadf51c9 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -559,6 +559,34 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
 										&bridge->obj));
 }
 
+static void msm_dp_mst_clear_panel_edid(struct msm_dp *dp_display)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct msm_dp_mst_connector *mst_conn;
+	struct msm_dp_panel *dp_panel;
+	struct msm_dp_mst_bridge *dp_bridge;
+	int i;
+
+	if (!dp_display) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	for (i = 0; i < mst->max_streams; i++) {
+		dp_bridge = &mst->mst_bridge[i];
+		mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
+		dp_panel = dp_bridge->msm_dp_panel;
+
+		if (!dp_panel || !mst_conn || !mst_conn->mst_port)
+			continue;
+
+		if (dp_panel->drm_edid) {
+			drm_edid_free(dp_panel->drm_edid);
+			dp_panel->drm_edid = NULL;
+		}
+	}
+}
+
 /* DP MST HPD IRQ callback */
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 {
@@ -585,6 +613,9 @@ void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 	if (handled) {
 		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
 
+		if (ack[1] & DP_UP_REQ_MSG_RDY)
+			msm_dp_mst_clear_panel_edid(dp_display);
+
 		if (rc != 1)
 			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
 
@@ -620,6 +651,9 @@ static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
 	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
 	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
 
+	if (dp_panel->drm_edid)
+		goto duplicate_edid;
+
 	drm_edid_free(dp_panel->drm_edid);
 
 	dp_panel->drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
@@ -628,6 +662,7 @@ static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
 		return -EINVAL;
 	}
 
+duplicate_edid:
 	drm_edid_connector_update(connector, dp_panel->drm_edid);
 
 	return drm_edid_connector_add_modes(connector);
@@ -894,6 +929,10 @@ static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
 static void dp_mst_connector_destroy(struct drm_connector *connector)
 {
 	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
+
+	drm_edid_free(dp_panel->drm_edid);
+	dp_panel->drm_edid = NULL;
 
 	drm_connector_cleanup(connector);
 	drm_dp_mst_put_port_malloc(mst_conn->mst_port);

-- 
2.34.1

