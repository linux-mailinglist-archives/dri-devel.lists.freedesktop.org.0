Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3426613F5
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2879610E1E9;
	Sun,  8 Jan 2023 07:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D610510E1E5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:25:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g13so8315834lfv.7
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
 b=a5UnEk763WqmfWKkoxukj6ks8ILK+Wpcvx1HEn5Y5xMKa8mtkSAPhJwX0PbNlnZS3p
 0eThhpm1S4Hg9c+WafdX3t9IyxVYTv0PD/wcxooHRW3EMWCgjwukRleH40EJDLdZ8gpX
 Em01O4MvGb71W3wC+S2tdrNKh5PFKcBsk3xugy4nDAnqCz/dmAcJ0KB64cQMDq4P2PQM
 1zDAMCwH0OAbKFgPzlV9Xjs3fPYQo7RUh2RDx2oF3Sc+iIH7QuFtUTzFChxTXo01Edvc
 p9vVIaeQ7VQSeAlu6w1rUofZL5vplKum89+mp8bgU/rGBnP9KxV0Ob0FSz/RgOMHSCPp
 tW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9VtndEU9TW3RLFSiBZfc8etzz7z8EaiINnNdBxR7Gk=;
 b=2CKter2iHrekC1ggNnJmECWEeS+rJcgRiMEfrWy0b9BXjDC3puGDwIgr2AqSdhQDqc
 V7x1TwMEHtl4abfr8q2V6wmjkISMDvuSlxKdm/iME71nIoR+TO2f0KrdIkAv8MaWc7gd
 6qqmliRcGZN+1wLncS6yeHpXwuLHzRg7tuP2QXXwWfJVy0gThhnk5GKs6vNISmzzkIMY
 woA0aHkySBqxy6qgCGSDiSAOHKN0l5BjkjBwnrK+sZf2PYz6x2dip/d6lIALU45l+25e
 H+GUMSfKABGGCozF/3kmZTC+vYNFu+gkpPOgqor006reT0Q0G3yQFXTTgG/NPgDnJPlh
 ebvQ==
X-Gm-Message-State: AFqh2kp4uP+clzZfjo8484ZMBZDaaBxQ7kk2WuGjCX8eZl5mxC0tlLKE
 IuY2w5NpqVm5JJFGE29FY+cB3JraACw9hGZx
X-Google-Smtp-Source: AMrXdXtl2+m/ydzyCQ68iNyzxRo+U3AzUoukAvOI2dgDY+wV5ZcNHzLmyTpCbJ/FvgDcFL3rJOi69Q==
X-Received: by 2002:a05:6512:1111:b0:4cc:7e0e:8d5c with SMTP id
 l17-20020a056512111100b004cc7e0e8d5cmr403922lfg.37.1673162759416; 
 Sat, 07 Jan 2023 23:25:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 04/12] drm/bridge: lt9611: fix programming of video modes
Date: Sun,  8 Jan 2023 09:25:47 +0200
Message-Id: <20230108072555.2905260-5-dmitry.baryshkov@linaro.org>
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

Program the upper part of the hfront_porch into the proper register.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
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

