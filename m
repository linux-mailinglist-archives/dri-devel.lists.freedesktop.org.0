Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3093873344
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 10:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4322510EB2A;
	Wed,  6 Mar 2024 09:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jbZi51CK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AF510EB2A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 09:59:19 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5a11f42324dso1945303eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709719159; x=1710323959;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=amo+IB69F59PemLpSax75yoEEsP5uNKr7goammFkeSQ=;
 b=jbZi51CKXhdDtR9rhvX7BtyUDg7BMDLSoGBEANphBZ2IgzKYr3pxdA1u/6XGRNta9C
 Ova0iDT9hfy5iuNc5lKKjsi3o+bumHiPakuGlZkM3V26827dYhUnHkKKstagtuiS7kLg
 zv2l2TcTbwvUPq/Ai03B76bCxjTnBm/yPCGcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709719159; x=1710323959;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=amo+IB69F59PemLpSax75yoEEsP5uNKr7goammFkeSQ=;
 b=lu1dvsuvhiKRTZvAFSqTDB4Q6CNNzXvsswsq79UJbT607Fx47SbJm8PyNkho0U7JdC
 LTTGFrPs2brvCHRpbPLjIy+dtDUu9ioPKtdYqG1yiOfvBQY7UbUacGMEJM33YXQXTuFl
 5YUQ4u4gkm7nbM+hQ8j5LQvyrrrWURRsSgcdenEL/qHn+TVQLBt6213yZmTe3ge/9bHE
 t3oTOSRrsCe3oqQNVzgWG1EU29JfuFjgrqvZtTgCTXaTx89vEf7lyrHEv+f0AKbY2XJR
 25HWRehhwUGLhEfnHeUCq6pdcgY9Ttj8Y7fDwHJTdFMJknIlXPf6R6ZqwonvXAcNMtWE
 wlzg==
X-Gm-Message-State: AOJu0Ywgq4eYZZgaBdi1dwHrgzlvb1IXeBmyjM4rSQa2BP2wTJAxR2Ct
 we3KHKh9Zcqq6Up19+QFHL+RAwJImBChUxeZZt8vmE0JvxaTSzx28QnrnXpD8g==
X-Google-Smtp-Source: AGHT+IGH3rZ4T25qUkA+cDcFog01f0dyjlG7LgO4XHMFQChVX0e9m0kWX4fa7DjerS1PYX4VYALCoA==
X-Received: by 2002:a05:6358:70f:b0:17b:5c81:839e with SMTP id
 e15-20020a056358070f00b0017b5c81839emr5343895rwj.7.1709719158860; 
 Wed, 06 Mar 2024 01:59:18 -0800 (PST)
Received: from yuanhsinte1.c.googlers.com
 (36.157.124.34.bc.googleusercontent.com. [34.124.157.36])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a63e648000000b005d68962e1a7sm10643000pgj.24.2024.03.06.01.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 01:59:18 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 06 Mar 2024 09:59:05 +0000
Subject: [PATCH v3] drm/bridge: anx7625: Update audio status while
 detecting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-anx7625-v3-1-9034263bf530@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGg+6GUC/2WMyw6CMBQFf4V0bU0ftKAr/8O4KO0t3AXUtNpgC
 P9uYaPR5ZycmYUkiAiJnKuFRMiYMEwF5KEidjBTDxRdYSKYqJlkipppbrRQ1APXTpqTk40j5X2
 P4HHeS9db4QHTI8TXHs58W/8bmVNOWwlOWuuNru3FDjGM+ByPIfZky2TxreqPKoracNkCY51Qn
 f9R13V9AxwPhDncAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
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

Previously, the audio status was not updated during detection, leading
to a persistent audio despite hot plugging events. To resolve this
issue, update the audio status during detection.

Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Add Fixes tag. 
- Link to v2: https://lore.kernel.org/r/20240306-anx7625-v2-1-7138e00b25bf@chromium.org

Changes in v2:
- Add a space after the colons in the subject line.
- Link to v1: https://lore.kernel.org/r/20240305-anx7625-v1-1-83ed3ccfa64c@chromium.org
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 29d91493b101a..9f0d0c5b8ebf5 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2481,15 +2481,22 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 	mutex_unlock(&ctx->aux_lock);
 }
 
+static void
+anx7625_audio_update_connector_status(struct anx7625_data *ctx,
+				      enum drm_connector_status status);
+
 static enum drm_connector_status
 anx7625_bridge_detect(struct drm_bridge *bridge)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
+	enum drm_connector_status status;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
 
-	return anx7625_sink_detect(ctx);
+	status = anx7625_sink_detect(ctx);
+	anx7625_audio_update_connector_status(ctx, status);
+	return status;
 }
 
 static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240305-anx7625-fe16d3a9d37d

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>

