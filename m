Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B690FC45
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 07:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7449910E2BA;
	Thu, 20 Jun 2024 05:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HALEckDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D2C10E2BA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 05:47:15 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7062c11d0d1so483456b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 22:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718862435; x=1719467235;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iNzrUnoT89Wnha0OC6N//7pV9rXMk5Grem520gIyQxs=;
 b=HALEckDEiMze97lE7NeTo/4r7OMHOQck/+vTNA2TWshNNWk8g8T9Lbs9y7UWK/gBGC
 Yy8aEwzuonYSOSkC/vR9HZ3IJDvwiksGfDJAIIc4vOazrkkkjU2Ckjts5ECTSBoxFYW9
 fMp/vajHsPJ594hRO5Ukd5FLJ6H/rV9EIaouA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718862435; x=1719467235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iNzrUnoT89Wnha0OC6N//7pV9rXMk5Grem520gIyQxs=;
 b=LZ+/75AARJIXHUPhzpm4cIDg0ugt4lzbeqDJmB7I0RKhUAqMCPCmf2YhLRMxWVmFgN
 v5TH8xcnV95nFkCBEZO9bmffjB+yo56BWUDsDGqp9tUe+NTm6rH4/lO9aRGR/qlM/OdC
 gHbLx0W3cxeNu7BQgvMKvUHztrtDtzyRwtHh0HmBvKmz9jwf5uYKZHYrsgjCSLz5TpoP
 jQ72GC5LBrNiSunXBmuOpHAnVQdD2oh4nIZJrQMUEVUcWwwRi61wyF6lE1eJtRsIicz7
 HdLHClIuLe0VVBk+LIPB3h36Y4wtqHt8JbN2I8LPXOeV9YsG7vxwG7OohhDqFCSUu1wR
 y57w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoAK7KZQ3QqDuoVUnAZ3CdkTwB2klp9Tbbr/5IpWVcPli+VL6pVK7cbrXC2+3L55BHfY1F7Y4hkLCjyduLORGoSEUHYQlR8EayjjA2J9BE
X-Gm-Message-State: AOJu0YyPMkG9UfpEma5rIid+A62jRAbvJ29uR1PGMYbYXq8v7aVdV7hP
 K6T/AyoqvhwnJJ8XODCum41Rb7eiQFXDRubh2s/uvNGQvN+B4R1F/8BAbybIHw==
X-Google-Smtp-Source: AGHT+IE2FF/BSNYYoA5CyxWSZxhSRVn0heb6yaE7ZZyCHXnLwSE/RVFQurgMXOXNAI+BaOP6s+Xb6w==
X-Received: by 2002:a05:6a20:4aa8:b0:1b2:b104:594 with SMTP id
 adf61e73a8af0-1bcbb40df3fmr3758328637.21.1718862435071; 
 Wed, 19 Jun 2024 22:47:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:c53a:5326:7f72:759f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855ee805asm127339535ad.128.2024.06.19.22.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 22:47:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if
 DRM_FBDEV_EMULATION=y
Date: Thu, 20 Jun 2024 13:47:07 +0800
Message-ID: <20240620054708.2230665-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
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

With the recent switch from fbdev-generic to fbdev-dma, the driver now
requires the DRM GEM DMA helpers. This dependency is missing, and will
cause a link failure if fbdev emulation is enabled.

Add the missing dependency.

Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
The commit this patch fixes is in drm-misc-next. Ideally this patch
should be applied on top of it directly.

CK, could you give your ack for it?

 drivers/gpu/drm/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 96cbe020f493..d6449ebae838 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -7,6 +7,7 @@ config DRM_MEDIATEK
 	depends on HAVE_ARM_SMCCC
 	depends on OF
 	depends on MTK_MMSYS
+	select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
-- 
2.45.2.741.gdbec12cfda-goog

