Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9CC757429
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 08:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE1710E097;
	Tue, 18 Jul 2023 06:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0E610E097
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:29:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82d9cso48604095e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689661757; x=1692253757; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WAeQ4NbbgGFcD9JBeX4FN3v1hTlLMoB8w+Nqk5+LPgc=;
 b=oXYdl1zeFawWhaCKCD55sg0CO8eoGAlf2XrJ4xXa7co+QihGkf1be5/MvFCYYngI9y
 XnF2+gY4yBfTmjwFRlgH7IN/EX515PHyvhMVWQX1LYAfizcJ5PM1+LhzAPam8cdabBjU
 ZeOLfzWH8dafKL5Laau/Yz9ZdIyAtW3QYSSafMgdSlQJv5Wmny53ow+YW7ND+bNoBNBH
 atx+t65K6KtM4l/LVRQBmYBqAiG3saFyzvxdN0oQBKO9VkoGSlHkvAOiFjbsQyFo2xIp
 lkajyAmXSqpYwJLGmjESW/FP2vdfpvDlRD3z6YwxiM9/Cc+OP+jFyhRKtw7iockhWp/E
 IpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689661757; x=1692253757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAeQ4NbbgGFcD9JBeX4FN3v1hTlLMoB8w+Nqk5+LPgc=;
 b=gsjEUNyNt4iQGWBw6ANKphw+LJF8vNCB/vq0Bk7MmQhzSPneHj2VfQ1yKKjO+HIqkk
 z5635Z6LEHOWKatIG0QTkMPAy7kirq1VOIn1Ejsy5OLj57fcEoUTjrmRP7Wh/Vzgql/3
 Td+La0m6sMUOcR2kylmjC63vrTAfGlLkCLm/siZCIOoYIo1v3EAUHZBY+HSZisCoG1Kg
 0OjmYwcOMXSdsgLhW5NLm+QmSx2EtaVOdGFsErJ6VNRQG9yfAcl16F/PgkIQBS8xHVX9
 DV6wy2XwTldr2dGUqwlfjBD4YqEYKz9vz1GOE3dmktH2KLgFO5j8QvAQGviA5GtEc8Wr
 LW1Q==
X-Gm-Message-State: ABy/qLaWEMzwSHR6nl8A6rnS2SayfyR+QicS73DNeEe1qOZhxP0Cq7EH
 OhlQJ25zwZKz0Gql8yJRxcLu+w==
X-Google-Smtp-Source: APBJJlEPLcwDYofG6fDLbjqHRa7a8NK49KAn6Exd15b3+OITzR2XGhiWxrfcRQGOTX0sSrk4er0z+Q==
X-Received: by 2002:a5d:46c9:0:b0:314:14ea:e2db with SMTP id
 g9-20020a5d46c9000000b0031414eae2dbmr10077513wrs.0.1689661756708; 
 Mon, 17 Jul 2023 23:29:16 -0700 (PDT)
Received: from neptune.lan ([188.27.131.236]) by smtp.gmail.com with ESMTPSA id
 v12-20020adfedcc000000b00314315071bbsm1383651wro.38.2023.07.17.23.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 23:29:16 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH V2] drm: adv7511: Fix low refresh rate register for ADV7533/5
Date: Tue, 18 Jul 2023 09:28:54 +0300
Message-ID: <20230718062854.29875-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20190716131005.761-1-bogdan.togorean@analog.com>
References: <20190716131005.761-1-bogdan.togorean@analog.com>
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
Cc: neil.armstrong@linaro.org, architt@codeaurora.org, rfoss@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se, nuno.sa@analog.com,
 bogdan.togorean@analog.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bogdan Togorean <bogdan.togorean@analog.com>

For ADV7533 and ADV7535 low refresh rate is selected using
bits [3:2] of 0x4a main register.
So depending on ADV model write 0xfb or 0x4a register.

Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533")
Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---

Changelog v1 -> v2:
* https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorean@analog.com/
* added Fixes: tag
* added Reviewed-by: tag for Nuno

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index ddceafa7b637..09290a377957 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
 
-	regmap_update_bits(adv7511->regmap, 0xfb,
-		0x6, low_refresh_rate << 1);
+	if (adv7511->type == ADV7511)
+		regmap_update_bits(adv7511->regmap, 0xfb,
+			0x6, low_refresh_rate << 1);
+	else
+		regmap_update_bits(adv7511->regmap, 0x4a,
+			0xc, low_refresh_rate << 2);
+
 	regmap_update_bits(adv7511->regmap, 0x17,
 		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
 
-- 
2.41.0

