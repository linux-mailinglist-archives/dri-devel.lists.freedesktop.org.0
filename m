Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380CADE4F7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 09:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046610E1D2;
	Wed, 18 Jun 2025 07:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="ihC9xD2Y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xnUmmzXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0391910E796;
 Wed, 18 Jun 2025 07:54:00 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1750233232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ea8FKYQ5V9ExQA/zTt267Zd86SEpISgQvnKJKRVI550=;
 b=ihC9xD2YnV/u3tQk3G9UxLCeNQZZI9UEWueLGrqzdz4a+Fo+ibeY0I6tXh8ISteNqGuTnp
 d5f6rk9g3WLLeB0ZLU6/jm0CFVPFYmkIvkNZ8vm9aV9fp3iCCCRDIftIeI4t+03iLAJmrp
 JzWUziFhICj6JWcxKgnpccxPeFhJNjLgQm34E1Abh+LN45pMjaRcZ3txY9az2S90ideB72
 dYf3OgidbX4I06BPmCnZtE1Ra3Q2YzIs8wX6rL3aHP4+bc4yofrpt2KjXihDeWqbAFsjn2
 R33eRfu+NgjKjJbeCENctYbhbSHh+vuRwwXTj7xxv8p6T9iAMir3+IKWDAWbuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1750233232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ea8FKYQ5V9ExQA/zTt267Zd86SEpISgQvnKJKRVI550=;
 b=xnUmmzXVhHriwZoRSoBFDkHECYYOaT9HlTRjdtzDIh7/w7nYBZZqGX6gxdbZc6NkrndBzU
 Bx48dXmlRpD2s1CA==
Date: Wed, 18 Jun 2025 09:52:20 +0200
Subject: [PATCH 1/3] drm/bridge: samsung-dsim: Don't use %pK through printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=1738;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sxPniixtv78HeENSdQLWPrFdDqTbAf0XLGgHM3Oyj5Y=;
 b=RmDVzVHrOK1/SRUIDkyh36blgd1I1AzXaNihza4YNvCLRnV1ypxUVsnr+7ZnFeqfJyKQjBlaR
 swO4I8KwM5eAqqFfdOZbGNwyvmlyZBFYBpQxTDAHDI02JzdhKDJuzIY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
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

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..bccc88d2594840647d7107c13d69104912087384 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1095,7 +1095,7 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 	bool first = !xfer->tx_done;
 	u32 reg;
 
-	dev_dbg(dev, "< xfer %pK: tx len %u, done %u, rx len %u, done %u\n",
+	dev_dbg(dev, "< xfer %p: tx len %u, done %u, rx len %u, done %u\n",
 		xfer, length, xfer->tx_done, xfer->rx_len, xfer->rx_done);
 
 	if (length > DSI_TX_FIFO_SIZE)
@@ -1293,7 +1293,7 @@ static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 
 	dev_dbg(dsi->dev,
-		"> xfer %pK, tx_len %zu, tx_done %u, rx_len %u, rx_done %u\n",
+		"> xfer %p, tx_len %zu, tx_done %u, rx_len %u, rx_done %u\n",
 		xfer, xfer->packet.payload_length, xfer->tx_done, xfer->rx_len,
 		xfer->rx_done);
 

-- 
2.49.0

