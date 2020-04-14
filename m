Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA71A93FF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991A96E85C;
	Wed, 15 Apr 2020 07:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCA86E176
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 22:20:21 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l11so1056665lfc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zemnxajRILWoZMeBdBTnUfi/BmlkbHyd8FyHUOxvzuw=;
 b=KU0KC/6kKXBdTSuhTqT6QSpZNSf0GWmK6fdeSEC7fmm45ekuHvd86jQfOs3qxf0tK2
 wG4VFeCNxR/zmV9TYTaNNh4A3g0Qs2nkmdx/zGPb1JSiGDQZWY+p5s3bqgzgE+HCnYDx
 tZNWY4QipWHe845qlNIC/VZfRv1DGtMPY9XxhUH/2Xsz6I/KJAW9TYiF91KpUR3zhM+Y
 Nilq3tRMSqSWXtw6NvCFV3Cz8yaS9i1gcyi6vIFpv36ouS+wcI88wTDh3HfLWPxZYKPf
 jepC1NyTeDvbVXFB+AXN8xDHC45upE20hQHnfll9zrJhQYfbYZK6IisKMwNohOTL9IJ3
 rZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zemnxajRILWoZMeBdBTnUfi/BmlkbHyd8FyHUOxvzuw=;
 b=ZD98SjmlrGPvHB2Urz8hQjbZdVj3rgZEaengSPgWwEgApHfyYkzBUWgLQcYReKKjvz
 FBIbENqhQpHPzVAAZgZUM9xx3E0biGHI7XJKISbtxilBWeQI4yFU5p0D2Iw5Kw15V8Dz
 z+nUeN1ssWpBqzqxIrBow6uCc7lR3cJCk35J/a8W4zVEi+n+3V2q3Awn49vPmSraILcA
 98YjvVhqsEKBjjElgb2izsB4lIlHYt6F0vBaxBjfHy6NxhDQ7DFVoBJyo2qkHFgDskx0
 7XCaG4XTkFK+Xxh/pISVavx3ulBPtVyZFbAL/KTnBvhSZ6bXB06sYApUq6s62WfahtEB
 /ZyA==
X-Gm-Message-State: AGi0PuYGzs5B3sey/fzjGUnJksVgZGnnLmGbDIy3cGbukiglM90Zranc
 usYnlhdHsEHwWdsz63Gjvb4=
X-Google-Smtp-Source: APiQypKYoF+QM9cOIvlfpZWhxvyICsjR+0sLrT8HpIQs6NqBbxBA7bY7rrbyI/cQOiBYO79SdZTh1g==
X-Received: by 2002:a05:6512:1082:: with SMTP id
 j2mr1149738lfg.53.1586902820227; 
 Tue, 14 Apr 2020 15:20:20 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id k11sm11120064lfe.44.2020.04.14.15.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 15:20:19 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/2] drm/tegra: output: Support DRM bridges
Date: Wed, 15 Apr 2020 01:20:06 +0300
Message-Id: <20200414222007.31306-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414222007.31306-1-digetx@gmail.com>
References: <20200414222007.31306-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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

Newer Tegra device-trees will define a video output graph which involves
a bridge. This patch adds support for the DRM bridges to the Tegra's DRM
output.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 25 ++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index ed99b67deb29..9ca11989679c 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -16,6 +16,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fixed.h>
+#include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <uapi/drm/tegra_drm.h>
 
@@ -116,6 +117,7 @@ struct tegra_output {
 	struct device_node *of_node;
 	struct device *dev;
 
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	struct i2c_adapter *ddc;
 	const struct edid *edid;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a264259b97a2..6b8fae4659b4 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -96,13 +96,28 @@ static irqreturn_t hpd_irq(int irq, void *data)
 
 int tegra_output_probe(struct tegra_output *output)
 {
-	struct device_node *ddc, *panel;
+	struct device_node *ddc, *panel, *port;
 	unsigned long flags;
 	int err, size;
 
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	/* newer device-trees may utilize output graph */
+	port = of_get_child_by_name(output->of_node, "port");
+	if (port) {
+		err = drm_of_find_panel_or_bridge(output->of_node, 0, 0,
+						  &output->panel,
+						  &output->bridge);
+		of_node_put(port);
+		if (err)
+			return err;
+	}
+
+	if (output->panel || output->bridge)
+		goto edid_property;
+
+	/* for older device-trees we fall back to nvidia,panel */
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
@@ -112,6 +127,7 @@ int tegra_output_probe(struct tegra_output *output)
 		of_node_put(panel);
 	}
 
+edid_property:
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
 
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
@@ -189,6 +205,13 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 		err = drm_panel_attach(output->panel, &output->connector);
 		if (err < 0)
 			return err;
+	} else if (output->bridge) {
+		err = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, 0);
+		if (err) {
+			dev_err(drm->dev, "cannot connect bridge: %d\n", err);
+			return err;
+		}
 	}
 
 	/*
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
