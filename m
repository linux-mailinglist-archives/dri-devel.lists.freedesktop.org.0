Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B9894D1A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213CE10FB39;
	Tue,  2 Apr 2024 08:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m5/AzlkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC0A10FB0A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 07:54:06 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a4e0e3ef357so613897866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712044445; x=1712649245;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S0aDPStcWplmgXtw121bO/EPEa2tJmV5qvIMipnIN9E=;
 b=m5/AzlkIh5+gNYKaNTUtAJDCO8eNzKli3hiYA6RTXqDcofvtcFOFHmseU6WzsJ6u+F
 6HGFgLzXF+nRVAl+iL9cMkwQ75FScKZ3gETwLBdyOKBNtFMb84QwvnFZC28Hr6r6vM9v
 DgYU8ry51I8JucABPWT4EOzvjDGM+q4c4laZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712044445; x=1712649245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0aDPStcWplmgXtw121bO/EPEa2tJmV5qvIMipnIN9E=;
 b=TiOuZHJiIymvAIGRZmqNtx4CDWutwlCvCAtOChI852h1huZpU1HJFYNIr2L27JXSuH
 GU680G8dklrWka89/dmU0THW5YQOIScVj6KZU8rK+5+IVc30QHT3hBLxQoNL5qZwI/wR
 yPmuMA4LNC2B3SpuDN67klM96FFcUZTi0pFYQd8XK0zEdsb2DLCAycatqX7mq/yY9Ii+
 frR8xmpunbAPQNevN9blce5xm58lyi5cIFrlAb06nquigNqHnVF5LSAM/t4FhcyZDG+E
 bend63yfXseS+YS2NCPzUF+WYslBU/X+c7cY8YCurbc5VJbldPcvj55UHgqLJkBmsQto
 IXcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnyPvXA5ou48ZJteGpli1l/zb8KkALALfLTp//IGl5omhPZ/fsK8xQkzI2bA4NbjPPEyHX9hQ3ksn61IHGsRPRIeE+/Q999Q427JChJfJg
X-Gm-Message-State: AOJu0Yz4gQsTaLlu1JP22C+txUiHT0RI/s+siI68OC0RIH9ZSRy0geHd
 h35y2cpY/dcE1ehhxELNj7Qm+9mV8NBf3HqXCQEJtS8y4IKE4B2QzlC6ieLUIQ==
X-Google-Smtp-Source: AGHT+IEO3o3WE2Q6ehT7FdVQbjibduradq+vM90LrmVRkZTLj+wI/38lnWD5V3+vj2JRKKZyNZQGQQ==
X-Received: by 2002:a17:906:795:b0:a4e:8e54:7962 with SMTP id
 l21-20020a170906079500b00a4e8e547962mr403527ejc.41.1712044445152; 
 Tue, 02 Apr 2024 00:54:05 -0700 (PDT)
Received: from orzel7.c.googlers.com.com
 (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a170906a38500b00a4761c94a5esm6227359ejz.107.2024.04.02.00.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 00:54:04 -0700 (PDT)
From: Wojciech Macek <wmacek@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH] drm/mediatek: Add RENDER capability to DRM device
Date: Tue,  2 Apr 2024 07:53:52 +0000
Message-ID: <20240402075352.3147747-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Apr 2024 08:02:52 +0000
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

DRM device shall create /dev/dri/renderXXX entry
to allow ChromeOS VMs to access the OpenGL rendering
offload.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c213092..afa4d6391b08 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -585,7 +585,8 @@ static struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 }
 
 static const struct drm_driver mtk_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC |
+			   DRIVER_RENDER,
 
 	.dumb_create = mtk_drm_gem_dumb_create,
 
-- 
2.44.0.478.gd926399ef9-goog

