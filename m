Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F9347C23
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8873A6ECA2;
	Wed, 24 Mar 2021 15:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A3F6EC5D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:31 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a198so32535980lfd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPEBJGZHxZvASfnJl5UyU4ySRa9bo19Qh8IfkJJg4KI=;
 b=UZiUs5DZYUtSqmR8x4nciwVqKTI7wqKlG5uIqihsEQkKVrl+RJhibIz8sTdSUNq1a/
 17xQ+Q/zIvW5VFtdgsMcnaDrTirg9PA8esZY0pMCZCIoSITk96o1qm29XmoWeRVLlihY
 SwHemcl5T0lffLIrzdx6oUO+zz3kBk5VdpANwNiUMqffNirofVva3TTXQSWPq22mD9NZ
 05JvxC0eW5rf+bKqj0cFZnWXQon13biDLpwN7IEH9j8cnFBkp90rvVjPFGPUI8ePNwyZ
 O9HbvjB915uJToHaVZfAV69XS1qyEHRKkijnYQVdwYVbizN+egvysckbKm3CLHOJ7KT+
 Ougg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPEBJGZHxZvASfnJl5UyU4ySRa9bo19Qh8IfkJJg4KI=;
 b=YiIJlEMOX7HPmNIsjAZIgwdrnMFu7E9z6/G4fFzZ/BDrRD2QW5zoLE1d7SUYzf4Qly
 ZepvJyx6kR44K1lOzoT1ZGX+tfI2jQGiZMYNkV6P/WGK/Wh098B5fGW5PcJHlwqxhL+y
 OxJ8Q66MbPiRKfvU3tgbJmu5C+E2rnRCY+esSmflzryBGuqX7B1vTj8uGmdY2Iec/d0A
 8qE7FN0w4mEio7rUVHA2P47U/T7kQuzNcwFVGFG5UGdS9DlPIVuj/LEcQt0ZlYgm3brx
 2EauiTE00XzpoQkZ9QFAajuvVdFD5YygQyKTgl57Nj+sx3fhs83XoGPXQ/I5aM/yPTyX
 snLg==
X-Gm-Message-State: AOAM5322bqnp0k4hRjLhZDeWQKpsHqpoBtptM9tQUgxQyAgeaPW1O1d7
 Q0x0eilWV2UZZIJnwhzwagD57A==
X-Google-Smtp-Source: ABdhPJyjQLftC86rXZBgB7LzSNXywkuWQnwG/2o1+Ztx5b6qU9VLnxID213ABvINLhedvfNIHLHbOg==
X-Received: by 2002:a05:6512:20d9:: with SMTP id
 u25mr2157061lfr.452.1616599169890; 
 Wed, 24 Mar 2021 08:19:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 17/28] drm/msm/dsi: make save/restore_state phy-level
 functions
Date: Wed, 24 Mar 2021 18:18:35 +0300
Message-Id: <20210324151846.2774204-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Morph msm_dsi_pll_save/restore_state() into msm_dsi_phy_save/restore_state(),
thus removing last bits of knowledge about msm_dsi_pll from dsi_manager.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h              | 18 ++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c      |  6 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 35 +++++++++++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 11 +++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 26 ----------------
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.h      | 11 -------
 8 files changed, 42 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 1357fa15f320..5c32ee2b3605 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -92,21 +92,6 @@ static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
 
 struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi);
 
-/* dsi pll */
-struct msm_dsi_pll;
-#ifdef CONFIG_DRM_MSM_DSI_PLL
-void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
-int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
-#else
-static inline void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
-{
-}
-static inline int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
-{
-	return 0;
-}
-#endif
-
 /* dsi host */
 struct msm_dsi_host;
 int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
@@ -180,9 +165,10 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
 			struct msm_dsi_phy_shared_timings *shared_timing);
-struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
+void msm_dsi_phy_save_state(struct msm_dsi_phy *phy);
+int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 6b65d86d116a..2976b09a881d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -493,7 +493,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct drm_panel *panel = msm_dsi->panel;
-	struct msm_dsi_pll *src_pll;
 	bool is_dual_dsi = IS_DUAL_DSI();
 	int ret;
 
