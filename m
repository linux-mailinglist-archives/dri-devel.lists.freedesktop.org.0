Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE48D753B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7810E16F;
	Sun,  2 Jun 2024 12:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uC+dCkI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEAA10E127
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:58 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52b950aa47bso861466e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329896; x=1717934696; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kNuDl566fdESfLAQYfAX73LiPJqclp33YW6YrFo8/hQ=;
 b=uC+dCkI92mHniKjdu3UXwMydZek6kxd2MUikbZ0qu8P4qF9x/Nb+Mhvm1oaGu+LsCp
 V/Pw/fYjitF97txg/5KDGxQzVaInZ7g7j5aVS3X9YS5Octgdyd/SEGaL+0riF4ojYACu
 JvsJbQE5WlCUsklA/yPGywoUC0F7zq7cVuR6vbGZmdqwe0uI6Y9whRV8k9Vm46cnzxu9
 /w2heWXzYR2aw2iBzWov/QA0KOT5HKUikADJn+K70g+j95rZ99Vw3P4Z7HYRnMyPYL9F
 Arf+9wDm0M3x+0M6cEx45lwx66Ymcga2VWcJ0pN1y3PqtE9+nu9KMF8I+095nyEZaakK
 Dejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329896; x=1717934696;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNuDl566fdESfLAQYfAX73LiPJqclp33YW6YrFo8/hQ=;
 b=paC+kv+G+jQKpQBhpw72qqNPLWfGnxN6GeJ0Z1Et0Kg3f7Hlqf68UyMMjjvQ86Wt7E
 k+74voWdqWRBV2rqGzMPS9oniQyo1b/EnMPu506Fyi61iZTzTk4z4IgW4NSKkFPgaoDT
 Dyuk12JR/0vRCTnH5NSEkF58I3Ti7atqhFdumLoWbvdpaGQ2dlcn6G7cw6ySt6sNRkXT
 6ZQRe+YCFF+GufcuNbwF0eNGTcvs3naBoN8m6n1boKUFi3ItE0XGdSZnlxcLgFwyxsN3
 BchdwkURtB6ccmN4YWLt9+RfdbmjIQL0YNgF9mu34Mh9l+auMCCPag5tm0+RszpXugtn
 B+GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF6fukjGgRWhhRJPKp21p/nA/M9qR6HFzu+bxkmWMeT+0o58PG17N6YQXZPGS/sp39GKuXX8PR5fP8caU3TSc+WjRahXk35/D7nms3dACV
X-Gm-Message-State: AOJu0Yxmk5H9V0PEdAEMdOo56auuu+xo6+bWf03gfcPuxyIOM8HoL24N
 a5scflgt1OGKHfeyoBjcCPQnEmdfUcHHsEfgme3SOFN58zLLrVI3seY2XYDhL3w=
X-Google-Smtp-Source: AGHT+IEFQgWpWrVek9sgb57OqXvq4Yl2GmvGbIbFNiQhz8GQhgLZZKzZdXR7VkMjAFTMyvzTXG7Rfw==
X-Received: by 2002:a19:c514:0:b0:523:70db:7a0f with SMTP id
 2adb3069b0e04-52b8958b9fdmr4091009e87.8.1717329896464; 
 Sun, 02 Jun 2024 05:04:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:52 +0300
Subject: [PATCH v3 12/12] drm/imx: move imx_drm_connector_destroy to
 imx-tve
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-12-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h/DSMM9BfsUckdlfOnVl0fUleOjgfbtfRzHBaAfH+mc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/eWV2GMqKPP+JRWmUQkel1cF728TylDcmgO
 0eEmDycmaaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3gAKCRCLPIo+Aiko
 1dhZCACRu+PPllOgalpri1YjKo6EeMiZwJWGWbZB7vOG0XyWYSRR5eOJXBxq7Dj/kYq1tegFmZ3
 sXQtiS/j7TCmbhCYqvEG+QiVIv0VxmNuCjq9qOFsMBTD6/FUpIAzVeNrhl5Qy7mrMXjC1M6bHZ+
 v6/8k3KX4MHbqfZRU5Dpp2zbGsEAc2rTMc1oDNLCYVtEGVj6iBBwBREE39J09ROUeymKQxN9zyL
 eUrLTC+oNnRZxVOhJCFH3vqAPavR2QAJ0efqynRhJ+JKGykNLo0kYI/5rrBb/NVGncTm86QrMCI
 xXuY1XxZTkkPPdY/sYjc+KccNcaJHNxc/1mFxsBUvQSY06WQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The imx-tve driver is the only remaining user of
imx_drm_connector_destroy(). Move the function to imx-tve.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 7 -------
 drivers/gpu/drm/imx/ipuv3/imx-drm.h      | 2 --
 drivers/gpu/drm/imx/ipuv3/imx-tve.c      | 8 +++++++-
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4cfabcf7375a..189d395349b8 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -34,13 +34,6 @@ module_param(legacyfb_depth, int, 0444);
 
 DEFINE_DRM_GEM_DMA_FOPS(imx_drm_driver_fops);
 
-void imx_drm_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-EXPORT_SYMBOL_GPL(imx_drm_connector_destroy);
-
 static int imx_drm_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm.h b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
index e01f026047de..0c85bf83ffbf 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -25,8 +25,6 @@ extern struct platform_driver ipu_drm_driver;
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 
-void imx_drm_connector_destroy(struct drm_connector *connector);
-
 int ipu_planes_assign_pre(struct drm_device *dev,
 			  struct drm_atomic_state *state);
 
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index 29f494bfff67..d46d07d25f51 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -305,9 +305,15 @@ static int imx_tve_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void imx_tve_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
 static const struct drm_connector_funcs imx_tve_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = imx_drm_connector_destroy,
+	.destroy = imx_tve_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.39.2

