Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BD441842B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 21:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7506E45D;
	Sat, 25 Sep 2021 19:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791E86E459
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 19:28:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y28so55540294lfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m99EiPyhkZvdOX8UTmF6dH9ah1E6JEGQ0qZKHQtZrX0=;
 b=swOlu8g/Muy2xcoCPbEKqTmf50DxfKGVzS7GCFunbLzLdpYAh4/LefYVWp1O0qsRFa
 XnVuSPGgpZmYh/ciCYSaBXRAgNHzRKM5eiTsH1dQESR61V5SNENiw73cM8sOzIp9sjAC
 7PwYfiyjCoRTKSZeOMgNEcUbg8uZX5zHK7pQHyyYN6+nUPUElb0RS7oHmTJSDCVvqQxy
 S2fm5DVhKoePdXacEEvsaCXKMHeQze1KHbzc8fP+rqaaF1FEGm5rp+1c4P9XE5rQ2lQc
 EP9QxA2zW3uwN+peJnYk4I5iqdvYjQrKdGfuaVTbSyguPdJ0/uAOoQJY2auLVxrYDPXc
 hXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m99EiPyhkZvdOX8UTmF6dH9ah1E6JEGQ0qZKHQtZrX0=;
 b=xD2hTuOl8cKbE5LgD4Rny1otbdQ7dSGLVNQNR/Z5KKzvuHCjjRsvHmTRqxsxnUTY6V
 qyf6zzBGfmHMdqU875cOcyc6Ty3Wwza8XCerLdLD8TbwiA1C1pM4PdSQ188M3n8yUWiA
 MfbRxr6adqI++714VGnl5wdLq32qgjBdNpshOu+hx0803jJVQLAi8gvkyBQPNw46fuM3
 i4YSaxJMMwrem/u5Dr9zSofNgbDEo0UetRfEuH2S3/ZRGZyXJ0WVQO620VFtIxnM+YoU
 /lOk24jK1RperqmYYjSP6DyOOCQIkCrRAUnH05oouejkETIfxga/fjrySfEpBYbExWDE
 zt/Q==
X-Gm-Message-State: AOAM532Z6SG78oGLNVZLsR0Pb7uu4q26PIAsngLbxfiO9X/0iWI3t/Wf
 4EvjVSAa7MTduPiSGEozgXeCgQ==
X-Google-Smtp-Source: ABdhPJzxIV95tbhespWGHjkNJrQC2gi2WZygdMrgs7a5ZkA7a2ev1lJhZAYszYK8GGr2OuchyexIbw==
X-Received: by 2002:a2e:5c08:: with SMTP id q8mr18316827ljb.304.1632598105729; 
 Sat, 25 Sep 2021 12:28:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h21sm1338375lji.66.2021.09.25.12.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 12:28:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp5: fix cursor-related warnings
