Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E089476A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 00:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA4610F62F;
	Mon,  1 Apr 2024 22:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TR8IH3JW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B64010F62C;
 Mon,  1 Apr 2024 22:43:41 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-513dc9d6938so5475090e87.2; 
 Mon, 01 Apr 2024 15:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712011419; x=1712616219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1HRSs16ZaqWirPKX2Q82tz4rJe4xnCWFUzWP+U9GaI=;
 b=TR8IH3JWuEeVqftDwJCfH+FhY70/APUyMcL6T1AnVwrpVi89veDoi8pOFomhFMLDXk
 guMiCbjfStMso88G0WtG8O37xt7E4LpfmCbW/me0wgh2Ug9kXR1toUf0dDF5i3dsxw3x
 4h0xG48ZkCVz3nIsyt5tv3BhlzFulWuGSxk4gH/qTCr61EYItuFDna5xaHc3FiR4AaNE
 wLrLHpMMtEeJoHcxatotoEJaE9nbfDPkaN0ccVL5XDUHh1Io7TttwpHCUtsrsJgzDIzc
 t8G7JebdisnjF96UL8946Wy1YmQCrP9GABq2+GZUjijDMfy9orpTEOi/gvnL0UAeGbAB
 Xl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712011419; x=1712616219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1HRSs16ZaqWirPKX2Q82tz4rJe4xnCWFUzWP+U9GaI=;
 b=E6Lp3EnoXmaZ1m6IWHnDy8N9NNOh2fljVfBE4lELxD2+cx0OsluCfBDqy8NL9f7oSI
 2H/26c40oQ8bCVwMpu+jDHWhfX3jK+dFKH5wyGK3TNKnHSc1wDbL6CUNN3F6JiDmFNDn
 l2qJzGM4kxt3s9/bqoHIdXKoF02l2SsA700V4xWw+proQGZRQxDImB/ckxhDhzsjKzTd
 r6g8A9AcDJSUNRhjEtR/CgZ5J4aK5CFwMWMVRUkHZs8fsl46pLmjlCJK4h6XGFHXIABX
 lLCXBwF7tZDFCaQWu6GvTa9tz1qeLwdKQuE6a1PxFzQZ6JkhaD8yY/r2Fx4MtrU03Ol8
 pJsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV43Dn8nNX25vvcF7CNC0mDrh5FLUwyKT9rrJrsvKYQiILweKMKt2VAyHIMQx6cj8kF3xA+HxWw9Z+TjG8skYmVJhC9i2okylW9/+x+g/xAGLvWRXByWXiLkBR8fO3syWybNvoP2FpvPyz21w==
X-Gm-Message-State: AOJu0YwBArvilD3UkKDqFhtD77N+huxHmG4BeD+adMhnLaz72gxP65AZ
 SYoR1Kar+wCgZqoqqLw+6HKYK40gYXMC2orpH8Vw5au9/6gIUc+i
X-Google-Smtp-Source: AGHT+IF5AAFDiHU2c7BlOH2GKKUyK+ACmqIyuoBaH5uCfBfF8+qL4PRYFYq9gmLKpIuJjrRfZZOWXA==
X-Received: by 2002:a05:6512:3191:b0:513:d524:3790 with SMTP id
 i17-20020a056512319100b00513d5243790mr8255946lfe.43.1712011419012; 
 Mon, 01 Apr 2024 15:43:39 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 c3-20020a170906340300b00a4739efd7cesm5796808ejb.60.2024.04.01.15.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 15:43:38 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 2/2] drm/lima: fix void pointer to enum lima_gpu_id cast
 warning
Date: Tue,  2 Apr 2024 00:43:29 +0200
Message-ID: <20240401224329.1228468-3-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240401224329.1228468-1-nunes.erico@gmail.com>
References: <20240401224329.1228468-1-nunes.erico@gmail.com>
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

Create a simple data struct to hold compatible data so that we don't
have to do the casts to void pointer to hold data.
Fixes the following warning:
  drivers/gpu/drm/lima/lima_drv.c:387:13: error: cast to smaller integer
  type 'enum lima_gpu_id' from 'const void *'

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/lima/lima_drv.h |  5 +++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 10fd9154cc46..739c865b556f 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -371,6 +371,7 @@ static int lima_pdev_probe(struct platform_device *pdev)
 {
 	struct lima_device *ldev;
 	struct drm_device *ddev;
+	const struct lima_compatible *comp;
 	int err;
 
 	err = lima_sched_slab_init();
@@ -384,7 +385,13 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	}
 
 	ldev->dev = &pdev->dev;
-	ldev->id = (enum lima_gpu_id)of_device_get_match_data(&pdev->dev);
+	comp = of_device_get_match_data(&pdev->dev);
+	if (!comp) {
+		err = -ENODEV;
+		goto err_out0;
+	}
+
+	ldev->id = comp->id;
 
 	platform_set_drvdata(pdev, ldev);
 
@@ -459,9 +466,17 @@ static void lima_pdev_remove(struct platform_device *pdev)
 	lima_sched_slab_fini();
 }
 
+static const struct lima_compatible lima_mali400_data = {
+	.id = lima_gpu_mali400,
+};
+
+static const struct lima_compatible lima_mali450_data = {
+	.id = lima_gpu_mali450,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "arm,mali-400", .data = (void *)lima_gpu_mali400 },
-	{ .compatible = "arm,mali-450", .data = (void *)lima_gpu_mali450 },
+	{ .compatible = "arm,mali-400", .data = &lima_mali400_data },
+	{ .compatible = "arm,mali-450", .data = &lima_mali450_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
index c738d288547b..6706c19b166e 100644
--- a/drivers/gpu/drm/lima/lima_drv.h
+++ b/drivers/gpu/drm/lima/lima_drv.h
@@ -7,6 +7,7 @@
 #include <drm/drm_file.h>
 
 #include "lima_ctx.h"
+#include "lima_device.h"
 
 extern int lima_sched_timeout_ms;
 extern uint lima_heap_init_nr_pages;
@@ -39,6 +40,10 @@ struct lima_submit {
 	struct lima_sched_task *task;
 };
 
+struct lima_compatible {
+	enum lima_gpu_id id;
+};
+
 static inline struct lima_drm_priv *
 to_lima_drm_priv(struct drm_file *file)
 {
-- 
2.44.0

