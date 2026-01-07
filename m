Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE309CFCC52
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6DF89A88;
	Wed,  7 Jan 2026 09:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NFrrWObK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A3410E048
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 03:24:24 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-598f81d090cso1724064e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 19:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767756263; x=1768361063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60qQDz4h2yBrZrt+5nJ7kzn4AUoTIpiIP7c/XfMeN/A=;
 b=NFrrWObKp+eP+nN9R1pEexw8UbrJRfXiyhJfFAxhyQxFfRQFQnI1VJHDADRoSWT4/g
 xTdvbUaXRP0T7v3m67aXEC35H8C1PstyGZQXq1rBC3bJ3B4bxGaAUA+AIioM0YlYi1BI
 sEWHQZChG6Ux7oD/S3wYFINMlpg/YqrghaAHM9RZ3J9r6H+PqnwMZ7ArSzSsmcGmS4Pf
 clw6IBCucM+276uYsl9Kd1DJeEVjqV3+e77mtydYXxoUqeOQ1kSrDz6VS3pStqlOWmf+
 XR+2EEPDQv7RoNTisD0bE+yReUCUs8S16z5RhZnLWHzqrLNCHJ7RwXIfC7I8OYhQRGvu
 6W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767756263; x=1768361063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=60qQDz4h2yBrZrt+5nJ7kzn4AUoTIpiIP7c/XfMeN/A=;
 b=M77nSyKu4a7BPpfOnfIid5AoclukMg4cUa3f/07NRXBO27+56sSPY9A041EAPO4Czn
 2bGVKxSpgG7xHlvOplWSZSkH++8hihWmjUaS4RDfdqQwT+vCDD4QLBYUsc9FoozwZz+j
 QVdRzUBG3KBP20KZuvk4vquhWDYlQUNkpGfASH9SCfWvb0P/HU1pD1YVGAjTJoCGDewn
 TV5DY1qpqeLpIjAK/bfRuMWtExQmfBxZxv6hIBKnZw4KFiAJsxSMdS/QMviPTydJyNsB
 LBLcloDRgtDdffgNIaok6hw+zuepQUrf9LYruRPs74NPq4KmVp0sutnj8tfzHuZ9UPGJ
 rc3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9gekR/9LP3JkCbwR2YXcqB0UIYzKnnf8NA/6JkC24theCdrER3K2nASAmzjd86cwqdmyov9L2eOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqsRnN/Rh1lUYExICmImacC++JjOxz8p6nkEHaw0wRkp5jJeve
 NcVIHUgI1SsIuc35yzZI1hKoTticnFEEt1h03kL8rK92ZdvS43QF4UFf
X-Gm-Gg: AY/fxX5KjtZzv0LJ7FqQy6MuFOEGZg2o4VbR2S7wh/KFI/ZoPSLh0756cWTcaAki3hK
 j8fuBd7JGuVFXfqMDq9dDAswiGbAj/aGFDOgXgytngp/WrrmH0b6HVCqkVmL9wvH4xKM7xjMTeR
 76sr8S10ukY+gAZ/vtySQGluzbHIdLmrEo+WOBzCe9xWmp2L57LMPflCQHBruXZSllxvr8bq8PP
 viNKqNo+SySTzdvQCsJNrJmJIe7dCd3Oc/Ww5puJaBiUSYuawZuZmjkixDGVKoLJpiS/W8THh79
 9OecjVMbBS5zZDYXENZzeCoRHtve+0vDLsSL+Fn+I/xjNOCGYDpNvVuCEPnWYcp1UUlhxQ2hQyk
 8qOTHAIjZNZlvswNtIVzHPRNPSO+u5+2mOf5dKaTHcZbVaPXkbt1QPxQHDANds3aZA0t2s7dOaH
 2MCZTn9iq/RRDjr1Yv1AnlurbLwZo2NA==
X-Google-Smtp-Source: AGHT+IH0wu1LAHW0UEkv+fgdFfY09mKYm14HGTFo179KsAtGSh34o/UoPCnVHcaJewUj0pSf21AJaQ==
X-Received: by 2002:a05:6512:ba5:b0:594:2bc4:8284 with SMTP id
 2adb3069b0e04-59b6f261accmr321769e87.49.1767756262677; 
 Tue, 06 Jan 2026 19:24:22 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-59b6dd08593sm324669e87.77.2026.01.06.19.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 19:24:22 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: Vladimir Yakovlev <vovchkir@gmail.com>, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: [PATCH v2 1/1] drm/bridge: lontium-lt9611uxc: use irq as optional
 parameter
Date: Wed,  7 Jan 2026 06:23:42 +0300
Message-Id: <20260107032342.332758-2-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: DEZGWL9B8SOU.ON89J7KLA9QA@bootlin.com
References: <20260107032342.332758-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Jan 2026 09:14:13 +0000
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

On some systems the interrupt pin may not be used.
In this case we exclude DRM_BRIDGE_OP_HPD from supported operations,
after which a polling thread is started to detect the connection.
(the default polling period for DRM is 10 seconds)

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index bb5cff021c93..f7a74ec1f170 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -851,19 +851,25 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	init_waitqueue_head(&lt9611uxc->wq);
 	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
 
-	ret = devm_request_threaded_irq(dev, client->irq, NULL,
-					lt9611uxc_irq_thread_handler,
-					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
-	if (ret) {
-		dev_err(dev, "failed to request irq\n");
-		goto err_disable_regulators;
+	if (client->irq) {
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						lt9611uxc_irq_thread_handler,
+						IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
+		if (ret) {
+			dev_err(dev, "failed to request irq\n");
+			goto err_disable_regulators;
+		}
+		dev_dbg(dev, "Uses IRQ\n");
+	} else {
+		dev_dbg(dev, "The interrupt (IRQ) is not specified in the DTS.\n");
+		dev_dbg(dev, "Check the interrupt (IRQ) or polling will be used!!!\n");
 	}
 
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.of_node = client->dev.of_node;
 	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
-	if (lt9611uxc->hpd_supported)
+	if (lt9611uxc->hpd_supported && client->irq)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
-- 
2.34.1

