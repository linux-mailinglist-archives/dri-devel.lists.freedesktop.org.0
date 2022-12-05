Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAE642EE8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E8210E271;
	Mon,  5 Dec 2022 17:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF0910E268
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:33:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u12so18774394wrr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brT86hOry6dm+KHG3KdMkX+2L0L5VyauXhJ+PwKI4nU=;
 b=aXwLbJf6jZaYJXQ3T0Xa8HTHVhWePB55ab4352bibY9MEKOiYUCC7uc7zoSoK01O63
 MyaMFdeeabzeyU8/Z17PhYjUoAh3FQ+NrkQfpe8zdLWqkxfmIA1PTC7mJssfN6gumF2i
 kP67EQxU9q15LkandCtf+tUVe6SRywoV/77ORKhVFhubEuqE9uUy8+Fz/JJrh35xp0vp
 4rOIX83NJME48JgLR2I0a85cEyrewkwuYlSMEovRDL6HtZY9mF1p8E7rSDxwC0CM4gIH
 5B3bQdRHV5xnb9vtC1hgIIrI7p46+hFo4/oosIRrsm7NjOHb11g7xB8OzdYPMn5tsevp
 uNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brT86hOry6dm+KHG3KdMkX+2L0L5VyauXhJ+PwKI4nU=;
 b=iaf98yHJYMS0U9kHIfPgUElOgS2VGi5QE0hFCH0rg6VjT45qXl3sBY4kIgstYnNamW
 ZaT+9UcdbrfZneikBL+iXFbOYz3E2FMx59RHzFsQpJpEiJCjIisPT47J0P/kl48t25fT
 1nJoLRVmp4gszgVO3KG37D9EoUoRe5C89HuqhwFOD77vpG8hpNbo0IiL+b7AFR6mzEmi
 LCPOgWjubq9MY2C8fZ+oI3j6q89Q8ZcCXAyYt45lyVri0qdzQmzFYcZ+cWIPhgaVI5Yb
 rqCoyezJCpZaf062C/nuRz0AtFktIx1pHsftiwHUNtHJWtOlKin2Po6B3xnwX50+1jPR
 5uYQ==
X-Gm-Message-State: ANoB5pm6AyEHXJLrsGfpqfDcRNlw5+QfB9z8/vkxr9PqsU2ht661AaJI
 4vV6tGtXKQl3c8GNidTJ6L2+6w==
X-Google-Smtp-Source: AA0mqf5BsL4qsd3QBPn5wqGw570m5F/bUgIOkqGf2ET6Bli2bEUuk+xV3DIMKnpp5LB2NXv9d1lzpQ==
X-Received: by 2002:adf:fa12:0:b0:242:1c:7507 with SMTP id
 m18-20020adffa12000000b00242001c7507mr31994871wrr.42.1670261627916; 
 Mon, 05 Dec 2022 09:33:47 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002421ed1d8c8sm14524245wrw.103.2022.12.05.09.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 09:33:47 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/6] drm/mediatek: dp: Replace usage of drm_bridge_chain_
 functions
Date: Mon,  5 Dec 2022 17:33:24 +0000
Message-Id: <20221205173328.1395350-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
References: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort
driver") added usage of the drm_bridge_chain_ functions which are
to be deprecated.

Replace with the drm_atomic_bridge_chain_ variants using the
current state.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9d085c05c49c..b4feaabdb6a7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1981,7 +1981,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	struct cea_sad *sads;
 
 	if (!enabled) {
-		drm_bridge_chain_pre_enable(bridge);
+		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
 
 		/* power on aux */
 		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
@@ -2019,7 +2019,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 				   DP_PWR_STATE_BANDGAP_TPLL,
 				   DP_PWR_STATE_MASK);
 
-		drm_bridge_chain_post_disable(bridge);
+		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 	}
 
 	return new_edid;
-- 
2.34.1

