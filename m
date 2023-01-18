Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A8671603
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ADB10E6E5;
	Wed, 18 Jan 2023 08:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E337010E055
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hw16so69428786ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffQ9QQ9cEmbatl2Z6drUHQqKYZ2qTHMnm6bqB742ivs=;
 b=F3zx+o8HIciBkmGlZ+KOd0AIVFAcURL/lkf64wkVSAwBgPm3cGlgJuWYDZEsGvLfwp
 +QGc9hsDxeCVjOCjyOnA9rkbu6uOwNyDpR0rbhT0JvKt9uAMSwbIDKctKCinSov1wv45
 1/D51glaQZp2RT7nlyZpdvV+IMtdRc6FpGTFoynyDdyAjumO4sLqHHjtdTaWs6TQ1Ugv
 yp80S+jU/l5mPKBX5nJbeuhrafJCw73QYYpDbnkpHosQ2VYdPdB/OqZYoR+JKbMasVHT
 LoMOD1MgGrZnG/0YPZFjSQhDeNXOfAljeuKez4cCNXJSDBW7jfMTnuxubSz791yQMiEp
 sbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffQ9QQ9cEmbatl2Z6drUHQqKYZ2qTHMnm6bqB742ivs=;
 b=Y/9ROaThxU/A8foxtBs6cF/7zfh30IRyYjX90yBZPnhoKm+6C4cIcm6ySgoiuARQL3
 XsPbO4z5X0qd9XKdx1VrEKB47ey92jP+jbvquP4S0p8Fz0At6H+G8O2d1jl+WalzgiHo
 QzPj7vGbLWBXGQxhHEP+9EvQzzBHEum+mTzAUr+Bg56/yHc23HLaAH7OuxJM0tnwvneO
 LbqiTwVq5XZTl7u4lO7r4BVZGO7Ryeo31zv/VsRdLqRnFlneDWMLd7dVZtZLTLZDXxey
 LHD5FSfi574h75JodkMf3ry3HwEH6qsWSQ9WxZJ/4I7WCpkJwEnLX9i6pyZsfaIrwDsa
 MfyQ==
X-Gm-Message-State: AFqh2kqxRWiawHWkT4BnbGuHHB8i0c9f09YaH9jHwUN2BEh47+7VUBPg
 HkDftvgZZwmQB3kwE1bjAa+xug==
X-Google-Smtp-Source: AMrXdXtiaZSjxKJh/ME5gKEx7BWuOcQQ8+DqDHHvx22LGspB9fRkBIkiA8kRle0Io+wJBIym3/d0hQ==
X-Received: by 2002:a17:906:230a:b0:86f:5375:9f63 with SMTP id
 l10-20020a170906230a00b0086f53759f63mr5192973eja.39.1674029822451; 
 Wed, 18 Jan 2023 00:17:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/13] drm/bridge: lt9611: fix HPD reenablement
Date: Wed, 18 Jan 2023 10:16:47 +0200
Message-Id: <20230118081658.2198520-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
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

The driver will reset the bridge in the atomic_pre_enable(). However
this will also drop the HPD interrupt state. Instead of resetting the
bridge, properly wake it up. This fixes the HPD interrupt delivery after
the disable/enable cycle.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 2714184cc53f..58f39b279217 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	static const struct reg_sequence reg_cfg[] = {
+		{ 0x8102, 0x12 },
+		{ 0x8123, 0x40 },
+		{ 0x8130, 0xea },
+		{ 0x8011, 0xfa },
+	};
 
 	if (!lt9611->sleep)
 		return;
 
-	lt9611_reset(lt9611);
-	regmap_write(lt9611->regmap, 0x80ee, 0x01);
+	regmap_multi_reg_write(lt9611->regmap,
+			       reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	lt9611->sleep = false;
 }
-- 
2.39.0

