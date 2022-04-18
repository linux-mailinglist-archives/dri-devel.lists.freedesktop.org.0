Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2902505D6A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 19:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B01088668;
	Mon, 18 Apr 2022 17:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3579510E820
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 17:18:19 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id t12so12852375pll.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CbyBbjg8gyQUteF6HieSyj7KxxSHSKGjYqQSaFd6TEU=;
 b=Zwq7VaOgsewiCmFbE/n3kyjx9CnT9hrV1iH13ddciUfogTYoP3vKbKr2r6xIr489kr
 OKKvgazeoIC641p9t8uY7He78fymv9yeCfFKojsIC6FDtcegdms0UggwymRnd6JZkrGq
 5T8EUG8NWtHKJD8gs0BWpOtwKWiV2/vvYbvIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CbyBbjg8gyQUteF6HieSyj7KxxSHSKGjYqQSaFd6TEU=;
 b=F6H88HFKO8e6ZYklgNadu/uXTtzw48acU4zWdNuRSVXJuT3p49tMJefbih0ehArGmW
 wt5RTrdbpYLvUky4mbUZX+sGWqltC/Zbq0INH5k6Jp4wu9u44H/kDYoMPEiKueFTwt9c
 mEpAhr+wDNYKSf3KlmZ3aaLBVlsaHbmBq6ExVd3nROYnXzaxp/TK4iiCWp2yX0z+WLlb
 CcGsGGwvLI6WvwLhcXceTvY76iCTzfNTkHicMYnbDQ52+unXNL1dE9ndYW0RCmPbyZGU
 2zDk2BNjDHhaTIf8YzIYvoPmVhwT4n4ioyd9V7buJe7Ce3M6T4epM01ueCtIuVkkQf9P
 bPkg==
X-Gm-Message-State: AOAM530c7GowsYRrq5L7FNCrEK/W0t8zS/lVT+RIpAddbTuvmpu6NqC0
 Yh9x+V1AWwdqyC/ocMQw+Za9CY4cLEb6+rAxrYA=
X-Google-Smtp-Source: ABdhPJyaED3SN66kMNUE2uFkmpidmKhbhonRfUkIPOEYVFjhxla397ZKSGrYrID4nNtyd6w2iBhLOw==
X-Received: by 2002:a17:902:e98a:b0:159:5f7:49cf with SMTP id
 f10-20020a170902e98a00b0015905f749cfmr3763147plb.41.1650302298343; 
 Mon, 18 Apr 2022 10:18:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:94f4:f90:c59f:129b])
 by smtp.gmail.com with ESMTPSA id
 n184-20020a6227c1000000b0050a3bbd36d6sm12152126pfn.204.2022.04.18.10.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 10:18:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/panel: atna33xc20: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
Date: Mon, 18 Apr 2022 10:17:56 -0700
Message-Id: <20220418101725.v3.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
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
hooked directly to the controller. This will let us take away the
waiting in the AUX transfer functions of the eDP controller drivers.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Don't check "hpd_asserted" boolean when unset.
- Handle errors from gpiod_get_value_cansleep() properly.

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 41 +++++++++++++------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 20666b6217e7..5ef1b4032c56 100644
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
@@ -91,20 +96,28 @@ static int atana33xc20_resume(struct device *dev)
 	p->powered_on_time = ktime_get();
 
 	/*
-	 * Handle HPD. Note: if HPD is hooked up to a dedicated pin on the
-	 * eDP controller then "no_hpd" will be false _and_ "hpd_gpio" will be
-	 * NULL. It's up to the controller driver to wait for HPD after
-	 * preparing the panel in that case.
+	 * Note that it's possible that no_hpd is false, hpd_gpio is
+	 * NULL, and wait_hpd_asserted is NULL. This is because
+	 * wait_hpd_asserted() is optional even if HPD is hooked up to
+	 * a dedicated pin on the eDP controller. In this case we just
+	 * assume that the controller driver will wait for HPD at the
+	 * right times.
 	 */
 	if (p->no_hpd) {
-		/* T3 VCC to HPD high is max 200 ms */
-		msleep(200);
-	} else if (p->hpd_gpio) {
-		ret = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
-					 hpd_asserted, hpd_asserted,
-					 1000, 200000);
-		if (!hpd_asserted)
-			dev_warn(dev, "Timeout waiting for HPD\n");
+		msleep(HPD_MAX_MS);
+	} else {
+		if (p->hpd_gpio) {
+			ret = readx_poll_timeout(gpiod_get_value_cansleep,
+						 p->hpd_gpio, hpd_asserted,
+						 hpd_asserted, 1000, HPD_MAX_US);
+			if (hpd_asserted < 0)
+				ret = hpd_asserted;
+		} else if (p->aux->wait_hpd_asserted) {
+			ret = p->aux->wait_hpd_asserted(p->aux, HPD_MAX_US);
+		}
+
+		if (ret)
+			dev_warn(dev, "Error waiting for HPD: %d\n", ret);
 	}
 
 	return 0;
@@ -263,6 +276,8 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
 		return -ENOMEM;
 	dev_set_drvdata(dev, panel);
 
+	panel->aux = aux_ep->aux;
+
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply))
 		return dev_err_probe(dev, PTR_ERR(panel->supply),
-- 
2.36.0.rc0.470.gd361397f0d-goog

