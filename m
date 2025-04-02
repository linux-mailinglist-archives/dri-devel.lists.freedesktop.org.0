Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B5A78FDC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0FE10E7D4;
	Wed,  2 Apr 2025 13:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fc/RSj74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8109C10E7D4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:31:37 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B86A51990;
 Wed,  2 Apr 2025 15:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743600583;
 bh=QpPNCE/E/KWQolKtCOFkofej8djB0ueW3MJ0KSDshcA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fc/RSj74kn2Z3On0haOJO3gvM7cC5TQZ0nxONkvQACRv5I4s04Pa4FdtVks8ZZShg
 w1KfwoWjAjSWz1WOkE1wzHfhSbuvtrmNrdICdrHW4sg6Mp7kK1JSR9Fm9OWCEZrxJF
 ezYHtgZ4QK7wLpjxjoP932DiMQ7Ks4yhkbfkzwLg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:31:00 +0300
Subject: [PATCH v2 18/18] drm/bridge: cdns-dsi: Don't fail on
 MIPI_DSI_MODE_VIDEO_BURST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-18-4a093eaa5e27@ideasonboard.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
In-Reply-To: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=QpPNCE/E/KWQolKtCOFkofej8djB0ueW3MJ0KSDshcA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twh5vAfBQ7KP6xDJ0AYdDCj4qpAPSm4xNsLM
 sdkiIAenmuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08IQAKCRD6PaqMvJYe
 9e0wD/4hTNNGZmT2+7Ef56h6RsvSyeVqQ+ZHg1Afvpmc5Agd9Ul2FJExtTibZ7yjgpO0xllrw2s
 xmTLn7BTXFcXGpmFBM9LIyDBLIz72HGGy1emB5sufTZUtHeqhivMgNMGpESREKbfQ+CBmUyOWkZ
 LaGocgPaO+VQAMW3LCbUEJFVOXt977Xv49fwvVHwmD4Rnx2TzOXAjgPtDbfBtZnDSHgqAsQ5E4s
 zdiwL+NmawGYTkIBUWnOgobGyDZbpJ2IHhZx4pPc5a/udzbpOIPvjFk9lRvpgBs3FOLo4yJcEkm
 14QE+44dS9dwQbZgYnAqgvK/cCyRb3YnhusF9e4YZ5Etds0IgbPutzVyIWZwdxtqHPfCFXUOCgp
 MbxbJpgRF24qM3P08HviR680vB6bezdW05fMdESs8IKqXOziq7tcOzu6WMawyZx3tkQzGjz43q+
 BXWQ6oZdc+Y244AphNtyB4HJSkHSnXd9L9it7o+an+Xnsfw/ZfXC2zycU6UjqDBYPEcBnlbngLM
 VBlhoNhtCijeUibdL2g1Fx+6W21YO5ZsdjTqjz6gRwxY6MLG3aWsvvS1jfDo75CYMQ1YKLZLltS
 ZLjBLR8SJvrZA4m0bakJz3UQ4P71JElxhrJSadd5tL3XEs/FWKcYVRNFZesYjhIbEVS+Snr0Oxd
 04a9Tf/+FQoLsfw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

While the cdns-dsi does not support DSI burst mode, the burst mode is
essentially DSI event mode with more versatile clocking and timings.
Thus cdns-dsi doesn't need to fail if the DSI peripheral driver requests
MIPI_DSI_MODE_VIDEO_BURST.

In my particular use case, this allows the use of ti-sn65dsi83 driver.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 0bb55584cb44..4b77a203b608 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1057,10 +1057,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	if (output->dev)
 		return -EBUSY;
 
-	/* We do not support burst mode yet. */
-	if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
-		return -ENOTSUPP;
-
 	/*
 	 * The host <-> device link might be described using an OF-graph
 	 * representation, in this case we extract the device of_node from

-- 
2.43.0

