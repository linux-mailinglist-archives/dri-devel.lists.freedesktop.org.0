Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14DAD1D5C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8B610E2DD;
	Mon,  9 Jun 2025 12:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZKHZpphe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1CD10E2C5;
 Mon,  9 Jun 2025 12:24:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599S2cP013230;
 Mon, 9 Jun 2025 12:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kcU9QsPDQZdPMkhCy7HhfjqYkVXAOBehD/e2FuBhUak=; b=ZKHZpphePRwKkz6v
 GJYepG9tQCvKHXpm/WqVk3fPTzpDnQnqGBWVXZfH6ZiWO3vMldm5uv+eLVhixWIE
 wxVbzEm+w+2i6LU88M12eGUB80yxi9OuvDxYRSTM2sLRYVus+f01dhmnJBA3S28U
 nQrGPEx8CTLfUfGot+HyELwQNBQIBHRpVvtbQhJdv+UHHn8esDQqkLUoaFHxWL/e
 snU3+uk14YLsKJXZebWjFB67dD7dJY55/QtpISfevR0pCHiksm/RL0JEo/g00XDG
 n+2rEIk6Yx7uYJncat02OMXrnQD/os6y6UDZqzEkZwC3w0YSJvGINmkiGqATGenb
 je4c+w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11x5ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COG4B005332
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:17 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:13 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:42 +0800
Subject: [PATCH v2 23/38] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-23-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471759; l=6040;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=v9e2e/t7HIFqYqkfCw7ZlqLRQ6w8QnepovMiR9c0Z/g=;
 b=73rMDeyzkFhs1UWRAZWLbHMfvTv9l294j+/lGQhUlRhuiY80ItYCp9JbBX9nr4096snS504fC
 79u92YEM2s0BNC1vvkSFrYuxrflbiK1h7QBB9JBydNFqYmcJVX0vvzE
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xqtD7bMAQyISaUSgVuz7c7haw8UUgR1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXxUygNnarLzLA
 /ixgRv1d4hd/LKEc07elqBwayii91tdi3N29Z8YfA9NIgnrC3UGUyWWvR9SGQhXDNdb4h/UgREx
 mAKlttrC71+n4X+J9upCG5uDdquhg/xWYMVDtZfA4BMzHSPsefNaTKqwYOnahupTb0Bmz4BeWm7
 lCP/vorrN1K22X5wasIL81uSzz3kwGXsfPuIkhfbtC6wPeGuHCs2/OAn4f4a3D4QFm1EHq1cnzG
 Sp/pfqIg60pfbzBcrHbMeWPi39JjdZ4c11TQP/8YqkEzaDFzXZmvvKxMyjSt9gJ2RXZSP1yuvJq
 BR5Q4PVnubLO8WWtey+lVKoRL9GUMB6Ls/Zghs+86NFfZ6YRco2Uf3jpgqREoC5tGBn5Y34aVYJ
 olxDtyiv8lDy4dIEDQ7bP7iZlq8BxQnWIOcX1TvGBh9XpPN9oTK+8xulLz5lfa3bWgVDVSxM
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846d271 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=lmhbXlLoFyfqOq6R55gA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xqtD7bMAQyISaUSgVuz7c7haw8UUgR1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For DP MST, the link clock and power domain resources stay on until
both streams have been disabled OR we receive hotplug. Introduce an
active_stream_cnt to track the number of active streams and necessary
state handling. Replace the power_on variable with active_stream_cnt
as power_on boolean works only for a single stream.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
 3 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index f8bfb908f9b4bf93ad5480f0785e3aed23dde160..ba9ec1fb7c4d70d0f544fe5876d57290aab6e2c9 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -192,7 +192,7 @@ int msm_dp_audio_prepare(struct drm_connector *connector,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display_get_active_stream_cnt(msm_dp_display)) {
 		rc = -EINVAL;
 		goto end;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ea6113d1138b382f69d726cb16ceb04d82cbbe3b..5c8b38babc778f3575ab26ae4238b5f9fdb65b51 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -111,6 +111,8 @@ struct msm_dp_display_private {
 
 	bool wide_bus_supported;
 
+	u32 active_stream_cnt;
+
 	struct msm_dp_audio *audio;
 	int max_stream;
 };
@@ -189,6 +191,15 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{}
 };
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp)
+{
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_display->active_stream_cnt;
+}
+
 static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
@@ -679,7 +690,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (!dp->msm_dp_display.power_on) {
+	if (!dp->active_stream_cnt) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;
@@ -854,7 +865,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 		return rc;
 	}
 
-	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
+	if (dp->hpd_state == ST_CONNECTED && !dp->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
 	}
@@ -870,17 +881,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
-	if (!rc)
-		msm_dp_display->power_on = true;
 
 	return rc;
 }
@@ -927,16 +931,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 				  struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
-
-	if (!msm_dp_display->power_on)
+	if (!dp->active_stream_cnt)
 		return 0;
 
 	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
 
-	msm_dp_display->power_on = false;
+	dp->active_stream_cnt--;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
@@ -1076,7 +1078,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 */
 	mutex_lock(&msm_dp_display->event_mutex);
 
-	if (!dp->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}
@@ -1608,6 +1610,8 @@ void msm_dp_display_enable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp
 		}
 	}
 
+	msm_dp_display->active_stream_cnt++;
+
 	/* completed connection */
 	msm_dp_display->hpd_state = ST_CONNECTED;
 
@@ -1632,6 +1636,11 @@ void msm_dp_display_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_d
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "no active streams\n");
+		return;
+	}
+
 	if (msm_dp_display->mst_supported)
 		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_panel);
 	else
@@ -1664,6 +1673,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp)
 		return;
 	}
 
+	if (msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(msm_dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (msm_dp_display->link->sink_count == 0)
 		msm_dp_ctrl_psm_config(msm_dp_display->ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0b73087cbc421b4d2b895033f17892189ef68cb2..7b0efa342aaf878f3ae7315cb55902bf8bdcb6b9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,7 +18,6 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	bool link_ready;
 	bool audio_enabled;
-	bool power_on;
 	bool prepared;
 	bool mst_active;
 	unsigned int connector_type;
@@ -60,4 +59,6 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp,
 
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
+int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

