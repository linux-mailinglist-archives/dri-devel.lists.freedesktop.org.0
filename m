Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85091AD686
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350216E34B;
	Fri, 17 Apr 2020 06:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C6A6E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:26:26 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l11so6226470lfc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFzc6fT7PJhOVc2PmEDvrBnBpynDH67qawUCdvlDUBA=;
 b=XtJDuxVSs63q0EVoGLvIoGPtPP7Hv/oO6lZvbqj5/JWUrSsEb+fCWFWmuuucmMpuhf
 TKwH27fiOd3qNrhl/mWe6UGRPxfDcRfxtlSSqinEM90hrGFRiPo2R1p1B0bu36R4pDIV
 5QqkPRzPX89xSkpG9QI1vTMnOodL/HNM0nRvr2YZY/wNGCfor1g6RamfpcLVjDEZz79c
 wEgiW2x3nFLTY3a1j6VNXjXKiSxCnVbX7p8Qp7oh0Tu/svGdZkIC3oTFt/Ox+ELmgAsC
 IyLvejJRj/Nsnw/aeUnAHDWTNPKrTLF11g3Col6priDNVx/zUbU0zqe5VAq1b8LbZyaR
 JfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFzc6fT7PJhOVc2PmEDvrBnBpynDH67qawUCdvlDUBA=;
 b=R7+8klpgHZfgQ/gCJ/U033Rgm6Urk8BGQ0aaTJIDKIQkzV0Qfo/aB7RY6ApD2w1bFo
 rBxBeonikKw8VSG/vfpLHSmTl5SvPyvioRKsNF2T/2sr9wOuhqyeavIM3Td4Gg4m62ua
 1lY+tzyuzdLxQLmVWm6JnrpKKDD+4Ln2oJYW3T5LS83Ie/KfmP9URInwYyHiyMizNj+i
 aEDLAMWcLhF0fiEOt09djh9mU2M1MTzLu/t9ckyNJZjvTMx4PhlQREn0tuT1UMhLlYPb
 Wh4dKxdzqI88BJFlaUeK2Jl575Tex8pJntcOf70t34O40bxCKPJCEqcHU7ZTX3+jpq7c
 Bv/w==
X-Gm-Message-State: AGi0PuZZI8FdzxdJKraafQ9ho4SsM658LDnd7VbL1TUK9HywM2mY/aC/
 HIjP4YyivRYceRK6TkBHv0M=
X-Google-Smtp-Source: APiQypIiyjkqz7+51N41EvFkk++/rxy4a2pb95TOvbOxygyTMT2pz6q4DvMSYi+QJF4ZmBV9xlBjAA==
X-Received: by 2002:a19:d3:: with SMTP id 202mr6549662lfa.24.1587057984730;
 Thu, 16 Apr 2020 10:26:24 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id q26sm5367381ljg.47.2020.04.16.10.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 10:26:24 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
Date: Thu, 16 Apr 2020 20:24:05 +0300
Message-Id: <20200416172405.5051-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416172405.5051-1-digetx@gmail.com>
References: <20200416172405.5051-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer Tegra device-trees will specify a video output graph that involves
LVDS encoder bridge, This patch adds support for the LVDS encoder bridge
to the RGB output, allowing us to model display hardware properly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 10 ++++++++++
 drivers/gpu/drm/tegra/rgb.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 804869799305..cccd368b6752 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 #include <linux/of_gpio.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
@@ -116,6 +117,7 @@ struct tegra_output {
 	struct device_node *of_node;
 	struct device *dev;
 
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a6a711d54e88..37fc6b8c173f 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -180,6 +180,16 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	int connector_type;
 	int err;
 
+	if (output->bridge) {
+		err = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (err) {
+			dev_err(output->dev, "cannot connect bridge: %d\n",
+				err);
+			return err;
+		}
+	}
+
 	if (output->panel) {
 		err = drm_panel_attach(output->panel, &output->connector);
 		if (err < 0)
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 0562a7eb793f..0df213e92664 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_panel.h>
@@ -210,6 +211,7 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 
 int tegra_dc_rgb_probe(struct tegra_dc *dc)
 {
+	const unsigned int encoder_port = 0, panel_port = 1;
 	struct device_node *np;
 	struct tegra_rgb *rgb;
 	int err;
@@ -226,6 +228,38 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	rgb->output.of_node = np;
 	rgb->dc = dc;
 
+	/*
+	 * Tegra devices that have LVDS panel utilize LVDS-encoder bridge
+	 * for converting 24/18 RGB data-lanes into 8 lanes. Encoder usually
+	 * have a powerdown control which needs to be enabled in order to
+	 * transfer data to the panel. Historically devices that use an older
+	 * device-tree version didn't model the bridge, assuming that encoder
+	 * is turned ON by default, while today's DRM allows us to model LVDS
+	 * encoder properly.
+	 *
+	 * Newer device-trees may utilize output->encoder->panel graph.
+	 *
+	 * For older device-trees we fall back to use nvidia,panel phandle.
+	 */
+	np = of_graph_get_remote_node(rgb->output.of_node, encoder_port, -1);
+	if (np) {
+		rgb->output.bridge = of_drm_find_bridge(np);
+		of_node_put(np);
+
+		if (!rgb->output.bridge)
+			return -EPROBE_DEFER;
+
+		np = of_graph_get_remote_node(rgb->output.bridge->of_node,
+					      panel_port, -1);
+		if (np) {
+			rgb->output.panel = of_drm_find_panel(np);
+			of_node_put(np);
+
+			if (IS_ERR(rgb->output.panel))
+				return PTR_ERR(rgb->output.panel);
+		}
+	}
+
 	err = tegra_output_probe(&rgb->output);
 	if (err < 0)
 		return err;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
