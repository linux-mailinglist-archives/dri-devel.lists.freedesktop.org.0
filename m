Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84836CB26B0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 09:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8543E10E6AF;
	Wed, 10 Dec 2025 08:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gYByS5D6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F1410E250
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:31:53 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6496a094ae1so1047914a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 00:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765355511; x=1765960311;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WSlXOGUPyH2wmzlmXTP6V9Rk2E/YQBY/7/JUKnpIt0k=;
 b=gYByS5D6+IMNdXFzyrdtgYzy91fZf8Muu4T/V3SeQgHkdhoh4M2QJpCJNJ6IjM33dF
 5o30u6Fm/6t9HIWuVMUFHZSpF08lOgZjm7CDODUNgOv2eh4dOMGaQsIzVHS+DIXByYck
 /onvzyFdfKDFNgBlCxCIfMqxbMug7k8GeVhjQMzcjFMGSKG8JC5eOc3pJcZzniX4VSv7
 wGBBkE3/MXZN+jdNXDQ6BbVhrom/9rWL2gU3sV9h7f0St9nqhQoFeEaX63G8gBWEeq55
 6VopZ5ZylqPOZDU8uBQcHjH0qHFRuIqzZduTuwb9HwQHoRYeQ8LlqAi8FerOE4jCoaJ0
 DZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765355511; x=1765960311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WSlXOGUPyH2wmzlmXTP6V9Rk2E/YQBY/7/JUKnpIt0k=;
 b=BOoiGwzN0T87u5BMfEG2v0J+v0MdU6i9H1HF7expRPnhl/wAKNTEM01cUDw6l/vAhQ
 c95fdWg26I6UZPJSf7HzOTJ+TnnSAamctbnis+wviL6h3WKffum+HiTmwaoXGvivlZnd
 khPufSJUSXjMtgUSQss3CIU8Xn+/oSURSZFxONCKSpYAB7Lb9m+J8UOTwHBLSbxPPJjH
 q9Z7ane9FyJ5CVq6ed5qu+w6IUr5lkI1ZElZefUmA/yA3ODLjoHyZrCg2sF//uBFxLV/
 xoY142zTkF0Kn5YoRSFLgZp2zcPUMdVo4ko6aft3aCPK/jrUeG7JNpPHvdoNpcqoJevs
 OR/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU21s8mgeiXztEOO9+4glfWXWEYhkzz4bBXGYsgF6doDGQ3bypG6ly8j6fuMzhhoQZWYUBab0IONSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvxqYIMe9PUXi+7c7Rdq+a/I7Q40auTXUOPrMS5uD13123n5QR
 8HtbsUKN52D378Ws4M2DhLMgoyUUot3Ad/VU6/Vcl07yGhzDzReLXsKYNcDjxUaLTt0=
X-Gm-Gg: AY/fxX6bcf7tZVOB6fqIkh+jpZI5alwZrt+fZt9ZWEbMm3iVG+V+2BJucxP+/DlR7iy
 iZFWkkwodrnBazUwG11nGta8nPdQvSbsgxgluSydrzeP/S3xfVCZu8BD+34BHs1mJhth/6TIxJc
 PyawC9kz1MWFmg6JK6Axs6oilFy8I8s7COOcVsELiWDQYiKNKS84BXUNzy1FnVHt8BF6SVFpQoN
 Bn2yYYpq1Gs4C/+s2g7hkAUrs/P8pfGenzHisi+UBpV9D48AGgBTRC8j3PzlEjPxuAYWMv/nT1N
 q8tnUM4ktLxb+eIqCvLymqzkhN/ZTu1lqwNhRm3eHUeyfcK20Yt6GYzh9sa6NYMhpmKcTk2DyCH
 qvKiIZO7pbJgxle/r8kDkZJ4yzJWviCCO93Dffkd2pAEAsYgL8BuEqBn9O4EJvfXwBFQxS7VtBz
 3hwreedlks1Bc8oiRg
X-Google-Smtp-Source: AGHT+IFDU3NgK94e2I43lGVaae/zTSx8SJWvAB4zEAII7VlEYPowkYq2MDr2f3QvhM1SFljKSS7JEQ==
X-Received: by 2002:a17:907:86a6:b0:b7a:21d5:15eb with SMTP id
 a640c23a62f3a-b7ce844ed2cmr161725666b.52.1765355511508; 
 Wed, 10 Dec 2025 00:31:51 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-647b4121f07sm16450153a12.28.2025.12.10.00.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 00:31:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 1/2] host1x: Make remove callback return void
