Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1A434B5B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 14:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F196E28B;
	Wed, 20 Oct 2021 12:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1266D6E284
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 12:39:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso1391401wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PrIMbe0cgeUgVskjVfxjc1cVVmfypfzeebevv5kx8mA=;
 b=Pr+dAUu/mCPN3ilMBfuPs7ptSAUMXt4BI+qeV09Iz2k7tIuYTum21jbIoYwZ6u8Inh
 4F55yX2JqRgcxu5ICOWiLuVt0mIHSOj6NCBB7Vz14sR2vOUhWRxiN9K2RNbIxG3PXl53
 qLWNetxF3ND0aAgWBfbS7lXorjHyXLAuKCYhfycmjEDhsgbXA3add3r3ZC777/JZo+EO
 7zLvCizmox2FVdnJXKvjnN24f+3Lehb6Nc2bqbs0qmZ2E0q+yhl7Bw1fDW0mmtb7AzhT
 J60ReiHtGiNG19/06agfLC+UaACu4sGFSmlaqfzD89Zpb4VykuCDnTPzNPhZ9618edIR
 ePCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PrIMbe0cgeUgVskjVfxjc1cVVmfypfzeebevv5kx8mA=;
 b=pmP//AkH/Pb+t7/Mmj9RTwfh0+MhfnrfxastP0NJQJ8JCahYKxNj5EqveUFdlclGnn
 cbLfM6ea2dM9LMDCxs/TatsWbEkEcpbwzXdiA/zq6Sme0QIOGZ8Pg4jCqKYha5N4HFUo
 Xa8rkzUnV6Kzsl6gTgWnp9/nLwlWgbSjrkDvOsH8ZmKsA9NF+BYJMd9Njd3jfgsg2TiK
 LfshGmSGu9e82htXdO53LmCzsHT+HYs9ezyBfd5H6NsXGBCTwX+Mk63pGU19772R9i+G
 pCpo0zEm7gTGIBCEpLfn88578C9OSTinBDTCmWGouB2S23rIzCUasEVH103L/4j9WoXq
 ayqg==
X-Gm-Message-State: AOAM533IPalX3seXX7zebeg9Bo2wJ42U79disxOdkYgERtXYqcFKit6v
 rtY5lB+ERgDD7Fh4k66mOpg+Xw==
X-Google-Smtp-Source: ABdhPJw0ShkRNi7rCxTUF0MorfZe7tSZ4dB3eodpanL/TUpOCwYs0O8C7f3sSF9eQweH3me9fwjScA==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr13080991wmq.168.1634733592440; 
 Wed, 20 Oct 2021 05:39:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d31f:1512:8915:e439])
 by smtp.gmail.com with ESMTPSA id b19sm5342680wmj.9.2021.10.20.05.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 05:39:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/6] drm/meson: remove useless recursive components matching
Date: Wed, 20 Oct 2021 14:39:43 +0200
Message-Id: <20211020123947.2585572-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020123947.2585572-1-narmstrong@baylibre.com>
References: <20211020123947.2585572-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3222; h=from:subject;
 bh=CN3FLP6iVU76e0yAYMgWdH+jRNt14KgdTlQZc0OHMOE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhcA34OiTZV2ZFtMy96i9yZnB9GrMijV1zFNrHEcyb
 umLfJSqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYXAN+AAKCRB33NvayMhJ0ZzyD/
 4lhR8faDJpilegWriDDzuq5KGRjumsjn/WlbNZjCPoOqaj+pn5KXfsZzw9R7Eeup7ZqYyCAQOcIvcs
 oQmvtld62wlHcTSHBs8/6Z3xpYnDKqOsIO/94wSJss0kEwrNAr6JHKn/wtboC7Qsnj+46QaOdCQF4v
 mOK6oirD8VIkza0RIJhQeu/QvEE6Rl5e6pEhGBO4eCO8eJy3sgyxaDT6Q3qzCc88F9LBZ67X+KkWdV
 S9MRl29/bLsI/x6KXJqWirHBBS2gCn5HhicMfbUnQ2NAYE4BWL2QKpXAj0N1FQnd5XCE1vR3Znm4no
 tdYmAuvLL6TsdSCI7SB5FKe0fCRjczKHFwUcD4zUZ2UlsnUhGoemIYk2nCZ6UjUbpPPwkg8eN0DjJA
 wu3fAkTt8pVC9fXPDxRh0v+MwLMQUoz3KmruRkZrnm6b7hUDGtj11YQTnk2iHwijm3+HYl8T3tBumY
 7gT6EUrp67O+/H/0sq5qZMc4q3xAX+1yqyQfdvnyaI2qUfvRhwDdiXLthxrZE80YL3vG3W9UN3yk+V
 I7Gwl8sJpzKTevNhBIYUvvQh8a1BMyiAFUKT20Zu1YRAAK4YJA4yo/RYmnazb7L2J9wwPFNRaMQD2e
 yJf218RosAh/v0ryiddosAwhMw0/Pp5jshuGAwJG5SKTO2uOXh6eNmshvxRg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initial design was recursive to cover all port/endpoints, but only the first layer
of endpoints should be covered by the components list.
This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
first endpoints instead of recursing.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
 1 file changed, 21 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 7f41a33592c8..97ebc07357bb 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -426,46 +426,6 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
-/* Possible connectors nodes to ignore */
-static const struct of_device_id connectors_match[] = {
-	{ .compatible = "composite-video-connector" },
-	{ .compatible = "svideo-connector" },
-	{ .compatible = "hdmi-connector" },
-	{ .compatible = "dvi-connector" },
-	{}
-};
-
-static int meson_probe_remote(struct platform_device *pdev,
-			      struct component_match **match,
-			      struct device_node *parent,
-			      struct device_node *remote)
-{
-	struct device_node *ep, *remote_node;
-	int count = 1;
-
-	/* If node is a connector, return and do not add to match table */
-	if (of_match_node(connectors_match, remote))
-		return 1;
-
-	component_match_add(&pdev->dev, match, compare_of, remote);
-
-	for_each_endpoint_of_node(remote, ep) {
-		remote_node = of_graph_get_remote_port_parent(ep);
-		if (!remote_node ||
-		    remote_node == parent || /* Ignore parent endpoint */
-		    !of_device_is_available(remote_node)) {
-			of_node_put(remote_node);
-			continue;
-		}
-
-		count += meson_probe_remote(pdev, match, remote, remote_node);
-
-		of_node_put(remote_node);
-	}
-
-	return count;
-}
-
 static void meson_drv_shutdown(struct platform_device *pdev)
 {
 	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
@@ -477,6 +437,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(priv->drm);
 }
 
+/* Possible connectors nodes to ignore */
+static const struct of_device_id connectors_match[] = {
+	{ .compatible = "composite-video-connector" },
+	{ .compatible = "svideo-connector" },
+	{}
+};
+
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -491,8 +458,21 @@ static int meson_drv_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		count += meson_probe_remote(pdev, &match, np, remote);
+		/* If an analog connector is detected, count it as an output */
+		if (of_match_node(connectors_match, remote)) {
+			++count;
+			of_node_put(remote);
+			continue;
+		}
+
+		dev_dbg(&pdev->dev, "parent %pOF remote match add %pOF parent %s\n",
+			np, remote, dev_name(&pdev->dev));
+
+		component_match_add(&pdev->dev, &match, compare_of, remote);
+
 		of_node_put(remote);
+
+		++count;
 	}
 
 	if (count && !match)
-- 
2.25.1

