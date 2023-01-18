Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1AC671606
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2910E6E6;
	Wed, 18 Jan 2023 08:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220B710E184
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so23774803ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+GwFGuHURa9u3Ijog1S5HZ1MuVt0LKqtxKhtevrnGE=;
 b=XXKEc0cdVABrKza8PldX1r7edCiQA5WbeuLkA/B9c9m7BaR/OZz1cu9SPRU0kHnKzv
 p9mh5rgYKh00QfVDDJVp37PjmoqxJYk5C5F71fF5sxwn5BduxoZ4cN9+WWcoC0rwkU/m
 Hmoy9VJ8sssmoME99WxmKtsi6aEQlBW3HvbjAPqW9JSbROOafu3ObpZ5stIY3n92t+ff
 PZ/2c/8aPJjxhdUBLyBY5gf0j2FzaNCz3YnTo+v8rYk6TrFb36hMkpPmSxB1riTpQjxL
 Kwo4pqvwN1UD4Dcm18t6ixonWr3gekmfHHOnWQBlPI4zAq+y7oKoC34WH/1jQyzXsv3m
 BxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+GwFGuHURa9u3Ijog1S5HZ1MuVt0LKqtxKhtevrnGE=;
 b=E+xitrYoHul03d5dDyu4nWHY3gqbJrLJuo/pLh/MivGUCQI9SLrJJ5v9FGmJ082kyn
 t6giNc4yaB6n6I+1cKp3Kabj+VeixYfxHMROg0EJj7k2Ju1PmPwDezvF219xV9ZUZjpZ
 +lEr06Ym4SUtyiXkLzHnEMCioMyx8vjV0WB411JsVpqcjs0Pr8Mk4TppuzPD5SwEhP7g
 1cNoM3Qyw+ODtb5RuxAtnKTF+KOD1BcyGEoGtLq0sctlShLWVJbZB3sb2Tpu2d7OB7FJ
 dG2kkHnSY5/S/v1udLVOXz5vjs7oYtYQksmeHyvkhu9j7qoXFIOYKA9NHGlvARAY4kXN
 u2kw==
X-Gm-Message-State: AFqh2kowavLzONjNB5YUwqt62gbn9qslmBnbElxc5Ly8HLKlOmQN1qop
 2N/ft+yTKpm2V7SEXIfc2VMhZHaojGzMRNqO
X-Google-Smtp-Source: AMrXdXtm2Fvr9sRQuv4VdZo5ULfq0W+0uB2MTEzG3Xm1YqV68IOxq+pDjWfJw5N/BIqqVuJMNXsLlw==
X-Received: by 2002:a17:906:e0c5:b0:86d:67ee:d607 with SMTP id
 gl5-20020a170906e0c500b0086d67eed607mr16081680ejb.64.1674029824691; 
 Wed, 18 Jan 2023 00:17:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 04/13] drm/bridge: lt9611: fix programming of video modes
Date: Wed, 18 Jan 2023 10:16:49 +0200
Message-Id: <20230118081658.2198520-5-dmitry.baryshkov@linaro.org>
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

Program the upper part of the hfront_porch into the proper register.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index deb503ca956a..f377052a45a4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -187,7 +187,8 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 
 	regmap_write(lt9611->regmap, 0x8319, (u8)(hfront_porch % 256));
 
-	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256));
+	regmap_write(lt9611->regmap, 0x831a, (u8)(hsync_porch / 256) |
+						((hfront_porch / 256) << 4));
 	regmap_write(lt9611->regmap, 0x831b, (u8)(hsync_porch % 256));
 }
 
-- 
2.39.0

