Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7431256E4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45F26EA96;
	Wed, 18 Dec 2019 22:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD226EA91
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:36:03 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g6so1630431plt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZdBHbv1KbWBD0ydUcLXq95xbY+p66To63fda6TeXofs=;
 b=Q9izL8btuLKtuvUbIugM5JtXfmpyu3qOFAHbEl3yi+88bL9FBosfrMrtrEzNf++oS5
 1lpJrmKntXVA3Rsa8nUBigG8oci8QJWbAa3KojUvhyqXlXyAuLOAhcpksTZUsU65CPRw
 tP2ayUL11pTyceW20Q/y+GiqFcrkc/h3bFNiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZdBHbv1KbWBD0ydUcLXq95xbY+p66To63fda6TeXofs=;
 b=sO4o8NgET4uigDcRfokcWuwzX8XV0V8SHgKcr9tJZHEOJPRQDuD4JyZTlG6Fls5rvy
 70zexxVGru1NRtttCnhsY4rXJQucBVBmgz79Jh2+oRRu3+r+rkeiwJ7gR6lsvwm7Gmiz
 CzBEnhULqL+HsJ6PetoSx5WWn/RwDlESed61K4dD1dOLDvwhoJa46H8BUC06djjUVIHn
 9T+vhxc4hI7vLPWqYF5/o+IjmFyrlE2EVDpaCh1iT/4aGNSgRJtbMDcGC+Gozjnouh2t
 AjReZyCuvBqaTo2XQZTpTqNa9i4tFkZtOzFJqPb6IkyeZbAQf5VZ7/g4rVG07bzB6xyk
 tb8Q==
X-Gm-Message-State: APjAAAWN9bfWiy5htuf/Zf2BmUuND0iNI8N66I8BZuoOsLt+0OUFzabN
 wFDXkOfhX1QCTC/BGnz+BQzGTA==
X-Google-Smtp-Source: APXvYqx9Vi6jPcVEqKxW6kRx5VHpTZUcR6ljdGgYUIRKUwwMJal8uYHKGXKsCUCG2IHVZ5f1pNghtQ==
X-Received: by 2002:a17:90a:b94b:: with SMTP id
 f11mr5792967pjw.5.1576708563450; 
 Wed, 18 Dec 2019 14:36:03 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:36:02 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 5/9] drm/bridge: ti-sn65dsi86: Read num lanes from the DP
 sink
Date: Wed, 18 Dec 2019 14:35:26 -0800
Message-Id: <20191218143416.v3.5.Idbd0051d0de53f7e9d18a291ea33011c0854fcc6@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218223530.253106-1-dianders@chromium.org>
References: <20191218223530.253106-1-dianders@chromium.org>
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

At least one panel hooked up to the bridge (AUO B116XAK01) only
supports 1 lane of DP.  Let's read this information and stop
hardcoding 4 DP lanes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 +++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index d55d19759796..0fc9e97b2d98 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -313,8 +313,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
 		goto err_dsi_host;
 	}
 
-	/* TODO: setting to 4 lanes always for now */
-	pdata->dp_lanes = 4;
+	/* TODO: setting to 4 MIPI lanes always for now */
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
@@ -511,12 +510,41 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn_bridge *pdata)
 	usleep_range(10000, 10500); /* 10ms delay recommended by spec */
 }
 
+static unsigned int ti_sn_get_max_lanes(struct ti_sn_bridge *pdata)
+{
+	u8 data;
+	int ret;
+
+	ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LANE_COUNT, &data);
+	if (ret != 1) {
+		DRM_DEV_ERROR(pdata->dev,
+			      "Can't read lane count (%d); assuming 4\n", ret);
+		return 4;
+	}
+
+	return data & DP_LANE_COUNT_MASK;
+}
+
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 	unsigned int val;
 	int ret;
 
+	/*
+	 * Run with the maximum number of lanes that the DP sink supports.
+	 *
+	 * Depending use cases, we might want to revisit this later because:
+	 * - It's plausible that someone may have run fewer lines to the
+	 *   sink than the sink actually supports, assuming that the lines
+	 *   will just be driven at a higher rate.
+	 * - The DP spec seems to indicate that it's more important to minimize
+	 *   the number of lanes than the link rate.
+	 *
+	 * If we do revisit, it would be important to measure the power impact.
+	 */
+	pdata->dp_lanes = ti_sn_get_max_lanes(pdata);
+
 	/* DSI_A lane config */
 	val = CHA_DSI_LANES(4 - pdata->dsi->lanes);
 	regmap_update_bits(pdata->regmap, SN_DSI_LANES_REG,
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
