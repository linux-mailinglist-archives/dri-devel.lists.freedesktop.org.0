Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F7847BCA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CED910E90F;
	Fri,  2 Feb 2024 21:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SaGn4WU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0855310E90F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:50:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412Lkb4Z000581; Fri, 2 Feb 2024 21:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=SVl
 N3fADnRzFhsjCTs1uFxfAX8KThaSYQyGegUws1dI=; b=SaGn4WU/6EnI4uRJa3L
 KhPdZHJ55LTV/V4GJrw2+zP7V8ZhSCS+n/7aIhn45hhuVWgshwwp/SsQ+r5Zi6Zj
 W0EA0VjjkDJN8TAwjwgRUfDP8necTq3y/1pWD/f3X5plC0yemlKqTErG2q9wqB9l
 6pMYCztFarGh2Y0IiBAF5B9uUcw5e827SyYfAtYVLm4qb4lL5/ywplSVZUzX8aLf
 blDCjEbFon2HSv7XD38k0d2dY8MypHaGk+3lQ2OFSJaizmaBINrA6Q4AinTbN7OX
 4leOX7OZg1c6PxxJ2LypVusInfGcoJRVhN7WgfbBdqTlAuGMhLno8djTX66mMOqC
 7Kw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0ptxjfcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 21:50:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412LoYEo014779
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 21:50:35 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 2 Feb 2024 13:50:34 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 2 Feb 2024 13:50:21 -0800
Subject: [PATCH] drm/panel: visionox-r66451: Set prepare_prev_first flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240202-visionox-r66451-prev-first-v1-1-c267dc889284@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJxjvWUC/yWMSwqAMAwFryJZG+hHU/Aq4sJP1GxUWpGCeHeDL
 of3Zm5IHIUTNMUNkS9Jsm8KtixgXPttYZRJGZxx3gQb8L/sGSNRVVs81MJZYjqRwmA8WTLsHWh
 Ap1nyF2+753kBtzhPXmwAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_abhinavk@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-2d940
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706910634; l=1137;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=j1+6smkjmxO2TPfR0I7+fbIujkXeFYIF+x2HwXzQ4SY=;
 b=a5m4w+x7U6gunqaLxXXorLqcSL4H44MRB2xTmI3wMhsVhLlYvjppnXehX45YL181M7iKIHwQ9
 vfA1I1m9l8nA8rtE+vAze9Fv9qN8bQqkukppk4CkY/J5fQrWXWTveTo
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NKhIfIUk_Z7tzlG538Iy_nmDTYgJw3ov
X-Proofpoint-GUID: NKhIfIUk_Z7tzlG538Iy_nmDTYgJw3ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_14,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=923 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020161
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

The DSI host needs to be enabled for the panel to be initialized in
prepare(). Ensure this happens by setting prepare_prev_first.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-visionox-r66451.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
index fbb73464de332..493f2a6076f8d 100644
--- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
+++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
@@ -322,6 +322,7 @@ static int visionox_r66451_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_init(&ctx->panel, dev, &visionox_r66451_funcs, DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.backlight = visionox_r66451_create_backlight(dsi);

---
base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
change-id: 20230717-visionox-r66451-prev-first-67b036160e32

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

