Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020FF505D66
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 19:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA93810E476;
	Mon, 18 Apr 2022 17:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602610E476
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 17:18:17 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id u2so19989144pgq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLAqWrA31cWgX8epcIr4h9J52vxj5o5pqIOrUPKn5S4=;
 b=KILwivJrPWKKJ1y5zZh+ncB6eMJS2O9v9XkT5RRNeph3Mbmp0KiTr5egSKSVpefSaQ
 fKFAKVw+EEQnsiQiq9QrFapzWOuW4D27bF0nMgQ9fvFQesXhKqLEXHPfsm2VxI4jehJK
 zkPQPdkSLyfTs60HrShwO18Qi2n4W56nuc/Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLAqWrA31cWgX8epcIr4h9J52vxj5o5pqIOrUPKn5S4=;
 b=fG1oY1d4erceXNbj2TXKQIaN0DrOs2Ix9tBahDezp8UJtGPUhoraWR+XGnkvg7pgqN
 m+VE3bW4NylbXTbQo0DhNOs0xaiDKT4+O4VsZX6ZY+2nOx3bmDuRj1PQ9RAmzGUMkqXz
 GB/K2ge0ABFpL3O9khrRfYc6HwWkxjBlQ5/WLJGeUVMXs6TJIqPWneNjgGNFKMRfRjwZ
 +uUWgOgWE/HOe2v8t+Lyug2vgYxuQJuGBFj8DeqkMrgPER58EOMWjGgIuRO8xShKXJ4x
 i95ooo0Kq2IgKVK8CNk1/pgu4Ovm63jdpL782OuyzTySFyKnLInzN02n+ty8PofP2a1z
 l5eg==
X-Gm-Message-State: AOAM530C1/FyWM90CtG6I8OrsE4BsVXpyXhvdOO91jAZ4PKjiJAeJwT3
 m+jZbmqYM9KPNolgN0pTnCnMRRDJBr1ZykwiLZI=
X-Google-Smtp-Source: ABdhPJwymO4gXLgRq2ZPiT4Fq2+87RbqQjRO4fTV99PpIyLcWe1ylHS4ghzL7MVN0bYPqe/lCiBeuQ==
X-Received: by 2002:a05:6a02:20c:b0:381:f276:98d6 with SMTP id
 bh12-20020a056a02020c00b00381f27698d6mr10702933pgb.39.1650302297040; 
 Mon, 18 Apr 2022 10:18:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:94f4:f90:c59f:129b])
 by smtp.gmail.com with ESMTPSA id
 n184-20020a6227c1000000b0050a3bbd36d6sm12152126pfn.204.2022.04.18.10.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 10:18:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/panel-edp: Take advantage of wait_hpd_asserted()
 in struct drm_dp_aux
Date: Mon, 18 Apr 2022 10:17:55 -0700
Message-Id: <20220418101725.v3.2.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220418171757.2282651-1-dianders@chromium.org>
References: <20220418171757.2282651-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's add support for being able to read the HPD pin even if it's
hooked directly to the controller. This will allow us to get more
accurate delays also lets us take away the waiting in the AUX transfer
functions of the eDP controller drivers.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

 drivers/gpu/drm/panel/panel-edp.c | 33 +++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..086e0bf52fb9 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -417,6 +417,11 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
 	return 0;
 }
 
+static bool panel_edp_can_read_hpd(struct panel_edp *p)
+{
+	return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->wait_hpd_asserted));
+}
+
 static int panel_edp_prepare_once(struct panel_edp *p)
 {
 	struct device *dev = p->base.dev;
@@ -441,17 +446,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 	if (delay)
 		msleep(delay);
 
-	if (p->hpd_gpio) {
+	if (panel_edp_can_read_hpd(p)) {
 		if (p->desc->delay.hpd_absent)
 			hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
 		else
 			hpd_wait_us = 2000000;
 
-		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
-					 hpd_asserted, hpd_asserted,
-					 1000, hpd_wait_us);
-		if (hpd_asserted < 0)
-			err = hpd_asserted;
+		if (p->hpd_gpio) {
+			err = readx_poll_timeout(gpiod_get_value_cansleep,
+						 p->hpd_gpio, hpd_asserted,
+						 hpd_asserted, 1000, hpd_wait_us);
+			if (hpd_asserted < 0)
+				err = hpd_asserted;
+		} else {
+			err = p->aux->wait_hpd_asserted(p->aux, hpd_wait_us);
+		}
 
 		if (err) {
 			if (err != -ETIMEDOUT)
@@ -532,18 +541,22 @@ static int panel_edp_enable(struct drm_panel *panel)
 	/*
 	 * If there is a "prepare_to_enable" delay then that's supposed to be
 	 * the delay from HPD going high until we can turn the backlight on.
-	 * However, we can only count this if HPD is handled by the panel
-	 * driver, not if it goes to a dedicated pin on the controller.
+	 * However, we can only count this if HPD is readable by the panel
+	 * driver.
+	 *
 	 * If we aren't handling the HPD pin ourselves then the best we
 	 * can do is assume that HPD went high immediately before we were
-	 * called (and link training took zero time).
+	 * called (and link training took zero time). Note that "no-hpd"
+	 * actually counts as handling HPD ourselves since we're doing the
+	 * worst case delay (in prepare) ourselves.
 	 *
 	 * NOTE: if we ever end up in this "if" statement then we're
 	 * guaranteed that the panel_edp_wait() call below will do no delay.
 	 * It already handles that case, though, so we don't need any special
 	 * code for it.
 	 */
-	if (p->desc->delay.prepare_to_enable && !p->hpd_gpio && !p->no_hpd)
+	if (p->desc->delay.prepare_to_enable &&
+	    !panel_edp_can_read_hpd(p) && !p->no_hpd)
 		delay = max(delay, p->desc->delay.prepare_to_enable);
 
 	if (delay)
-- 
2.36.0.rc0.470.gd361397f0d-goog

