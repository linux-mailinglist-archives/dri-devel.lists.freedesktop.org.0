Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05505674666
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9FC10E099;
	Thu, 19 Jan 2023 22:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF45510E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 22:54:16 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id x4so2694777pfj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zK3flFM0os1/8RqnL1ay80xg11/2BKbjIWxrUwGK7M4=;
 b=l0YGmDqm5C5ZhFisPOG8kWvvPg+hny4gYE6MbwBI5yi73o/1HpUgvAkTv3j8dXpYM9
 Ixm8iUPoPa5UcQsX1xWPU7Wz5THBMvuryxFUyyxvYbi0XpOEYsvBiz50xR7FTsw1AFqk
 cNqikGYSy1tbV2U/r6xCg6bFxTUznjMcXY7Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zK3flFM0os1/8RqnL1ay80xg11/2BKbjIWxrUwGK7M4=;
 b=ZMkgdbCmzHZIDzEuJJ/fZ8vewaA1l5PD+5rU6MrFi5FoeaUTeCfd/Gr36VYYCUesYm
 ctPCL4XPfU4MQdqTqhl18Ui5iaXnoWDBylEEE3LZzCP2WJQUesdQVQK3MqcN4SfIkPu3
 ahILJVdNIq18zzmzb9hedwctQv1HlztP72I4xh9XIeC9EXkPEHVz3TKittZIW6qRkiZR
 7X5YjDMO18vqkUqtCsaycj1MJwr89lyI3oWl/y+JY42lF994MGHh4H4+xS+aYv3XW6v4
 J5jtRcp+cqFNN3ke4dyaj5eqs7ZSCv6Ndu7bl/RHRG8uM9hiRZS508GVkMRc+VJt4KDV
 8CRQ==
X-Gm-Message-State: AFqh2krkco7aeK+V2iz/dN4YGEHg7e7Uo9+or5GQS9ggN0mOVVH8Id94
 tTf0s4A9mN+qEHkwAWdhb40ndQ==
X-Google-Smtp-Source: AMrXdXu2jarmgnJu+XMOfvSpUtlep5ac5fI1E3AykXlbD+WuT0fjuAUr8JWkOxb+bTrnjCdinbYWbw==
X-Received: by 2002:a05:6a00:1585:b0:578:8864:b25c with SMTP id
 u5-20020a056a00158500b005788864b25cmr16151179pfk.25.1674168856101; 
 Thu, 19 Jan 2023 14:54:16 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:62c2:e2e0:4fda:849e])
 by smtp.gmail.com with ESMTPSA id
 f127-20020a623885000000b00588cb819473sm20198839pfa.39.2023.01.19.14.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 14:54:15 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/2] drm/msm/dp: Clean up handling of DP AUX interrupts
Date: Thu, 19 Jan 2023 14:53:42 -0800
Message-Id: <20230119145248.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DP AUX interrupt handling was a bit of a mess.
* There were two functions (one for "native" transfers and one for
  "i2c" transfers) that were quite similar. It was hard to say how
  many of the differences between the two functions were on purpose
  and how many of them were just an accident of how they were coded.
* Each function sometimes used "else if" to test for error bits and
  sometimes didn't and again it was hard to say if this was on purpose
  or just an accident.
* The two functions wouldn't notice whether "unknown" bits were
  set. For instance, there seems to be a bit "DP_INTR_PLL_UNLOCKED"
  and if it was set there would be no indication.
* The two functions wouldn't notice if more than one error was set.

Let's fix this by being more consistent / explicit about what we're
doing.

By design this could cause different handling for AUX transfers,
though I'm not actually aware of any bug fixed as a result of
this patch (this patch was created because we simply noticed how odd
the old code was by code inspection). Specific notes here:
1. In the old native transfer case if we got "done + wrong address"
   we'd ignore the "wrong address" (because of the "else if"). Now we
   won't.
2. In the old native transfer case if we got "done + timeout" we'd
   ignore the "timeout" (because of the "else if"). Now we won't.
3. In the old native transfer case we'd see "nack_defer" and translate
   it to the error number for "nack". This differed from the i2c
   transfer case where "nack_defer" was given the error number for
   "nack_defer". This 100% can't matter because the only user of this
   error number treats "nack defer" the same as "nack", so it's clear
   that the difference between the "native" and "i2c" was pointless
   here.
4. In the old i2c transfer case if we got "done" plus any error
   besides "nack" or "defer" then we'd ignore the error. Now we don't.
5. If there is more than one error signaled by the hardware it's
   possible that we'll report a different one than we used to. I don't
   know if this matters. If someone is aware of a case this matters we
   should document it and change the code to make it explicit.
