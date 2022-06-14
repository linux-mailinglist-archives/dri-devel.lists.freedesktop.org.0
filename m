Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C899554BD14
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1022E11289A;
	Tue, 14 Jun 2022 21:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A3111217F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 21:54:44 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id z14so4836687pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AD7rNua84LlpGzzclSVfd7h/uJzjd+oRcysHkAmzKsw=;
 b=E6g2uu+oxpS1JAhdNGcoZ/m+u2SH9aq8/IJUrbP/T9uoW5ClLt7+i4LSDHU80R6p6H
 AIHW/ZujOsDDOTjxLhZC61o0e/vuRjrUHZwNqYODIq001c+p9T/wevgNpf1xPbktTV2b
 edydObcQVymMztpOJfyT2bpJ+FiwIyO0uF9P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AD7rNua84LlpGzzclSVfd7h/uJzjd+oRcysHkAmzKsw=;
 b=paxudID/tFGgC3UkAwl+kMtkM4sKvU6/encCJP39W5h+DP3EBilhFd4qYqn5JGuoxJ
 LM31OruREUVcdNo8IojaoJsEPqLqb9lvMlYz+uLLtQiw6JuB9OI5s48xJ0Aia5zZHtWP
 XJJVu33sFkmPXV3ch8vXPFsis8gxnuCll6dEDMuB6RGk2x5Cun/0AkEQFuOGZ/sO3ezR
 0+l5XyNVI3N2IB7H93mBewamvuoJObPeXbnwwwjNrQlynqVRIrxdKEUZKG07C6ty2ZFJ
 Ogg4W+Aoa5xc8ZPNs/Gmh518zfO7uLrA7YZSuvJ10RXSeuRlu+BouSw3cL8VFAPEON/t
 yPEg==
X-Gm-Message-State: AJIora86Wt3oXhxtIeglmeM7HH9BlzjxcfoaDnVgH3JPC+iWXaLaof9/
 ZB05np2mcbIDu+QuPPHrg9sF0xvspv6x6dBf
X-Google-Smtp-Source: AGRyM1tx5s5qzREkLsZOH+1kx714eDFK00lma0iUr3Sr8mskoDfH3W518hO6TI+ELqROUZUIu2iwjQ==
X-Received: by 2002:a17:902:d2c9:b0:167:1195:3a41 with SMTP id
 n9-20020a170902d2c900b0016711953a41mr6502284plc.126.1655243683801; 
 Tue, 14 Jun 2022 14:54:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f355:be2d:74b7:3c7c])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b0016641a646cbsm7668968pli.218.2022.06.14.14.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 14:54:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/panel: atna33xc20: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
Date: Tue, 14 Jun 2022 14:54:17 -0700
Message-Id: <20220614145327.v4.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614215418.910948-1-dianders@chromium.org>
References: <20220614215418.910948-1-dianders@chromium.org>
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
hooked directly to the controller. This will let us take away the
waiting in the AUX transfer functions of the eDP controller drivers.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Reorganized logic as per Dmitry's suggestion.

Changes in v3:
- Don't check "hpd_asserted" boolean when unset.
- Handle errors from gpiod_get_value_cansleep() properly.

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 51 ++++++++++++++-----
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 3dd10412d147..5a8b978c6415 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -19,6 +19,10 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 
+/* T3 VCC to HPD high is max 200 ms */
+#define HPD_MAX_MS	200
+#define HPD_MAX_US	(HPD_MAX_MS * 1000)
+
 struct atana33xc20_panel {
 	struct drm_panel base;
 	bool prepared;
@@ -30,6 +34,7 @@ struct atana33xc20_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *el_on3_gpio;
+	struct drm_dp_aux *aux;
 
 	struct edid *edid;
 
@@ -79,7 +84,7 @@ static int atana33xc20_suspend(struct device *dev)
 static int atana33xc20_resume(struct device *dev)
 {
 	struct atana33xc20_panel *p = dev_get_drvdata(dev);
-	bool hpd_asserted = false;
+	int hpd_asserted;
 	int ret;
 
 	/* T12 (Power off time) is min 500 ms */
@@ -90,23 +95,41 @@ static int atana33xc20_resume(struct device *dev)
 		return ret;
 	p->powered_on_time = ktime_get();
 
-	/*
-	 * Handle HPD. Note: if HPD is hooked up to a dedicated pin on the
-	 * eDP controller then "no_hpd" will be false _and_ "hpd_gpio" will be
-	 * NULL. It's up to the controller driver to wait for HPD after
-	 * preparing the panel in that case.
-	 */
 	if (p->no_hpd) {
-		/* T3 VCC to HPD high is max 200 ms */
-		msleep(200);
-	} else if (p->hpd_gpio) {
+		msleep(HPD_MAX_MS);
+		return 0;
+	}
+
+	if (p->hpd_gpio) {
 		ret = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
 					 hpd_asserted, hpd_asserted,
-					 1000, 200000);
-		if (!hpd_asserted)
-			dev_warn(dev, "Timeout waiting for HPD\n");
+					 1000, HPD_MAX_US);
+		if (hpd_asserted < 0)
+			ret = hpd_asserted;
+
+		if (ret)
+			dev_warn(dev, "Error waiting for HPD GPIO: %d\n", ret);
+
+		return ret;
 	}
 
+	if (p->aux->wait_hpd_asserted) {
+		ret = p->aux->wait_hpd_asserted(p->aux, HPD_MAX_US);
+
+		if (ret)
+			dev_warn(dev, "Controller error waiting for HPD: %d\n", ret);
+
+		return ret;
+	}
+
+	/*
+	 * Note that it's possible that no_hpd is false, hpd_gpio is
+	 * NULL, and wait_hpd_asserted is NULL. This is because
+	 * wait_hpd_asserted() is optional even if HPD is hooked up to
+	 * a dedicated pin on the eDP controller. In this case we just
+	 * assume that the controller driver will wait for HPD at the
+	 * right times.
+	 */
 	return 0;
 }
 
@@ -263,6 +286,8 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 		return -ENOMEM;
 	dev_set_drvdata(dev, panel);
 
+	panel->aux = aux_ep->aux;
+
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply))
 		return dev_err_probe(dev, PTR_ERR(panel->supply),
-- 
2.36.1.476.g0c4daa206d-goog

