Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF9F4E27C1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F49E10E41A;
	Mon, 21 Mar 2022 13:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F41010E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:37:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id h16so8002821wmd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNEg8vlsQ11Lpgkkrda5koYAZz2XxJeEtT3/uBkpQRc=;
 b=EV/nk2RNA9yk3hPFxtB1ACpOjYRiBwiP7VPcXo26xviYzszA32+KYbpzTSycHKFjB+
 eWgfROWMZ1YABQoZKkP5PQhRmoK+CVDBQ+oprSicpeQ89eSr9FaAMDtHxuTGQ3MGk7nW
 Cy97wD5J+sZem2PBDLKdRxwsYZoLbvdhWqZ8qu5Wnik+RiQcMvWJXKbB4VXZ7t+VrW7i
 5TwUY2oIMPHQ4FwqVUmAhafqujQVb3xLJSkBU5b8vannihf5AX33OpPWmicwXIMYryc8
 iUeDXsUec5jc3KoWMNlZnmkkQzf3BrfNOSh6RjB9ergO42IuvdsnPCpUblT55daztyTo
 DsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNEg8vlsQ11Lpgkkrda5koYAZz2XxJeEtT3/uBkpQRc=;
 b=aeZkjyGxiFkOya9u3L2resSGdxOVv1ponQNjy8D+afZI4CoEYWYO3utyqjQefPYtES
 43bodRUzacy/jZaceSPN0y+YpJ+VaPUxexJeAXDKNCnmDDgEFN6KnKbjJKv9tOwWsSh1
 sCpfsUOirhbG9jtrZTxovCj2cbJzHYEjdYBFVUODNjciD0Pb5DVfzwrhlIbqlz6Er3ge
 HHytVxucwBgkgZAcgeinuCaDlE26lfnGmGwjszzK/SgoGJi1aeajEiiGAzHsIgyzbaOw
 KD8C0vaSyOzM3bK+AgjQz3FzbEjxzXBQmv1Zbi6Dz3nxausZ3mbZr6YHOq4qi2AqtBfY
 NY7A==
X-Gm-Message-State: AOAM5320sTJ9zryhBvckKzdJwfcVIVeBDD2eHRUKzbiHyaN8/unMbdBp
 mhgpMbx7D6MrYH+fV0+kcKJApazcAj4CPw==
X-Google-Smtp-Source: ABdhPJwUlJK34K9YNvvV2XWhQvy2ElJxxn4lifLxBtjMM4xkIyawSX1FrxBzpry9dKWcN+Tz8u1QQA==
X-Received: by 2002:a1c:3bd5:0:b0:38c:9b9f:1b24 with SMTP id
 i204-20020a1c3bd5000000b0038c9b9f1b24mr7898377wma.129.1647869829735; 
 Mon, 21 Mar 2022 06:37:09 -0700 (PDT)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d5445000000b00203f8c96bcesm7969426wrv.49.2022.03.21.06.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:37:09 -0700 (PDT)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 1/3] drm/ingenic : add ingenic_drm_bridge_atomic_enable and
 disable
Date: Mon, 21 Mar 2022 14:36:49 +0100
Message-Id: <20220321133651.291592-2-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133651.291592-1-cbranchereau@gmail.com>
References: <20220321133651.291592-1-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ingenic_drm_bridge_atomic_enable allows the CRTC to be enabled after
panels have slept out, and before their display is turned on, solving
a graphical bug on the newvision nv3502c.

Also add ingenic_drm_bridge_atomic_disable to balance it out.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 34 +++++++++++++++--------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index dcf44cb00821..2bbfd2e7fdab 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -226,6 +226,18 @@ static int ingenic_drm_update_pixclk(struct notifier_block *nb,
 	}
 }
 
+static void ingenic_drm_bridge_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
+{
+	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
+
+	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
+
+	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
+			   JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
+			   JZ_LCD_CTRL_ENABLE);
+}
+
 static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
@@ -237,28 +249,20 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (WARN_ON(IS_ERR(priv_state)))
 		return;
 
-	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
-
 	/* Set addresses of our DMA descriptor chains */
 	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
 	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, next_id));
 	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
 
-	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
-			   JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
-			   JZ_LCD_CTRL_ENABLE);
-
 	drm_crtc_vblank_on(crtc);
 }
 
-static void ingenic_drm_crtc_atomic_disable(struct drm_crtc *crtc,
-					    struct drm_atomic_state *state)
+static void ingenic_drm_bridge_atomic_disable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
-	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
+	struct ingenic_drm *priv = drm_device_get_priv(bridge->dev);
 	unsigned int var;
 
-	drm_crtc_vblank_off(crtc);
-
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
 			   JZ_LCD_CTRL_DISABLE, JZ_LCD_CTRL_DISABLE);
 
@@ -267,6 +271,12 @@ static void ingenic_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 				 1000, 0);
 }
 
+static void ingenic_drm_crtc_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_off(crtc);
+}
+
 static void ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
 					    struct drm_display_mode *mode)
 {
@@ -968,6 +978,8 @@ static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs =
 
 static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
 	.attach			= ingenic_drm_bridge_attach,
+	.atomic_enable		= ingenic_drm_bridge_atomic_enable,
+	.atomic_disable		= ingenic_drm_bridge_atomic_disable,
 	.atomic_check		= ingenic_drm_bridge_atomic_check,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
-- 
2.35.1

