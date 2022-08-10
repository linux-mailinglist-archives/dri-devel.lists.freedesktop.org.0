Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2264758E5C5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 05:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF2AACA79;
	Wed, 10 Aug 2022 03:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A631FD1AF4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 03:47:47 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10ee900cce0so16423815fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OrvhzzFeEQ614iYpJi4RpAo3OO9GtQhsYPoeao237mM=;
 b=o2KWV7fzDUx5XIhnKNSex0s3xUanf9/PrjC9cgwIFruevVqDb+fSg3/J69STGtLDed
 KXvhBTwD/6SF3YJq1YugVdjrUC9vbFyBWEMuAXIaLjrcUUL43XTgKlU1lmquBciQyNyu
 sCG5QboEU2v1XYLtbS5zlTFoX5xRT6lxW51+KDYulxkSBVYSilnPeNLTxg0IILpRNKZa
 cj1wN5lGcJEuhZEiYJdA5WQXarIm+OLlkidR2POyAiA/cFDVx/k3AOc38Eb79ZK8ArmT
 wXdR8FyJz5lfLiXB9RBrDz2qU1x9d21rtKRH1n4jdQ/1ISwYaDZi4H0JQ2MLe5yMIGba
 RoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OrvhzzFeEQ614iYpJi4RpAo3OO9GtQhsYPoeao237mM=;
 b=SSm9BON8oMco64tHL4/QbRljtzx/epxI3Sw1CN9sG7tQEnh81LG04edq7KtbaOXgWk
 Ff3RFqociZxrAiKfPLR3FFOyBjLN6xJTfxd7HVxATliOvixXeqkgzFV9ZRiyMCXzY+X1
 5zIRhp8lNVfpZFqXbM40ojxtS2uQBC8Pmvmxf5K/PdLqLBbLhidqUfNEqoWqEyoX+1A/
 98hO+5PdaypNpvWnZGQM1g9aw3pV13zLNbHp9HxEg5SdJ5BIUvk31objqlXQIOqXuZoI
 UpEuz0nR9/IFNbgYH68X6HT1KdMNhKcmW0vfte7L9RY+03g09VY/NJn2OsrjZagRDTW+
 xd1g==
X-Gm-Message-State: ACgBeo18wYHvvT0pSM7qnFTXB7vH0CHVYaZ66uQ3jdIDmysdgavNnB05
 u7bSYVRrqaWmGE4hv+1kXJ0I7A==
X-Google-Smtp-Source: AA6agR7WaHss0bZgv6umP1AclSIS8GBXrfsMmBcv6nMDeJlOSHhHYvmtqDPFDzr0yr+ojvwvUFrrHw==
X-Received: by 2002:a05:6870:d208:b0:10f:72d:4ee0 with SMTP id
 g8-20020a056870d20800b0010f072d4ee0mr670869oac.227.1660103261661; 
 Tue, 09 Aug 2022 20:47:41 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:47:41 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 5/7] drm/msm/dp: Implement hpd_notify()
Date: Tue,  9 Aug 2022 20:50:11 -0700
Message-Id: <20220810035013.3582848-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DisplayPort controller's hot-plug mechanism is based on pinmuxing a
physical signal no a GPIO pin into the controller. This is not always
possible, either because there aren't dedicated GPIOs available or
because the hot-plug signal is a virtual notification, in cases such as
USB Type-C.

For these cases, by implementing the hpd_notify() callback for the
DisplayPort controller's drm_bridge, a downstream drm_bridge
(next_bridge) can be used to track and signal the connection status
changes.

This makes it possible to use downstream drm_bridges such as
display-connector or any virtual mechanism, as long as they are
implemented as a drm_bridge.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 699f28f2251e..568295381246 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1303,6 +1303,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	dp->dp_display.dev = &pdev->dev;
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
@@ -1765,3 +1766,25 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 }
+
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	/* Without next_bridge interrupts are handled by the DP core directly */
+	if (!dp_display->next_bridge)
+		return;
+
+	if (!dp->core_initialized) {
+		drm_dbg_dp(dp->drm_dev, "not initialized\n");
+		return;
+	}
+
+	if (!dp_display->is_connected && status == connector_status_connected)
+		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+	else if (dp_display->is_connected && status == connector_status_disconnected)
+		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index dcedf021f7fe..d7bc537ead31 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -11,6 +11,7 @@
 #include "disp/msm_disp_snapshot.h"
 
 struct msm_dp {
+	struct device *dev;
 	struct drm_device *drm_dev;
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6df25f7662e7..875b23910bef 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -68,6 +68,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.mode_valid   = dp_bridge_mode_valid,
 	.get_modes    = dp_bridge_get_modes,
 	.detect       = dp_bridge_detect,
+	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
@@ -138,6 +139,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 	if (IS_ERR(connector))
 		return connector;
 
+	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 82035dbb0578..79e6b2cf2d25 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode);
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
-- 
2.35.1

