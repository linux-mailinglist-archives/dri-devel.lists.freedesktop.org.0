Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C56F0EDE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 01:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0A889ABE;
	Thu, 27 Apr 2023 23:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1C389ABE;
 Thu, 27 Apr 2023 23:29:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMwcL6004359; Thu, 27 Apr 2023 23:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=5kEkzm/Fdi8JwRfvv0vFfyC8vMN37mDp9oao13+HLu0=;
 b=FzeII4UQUZkdJneEBzae56WquO1X97Jg2Pskgl4WDBx1rrTL6wl3eDjX+LDiUuOVCC79
 Sm2S9Stqo7eFpHyImYgvq/jqM99hvu+nUJxDSleCvSSe4cDMm60fsHD1VAflMXeh0kWG
 KEtZ07lVUZiPFHStSj0LQcHR34zDeyQln5KH6ArxWsfX8nmCPah3BNw0aN/QpmW/U2UD
 3njtVQ7/fXesM+lYefciLXDCdR0OZ0PgfIRbIdTOlgrBr1yzSRi7vwb5OePzCgdD4Y72
 psci9qzI994734+glg2iTgiO6CBECW5Njg9ICNdTFssVCCygN5YuHBCKMtUaBicU+PhW Uw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7xdy8ecw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:29:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33RNTMLN024187
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:29:22 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 27 Apr 2023 16:29:21 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm/dp: add module parameter for PSR
Date: Thu, 27 Apr 2023 16:28:47 -0700
Message-ID: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WmEtTQI4ibO6GxJNkOb8YIrrAFMG5Zhv
X-Proofpoint-ORIG-GUID: WmEtTQI4ibO6GxJNkOb8YIrrAFMG5Zhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270207
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On sc7280 where eDP is the primary display, PSR is causing
IGT breakage even for basic test cases like kms_atomic and
kms_atomic_transition. Most often the issue starts with below
stack so providing that as reference

Call trace:
 dpu_encoder_assign_crtc+0x64/0x6c
 dpu_crtc_enable+0x188/0x204
 drm_atomic_helper_commit_modeset_enables+0xc0/0x274
 msm_atomic_commit_tail+0x1a8/0x68c
 commit_tail+0xb0/0x160
 drm_atomic_helper_commit+0x11c/0x124
 drm_atomic_commit+0xb0/0xdc
 drm_atomic_connector_commit_dpms+0xf4/0x110
 drm_mode_obj_set_property_ioctl+0x16c/0x3b0
 drm_connector_property_set_ioctl+0x4c/0x74
 drm_ioctl_kernel+0xec/0x15c
 drm_ioctl+0x264/0x408
 __arm64_sys_ioctl+0x9c/0xd4
 invoke_syscall+0x4c/0x110
 el0_svc_common+0x94/0xfc
 do_el0_svc+0x3c/0xb0
 el0_svc+0x2c/0x7c
 el0t_64_sync_handler+0x48/0x114
 el0t_64_sync+0x190/0x194
---[ end trace 0000000000000000 ]---
[drm-dp] dp_ctrl_push_idle: PUSH_IDLE pattern timedout

Other basic use-cases still seem to work fine hence add a
a module parameter to allow toggling psr enable/disable till
PSR related issues are hashed out with IGT.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 628b0e248db6..dba43167de66 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -28,6 +28,10 @@
 #include "dp_audio.h"
 #include "dp_debug.h"
 
+static bool psr_enabled = false;
+module_param(psr_enabled, bool, 0);
+MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
+
 #define HPD_STRING_SIZE 30
 
 enum {
@@ -407,7 +411,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	edid = dp->panel->edid;
 
-	dp->dp_display.psr_supported = dp->panel->psr_cap.version;
+	dp->dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
-- 
2.40.1

