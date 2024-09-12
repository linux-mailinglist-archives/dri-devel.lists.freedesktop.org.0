Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287009764C7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9689A10EB09;
	Thu, 12 Sep 2024 08:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fuwhDaHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54AE10EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 08:45:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-378c16a4d3eso842371f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 01:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726130704; x=1726735504; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iwn1or/bBYSNEeUGyuhOfxUWx3sWzISGdpZDtEwQt38=;
 b=fuwhDaHs0k+ozakwRQPK6uDrkn5J3lst9rQTpNlzT91gBIDSnUxJ1IQfsjPK9SfI99
 3D4fSw34KBEpZqpxRAdEaP3SFjIlDGEDs/9wSJgTZ4DiAqyhuiHolAELYt0mQvCkV8fa
 8dp4LGEDQ0c7TkAw2WeAO0KUJ7+fbCE9qFJbateUwROy/GRxmyj63y5Vcz9yWY6MpMuo
 xWDFSU+4AsWYT8isGHNA98DBiNLan71ZDqD5dUmlxYFEN8xqgo00lPEYRdwjJD9N/9p9
 k33GY1ziH8Pqzqc0Ipe5iUXkwh18t9Dm+WPEUd9FihaOAGuO0AmcqErViUALd0CMd6ok
 /WUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726130704; x=1726735504;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iwn1or/bBYSNEeUGyuhOfxUWx3sWzISGdpZDtEwQt38=;
 b=S6B11dA3XJ6DHKE/uX2gTuyezk9TtVcWJb1mPabHmP1f6V3P5/rW9/YeYzP6F5HPie
 V4XlapNdFROwoWfSLjpzskdrIj8RafncoZ7nBHk0+MXA81ElVT/r+BX4b2C9QvsbRgDe
 Ra4XMop2aogflmDK++LEDC2XIcuzGliT3QvBTI6vw0D+7FOR7iugoOlxIoYm2QJzAzKL
 a1pSR2Sn7aH8UimLravOPyjDlX+BPsTlPQRtPjjI65EFB2/JkSo3n6WihQNcC8Moahrm
 H7vcosgE+Es0nhdp6urdBbjV7opsyPxUWW7dsDp1t/hGx1JNBv1bO6XDnYXyy9k5+U/P
 N6Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLedJqb7l1eE8hEgfkgGdoFJfUtKyOElGS/5vjWgwyVyiO64ANR8teJ3sMq+Jfql82q3jcBdYl4iU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2pAkWY4tffQlgZtHwQtd8+jkA8ohjGTni4fGtx+YN+cx60SdN
 qZSxKMJKjjqhpPUoXCeOinDcalZDB7zOyniLJlbFQklIRdC0WPeZqcEEu1tBc+8=
X-Google-Smtp-Source: AGHT+IE3jIKp1LsMR7cNfJjwontG8p+Vo7dQ6rcRj2YQpKpztKUglDivYbVOWQlxSgzVuxQlXUEEiQ==
X-Received: by 2002:adf:ae51:0:b0:374:c7f8:3d50 with SMTP id
 ffacd0b85a97d-378c2d588d5mr1389741f8f.58.1726130703593; 
 Thu, 12 Sep 2024 01:45:03 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de262sm13712489f8f.112.2024.09.12.01.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 01:45:03 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:44:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Subject: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
Message-ID: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
we do not call cmdq_pkt_create().

During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
is NULL first before calling cmdq_pkt_destroy().  Calling
cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
it will result in a NULL pointer dereference.

Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 175b00e5a253..c15013792583 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -127,9 +127,8 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
-
 	if (mtk_crtc->cmdq_client.chan) {
+		cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
-- 
2.45.2

