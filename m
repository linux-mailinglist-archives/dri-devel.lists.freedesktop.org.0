Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3AA661400
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9910E1E6;
	Sun,  8 Jan 2023 07:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25BA10E1E9
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bf43so8322034lfb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
 b=v/2A/vsPTdvTXFTL9E1LDjO2javxBUlV9/K3Sa0JIx59p8B8nNxPjKyp0ZdtFR+6ZI
 LL9fFgsxSQJKFgPcqoKoyNEyh9yMfRlYlOgeAokxk5DsI/TvmuLiPuFzFvexSWjTkF++
 MqRVOObJ+UngpE1SYh+si1nH99yyFJd5yuWyvws6YRPn+Q6H2mmXazwJDZ8pj68Bm+Wi
 QgqpIA548qVs5kCrUttLcrU+iWzt6wDxAjO1rXU2weybeRkgzs+huz36U3PVM76IASG2
 dYDN2kR9Nx3gv9ZRX0w161Pwj6ydVCh9fCtsRmICE0N269uZsqRG7Hakj8tyFR8dEo6U
 TGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
 b=RySLZI0GQ0rh/PZrAtrJ+hzEbzh5+5lVDGsXK0n+HM72rEZrQjO4tmumdq2tNpRHBy
 JU85COVfu2bOCa5zsbRGRVYC5HKQza8VSDIwGLT7Xe/AlLLeYB/F5dU+9DHLzOrOVkF1
 aSnMLCo/wv1XyE4jGBuLvOGEyMnLhKOzh7Q16rccoTuOLqslqnGSkUs845ji+JmWYHoL
 sfnujjI9LKP4cSJ7EntWGuE2UW6Hr+GX4akgtINCMf/XpubCt64kTYbQ4rJF71mmcPj6
 7P0yXmgMG1OgLYFUy8Qt+BGNGXX6723LgXRDKNRguxd2rON8miJioOoJbKCDnf7cqVLp
 zFwA==
X-Gm-Message-State: AFqh2kruHOUlGfM7dI1SD/ywPMJAiiCmfgR9sOS+EEJ8WSZPQcXLooMC
 g63bLNQlRLznkHzgT7yq5DJY1A==
X-Google-Smtp-Source: AMrXdXsUaIRp+krvPZdiEhnnERxhfp64SsIlVF989J4YcXQCFu4PObfZBjCXQ0+OyVrRFwtxkH84gQ==
X-Received: by 2002:a05:6512:3c2:b0:4cc:5e3a:dd82 with SMTP id
 w2-20020a05651203c200b004cc5e3add82mr2751180lfp.58.1673162763449; 
 Sat, 07 Jan 2023 23:26:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:26:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 10/12] drm/bridge: lt9611: simplify video timings programming
Date: Sun,  8 Jan 2023 09:25:53 +0200
Message-Id: <20230108072555.2905260-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inline calculated values to simplify the calculation in
lt9611_mipi_video_setup().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7f9be74acf0d..1396ab081f61 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -155,12 +155,12 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 	hactive = mode->hdisplay;
 	hsync_len = mode->hsync_end - mode->hsync_start;
 	hfront_porch = mode->hsync_start - mode->hdisplay;
-	hsync_porch = hsync_len + mode->htotal - mode->hsync_end;
+	hsync_porch = mode->htotal - mode->hsync_start;
 
 	vactive = mode->vdisplay;
 	vsync_len = mode->vsync_end - mode->vsync_start;
 	vfront_porch = mode->vsync_start - mode->vdisplay;
-	vsync_porch = vsync_len + mode->vtotal - mode->vsync_end;
+	vsync_porch = mode->vtotal - mode->vsync_start;
 
 	regmap_write(lt9611->regmap, 0x830d, (u8)(v_total / 256));
 	regmap_write(lt9611->regmap, 0x830e, (u8)(v_total % 256));
-- 
2.39.0

