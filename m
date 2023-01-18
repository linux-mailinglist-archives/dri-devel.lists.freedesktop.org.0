Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C067160C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECBF10E6F3;
	Wed, 18 Jan 2023 08:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8366610E6DF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 08:17:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z11so48562004ede.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 00:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKWMWBkiBRp89l37RQ64rpz1WLSSDShciYdrNMM6e18=;
 b=sVIqtz7UvlrtqEpDU+pmxvqmwI1/B0wi02UzxO3FJlR8+mQsX9ZLJ7uUjj5KerlDjG
 osQy343Nal1u8S/ISOWrUjsf2Rwz7V1nzhgH0fHmEcotEPZ4CBgmetRVr8Y6V+Hj18Oz
 NpFUX4hx47xkBaE/SPLRiEwkJ4qEnRN0VH+OzNzwJBugSaGHP+XMmS+Rf80HNI1KKGIG
 bcNukvAsM8RVeHUy8ujxFI1KmE24bkXyBVpFkJn05YF+bISIIBajHKoW7yk13gjlG9pH
 wEfR3FT9wSeGL76QpKdJ6407sICTWYDcP0oWVHyiOXpyGMPSLxV7oKUI0ac1Erk+Klrq
 nPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKWMWBkiBRp89l37RQ64rpz1WLSSDShciYdrNMM6e18=;
 b=vYooFRjqQpY6R2QVMO7MtxTT/VHQEEw8XwJidEwTBq+ztJVcHORu20gGU1wjI02SPq
 8DnZ1W9ipgeoFgcDjntEI2pWVLCDkd5nE2MpwGWW6kU0zi3y+c5tGY0RA2aWIcY0RZJZ
 gyX4MgZaO0+sZCHoLayS76FidK26SE0oRHfesqNXISBQ/+CzmJvNlTLf/Jy2z++hGTVI
 XNsrZ/gS6R+9xE5ola0dw6/2xNCobXPPitHOQPAoTP38kXLr6lA7lHAUM1W/TT96bMOs
 BlUTsuC7vPernhchmFu+27KHbYN7U0Kl/hjNYb9J4ABb4JcVZKqIxOoPQiI/pnRwST6+
 yhkg==
X-Gm-Message-State: AFqh2kpgUWWUBwSQ9kgPVVdKsi+3XFISx9cFyCn7PDLEU0JXcvVk4jid
 8VyG9uyoBxAT/bEJJsEH7oyAOA==
X-Google-Smtp-Source: AMrXdXvLHdymmreFDJFQdXc4WZTlX5SHLKz8w75pA9lqpebRUNjm+Gfu1+LHBnrg+EUkwF3JkvPZ5Q==
X-Received: by 2002:a05:6402:2289:b0:498:f82c:7068 with SMTP id
 cw9-20020a056402228900b00498f82c7068mr5001316edb.35.1674029831043; 
 Wed, 18 Jan 2023 00:17:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:17:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 10/13] drm/bridge: lt9611: simplify video timings programming
Date: Wed, 18 Jan 2023 10:16:55 +0200
Message-Id: <20230118081658.2198520-11-dmitry.baryshkov@linaro.org>
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

Inline calculated values to simplify the calculation in
lt9611_mipi_video_setup().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

