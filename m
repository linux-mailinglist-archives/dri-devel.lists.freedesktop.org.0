Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196FC123BC5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4476E1A7;
	Wed, 18 Dec 2019 00:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828D46E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:48:28 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b22so155209pls.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDKxrm8qbiseZpINUS2THSIzKVnfxADUHOX9BkwXa5I=;
 b=A+IWB1djfknbsl81FdVJIHvTstwrlQveoEV3ZRtLIqL9M96weAyc/9CS8rLeLoAC5B
 fYlcX0PYn9ysXTaCLi6fk+98S8+ecs/drDbJW970V1yWKMPUN0ZHPrI9h7ShDvGboCEW
 V1JH6bjwiMHOPolwBAXheY8H6YHmYjYR4TtBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDKxrm8qbiseZpINUS2THSIzKVnfxADUHOX9BkwXa5I=;
 b=J9H+vxOD4oUcfGPrMjF/QogJ40n7NMQ7hbp7jNNqVTxXr9FYBBclMGAlr3eIvpyYKt
 5+4ZNzCEdY6R8wTeMF36zzPrY6RPh22B3DfcjE0hargodQR38CByYIFqlJkA+mS4RKt3
 Qfhhjgwj2gOaNz1jPDULJF8VgbV2WS3Ehq33tw3fxoL4k1riQ9Kx3VLaDhEdE8ehdRe+
 84uHscedf7EJ7WL8+4Thq/xvw8xACy3U1H4vH01LeyI18D9yYYLXBcZAXJkUfvpvaFNf
 o++RPE5e1ytcWVzKyPkgibpHrFiwEKvnwBAs85DBiLKLJ7u5ubHn0EXcwWc8e8+ruUSB
 uw8A==
X-Gm-Message-State: APjAAAXO+s0Xi/O3nwu2u0rq2a3hYAjGaCLQsmozrZDQgVN+SI1oVa4o
 sCVYK+3LgKM7Q/zUb/6kRmUgMg==
X-Google-Smtp-Source: APXvYqwFC+Om/wChNdc7jcBbpixvq5sZ7+7TyGGtLM++d9zcZ8koIF0v49FeOn3pO25lrUxFDV4l9g==
X-Received: by 2002:a17:902:7e49:: with SMTP id
 a9mr1023302pln.230.1576630108115; 
 Tue, 17 Dec 2019 16:48:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:48:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/9] drm/bridge: ti-sn65dsi86: zero is never greater than
 an unsigned int
Date: Tue, 17 Dec 2019 16:47:34 -0800
Message-Id: <20191217164702.v2.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218004741.102067-1-dianders@chromium.org>
References: <20191218004741.102067-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
start at index 0 which always contains the value 0.  0 is not a valid
link rate.

This change should have no real effect but is a small cleanup.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2fb9370a76e6..7b596af265e4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
-	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
+	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
