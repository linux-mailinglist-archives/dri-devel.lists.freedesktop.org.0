Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039DCB544A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 09:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7410E79F;
	Thu, 11 Dec 2025 08:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ih8cHupn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC8610E7B7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 08:59:33 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso2954045e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 00:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765443572; x=1766048372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d7Dcmeo17/ho3pwIJKnx+P3oKTwjiCKC8M+QuOO4Bzs=;
 b=ih8cHupn/Lci18bE92Oae1ZW9nhHdgCuXoDfE0ZRw8mQpMjZWzs30Sp/NgP9H11t3S
 soGcvfIv1oDFyeS1yG4H5YpBedq/ixvnV5IxwVumBa5l8JUpenapNVkKN5XTPKo94eWS
 8DrWgt3Blk6yvalEROgo4/VpUvQ1ELMXrdLMhFj8Co2v+ORVSApdzX7ihmJOZxd10rE9
 otYTHv//dcsvobGdRtCb0iy4G0FsA4VK9CJdTOBirwuFIYPq1FLbykcIbwgPqOuSaFmu
 LPVlRFpE3Ccao2bhKU9434Iaxn1hwxwVSsmlFxHcIe3kwl/kgL2vgj9srARz/rYYj8w7
 mqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765443572; x=1766048372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7Dcmeo17/ho3pwIJKnx+P3oKTwjiCKC8M+QuOO4Bzs=;
 b=PsAIaR3+77SwtKniXBF3l+UdGL67lbOxBCc54bhyxqk5ecT0XfG9u2pE66dtbXEeBw
 rOki5izHYLxOW6Ia2QC2a1iRoEyj4y4pS2aBq4zw303yfg5GQhHULWiULcmZJ8SrqQdT
 VUdUU7PuoU9QlweaXZfvIdHO2liz7ZVqzHKCqXy+txzQ22X1equjRBiK+RtVWFaHDdzM
 xnOQiIojE8fWovD3FKv2OkRUhPTTeRAYmqc9ZX7cFc4gPT/ocEphUX1udQofVG/O3Wj7
 hbrjG8WmQllLv18qI3tTSB6C1/9GX9+9eC4SM3Um9LsJ803fy//0lVYs746DXtf9gzWz
 QTng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXryy7byRY7ZHasFB8H3qT5RPz/omHbXqTFf+ebz++KDwaEF7YOW0MA6BuLemeNvOIefLHlUSLm+P0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFVd/nRmTeFy0FFmHrevNstJ4J8QDa3GNWYKXuH5fs5Bj47YML
 07bW70ztBtxdxALSQMOykIPJbSNGCw/IaTa+GMDjbhOJaGcsn+lA2c9m
X-Gm-Gg: AY/fxX5qOYL33jE4j4cgdtyMWMHQBVgzw4iqZZRWFj5EdImwHpYMLJbExeNJU7UKnJN
 /RzffRofqWrjubVFI9+XuIQccS70K51UZ7m1CGRULBvN7i0nzfPn7A8Nz6fQ3e/pgYEla6zp8We
 wvec6VMitZ9r+ADBUNWhD1g0izUXfyAaJZXe6H3i41dgc8k586tUo2m9foqA0qWlI5FnAXFAnTY
 gXtKyFXA1oPvRAultuzgWaplLx9JCoxn+Pywz1zVuxPvK4yMfBvaXcZ/WUTGBqYrFqyVslk4BQW
 FVEgeYemjFtwD0sW2GyjYJ7yAqZJnXuZ5X5a1yZ8LglV3u+QfYQwdDLgXbPmcw7KxORxLiDpiFF
 MaphQDuVtr5/kjVEqdijyBnwQ8D+Ol1GKfPz8et1LusmDK7GIpqZpg5v3EpVrlUF/5NLdOHdUhV
 PQ9nmKJg==
X-Google-Smtp-Source: AGHT+IFfevukgFnWT3LKBWertJrehx/v0qPaRwBDg4O1Pd1KYzneq0UfgHhekRMu8pvpp3JFeKvIGQ==
X-Received: by 2002:a05:600c:354a:b0:477:97c7:9be7 with SMTP id
 5b1f17b1804b1-47a837fcbb4mr55532325e9.1.1765443572110; 
 Thu, 11 Dec 2025 00:59:32 -0800 (PST)
Received: from pc.. ([105.163.2.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89ed6c64sm8683195e9.12.2025.12.11.00.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 00:59:31 -0800 (PST)
From: Erick Karanja <karanja99erick@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] drm/radeon : Use devm_i2c_add_adapter instead of
 i2c_add_adapter
Date: Thu, 11 Dec 2025 11:59:23 +0300
Message-ID: <20251211085923.737742-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Replace i2c_add_adapter() with devm_i2c_add_adapter() and remove all
associated cleanup, as devm_i2c_add_adapter() handles adapter teardown
automatically.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_i2c.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 1f16619ed06e..f3ba4187092c 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -931,7 +931,7 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 		snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
 			 "Radeon i2c hw bus %s", name);
 		i2c->adapter.algo = &radeon_i2c_algo;
-		ret = i2c_add_adapter(&i2c->adapter);
+		ret = devm_i2c_add_adapter(dev->dev, &i2c->adapter);
 		if (ret)
 			goto out_free;
 	} else if (rec->hw_capable &&
@@ -972,15 +972,6 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 
 }
 
-void radeon_i2c_destroy(struct radeon_i2c_chan *i2c)
-{
-	if (!i2c)
-		return;
-	WARN_ON(i2c->has_aux);
-	i2c_del_adapter(&i2c->adapter);
-	kfree(i2c);
-}
-
 /* Add the default buses */
 void radeon_i2c_init(struct radeon_device *rdev)
 {
@@ -999,10 +990,8 @@ void radeon_i2c_fini(struct radeon_device *rdev)
 	int i;
 
 	for (i = 0; i < RADEON_MAX_I2C_BUS; i++) {
-		if (rdev->i2c_bus[i]) {
-			radeon_i2c_destroy(rdev->i2c_bus[i]);
+		if (rdev->i2c_bus[i])
 			rdev->i2c_bus[i] = NULL;
-		}
 	}
 }
 
-- 
2.43.0

