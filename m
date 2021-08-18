Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F63F0A06
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992AF6E876;
	Wed, 18 Aug 2021 17:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C5A6E873
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 17:13:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q10so4659967wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=37MLSH9lYPS34IVx5EfZVMr+hGfCcZBIMSeL1QJmzSc=;
 b=PIOS5lfVqZQr2EIMeZA5ubQx6UB/nEqDdg+/fw3aomNSZcT13tMnYoz+UIqXBDb6hq
 LbjTjXYx9ei9CZ8QrgFcEPWwOCqQ3XtbtRBUdQippNZGFaTaiaKYECYt17KNOPsa68+S
 gxHxVI4lvJ95gY382yCB32K4aidQiVFAiYsbXsMajVYG23sN7gBFlTqgd8jhGyOUdLOr
 hi2R8zoeWiTFrxtNgMcs6x9eatE2RgySYXH58fGdKep1g1vJ00d6l9dXimjCNfFD2uWz
 h0CUUdmtIUsahSWQhSAUJmuB/Wq7GsujSUEYNvkCLzJgCTvTQgOxVrfxPQTx4RUvmMim
 kM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37MLSH9lYPS34IVx5EfZVMr+hGfCcZBIMSeL1QJmzSc=;
 b=PvzyhMQchYfwe65w70P0hQJ9C0SUDSCAbJKFLA6X4KDfJv8YWHue2WWUO/1hBRnFHv
 n5N6yuSl7GVx1b0vU/vYHJJIA9hGgwURvxfh/r7+TtP6ozzD9NasWuSmxSJXqvbxy1q/
 wXDl2EvD1qIv2rUg4Dz6jBWUf+MTmMHxjx2cMAsb+63WjHoWUJb+qts/rPgHolzU2Fvz
 GLd9LaS3maDDjtb4XloQ3jc40wTfjV16ArcSYTEyqQV/QPAKSZbd9opxw3yDY6LKTYs8
 Cddu1SHDktyVOCDM4R1EZ6mzP4HyciIYHshy/Yeu98IC9yXMZaiXjoFZ9rt9dKlq+X3x
 J11A==
X-Gm-Message-State: AOAM533OSjP+JGSg1y8PoiEVfRK5bxf3XIJURlgiXcBTfaP2tTodOe/n
 OSVXyQ+b0UvN5ad6lgdSTf93YQ==
X-Google-Smtp-Source: ABdhPJzsxd2Ntx4OU+VAYF773vl3++r8bqpD7vwRrNjiKzzNW5kM0njmz+jfbvPKwMDL77r0yEXqYg==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr11854422wru.45.1629306806404; 
 Wed, 18 Aug 2021 10:13:26 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:a470:eb9f:53a5:20f8])
 by smtp.gmail.com with ESMTPSA id p3sm414825wrr.21.2021.08.18.10.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 10:13:25 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 xji@analogixsemi.com, pihsun@chromium.org, tzungbi@google.com,
 sam@ravnborg.org, hsinyi@chromium.org, drinkcat@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/bridge: anx7625: Propagate errors from
 sp_tx_edid_read()
Date: Wed, 18 Aug 2021 19:13:18 +0200
Message-Id: <20210818171318.1848272-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818171318.1848272-1-robert.foss@linaro.org>
References: <20210818171318.1848272-1-robert.foss@linaro.org>
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

During the sp_tx_edid_read() call the return value of sp_tx_edid_read()
is ignored, which could cause potential errors to go unhandled.

All errors which are returned by sp_tx_edid_read() are handled in
anx7625_get_edid().

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index ea414cd349b5c..abc8db77bfd36 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -845,8 +845,11 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 				if (g_edid_break == 1)
 					break;
 
-				segments_edid_read(ctx, count / 2,
-						   pblock_buf, offset);
+				ret = segments_edid_read(ctx, count / 2,
+							 pblock_buf, offset);
+				if (ret < 0)
+					return ret;
+
 				memcpy(&pedid_blocks_buf[edid_pos],
 				       pblock_buf,
 				       MAX_DPCD_BUFFER_SIZE);
@@ -863,8 +866,11 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 				if (g_edid_break == 1)
 					break;
 
-				segments_edid_read(ctx, count / 2,
-						   pblock_buf, offset);
+				ret = segments_edid_read(ctx, count / 2,
+							 pblock_buf, offset);
+				if (ret < 0)
+					return ret;
+
 				memcpy(&pedid_blocks_buf[edid_pos],
 				       pblock_buf,
 				       MAX_DPCD_BUFFER_SIZE);
-- 
2.30.2

