Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876236D6CE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 13:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3402D89718;
	Wed, 28 Apr 2021 11:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAE289718
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 11:51:21 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id md17so5250086pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 04:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ggqrO3Qchc0pj7s94KCNuU19NGYvqjq5lpDMS8H3Tw=;
 b=TaxV56rAxX7DI8UcYkHNfDIiMW39vSkIvG80M/cHa9F8EHu0ZhIDqq5LxQQ++R0zAW
 43N7aA+0N2Xv1Dldc9f0lrCFJqrmb7BzORDlQOiFYljP4an+R1YTCxxTOq6q9qDm+cSS
 5wDplLbbtZhW32jTxiT//mI1RAt2gAJRbDugM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ggqrO3Qchc0pj7s94KCNuU19NGYvqjq5lpDMS8H3Tw=;
 b=uj1iHSJwL8LxyUp4DBaMZk9+oCv8AXEetQ0mKAVEhd8XrzX5H6AIILqyew2NFkjqwy
 vB04m/UgUiMXk61W8xvOsYRXOhZdiX4WFZ828CEI8RDJaI4skHrsfIU2IEQgrm9JG4uu
 61+3R+Vf9PuEnKeS7LR2HJXNoAC1J+am6uHXFGcJk43KCWXTXOPD7wRSqwZKXlGg3oo1
 8S6MYid/0FrLmJDQlRDpmT3ILvL25LwkqwBwNn1UsydbY6iQiEzkAbGXyUbNR0uw+kpu
 ShkkVrKF1MP5z+LYZ4Nkfo99/Hbb7PL6SIpjJSsl3jROwamHhuuFMtHLNGYwj1DHLQEW
 mKxA==
X-Gm-Message-State: AOAM531OQ3pmI4z00yHTnNsPAqStqTIzd/xIuiBq9i0sEcX8KIMDuPFv
 sElicG5ajwL/GLXYyYYxxCXmBA==
X-Google-Smtp-Source: ABdhPJwjgoH7hDN3JydB+39qADl+YpIqlvB7+GbFcirFX78xUnDZJs9piLSTNKYh9oW6oiklSYLooA==
X-Received: by 2002:a17:902:b78b:b029:ed:5429:4c2c with SMTP id
 e11-20020a170902b78bb02900ed54294c2cmr10025560pls.4.1619610681285; 
 Wed, 28 Apr 2021 04:51:21 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1faf:c32e:8742:d913])
 by smtp.gmail.com with ESMTPSA id y8sm2403760pgr.48.2021.04.28.04.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 04:51:20 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] drm/bridge: anx7625: Fix power on delay
Date: Wed, 28 Apr 2021 19:51:16 +0800
Message-Id: <20210428115116.931328-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From anx7625 spec, the delay between powering on power supplies and gpio
should be larger than 10ms.

Fixes: 6c744983004e ("drm/bridge: anx7625: disable regulators when power off")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v1->v2: Extend sleep range a bit as the regulator on some device takes
more time to be powered on after regulator_enable() is called.
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 23283ba0c4f9..b4e349ca38fe 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -893,7 +893,7 @@ static void anx7625_power_on(struct anx7625_data *ctx)
 		usleep_range(2000, 2100);
 	}
 
-	usleep_range(4000, 4100);
+	usleep_range(11000, 12000);
 
 	/* Power on pin enable */
 	gpiod_set_value(ctx->pdata.gpio_p_on, 1);
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
