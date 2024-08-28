Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188C4962488
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 12:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8661710E03C;
	Wed, 28 Aug 2024 10:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PPiiVZ6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1806410E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 10:16:04 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-201d5af11a4so58486545ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724840163; x=1725444963;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l6EEmhk9Y5reOAFsAV+HEJlc3gS52f19SksxotmeIlc=;
 b=PPiiVZ6wi//UdyKAMS8tH1hop+rKimbacWjkGlQGX9YNFxQDUhZy6KILcHr4bKJWzY
 n3AP719eEJWOJvMxS0uwy84xRf8UQHnzm/ZYfCoIeKzK8HFo08c9l+7LR9o2rLOFGelk
 wL/HAUX14tpLB+ph8o58xilC+6P7eB5Zj+NN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724840163; x=1725444963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6EEmhk9Y5reOAFsAV+HEJlc3gS52f19SksxotmeIlc=;
 b=QRCHp8AqKYsiVRKB595WW6Q/oXmLKPeAKxYENA0SrqdrqgM6/Dv8irBLI+puqbBEfQ
 KXwmoqKsevnojo3HVxBCljvBJFGPBuUJlXuc7JM7iIkMzGiMlBT/ZUorcmbjWaCON8nl
 M8VLJ4q1j2j0GGg/NfGqtC9JEbxNVnSXalQ8w+nEROcp42vlg3UrBKf5y4+ltZ3PCIuU
 q22AWh7TxuDKiyMfWCqPzZbZjgKPsiJ0wxhOi3cpg3H0EUGeBRu8j5vT77r1MqOubL3h
 Q1iR2yEJa/mCE+QF7oMntKol/6sqAHKDJeht2JE87KO03d24l/UZH2WXW8rjWGPQWEWt
 mtJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrhG0c4gFp6zdtnrC1AU2B+rdB1hbbl3ZWRF8pBUqxx/dh7XsOSzbPmcTS/BXwzOWQW5WYE2SKOjg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycxNQDPxBGiJvgppE9WZAW3c4GLMHQGOiXZJrG29YmQwiS/0hZ
 M5XQo/SxRfvS+sH+xxlDTJYfhtPUbH8Fvx4DT6xUyIRgKh3cHT82omzw4ldpDg==
X-Google-Smtp-Source: AGHT+IGtCtgGflkPLcIWz63EIUUuX6MMYmWQAYa+kWCCehY2yI9ZV21P39BGDfxsdsq/CdkR0IzgFA==
X-Received: by 2002:a17:902:fa88:b0:202:100f:7b99 with SMTP id
 d9443c01a7336-204f9b7f065mr15103095ad.22.1724840163370; 
 Wed, 28 Aug 2024 03:16:03 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:e0f3:8e32:ef17:cdd9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2038560dfd1sm95645455ad.206.2024.08.28.03.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 03:16:02 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Use spin_lock_irqsave() for CRTC event lock
Date: Wed, 28 Aug 2024 18:14:47 +0800
Message-ID: <20240828101511.3269822-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
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

Use the state-aware spin_lock_irqsave() and spin_unlock_irqrestore()
to avoid unconditionally re-enabling the local interrupts.

Fixes: 411f5c1eacfe ("drm/mediatek: handle events when enabling/disabling crtc")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..42f47086f414 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -449,6 +449,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk_crtc)
 {
 	struct drm_device *drm = mtk_crtc->base.dev;
 	struct drm_crtc *crtc = &mtk_crtc->base;
+	unsigned long flags;
 	int i;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
@@ -480,10 +481,10 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk_crtc)
 	pm_runtime_put(drm->dev);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
 	}
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog

