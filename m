Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7283376D688
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996B110E55D;
	Wed,  2 Aug 2023 18:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247C210E1AC;
 Wed,  2 Aug 2023 18:09:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372AIMp7021128; Wed, 2 Aug 2023 18:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=Zg/+5tVh8Qrox2O4PVKE75DQvm4lUmYBc1zOUE28qEk=;
 b=FVzVYBwk5rNbJ3A/ZQ3ZsarWgs8XfbeVGHDIpCwt5YP3v+HXU5AjBwP81PKVc0woh9T5
 EA/RdXoJCp2Vo5ovh7ydSqAfTbUhV/EYQ6j2dCW1Y9yiaIgRsbWr9dMZycMHEl59LiBp
 /4hJifepBK9cnk9vyrj+zVk09NXu4GnHnaBpdGAb+AVTefVSBKItWixAJ+uyF2vlVDNH
 hrOCnuskDgATyqb6NmeDczJtN4jx34kwRdaXIX17JKPKVzdke60SuN692jMwLaMCrUX6
 kEpwdLwlDnI6hIU3CI3sEoDQ0B+WVASlSd2kaz9UL90aT+fsHb6tgN4A7effgLxvAdOQ xQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7bp6acxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 18:09:09 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372I98LK025333
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 18:09:08 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 11:09:08 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 2 Aug 2023 11:08:51 -0700
Subject: [PATCH v3 4/4] drm/msm/dsi: Enable widebus for DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230802-add-widebus-support-v3-4-2661706be001@quicinc.com>
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690999747; l=4367;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=DXCvyanWZlBEzFDdQcRaAJkq+qVMaJpptR/l3i1PuUI=;
 b=8dRGerBAGh8W1OK/vYWsmvtS5zNTidozakMWR2l7sXgxAgSOgu82Pth/SbMq5d8XVVXBXdePz
 okcVJesK4B6BIQVoTs1SbhaQqOJeWojKYJCTO8QOJOp6OwJroNpJW06
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ri23xspvVR3ZG2haC3tze4TQKb5ZVQ4F
X-Proofpoint-ORIG-GUID: Ri23xspvVR3ZG2haC3tze4TQKb5ZVQ4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_13,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=826 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020160
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
48 bits of compressed data instead of 24.

Enable this mode whenever DSC is enabled for supported chipsets.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi.c      |  5 +++++
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 30 ++++++++++++++++++++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index baab79ab6e74..4fa738dea680 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -17,6 +17,11 @@ struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 	return msm_dsi_host_get_dsc_config(msm_dsi->host);
 }
 
+bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
+{
+	return msm_dsi_host_is_widebus_enabled(msm_dsi->host);
+}
+
 static int dsi_get_phy(struct msm_dsi *msm_dsi)
 {
 	struct platform_device *pdev = msm_dsi->pdev;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index bd3763a5d723..a557d2c1aaff 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
 void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
 struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
+bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host);
 
 /* dsi phy */
 struct msm_dsi_phy;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 645927214871..231b02e5ab6e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -710,6 +710,14 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
 	dsi_write(msm_host, REG_DSI_CTRL, 0);
 }
 
+bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	return msm_host->dsc && (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
+			msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
+}
+
 static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
 {
@@ -753,10 +761,16 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
 		dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
 
-		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
-		    msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
+		if (cfg_hnd->major == MSM_DSI_VER_MAJOR_6G) {
 			data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
-			data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
+
+			if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
+				data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
+
+			/* TODO: Allow for video-mode support once tested/fixed */
+			if (msm_dsi_host_is_widebus_enabled(&msm_host->base))
+				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
+
 			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
 		}
 	}
@@ -894,6 +908,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	u32 hdisplay = mode->hdisplay;
 	u32 wc;
 	int ret;
+	bool widebus_enabled = msm_dsi_host_is_widebus_enabled(&msm_host->base);
 
 	DBG("");
 
@@ -914,6 +929,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	if (msm_host->dsc) {
 		struct drm_dsc_config *dsc = msm_host->dsc;
+		u32 bytes_per_pclk;
 
 		/* update dsc params with timing params */
 		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
@@ -937,7 +953,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * pulse width same
 		 */
 		h_total -= hdisplay;
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
+		if (widebus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
+			bytes_per_pclk = 6;
+		else
+			bytes_per_pclk = 3;
+
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
+
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
 	}

-- 
2.41.0

