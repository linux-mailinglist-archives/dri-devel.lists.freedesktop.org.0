Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD8715725
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AA410E367;
	Tue, 30 May 2023 07:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A5E10E358
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30ad458f085so2729811f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432304; x=1688024304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jfEXvkrzeaqY3Zz/djBQFxvd7vEtcQQIyY+Jgs9PfMk=;
 b=krxbND8uKOMMZsMfjM4tgwX0/ik3KeKaeWX6435WFpJSGefc/k9tb6CEc6ELkHKQDX
 gHm1rc7h1CPqB0W8opYJWRRwrkCSsrKUULYrkeLlnwjEo/fHheAG5HE3vUydEIJ8msGk
 kvdNuyNnOrpIfR8dLNRjJA2daGNb+B9peXTRayFhm+mqrmfVDTWXdjzVJnv/uW/Hrt4K
 fGd5TXk4puGWhtT2JIc8vrOm2pRyYBa8VWwZ+CcfC9lU13zGAJ5zQeuzeA9unmpZALvq
 jerl1Ervf0exDkS9wig6JqxHOBALoaNIUDQaGXqRzzTG1cgQE2yEmem1zPnWnhcvymLd
 Hxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432304; x=1688024304;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfEXvkrzeaqY3Zz/djBQFxvd7vEtcQQIyY+Jgs9PfMk=;
 b=KcphiKcE/Ustwph2BR5OLHYM8h0QcTQel0UgtYrIS6v6GF3BmSN781qKhdEAoQeYJ/
 QOIbE5X6UnSIytQm6DHy64YW01j+Z9bcZEN1VrOS5VwhuRtGPkSIqAy+75p4JaTapnat
 i7RV0qmWBOYN5V02pd14yLaRdzqVSzPut6mWDzlM0UtgRsA5rpOLZ1FA/IU7MOq6fm6p
 PjNPNEKnbhCNH785loqQHx8lfNtopP6aIvk3UBGRQ9f1eR6EpLJ/XCZ8tgRZa/MX0iyw
 OuQXWufbdY1u3TgEYKA+lviBy0KcFjZKE0ZSLimjpLiw9wCeeE2Kv4M30AGylsqGuVZp
 coiA==
X-Gm-Message-State: AC+VfDxxobOR9rfLkC4n5oataJqP4rdYSjPjiMzGyLqUMIIqIanPf7uY
 c2jQhLPH9YHy29ClSRozdhuxIQ==
X-Google-Smtp-Source: ACHHUZ6mZIDAxfv5le0pkcFkIO+8ARVgJXLbbQt8/vxlwETrhc1V1bFh5QTnMwv7dpsAPCXNUZOoFg==
X-Received: by 2002:a5d:4044:0:b0:30a:8e6a:3d77 with SMTP id
 w4-20020a5d4044000000b0030a8e6a3d77mr1142304wrp.1.1685432304012; 
 Tue, 30 May 2023 00:38:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:10 +0200
Subject: [PATCH v5 09/17] drm/meson: only use components with dw-hdmi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-9-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nVXfezvQbKE5gC4JrB0CVduxieCr6UkdveYDXaG+sjI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafgB8ChwHhm0E9pEZfTkphqOUzLZTgFYnPzxmOG
 /S4wCUKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4AAKCRB33NvayMhJ0UkyD/
 4nse+EzB7hATP8CQAMK3zfVTtmlq8CoWG5Fcwju9bfQsCYBVPvp9Zysjg6wxBX+W13gkaO96AOb2J7
 foQf4doFXgEZJzBRjoX21BePaAK5dtyqI27XYUWL8zvYWQfZ/kDfhezwKt6FBKyalaeNCMgTwsvnbe
 60ycoHMPi4z56Gc08oDa4f5DcqQ6eWkAXe+SVypHwmoti6uEyl3icc6ca0D8APd+s/Jg4sHopL/Xr3
 JiiGulF3tQXV6hF88aWtgMKQyLpKhbBu2Qcm1mhi+G5rnkdFFxB9spFkTYLuMsn6O/+EZjdC+qhCAI
 rP6BhyvoAYUB+MHEvTbjIja5e9v7x874k5tXcxQ+CpCmIdrJxTAuNQgur1E0DZOMMisqTmeap/vHyZ
 AH09CltXd1ZrSl5qlliTw0vrwplJb6cDK8L/nQka5f868acWitvPVcpUKeA32xF8X6WA7iQWBHBRO4
 EMpnhPZH0+2/2rZZcOqqBgRWs4jL6/D4rXpZzkQZ+Q0l7k5VbNt8tjVG3v3giWr369aRlQNZs9SePj
 vM68t+3W47ka0W7g5jJ3cFXafmjJme1FwBjc9PXiSEeYAjSaDVCE6iNfyQmLtruHqFev5ITlubRTBm
 yIquMb+6j1mJXzhswTrD205PsdVr1BDSFRBvv4WUcoKNU8XCUv7Pfe1GWIUA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only DW-HDMI currently needs components since it reuses
the drm-meson driver context to access HHI registers (sic).

Once this is solved, we can get rid on components.

Until now, limit the components matching to the dw-hdmi compatibles
we know to require this hack, for other bridges simply use probe defer
instead and get over this components sitation.

The back story is that we simply cannot attach DSI adapters bridges
if we use components, only DSI panels, this is because we bind/unbind
the DSI controller at each drm-meson driver master bind tentative.
With this the I2C DSI bridge is unable to find the DSI controller
host and everything fails to probe.

This will simplify a lot adding new or older HDMI bridges.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index e060279dc80a..e935c0286a20 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -451,10 +451,17 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(priv->drm);
 }
 
-/* Possible connectors nodes to ignore */
-static const struct of_device_id connectors_match[] = {
-	{ .compatible = "composite-video-connector" },
-	{ .compatible = "svideo-connector" },
+/*
+ * Only devices to use as components
+ * TOFIX: get rid of components when we can finally
+ * get meson_dx_hdmi to stop using the meson_drm
+ * private structure for HHI registers.
+ */
+static const struct of_device_id components_dev_match[] = {
+	{ .compatible = "amlogic,meson-gxbb-dw-hdmi" },
+	{ .compatible = "amlogic,meson-gxl-dw-hdmi" },
+	{ .compatible = "amlogic,meson-gxm-dw-hdmi" },
+	{ .compatible = "amlogic,meson-g12a-dw-hdmi" },
 	{}
 };
 
@@ -472,17 +479,12 @@ static int meson_drv_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		/* If an analog connector is detected, count it as an output */
-		if (of_match_node(connectors_match, remote)) {
-			++count;
-			of_node_put(remote);
-			continue;
-		}
-
-		dev_dbg(&pdev->dev, "parent %pOF remote match add %pOF parent %s\n",
-			np, remote, dev_name(&pdev->dev));
+		if (of_match_node(components_dev_match, remote)) {
+			component_match_add(&pdev->dev, &match, component_compare_of, remote);
 
-		component_match_add(&pdev->dev, &match, component_compare_of, remote);
+			dev_dbg(&pdev->dev, "parent %pOF remote match add %pOF parent %s\n",
+				np, remote, dev_name(&pdev->dev));
+		}
 
 		of_node_put(remote);
 

-- 
2.34.1

