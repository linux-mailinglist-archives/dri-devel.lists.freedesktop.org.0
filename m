Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4736894D19
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBC810FB22;
	Tue,  2 Apr 2024 08:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HryEj9N+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FC910FABE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 07:11:21 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-56c1a65275bso2364196a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712041879; x=1712646679;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnIWTbeR2GXQXE2WKV9Ap/wvI2y5jKr9SDTIrGO5fgY=;
 b=HryEj9N+u0f12HyX7xWSDSeC5eCUEnaaadRBzzv60KyYwHtcz02CMelLo/fGFWvTf7
 8D4QfuNBinQQilP9Lt6JVEtqqIERRF9zAWWVDI6ODAqohv/7EJ49oVaWWLPXAMvIN5Nh
 I+l4ZhTJM6KMj5JkZbnOzL7xG8M0VgsriSI54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712041879; x=1712646679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZnIWTbeR2GXQXE2WKV9Ap/wvI2y5jKr9SDTIrGO5fgY=;
 b=i80choIgrnY6jms/H/xfkp75uREagcbqAQMqOf8yu0UPkUCopl0BKxx8DJyyDFj64W
 0r3pbX4BHqqifPa2MPdy50fCEQcyvvTpzxC/lc7kb0m+5RRu3NUDcJgj8DEYrB0QDDr6
 lW2nxYV1HtUyomTvWj33wei3Mk++UeNRZC8kwMPgWZUtw2iTi1VPUpqxmOGE1NoEwBnZ
 jKWBL1egK+jrn/YZuK/EgQoCNylkyXLQyH/ha2y1i9e6uqWkLhY5hnoPSHClKjt03tiI
 xalTAewmLUIl1vUoecmwnC9AWb3WqbBu7/8SZQGhHzw/QBz0AU1znxrpMw/HwEb79d+1
 XOew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLdNLpdTnJ7cIf2e7C8+7ZDckE1+fy+m12e4fPSRpVUHJcTwq7AUTSmMLPuvgVZzbwxuPubH3Zd9/IQ5C+BfwpX41/KlphOj7KtS3O7F5C
X-Gm-Message-State: AOJu0YyLS8/XMrSQHQJNSFc2C4nihKawoZMGaAUsYyAK3dxSFEXz81lj
 2VM89Rokadc7m0HG1+ZZZezDeWzpJhKRde4Q75mGsN5TFs+6Dm/33Y4j+192ZA==
X-Google-Smtp-Source: AGHT+IGUOjA6NKyVT/+ELVqwwCceZpb+FILLMln0YYk0jw8k+fwEMqxkgdfJr/x+JyjJ3SCGlsnvew==
X-Received: by 2002:a50:f603:0:b0:56d:e947:dd52 with SMTP id
 c3-20020a50f603000000b0056de947dd52mr471101edn.26.1712041879594; 
 Tue, 02 Apr 2024 00:11:19 -0700 (PDT)
Received: from orzel7.c.googlers.com.com
 (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
 by smtp.gmail.com with ESMTPSA id
 g28-20020a056402321c00b0056c1c2b851esm6395171eda.0.2024.04.02.00.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 00:11:19 -0700 (PDT)
From: Wojciech Macek <wmacek@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
Cc: Wojciech Macek <wmacek@chromium.com>
Subject: [PATCH] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Date: Tue,  2 Apr 2024 07:11:13 +0000
Message-ID: <20240402071113.3135903-1-wmacek@chromium.org>
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

From: Wojciech Macek <wmacek@chromium.com>

In case there is no DP device attached to the port the
transfer function should return IO error, similar to what
other drivers do.
In case EAGAIN is returned then any read from /dev/drm_dp_aux
device ends up in an infinite loop as the upper layers
constantly repeats the transfer request.

Signed-off-by: Wojciech Macek <wmacek@chromium.com>
---
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
2.44.0.478.gd926399ef9-goog

