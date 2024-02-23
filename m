Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271B861EE4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E091010ECD3;
	Fri, 23 Feb 2024 21:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="e/WiBS21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3AD10ECD3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 21:24:10 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1d8da50bffaso6029315ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708723449; x=1709328249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0M8Ho4hghHsHT9QadaKTfyu0riwtgTi9mQkpLqOU5Dg=;
 b=e/WiBS21VbMZ0eK7tpXyGntOgLewuiUM6jFJDu+FPfB4+YUIyBVuW6BPXmQG8ywhg5
 9y6FUWu/5CN141ZdobwJBxOWl4N9Mpa6zwF14vf4BMx1rDFeD2y0pE3qY7x5yhNkqxTG
 TMoIjcDLUx1ItWBsATuPBrlkTp+u/f3zhFOZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723449; x=1709328249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0M8Ho4hghHsHT9QadaKTfyu0riwtgTi9mQkpLqOU5Dg=;
 b=j7WetzaW43aXZUDmF/1SFhDK/9/q/fsZvlvlM0emJdHjWko0ltaKdKIwDore+CGF+G
 q2xqfEup/SM16YgZJjqQhuwyxg71adKFR3NVoiQB+hoLk/8wPXr9/M16m1NJ/i0Q4HSu
 svk1g0ygENk9ubo/Ln55nKhqClkdCMxdhZ2uQJaVqXS3JHX8R6kK975Bq1ZLDjS//Cv4
 FtV+/wWP/qM4XbERcYDDGa0ftPMasHSzxvH0+pI2oS5eCUwefc2wkL0GJmCCpTxzBEsO
 7KtlvT+J5q3WeRPYELcumlfY1vD+7QfmscajzGZW058QK7CcPKZUGNz1jXskJyVc2bvT
 /EIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT6GBq4SYBD9ARmirF0EgXhyov70EaD3HYaZahcFmRwSP3R+lHqIM7Y0iDMVtsgSh+WtfWax+dM4V+nneRIT/Sy5oGum88IE6DvIYTG223
X-Gm-Message-State: AOJu0YweS6UHxxqCXhodrQ62RktX/7VNgVshJVYM503W+zXZUo/YZpDN
 GehFX8q4RjCQ3SY3uhKKdrpkAzHcc9mul20x+URRMNFz9VW57YDa1N9AF2jk8Q==
X-Google-Smtp-Source: AGHT+IF/iOCf8G84HtjaG5OPfPAZChzYV76riZA2G3uYSX6UcLKBg0B+sc+slfUuIZE19uyFrsPkxw==
X-Received: by 2002:a17:902:7b87:b0:1d9:a2b1:8693 with SMTP id
 w7-20020a1709027b8700b001d9a2b18693mr1106969pll.23.1708723449437; 
 Fri, 23 Feb 2024 13:24:09 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:8ff9:a089:c05c:9af])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170902d50f00b001db4b3769f6sm11970413plg.280.2024.02.23.13.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 13:24:09 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: Fix a null pointer crash in
 mtk_drm_crtc_finish_page_flip
Date: Fri, 23 Feb 2024 13:23:29 -0800
Message-ID: <20240223212404.3709690-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
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

It's possible that mtk_crtc->event is NULL in
mtk_drm_crtc_finish_page_flip().

pending_needs_vblank value is set by mtk_crtc->event, but in
mtk_drm_crtc_atomic_flush(), it's is not guarded by the same
lock in mtk_drm_finish_page_flip(), thus a race condition happens.

Consider the following case:

CPU1                              CPU2
step 1:
mtk_drm_crtc_atomic_begin()
mtk_crtc->event is not null,
                                  step 1:
                                  mtk_drm_crtc_atomic_flush:
                                  mtk_drm_crtc_update_config(
                                      !!mtk_crtc->event)
step 2:
mtk_crtc_ddp_irq ->
mtk_drm_finish_page_flip:
lock
mtk_crtc->event set to null,
pending_needs_vblank set to false
unlock
                                  pending_needs_vblank set to true,

                                  step 2:
                                  mtk_crtc_ddp_irq ->
                                  mtk_drm_finish_page_flip called again,
                                  pending_needs_vblank is still true
                                  //null pointer

Instead of guarding the entire mtk_drm_crtc_atomic_flush(), it's more
efficient to just check if mtk_crtc->event is null before use.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index db43f9dff912..d645b85f9721 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -95,11 +95,13 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	unsigned long flags;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
-	drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
-	drm_crtc_vblank_put(crtc);
-	mtk_crtc->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	if (mtk_crtc->event) {
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
+		drm_crtc_vblank_put(crtc);
+		mtk_crtc->event = NULL;
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	}
 }
 
 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
-- 
2.44.0.rc0.258.g7320e95886-goog

