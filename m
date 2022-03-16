Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147054DC211
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882B610E406;
	Thu, 17 Mar 2022 08:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C9710E5DC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:58:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a1so1718536wrh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 06:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s6m9aC6ErC5jFLU7fXW7B9m4H4WVAslUM1/WFG9oE0=;
 b=VH23sZTxL2r3MDruxIZTnefpHWNhrjNaJ53us5jukGDBXfjJWXUyXgPJJc7jk3XfnP
 ZPjx6gZ1RXhY9vy/Z7ZEL8EMcIR5dDVOUkf0f6fHAAlqa8BQWZXpkx+yWoHan9V6zOp5
 njXNxh9IBuWxtCjkb7ITxZ3FJpFbOO3bmZXieEDrlQROKPR6w016WA+SLLdy+HJlb1dF
 Ars3LA33WTc/JA3YA1lwdZeYtzVSPTuW0Yf5hcjuNssDA4UiO5ZMNvrzr3PqL95xodce
 uZRPv17JpcBC3vlI6wzW2vYtVCGYdi33D4ruZj9Ir4oORVPRhdY4vOTloPnOKcUhiefc
 2A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5s6m9aC6ErC5jFLU7fXW7B9m4H4WVAslUM1/WFG9oE0=;
 b=jLIHax+cM2ftC2B2AYJRKgYtWCNhjXO8vWhJapz4LGF8oLG3iTC0rhe0zX6el3dH0u
 xLJyx9vgzV4Tc+uTalIF96a2JZRPgBAAyTH0IY4go6XQzsNFOXs6CU/gS5wDJGLpYnoV
 XrogPmI18PV41PNeC5yFBdofZBRFJyUvWZumRGhoZOp6rX+jl8wcOrrvYik2atxPQpml
 AnCq9KDf5Qbh1JhY9Zzn6wd6br32fEW+TVwYuCBD7Vy5aTH/fEmUSSZZ1RRExjXKoz/b
 Ixa6H4YmUQzEoviQ23CdAbVRG1beahiAfof3l+MYWiYzb5p4pJtO2PI5gdjY85GYIBaK
 +oiQ==
X-Gm-Message-State: AOAM532pQSmftjk2DBT+5syNcHt/+jFcOzcDjsgeyfAEUo2j9sxQPAWO
 8P9Z6YCKHttX+BRhGOse355taeNV5NnrFA==
X-Google-Smtp-Source: ABdhPJzym5XQB1hTKfyzEYFHEVJAMLUtUJ/4esfiP3VnDDCHuPt8YpDKbwA10sxLnZQlLyrNiSqHvA==
X-Received: by 2002:a5d:43c2:0:b0:1f1:d99c:fafd with SMTP id
 v2-20020a5d43c2000000b001f1d99cfafdmr121188wrr.282.1647439116044; 
 Wed, 16 Mar 2022 06:58:36 -0700 (PDT)
Received: from localhost.localdomain ([37.173.241.155])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b00389a420e1ecsm1790563wmb.37.2022.03.16.06.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 06:58:35 -0700 (PDT)
From: Nicolas Belin <nbelin@baylibre.com>
To: narmstrong@baylibre.com, andrzej.hajda@intel.com, robert.foss@linaro.org
Subject: [PATCH 2/3] drm: bridge: it66121: Fix the register page length
Date: Wed, 16 Mar 2022 14:57:32 +0100
Message-Id: <20220316135733.173950-3-nbelin@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316135733.173950-1-nbelin@baylibre.com>
References: <20220316135733.173950-1-nbelin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 08:58:23 +0000
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
Cc: devicetree@vger.kernel.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the register page length or window length to
0x100 according to the documentation.

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 06b59b422c69..64912b770086 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -227,7 +227,7 @@ static const struct regmap_range_cfg it66121_regmap_banks[] = {
 		.selector_mask = 0x1,
 		.selector_shift = 0,
 		.window_start = 0x00,
-		.window_len = 0x130,
+		.window_len = 0x100,
 	},
 };
 
-- 
2.25.1

