Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F7CEEECC
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 16:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074D210E230;
	Fri,  2 Jan 2026 15:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A4d/1wqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEBC10E230
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 15:56:01 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b8018eba13cso1907069566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 07:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767369360; x=1767974160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U/E4Pkle8R/umjjml+ar6gI8frpDcsvylCBgQE9LDis=;
 b=A4d/1wqK0THeZ/y3Vu7v5mJU/oEtBcAj5kReR+unF/ZElkSOMuN1Lf6Yk0aRr7d3xD
 qTPdNVLDIgwwOj4+ICTeXRhzMH5xJ+GAIRgl+oNWXDm+fD6nmjh4Jk001BqK4Dbc0hUq
 Vu7I4x7tEhjS9RqFp9sKbmQlZN0e7K6h1aQX3kIWSyeziIOzMDPgw67BkVo+7wixvWmp
 iz1CYSSz8DJPmDDYXyeKWKldKhI0pukd3+h1WMFroTRjbsiwSmgcmHz0hqQHxdutnhBM
 fz0my3Xzach9ZcB+Te7HUHrJFKy0oU1RMlcbSuIInaO4QSQFCtkFdm1RxuPjOK7/55Ti
 4vXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767369360; x=1767974160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/E4Pkle8R/umjjml+ar6gI8frpDcsvylCBgQE9LDis=;
 b=QNVLDs6TxrzVJgnilNIwKJDIlMNZmMHoWbKKJxThyCWw/F0+aNtqshFfdbSBngXcFp
 xHXQi/TPNRO8zxX+uZmBwd9S3P58XpKEe0I1/b9KRNig8sl6CUe47Z+ivPFzJY1bWONW
 hEkqZ3Betpq107v5vok6Svf+4kCPuTnSpLWRsGLfufskFWk+oF+IjAzFbBtydFnx/5Ja
 Bci8LNVX1LvUNi/pF/1Hzliqkq4NrN5TB1KJpdCP1m0lVwrD9+1VUqlqbTRxOoktNudT
 mQESbTZfQKY4+KyBPc1wyqGikskx0DIZDEbivGC5kxouvCWHTFgMPL8vYmFXMAD4q+3y
 gBtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSOR1a1rz+Ij87KHRXDftm7OJYwq/zvD8Wp2wmQfBYc1r7QEnAIp2moHFYgG0MpK2JJhpMT4K7Rg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybnii03xOl9Zq8RT20AmYdIwQaQJt28rE6AyfncwhDuDA9x791
 Lsh2qQV8LqKie+Hscy965df/ZtSTnZdC1NP0RFpUKexLObS3a6Ln0AxK
X-Gm-Gg: AY/fxX4FNOPDjl+lKJIMup3EFpRrOtOZULbCW5RB8OvgFvi8dYVhoCJHEEszfa0WNsW
 GXaqsbKmI2ogN1NicEzAGpZ679mtgyLnid7uHUTVtU4gGBB3OL62qKIy6bSOBBt1yJDFBFIfRQ7
 l4h0JeFJKsXSppDb2UVlM0YNQV3rvAdZcXGOD6qTTKxmXKvMuh7J5LEHqBvI6nQqwt4ZoFVr4NW
 zduu4RJhQchC1twBQvP1pMzInCi9EbZW75dzf9JafPZ82AEkiCQ02qjwVxPyKrtkjoNwSGfVC3N
 ahVjj6n1tiFzh5ZvhTBeTKbXk0tCSi8DqQi1RszOq8t/55HiQtwGfN9yJlMU0x+h6QBivqZWK53
 NuSq0rofjrdAoabsoKuGS6sk11SGFPRLV/zEme9f4PFd6Oa87xI6jZmmX/9fGCX0uZ39e4j+e3X
 YaGxOWj10l6eGMrjJBDqCkyO91Bw==
X-Google-Smtp-Source: AGHT+IEPvWgGFyPCVd7ePOa1jj1CQs953xedwLMhJbDS9KL168vNCZqWkuywUIt3CMvJc+d0CdFOTg==
X-Received: by 2002:a17:907:9303:b0:b83:1340:1a2c with SMTP id
 a640c23a62f3a-b8313401b75mr2268205166b.64.1767369359470; 
 Fri, 02 Jan 2026 07:55:59 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:ac54:a680:a017:734f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f089fesm4611961066b.46.2026.01.02.07.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 07:55:58 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>, stable@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/bridge: synopsys: dw-dp: fix error paths of dw_dp_bind
Date: Fri,  2 Jan 2026 16:55:52 +0100
Message-ID: <20260102155553.13243-1-osama.abdelkader@gmail.com>
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

Fix several issues in dw_dp_bind() error handling:

1. Missing return after drm_bridge_attach() failure - the function
   continued execution instead of returning an error.

2. Resource leak: drm_dp_aux_register() is not a devm function, so
   drm_dp_aux_unregister() must be called on all error paths after
   aux registration succeeds. This affects errors from:
   - drm_bridge_attach()
   - phy_init()
   - devm_add_action_or_reset()
   - platform_get_irq()
   - devm_request_threaded_irq()

3. Bug fix: platform_get_irq() returns the IRQ number or a negative
   error code, but the error path was returning ERR_PTR(ret) instead
   of ERR_PTR(dp->irq).

Use a goto label for cleanup to ensure consistent error handling.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Cc: stable@vger.kernel.org

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v3:
- Add resource leak fixes for all error paths after drm_dp_aux_register()
- Fix platform_get_irq() error handling bug
- Use goto pattern for cleanup as suggested by reviewer

v2:
- use concise error message
- add Fixes and Cc tags
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 82aaf74e1bc0..432342452484 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2062,33 +2062,41 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	}
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret)
+	if (ret) {
 		dev_err_probe(dev, ret, "Failed to attach bridge\n");
+		goto unregister_aux;
+	}
 
 	dw_dp_init_hw(dp);
 
 	ret = phy_init(dp->phy);
 	if (ret) {
 		dev_err_probe(dev, ret, "phy init failed\n");
-		return ERR_PTR(ret);
+		goto unregister_aux;
 	}
 
 	ret = devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
 	if (ret)
-		return ERR_PTR(ret);
+		goto unregister_aux;
 
 	dp->irq = platform_get_irq(pdev, 0);
-	if (dp->irq < 0)
-		return ERR_PTR(ret);
+	if (dp->irq < 0) {
+		ret = dp->irq;
+		goto unregister_aux;
+	}
 
 	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
 					IRQF_ONESHOT, dev_name(dev), dp);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to request irq\n");
-		return ERR_PTR(ret);
+		goto unregister_aux;
 	}
 
 	return dp;
+
+unregister_aux:
+	drm_dp_aux_unregister(&dp->aux);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(dw_dp_bind);
 
-- 
2.43.0

