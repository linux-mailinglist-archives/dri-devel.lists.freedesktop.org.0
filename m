Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A97740505
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 22:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFE210E058;
	Tue, 27 Jun 2023 20:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5FF10E058;
 Tue, 27 Jun 2023 20:32:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35RKIi3x027428; Tue, 27 Jun 2023 20:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=ne7sylp32AWU3brDxdrIGlLPtT42D0Gu7tWAIaqT91c=;
 b=kIHvTqwK8ZbcAKc2weMNlLOZznQ5eKjMLdc/a603iCGG2IMcgvEhh+tK49TN4PQ0eXzx
 2rp4aCcMqd5mtu71nUh57T+hDPrc2zdjs38n57a+A3UFuoGYrtDdLGkeYQag89S9FyW3
 fKwX0847kYvfgapzjDuUQHT/F4PElsqgNOrkjzLUSnkyMFhejA/ESHjb1PtcuTrnQqoB
 SccI+pjsRfAteWFL7GsmOxqem7nw436bex+l0jV1F25jDGyp2In6EUVjR6NeZtWJV8G/
 gV4IBxz0JIUom+jxkXXIonPh9iDiB/13C+2q/SUJvrObDNXU406fhuZNsdOKazOLwGTO xw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rfartbqaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jun 2023 20:32:09 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35RKW8QD012546
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jun 2023 20:32:09 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 27 Jun 2023 13:32:08 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 27 Jun 2023 13:31:45 -0700
Subject: [PATCH v2] drm/msm/dsi: Enable BURST_MODE for command mode for DSI
 6G v1.3+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADBHm2QC/32OQQ6CMBREr0K69puClKgr1x5Bw+K3/YUmttUWC
 IZwdwsHcPkm8zKzsETRUmLXYmGRJpts8BmqQ8FUj74jsDozq3h14g0/g6wBtQY5xjSAC5oAhZR
 lXfPmYpBlT2IikBG96jfz/gCXHHiaB3iNDrut845k7LzvPtvMvU1DiN/9xlRu6b/FqYQShNBGK
 oMahbh9RqusV0cVHGvXdf0BPllgmNgAAAA=
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687897928; l=1782;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=xXhjO9C0qXUFOvWLaSbYVId06hNeS0mxsLlS3R11wrg=;
 b=/uMUK4neuulHqcJn92frfJhUdDhlnCKZAGdYStDflVIzm2IkXhm3itbX4zjU0n74ggCPLZtdn
 1y2UG5j1NHMB2vWF2BL5y7LTeoCcALBubf4cTsmHH5ZlYF5tSaSdSpx
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4Fwk6gocLM0R2aMg7tMnGAchH2wtzGmI
X-Proofpoint-ORIG-GUID: 4Fwk6gocLM0R2aMg7tMnGAchH2wtzGmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306270186
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

During a frame transfer in command mode, there could be frequent
LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
if the DSI controller is running on slow clock and is throttled. To
minimize frame latency due to these transitions, it is recommended to
send the frame in a single burst.

This feature is supported for DSI 6G 1.3 and above, thus enable burst
mode if supported.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v2:
- Moved MDP_CTRL2 register setting to dsi_ctrl_config() (Dmitry/Marijn)
- Read previous value of MDP_CTRL2 register before writing to it
  (Dmitry)
- Link to v1: https://lore.kernel.org/r/20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 3f6dfb4f9d5a..cdb404885f3c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -752,6 +752,13 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 		/* Always insert DCS command */
 		data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
 		dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
+
+		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
+				msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
+			data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
+			data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
+			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
+		}
 	}
 
 	dsi_write(msm_host, REG_DSI_CMD_DMA_CTRL,

---
base-commit: a0364260213c96f6817f7e85cdce293cb743460f
change-id: 20230608-b4-add-burst-mode-a5bb144069fa

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

