Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE81F8FA5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5476E6E0DC;
	Mon, 15 Jun 2020 07:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBDE89E47
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 17:23:24 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 9so16393282ljv.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a5nZg8KheWIS8ObVaNA2RcCFchGpMXgRR/HHGM1BHBw=;
 b=Dqy6XNyLSpGzRAK8Mx2BZJwy8mQMfw9cJ4gG2HCuEejoyhoX1igZul80ku4k+6hGxl
 8UF0ySu37m0omKHX5t0FvsIIflDE1n/SKPlGJyePW22HIzv4iRDLOJPyFfvXBKyjvujP
 k25eoAezusd38q28urO4RjKuVQX4Rrq0O2LTvI1w/y2EqQ6lXH/S4fguB998BNVhV7Gn
 dNaOJLhcTmc02Yd91VMo+aIWNUCE6lZ/2duOTdyDWNcS0/HTHIwTcSs+44upBtVIsGOh
 J37RR8mTcgyTZwF4xdNgqOPk7TPmxB1VvDskyB7acYlPP/eU9hvDbylanZbqTO3PQX/K
 vQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5nZg8KheWIS8ObVaNA2RcCFchGpMXgRR/HHGM1BHBw=;
 b=tFHp3Ff6txfgcpX51QY/bDBZtfxMeunMP9Bdwm/QNHmvTZaULD5wqTVFjCxfRSC/fu
 uC4GhZM8FG2PZU2PsoKcS9gNRVXK/siGIvHQhA5U/3AgvLlqtXMsMXKEa+bYI0VjY5U1
 3triCreZVTZB1nJJT6Qll720aewGS/Hx45p7KU1obuexsGyjCW4ZD9ix28hXm8rCH292
 g3enkPUS5dlGgqtw1T1FCPDsf8wQ5EzEGu7U6gYKRbwIaIlfFgMK+ARBj+BxBqcYKbUU
 +MAox8gdT79CXWX3H7pmnmGYuFBg9ThNKBbEVgoTT40pSx/nUVnwMy44V9YkIOh3VOx7
 +d0w==
X-Gm-Message-State: AOAM532ovwlNojyNA1Wbh7N2TqBBLzEPBl35W//G/zlU7X+vuJtupLjh
 CQXP4ThNqcIloNd/LYh0o5w=
X-Google-Smtp-Source: ABdhPJwSz84D2Xlury2MH6eG3RCGtfat5pMgNh5ZeZ8BdFrpPl/5TrBUHqMqWjoU3cTBnLJPEyUmcw==
X-Received: by 2002:a2e:b88c:: with SMTP id r12mr11057370ljp.266.1592155402510; 
 Sun, 14 Jun 2020 10:23:22 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m14sm55144lfp.18.2020.06.14.10.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 10:23:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v7 4/6] drm/tegra: output: Support DRM bridges
Date: Sun, 14 Jun 2020 20:22:32 +0300
Message-Id: <20200614172234.8856-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614172234.8856-1-digetx@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer Tegra device-trees will specify a video output graph which involves
a bridge. This patch adds initial support for the DRM bridges to the Tegra
DRM output.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index b25443255be6..f38de08e0c95 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -12,6 +12,7 @@
 #include <linux/gpio/consumer.h>
 
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
index a6a711d54e88..ccd1421f1b24 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -99,8 +100,19 @@ int tegra_output_probe(struct tegra_output *output)
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
+					  &output->panel, &output->bridge);
+	if (err && err != -ENODEV)
+		return err;
+
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
+		/*
+		 * Don't mix nvidia,panel phandle with the graph in a
+		 * device-tree.
+		 */
+		WARN_ON(output->panel || output->bridge);
+
 		output->panel = of_drm_find_panel(panel);
 		of_node_put(panel);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
