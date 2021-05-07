Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434C4376BAB
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7120E6EE87;
	Fri,  7 May 2021 21:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DEC6EE9A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 21:25:08 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so6192099pjz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 14:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JDQIpi4duGO+gr3T6leI1pixvivO9mfx/4pnF4T6aM0=;
 b=iR+3EGUhTc5s4Gj3y5R33xb1iQk6cywKauaR8XQ7YpdN/oE0/ltgfnJikpHGOc2bO8
 B8qTvdbhLkZU794BRyrcrVBA4W0E+lHEhhUwENjm4SQ8m7MENqlQ9RnF66inYdL7IiVB
 2GloVdPJoeeEjtqwSp1unCEYc75VgS+n3QyvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JDQIpi4duGO+gr3T6leI1pixvivO9mfx/4pnF4T6aM0=;
 b=R28qeBoRD2hdr3Zh7Ik0mubjbt29XAAICQo70ZJjVQcqrT9aU2QdfNl6semtIQ2Vyb
 kHIXgZS2cFzCGGS79Y3bE1Ha3XbFnBA1xzXcgRVan9sZfgmRc6eCdxzXFh11XdPExjFH
 +i1uWMyldjr6K5HxjvAmeRbLjtMzTC2rCi2KjiPW5lQAvLzYbsS3oGuPiSx9LxQM2pwX
 e8JVF4ezwzpfVPsUzcdVmK0QXnsOg+F8HI2MGJA+PMt2R0Mr/Jw2NwScnU+iuUuo3EN3
 orGeGC5864b9PdJQDOuPYhpYUwuv6ZYFEHPRHhfiM4CC5xRQyUgHLqthRBjUXSpjURq+
 sNxg==
X-Gm-Message-State: AOAM531wrATjMpb3Kbr0BWYf1CZaay9Iu4NRT0A+yuoZ4+WY/d/Bl+ci
 xJdBHgHfIw7J65s4loKpbtzL+Q==
X-Google-Smtp-Source: ABdhPJwqrWh0LmtA1XC3BoveNqhsQJxPUB4pe7+/er7mY9z3i/c6Fb4kBSjchN7jMD1dyUsnzLVs7A==
X-Received: by 2002:a17:902:cecb:b029:ee:afd7:e58d with SMTP id
 d11-20020a170902cecbb02900eeafd7e58dmr12469210plg.42.1620422708336; 
 Fri, 07 May 2021 14:25:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:ab8b:4a3d:46ab:361c])
 by smtp.gmail.com with ESMTPSA id t1sm4996298pjo.33.2021.05.07.14.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:25:08 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/3] drm/msm/dp: Simplify aux irq handling code
Date: Fri,  7 May 2021 14:25:03 -0700
Message-Id: <20210507212505.1224111-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507212505.1224111-1-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't need to stash away 'isr' in the aux structure to pass to two
functions. Let's use a local variable instead. And we can complete the
completion variable in one place instead of two to simplify the code.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 22 ++++++++--------------
 drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 7c22bfe0fc7d..91188466cece 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -27,7 +27,6 @@ struct dp_aux_private {
 	bool no_send_stop;
 	u32 offset;
 	u32 segment;
-	u32 isr;
 
 	struct drm_dp_aux dp_aux;
 };
@@ -181,10 +180,8 @@ static void dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	}
 }
 
-static void dp_aux_native_handler(struct dp_aux_private *aux)
+static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
 {
-	u32 isr = aux->isr;
-
 	if (isr & DP_INTR_AUX_I2C_DONE)
 		aux->aux_error_num = DP_AUX_ERR_NONE;
 	else if (isr & DP_INTR_WRONG_ADDR)
@@ -197,14 +194,10 @@ static void dp_aux_native_handler(struct dp_aux_private *aux)
 		aux->aux_error_num = DP_AUX_ERR_PHY;
 		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
 	}
-
-	complete(&aux->comp);
 }
 
-static void dp_aux_i2c_handler(struct dp_aux_private *aux)
+static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
 {
-	u32 isr = aux->isr;
-
 	if (isr & DP_INTR_AUX_I2C_DONE) {
 		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
 			aux->aux_error_num = DP_AUX_ERR_NACK;
@@ -226,8 +219,6 @@ static void dp_aux_i2c_handler(struct dp_aux_private *aux)
 			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
 		}
 	}
-
-	complete(&aux->comp);
 }
 
 static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
@@ -412,6 +403,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 
 void dp_aux_isr(struct drm_dp_aux *dp_aux)
 {
+	u32 isr;
 	struct dp_aux_private *aux;
 
 	if (!dp_aux) {
@@ -421,15 +413,17 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	aux->isr = dp_catalog_aux_get_irq(aux->catalog);
+	isr = dp_catalog_aux_get_irq(aux->catalog);
 
 	if (!aux->cmd_busy)
 		return;
 
 	if (aux->native)
-		dp_aux_native_handler(aux);
+		dp_aux_native_handler(aux, isr);
 	else
-		dp_aux_i2c_handler(aux);
+		dp_aux_i2c_handler(aux, isr);
+
+	complete(&aux->comp);
 }
 
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b1a9b1b98f5f..a70c238f34b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -292,7 +292,7 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 	dump_regs(catalog->io->dp_controller.base + offset, len);
 }
 
-int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
+u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 176a9020a520..502bc0dc7787 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -80,7 +80,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
-int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
+u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
 /* DP Controller APIs */
 void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
-- 
https://chromeos.dev

