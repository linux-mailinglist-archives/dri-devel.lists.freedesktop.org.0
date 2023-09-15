Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69517A2858
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 22:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8135610E67E;
	Fri, 15 Sep 2023 20:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48B10E08C;
 Fri, 15 Sep 2023 20:45:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FJuHn5000812; Fri, 15 Sep 2023 20:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=TwFdUJBoBZv3Jp0TbnAsoL/CZRjAWRikLTj/EymlHiY=;
 b=pEKuRDpvlw7ZKG+NV4FuTr9/vFxVHglZM50wCiSCYqioskILmTox/6cPy5cMGVMNG10f
 0D2DBvfmD3i52lGGQCkNYu2VkvNddBXUykBuD9VYKcpNwb/iIt/PRJLyzaQp1/Ua5rHV
 yFeN10SZAbHQwcj1XvuWHZkYNDWPLQoowtmGcSbLW3ycs0BethoiUpxajA9sUH/MJXJg
 MhiveogFRtFdM0QWMN1gNEIwLRjts3ri0UFI+CAoXpz4oszFGKDat0aAqqODDggyOG6S
 ZH8Gocf9WsbGR9yzVVBu38/A+pW3gCx33GH8UZMVlIswJi8E1HsT6sKI6vZ/Lt17E5R1 7w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g2xj7ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:44:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FKiZYZ021895
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:44:35 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 13:44:35 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Hai Li <hali@codeaurora.org>
Subject: [PATCH v2] drm/msm/dsi: skip the wait for video mode done if not
 applicable
Date: Fri, 15 Sep 2023 13:44:25 -0700
Message-ID: <20230915204426.19011-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JHAsSsF9gtJJnr0se6qijXhe-eXgAngG
X-Proofpoint-ORIG-GUID: JHAsSsF9gtJJnr0se6qijXhe-eXgAngG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_17,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150186
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
Cc: quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dsi_wait4video_done() API waits for the DSI video mode engine to
become idle so that we can transmit the DCS commands in the
beginning of BLLP. However, with the current sequence, the MDP
timing engine is turned on after the panel's pre_enable() callback
which can send out the DCS commands needed to power up the panel.

During those cases, this API will always timeout and print out the
error spam leading to long bootup times and log flooding.

Fix this by checking if the DSI video engine was actually busy before
waiting for it to become idle otherwise this is a redundant wait.

changes in v2:
	- move the reg read below the video mode check
	- minor fixes in commit text

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/34
Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 0c4ec0530efc..1a2afe31fa86 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1075,9 +1075,21 @@ static void dsi_wait4video_done(struct msm_dsi_host *msm_host)
 
 static void dsi_wait4video_eng_busy(struct msm_dsi_host *msm_host)
 {
+	u32 data;
+
 	if (!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
 		return;
 
+	data = dsi_read(msm_host, REG_DSI_STATUS0);
+
+	/* if video mode engine is not busy, its because
+	 * either timing engine was not turned on or the
+	 * DSI controller has finished transmitting the video
+	 * data already, so no need to wait in those cases
+	 */
+	if (!(data & DSI_STATUS0_VIDEO_MODE_ENGINE_BUSY))
+		return;
+
 	if (msm_host->power_on && msm_host->enabled) {
 		dsi_wait4video_done(msm_host);
 		/* delay 4 ms to skip BLLP */
-- 
2.40.1

