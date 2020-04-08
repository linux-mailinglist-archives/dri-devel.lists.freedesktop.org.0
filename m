Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679431A301B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A9D6EB5D;
	Thu,  9 Apr 2020 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A796EAFF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:50:43 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h6so6287817lfc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDe3jb7HYGWKX0IPhCmO+KPecpUQ19WATGRi38MLDt8=;
 b=FBwC1I1a34ApIWzE6B4w7yW2qmFoV/cQA1px9ZeFxvvbeW1FiME3PoKwClkh+AoJ0L
 LqfEmxGBhtbHdn1sNjTuvVzCMfT8bfaui1cmyUGqnRwwIaxF+OGdvDb1yJ5HyghAyYJr
 qY09GeU26TLBW6Cwm1JAdxGwbmgTpP04qwfEzGxMkly9ASqwph5vRlka4CynR1fHdPsg
 MKnfq6LnJEv9RXzwFqq1F7z2Ww0q/eS0kJWqy2Taa45wzAynHxyhx1Ftj4I+Z0SO+rpe
 IqcDtTG96GPg/V16BSxN9jFHgpUvD4my5oQwstg0XhrnTO3WEIU441DKMBqyE7kP0xXB
 w2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDe3jb7HYGWKX0IPhCmO+KPecpUQ19WATGRi38MLDt8=;
 b=JPe4JZ2kpFzXK7h1vpXIxUrKXQGxtAPs2YJvkwCecbeqXkzHXxtQ+7qKgA1ApZQMOn
 J8WjsZNsiRydWhwML26ljEvO3PIzxWmjUb8SCwIsHIcx5YDSJDBnGYUTGheSnPU12dfe
 bp6z/EHRo4OUBKndXFGjYyASFwUa4Zn+0zP+WzgM5X76bmaGinURHacwBMzifz9ZqJeq
 uhZUArdDn9eJ68JjsJ+V9gb5wbcOrinWNLSilOhhRHVw1i6YJdUsTDgXdxbMS2/9nuhR
 l3nMWNygu0x30fVBOpvtTq3MfEz3WJJf6vbv6hSMJx294eE1cjQk5RQhN78oZDuFLrN7
 a7Xg==
X-Gm-Message-State: AGi0PuY8t/v7dhqwM5LPHvTGeP4EEIZ1JNd/cEFMxvS7IbfnnwX7YYVs
 8GR27gHHWIpDHhJraWgu+OhIUEII
X-Google-Smtp-Source: APiQypKIAZqNDZ6fKILmxrdiBcLQLUQ0IO4EO4MRSyuu/rYGA09NxSQUG6m6SANkkvtSSJazhxELFg==
X-Received: by 2002:ac2:42d9:: with SMTP id n25mr5564921lfl.97.1586379041658; 
 Wed, 08 Apr 2020 13:50:41 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id b73sm9225159lfg.86.2020.04.08.13.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 13:50:41 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1] drm/tegra: output: Support DRM bridges
Date: Wed,  8 Apr 2020 23:49:20 +0300
Message-Id: <20200408204920.19142-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