@@ -527,9 +526,8 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
-	/* Save PLL status if it is a clock source */
-	src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
-	msm_dsi_pll_save_state(src_pll);
+	/* Save PHY status if it is a clock source */
+	msm_dsi_phy_save_state(msm_dsi->phy);
 
 	ret = msm_dsi_host_power_off(host);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 74a4e2daade8..7d23371a83f6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -799,9 +799,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	 * source.
 	 */
 	if (phy->usecase != MSM_DSI_PHY_SLAVE) {
-		ret = msm_dsi_pll_restore_state(phy->pll);
+		ret = msm_dsi_phy_restore_state(phy);
 		if (ret) {
-			DRM_DEV_ERROR(dev, "%s: failed to restore pll state, %d\n",
+			DRM_DEV_ERROR(dev, "%s: failed to restore phy state, %d\n",
 				__func__, ret);
 			goto pll_restor_fail;
 		}
@@ -838,17 +838,32 @@ void msm_dsi_phy_get_shared_timings(struct msm_dsi_phy *phy,
 	       sizeof(*shared_timings));
 }
 
-struct msm_dsi_pll *msm_dsi_phy_get_pll(struct msm_dsi_phy *phy)
-{
-	if (!phy)
-		return NULL;
-
-	return phy->pll;
-}
-
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc)
 {
 	if (phy)
 		phy->usecase = uc;
 }
+
+void msm_dsi_phy_save_state(struct msm_dsi_phy *phy)
+{
+	if (phy->cfg->pll_ops.save_state) {
+		phy->cfg->pll_ops.save_state(phy->pll);
+		phy->pll->state_saved = true;
+	}
+}
+
+int msm_dsi_phy_restore_state(struct msm_dsi_phy *phy)
+{
+	int ret;
+
+	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
+		ret = phy->cfg->pll_ops.restore_state(phy->pll);
+		if (ret)
+			return ret;
+
+		phy->pll->state_saved = false;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 2c5196844ba9..8133732e0c7f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -6,6 +6,7 @@
 #ifndef __DSI_PHY_H__
 #define __DSI_PHY_H__
 
+#include <linux/clk-provider.h>
 #include <linux/regulator/consumer.h>
 
 #include "dsi.h"
@@ -13,6 +14,16 @@
 #define dsi_phy_read(offset) msm_readl((offset))
 #define dsi_phy_write(offset, data) msm_writel((data), (offset))
 
+struct msm_dsi_pll {
+	struct clk_hw	clk_hw;
+	bool		pll_on;
+	bool		state_saved;
+
+	const struct msm_dsi_phy_cfg *cfg;
+};
+
+#define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
+
 struct msm_dsi_phy_ops {
 	int (*pll_init)(struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 6300b92c65eb..e0df12a841b2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -782,7 +782,7 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	phy->pll = pll;
 
 	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_pll_save_state(pll);
+	msm_dsi_phy_save_state(phy);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c482e51d1bee..e6c8040e1bd3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -807,7 +807,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	phy->pll = pll;
 
 	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_pll_save_state(pll);
+	msm_dsi_phy_save_state(phy);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index 96de79b94f1b..652c2d6bfeec 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -56,29 +56,3 @@ void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
 
 	pll->pll_on = false;
 }
-
-/*
- * DSI PLL API
- */
-void msm_dsi_pll_save_state(struct msm_dsi_pll *pll)
-{
-	if (pll->cfg->pll_ops.save_state) {
-		pll->cfg->pll_ops.save_state(pll);
-		pll->state_saved = true;
-	}
-}
-
-int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
-{
-	int ret;
-
-	if (pll->cfg->pll_ops.restore_state && pll->state_saved) {
-		ret = pll->cfg->pll_ops.restore_state(pll);
-		if (ret)
-			return ret;
-
-		pll->state_saved = false;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
index c94f079b8275..eca13cf67c21 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
@@ -6,21 +6,10 @@
 #ifndef __DSI_PLL_H__
 #define __DSI_PLL_H__
 
-#include <linux/clk-provider.h>
 #include <linux/delay.h>
 
 #include "dsi.h"
 
-struct msm_dsi_pll {
-	struct clk_hw	clk_hw;
-	bool		pll_on;
-	bool		state_saved;
-
-	const struct msm_dsi_phy_cfg *cfg;
-};
-
-#define hw_clk_to_pll(x) container_of(x, struct msm_dsi_pll, clk_hw)
-
 static inline void pll_write(void __iomem *reg, u32 data)
 {
 	msm_writel(data, reg);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
