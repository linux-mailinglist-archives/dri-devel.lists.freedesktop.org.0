Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A124E4F9669
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 15:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A440B10F16E;
	Fri,  8 Apr 2022 13:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DA210F172
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 13:06:26 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id by7so11461355ljb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 06:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZm1/6k3KLN/6M+TmxkxwJGUcAPHhEkHkw8p+wvixnI=;
 b=hOlyBU2NA4cmCQsMKslfc7S5GEgfsJolVzXVTrC6ireuoJr4pFlsLGAMMa3zMv6wfx
 1AnjLGhxeHUMfVo5paiquXiXLk100G990EFxp+YlOEbrnrQAPDJDIqgCw6WH8BiEU9PJ
 C7oj3RUcM0asGOMvXuRBQQ2G+HzFA+137A/FZlvAd72jBjRzVYAddLg/ISIV+ZnA3aFH
 I8Du1nFsfj4NnnccnZNBVt9nJpXnaeOAssz9X21s24F/njpbkqaRQP/7+BIhbjF0rKaT
 hu60hWcxB0N5Tl3oJjfjYVabYentZwxiYhLvtJxWqYGATL6q3NrQDbHoEFE+aiJkyX2f
 Q6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZm1/6k3KLN/6M+TmxkxwJGUcAPHhEkHkw8p+wvixnI=;
 b=OKpf6jF51mVlSJhVASEjLstvaKtBbEdvQwV8P+WunyfskcClygNjkhSbVSo5gXlm3A
 mu3dJIVj77qgC+gd0acqjtIr7yCUkmWNXqq+diV0UdFWepHYaa+5eL1s3dulloGKOzPG
 eDU4tX6xQ6Gx7+tFgK5tbWB0+fLUzBVufw2IurALqatWy7v/YNBTLEzRKrPs0AoRU7Ce
 2KgYfF+jhjnnkoPKjTQhPpxdccA1eeEw7h2iz9OxPChTSltA4vK3AfGZrJZvoWewCDhs
 /oUiMLUiRsjo3oxVswOLuwGUOVUos0DUguWI+1/O0uxPQV8UuIKKlAkmDPjrY4Kb3Ek/
 xMMw==
X-Gm-Message-State: AOAM533WFQarRP2KGkKDfFbNfeWqPvm/HNpcsP/AWC/PAaagM8JPZS0L
 fJLCD7FLlWqLTJbbUFhAOr1Q1w==
X-Google-Smtp-Source: ABdhPJycaofkmNes77QL2MLX5s7UZTNT6hO+0oq/TtFtjHFIUxzaI1cah0CrVOXzNw6w+scm+MVKGg==
X-Received: by 2002:a2e:7d0b:0:b0:24a:f591:9ae4 with SMTP id
 y11-20020a2e7d0b000000b0024af5919ae4mr11483923ljc.199.1649423184644; 
 Fri, 08 Apr 2022 06:06:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v20-20020a2e9254000000b0024b546478bdsm54779ljg.22.2022.04.08.06.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 06:06:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm: properly add and remove internal bridges
Date: Fri,  8 Apr 2022 16:06:23 +0300
Message-Id: <20220408130623.866092-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add calls to drm_bridge_add()/drm_bridge_remove() DRM bridges created by
the driver. This fixes the following warning.

WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
Hardware name: Generic DT based system
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x58/0x70
 dump_stack_lvl from __warn+0xc8/0x1e8
 __warn from warn_slowpath_fmt+0x78/0xa8
 warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
 __mutex_lock from mutex_lock_nested+0x1c/0x24
 mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
 drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
 msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
 mdp4_kms_init from msm_drm_bind+0x514/0x698
 msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc
 try_to_bring_up_aggregate_device from component_master_add_with_match+0xc4/0xf8
 component_master_add_with_match from msm_pdev_probe+0x274/0x350
 msm_pdev_probe from platform_probe+0x5c/0xbc
 platform_probe from really_probe.part.0+0x9c/0x290
 really_probe.part.0 from __driver_probe_device+0xa8/0x13c
 __driver_probe_device from driver_probe_device+0x34/0x10c
 driver_probe_device from __driver_attach+0xbc/0x178
 __driver_attach from bus_for_each_dev+0x74/0xc0
 bus_for_each_dev from bus_add_driver+0x160/0x1e4
 bus_add_driver from driver_register+0x88/0x118
 driver_register from do_one_initcall+0x6c/0x334
 do_one_initcall from kernel_init_freeable+0x1bc/0x220
 kernel_init_freeable from kernel_init+0x18/0x12c
 kernel_init from ret_from_fork+0x14/0x2c

Fixes: 3d3f8b1f8b62 ("drm/bridge: make bridge registration independent of drm flow")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

I've added the Fixes tag pointing to the commit which added these
functions. Please correct me if you think it's wrong.

---
 drivers/gpu/drm/msm/dp/dp_drm.c        | 5 +++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 3 +++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c          | 3 +++
 4 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..a7415f9eb80e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -230,9 +230,13 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 	bridge->funcs = &dp_bridge_ops;
 	bridge->encoder = encoder;
 
+	drm_bridge_add(bridge);
+
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		drm_bridge_remove(bridge);
+
 		return ERR_PTR(rc);
 	}
 
@@ -242,6 +246,7 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_detach(bridge);
 			drm_bridge_remove(bridge);
 			return ERR_PTR(rc);
 		}
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0c1b7dde377c..918498e71255 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -665,6 +665,8 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
+	drm_bridge_add(bridge);
+
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
 		goto fail;
@@ -735,6 +737,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
 {
+	drm_bridge_remove(bridge);
 }
 
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 10ebe2089cb6..97c24010c4d1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -15,6 +15,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 
 	msm_hdmi_hpd_disable(hdmi_bridge);
+	drm_bridge_remove(bridge);
 }
 
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
@@ -349,6 +350,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
+	drm_bridge_add(bridge);
+
 	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index affa95eb05fc..71e1b7393f6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -232,6 +232,9 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
+	for (i = 0; i < priv->num_bridges; i++)
+		drm_bridge_remove(priv->bridges[i]);
+
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
-- 
2.35.1

