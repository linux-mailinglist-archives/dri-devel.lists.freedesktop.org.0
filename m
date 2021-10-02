Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B341FEB7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 01:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3E06E056;
	Sat,  2 Oct 2021 23:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2446E056
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 23:35:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so14709278wmc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spoD37fKZhq9nWDc73nfOEcNDh0BwaXKcCIySwugWQ8=;
 b=mmLYtb2KoUMKk8+MwsYxQCCXPOESRud+F7/b9zaBrQgBCxPnN+zrj9Br+sYXbWq4/t
 6OThqemsPepLbrYf2uz/MAKaTbJdqfLyac6gnj/gklgUqAIF75s6hm7O9p9EbCfqcct6
 McTCZrGCg/hL/ekTVUVPj8IpUQKyMFstlenDNZyXEamQngcwuEvyx5WYdpRVlU+mipzX
 uvT7JZrh4ElL+cMWouQxfFM+n2dTJmgD/mdqNmFJ+XXB2oABCxzUmfClnWzHM88wvmV6
 sqvpGX4oRxKizXmc57fWbalNNjnX7qEjOOqzEIRdLwejHzf+KeqAnWwpHo0jefbjoShT
 IVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spoD37fKZhq9nWDc73nfOEcNDh0BwaXKcCIySwugWQ8=;
 b=x+gTm9BakJAjhgjeUGqwqSQYmUmBvqD6HmiXIVQGK997wAAc4wccjF+PkVBMwjlCcM
 hRH4kvdxIKAccDaEGWdgFmCeZ8PCn15M8z9xAnPXw8ksVs5JLMvzc30pisuKAmMHyqB0
 DPuAcLdmvJPLDAALuvzaEQm89HvDIICPGvhQOGj8wGzQQEsaYI+35DYfHhiyGjdSVBvi
 Gh38v6dXJjPBT5jWeD7ScttRgxpR6rrcEPvjbRCSlDnydtcqIYPe091lTssl/Q/BtU5q
 KIwhBtlcB4uIScXHkZluOMfh3wljvpwtbjEVUGmeu/kS9vp31IWN77810CflZy12VFxL
 uFTw==
X-Gm-Message-State: AOAM533T/vDBDJRlCx2DbYQZE2RdhM74464EocNgr/LZcnzZW8Ress64
 hFmT8PgaQCIU7ybuiwNTrqE=
X-Google-Smtp-Source: ABdhPJxIBvOlgKVU6W1Ekm59JsdBzWRYZkAPcpznApnllg3AdFkUuFyN7P6A8EeeA3ej712DdlbBng==
X-Received: by 2002:a7b:c948:: with SMTP id i8mr11197847wml.193.1633217748627; 
 Sat, 02 Oct 2021 16:35:48 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru.
 [94.29.54.195])
 by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:35:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] drm/bridge: tc358768: Support pulse mode
Date: Sun,  3 Oct 2021 02:34:44 +0300
Message-Id: <20211002233447.1105-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
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

Support pulse-mode synchronization which is supported and used by simple
DSI panels like Panasonic VVX10F004B00.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 66 ++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 18ae6605a803..10ebd0621ad3 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -785,24 +785,54 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	/* START[0] */
 	tc358768_write(priv, TC358768_STARTCNTRL, 1);
 
-	/* Set event mode */
-	tc358768_write(priv, TC358768_DSI_EVENT, 1);
-
-	/* vsw (+ vbp) */
-	tc358768_write(priv, TC358768_DSI_VSW,
-		       mode->vtotal - mode->vsync_start);
-	/* vbp (not used in event mode) */
-	tc358768_write(priv, TC358768_DSI_VBPR, 0);
-	/* vact */
-	tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
-
-	/* (hsw + hbp) * byteclk * ndl / pclk */
-	val = (u32)div_u64((mode->htotal - mode->hsync_start) *
-			   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
-			   mode->clock * 1000);
-	tc358768_write(priv, TC358768_DSI_HSW, val);
-	/* hbp (not used in event mode) */
-	tc358768_write(priv, TC358768_DSI_HBPR, 0);
+	if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		/* Set pulse mode */
+		tc358768_write(priv, TC358768_DSI_EVENT, 0);
+
+		/* vact */
+		tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
+
+		/* vsw */
+		tc358768_write(priv, TC358768_DSI_VSW,
+			       mode->vsync_end - mode->vsync_start);
+		/* vbp */
+		tc358768_write(priv, TC358768_DSI_VBPR,
+			       mode->vtotal - mode->vsync_end);
+
+		/* hsw * byteclk * ndl / pclk */
+		val = (u32)div_u64((mode->hsync_end - mode->hsync_start) *
+				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
+				   mode->clock * 1000);
+		tc358768_write(priv, TC358768_DSI_HSW, val);
+
+		/* hbp * byteclk * ndl / pclk */
+		val = (u32)div_u64((mode->htotal - mode->hsync_end) *
+				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
+				   mode->clock * 1000);
+		tc358768_write(priv, TC358768_DSI_HBPR, val);
+	} else {
+		/* Set event mode */
+		tc358768_write(priv, TC358768_DSI_EVENT, 1);
+
+		/* vact */
+		tc358768_write(priv, TC358768_DSI_VACT, mode->vdisplay);
+
+		/* vsw (+ vbp) */
+		tc358768_write(priv, TC358768_DSI_VSW,
+			       mode->vtotal - mode->vsync_start);
+		/* vbp (not used in event mode) */
+		tc358768_write(priv, TC358768_DSI_VBPR, 0);
+
+		/* (hsw + hbp) * byteclk * ndl / pclk */
+		val = (u32)div_u64((mode->htotal - mode->hsync_start) *
+				   ((u64)priv->dsiclk / 4) * priv->dsi_lanes,
+				   mode->clock * 1000);
+		tc358768_write(priv, TC358768_DSI_HSW, val);
+
+		/* hbp (not used in event mode) */
+		tc358768_write(priv, TC358768_DSI_HBPR, 0);
+	}
+
 	/* hact (bytes) */
 	tc358768_write(priv, TC358768_DSI_HACT, hact);
 
-- 
2.32.0

