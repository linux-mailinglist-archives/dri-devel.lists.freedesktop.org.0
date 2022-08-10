Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CEB58F2FF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 21:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297F92BB00;
	Wed, 10 Aug 2022 19:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8773814A5BF;
 Wed, 10 Aug 2022 19:26:11 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AJ2fAF009454;
 Wed, 10 Aug 2022 19:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=QRXN9BzYWPSLiDAJmspLQn15ZiL/h1lw0lJm6a2Ic+k=;
 b=ERUIjktCk84jkrZl2shBhuM9Oywox/7ILjzB8kjtsFVPjRZzGxu//TZHV12rI7/CtS4s
 7q2Uus3SHSyz64msFB26dm02N1d13b104z8RhkHYOLVxgU5VrRCFu2eehTtfHE+2tKig
 T6zh4mvXKZVmH5FOrsRThuy1QdKldpTp27KZQZo1Zvn7ilfbooojpIh+ZJF95R0Kyi6L
 VWBEldKWseDZHWsHzUnm0SCyDNLh2ZOT0cvb/uO9xnnv8bEwhbRbWrgCmiFuHrUI/PW7
 ZL/7B26KY7OgUY7L/TM0uerS5gmtgfOw4QD8YjNHI8+RIc6R0ZUAY3IgK2mavr8jv2Yk zg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwr23pur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 19:26:04 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27AJQ2Vh019356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 19:26:03 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 10 Aug 2022 12:26:02 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 10 Aug 2022 12:26:01 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v3] drm/msm/dp: check hpd_state before push idle pattern at
 dp_bridge_disable()
Date: Wed, 10 Aug 2022 12:25:51 -0700
Message-ID: <1660159551-13828-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QJccwxpnxr0NLiT3POONYcw1jbSwkiXS
X-Proofpoint-ORIG-GUID: QJccwxpnxr0NLiT3POONYcw1jbSwkiXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_12,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 mlxlogscore=897 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100059
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp_bridge_disable() is the first step toward tearing down main link.
Its major function is to start transmitting idle pattern to replace
video stream. This patch will check hpd_state to make sure main link
is enabled before commit changes of main link's configuration to
push idle pattern out to avoid system crashing due to main link clock
is disabled while access main link registers.

SError Interrupt on CPU7, code 0x00000000be000411 -- SError
CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
Hardware name: Google Lazor (rev3 - 8) (DT)
pstate: a04000c9 (NzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __cmpxchg_case_acq_32+0x14/0x2c
lr : do_raw_spin_lock+0xa4/0xdc
sp : ffffffc01092b6a0
x29: ffffffc01092b6a0 x28: 0000000000000028 x27: 0000000000000038
x26: 0000000000000004 x25: ffffffd2973dce48 x24: 0000000000000000
x23: 00000000ffffffff x22: 00000000ffffffff x21: ffffffd2978d0008
x20: ffffffd2978d0008 x19: ffffff80ff759fc0 x18: 0000000000000000
x17: 004800a501260460 x16: 0441043b04600438 x15: 04380000089807d0
x14: 07b0089807800780 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000438 x10: 00000000000007d0 x9 : ffffffd2973e09e4
x8 : ffffff8092d53300 x7 : ffffff808902e8b8 x6 : 0000000000000001
x5 : ffffff808902e880 x4 : 0000000000000000 x3 : ffffff80ff759fc0
x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffffff80ff759fc0
Kernel panic - not syncing: Asynchronous SError Interrupt
CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
Hardware name: Google Lazor (rev3 - 8) (DT)
Call trace:
 dump_backtrace.part.0+0xbc/0xe4
 show_stack+0x24/0x70
 dump_stack_lvl+0x68/0x84
 dump_stack+0x18/0x34
 panic+0x14c/0x32c
 nmi_panic+0x58/0x7c
 arm64_serror_panic+0x78/0x84
 do_serror+0x40/0x64
 el1h_64_error_handler+0x30/0x48
 el1h_64_error+0x68/0x6c
 __cmpxchg_case_acq_32+0x14/0x2c
 _raw_spin_lock_irqsave+0x38/0x4c
 lock_timer_base+0x40/0x78
 __mod_timer+0xf4/0x25c
 schedule_timeout+0xd4/0xfc
 __wait_for_common+0xac/0x140
 wait_for_completion_timeout+0x2c/0x54
 dp_ctrl_push_idle+0x40/0x88
 dp_bridge_disable+0x24/0x30
 drm_atomic_bridge_chain_disable+0x90/0xbc
 drm_atomic_helper_commit_modeset_disables+0x198/0x444
 msm_atomic_commit_tail+0x1d0/0x374
 commit_tail+0x80/0x108
 drm_atomic_helper_commit+0x118/0x11c
 drm_atomic_commit+0xb4/0xe0
 drm_client_modeset_commit_atomic+0x184/0x224
 drm_client_modeset_commit_locked+0x58/0x160
 drm_client_modeset_commit+0x3c/0x64
 __drm_fb_helper_restore_fbdev_mode_unlocked+0x98/0xac
 drm_fb_helper_set_par+0x74/0x80
 drm_fb_helper_hotplug_event+0xdc/0xe0
 __drm_fb_helper_restore_fbdev_mode_unlocked+0x7c/0xac
 drm_fb_helper_restore_fbdev_mode_unlocked+0x20/0x2c
 drm_fb_helper_lastclose+0x20/0x2c
 drm_lastclose+0x44/0x6c
 drm_release+0x88/0xd4
 __fput+0x104/0x220
 ____fput+0x1c/0x28
 task_work_run+0x8c/0x100
 do_exit+0x450/0x8d0
 do_group_exit+0x40/0xac
 __wake_up_parent+0x0/0x38
 invoke_syscall+0x84/0x11c
 el0_svc_common.constprop.0+0xb8/0xe4
 do_el0_svc+0x8c/0xb8
 el0_svc+0x2c/0x54
 el0t_64_sync_handler+0x120/0x1c0
 el0t_64_sync+0x190/0x194
SMP: stopping secondary CPUs
Kernel Offset: 0x128e800000 from 0xffffffc008000000
PHYS_OFFSET: 0x80000000
CPU features: 0x800,00c2a015,19801c82
Memory Limit: none

Changes in v3:
-- correct Reported-by
-- add call stack trace

Changes in v2:
-- changes Fixes patch
-- fix eported-by
-- add Closes tag

Fixes: 375a126090b9 ("drm/msm/dp: tear down main link at unplug handle immediately")
Reported-by: Leonard Lausen <leonard@lausen.nl>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/17
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b36f8b6..678289a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1729,10 +1729,20 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
+	u32 state;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
+	mutex_lock(&dp_display->event_mutex);
+
+	state = dp_display->hpd_state;
+	if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
+		mutex_unlock(&dp_display->event_mutex);
+		return;
+	}
+
 	dp_ctrl_push_idle(dp_display->ctrl);
+	mutex_unlock(&dp_display->event_mutex);
 }
 
 void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