Date: Sat, 25 Sep 2021 22:28:24 +0300
Message-Id: <20210925192824.3416259-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since f35a2a99100f ("drm/encoder: make encoder control functions
optional") drm_mode_config_validate would print warnings if both cursor
plane and cursor functions are provided. Restore separate set of
drm_crtc_funcs to be used if separate cursor plane is provided.

[    6.556046] ------------[ cut here ]------------
[    6.556071] [CRTC:93:crtc-0] must not have both a cursor plane and a cursor_set func
[    6.556091] WARNING: CPU: 1 PID: 76 at drivers/gpu/drm/drm_mode_config.c:648 drm_mode_config_validate+0x238/0x4d0
[    6.567453] Modules linked in:
[    6.577604] CPU: 1 PID: 76 Comm: kworker/u8:2 Not tainted 5.15.0-rc1-dirty #43
[    6.580557] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
[    6.587763] Workqueue: events_unbound deferred_probe_work_func
[    6.593926] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.599740] pc : drm_mode_config_validate+0x238/0x4d0
[    6.606596] lr : drm_mode_config_validate+0x238/0x4d0
[    6.611804] sp : ffff8000121b3980
[    6.616838] x29: ffff8000121b3990 x28: 0000000000000000 x27: 0000000000000001
[    6.620140] x26: ffff8000114cde50 x25: ffff8000114cdd40 x24: ffff0000987282d8
[    6.627258] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    6.634376] x20: ffff000098728000 x19: ffff000080a39000 x18: ffffffffffffffff
[    6.641494] x17: 3136564e3631564e x16: 0000000000000324 x15: ffff800011c78709
[    6.648613] x14: 0000000000000000 x13: ffff800011a22850 x12: 00000000000009ab
[    6.655730] x11: 0000000000000339 x10: ffff800011a22850 x9 : ffff800011a22850
[    6.662848] x8 : 00000000ffffefff x7 : ffff800011a7a850 x6 : ffff800011a7a850
[    6.669966] x5 : 000000000000bff4 x4 : 40000000fffff339 x3 : 0000000000000000
[    6.677084] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00008093b800
[    6.684205] Call trace:
[    6.691319]  drm_mode_config_validate+0x238/0x4d0
[    6.693577]  drm_dev_register+0x17c/0x210
[    6.698435]  msm_drm_bind+0x4b4/0x694
[    6.702429]  try_to_bring_up_master+0x164/0x1d0
[    6.706075]  __component_add+0xa0/0x170
[    6.710415]  component_add+0x14/0x20
[    6.714234]  msm_hdmi_dev_probe+0x1c/0x2c
[    6.718053]  platform_probe+0x68/0xe0
[    6.721959]  really_probe.part.0+0x9c/0x30c
[    6.725606]  __driver_probe_device+0x98/0x144
[    6.729600]  driver_probe_device+0xc8/0x15c
[    6.734114]  __device_attach_driver+0xb4/0x120
[    6.738106]  bus_for_each_drv+0x78/0xd0
[    6.742619]  __device_attach+0xdc/0x184
[    6.746351]  device_initial_probe+0x14/0x20
[    6.750172]  bus_probe_device+0x9c/0xa4
[    6.754337]  deferred_probe_work_func+0x88/0xc0
[    6.758158]  process_one_work+0x1d0/0x370
[    6.762671]  worker_thread+0x2c8/0x470
[    6.766839]  kthread+0x15c/0x170
[    6.770483]  ret_from_fork+0x10/0x20
[    6.773870] ---[ end trace 5884eb76cd26d274 ]---
[    6.777500] ------------[ cut here ]------------
[    6.782043] [CRTC:93:crtc-0] must not have both a cursor plane and a cursor_move func
[    6.782063] WARNING: CPU: 1 PID: 76 at drivers/gpu/drm/drm_mode_config.c:654 drm_mode_config_validate+0x290/0x4d0
[    6.794362] Modules linked in:
[    6.804600] CPU: 1 PID: 76 Comm: kworker/u8:2 Tainted: G        W         5.15.0-rc1-dirty #43
[    6.807555] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
[    6.816148] Workqueue: events_unbound deferred_probe_work_func
[    6.822311] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.828126] pc : drm_mode_config_validate+0x290/0x4d0
[    6.834981] lr : drm_mode_config_validate+0x290/0x4d0
[    6.840189] sp : ffff8000121b3980
[    6.845223] x29: ffff8000121b3990 x28: 0000000000000000 x27: 0000000000000001
[    6.848525] x26: ffff8000114cde50 x25: ffff8000114cdd40 x24: ffff0000987282d8
[    6.855643] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    6.862763] x20: ffff000098728000 x19: ffff000080a39000 x18: ffffffffffffffff
[    6.869879] x17: 3136564e3631564e x16: 0000000000000324 x15: ffff800011c790c2
[    6.876998] x14: 0000000000000000 x13: ffff800011a22850 x12: 0000000000000a2f
[    6.884116] x11: 0000000000000365 x10: ffff800011a22850 x9 : ffff800011a22850
[    6.891234] x8 : 00000000ffffefff x7 : ffff800011a7a850 x6 : ffff800011a7a850
[    6.898351] x5 : 000000000000bff4 x4 : 40000000fffff365 x3 : 0000000000000000
[    6.905470] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00008093b800
[    6.912590] Call trace:
[    6.919702]  drm_mode_config_validate+0x290/0x4d0
[    6.921960]  drm_dev_register+0x17c/0x210
[    6.926821]  msm_drm_bind+0x4b4/0x694
[    6.930813]  try_to_bring_up_master+0x164/0x1d0
[    6.934459]  __component_add+0xa0/0x170
[    6.938799]  component_add+0x14/0x20
[    6.942619]  msm_hdmi_dev_probe+0x1c/0x2c
[    6.946438]  platform_probe+0x68/0xe0
[    6.950345]  really_probe.part.0+0x9c/0x30c
[    6.953991]  __driver_probe_device+0x98/0x144
[    6.957984]  driver_probe_device+0xc8/0x15c
[    6.962498]  __device_attach_driver+0xb4/0x120
[    6.966492]  bus_for_each_drv+0x78/0xd0
[    6.971004]  __device_attach+0xdc/0x184
[    6.974737]  device_initial_probe+0x14/0x20
[    6.978556]  bus_probe_device+0x9c/0xa4
[    6.982722]  deferred_probe_work_func+0x88/0xc0
[    6.986543]  process_one_work+0x1d0/0x370
[    6.991057]  worker_thread+0x2c8/0x470
[    6.995223]  kthread+0x15c/0x170
[    6.998869]  ret_from_fork+0x10/0x20
[    7.002255] ---[ end trace 5884eb76cd26d275 ]---

Fixes: aa649e875daf ("drm/msm/mdp5: mdp5_crtc: Restore cursor state only if LM cursors are enabled")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index f482e0911d03..bb7d066618e6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1125,6 +1125,20 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc)
 	__drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
 }
 
+static const struct drm_crtc_funcs mdp5_crtc_no_lm_cursor_funcs = {
+	.set_config = drm_atomic_helper_set_config,
+	.destroy = mdp5_crtc_destroy,
+	.page_flip = drm_atomic_helper_page_flip,
+	.reset = mdp5_crtc_reset,
+	.atomic_duplicate_state = mdp5_crtc_duplicate_state,
+	.atomic_destroy_state = mdp5_crtc_destroy_state,
+	.atomic_print_state = mdp5_crtc_atomic_print_state,
+	.get_vblank_counter = mdp5_crtc_get_vblank_counter,
+	.enable_vblank  = msm_crtc_enable_vblank,
+	.disable_vblank = msm_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+};
+
 static const struct drm_crtc_funcs mdp5_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = mdp5_crtc_destroy,
@@ -1313,6 +1327,8 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 	mdp5_crtc->lm_cursor_enabled = cursor_plane ? false : true;
 
 	drm_crtc_init_with_planes(dev, crtc, plane, cursor_plane,
+				  cursor_plane ?
+				  &mdp5_crtc_no_lm_cursor_funcs :
 				  &mdp5_crtc_funcs, NULL);
 
 	drm_flip_work_init(&mdp5_crtc->unref_cursor_work,
-- 
2.33.0

