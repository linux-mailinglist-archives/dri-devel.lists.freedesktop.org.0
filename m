Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FF3AFB4E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 05:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512D6E0EF;
	Tue, 22 Jun 2021 03:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7985D6E07B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 03:09:50 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 f3-20020a0568301c23b029044ce5da4794so13260029ote.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 20:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JJaXR0MvWTLUMUBxm6vEFmtzzq3mthCeXlJRBUTcj0k=;
 b=JjFGC6CPjqlXte5fKt+wg8qPPb7RoF6xEWbQtpUeivEI7CVJIhOD8nkxVDBvUaM3bE
 +9q+NYvGp6FFv84lXRcowgz3f87+O0L4YEbpgiawuezPJs6YAUUvJmNdZ4Iqyz8xycs8
 inTuVW3hN35wrWcnsO7aMGmrh3TDPKPsdU4d3HNrLNa8Nqi4HQWLIGIMdKEAvTsfjjj0
 thubd0GPQmhiHKlwnKgrPau+SpI5HGN3lSsmd0QJ5zBgIxaaZh/2eGFhFILpxp1p5GRk
 PWWwOuGx+NZeDbJO+jv9mA/yZVzFJg4neUMYzCFoafsl3jhHCGIU1kIp9pzkEjuN1oIM
 QspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JJaXR0MvWTLUMUBxm6vEFmtzzq3mthCeXlJRBUTcj0k=;
 b=TwvfA1Cm65iWvJZkK1oQqEcrpXSaTAxGIqcqXFpfmFUj0wE8kZyKCfW2nW3e8rnysU
 NvWODq5e/+nyqSD7QQ8a9h34PAHz58uhR1wg1lScyqfspGilU1Jz7BCyYbpnlknojnnV
 xZtdll6YzrvmsNhbB3AdDYcnv3uONyVzGqB6M03tG1SG24JOgIDQsbTWIoBSkwnZX6Sd
 wlrsKLVfQgwm9Nsjfvav3eFdr/J/S6hcP6C2FqGdPOVKZz9gtziaTXT4SANEKQsBdGXv
 N2LCBz6nVEtqyFgo9Hec+wzknHHeOB8Mp69fvm35nzUkvETgK5xJWGE75411UeP7GqmW
 97Zw==
X-Gm-Message-State: AOAM5321AJtAZYci2aixstx1bjVrPHEpLv+ax0UitwGxuHKNsQ/wKyQe
 M6YOP5xN1ME3YyC5AnW0MTCg3A==
X-Google-Smtp-Source: ABdhPJwjJhzKb2EkdUdagJpaCej1dmFSqwYlH+F+rbKPdjgh7NJF6+8WPzYwDKKjEZLT4CS07R07kw==
X-Received: by 2002:a9d:6303:: with SMTP id q3mr1126330otk.197.1624331389610; 
 Mon, 21 Jun 2021 20:09:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d10sm243454oop.3.2021.06.21.20.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 20:09:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>
Subject: [PATCH v3 1/2] pwm: Introduce single-PWM of_xlate function
Date: Mon, 21 Jun 2021 22:09:47 -0500
Message-Id: <20210622030948.966748-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
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
Cc: linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing pxa driver and the upcoming addition of PWM support in the
TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
thereby a need for a of_xlate function with the period as its single
argument.

Introduce a common helper function in the core that can be used as
of_xlate by such drivers and migrate the pxa driver to use this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/pwm/core.c    | 26 ++++++++++++++++++++++++++
 drivers/pwm/pwm-pxa.c | 16 +---------------
 include/linux/pwm.h   |  2 ++
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index a42999f877d2..5e9c876fccc4 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -152,6 +152,32 @@ of_pwm_xlate_with_flags(struct pwm_chip *pc, const struct of_phandle_args *args)
 }
 EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
 
+struct pwm_device *
+of_pwm_single_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
+{
+	struct pwm_device *pwm;
+
+	if (pc->of_pwm_n_cells < 1)
+		return ERR_PTR(-EINVAL);
+
+	/* validate that one cell is specified, optionally with flags */
+	if (args->args_count != 1 && args->args_count != 2)
+		return ERR_PTR(-EINVAL);
+
+	pwm = pwm_request_from_chip(pc, 0, NULL);
+	if (IS_ERR(pwm))
+		return pwm;
+
+	pwm->args.period = args->args[0];
+	pwm->args.polarity = PWM_POLARITY_NORMAL;
+
+	if (args->args_count == 2 && args->args[2] & PWM_POLARITY_INVERTED)
+		pwm->args.polarity = PWM_POLARITY_INVERSED;
+
+	return pwm;
+}
+EXPORT_SYMBOL_GPL(of_pwm_single_xlate);
+
 static void of_pwmchip_add(struct pwm_chip *chip)
 {
 	if (!chip->dev || !chip->dev->of_node)
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index cfb683827d32..8cd82fb54483 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -148,20 +148,6 @@ static const struct platform_device_id *pxa_pwm_get_id_dt(struct device *dev)
 	return id ? id->data : NULL;
 }
 
-static struct pwm_device *
-pxa_pwm_of_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
-{
-	struct pwm_device *pwm;
-
-	pwm = pwm_request_from_chip(pc, 0, NULL);
-	if (IS_ERR(pwm))
-		return pwm;
-
-	pwm->args.period = args->args[0];
-
-	return pwm;
-}
-
 static int pwm_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -187,7 +173,7 @@ static int pwm_probe(struct platform_device *pdev)
 	pwm->chip.npwm = (id->driver_data & HAS_SECONDARY_PWM) ? 2 : 1;
 
 	if (IS_ENABLED(CONFIG_OF)) {
-		pwm->chip.of_xlate = pxa_pwm_of_xlate;
+		pwm->chip.of_xlate = of_pwm_single_xlate;
 		pwm->chip.of_pwm_n_cells = 1;
 	}
 
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 5a73251d28e3..6aff1fa4fe5d 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -411,6 +411,8 @@ struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
 
 struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *pc,
 		const struct of_phandle_args *args);
+struct pwm_device *of_pwm_single_xlate(struct pwm_chip *pc,
+				       const struct of_phandle_args *args);
 
 struct pwm_device *pwm_get(struct device *dev, const char *con_id);
 struct pwm_device *of_pwm_get(struct device *dev, struct device_node *np,
-- 
2.31.0

