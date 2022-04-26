Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECF51094B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8410E29F;
	Tue, 26 Apr 2022 19:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC0310E04A;
 Tue, 26 Apr 2022 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651002401; x=1682538401;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=hwvV40yuftcbV3vyTi9JaXKPJEHRLNAffYIMHJpqEtw=;
 b=L9WRbFHzOULnORlHNID7NMvj/PzrVqkP/E/5t+XmmlifpOtY9sjvndAm
 0G+9XpIMK8t8cIxBqym7q9Nn4falw6EZeWGPqQ8PscMVjqjKi0Z4iGGzd
 JmhsYj8dLE/OJML28NVAFnr9QEzUpz0FNFFGrODOaM0+/RsimQD5na1ky I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Apr 2022 12:46:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:46:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 12:46:39 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 12:46:39 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v3] drm/msm/dp: remove fail safe mode related code
Date: Tue, 26 Apr 2022 12:46:30 -0700
Message-ID: <1651002390-4926-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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

Current DP driver implementation has adding safe mode done at
dp_hpd_plug_handle() which is expected to be executed under event
thread context.

However there is possible circular locking happen (see blow stack trace)
after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
is executed under drm_thread context.

After review all possibilities methods and as discussed on
https://patchwork.freedesktop.org/patch/483155/, supporting EDID
compliance tests in the driver is quite hacky. As seen with other
vendor drivers, supporting these will be much easier with IGT. Hence
removing all the related fail safe code for it so that no possibility
of circular lock will happen.

======================================================
 WARNING: possible circular locking dependency detected
 5.15.35-lockdep #6 Tainted: G        W
 ------------------------------------------------------
 frecon/429 is trying to acquire lock:
 ffffff808dc3c4e8 (&dev->mode_config.mutex){+.+.}-{3:3}, at:
dp_panel_add_fail_safe_mode+0x4c/0xa0

 but task is already holding lock:
 ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at: lock_crtcs+0xb4/0x124

 which lock already depends on the new lock.

 the existing dependency chain (in reverse order) is:

 -> #3 (&kms->commit_lock[i]){+.+.}-{3:3}:
        __mutex_lock_common+0x174/0x1a64
        mutex_lock_nested+0x98/0xac
        lock_crtcs+0xb4/0x124
        msm_atomic_commit_tail+0x330/0x748
        commit_tail+0x19c/0x278
        drm_atomic_helper_commit+0x1dc/0x1f0
        drm_atomic_commit+0xc0/0xd8
        drm_atomic_helper_set_config+0xb4/0x134
        drm_mode_setcrtc+0x688/0x1248
        drm_ioctl_kernel+0x1e4/0x338
        drm_ioctl+0x3a4/0x684
        __arm64_sys_ioctl+0x118/0x154
        invoke_syscall+0x78/0x224
        el0_svc_common+0x178/0x200
        do_el0_svc+0x94/0x13c
        el0_svc+0x5c/0xec
        el0t_64_sync_handler+0x78/0x108
        el0t_64_sync+0x1a4/0x1a8

 -> #2 (crtc_ww_class_mutex){+.+.}-{3:3}:
        __mutex_lock_common+0x174/0x1a64
        ww_mutex_lock+0xb8/0x278
        modeset_lock+0x304/0x4ac
        drm_modeset_lock+0x4c/0x7c
        drmm_mode_config_init+0x4a8/0xc50
        msm_drm_init+0x274/0xac0
        msm_drm_bind+0x20/0x2c
        try_to_bring_up_master+0x3dc/0x470
        __component_add+0x18c/0x3c0
        component_add+0x1c/0x28
        dp_display_probe+0x954/0xa98
        platform_probe+0x124/0x15c
        really_probe+0x1b0/0x5f8
        __driver_probe_device+0x174/0x20c
        driver_probe_device+0x70/0x134
        __device_attach_driver+0x130/0x1d0
        bus_for_each_drv+0xfc/0x14c
        __device_attach+0x1bc/0x2bc
        device_initial_probe+0x1c/0x28
        bus_probe_device+0x94/0x178
        deferred_probe_work_func+0x1a4/0x1f0
        process_one_work+0x5d4/0x9dc
        worker_thread+0x898/0xccc
        kthread+0x2d4/0x3d4
        ret_from_fork+0x10/0x20

 -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
        ww_acquire_init+0x1c4/0x2c8
        drm_modeset_acquire_init+0x44/0xc8
        drm_helper_probe_single_connector_modes+0xb0/0x12dc
        drm_mode_getconnector+0x5dc/0xfe8
        drm_ioctl_kernel+0x1e4/0x338
        drm_ioctl+0x3a4/0x684
        __arm64_sys_ioctl+0x118/0x154
        invoke_syscall+0x78/0x224
        el0_svc_common+0x178/0x200
        do_el0_svc+0x94/0x13c
        el0_svc+0x5c/0xec
        el0t_64_sync_handler+0x78/0x108
        el0t_64_sync+0x1a4/0x1a8

 -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
        __lock_acquire+0x2650/0x672c
        lock_acquire+0x1b4/0x4ac
        __mutex_lock_common+0x174/0x1a64
        mutex_lock_nested+0x98/0xac
        dp_panel_add_fail_safe_mode+0x4c/0xa0
        dp_hpd_plug_handle+0x1f0/0x280
        dp_bridge_enable+0x94/0x2b8
        drm_atomic_bridge_chain_enable+0x11c/0x168
        drm_atomic_helper_commit_modeset_enables+0x500/0x740
        msm_atomic_commit_tail+0x3e4/0x748
        commit_tail+0x19c/0x278
        drm_atomic_helper_commit+0x1dc/0x1f0
        drm_atomic_commit+0xc0/0xd8
        drm_atomic_helper_set_config+0xb4/0x134
        drm_mode_setcrtc+0x688/0x1248
        drm_ioctl_kernel+0x1e4/0x338
        drm_ioctl+0x3a4/0x684
        __arm64_sys_ioctl+0x118/0x154
        invoke_syscall+0x78/0x224
        el0_svc_common+0x178/0x200
        do_el0_svc+0x94/0x13c
        el0_svc+0x5c/0xec
        el0t_64_sync_handler+0x78/0x108
        el0t_64_sync+0x1a4/0x1a8

Changes in v2:
-- re text commit title
-- remove all fail safe mode

Changes in v3:
-- remove dp_panel_add_fail_safe_mode() from dp_panel.h
-- add Fixes

Fixes: 8b2c181 ("drm/msm/dp: add fail safe mode outside of event_mutex context")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Fixes: f1b47e6a8df8 ("drm/msm/dp: remove fail safe mode related code")
Reported-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f141872..26f4b695 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -206,17 +206,6 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 			rc = -ETIMEDOUT;
 			goto end;
 		}
-
-		/* fail safe edid */
-		mutex_lock(&connector->dev->mode_config.mutex);
-		if (drm_add_modes_noedid(connector, 640, 480))
-			drm_set_preferred_mode(connector, 640, 480);
-		mutex_unlock(&connector->dev->mode_config.mutex);
-	} else {
-		/* always add fail-safe mode as backup mode */
-		mutex_lock(&connector->dev->mode_config.mutex);
-		drm_add_modes_noedid(connector, 640, 480);
-		mutex_unlock(&connector->dev->mode_config.mutex);
 	}
 
 	if (panel->aux_cfg_update_done) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

