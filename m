Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BEC8A8116
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 12:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47A310F555;
	Wed, 17 Apr 2024 10:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="M9+wRRXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7CE10F555
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 10:38:31 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-57013379e17so3957222a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713350309; x=1713955109;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wGPAZakFv3tW+couZM/Hz58bGfETU82f69mf8+8G4OQ=;
 b=M9+wRRXkmkZWVJoBN0brqi2jlpeZ7W7uWs6LkEkIUZW4YM3nGjYftBngsc3haZLiS5
 qdyiE9HFSqsLlVKTy1NwySmWzy3+CZiPzLGy8ZNH8NpYnZnyWTPtGqvpOE1tsGUdWxL2
 WBltZDks59uchmKuFF080OgOWNKxSVwKDS4po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713350309; x=1713955109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGPAZakFv3tW+couZM/Hz58bGfETU82f69mf8+8G4OQ=;
 b=qbg6N/CzgIsgunLUlSlb/KwOpy9BabKPvasUaaO4S907NfkC1Peb0vVN2nu4p8sz5z
 DsSinBl4t9M23KDCvq5UmFaMiC4io55Ax343XKDIfT78C8BSqNWzoZBwiwoXmQKRH6It
 MVE6aW1SHyJh6yIU/D/YOR4nqfpZ6094Q26EDFr0Aw0N/R+Zq/cAL+pbYIJxaktniaG4
 OT5W8atsBN6WnX3Rc5eE/DiIA/gMKqlykzkuKyjz3np4x9HdYEujTsMiWddv3XN/8jkH
 wJQelciB4iPlCET+NJITz1+ZJ3dQvHdqQutkBPjBW9bUOwePbhFIJRys9dClXEZQUV5s
 GxxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTijnJLzoB630SlmOR54ug9akSLyolvFw2kHhHBQ8x1xvyicD1ypbEejy76InSEl4Zh5RcGyXbl7HWNpy/ItXWvXD6xB/qaob4WX4lClo0
X-Gm-Message-State: AOJu0Yw2RLzfxnHOkdJfYoi1/hVJMtKhsto5bfp+Kr5YrTEGVdAaZjY1
 oJggAzlttlQFb7X1woG4pyA8zdvbskZWcqwb6fqqbXPB4tzFQhKwUjgu29rm0w==
X-Google-Smtp-Source: AGHT+IFVcPG0J5A4OYw4wVn0Z7fkAtpovNHvVRNRPx9roE8nRmfmY11gcOt1EWpA8oZzc73jAWSbAg==
X-Received: by 2002:a17:907:928b:b0:a52:54d5:7915 with SMTP id
 bw11-20020a170907928b00b00a5254d57915mr9533946ejc.74.1713350309663; 
 Wed, 17 Apr 2024 03:38:29 -0700 (PDT)
Received: from orzel7.c.googlers.com.com
 (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
 by smtp.gmail.com with ESMTPSA id
 gf14-20020a170906e20e00b00a51e6222200sm7989488ejb.156.2024.04.17.03.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:38:29 -0700 (PDT)
From: Wojciech Macek <wmacek@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Date: Wed, 17 Apr 2024 10:38:19 +0000
Message-ID: <20240417103819.990512-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
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

In case there is no DP device attached to the port the
transfer function should return IO error, similar to what
other drivers do.
In case EAGAIN is returned then any read from /dev/drm_dp_aux
device ends up in an infinite loop as the upper layers
constantly repeats the transfer request.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
Changelog v2-v1:
 - added "Fixes" tag
 - corrected e-mail address

V1: https://patchwork.kernel.org/project/linux-mediatek/patch/20240402071113.3135903-1-wmacek@chromium.org/
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 0ba72102636a..536366956447 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2104,7 +2104,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 
 	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP &&
 	    !mtk_dp->train_info.cable_plugged_in) {
-		ret = -EAGAIN;
+		ret = -EIO;
 		goto err;
 	}
 
-- 
2.44.0.683.g7961c838ac-goog

