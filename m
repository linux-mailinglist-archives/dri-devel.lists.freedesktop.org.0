Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22AD42DE17
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE696EB4E;
	Thu, 14 Oct 2021 15:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3966EB34
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 15:26:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e12so20715362wra.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQyJyeyxugDyeCUhn5i4YMOhGyD1g0TIMIamYKTURg8=;
 b=aUp3lJkhPh7AP+vd/IxIyLZ9pww2/86fdh30VMRPWAjOPgcYeMdPzrsxZP6sBE00E8
 pGgzyLGLmp7zVQ9cUv4mpduzaEXvlUsIaRQ5JV5NYw5sBZgTNhtsBPU8cWCoubF4OfIc
 We6escDBTXR7ecjOqAG4gkw4+7NGQRUo4+QsAzHDndGtbN1dr1o8V2Z1KEESagi+16Rl
 5fOOUoFuqRymwJctDz1xKKLZDd4T60MPavnGIjCNluwnnSLQII3vOnjSlAbJt3b7KJll
 vQmOM1DfYTWxh5JoOgbb+9xIQpmPQaoVZxhIPK6kR3U8HplWUWWagcbLKHRnB6FdBF16
 6gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQyJyeyxugDyeCUhn5i4YMOhGyD1g0TIMIamYKTURg8=;
 b=nzxKJS9v+S2fAziG5uO3wmCEQ+5tFPaPzEVt+d6V9Y1bQtLA2cWajIz5ZKEtdpxyLa
 8DpLiCISoJntS25ZhykLOUNScE6dfi8FlQKmhSGbWTuJw0McziwWXLjeqPxAniqdCFzB
 B0SRZCPRRzKXce6kZ/enFHfjMcxPzvE1HEeW6kRUkR4bYvHnzbDz5VRFfXNPh9s07Rfl
 8Iqt/4F8g3hQK28RDAlCQYVCAAep5ynsxzfHEYCesDqw3aDkvZeFrfXVsNp/dtW2tiD5
 /esKDGktGgfIuZRmV5xqSYrLl89e8rw1/uw6p8WksAnRnsKncBFBQ0QjKFnKke94iSuE
 rRMA==
X-Gm-Message-State: AOAM533JLszCUxSG5dV+DvIVojyPnbcgo3ZIZoX7dqtBAvMT345lClIa
 TrVo0uZn1FSzh2UXZrUmT5ueag==
X-Google-Smtp-Source: ABdhPJxnLyE8e0XkabFsMCNQvlY0H++PdbAFZrHOuqQqMKmsmbK8aX172SuBdkcJX2Cj9DFX3GNU8g==
X-Received: by 2002:adf:bb93:: with SMTP id q19mr7638741wrg.423.1634225174291; 
 Thu, 14 Oct 2021 08:26:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/7] drm/meson: remove useless recursive components matching
Date: Thu, 14 Oct 2021 17:26:01 +0200
Message-Id: <20211014152606.2289528-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014152606.2289528-1-narmstrong@baylibre.com>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111; h=from:subject;
 bh=hBDX9bpPEmClmGilczb0BvjIpqS0+aaehaCml/3nEUs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEt/6ArrByBlXtYa4Vcu1Celjod/sPgyacJsGSYf
 F+mjdc+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLfwAKCRB33NvayMhJ0UhTD/
 sH5NZJVQx2YWy6sRmd61nqnsAGOSLvKNLmGt8xiRmm0Zb6ckWoeM30vuE14uVqqzR5ikE4cAk/T3jF
 7/r1O/KwZkOPSCzUIFpNFuzUPkO2d0DjdyTSbkZFUEmBLmAwGFio3y6BQu8Pa4pURJP0FgXWNVYVye
 aT5CTX2lGsSJseYDx5JYNt6U71cmF9f78gV4+1PrRmu8s1rto3ltR/8K7WvWcURGAm8ordgWepmS5E
 7dj0ZYEWUvKWJLZFePsoHZwXUGBcrSLd4N6AP285F8+1dD7pULchywDPVlue6vJwlfVy+QUJUvwu3j
 iXKQNRu2FzqliPbcwmbtkymy6kUvBdRKp3WPoRpPZgAdlEzZMklGMm0UiUFICCyKNt8Cwd9a9mYNGu
 fuOllgCaOoC/cdInuHDEQP3wZdS+m1dlbdFzVPhcYOqSDgtbVGa17Y9DBms8ypC0KWUmIh3TopYHun
 o3mNZ3G5AOzbil+PIl+oFEef6n9t/9w55rU9m1638cRpZOJknrxAdP8NWUDkV3//J6Ynq4UzVEcWbl
 H+4OkvqyX+UchzQ+NrfCQssWeD3aF6Vn+17AML3/MN48tFNupMUCvq106yYJeucpiIlDpfx805qymA
 hXLGWVK/F9bG9qFrA6ImJQW6Otdxc+H9TRc2JpYtS+iSrdbcW7dw6ohCHb/Q==
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
---
 drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
 1 file changed, 21 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bc0d60df04ae..b53606d8825f 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -427,46 +427,6 @@ static int compare_of(struct device *dev, void *data)
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
@@ -478,6 +438,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
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
@@ -492,8 +459,21 @@ static int meson_drv_probe(struct platform_device *pdev)
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
+		DRM_DEBUG_DRIVER("parent %pOF remote match add %pOF parent %s\n",
+				  np, remote, dev_name(&pdev->dev));
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

