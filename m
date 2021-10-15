Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7F42F4E4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 16:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAAB6EDB5;
	Fri, 15 Oct 2021 14:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54026EDB4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 14:11:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t2so26789563wrb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/l0Ehr0hN3gdq8P9wc6WB+d9mjY1ba6Pwx1xklvzGFE=;
 b=COWJY3S3HVBm38qSt+SY+IzP4X5KLFdEMyOeNmTAM9C1XECvQN1OsPAxRoBIniWNpe
 BDxalVBJsUcoMXDjKbeGc2iker0qZKKj9Ie/xf64AJp6JmZLhjvLhwekXz86mqOkx5H6
 zFWYzWapj0ILXiwwdCmn6W/o7skCHp8YgYJh3Wd2JbMJ/xCcJlkjB8crHTcFPyhkEx3F
 czC6jBSXZEER99zJt6FyulyRKgyVsw+6f1xXP25MOYYso3u1GqrDw3v64ATGYTsXxBJl
 nh7WZ30o3hR5TH/EfJ4/rKPkmCsR9CPfZEntur5NJdDrUAdZ6eL52vjOhT3s7OUt+nt2
 kg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/l0Ehr0hN3gdq8P9wc6WB+d9mjY1ba6Pwx1xklvzGFE=;
 b=s2VRtZv28Kz3ph1TiY5kfJ97R0g2UttBeTkwFUZu2Mm5+cddYergHbLg1sh3rSruHn
 qytpLhLiUQDgCmV4wB/DPwWfx+ithC2SWzv0tcvVxE+WN8sTpTaIwrbrtqmrZwkCmBFl
 SfhAHuPGouhzjwtSShte2IjwIWxm31rrOmrdNpzVv6SEr4iiGiDzG4XYT50btfCjb6oi
 hoy7sGu3FAOp7cuEbpVZXcilXuMCzMIOLI40CPLTEXmSfzdHJj4B4u4gMkPvc3eE/v9S
 JrZ8JYScSiHo3xIXa6yvk7PLnk4LkPB2mCr7PLHySvzJQmClalDzrKFvIoULViLpJFJ2
 8U9A==
X-Gm-Message-State: AOAM532ojGm/EG1mRb7Qu1wC0xivmSbmbZlmEJYIk42ChC3sB+4W3e2W
 WAf7xuao8P+RLEY7kSEtqnHOGg==
X-Google-Smtp-Source: ABdhPJxhnZTPHdrXN9wZhVZR52wCiThQFMI8PqiE8nOcS7plw649C8vClqkbt4hw+8ne598gMMRZTQ==
X-Received: by 2002:adf:8b98:: with SMTP id o24mr14755731wra.302.1634307072822; 
 Fri, 15 Oct 2021 07:11:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id f15sm4971434wrt.38.2021.10.15.07.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:11:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/6] drm/meson: remove useless recursive components matching
Date: Fri, 15 Oct 2021 16:11:03 +0200
Message-Id: <20211015141107.2430800-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015141107.2430800-1-narmstrong@baylibre.com>
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3154; h=from:subject;
 bh=oCHRvKY4DUunQPKqQle3sJaGRdDcBfi+zreDie2LrWE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaYolnyX6k3x3JLsmrS3+lhvHZsU9i/66xJC8E04m
 6OJQ1ZKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWmKJQAKCRB33NvayMhJ0T3WEA
 Cny9MGCazvlcxUanmEjoBua87F74vWSOrHONMv003E0U6XxuaNx9V7dZeynKchhcZ7yF17LbcMc3Rh
 PxbFIci0Y2DEcMBlUB7EmZsZQecfp6OjuWu6k7gQM02P0kIveRwzWpwV+1cu0PJ6xpzV2SyPrxbUcW
 zz6lg09Qs50eDFiLMJrszgbmoGrNdtqs01JAXWGUQ24AZq0myrVUijzujX8x1Z7V1QP6Sse55R1tCk
 JjYCwqFk5WXup4cZp0S9c+Pq9m9Vco89mJD/3jD6gBj5dabZCANbF7tOS95OBtjNsVekw0QyF1kdtw
 En36Q3zJl8oa/E9Lhr8zTgATokh46RzFdujXg5EkACeNBZtIQPU9abTE7pshTY9Eo30QaGqSoYosmq
 QwhzHdWeihBEj8mk8wsIDvQTalAhJuErMlcihmdTZeo1oN/rbxrKdsQuMzThmJlm6zL6kOhyTzBywc
 K09X48fuNj4fPE1T0a/MJrf0lDIgQhPus2a7Yw+3RV9QQBr0LsPCENgtTVoFS+/k40BMg4PXt/G+HY
 NdfeUS/g4D5+x3Q/v9LNwTQ3D6dsg6ukxli3xVZ4h1qqCibPYFEwNOXbUOW/Q/3UYoeBjdiMnk9ZHd
 +hbUtskikyy9E2r8jIAMikZMzcA2I3EuJnVNqMdnZxRXYZeVL14JjV8tDJEw==
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

