Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D55B3DCE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED2810E0E3;
	Fri,  9 Sep 2022 17:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CE710E0E3;
 Fri,  9 Sep 2022 17:16:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289EjNd4002070;
 Fri, 9 Sep 2022 17:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Ic3WaKhlmQlNohswPAMHE7FNT2PwFLCSIqYFvTWFuhU=;
 b=UynpZaOeF3oIIlj2f7SLWJPL+9f4wnwUL20CPJ//EPlfba2TuWGVNJfr/izp5K0/E+K1
 3y9CeUns7y2lZEcKleY3wb/abPvYPSUy1bklbFpdCRcU4gX4gGIzwzEY78y51rH2rLaK
 SmcV8zyeIu5RIrccIsdNfNlr6kw6iuIIbRQ3r5L5XS5APc70lu/KTTGJVFcZtiIUhJeh
 O0u0e+qvWuBfDl/+0VNy3BO55ey2NBm4W2GnrUHYOTF31uTH8xJ0EgpT8JbqCev+DtXN
 ETn4fV8IM4E6onuwIJZbjFPahLGbDE1yvDlmnTP9FGc7tjZ5FQMFfRF2h9vb1e3zLDJu nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jg3c21f3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 17:16:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 289HGhUD030628
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Sep 2022 17:16:43 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 9 Sep 2022 10:16:42 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2] drm/msm/dp: add atomic_check to bridge ops
Date: Fri, 9 Sep 2022 10:16:35 -0700
Message-ID: <1662743795-30438-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: k6g5wZ_NVYARlW2qsftIcW7-ekDmY5gN
X-Proofpoint-ORIG-GUID: k6g5wZ_NVYARlW2qsftIcW7-ekDmY5gN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090061
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
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM commit_tails() will disable downstream crtc/encoder/bridge if
both disable crtc is required and crtc->active is set before pushing
a new frame downstream.

There is a rare case that user space display manager issue an extra
screen update immediately followed by close DRM device while down
stream display interface is disabled. This extra screen update will
timeout due to the downstream interface is disabled but will cause
crtc->active be set. Hence the followed commit_tails() called by
drm_release() will pass the disable downstream crtc/encoder/bridge
conditions checking even downstream interface is disabled.
This cause the crash to happen at dp_bridge_disable() due to it trying
to access the main link register to push the idle pattern out while main
link clocks is disabled.

This patch adds atomic_check to prevent the extra frame will not
be pushed down if display interface is down so that crtc->active
will not be set neither. This will fail the conditions checking
of disabling down stream crtc/encoder/bridge which prevent
drm_release() from calling dp_bridge_disable() so that crash
at dp_bridge_disable() prevented.

There is no protection in the DRM framework to check if the display
pipeline has been already disabled before trying again. The only
check is the crtc_state->active but this is controlled by usermode
using UAPI. Hence if the usermode sets this and then crashes, the
driver needs to protect against double disable"

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

Changes in v2:
-- add more commit text

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Reported-by: Leonard Lausen <leonard@lausen.nl>
Suggested-by: Rob Clark <robdclark@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/17
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6df25f7..c682588 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -31,6 +31,25 @@ static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
 					connector_status_disconnected;
 }
 
+static int dp_bridge_atomic_check(struct drm_bridge *bridge,
+			    struct drm_bridge_state *bridge_state,
+			    struct drm_crtc_state *crtc_state,
+			    struct drm_connector_state *conn_state)
+{
+	struct msm_dp *dp;
+
+	dp = to_dp_bridge(bridge)->dp_display;
+
+	drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
+		(dp->is_connected) ? "true" : "false");
+
+	if (bridge->ops & DRM_BRIDGE_OP_HPD)
+		return (dp->is_connected) ? 0 : -ENOTCONN;
+
+	return 0;
+}
+
+
 /**
  * dp_bridge_get_modes - callback to add drm modes via drm_mode_probed_add()
  * @bridge: Poiner to drm bridge
@@ -61,6 +80,9 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 }
 
 static const struct drm_bridge_funcs dp_bridge_ops = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset           = drm_atomic_helper_bridge_reset,
 	.enable       = dp_bridge_enable,
 	.disable      = dp_bridge_disable,
 	.post_disable = dp_bridge_post_disable,
@@ -68,6 +90,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.mode_valid   = dp_bridge_mode_valid,
 	.get_modes    = dp_bridge_get_modes,
 	.detect       = dp_bridge_detect,
+	.atomic_check = dp_bridge_atomic_check,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

