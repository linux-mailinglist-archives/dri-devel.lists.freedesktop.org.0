Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C395A9B1564
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 08:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA5D10E402;
	Sat, 26 Oct 2024 06:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tFs7N6QD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF7410E402
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 06:32:59 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id 4aM1tR7nLgeRP4aM1tvlXG; Sat, 26 Oct 2024 08:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1729924377;
 bh=4QS1A65O3hsr8uWMktbnBm+HEJ1CiTpjN/zqDqUf/lw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=tFs7N6QDolaDk7ESBYl8GFFTn+5HZ/WlloVaEE1Y7G7haduNLJhW4WvAmzayQlTk8
 sBsujEPYlcSb7F4Rd3UUj71cECce5/uCKSvSzHW5kHcHcB9aFWzTEcFh8rWPX2V1c+
 wRCLMqnZaTXU/Zh7uRoNPJPGwKWmslXSMdxZoDce5qRpzkpyQLu+N4rjQmaY7QwTpW
 Xuzb4TAXU1JEA0OScvK0Toeoz40tq3UVsrTjqi2zlImtLPe6n0iOAUs6FIaiGyCiiH
 AP4vXVXM2RaMwlkQO+T1+HAFWi8acVfhEOaxQy8YGNekW8fCHmpKDVoUgqPFqXzvde
 2rCMO7Ksvs41w==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 26 Oct 2024 08:32:57 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Subject: [PATCH] drm/tiny: Fix some error handling paths in
 sharp_memory_probe()
Date: Sat, 26 Oct 2024 08:32:36 +0200
Message-ID: <b218165cf9af60907e0912266134f1ef1d3617b9.1729924305.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If an error occurs after allocating resources based on which
"sharp,vcom-mode" is used, then these resources must be released, as
already done in the .remove() function.

Use 2 new devm_add_action_or_reset() for that and simplify code
accordingly.

Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/gpu/drm/tiny/sharp-memory.c | 66 ++++++++++++++---------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 2d2315bd6aef..01d1ce2462e1 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -48,12 +48,6 @@ enum sharp_memory_model {
 	LS044Q7DH01,
 };
 
-enum sharp_memory_vcom_mode {
-	SHARP_MEMORY_SOFTWARE_VCOM,
-	SHARP_MEMORY_EXTERNAL_VCOM,
-	SHARP_MEMORY_PWM_VCOM
-};
-
 struct sharp_memory_device {
 	struct drm_device drm;
 	struct spi_device *spi;
@@ -67,10 +61,6 @@ struct sharp_memory_device {
 
 	struct gpio_desc *enable_gpio;
 
-	struct task_struct *sw_vcom_signal;
-	struct pwm_device *pwm_vcom_signal;
-
-	enum sharp_memory_vcom_mode vcom_mode;
 	u8 vcom;
 
 	u32 pitch;
@@ -500,25 +490,41 @@ static int sharp_memory_pipe_init(struct drm_device *dev,
 	return drm_connector_attach_encoder(connector, encoder);
 }
 
+static void sharp_memory_stop_kthread(void *data)
+{
+	struct task_struct *task = data;
+
+	kthread_stop(task);
+}
+
+static void sharp_memory_disable_pwm(void *data)
+{
+	struct pwm_device *pwm = data;
+
+	pwm_disable(pwm);
+}
+
 static int sharp_memory_init_pwm_vcom_signal(struct sharp_memory_device *smd)
 {
 	int ret;
 	struct device *dev = &smd->spi->dev;
+	struct pwm_device *pwm_vcom_signal;
 	struct pwm_state pwm_state;
 
-	smd->pwm_vcom_signal = devm_pwm_get(dev, NULL);
-	if (IS_ERR(smd->pwm_vcom_signal))
-		return dev_err_probe(dev, PTR_ERR(smd->pwm_vcom_signal),
+	pwm_vcom_signal = devm_pwm_get(dev, NULL);
+	if (IS_ERR(pwm_vcom_signal))
+		return dev_err_probe(dev, PTR_ERR(pwm_vcom_signal),
 				     "Could not get pwm device\n");
 
-	pwm_init_state(smd->pwm_vcom_signal, &pwm_state);
+	pwm_init_state(pwm_vcom_signal, &pwm_state);
 	pwm_set_relative_duty_cycle(&pwm_state, 1, 10);
 	pwm_state.enabled = true;
-	ret = pwm_apply_might_sleep(smd->pwm_vcom_signal, &pwm_state);
+	ret = pwm_apply_might_sleep(pwm_vcom_signal, &pwm_state);
 	if (ret)
 		return dev_err_probe(dev, -EINVAL, "Could not apply pwm state\n");
 
-	return 0;
+	return devm_add_action_or_reset(dev, sharp_memory_disable_pwm,
+					pwm_vcom_signal);
 }
 
 static int sharp_memory_probe(struct spi_device *spi)
@@ -595,15 +601,20 @@ static int sharp_memory_probe(struct spi_device *spi)
 				     "Unable to find sharp,vcom-mode node in device tree\n");
 
 	if (!strcmp("software", vcom_mode_str)) {
-		smd->vcom_mode = SHARP_MEMORY_SOFTWARE_VCOM;
-		smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
-						  smd, "sw_vcom_signal");
+		struct task_struct *sw_vcom_signal;
+
+		sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
+					     smd, "sw_vcom_signal");
+
+		ret = devm_add_action_or_reset(dev, sharp_memory_stop_kthread,
+					       sw_vcom_signal);
+		if (ret)
+			return ret;
 
 	} else if (!strcmp("external", vcom_mode_str)) {
-		smd->vcom_mode = SHARP_MEMORY_EXTERNAL_VCOM;
+		/* empty */
 
 	} else if (!strcmp("pwm", vcom_mode_str)) {
-		smd->vcom_mode = SHARP_MEMORY_PWM_VCOM;
 		ret = sharp_memory_init_pwm_vcom_signal(smd);
 		if (ret)
 			return ret;
@@ -640,19 +651,6 @@ static void sharp_memory_remove(struct spi_device *spi)
 
 	drm_dev_unplug(&smd->drm);
 	drm_atomic_helper_shutdown(&smd->drm);
-
-	switch (smd->vcom_mode) {
-	case SHARP_MEMORY_SOFTWARE_VCOM:
-		kthread_stop(smd->sw_vcom_signal);
-		break;
-
-	case SHARP_MEMORY_EXTERNAL_VCOM:
-		break;
-
-	case SHARP_MEMORY_PWM_VCOM:
-		pwm_disable(smd->pwm_vcom_signal);
-		break;
-	}
 }
 
 static struct spi_driver sharp_memory_spi_driver = {
-- 
2.47.0

