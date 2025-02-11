Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF4A312F3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 18:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44B710E734;
	Tue, 11 Feb 2025 17:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XRNFwf9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE9E10E72D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 17:28:31 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38dcc6bfbccso2534702f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294910; x=1739899710;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vS3u0ChTSEKOd8+Sz6F6ngUlw65dB3dACQW1SqE48AI=;
 b=XRNFwf9nVKNhvBWwnBSZlwCeZBzH1wb7ELt4xvoMM4WPnIWTu6RA37CuTUECk1xdAm
 yJ5YfMHycn6xilkPI9nVm6xtCdUBfpjU6foJbKdaQ4pVwrIl2f9Ld9vjX1gt3o+A8W3j
 3uWEmETdUkYf7lQoRXnlDly87/ca7Y8FdEW81JO4fao7oTgQboH6fa0ZCiBtDgss5G2Y
 hBp9GpDP9cvNM4aHEAeFP0ZhymNB8q4i1+Glp8RXO1lT8g6luDW0hyq10yutOQLx1FhU
 OYCUFo0ZNEC01JDhYifP1sxY5Gg7VFGMIJTj7Ep9PgHMubMGNgQYZLTOwi+3YEHjrYpS
 O4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739294910; x=1739899710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vS3u0ChTSEKOd8+Sz6F6ngUlw65dB3dACQW1SqE48AI=;
 b=N8VMf/EUiXbpLmkcI1DAarloX51k2EAC8iul6xg9JPtEbQDtyTqsRXhRBa30FmhInG
 dhAqt6xchJjZFyYlhWl0dAH7HtoyRis7+KI9RLG9va/CGfJjfKaAyR6wVNIsxSYwCpNE
 VIvNYcIFsOeQxjKtZN6eVFmKjzYCzXDKeTcR13Fc2QG5GR0b6w9/zGXgv0JN7hSX8yxF
 zVSXbJ5XYZulxC+BOhrhrb4yFt/AgiCC/u+YiWR7Rfcpc61duDJ3qF8HmD7h5I3lxuqU
 sYl0UhYDH7mey5fcxrUJcXK45nMtfEDaMQ73FHdx9cfpNUtY+ANELymut1Kzf6FkHSOj
 Lrrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBnRnV/rMWChFj+a7fcH7lXCeAXKa0B9gAlGSWSU3E5CM93P3rGuNgjvmAhUtlVSjfAy7vgoW2ITw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCgibXS5t/vxN9C9L23zxXunmcojJYx6RdG7lZlohfYqRiW8tX
 1Y268ePrtqnFSipikhbiQ5pJeLECJBU5X++z8a9XjYFwoMQRlrqRrS64JrFjiVQ=
X-Gm-Gg: ASbGncuz8XsJz04/s9DWtgiGHDtehxYpYVHvZSXPO89lxB7ItvQu5X7pc3cdBbrcVz1
 6FMoAqBtXcRq7vk8xwGWWHJIBilMln6yJjcnrPpkkmuxPYWIQi8ixr8yYvcd0EP5Bv9OMZ2J95R
 ijT4v/+jr46VO20C6PrcFlcIaFYrdHTjuE8Ot55miijiBpW7qVmACg7Zy9tI3LSON6DDNKULlxB
 oa8nPd7QW073TAwRFFVaqIsBEVfWxvfn5ELXk+/s6f7AqL+aYQRq9bC9QzMXrLwsg1Xq5RPkGyj
 q1KPpaZ4Cl1U8PI9Dw==
X-Google-Smtp-Source: AGHT+IHqQL8DP1JxgbD5VCseSPJliBuud4+TKe0/7TKQBN2dXAAu4cWiVWufhhODSvakeasxOn/B7w==
X-Received: by 2002:a5d:6c66:0:b0:38a:418e:1177 with SMTP id
 ffacd0b85a97d-38dc8d9202dmr13638587f8f.11.1739294909768; 
 Tue, 11 Feb 2025 09:28:29 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 09:28:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
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
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
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
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:27:59 +0100
Message-ID: <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=jbrunet@baylibre.com; 
 h=from:subject:message-id;
 bh=JaT81TlS5JMrK8kOZ5IZdpgPZCU4QD/jFNP5Hu5Ari0=; 
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g2b7ztdhzPOxtPtSHwTFX2Q+o4rv+DEa9t5
 h6A3WVIiOaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINgAKCRDm/A8cN/La
 hfOYD/99mpDDUk+53d/ZanCMbwJ18FpyC1UiheDU5tolp1TjYQ6xJZCD+FUPxTFT7MftJJcmhYU
 ppgXsxWu0vXkLiqwtls3vqypBiQP+/Br9Qd5XQWkcZy/dc3ZG2zA3FYPdrfq+GhBMRIkGuLuHTL
 o7EuhQ8gx6YcEgqWCA6gSH/AN/YL2kOG6F+B5JEBMrI37awyyaz1Rygwhyl0qItpoUOWJamW9JV
 wIpocIeEtV+MlTG1Kbg1WF84EI6JwAjfM5JOZjn65GDvReg9Ar7nhjkfw9C+PcnPZH0HZyY/RsO
 2nb7YpQYtDrCuTOtHOVSR7fA8CD/QL0C/aSz1PBFOUFaQHD5znSEvuNqIZ9MPROPDFGwWQTygho
 2baf6O6czt8zk+qqtahPDzlgKfvfXO6FmH4Hb1xyCFSAyBR2DoZV+W2xJP1brfagyAH+hw0+twD
 635z1DYFdgPAGxz2iXJxZK24JpVoR9CrB33x3a2TEwdc/KaNUt7ax6Lt2f81O587Z+7O8L6/JP4
 XoAxgdGRTcmsl4S9zAEnByChdEI4wOcGAX/bdK2ZG0vy8N1L3IoKJnpRT+bFUN4v+dlR2ppl9wt
 u0Jd4hipB0voUxKyhN6Eu4LjGycuGC96lmkrjExZld1DdDEdciaO1sLFUKFZ592SZ9dz1emyXb5
 8Aak+H6IrmLmDhg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-mpfs.c | 52 +++-------------------------------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..bbea64862181877eb7ae51fdaa9e50ffac17c908 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base, 666u);
 	if (IS_ERR(adev))
 		return PTR_ERR(adev);
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
-
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

-- 
2.45.2

