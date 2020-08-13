Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F21245CFD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457316E446;
	Mon, 17 Aug 2020 07:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021366E261
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 22:07:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 140so3827576lfi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 15:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sWzvdmgXDHuOtJszdX4J4B9Z4Waxa6XTUameiQDphcY=;
 b=lFCLXi/++Wld7Pef95SQoNaKCO+nuVwKA83lj/LWRH6z1GpTKPIvZgA5QoycREtvh5
 Jdo4w+LW3Mkg1MqCnYz+wIXca7AxkwEy8q+D9I7X2L4Kw0YawnZfLX6TVhiiaAMI+/Du
 Gr3Jv0qPWpGsCBR8yQsjnui7P5NDvMkGgoMdoBQM5KCEWfJ12s0XVlKWfNMR9n3S+348
 RLtZj72ntG+TmiCwaW7D1WMAkaoYvf6c4dUcxXlmw0zvFjuMhxde/Wc34oL04cMFcCTz
 0NlkoALfIqdTnf4Q2EJ+FJq66X97NMUloMese9QHP1AX+p3P5d6JukihtBt+MxOHu1g+
 2o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sWzvdmgXDHuOtJszdX4J4B9Z4Waxa6XTUameiQDphcY=;
 b=PemNWGM7E8l/48wU9glD+CdARQnOzZBR+sPfwR8OUTu557BTzmzAH2J+wIi4teXK0k
 uVSKuSEhF/NFWqfs7FykLDMDdZd+K7pv8htNMyO4fcJRu31vUbhyBbrg8MfvLAeQIxvI
 2BPSnDk14O3ScVY2cn3LTpolSN7xTRKSnVNUf2Q8UFNxMX3dVAWE/fnkl9scb+jSj/8A
 QHTiCAOJk8nFA5IEcucyCP56BuAuj6MSx5hLL3lH8ucLbjS1OyMPyGwaJB51RTK5dXoK
 2y7nb5/hMSGGgB+iBi1rxtq11hbyJMWuZGX0cYmFYj6RkpN9+9yiNnLj7C9Ub0cXGh89
 IgMw==
X-Gm-Message-State: AOAM5313iYzyK75wxOuPT8uU3fx5dX4h9WJ67XiDzD9zlD5/VizLtbzJ
 aIMx4BCHpMOfuMD7el6Zgi8=
X-Google-Smtp-Source: ABdhPJyxqKir1ref2JB/ZBi9uoJB2LHWMxuOvTIGdPa97QGjik3HXoPPQbGgeYDxvzXimJtkPnh0FA==
X-Received: by 2002:a05:6512:20c1:: with SMTP id
 u1mr3143864lfr.17.1597356426488; 
 Thu, 13 Aug 2020 15:07:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1354452ljk.97.2020.08.13.15.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 15:07:05 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH RESEND v10 2/4] drm/tegra: output: Support DRM bridges
Date: Fri, 14 Aug 2020 01:06:54 +0300
Message-Id: <20200813220656.30838-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813220656.30838-1-digetx@gmail.com>
References: <20200813220656.30838-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
