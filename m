Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE057BAE1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84A68F6D7;
	Wed, 20 Jul 2022 15:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE10D8F6D7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:53:41 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w7so2885749plp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PaVrZ0eRNjr+pr3ZZXawjElGckp5XUV6/rIxT+wqok=;
 b=XAWPI9yhedgZbuZQ4FH8jZaD5AaDAof/z9hLAnw19sGJyyeRa8YawA92DGQwd164Ep
 C7ryWnPgJRg0nnopxbfKtK7KxuIgWBTpNKLqMHR7dtV/N114zexH6X1UNWI6hGywYaZt
 BNKyuhcxr9rTUkYpmXYjji4pmV2W6eJ5/nTaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PaVrZ0eRNjr+pr3ZZXawjElGckp5XUV6/rIxT+wqok=;
 b=p1dgDy/HnZhcU8QE+BTIitRpKpIFkVSSMBgaM5EHuXtjwcvmDNiiSAq+ejtlnokKh+
 saGEWv22w89SBzHk7D5JNYQg/iNDKFCVNN9Ee0yKVuAX39hHNvaQDt085AINTT5K7ta4
 /+0vaZizQq7Mi655+4j7B+bOhELs6Tapk1837tPC4r2nVHdE8Hs1c7MMGnpZEewTIYhL
 sTcUoKSSMCn3bSYkQIF46e1hykkV/1NbrqaRcdt0tGbFHfisnH8fh5/hx8/wCKgPNDgS
 8sT367k+fz05J3k7C9tp7deI2THmWaabDUnNPY8Pfbczl2ZW4rFpc93cUphQbrNmUubj
 ReyA==
X-Gm-Message-State: AJIora9h9qhPVabiuKOvNHg8iYdx2hkmdZNtqTuAbFjmpYehLs4AgB+K
 BlR2lFtdmK8XJhOdswDL6wFq5w==
X-Google-Smtp-Source: AGRyM1uSqluZlQGGuG4DX9SfP59bqukpblCQiN+wllXyBZKfba7SfGioro+1EVRUsx1g+R/tWLL73A==
X-Received: by 2002:a17:903:191:b0:16c:3d49:b0c8 with SMTP id
 z17-20020a170903019100b0016c3d49b0c8mr39502922plg.95.1658332421306; 
 Wed, 20 Jul 2022 08:53:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:53:40 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v3 10/13] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Date: Wed, 20 Jul 2022 21:22:07 +0530
Message-Id: <20220720155210.365977-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Finding the right input bus format throughout the pipeline is hard
so add atomic_get_input_bus_fmts callback and initialize with the
default RGB888_1X24 bus format on DSI-end.

This format can be used in pipeline for negotiating bus format between
the DSI-end of this bridge and the other component closer to pipeline
components.

v3:
* include media-bus-format.h

v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 376e9682e130..2584343b767a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
 
@@ -1339,6 +1340,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state,
 				     struct drm_crtc_state *crtc_state,
@@ -1378,6 +1405,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= samsung_dsim_atomic_get_input_bus_fmts,
 	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
-- 
2.25.1

