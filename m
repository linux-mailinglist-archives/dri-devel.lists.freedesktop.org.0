Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FBC4FA1BE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 04:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DAF10E226;
	Sat,  9 Apr 2022 02:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EC410E23C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 02:37:12 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id z16so9994498pfh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 19:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZDP/lJqtEdsKUlwpXtXIqsxtNFEIRvU/nqKyMYfCeeY=;
 b=D9xgfrkeaFJUttYqewJ3vg74R8RrnGjCc9t/rG3o/W8tbtcZ7piUxYK6PHbP091tO+
 vaCyQaSP6r/rmRV3BTIGMKkXQMz8pEbSndzZ7jnkvXd0GyoSNBRi2NgJFijT6uqrz/cf
 axYPLd1dIhWccm0BHMMRxIB5MmvJgq+RFE12k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZDP/lJqtEdsKUlwpXtXIqsxtNFEIRvU/nqKyMYfCeeY=;
 b=2lTX15qfJvy04lNwW12DpIcmD8DBCSGm0e4aqvNbx/jxU0njEZJhDgY1ePWPMI/LbW
 3vldFRv8saktzNrmG/cLVixZf6rbigH4rI6fi2K5wiOE62o/gwu+Z+Gx5VFxScZDGAfO
 DHJzaMIta+0QM7VU2Z+srSpWeXzC864A99F+zn9fowg+e4MX7as8f9UUFi2X40apsbcg
 Gz7ZjCC1ykU2PsQNAZVths4xN/nDF8ec6OOZ+M2HJTReWpkX72kF0rEfC//wzkd4iJ1H
 KPeLr8F6/tPQEIjP6ptUV+gaNRYvz/7mdhVa0vHlkUB4lGw4qJClOnoN6b4Y72ItO/SM
 7Xwg==
X-Gm-Message-State: AOAM533BwXwk+EjUJU4mElutJRbfpRNxkUBCCEw88Qg4xi7tF193V7Ul
 jbeTobgv7gclmUZ6mWHIL0O1JIMollu1F55Qr6PfQw==
X-Google-Smtp-Source: ABdhPJwxPfmW0ePcA69JOxNFOhRcSLAhhpuGo+Rx7NZf6f0QcfjSNo1IkMxnNcI43azKHsIKyYsFnw==
X-Received: by 2002:a63:dc4e:0:b0:39c:c5b2:94d6 with SMTP id
 f14-20020a63dc4e000000b0039cc5b294d6mr9820589pgj.365.1649471831563; 
 Fri, 08 Apr 2022 19:37:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:17db:64e:48d4:a4e])
 by smtp.gmail.com with ESMTPSA id
 188-20020a6215c5000000b0050597294893sm759999pfv.124.2022.04.08.19.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 19:37:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 4/6] drm/panel-edp: Take advantage of is_hpd_asserted() in
 struct drm_dp_aux
Date: Fri,  8 Apr 2022 19:36:26 -0700
Message-Id: <20220408193536.RFC.4.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220409023628.2104952-1-dianders@chromium.org>
References: <20220409023628.2104952-1-dianders@chromium.org>
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

 drivers/gpu/drm/panel/panel-edp.c | 37 ++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..4a143eb9544b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -417,6 +417,19 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
 	return 0;
 }
 
+static bool panel_edp_can_read_hpd(struct panel_edp *p)
+{
+	return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->is_hpd_asserted));
+}
+
+static bool panel_edp_read_hpd(struct panel_edp *p)
+{
+	if (p->hpd_gpio)
+		return gpiod_get_value_cansleep(p->hpd_gpio);
+
+	return p->aux->is_hpd_asserted(p->aux);
+}
+
 static int panel_edp_prepare_once(struct panel_edp *p)
 {
 	struct device *dev = p->base.dev;
@@ -441,13 +454,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 	if (delay)
 		msleep(delay);
 
-	if (p->hpd_gpio) {
+	if (panel_edp_can_read_hpd(p)) {
 		if (p->desc->delay.hpd_absent)
 			hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
 		else
 			hpd_wait_us = 2000000;
 
-		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
+		/*
+		 * Extra max delay, mostly to account for ps8640. ps8640
+		 * is crazy and the bridge chip driver itself has over 200 ms
+		 * of delay if it needs to do the pm_runtime resume of the
+		 * bridge chip to read the HPD.
+		 */
+		hpd_wait_us += 3000000;
+
+		err = readx_poll_timeout(panel_edp_read_hpd, p,
 					 hpd_asserted, hpd_asserted,
 					 1000, hpd_wait_us);
 		if (hpd_asserted < 0)
@@ -532,18 +553,22 @@ static int panel_edp_enable(struct drm_panel *panel)
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
2.35.1.1178.g4f1659d476-goog

