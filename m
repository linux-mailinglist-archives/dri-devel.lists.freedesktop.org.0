Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6401AEB28
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8540A6E183;
	Sat, 18 Apr 2020 09:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38056E124
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:54:52 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q22so2969069ljg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wz/cPTE8kMVij9chCAHM9jmhnQSQFkeUt4WN8AQKozw=;
 b=lgjOoqNqwgEKCq/1F/bKkbgM6VBQoN+T9/MnpqycC7++jIXWK9d99r1tCqWUnRZosv
 iDk/HHbQZVYxpPbOy0kSzA7AQhi5+2HtLxdwK2AuqZ2rH6ZJALBtjK5Km1NU12vs2d2Z
 JqzHVt+Ufl1CCIIAjvaXmLbYaHiEnE/jQdIMAjSCBP8dVMdACXR+T5GYNXVwI7PepUnJ
 faeo1t97uMM75EVL5Tv0CVXUCZw5/aWyua/zVbvdr+1XNPnpO59n2JpQtpN9tLLcCowr
 0zk6/+u2RiZfXEAtd5cv9xo4u/xgpUiw5c3lXci6UnB1lc3waSAKQRycyT8YEbwVLZcM
 rBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wz/cPTE8kMVij9chCAHM9jmhnQSQFkeUt4WN8AQKozw=;
 b=TCrAPDTug3zpKwdlGu+S1Stp1TVarttCCJZGS5C6FbWv70YKfCtSQfUH5trqNcKYCN
 whu6RRlUjBcxzP8h5EVea3byAPKQC3VqlhuQF8hm9WvTVnCJCRtM8qQlThOK36wq5ODl
 HGjDxfzmVc3UkkawUdMlDxIp1iR5ZIdfU6yOhWcESMkTcT/uKCkMHVc9d5M4TK/29JAx
 p/AfUfnXdvwxVJiPGWm/8S3IAtU5IpiKqfIo9bQOsPjOhfh+BoZEtA9GE0jPld/4IR0o
 kOXatRs1/98741ZPeNG0TKra7NziC0FiBu8IELj9HOjs0HtgeDn26KXo89zsXccPvDrh
 NTyg==
X-Gm-Message-State: AGi0PuasAiPY7/DPOfdt3dd06qxBrdpnSZwnW+enlWJzt1TW5bwBS7tS
 6DqxrlrPXOdW2nrCCMUa2mI=
X-Google-Smtp-Source: APiQypKBYY3x7qO73+HDOn2c5cUVwJifMFdMk8fGmZVY3f2S5Uj7xsolZU8I3NbfB7jGWJoAWYyCIg==
X-Received: by 2002:a2e:914f:: with SMTP id q15mr2842890ljg.238.1587146091297; 
 Fri, 17 Apr 2020 10:54:51 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id j15sm7204358lja.71.2020.04.17.10.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:54:50 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
Date: Fri, 17 Apr 2020 20:52:37 +0300
Message-Id: <20200417175238.27154-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417175238.27154-1-digetx@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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

Newer Tegra device-trees will specify a video output graph which involves
a bridge. This patch adds initial support for the DRM bridges to the
Tegra's DRM output.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

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
index a6a711d54e88..ec0cd4a1ced1 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -92,13 +93,23 @@ static irqreturn_t hpd_irq(int irq, void *data)
 
 int tegra_output_probe(struct tegra_output *output)
 {
-	struct device_node *ddc, *panel;
+	struct device_node *ddc, *panel, *port;
 	unsigned long flags;
 	int err, size;
 
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
+	port = of_get_child_by_name(output->of_node, "port");
+	if (port) {
+		err = drm_of_find_panel_or_bridge(output->of_node, 0, 0, NULL,
+						  &output->bridge);
+		of_node_put(port);
+
+		if (err)
+			return err;
+	}
+
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
