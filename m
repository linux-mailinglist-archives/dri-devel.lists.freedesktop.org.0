Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D7762718
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 00:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CF310E1C5;
	Tue, 25 Jul 2023 22:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A7E10E1C5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 22:56:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36PKSxOO012803; Tue, 25 Jul 2023 22:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=kXeSvc/pBCJtDY6N3Vy51xOntwEBIbcJYgcTa5zaUpo=;
 b=jeNggVRFTprgAM42OZ3Oc2OiWXjb0QCsxCXo5wFusVQ+7uybd7ZrgNw/y4G2FzGs4B7J
 /rr7/Sk/CsXl1wTKoeLEKN2X5bs5uLY2i77EPySOUqz+yK6W2Oww1p6MO25TPGfuM4Tz
 gX+n5+JTPpCzvVGIKp1Cmh+kyqQgt4c7Gs8dBvWuamiv/kIUPwHa8emKQab2Hr8crv/d
 bM3uHaJEnqYhKgSeiayzJxhH83Mhs1ihhg+LhEe3lt6z4aFgBjjmn8Qlsw8t4kK9X4aB
 6cuWU20RB/DHbe6T44tT2tvw97TA48XT2phlOYH4YMoEjrZ+9c3crc+E/8flmoPYg2y0 nQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2cf8sns2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jul 2023 22:56:50 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PMunPh023660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jul 2023 22:56:49 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 15:56:49 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 25 Jul 2023 15:56:10 -0700
Subject: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAlTwGQC/yWMQQqAMAwEv1JyNhDroehXxEOxqebSSitFEP9u0
 OMwO3tD5SJcYTI3FG5SJSeFvjOw7j5tjBKUwZIdyPUO/0m+sJ2h4KENRin1RCbyTJZ5HSNorir
 K9V3Py/O8+tm27moAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690325809; l=1447;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=9YR1boiH0DL52JXr4EkJHuqgqFlfqZLkMULICe5OCyM=;
 b=hcRgpCVfcar7QOWXMBvyY7Yw9VoTburoQK8DnjPWuIEsbD+pNMJL2gLrkzDItGJ3TNv67NTmt
 dIbYXiM2OU/DxzD6XXB/umys7aMNIkn7QBfwJ7QWyMrj6aFCroGaSAF
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ofFFmZ7e3rCEAiqLVxYJgeLK-fdwikNA
X-Proofpoint-GUID: ofFFmZ7e3rCEAiqLVxYJgeLK-fdwikNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_12,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=867
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250195
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
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, quic_parellan@quicinc.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a recent introduction of the pre_enable_prev_first bridge flag [1],
the panel driver will be probed before the DSI is enabled, causing the
DCS commands to fail to send.

Ensure that DSI is enabled before panel probe by setting the
prepare_prev_first flag for the panel.

[1] commit 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")

Fixes: 2349183d32d8 ("drm/panel: add visionox vtdr6130 DSI panel driver")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index bb0dfd86ea67..e1363e128e7e 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -296,6 +296,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);

---
base-commit: 28a5c036b05fc5c935cc72d76abd3589825ea9cd
change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

