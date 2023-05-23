Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44870E570
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB51410E4AF;
	Tue, 23 May 2023 19:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AB210E4AC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:31:21 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ae615d5018so370425ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684870281; x=1687462281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DBMR6TdRsWjCzYNnqd6Lk8wDD7DSuTiZG2Mp89E0ajw=;
 b=k81iI0VYz+G1SgESSaCQ3eJJpdE8iDQRZba3GHZUCers6Y8qPLAdBfxLa0L57Gx/J7
 2OvlsTn4vfd2rmyRQSyyob2a+zTuTN+LOyR3UAFXuYie2fQBW9YS6ksmF1M4vrr2nfup
 VCXdQVUOUgdrWmLDOQm+gBi8EXXg47LqFkse8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684870281; x=1687462281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DBMR6TdRsWjCzYNnqd6Lk8wDD7DSuTiZG2Mp89E0ajw=;
 b=dFMUOgrM8qwB3QPaTGBns/OjXfoZxzF2BlXZ8MofJcx8jZet2rHx0Gc2SKLXZtcgCU
 bZz0a8EFwmZ7lwNZhQdBDrjUYnF8527zYch/HJZMzwyz5GpMHlgsTDqwlDi/vUBM9jRT
 W6Z+6FU4WNOK7QxLhLf+BsyMeXiKHSE6HY5uCHDbXtNErVpByMJ73BZzCfOGPPsEYaVG
 I2dpqmIj8il5LGmpkRiHAHu3ONFHh2MkikIvn5qT+OFtdYp2Ettued7OEFjFOwXkE0YV
 S8LlDY9NfN4S8QgcVVyh5chOJakBPMl/d0jiLOjXXewl67Q0f2cayUm0zT8JMOCUT4sU
 x99Q==
X-Gm-Message-State: AC+VfDyueM5eajVy7YzJif4bYauY8kyCqw7ES//1rlAvJaXnh819D2wK
 L18EfiVjsI3EOZQWe2jTCbV8YA==
X-Google-Smtp-Source: ACHHUZ4kL6lj5MQevXj+1XaBLHQm8E4OFU27v32XuYtb5i3yzm3J1D/BxyX0j8k4k5Bmrq652rBzBg==
X-Received: by 2002:a17:902:fe18:b0:1aa:e5cd:6478 with SMTP id
 g24-20020a170902fe1800b001aae5cd6478mr14599077plj.58.1684870281004; 
 Tue, 23 May 2023 12:31:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:31:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/9] HID: i2c-hid: Rearrange probe() to power things up later
Date: Tue, 23 May 2023 12:27:59 -0700
Message-ID: <20230523122802.5.Ifcc9b0a44895d164788966f9b9511fe094ca8cf9@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future patch, we want to change i2c-hid not to necessarily power
up the touchscreen during probe. In preparation for that, rearrange
the probe function so that we put as much stuff _before_ powering up
the device as possible.

