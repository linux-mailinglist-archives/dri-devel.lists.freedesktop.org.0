Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A57892CF2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358910E2D4;
	Sat, 30 Mar 2024 20:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WSnO9cPM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52518989C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:27:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-415482308f8so15890965e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830466; x=1712435266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3gBZRypw7eFJBqOZhPqW7krS5T53iZPLz//P5NJv5yo=;
 b=WSnO9cPME7+2W/ifU3XJOCTha6PD985egx0Epuk01MEdStqzzVZHYX+v6CEMx+aaZg
 6VopdKkiCbNng0dm0X5prIJb23PDsKiXwDPgdcIAj6i+iY1pEVyDSKgN9YnWf5OSVJHo
 RmvReqwPcj+Ya7CyKU4pubMobdxhmQQnAjXTShCUOYqS3vDQS/wHedaFUAIZY/JyggnU
 gtiqby1yeVWQq7pMdQlFbYokWPG6kdjUz2vdoPUOta4zVV251EM9td9wtY1vRk0d2Lg8
 YBwfWLtKt2pyZ8/JKQLMg/acPzRVu2U6bkLV03V6704Qho8IqzBLCNBN1C+jyJavyyIU
 N/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830466; x=1712435266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3gBZRypw7eFJBqOZhPqW7krS5T53iZPLz//P5NJv5yo=;
 b=NvHkPk2A48ZYqRkewulCUS7g+tZ6kjlmZamtPga+dOvrFnv7APtyrX2nbxYktO5OOd
 sDkHU0aHXptKbKGXe9QRHG0DQAz8/Z4B+u+3N1CoD4T66s3TgtxHepkA7cVNTiAR+Hb4
 2zLRDsTwGzxVXmmW61xEOUlbE7lEMXs7CK3sFF7XctNkYMbBHlYgEKJrTd+4Tw2xuPNz
 tXJ3Ku6usQ9N38/s8dtu14OjsCbgeofy0bnFxyY2jNCcc8gTKFXuA/Ld2V3eHtIrLXxI
 pSSZS1WqYhBvHS8wV9iEQ+hdoOlJDXHbyB9ERZvEuN8jWKmaChwrONKLCKzFs1yyQn3X
 wuYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2xhesandIdzLv7iu0f18w/oiFSAgENSaWgiJ8GgHXeRSYTkYvN5hkJ9xZzBT+/jlpRlwOCAycj/d4a8Sqbx1mPPD0WTN+FztAZuEhMCwV
X-Gm-Message-State: AOJu0YzZGTuTyUhr4VejzoHNbvchIUWp27Sf/5RUsMHQaAiAn6pz7bW+
 WoBxHYudG05V2tFQ03KIKGCEwBYuG26H/C1z0Mk5wye5N6Nat3rVf4rmKAjy+8U=
X-Google-Smtp-Source: AGHT+IGiediON0ELikHy/elKnPO4WPe3ex+JoynxDpd5PfqunqrjvyVunhrRIHlUdtSG+VqRmnZhmg==
X-Received: by 2002:a05:600c:1c05:b0:415:456c:a17f with SMTP id
 j5-20020a05600c1c0500b00415456ca17fmr3563275wms.25.1711830465715; 
 Sat, 30 Mar 2024 13:27:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0041409db0349sm9505616wmo.48.2024.03.30.13.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:27:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] drm/bridge: chipone-icn6211: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:27:40 +0100
Message-Id: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Core in mipi_dsi_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 82d23e4df09e..43c1202701ee 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -783,7 +783,6 @@ static struct mipi_dsi_driver chipone_dsi_driver = {
 	.remove = chipone_dsi_remove,
 	.driver = {
 		.name = "chipone-icn6211",
-		.owner = THIS_MODULE,
 		.of_match_table = chipone_of_match,
 	},
 };
-- 
2.34.1

