Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942738464E8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 01:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4345910E89E;
	Fri,  2 Feb 2024 00:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mEuP9xES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0D210E89E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 00:10:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 411MYTkk027656; Fri, 2 Feb 2024 00:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=VbL
 Ote3MFtajwZ7n5285TiGBa5qns5AxuRjAufmtKpI=; b=mEuP9xESAVkYf6OCuFV
 mqUHCs1pC78kR7tLJPkMZa7mLdu5/w2FdWBcysgoI/0BJm6gXoa/q/FifaWIyVVN
 UdGkYJG2EaSyXeJ27Fs5g+6wS0oeB3p15V+PhOY13i1+w0TnixLQqrNg7+oIKxM1
 MtIiiCzDALvwg0Nd5ieBGDBU1j3Ad8wr01fj9N5brKjeAstrTIyQ+l9NkYsDACYs
 acJj2UXCFhvb1FCffPEfIky28W4JY1uwMj5jZV2mBUdm14vztSZqJigtfJn1/7vj
 Mp2KrBJxcrqe+ywCb5IkBwnuFUCHiKuz6nARa/BxmvPXA1LBaQfdOTNyrkSAgTLq
 Wjw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0m6yr80q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 00:10:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4120ARfs001811
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 00:10:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 1 Feb 2024 16:10:27 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 1 Feb 2024 16:10:15 -0800
Subject: [PATCH v2] drm/panel: visionox-vtdr6130: Set prepare_prev_first flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240201-visionox-vtdr-prev-first-v2-1-32db52867624@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOYyvGUC/3WNMQ7CMAxFr1J5xihJCxVM3AN1KI5LPdBAEqKiK
 ncnFFbG5+///gKBvXCAY7WA5yRB3FTAbCqgsZ+ujGILg1GmVq1u8fviZkzReryXDg7iQ0RWqmd
 lmOkwQKmXaJB5VZ+7wqOE6PxrXUr6c/1Jze6/NGnUWF+oaYiptbQ/PZ5CMtGW3A26nPMbDnu66
 MIAAAA=
To: <quic_abhinavk@quicinc.com>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <quic_parellan@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.13-dev-2d940
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706832627; l=1892;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=oSugeVUiRO1IiMt6Ita7KviMhoi4orEYII2dW/trClE=;
 b=AwxIdw86VDWNgXc3wjMmBtu21IgQbIEY90HbrEMQdifIr5I/Xtx5dOAL5yC4Qpb6x3YZT1w+c
 7XJsBN/0y2tClxXyqy3jmkyYF4vIK8NXB3Kod87X9OcNPIpWh0bP+eu
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SfIuagOzIEyGjAUZWXKwHCSMESuAx8EW
X-Proofpoint-ORIG-GUID: SfIuagOzIEyGjAUZWXKwHCSMESuAx8EW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_09,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010186
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

The DSI host must be enabled for the panel to be initialized in
prepare(). Set the prepare_prev_first flag to guarantee this.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: quic_abhinavk@quicinc.com
Cc: quic_parellan@quicinc.com
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Changes in v2:
- Corrected commit message to mention that DCS on commands are sent during
  prepare() instead of probe()
- Dropped Fixes tag
- Rebased onto tip of linux-next
- Link to v1: https://lore.kernel.org/r/20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index a23407b9f6fb6..540099253e1bd 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -287,6 +287,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);

---
base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