This change is expected to have no functional effect.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-core.c | 124 ++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 47 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 19d985c20a5c..fb5ebf3ca739 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -855,7 +855,8 @@ static int i2c_hid_init_irq(struct i2c_client *client)
 		irqflags = IRQF_TRIGGER_LOW;
 
 	ret = request_threaded_irq(client->irq, NULL, i2c_hid_irq,
-				   irqflags | IRQF_ONESHOT, client->name, ihid);
+				   irqflags | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+				   client->name, ihid);
 	if (ret < 0) {
 		dev_warn(&client->dev,
 			"Could not register for %s interrupt, irq = %d,"
@@ -940,6 +941,72 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 	ihid->ops->shutdown_tail(ihid->ops);
 }
 
+/**
+ * i2c_hid_core_initial_power_up() - First time power up of the i2c-hid device.
+ * @ihid: The ihid object created during probe.
+ *
+ * This function is called at probe time.
+ *
+ * The initial power on is where we do some basic validation that the device
+ * exists, where we fetch the HID descriptor, and where we create the actual
+ * HID devices.
+ *
+ * Return: 0 or error code.
+ */
+int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	ret = i2c_hid_core_power_up(ihid);
+	if (ret)
+		return ret;
+
+	/* Make sure there is something at this address */
+	ret = i2c_smbus_read_byte(client);
+	if (ret < 0) {
+		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
+		ret = -ENXIO;
+		goto err;
+	}
+
+	ret = i2c_hid_fetch_hid_descriptor(ihid);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to fetch the HID Descriptor\n");
+		goto err;
+	}
+
+	enable_irq(client->irq);
+
+	hid->version = le16_to_cpu(ihid->hdesc.bcdVersion);
+	hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
+	hid->product = le16_to_cpu(ihid->hdesc.wProductID);
+
+	hid->initial_quirks |= i2c_hid_get_dmi_quirks(hid->vendor,
+						      hid->product);
+
+	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X",
+		 client->name, (u16)hid->vendor, (u16)hid->product);
+	strscpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
+
+	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
+
+	ret = hid_add_device(hid);
+	if (ret) {
+		if (ret != -ENODEV)
+			hid_err(client, "can't add hid device: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	i2c_hid_core_power_down(ihid);
+	return ret;
+}
+
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 		       u16 hid_descriptor_address, u32 quirks)
 {
@@ -966,16 +1033,10 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	if (!ihid)
 		return -ENOMEM;
 
-	ihid->ops = ops;
-
-	ret = i2c_hid_core_power_up(ihid);
-	if (ret)
-		return ret;
-
 	i2c_set_clientdata(client, ihid);
 
+	ihid->ops = ops;
 	ihid->client = client;
-
 	ihid->wHIDDescRegister = cpu_to_le16(hid_descriptor_address);
 
 	init_waitqueue_head(&ihid->wait);
@@ -986,28 +1047,12 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	 * real computation later. */
 	ret = i2c_hid_alloc_buffers(ihid, HID_MIN_BUFFER_SIZE);
 	if (ret < 0)
-		goto err_powered;
-
+		return ret;
 	device_enable_async_suspend(&client->dev);
 
-	/* Make sure there is something at this address */
-	ret = i2c_smbus_read_byte(client);
-	if (ret < 0) {
-		i2c_hid_dbg(ihid, "nothing at this address: %d\n", ret);
-		ret = -ENXIO;
-		goto err_powered;
-	}
-
-	ret = i2c_hid_fetch_hid_descriptor(ihid);
-	if (ret < 0) {
-		dev_err(&client->dev,
-			"Failed to fetch the HID Descriptor\n");
-		goto err_powered;
-	}
-
 	ret = i2c_hid_init_irq(client);
 	if (ret < 0)
-		goto err_powered;
+		goto err_buffers_allocated;
 
 	hid = hid_allocate_device();
 	if (IS_ERR(hid)) {
@@ -1021,26 +1066,11 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	hid->ll_driver = &i2c_hid_ll_driver;
 	hid->dev.parent = &client->dev;
 	hid->bus = BUS_I2C;
-	hid->version = le16_to_cpu(ihid->hdesc.bcdVersion);
-	hid->vendor = le16_to_cpu(ihid->hdesc.wVendorID);
-	hid->product = le16_to_cpu(ihid->hdesc.wProductID);
-
 	hid->initial_quirks = quirks;
-	hid->initial_quirks |= i2c_hid_get_dmi_quirks(hid->vendor,
-						      hid->product);
-
-	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X",
-		 client->name, (u16)hid->vendor, (u16)hid->product);
-	strscpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
-
-	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
 
-	ret = hid_add_device(hid);
-	if (ret) {
-		if (ret != -ENODEV)
-			hid_err(client, "can't add hid device: %d\n", ret);
+	ret = i2c_hid_core_initial_power_up(ihid);
+	if (ret)
 		goto err_mem_free;
-	}
 
 	return 0;
 
@@ -1050,9 +1080,9 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 err_irq:
 	free_irq(client->irq, ihid);
 
-err_powered:
-	i2c_hid_core_power_down(ihid);
+err_buffers_allocated:
 	i2c_hid_free_buffers(ihid);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_probe);
@@ -1062,6 +1092,8 @@ void i2c_hid_core_remove(struct i2c_client *client)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
 
+	i2c_hid_core_power_down(ihid);
+
 	hid = ihid->hid;
 	hid_destroy_device(hid);
 
@@ -1069,8 +1101,6 @@ void i2c_hid_core_remove(struct i2c_client *client)
 
 	if (ihid->bufsize)
 		i2c_hid_free_buffers(ihid);
-
-	i2c_hid_core_power_down(ihid);
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_remove);
 
-- 
2.40.1.698.g37aff9b760-goog

