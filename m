Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B14FA1C2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 04:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A9810E24E;
	Sat,  9 Apr 2022 02:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703B110E209
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 02:37:13 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so11376583pjk.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 19:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0vkhOKP2WO4l+2v+2Aab0a42a4DeGq9/d4Qga0dGC0=;
 b=hThmm8Tk9cX40rfcqSsr2lGFlhGgxb2P8Eetaye5fzRTF/IFvfQeF1jvqlMQZgfHUQ
 SrTeTmXH5D3Gj21g9TkpAnQhB+IQn+V46EgcKgNjb4t/g01DIAFFOW7mb0jVTMq2IfXG
 ykMvJusi6OBpqfOLef7rb1cFe2KYgZ0Zl7Frw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0vkhOKP2WO4l+2v+2Aab0a42a4DeGq9/d4Qga0dGC0=;
 b=Jfq1jNQ0sxXbRgbUxKmoWbPVpOtA9Qju6S0f12TopokP0tW/dI7/wUWxqFUWrOhe8P
 KPCxzR9mOe+s8N3erwkmtS3C7JhL28j7VeFrrEIWCbpab6WKQEAtOut6/7hNnHZqwTu2
 nVjabKgzfYwQmlAqPSswij9pUeZMckQ9OuZY+Rd4KY7fj5H6wwui5Et8hopgtzLeFd8F
 a6a+mROY6ATQHLuc9v89fCo2OW18koYGIfkTijxkHr6r3D5uzMyrfLujCRDj9oLqGyZz
 tbrwsNrVv3RDfKfV9U+m1kFw6dz8cNCpNoUmLYA7lf8ddBH1aN06FmVFAk7O/37XsNSe
 sZYA==
X-Gm-Message-State: AOAM533Rmq7Bex0J1Fk7zpFD99f031c2CY+NonWhDT8yqFCQG2Z6Onzt
 y7TingQrTpUwhlRSWFG+ZJsl6zISClLfO0Wym7BcVQ==
X-Google-Smtp-Source: ABdhPJxKvoKVhufhkWMurahdK3NmXOgJqw5lH1XIAJAyg/5vhbrKM2A8tweygpDFe/vJs9KLnxJWtw==
X-Received: by 2002:a17:902:e74a:b0:153:f956:1cf5 with SMTP id
 p10-20020a170902e74a00b00153f9561cf5mr21563664plf.138.1649471832923; 
 Fri, 08 Apr 2022 19:37:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:17db:64e:48d4:a4e])
 by smtp.gmail.com with ESMTPSA id
 188-20020a6215c5000000b0050597294893sm759999pfv.124.2022.04.08.19.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 19:37:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 5/6] drm/panel: atna33xc20: Take advantage of
 is_hpd_asserted() in struct drm_dp_aux
Date: Fri,  8 Apr 2022 19:36:27 -0700
Message-Id: <20220408193536.RFC.5.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
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
hooked directly to the controller. This will let us take away the
waiting in the AUX transfer functions of the eDP controller drivers.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 35 +++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 20666b6217e7..f72bdd7ff7a1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -30,6 +30,7 @@ struct atana33xc20_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *el_on3_gpio;
+	struct drm_dp_aux *aux;
 
 	struct edid *edid;
 
@@ -76,6 +77,19 @@ static int atana33xc20_suspend(struct device *dev)
 	return 0;
 }
 
+static bool atana33xc20_can_read_hpd(struct atana33xc20_panel *p)
+{
+	return !p->no_hpd && (p->hpd_gpio || p->aux->is_hpd_asserted);
+}
+
+static bool panel_edp_read_hpd(struct atana33xc20_panel *p)
+{
+	if (p->hpd_gpio)
+		return gpiod_get_value_cansleep(p->hpd_gpio);
+
+	return p->aux->is_hpd_asserted(p->aux);
+}
+
 static int atana33xc20_resume(struct device *dev)
 {
 	struct atana33xc20_panel *p = dev_get_drvdata(dev);
@@ -92,17 +106,24 @@ static int atana33xc20_resume(struct device *dev)
 
 	/*
 	 * Handle HPD. Note: if HPD is hooked up to a dedicated pin on the
-	 * eDP controller then "no_hpd" will be false _and_ "hpd_gpio" will be
-	 * NULL. It's up to the controller driver to wait for HPD after
-	 * preparing the panel in that case.
+	 * eDP controller then it's possible that "no_hpd" will be false _and_
+	 * atana33xc20_can_read_hpd() will return false. It's up to the
+	 * controller driver to wait for HPD after preparing the panel in that
+	 * case.
 	 */
 	if (p->no_hpd) {
 		/* T3 VCC to HPD high is max 200 ms */
 		msleep(200);
-	} else if (p->hpd_gpio) {
-		ret = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
+	} else if (atana33xc20_can_read_hpd(p)) {
+		/*
+		 * Even though max HPD is 200 ms, we give an extra long timeout
+		 * of 500 ms here. Why? ps8640 is crazy and the bridge chip
+		 * driver itself has over 200 ms of delay if it needs to
+		 * do the pm_runtime resume of the bridge chip to read the HPD.
+		 */
+		ret = readx_poll_timeout(panel_edp_read_hpd, p,
 					 hpd_asserted, hpd_asserted,
-					 1000, 200000);
+					 1000, 500000);
 		if (!hpd_asserted)
 			dev_warn(dev, "Timeout waiting for HPD\n");
 	}
@@ -263,6 +284,8 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 		return -ENOMEM;
 	dev_set_drvdata(dev, panel);
 
+	panel->aux = aux_ep->aux;
+
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply))
 		return dev_err_probe(dev, PTR_ERR(panel->supply),
-- 
2.35.1.1178.g4f1659d476-goog

