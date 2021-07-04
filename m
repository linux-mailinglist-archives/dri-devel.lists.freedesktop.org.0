Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F873BAC51
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF3689D86;
	Sun,  4 Jul 2021 09:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7D989D86
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:05:12 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9965553pjx.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAMGUx6D5lcjN5rGbJFn80/U5mqs7hsNSGwdMUcGBEA=;
 b=bYcyLqXdvKSNW96jNDfbvT/WqZitouieNdGZZ/F/bhYnQIVg5ksKBJPcYevSnjEp1O
 EskwPy90LOG9t+H9ZSabO+crw1F7bP6UaHaeIMZ8nAjuxSoQtPBap9UbpOZJYs+Wx0V7
 8KwrjDY0CSnyrNNpyyW9e29FsiiCAkRXZatjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAMGUx6D5lcjN5rGbJFn80/U5mqs7hsNSGwdMUcGBEA=;
 b=btWrRmor5MYB3fYua5zoM5gWELbzCX5gN7MNd4CZsj715lq6TNjpVqgYs2u4rLioFj
 HLrw/9IcepJYx6Fk435KJnhik5abeRgEadSh0aysOOqhy2ztRNj86r+wk2Mva9LvoLU6
 eCPxupZaoCR+jhaZaWJBofp+CMI+xDrCSwvetFcc4zQ5CMaIr2KLoPm/HhsWocwuj51R
 9UaIFVMD2VYI9lBim7rTZAr0YO98oSPPm5VRIzzCbKoUteYCr2GeBI8Og9DPEViq+3Xs
 sMSGWY+Mo6VsMuGdM/imnfkK3wH9BoQ//RutM56vXXnFUQnzQ+hO/ha4pPAyLQFEs/7R
 1r6w==
X-Gm-Message-State: AOAM533AcZh9CJYt3+w7pnF6i1YJ7GoPXIVteVwQAD5OVCSZhj9Ut0zW
 FabY8TsTY52KOCTU6DcIzQREAw==
X-Google-Smtp-Source: ABdhPJyBs1eGIfUyVYgcoPgmsW20xNsSAFXzQgGn0x4pQWnoXzWWJw64+lJgRiayk/Jqgnbg0A5yGg==
X-Received: by 2002:a17:90b:792:: with SMTP id
 l18mr8895382pjz.55.1625389512016; 
 Sun, 04 Jul 2021 02:05:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:05:11 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 10/17] drm: bridge: samsung-dsim: Update the of_node for
 port(s)
Date: Sun,  4 Jul 2021 14:32:23 +0530
Message-Id: <20210704090230.26489-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Existing bridge driver is able to find the panel or bridge
if of_node isn't a port(s). This is how the exynos dsi
node handling has been done so far.

However in order to make use of this bridge in other or
new supported platforms like i.MX8MM it is required to
have a port based of_node.

So, this patch will check if node is a port based and
then update of_node.

This way we can support the platforms which are using
legacy or new DSI bindings.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 627580abd6df..2222c27feffd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -226,6 +226,11 @@ enum samsung_dsim_transfer_type {
 	EXYNOS_DSI_RX,
 };
 
+enum {
+	DSI_PORT_IN,
+	DSI_PORT_OUT
+};
+
 struct samsung_dsim_transfer {
 	struct list_head list;
 	struct completion completed;
@@ -1436,6 +1441,15 @@ static int samsung_dsim_panel_or_bridge(struct samsung_dsim *dsi,
 {
 	struct drm_bridge *panel_bridge;
 	struct drm_panel *panel;
+	struct device_node *remote;
+
+	if (of_graph_is_present(node)) {
+		remote = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
+		if (!remote)
+			return -ENODEV;
+
+		node = remote;
+	}
 
 	panel_bridge = of_drm_find_bridge(node);
 	if (!panel_bridge) {
@@ -1579,11 +1593,6 @@ static int samsung_dsim_of_read_u32(const struct device_node *np,
 	return ret;
 }
 
-enum {
-	DSI_PORT_IN,
-	DSI_PORT_OUT
-};
-
 static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
-- 
2.25.1

