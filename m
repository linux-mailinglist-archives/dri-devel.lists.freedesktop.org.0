Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26258967493
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 06:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AE510E050;
	Sun,  1 Sep 2024 04:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MTlCDm1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBD410E12C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 04:07:13 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7142a30e3bdso3029488b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725163633; x=1725768433;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sko4acOmndCniAhhaR8U/EXx+Ad9ii+FHZslBTejwPk=;
 b=MTlCDm1A7Wz6DA3fFsm/GFRh+LhWkuLYDBpOM44a8JOzzMkwecKbotmzQGeHxpXrZZ
 KBO6ntKZK4dJWhs6iLzylNLoaFCZcmlGCbINPDt29zqQG/6DynT7zvBE/l2S0IGbbN0U
 nvAV1LBfBSTTKuwVN6ikKCHLulQGpgpfoOvdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725163633; x=1725768433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sko4acOmndCniAhhaR8U/EXx+Ad9ii+FHZslBTejwPk=;
 b=Gx7KfKW4fHuIIwgLwX8wx+rAhBurXhId3QzZWIem6yNnGQI1DraCuYxoYlMSkTQVta
 7Q/E5KasSTvD5SRHEKZcDA1neEOazlPZd123hf8Hf2to1MimTIt5iq0QPV4dFiIXrEQC
 o2GSXshKISVDSwkEFn9WAfGzsXfoNVVdCwHEMwD95C2LuPWqYEKVwSIAXPmF/6LBBUst
 z4x7hoeAdWe+GuaFK/PXIJaRBa70STiQ77zCUhmSallNyIY5QtQpPvq+ro9EOIaRHDtr
 UqEIGXwdx9xbIRg6B0euGYX1ZUSbKH/cANd4LWjt1E9cKpdBN6HDmQJrFyCxU0BsOD8J
 1dMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVER5jqvMHtlbmfoYRaYOXuWUujMR8RYYh9OVprDG/OGpCuhdkpTcHOnSTOxpCJiEWmxKeMiKqjE40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyogRvGTVwAeu9HKN/sZwObb7JxuokTXY9+/XuOo+/GYafSCn0K
 R/rcZ8yj3nIfqmEY8tCRrvmECZY7BwftPcuE/xByXKwOlvHYWCGOxy5rPk3b+Q==
X-Google-Smtp-Source: AGHT+IEupx5MlVbtKwKg6yvd5EiB5c1xx+gvkZPhgQaQWXBcBa4Tm7HItPIXvwrtuhd2v5lBCFGh8g==
X-Received: by 2002:a17:902:f60a:b0:1ff:4a01:43f7 with SMTP id
 d9443c01a7336-2050e97bf7bmr144975245ad.10.1725163632654; 
 Sat, 31 Aug 2024 21:07:12 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-205155673a2sm47107365ad.303.2024.08.31.21.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2024 21:07:12 -0700 (PDT)
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
Subject: [PATCH v4 05/18] usb: typec: Add device managed
 typec_switch_register()
Date: Sat, 31 Aug 2024 21:06:43 -0700
Message-ID: <20240901040658.157425-6-swboyd@chromium.org>
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

Simplify driver error paths by adding devm_typec_switch_register() which
will unregister the typec switch when the parent device is unbound.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/typec/mux.c       | 36 +++++++++++++++++++++++++++++++++++
 include/linux/usb/typec_mux.h |  9 +++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index db644bec862c..f420185e36e3 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -235,6 +235,42 @@ void typec_switch_unregister(struct typec_switch_dev *sw_dev)
 }
 EXPORT_SYMBOL_GPL(typec_switch_unregister);
 
+static void devm_typec_switch_unregister(void *switch_dev)
+{
+	typec_switch_unregister(switch_dev);
+}
+
+/**
+ * devm_typec_switch_register - resource managed typec_switch_register()
+ * @parent: Parent device
+ * @desc: Multiplexer description
+ *
+ * Register a typec switch and automatically unregister the typec switch
+ * when @parent is unbound from its driver.
+ *
+ * The arguments to this function are identical to typec_switch_register().
+ *
+ * Return: the typec_switch_dev structure on success or error pointer on error.
+ */
+struct typec_switch_dev *
+devm_typec_switch_register(struct device *parent,
+			   const struct typec_switch_desc *desc)
+{
+	int ret;
+	struct typec_switch_dev *switch_dev;
+
+	switch_dev = typec_switch_register(parent ,desc);
+	if (IS_ERR(switch_dev))
+		return switch_dev;
+
+	ret = devm_add_action_or_reset(parent, devm_typec_switch_unregister, switch_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return switch_dev;
+}
+EXPORT_SYMBOL_GPL(devm_typec_switch_register);
+
 void typec_switch_set_drvdata(struct typec_switch_dev *sw_dev, void *data)
 {
 	dev_set_drvdata(&sw_dev->dev, data);
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index 08431f0896d5..c30fc7f4441f 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -35,6 +35,9 @@ int typec_switch_set(struct typec_switch *sw,
 struct typec_switch_dev *
 typec_switch_register(struct device *parent,
 		      const struct typec_switch_desc *desc);
+struct typec_switch_dev *
+devm_typec_switch_register(struct device *parent,
+			   const struct typec_switch_desc *desc);
 void typec_switch_unregister(struct typec_switch_dev *sw);
 
 void typec_switch_set_drvdata(struct typec_switch_dev *sw, void *data);
@@ -60,6 +63,12 @@ typec_switch_register(struct device *parent,
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
+static inline struct typec_switch_dev *
+devm_typec_switch_register(struct device *parent,
+			   const struct typec_switch_desc *desc)
+{
+	return typec_switch_register(parent, desc);
+}
 static inline void typec_switch_unregister(struct typec_switch_dev *sw) {}
 
 static inline void typec_switch_set_drvdata(struct typec_switch_dev *sw, void *data) {}
-- 
https://chromeos.dev

