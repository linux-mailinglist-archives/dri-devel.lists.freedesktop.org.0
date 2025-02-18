Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9D5A3A77A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 20:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919F10E747;
	Tue, 18 Feb 2025 19:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ADP+B5E8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F403910E747
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 19:30:48 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e058ca6806so1288143a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907047; x=1740511847;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
 b=ADP+B5E8E61vi7NfNjHNA4YAaGSvbj+N684QoF4RnqQ6u/sIYBaB7yss2nAnr0h+zu
 +Eh9nShDm3eP83n2AtBB9Qd6unkCnVk1jo6YnAmpnwp7aCEeH8E7UO4Fmha3JFwXc8m0
 SkVkuCDbQbsRV6LAXh9hO8iVcDP+HaxeBpoVsuYGHmH58/k5+eAlINcZm2zuAkU4XPWI
 SFjES3n0ZPnRCjCoaQ9XnaFvL/xyIH6U+gGaHpLcCBU3qKLMreuuYtLfxlTR3CWut1Xq
 2wK6QlclqpSQbWq9kMz1PBtF7FhUardXkFrtrRsOPDqVh+6iIp9jpqATEgCxRooyosHl
 7O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739907047; x=1740511847;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
 b=bRM9QkbYyPcpIYRgfaByR/XRqjXliPsK7ohdP5jVhYYgTfISUKVrvBK9R+Ju9CDLrY
 S5qrhJbsgW4/TX2bM4ZV0MiJNU5EgeL6pz7o+EKdF3hIrNpNVhnCNkX4nY5tqW4T1H9Q
 sShYLThH9kuDk17GZJxiOrDqEJ/kxQjojTtqRcNlBbgHaHgMO7E3srJ/xBkhbIXabax6
 Ur3GlcCUskpbNg8D+kSA02NEMujybdcu7bzMs6o40DtPT2pR6iuOweMG3PXejKiBoQ0r
 E4aqWmBbp6OsV8Appecrm0/sWBs3ZFnROScE2XgMWmaJf0BovNwPkZJEXo7yvumWHsIk
 sfNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0WeTLqcWm2HHxITmuv3iQ+9prP/9UDWDFV68StHuuzKyPihNLR0m2i0wZkTd/yZMVSaNuEfaUmpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpkpOOGc05FCYWEwBWeJA+RwYk5NHz9SZ+TP+k229Urgfh+sdw
 BL0jzT3kh9f879inDIBC/EGTZa0FblNBvUC7mX6MfVb28nxYOw9WBS8eTXZKSf8=
X-Gm-Gg: ASbGncvPANrj9AS23viIDqgCIrnA/O13nIvfA/FcKoNrAXYroer877Ao1Lzk4Uq0+tS
 TEn6qTU6h0hH+R1VuYOoNxs9fJ9/SPVZwiC9hbb5xLhYiT72nQYS35LJtYhJ3M6DjhOQMJIDwXI
 FyMj8qc4p/1TZwvZJvkrh9nBm0iSQjOa50a4A1IAb7umRPQnz9OmmeIJwFn4K+Y4oZmdrpughr5
 Lf2e7IYWjzFeuY/WKEqGdMoWFtgDeP+og6eQdsLnK1da5MEH2ASXCWJ7UJNxWsTlR+icc5yCWoq
 +KsAFwUtD/tafdvL+81cjVDC66Ef
X-Google-Smtp-Source: AGHT+IFuCiWjYik1tkYGoQgh4ZsFo8lmztzxBCjOpVHi8VmVD4pqRZa3rFXJofCtONyce7E+IyRCXQ==
X-Received: by 2002:a05:6402:4609:b0:5de:525c:53cb with SMTP id
 4fb4d7f45d1cf-5e036043d74mr14749201a12.6.1739907047405; 
 Tue, 18 Feb 2025 11:30:47 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 11:30:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:50 +0100
Subject: [PATCH v4 5/8] clk: eyeq: use the auxiliary device creation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-aux-device-create-helper-v4-5-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=jbrunet@baylibre.com; 
 h=from:subject:message-id;
 bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=; 
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/TCjdli34EttLxXtExpNQaPhDVC9bRlZCzA
 Z9Pj+ToqrKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0wAKCRDm/A8cN/La
 halfD/4t/Q1MfjlL6VZuSiHTSQPRAa2QAwtLrhbOZWIEknOslrn3QFObs5s6ZPqryvP12HbeHpB
 ZqtOFjUqe/ieQB3ITOsZJaewTPwytAAIwK3CgywZ6JOUxa+9g7HGTKvG3uOOJmkRIffzZmr3L8R
 NZ5pFyDvvdDjI5pECZrNMk4VPJkwSAIgH5iZfiqrRun1haUOJoglpQY8Y8EADKhayv8tRAynR4l
 qDsiwIJrdtBE25fKHWyOZDOE8tpQxMsEt2TrH5ebbZtAEtr/gH6YfiiTUbuz37DxeauQ6mj6ehD
 XTEhxGJYCgV8aSKkCalZcuRKharsqxXA2evtvPHKpQvKOyIZ8EgbBeEOQ7dOeXKjzhWOM5XtsqE
 aMUycH4kRdaTgn4jHRICD4dLzYS3dXyYx3r7rGFlO7duZ/8KxdlzdluJ5loozQhR7O5ANEzTyHJ
 oRWP1Otit21XBW620IoAkxL8DF+P4i2UVjNzAOmtxgzut6dBQb1gzAm06Dpb4EJtFyAnO8mdI/H
 TIGsc8Ti47aBOluK+kO9s5wUA2fZ3WFLXDsN2BGvN4+teT6is420M3bHdw3I0/vCDlh1nH3plyg
 XifkLcQIVqvbW2dYXxE/b7rFiZ7Tza9okUXIhyKDFxmZAvQJKCF+0Z0Tgq8zioD1LftOLwSybaY
 ndwZJujpyaFfb8g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Tested-by: Théo Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ5
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-eyeq.c | 57 +++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 640c25788487f8cf6fb4431ed6fb612cf099f114..4094f34af05b488545cc87043fb3352968515a78 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -322,38 +322,18 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 	}
 }
 
-static void eqc_auxdev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int eqc_auxdev_create(struct device *dev, void __iomem *base,
-			     const char *name, u32 id)
+static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
+				       const char *name)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->dev.parent = dev;
-	adev->dev.platform_data = (void __force *)base;
-	adev->dev.release = eqc_auxdev_release;
-	adev->id = id;
 
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret)
-		auxiliary_device_uninit(adev);
-
-	return ret;
+	if (name) {
+		adev = devm_auxiliary_device_create(dev, name,
+						    (void __force *)base);
+		if (!adev)
+			dev_warn(dev, "failed creating auxiliary device %s.%s\n",
+				 KBUILD_MODNAME, name);
+	}
 }
 
 static int eqc_probe(struct platform_device *pdev)
@@ -365,7 +345,6 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -379,21 +358,9 @@ static int eqc_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	/* Init optional reset auxiliary device. */
-	if (data->reset_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
-	}
-
-	/* Init optional pinctrl auxiliary device. */
-	if (data->pinctrl_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
-	}
+	/* Init optional auxiliary devices. */
+	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */

-- 
2.47.2

