Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1F47270DF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E2F10E550;
	Wed,  7 Jun 2023 21:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112B710E550
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:53:21 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-652d1d3e040so4217636b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 14:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686174801; x=1688766801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HxkeUs5mQG1dO+8ojJ+2sMsARHixUCPNou02a3vPakk=;
 b=aaZsYlg8dXHFcOB3rrTa2eLeNAIjNdhofFK99V+nOVuox05+iyLw0BsIRr1oeOjkAc
 zYSP6PugSXxD09ad39sLlWsoiTTpi+nJyAgSU0a/9JDrdFQJ6JvsyyxddCNDhwQGhOG/
 LIjagIqqChl7O0BwHPKR6r/lPsRP5p8HN0TVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686174801; x=1688766801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxkeUs5mQG1dO+8ojJ+2sMsARHixUCPNou02a3vPakk=;
 b=OKBJmmCC2Xt8xyHv9Zmw8alhUgFo4UnmDzkQ8luhOh/3xFXWEu4WrHsX6ilF5V3yLX
 ++kHCdasyYxTS2lvN2VmUM5fYmGO05zaxjxqdKDIAV5G5TEXcLEdSPvMnWS/aNXrv+AB
 EQSB553ZFV919esj/i9hu9VjFlABpTq2u5mSa8caLyv2VhJRASqZBoUeRKf5YKJc3V4+
 e4VhPOSqg+0uFYFKjW7NCsgdxC1pAWkye9/HMLAjDkQt0IsrS2wdX+Ili+hIKNUdgkbB
 UmDcuw+srDB3WbMrtDCALEHza8ZTOmOaZBBGpyJD7UWQ4vtDaDXd+UUBy8CwzA84Vnca
 d3wg==
X-Gm-Message-State: AC+VfDyxJCw8J1BfwQEFQvm6Z2Az+Tg7DTz0bEQgi+Jd+1JiYAWGC/uN
 msCXdw4ZdMzy1zbhVvDEOBIQtQ==
X-Google-Smtp-Source: ACHHUZ597/MClSMxQhXP8DkmlrA5jtWeNGArOt9Lj5cLU2Pl5wHpsbXZHKHmXz3QdcGzfRO6Xc/bXg==
X-Received: by 2002:a05:6a00:99b:b0:645:ac97:5295 with SMTP id
 u27-20020a056a00099b00b00645ac975295mr5982379pfg.9.1686174801115; 
 Wed, 07 Jun 2023 14:53:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
 by smtp.gmail.com with ESMTPSA id
 j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 14:53:20 -0700 (PDT)
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
Subject: [PATCH v2 06/10] HID: i2c-hid: Rearrange probe() to power things up
 later
Date: Wed,  7 Jun 2023 14:49:28 -0700
Message-ID: <20230607144931.v2.6.Ifcc9b0a44895d164788966f9b9511fe094ca8cf9@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
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

In a future patch, we want to change i2c-hid not to necessarily power
up the touchscreen during probe. In preparation for that, rearrange
the probe function so that we put as much stuff _before_ powering up
the device as possible.

This change is expected to have no functional effect.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- i2c_hid_core_initial_power_up() is now static.

 drivers/hid/i2c-hid/i2c-hid-core.c | 124 ++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 47 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 19d985c20a5c..d29e6421ecba 100644
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
+static int i2c_hid_core_initial_power_up(struct i2c_hid *ihid)
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
2.41.0.162.gfafddb0af9-goog

