Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF2762380
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 22:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1D010E403;
	Tue, 25 Jul 2023 20:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5800F10E3FA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 20:37:12 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-563de62f861so226779a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690317432; x=1690922232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yusd29cgfRRFtrYmhPQHQbup7csmZzeM7LlzCXEQcE=;
 b=TF14OHDO1wEjzH6Xy7aXPUbcQtUqGBeFXB4QhCj0y8AeGf+DAuLjvIRgwcCw/tcFDp
 PS1T0Vy3YdqVEEDbb8VRCgf9KjM600BNH/YfOSQZMVX06aWbCZw8YcVSd9wNHvfcj+Bb
 DNINWWLr8uxpcu8fLvAzMqCooDlayovz5lL1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690317432; x=1690922232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1yusd29cgfRRFtrYmhPQHQbup7csmZzeM7LlzCXEQcE=;
 b=SLCcZ6jOVMZmUr/mtnIamMXY7djSlHSrQvrHnjLUomr46jU6u35tqbRaJBJSHbpKO2
 Y9WgePOUYJI8E9kRNb6WyJ8ZpWWQ81yjcP/DHP+KNHn/Yf270y7Y4O4C5wnZDplLfWW4
 4LSmrlElgk1nioO2fdUVz7ZD0khRxu4vK3daZo4XTVRsEu6QoxsyDJD7McWEMPUSAs/F
 aJOQyZnpLU2D+TlyYBo0fCpMpfM3ExSiTIenHn51qN7J/2qzoKjuhV9zLz1L10+JreO3
 rmjHdhJpoRhToaH9MNsQopyOKv87D52U6LrS8M4PiArOTn6UaV4oGx6jVFv6d5d8U0fK
 +xsw==
X-Gm-Message-State: ABy/qLYwkzoCPGqFqLNKf8lEq+HhDzY9QBNT+6b2ozR+vwTKlvWP3OHe
 Jk+fa2FJhIhB5NTcTVW7y0LvZQ==
X-Google-Smtp-Source: APBJJlGKz4Z08AnB8rCCmUIYGEaejs+i0r0jHurSiRCzpETWAKsD4+Td0PyBToWYShqesufeQpzZHA==
X-Received: by 2002:a17:90a:a08a:b0:267:f7eb:f12e with SMTP id
 r10-20020a17090aa08a00b00267f7ebf12emr241772pjp.39.1690317431969; 
 Tue, 25 Jul 2023 13:37:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c363:4681:f5b8:301])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a17090b0d8100b002676e961261sm1396951pjb.1.2023.07.25.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 13:37:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 07/10] HID: i2c-hid: Make suspend and resume into helper
 functions
Date: Tue, 25 Jul 2023 13:34:42 -0700
Message-ID: <20230725133443.v3.7.I5c9894789b8b02f029bf266ae9b4f43c7907a173@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230725203545.2260506-1-dianders@chromium.org>
References: <20230725203545.2260506-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future patch we'd like to be able to call the current i2c-hid
suspend and resume functions from times other than system
suspend. Move the functions higher up in the file and have them take a
"struct i2c_hid" to make this simpler. We'll then add tiny wrappers of
the functions for use with system suspend.

This change is expected to have no functional effect.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/hid/i2c-hid/i2c-hid-core.c | 98 +++++++++++++++++-------------
 1 file changed, 56 insertions(+), 42 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d29e6421ecba..fa8a1ca43d7f 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -941,6 +941,57 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 	ihid->ops->shutdown_tail(ihid->ops);
 }
 
+static int i2c_hid_core_suspend(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	ret = hid_driver_suspend(hid, PMSG_SUSPEND);
+	if (ret < 0)
+		return ret;
+
+	/* Save some power */
+	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
+
+	disable_irq(client->irq);
+
+	if (!device_may_wakeup(&client->dev))
+		i2c_hid_core_power_down(ihid);
+
+	return 0;
+}
+
+static int i2c_hid_core_resume(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	if (!device_may_wakeup(&client->dev))
+		i2c_hid_core_power_up(ihid);
+
+	enable_irq(client->irq);
+
+	/* Instead of resetting device, simply powers the device on. This
+	 * solves "incomplete reports" on Raydium devices 2386:3118 and
+	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
+	 * data after a suspend/resume.
+	 *
+	 * However some ALPS touchpads generate IRQ storm without reset, so
+	 * let's still reset them here.
+	 */
+	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
+		ret = i2c_hid_hwreset(ihid);
+	else
+		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
+
+	if (ret)
+		return ret;
+
+	return hid_driver_reset_resume(hid);
+}
+
 /**
  * i2c_hid_core_initial_power_up() - First time power up of the i2c-hid device.
  * @ihid: The ihid object created during probe.
@@ -1115,61 +1166,24 @@ void i2c_hid_core_shutdown(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_shutdown);
 
-static int i2c_hid_core_suspend(struct device *dev)
+static int i2c_hid_core_pm_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
-	struct hid_device *hid = ihid->hid;
-	int ret;
-
-	ret = hid_driver_suspend(hid, PMSG_SUSPEND);
-	if (ret < 0)
-		return ret;
 
-	/* Save some power */
-	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
-
-	disable_irq(client->irq);
-
-	if (!device_may_wakeup(&client->dev))
-		i2c_hid_core_power_down(ihid);
-
-	return 0;
+	return i2c_hid_core_suspend(ihid);
 }
 
-static int i2c_hid_core_resume(struct device *dev)
+static int i2c_hid_core_pm_resume(struct device *dev)
 {
-	int ret;
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
-	struct hid_device *hid = ihid->hid;
 
-	if (!device_may_wakeup(&client->dev))
-		i2c_hid_core_power_up(ihid);
-
-	enable_irq(client->irq);
-
-	/* Instead of resetting device, simply powers the device on. This
-	 * solves "incomplete reports" on Raydium devices 2386:3118 and
-	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
-	 * data after a suspend/resume.
-	 *
-	 * However some ALPS touchpads generate IRQ storm without reset, so
-	 * let's still reset them here.
-	 */
-	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
-		ret = i2c_hid_hwreset(ihid);
-	else
-		ret = i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
-
-	if (ret)
-		return ret;
-
-	return hid_driver_reset_resume(hid);
+	return i2c_hid_core_resume(ihid);
 }
 
 const struct dev_pm_ops i2c_hid_core_pm = {
-	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_pm_suspend, i2c_hid_core_pm_resume)
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
-- 
2.41.0.487.g6d72f3e995-goog

