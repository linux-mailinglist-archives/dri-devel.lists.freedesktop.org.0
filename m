Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F88B2906
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABB911A804;
	Thu, 25 Apr 2024 19:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="aUaWGwE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C816411A804
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 19:27:52 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-7ef9036d23fso30859241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 12:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714073271; x=1714678071;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xRfxLogI9T4CmFpA/Ru6xajlEXu5NliZz/2sLYlz8bo=;
 b=aUaWGwE+pvFrynf48QieieS1pORQEC+U1QQbtTNdqeIUUSOjIOuF1/aVmy234SPWGn
 vfej+TNd+It44gbga7qFTX66NJCLs5car0zPuIfqL+8ZqnLr8oLGPEJqCUuxt2X73TEE
 SnsUHuM+hbUSj8ZjXT2fuIHEvVrCbZLtuYBwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714073271; x=1714678071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xRfxLogI9T4CmFpA/Ru6xajlEXu5NliZz/2sLYlz8bo=;
 b=sRubWbprMxsqEnl92KAdl7eq5/XNlD84A+B5/3O/j7IACAofXXsrgzalQOzr8BWNqB
 pk3LO7x0u++Exd4pEu1DyYzp7PS7i2W664pGAt/mXfg2BaVP4E01wYZAa9r3z4Lh01CH
 hzKKID41OzLVE5a5vZCC0qFYZJW72ZE0B0mg4nXONuY5KxXD97Lg1zqh8XcamMV7wvl8
 qnInGzr4n94fWcDSPtGhKeAjha7pzwzVzRtaJs5OaDM8xVJz8ujknOK6TA0woO+Kda/Z
 LX4IhdGEYuVvGlBVsXeOHWiI70fSqGy0IItWoWUiE0L40aRFzPaUG2I+lEwpMdANQoip
 Xspw==
X-Gm-Message-State: AOJu0YwpXx9P2EpqU+7vNM6nQ94Sf3pgjtxFRRa1xGQ5jabsc+2ooRvC
 fDC2DX0XIRYgnUaKdLDb+Sam+xXMb1rHB0QE880an7DCxBvQHsaffRlRfjrwuYOjgref4ejYs/Z
 9SYILvOefgSvuzgq86oN+pahFcinD8/v6gkfjlyNxk5QbNdqifK6wTpCHMG7zYBBHAzSvBVI059
 ePtAnrHXoIQe2axi2xo/LkH6Uio21PoaI9dmuJXapg0k74Q4TuIg==
X-Google-Smtp-Source: AGHT+IGiWvcsbM8xXbwuiNnV+4S3QNaR+rkFtqZskbW40nOl8jDdg6Vv+cSiZ7zf6opnHiBk1LVHtA==
X-Received: by 2002:a67:fad2:0:b0:47c:1c1b:59be with SMTP id
 g18-20020a67fad2000000b0047c1c1b59bemr446547vsq.33.1714073271249; 
 Thu, 25 Apr 2024 12:27:51 -0700 (PDT)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a0cf044000000b0069b1e2f3074sm7258689qvl.98.2024.04.25.12.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 12:27:50 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, zdi-disclosures@trendmicro.com,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix invalid reads in fence signaled events
Date: Thu, 25 Apr 2024 15:27:48 -0400
Message-Id: <20240425192748.1761522-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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

Correctly set the length of the drm_event to the size of the structure
that's actually used.

The length of the drm_event was set to the parent structure instead of
to the drm_vmw_event_fence which is supposed to be read. drm_read
uses the length parameter to copy the event to the user space thus
resuling in oob reads.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 8b7de6aa8468 ("vmwgfx: Rework fence event action")
Reported-by: zdi-disclosures@trendmicro.com # ZDI-CAN-23566
Cc: David Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # v3.4+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 2a0cda324703..5efc6a766f64 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -991,7 +991,7 @@ static int vmw_event_fence_action_create(struct drm_file *file_priv,
 	}
 
 	event->event.base.type = DRM_VMW_EVENT_FENCE_SIGNALED;
-	event->event.base.length = sizeof(*event);
+	event->event.base.length = sizeof(event->event);
 	event->event.user_data = user_data;
 
 	ret = drm_event_reserve_init(dev, file_priv, &event->base, &event->event.base);
-- 
2.40.1

