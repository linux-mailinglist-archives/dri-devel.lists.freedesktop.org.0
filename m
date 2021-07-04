Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3A13BAC66
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE8689DE5;
	Sun,  4 Jul 2021 09:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E887689DE5
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:05:54 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id w22so10025302pff.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPJDGg5FUIlGKxFIr3cHBiKXJApkbS5HOtFGL2ZFtnI=;
 b=Y5vOqA5VOi+FrwY2NKDcz7f743/FfVMilz2a7ydOaqlPDwHXGJjXCnQvNZTUZG/VAJ
 0BEywGa25xiOVnSMvFN7wTdpafQeHwxBu142wKYTkUutW6p/tf4wc4vO4Nx3curO3sw1
 +8tiTqWBXHMVJq18XEJ+M59Ivjsq64+kwcAeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPJDGg5FUIlGKxFIr3cHBiKXJApkbS5HOtFGL2ZFtnI=;
 b=STg96MZQYCtOu3gHuTB6baBsEvMVRuCLSELdDSKHPyu6f/oh4hYbIUkWYUMOiX6DoM
 4IwnWS72eDUy7+77HUznMaaSa447/48GF4Sb0IUu+z4TDk9RanIQKKz4BKk3rU26qHT2
 44SdWq1uJFxOGbpwgC8E6p+r4M1bB+5rew/oLBwI3/wb/ekI8V1BfZmc1rwBTvNiGnTq
 akSqnSHFmd6uSGnoFKiJnllubGFEhXuwactSvB0ugAgKtOl9VUidaNc1oHA9lSDpc6If
 jHYMniswIkltX1+pmkq09DBn80eaBxV96bKeYhHQgUKU8vB21mqbH0+NG+ueLK717JqZ
 GJ4w==
X-Gm-Message-State: AOAM531VhAfpfTRQcbpeNbTIe3Py/4fOj7gMi8mDf/n8gwQ94t8kj5AA
 VdS3RAb+vsWmRO4bRyldCtwK2g==
X-Google-Smtp-Source: ABdhPJzkHWVdOK7EaakstBIyQU5sd1VI/Q64M2LP26zyXubUC+ZrLsxppnNHkOOSw62DRzm7TEhTUg==
X-Received: by 2002:a63:4b23:: with SMTP id y35mr9529467pga.179.1625389554638; 
 Sun, 04 Jul 2021 02:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:05:54 -0700 (PDT)
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
Subject: [RFC PATCH 17/17] drm: bridge: samsung-dsim: Add bridge mode_fixup
Date: Sun,  4 Jul 2021 14:32:30 +0530
Message-Id: <20210704090230.26489-18-jagan@amarulasolutions.com>
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

Fixing up the mode flags are required in order to correlate
the correct sync flags in i.MX8MM eLCDIF.

So, handle the mode flags via bridge, mode_fixup.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0ed218f5eefc..c2a76ee5ac4e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1474,6 +1474,16 @@ static void samsung_dsim_bridge_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static bool samsung_dsim_bridge_mode_fixup(struct drm_bridge *bridge,
+					   const struct drm_display_mode *mode,
+					   struct drm_display_mode *adjusted_mode)
+{
+	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+
+	return true;
+}
+
 static void samsung_dsim_bridge_mode_set(struct drm_bridge *bridge,
 					 const struct drm_display_mode *mode,
 					 const struct drm_display_mode *adjusted_mode)
@@ -1542,6 +1552,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.enable = samsung_dsim_bridge_enable,
 	.disable = samsung_dsim_bridge_disable,
 	.mode_set = samsung_dsim_bridge_mode_set,
+	.mode_fixup = samsung_dsim_bridge_mode_fixup,
 	.attach = samsung_dsim_bridge_attach,
 };
 
-- 
2.25.1

