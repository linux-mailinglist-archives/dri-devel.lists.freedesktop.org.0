Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B907721049C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B336E821;
	Wed,  1 Jul 2020 07:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA756E39E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 02:23:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id m26so12645951lfo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a5nZg8KheWIS8ObVaNA2RcCFchGpMXgRR/HHGM1BHBw=;
 b=WOZH3Nn9evGdNfNdegsmScfv681f/RyxGofCEPnYWGfspTEyGhonNre+yGBHn5bFfa
 sxTcaYeEaMnRWVLKe6dvl953jlQGCQ90o4ua4ivcGyBeLWZRJOINabmsrtxixKEvjfTs
 rbOv9o6+OeD7sJ5vR+COPvihHs5V3r5hDipoEF41JSOpjhY4i1iU3acV2Zg4TXZ1LabF
 J/TkePIkZrTOmGmyxPRnEKauahz/hGAbNE3AhAXj+cq3pUaNCKcoSaLRj/r2e3ZlZj3b
 NageNukvNfawQfIsidTyucHIEs5hhntMok1Rxq3MsKd2uiw0jxmGMBHY+EAUfqj4e1Jt
 6Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5nZg8KheWIS8ObVaNA2RcCFchGpMXgRR/HHGM1BHBw=;
 b=EyCHsRYgDDal47lQzP7Rdz9EdBdEFmH5oBc1CQxou3jKh6V1ZyuSSUzQJaq1aRqpbB
 0U7Izl66mqJk4a0xImuDZjL7EwUjr+/2iPRLN0uUYAMXUMdvutpp/38zIbQgYHnGmUZK
 7IfFAIH7SP81Tdd/EJBYofpogZDJkp64g/obFrxOcZqCM1hqzuUU6HAYrTh376Qfc7al
 zgZ5bAQtiKzHLIK2bmFNh15uu+C0xx/PXBnYTvEWCLd+lcS9508HT6Xzb4jy3WtcXLsa
 Sm2A14uV10wwGLiYlEGncoONgzXJqh4BY98RWH5puLfDSjn1TwyL1AHdLdd0pL1W+dhc
 mqiA==
X-Gm-Message-State: AOAM5323N1dr3JAFpdMtsqfDPqw8ESYZb57m2yntDm3XkzNbIi8Z753S
 yvev9bMP19MQ0MbRSyWUjZQ=
X-Google-Smtp-Source: ABdhPJxLkVvzwxeFv14SPpaqlsYj0gMEYB9Z7wtPKtzeNL3g1IL8KbUjYp/yAgjzyzyrDcB8Hs5VPA==
X-Received: by 2002:ac2:569c:: with SMTP id 28mr13540340lfr.195.1593570237240; 
 Tue, 30 Jun 2020 19:23:57 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id f21sm1303557ljj.121.2020.06.30.19.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 19:23:56 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 2/4] drm/tegra: output: Support DRM bridges
Date: Wed,  1 Jul 2020 05:21:26 +0300
Message-Id: <20200701022128.12968-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200701022128.12968-1-digetx@gmail.com>
References: <20200701022128.12968-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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
