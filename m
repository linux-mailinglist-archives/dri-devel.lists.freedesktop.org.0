Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6D901FDC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184B10E41D;
	Mon, 10 Jun 2024 10:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kRxp0wZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5910E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:50:33 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4218314a6c7so8245495e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718016632; x=1718621432; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tT5iagNMZP1SzTVgA+EQJW3bWeimBmBcx/H3HKT9wq8=;
 b=kRxp0wZEy6yW3FE7mHEqjWVorlRGxmOYo7+2nH/xJBy56mIrw/T907QoUORkLHNROh
 fEdlbYXvg0mZ/GqqhW/l32veqPwUKCrgcFIAaBGcuY7DMONf8DPZGh4wI1YOoODrmu3W
 86cGPKtrJdc2nHM2uVdyYLQDUkOvOATl4GgDgCiO6Ba9g3pdBW6bDomnnkiZ4/hHlLY5
 A+DPXd0CJuMpf4obsbg8IyJx0BhZXlsSM3RFbmGj3os6sq+n8TCwKk3u8kZzSmvi5awE
 OhZKhJGPOj10i5FRae8E3OWofsWwoNnwbu9f5arvXgebD2RNektqTg9nuq+N7CN3Vy+I
 Ig/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718016632; x=1718621432;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tT5iagNMZP1SzTVgA+EQJW3bWeimBmBcx/H3HKT9wq8=;
 b=wervECQZuTwx5BRpHj0K6jcOHYKzbM46f6U48TGV4qUTxywRRbF4TH8M3SQXF2hlEy
 z+9NirM3ZIvmDe4pxgLggOKiJ/cUvQ0x81A4O5wQ44XKfOpz5/na0NDC29Z4lIOOvxe/
 Xa5YSKV38Gha4Oc/xeRMzfwQkvjGbaF9bo0OyttiUcnIMcFsl+KfaUjFN5/zQFoXTFd6
 ungtPQFLC7TycRE1wOdeBg1Y4TdFgwN6/1vUaLC9jmbchiCZfYckczjyi4g55QeP7E3g
 Y1TxF7Fi7jszV/ECDW1i68ruMYN0D0L70obnloOempVQIQJdI8XbjP5cza+Jj1YAJQEX
 lAvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOGPfkI1u2CkcN30PQ+yI3vq/zQu3VcFpZiWEE3QgHF2n3k0Zd1HeDmzuPnM/KFhN1K4bZ5lMMUpLrSwarznbkFZGZSV1wsYtasU/1Z8A5
X-Gm-Message-State: AOJu0YwXQYPqpbXgj6pNgnevnaU4Qqwc94WtNgyCzbY5EPYbxM4ych4w
 QtDaglUpvLW9/Kv8jZJ6JX3rk/R/Pkcn7CaP2w7sZ9YS8cIhL5AnooQHFmxKq1Q=
X-Google-Smtp-Source: AGHT+IHy2dL4U+D3GW1eATnAreZXXx7GxaYyjTMqfB6akQaoOCuuGo/C5XmhD72mhm8FU0n2CPVWnA==
X-Received: by 2002:a05:600c:1988:b0:421:63f7:7e13 with SMTP id
 5b1f17b1804b1-42164a3aff5mr58486555e9.39.1718016631618; 
 Mon, 10 Jun 2024 03:50:31 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f2169fc45sm3270994f8f.10.2024.06.10.03.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 03:50:31 -0700 (PDT)
Date: Mon, 10 Jun 2024 13:50:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/bridge: it6505: remove unnecessary NULL checks
Message-ID: <6c8c6746-34e2-4a97-9dff-622ed29071e9@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Smatch complains correctly that the NULL checking isn't consistent:

    drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
    error: we previously assumed 'pdata->pwr18' could be null
    (see line 2569)

These the ->pwr18 pointer is allocated during probe using the
devm_regulator_get() function.  If CONFIG_REGULATOR is disabled then,
yes, it can return NULL but in that case regulator_enable() and
disable() functions are no-ops so passing a NULL pointer is okay.

Smatch is correct that the NULL checks are inconsistent but the
fix is to delete the unnecessary NULL checking.  Do the same for
"pdata->ovdd" as well.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: In the first patch, I added a NULL check but that wasn't necessary
    or correct.

 drivers/gpu/drm/bridge/ite-it6505.c | 43 ++++++++++++-----------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3f68c82888c2..d89d1bb9a8ec 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2566,24 +2566,21 @@ static int it6505_poweron(struct it6505 *it6505)
 		return 0;
 	}
 
-	if (pdata->pwr18) {
-		err = regulator_enable(pdata->pwr18);
-		if (err) {
-			DRM_DEV_DEBUG_DRIVER(dev, "Failed to enable VDD18: %d",
-					     err);
-			return err;
-		}
+	err = regulator_enable(pdata->pwr18);
+	if (err) {
+		DRM_DEV_DEBUG_DRIVER(dev, "Failed to enable VDD18: %d",
+				     err);
+		return err;
 	}
 
-	if (pdata->ovdd) {
-		/* time interval between IVDD and OVDD at least be 1ms */
-		usleep_range(1000, 2000);
-		err = regulator_enable(pdata->ovdd);
-		if (err) {
-			regulator_disable(pdata->pwr18);
-			return err;
-		}
+	/* time interval between IVDD and OVDD at least be 1ms */
+	usleep_range(1000, 2000);
+	err = regulator_enable(pdata->ovdd);
+	if (err) {
+		regulator_disable(pdata->pwr18);
+		return err;
 	}
+
 	/* time interval between OVDD and SYSRSTN at least be 10ms */
 	if (pdata->gpiod_reset) {
 		usleep_range(10000, 20000);
@@ -2618,17 +2615,13 @@ static int it6505_poweroff(struct it6505 *it6505)
 	if (pdata->gpiod_reset)
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
 
-	if (pdata->pwr18) {
-		err = regulator_disable(pdata->pwr18);
-		if (err)
-			return err;
-	}
+	err = regulator_disable(pdata->pwr18);
+	if (err)
+		return err;
 
-	if (pdata->ovdd) {
-		err = regulator_disable(pdata->ovdd);
-		if (err)
-			return err;
-	}
+	err = regulator_disable(pdata->ovdd);
+	if (err)
+		return err;
 
 	it6505->powered = false;
 	it6505->sink_count = 0;
-- 
2.39.2