6. One quirk we keep (I don't know if this is important) is that in
   the i2c transfer case if we see "done + defer" we report that as a
   "nack". That seemed too intentional in the old code to just drop.

After this change we will add extra logging, including:
* A warning if we see more than one error bit set.
* A warning if we see an unexpected interrupt.
* A warning if we get an AUX transfer interrupt when shouldn't.

It actually turns out that as a result of this change then at boot we
sometimes see an error:
  [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
That means that, during init, we are seeing DP_INTR_PLL_UNLOCKED. For
now I'm going to say that leaving this error reported in the logs is
OK-ish and hopefully it will encourage someone to track down what's
going on at init time.

One last note here is that this change renames one of the interrupt
bits. The bit named "i2c done" clearly was used for native transfers
being done too, so I renamed it to indicate this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't have good test coverage for this change and it does have the
potential to change behavior. I confirmed that eDP and DP still
continue to work OK on one machine. Hopefully folks can test it more.

 drivers/gpu/drm/msm/dp/dp_aux.c     | 80 ++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 3 files changed, 36 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index cc3efed593aa..34ad08ae6eb9 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -162,47 +162,6 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	return i;
 }
 
-static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
-{
-	if (isr & DP_INTR_AUX_I2C_DONE)
-		aux->aux_error_num = DP_AUX_ERR_NONE;
-	else if (isr & DP_INTR_WRONG_ADDR)
-		aux->aux_error_num = DP_AUX_ERR_ADDR;
-	else if (isr & DP_INTR_TIMEOUT)
-		aux->aux_error_num = DP_AUX_ERR_TOUT;
-	if (isr & DP_INTR_NACK_DEFER)
-		aux->aux_error_num = DP_AUX_ERR_NACK;
-	if (isr & DP_INTR_AUX_ERROR) {
-		aux->aux_error_num = DP_AUX_ERR_PHY;
-		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
-	}
-}
-
-static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
-{
-	if (isr & DP_INTR_AUX_I2C_DONE) {
-		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
-			aux->aux_error_num = DP_AUX_ERR_NACK;
-		else
-			aux->aux_error_num = DP_AUX_ERR_NONE;
-	} else {
-		if (isr & DP_INTR_WRONG_ADDR)
-			aux->aux_error_num = DP_AUX_ERR_ADDR;
-		else if (isr & DP_INTR_TIMEOUT)
-			aux->aux_error_num = DP_AUX_ERR_TOUT;
-		if (isr & DP_INTR_NACK_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
-		if (isr & DP_INTR_I2C_NACK)
-			aux->aux_error_num = DP_AUX_ERR_NACK;
-		if (isr & DP_INTR_I2C_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_DEFER;
-		if (isr & DP_INTR_AUX_ERROR) {
-			aux->aux_error_num = DP_AUX_ERR_PHY;
-			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
-		}
-	}
-}
-
 static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
 					     struct drm_dp_aux_msg *input_msg)
 {
@@ -427,13 +386,42 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 	if (!isr)
 		return;
 
-	if (!aux->cmd_busy)
+	if (!aux->cmd_busy) {
+		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
 		return;
+	}
 
-	if (aux->native)
-		dp_aux_native_handler(aux, isr);
-	else
-		dp_aux_i2c_handler(aux, isr);
+	/*
+	 * The logic below assumes only one error bit is set (other than "done"
+	 * which can apparently be set at the same time as some of the other
+	 * bits). Warn if more than one get set so we know we need to improve
+	 * the logic.
+	 */
+	if (hweight32(isr & ~DP_INTR_AUX_XFER_DONE) > 1)
+		DRM_WARN("Some DP AUX interrupts unhandled: %#010x\n", isr);
+
+	if (isr & DP_INTR_AUX_ERROR) {
+		aux->aux_error_num = DP_AUX_ERR_PHY;
+		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+	} else if (isr & DP_INTR_NACK_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
+	} else if (isr & DP_INTR_WRONG_ADDR) {
+		aux->aux_error_num = DP_AUX_ERR_ADDR;
+	} else if (isr & DP_INTR_TIMEOUT) {
+		aux->aux_error_num = DP_AUX_ERR_TOUT;
+	} else if (isr & DP_INTR_AUX_XFER_DONE) {
+		aux->aux_error_num = DP_AUX_ERR_NONE;
+	} else if (!aux->native && (isr & DP_INTR_I2C_NACK)) {
+		aux->aux_error_num = DP_AUX_ERR_NACK;
+	} else if (!aux->native && (isr & DP_INTR_I2C_DEFER)) {
+		if (isr & DP_INTR_AUX_XFER_DONE)
+			aux->aux_error_num = DP_AUX_ERR_NACK;
+		else
+			aux->aux_error_num = DP_AUX_ERR_DEFER;
+	} else {
+		DRM_WARN("Unexpected interrupt: %#010x\n", isr);
+		return;
+	}
 
 	complete(&aux->comp);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 676279d0ca8d..421391755427 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -27,7 +27,7 @@
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
 #define DP_INTERRUPT_STATUS1 \
-	(DP_INTR_AUX_I2C_DONE| \
+	(DP_INTR_AUX_XFER_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
 	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
 	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f717f45c115..f36b7b372a06 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -13,7 +13,7 @@
 
 /* interrupts */
 #define DP_INTR_HPD		BIT(0)
-#define DP_INTR_AUX_I2C_DONE	BIT(3)
+#define DP_INTR_AUX_XFER_DONE	BIT(3)
 #define DP_INTR_WRONG_ADDR	BIT(6)
 #define DP_INTR_TIMEOUT		BIT(9)
 #define DP_INTR_NACK_DEFER	BIT(12)
-- 
2.39.0.246.g2a6d74b583-goog

