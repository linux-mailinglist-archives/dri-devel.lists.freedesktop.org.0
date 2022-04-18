Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B1505D30
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 18:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AAA10E272;
	Mon, 18 Apr 2022 16:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C18E10E295
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 16:58:38 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so3076241pji.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1QFnxHD7U+Ao84z0nfTT0ExEc1/lOyohaOkN2UcR24=;
 b=CZbSmX/i5jES+5RWi+JOQsTJ2Htdbaoh7NlFmpocxP9XJuCHQj17CZXDzULn6D0fJG
 BXEBtnF6OUJcmQdxRkGDdkfYv2lUHKb2IGR8K4BpW7neWgAsyfcPK2xKLcEtZinPGwSy
 PnuNQocQ/bQF5MGtIvlphUKzBsHaJYDutd6TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1QFnxHD7U+Ao84z0nfTT0ExEc1/lOyohaOkN2UcR24=;
 b=1wwzOf9/bg2S0qUSp93gQ/6KpxEVnof3WvLS3fqquqqtCFwOo4t6GYKf45HEoZsjjS
 bfvuzaGcwFmMqhDD5oIgdvdPCjSwSGxsWQ+o2Ww/wJ1o7m657b1CqIGxjF5eRWn/oS8D
 pIPkAg4ndrAnBVgWIEO/WXPRJNMa5A/aCicu7W56ou7p4UqvkT+jB87Ai/ZWo9pmVZX6
 UrVkb0Jn5rQpAPiMLH4Z9Es17UDZSwK5cGQDfheCZguULQZJKHu4VbfknqZx5XUQsDpo
 mLzfl358wj9rCysOIWb0E9v+9gpCE1D4usEl1Lp6lOZ5vS0QCjuFQtSE8rPJ6KSuoQbT
 1tag==
X-Gm-Message-State: AOAM530CQmtum3/OZYCO4KIPYeVaRrt4cHCCP947GiFfw27eVmQIB/yl
 jzy+M/hOli51lM2q2aLKTX6TtCagSS18C1Y3
X-Google-Smtp-Source: ABdhPJwLdYhma2u6XQc+ES5orztwhXRFtVhZ1lMWtpfsGvAB78t7vY39NXx+5ntfYDoatZnLspf7yw==
X-Received: by 2002:a17:90b:1891:b0:1d2:66e1:62b2 with SMTP id
 mn17-20020a17090b189100b001d266e162b2mr11793459pjb.56.1650301118033; 
 Mon, 18 Apr 2022 09:58:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:94f4:f90:c59f:129b])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a150800b001cbaf536a3esm17700980pja.18.2022.04.18.09.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 09:58:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/panel: atna33xc20: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
Date: Mon, 18 Apr 2022 09:56:41 -0700
Message-Id: <20220418095557.v2.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220418165642.2218514-1-dianders@chromium.org>
References: <20220418165642.2218514-1-dianders@chromium.org>
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

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 38 ++++++++++++-------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 20666b6217e7..7f9af3e9aeb8 100644
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
 
@@ -90,20 +95,25 @@ static int atana33xc20_resume(struct device *dev)
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
-		ret = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
-					 hpd_asserted, hpd_asserted,
-					 1000, 200000);
-		if (!hpd_asserted)
+		msleep(HPD_MAX_MS);
+	} else {
+		if (p->hpd_gpio)
+			ret = readx_poll_timeout(gpiod_get_value_cansleep,
+						 p->hpd_gpio, hpd_asserted,
+						 hpd_asserted, 1000, HPD_MAX_US);
+		else if (p->aux->wait_hpd_asserted)
+			ret = p->aux->wait_hpd_asserted(p->aux, HPD_MAX_US);
+
+		/*
+		 * Note that it's possible that no_hpd is false, hpd_gpio is
+		 * NULL, and wait_hpd_asserted is NULL. This is because
+		 * wait_hpd_asserted() is optional even if HPD is hooked up to
+		 * a dedicated pin on the eDP controller. In this case we just
+		 * assume that the controller driver will wait for HPD at the
+		 * right times.
+		 */
+		if (!hpd_asserted && (p->hpd_gpio || p->aux->wait_hpd_asserted))
 			dev_warn(dev, "Timeout waiting for HPD\n");
 	}
 
@@ -263,6 +273,8 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 		return -ENOMEM;
 	dev_set_drvdata(dev, panel);
 
+	panel->aux = aux_ep->aux;
+
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply))
 		return dev_err_probe(dev, PTR_ERR(panel->supply),
-- 
2.36.0.rc0.470.gd361397f0d-goog

