Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D764D3AA80
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD4810E461;
	Mon, 19 Jan 2026 13:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B4XYLovV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB24B10E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:26:13 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a0834769f0so27625735ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768811173; x=1769415973; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbmEw0xI5GEkCsxaHsMMe7LmACI8y/oSXqbnzXdllII=;
 b=B4XYLovVWvwZTel8J7JG5jBOl2RoJc7DZ+KD4C44PbmGIZ+Blhw+dndoyLj4HqNwp7
 BR3ZnaMmhL7E8PagepB0HdsnysGbPpr2hcqTuq9chZbQ40SGFwE79QfKU+SSrN/jUAP6
 AxxkOTk+HrCMnu4lVDYpWuYMmlAvsLu1JTjUGf9LVumQS1t5hUTl/MT3uXIRs9K1e+NA
 6sKMo6PGrA/fScWV0UV1bbm9BJZnv1QPPvzw8e8VwG+t6kwIsXdUTITlPxNM7K3NRxib
 ceFQW7hJUeHhLKz8qZXFG29J/z7fACla5/9mn8y5VvC/H6kg9PO1vrr+AgH6TDf+uiXF
 NAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768811173; x=1769415973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PbmEw0xI5GEkCsxaHsMMe7LmACI8y/oSXqbnzXdllII=;
 b=Wws5uHrqTSr5rH7jxlFDYfhq76jdDMz3vpeObRTP/jXk3Ynt6D9B7jewrLdqp26ULA
 oMHMNRtdCIC82kukFzWqiog4xjfR9EQCD4YVXd7EsjG5P9PBm7lZInxdimLuDF/CRjZJ
 eFbAS2QpRGRWlvuPxJd0GyA5nTGu87tJhyh8EllEUp1Xx1CWicqpS+WrDXqq088n4rhx
 fci7frpLd9RfTk7uguIZZROTfdtV8xGCqTnOES1ll8+MVOuMq7/eu5aBKVwaoS+0an/V
 JFdg5hkacy1fBsbDZhbyuWTh5iz1mfGX5uzu94up8jtmadD00VrN7sykuHhjqi4WLEVA
 qLjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE0iK+xb0WFh52T9zB5izVdPwIhqFwsfSqZmhuqIIZIo0NG9QqZ0IkMiDhY38QjlixakBlXML0VFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr19b/pgMd22BqF4cFROeewsJyb93haQFic1ZDg3JglemNIM81
 c+ECVBKUjPdoYfm7kEqAuhvjkH6PXkjaNGEZr3xoyZxGYQVk684M1PbC
X-Gm-Gg: AZuq6aIwGZtqTqFkPC3uMplr2nmBghdj7mMl/r5GoQys7zn1joRBmVbVJRuHd8gdBI8
 51Z31WgbQrGI9h50+uufvRY8qyWpbSp8LA+G6k2TL3ifwNRhYoB92YVPxhfJwHnt+uH0i0E3hiU
 nybVgJlOVLX3hoDvjQxcnto3dFf0p3KZsxbR/rS4nvAblZ8isgmmr3ylGiAFgqMb0UebQnLWORC
 todyr3YDEpYonuah4MY9IJtCQEfJbmTl9VNpSYGmq+eXuF0od94tHXwBR7DpQwH0G/Sg4ciqJNg
 c8fosntQS6iN7KRWcdP+wHCGzcpqPC+gxlyr2TH/slbfUuUTEEyArxvgXiDKoEo1EJLCxzbzx4K
 BA9+L2ct2NWGyWPD724Tum0sTeU+mW5vSxMCDSzqNoAaiR2WYRwH5IbC8jmfdRZ3PddbOuHZYsD
 dw93angFFU11esF9qa/j5cG6UEvlDd5YLkbGcWJw==
X-Received: by 2002:a17:903:138a:b0:2a1:3769:1cf8 with SMTP id
 d9443c01a7336-2a7188fd789mr97024985ad.33.1768811173364; 
 Mon, 19 Jan 2026 00:26:13 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:26:12 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 3/3 RESEND] drm/exynos: vidi: use ctx->lock to protect struct
 vidi_context member variables related to memory alloc/free
Date: Mon, 19 Jan 2026 17:25:53 +0900
Message-Id: <20260119082553.195181-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Jan 2026 13:39:11 +0000
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

Exynos Virtual Display driver performs memory alloc/free operations
without lock protection, which easily causes concurrency problem.

For example, use-after-free can occur in race scenario like this:
```
	CPU0				CPU1				CPU2
	----				----				----
  vidi_connection_ioctl()
    if (vidi->connection) // true
      drm_edid = drm_edid_alloc(); // alloc drm_edid
      ...
      ctx->raw_edid = drm_edid;
      ...
								drm_mode_getconnector()
								  drm_helper_probe_single_connector_modes()
								    vidi_get_modes()
								      if (ctx->raw_edid) // true
								        drm_edid_dup(ctx->raw_edid);
								          if (!drm_edid) // false
								          ...
				vidi_connection_ioctl()
				  if (vidi->connection) // false
				    drm_edid_free(ctx->raw_edid); // free drm_edid
				    ...
								          drm_edid_alloc(drm_edid->edid)
								            kmemdup(edid); // UAF!!
								            ...
```

To prevent these vulns, at least in vidi_context, member variables related
to memory alloc/free should be protected with ctx->lock.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 38 ++++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 601406b640c7..37733f2ac0e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,29 +186,37 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
-
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/*
 	 * Use fake edid data for test. If raw_edid is set then it can't be
 	 * tested.
 	 */
 	if (ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail;
 	}
 
+	ctx->connected = new_connected;
+	mutex_unlock(&ctx->lock);
+
 	DRM_DEV_DEBUG_KMS(dev, "requested connection.\n");
 
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return len;
+fail:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
@@ -243,11 +251,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
+	mutex_lock(&ctx->lock);
 	if (ctx->connected == vidi->connection) {
+		mutex_unlock(&ctx->lock);
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "same connection request.\n");
 		return -EINVAL;
 	}
+	mutex_unlock(&ctx->lock);
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
@@ -281,14 +292,21 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = drm_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/* with connection = 0, free raw_edid */
+		mutex_lock(&ctx->lock);
 		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -303,7 +321,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -326,11 +344,15 @@ static int vidi_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int count;
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid)
 		drm_edid = drm_edid_dup(ctx->raw_edid);
 	else
 		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
 
+	mutex_unlock(&ctx->lock);
+
 	drm_edid_connector_update(connector, drm_edid);
 
 	count = drm_edid_connector_add_modes(connector);
@@ -482,9 +504,13 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	drm_edid_free(ctx->raw_edid);
 	ctx->raw_edid = NULL;
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 }
 
--
