Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16E12F2A41
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708FD6E14F;
	Tue, 12 Jan 2021 08:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F4E6E139
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c5so1541810wrp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GykaU4cI0SXnXLg8G5Xx6bVIoDu2kLDo8nS6efSlsbU=;
 b=VNuXUgSlC/+vIZgPwmyE1RWKZqn/FxswV9GXIgSfTFbyoxUWF2Qzd2zQvCr5X4uyfL
 /j71gVbMJ5j1EscvmdOKvuHrnJ0k1XbbEYuAxb2aTi36LcdnWlI6GJoD8toqh9L8McIZ
 4UIErh4TU8/zVKPi9pfS9LxDsGk0AyuECcJOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GykaU4cI0SXnXLg8G5Xx6bVIoDu2kLDo8nS6efSlsbU=;
 b=q++RB0z7v0JeDLPzfH5mIR/e9rlH3R7pVkdU7dw84Vv6PTvGaifqiwLLy7kE2Jl9Or
 hI+dzbpSfvy4TvvhvPl14rzthAdR5FslRwQZK+T5TER4kKcXOqUMBTI8/lO+n8HdO4G+
 6FTs7wHb6o6VZOHU5wTfee6ZAH+t7MKR1jDl/av1YaVa8XpeztIPkw/THY85V94G2Q9E
 uBFKeT+cv2JGjBbZkcZkH/LqyS9qBh5GbAf/l8xopr7kLGFClMSOiw71r6e+CP0mNB1c
 fnA+tvB/fY62JK+jm/AvVKdudS+tMepegeSEinRJU+q5k6EYqLmG8GO7VCaQMwKN5ECF
 DxqA==
X-Gm-Message-State: AOAM531idMDsGdVWftFZD3aDHTojgI1n7ff+cyz/sZRD1GsJrn8+zBZQ
 DgSEfWm1ImlbV41B+0cm1YQbNc4CmtE7QEzd
X-Google-Smtp-Source: ABdhPJwqcPtxnfGl80AIaFUSkmJUOYERQLvt+jiaUUTNdVKj6KQ7xE8J7pCVEc3gf7zlvEjX7okDGQ==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr3191688wrx.164.1610441058194; 
 Tue, 12 Jan 2021 00:44:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:17 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/15] drm/arc: Inline arcpgu_drm_hdmi_init
Date: Tue, 12 Jan 2021 09:43:55 +0100
Message-Id: <20210112084358.2771527-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Really not worth the function, much less the separate file now that
almost all the code is gone.

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/arc/Makefile      |  2 +-
 drivers/gpu/drm/arc/arcpgu.h      |  1 -
 drivers/gpu/drm/arc/arcpgu_drv.c  | 12 +++++++++---
 drivers/gpu/drm/arc/arcpgu_hdmi.c | 27 ---------------------------
 4 files changed, 10 insertions(+), 32 deletions(-)
 delete mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c

diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
index c686e0287a71..379a1145bc2f 100644
--- a/drivers/gpu/drm/arc/Makefile
+++ b/drivers/gpu/drm/arc/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-arcpgu-y := arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
+arcpgu-y := arcpgu_sim.o arcpgu_drv.o
 obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
index cee2448a07d6..7dce0c2313ba 100644
--- a/drivers/gpu/drm/arc/arcpgu.h
+++ b/drivers/gpu/drm/arc/arcpgu.h
@@ -34,7 +34,6 @@ static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
 	return ioread32(arcpgu->regs + reg);
 }
 
-int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
 int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np);
 
 #endif
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index e49e80b8b089..0e959e42893d 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -221,9 +221,15 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	}
 
 	if (encoder_node) {
-		ret = arcpgu_drm_hdmi_init(drm, encoder_node);
-		of_node_put(encoder_node);
-		if (ret < 0)
+		struct drm_bridge *bridge;
+
+		/* Locate drm bridge from the hdmi encoder DT node */
+		bridge = of_drm_find_bridge(encoder_node);
+		if (!bridge)
+			return -EPROBE_DEFER;
+
+		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		if (ret)
 			return ret;
 	} else {
 		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
deleted file mode 100644
index d430af686cbc..000000000000
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ARC PGU DRM driver.
- *
- * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
- */
-
-#include <drm/drm_bridge.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_encoder.h>
-#include <drm/drm_device.h>
-
-#include "arcpgu.h"
-
-int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
-{
-	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-	struct drm_bridge *bridge;
-
-	/* Locate drm bridge from the hdmi encoder DT node */
-	bridge = of_drm_find_bridge(np);
-	if (!bridge)
-		return -EPROBE_DEFER;
-
-	/* Link drm_bridge to encoder */
-	return drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
-}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