Date: Wed, 10 Dec 2025 09:31:37 +0100
Message-ID: <d364fd4ec043d36ee12e46eaef98c57658884f63.1765355236.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3660;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=LrLdovRzSzdNxTBUY5bVyUTgTkSb9V8DwRHPPe0GO8o=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOS/sRGieJNY6eEBd+rKCwW3UfWy+0G4cTvst6
 vX4NaiKjOaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTkv7AAKCRCPgPtYfRL+
 ToEUCACCotR1zED66IhienYTk2oEwO+g1mqbvB0PBHiZ7kpG+Kt+FBF7T1RKGnWK6WehDqyRHzM
 LmmgMZ0GhkSc/r8NFSihIQ7xR9UHh0VtcZmTCGjd/V+1XQJ//+axPc6/9xNaWlRikHwzmJCpk0s
 Zn3UGsasK2k7ECE8T6ylyGqtRmxW3d0glZQHu1Nr48U662jtsLpWZTEqu0fSg6jfVexpG95q63a
 KmF1OmNjtm+iHmWbYbtWuMwvE/va59+K8qESdRpTmtGEhbPfoSDzB9Z5AKF0leNgBVwwbtrYrSm
 9Gn4FQA7UH5CuZuJt9nktkL/UscIvvFIeQ5hP0bslc+tW4tc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

The return value of struct device_driver::remove is ignored by the core
(see device_remove() in drivers/base/dd.c). So it doesn't make sense to
let the host1x remove callback return an int just to ignore it later.

So make the callback return void. All current implementors return 0, so
they are easily converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/crypto/tegra/tegra-se-main.c      | 4 +---
 drivers/gpu/drm/tegra/drm.c               | 4 +---
 drivers/gpu/host1x/bus.c                  | 2 +-
 drivers/staging/media/tegra-video/video.c | 4 +---
 include/linux/host1x.h                    | 2 +-
 5 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/tegra/tegra-se-main.c b/drivers/crypto/tegra/tegra-se-main.c
index 7237f14eaf5a..4e7115b247e7 100644
--- a/drivers/crypto/tegra/tegra-se-main.c
+++ b/drivers/crypto/tegra/tegra-se-main.c
@@ -401,11 +401,9 @@ static int tegra_se_host1x_probe(struct host1x_device *dev)
 	return host1x_device_init(dev);
 }
 
-static int tegra_se_host1x_remove(struct host1x_device *dev)
+static void tegra_se_host1x_remove(struct host1x_device *dev)
 {
 	host1x_device_exit(dev);
-
-	return 0;
 }
 
 static struct host1x_driver tegra_se_host1x_driver = {
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..bd0646eae555 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1300,7 +1300,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	return err;
 }
 
-static int host1x_drm_remove(struct host1x_device *dev)
+static void host1x_drm_remove(struct host1x_device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(&dev->dev);
 	struct tegra_drm *tegra = drm->dev_private;
@@ -1329,8 +1329,6 @@ static int host1x_drm_remove(struct host1x_device *dev)
 
 	kfree(tegra);
 	drm_dev_put(drm);
-
-	return 0;
 }
 
 static void host1x_drm_shutdown(struct host1x_device *dev)
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 344cc9e741c1..fd89512d4488 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -628,7 +628,7 @@ static int host1x_device_remove(struct device *dev)
 	struct host1x_device *device = to_host1x_device(dev);
 
 	if (driver->remove)
-		return driver->remove(device);
+		driver->remove(device);
 
 	return 0;
 }
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..68783d5ffeb1 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -107,7 +107,7 @@ static int host1x_video_probe(struct host1x_device *dev)
 	return ret;
 }
 
-static int host1x_video_remove(struct host1x_device *dev)
+static void host1x_video_remove(struct host1x_device *dev)
 {
 	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
 
@@ -118,8 +118,6 @@ static int host1x_video_remove(struct host1x_device *dev)
 
 	/* This calls v4l2_dev release callback on last reference */
 	v4l2_device_put(&vid->v4l2_dev);
-
-	return 0;
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9fa9c30a34e6..5e7a63143a4a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -380,7 +380,7 @@ struct host1x_driver {
 	struct list_head list;
 
 	int (*probe)(struct host1x_device *device);
-	int (*remove)(struct host1x_device *device);
+	void (*remove)(struct host1x_device *device);
 	void (*shutdown)(struct host1x_device *device);
 };
 
-- 
2.47.3

