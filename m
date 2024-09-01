Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94920967492
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 06:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C541410E0A7;
	Sun,  1 Sep 2024 04:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fOalRxww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37BE10E0A7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 04:07:11 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3df07fe03acso1969528b6e.3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725163631; x=1725768431;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2N8vS/njRh59NN9Hhbqh05Yl3HU3mcBshclMsZjbFEo=;
 b=fOalRxwwbmZR7mCOke7Gl9amWW7T2dDknI7eEAi0t3kJ7goLWHhdpLMDBXzvtLUDBy
 5hg7KoMjKkuyvZP9QK0/lSclrpxDNrtk44VZCheCNv9iXSqcmh/WDBV+jSOu3M9zLwPx
 j3zDchmiz4zG+ozAjy6Rw1lPbf5Q0we6iTZKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725163631; x=1725768431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2N8vS/njRh59NN9Hhbqh05Yl3HU3mcBshclMsZjbFEo=;
 b=JDbNX80WgkhmULvfWnQ6FNfbWVnKq+ahwbGCiJKdKkBSn28qkRVJzcozEuvAH5i0ig
 C+nfsTBIk1dGcrhXn7gxo+p5jlzojB6IirPbBF+WjCBrCyHzlE8fTwG26AxhGuh/fNBx
 cqOY+MDOdhiBxMBVEGV0iDfjkr8ku2zJOvWV0n542lormn1/RrTXP1RLeOwrfcHC16+j
 2ZHRBWZPwcb6aNOYLYC+cMHerT4pbCBKgjKBSQNjmOwyIhEl87f0Br69vKtysg/OwCnp
 NplP/NgghDmpYOJe5D3pfTCAy/Thd114B4E7eC6XZWdSShibf1hW92HWZ2/4pWWvyAC5
 rCRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUurqxucXEhJbQFX2JObhp5nmRK+oxU1k5CD41cP4Amjn6LTuPDx6cQkw6Idbcf6jwe6igGWrqzCUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrCJbs3OE0Rf/YJdxkdWM0o7y7yjhPXUN6viK57k/23GzpMUUS
 AFRjGc5/hm/PlBeDCo5UUy1KLUcO98UoIEcoZx5gQCsneQvcmlfW2qi2trA1Kg==
X-Google-Smtp-Source: AGHT+IGn0G5AiONQD8K5yi4LzBmU8yqa6VFEQOeNXV9U2Ho8xKtvyvDtSksQxtqrZ7RRI09TCw6qDQ==
X-Received: by 2002:a05:6830:7310:b0:709:5601:abea with SMTP id
 46e09a7af769-70f72bb320amr3883433a34.10.1725163630581; 
 Sat, 31 Aug 2024 21:07:10 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-7d22e77a7besm5341681a12.37.2024.08.31.21.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2024 21:07:10 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 04/18] usb: typec: Add device managed typec_mux_register()
Date: Sat, 31 Aug 2024 21:06:42 -0700
Message-ID: <20240901040658.157425-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
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

Simplify driver error paths by adding devm_typec_mux_register() which
will unregister the typec mux when the parent device is unbound.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/typec/mux.c       | 35 +++++++++++++++++++++++++++++++++++
 include/linux/usb/typec_mux.h |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 49926d6e72c7..db644bec862c 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -457,6 +457,41 @@ void typec_mux_unregister(struct typec_mux_dev *mux_dev)
 }
 EXPORT_SYMBOL_GPL(typec_mux_unregister);
 
+static void devm_typec_mux_unregister(void *mux_dev)
+{
+	typec_mux_unregister(mux_dev);
+}
+
+/**
+ * devm_typec_mux_register - resource managed typec_mux_register()
+ * @parent: Parent device
+ * @desc: Multiplexer description
+ *
+ * Register a typec mux and automatically unregister the typec mux
+ * when @parent is unbound from its driver.
+ *
+ * The arguments to this function are identical to typec_mux_register().
+ *
+ * Return: the typec_mux_dev structure on success or error pointer on error.
+ */
+struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	int ret;
+	struct typec_mux_dev *mux_dev;
+
+	mux_dev = typec_mux_register(parent, desc);
+	if (IS_ERR(mux_dev))
+		return mux_dev;
+
+	ret = devm_add_action_or_reset(parent, devm_typec_mux_unregister, mux_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return mux_dev;
+}
+EXPORT_SYMBOL_GPL(devm_typec_mux_register);
+
 void typec_mux_set_drvdata(struct typec_mux_dev *mux_dev, void *data)
 {
 	dev_set_drvdata(&mux_dev->dev, data);
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index efb5ed32b813..08431f0896d5 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -99,6 +99,8 @@ int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
 
 struct typec_mux_dev *
 typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
+struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
 void typec_mux_unregister(struct typec_mux_dev *mux);
 
 void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
@@ -123,6 +125,11 @@ typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
+static inline struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	return typec_mux_register(parent, desc);
+}
 static inline void typec_mux_unregister(struct typec_mux_dev *mux) {}
 
 static inline void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data) {}
-- 
https://chromeos.dev

