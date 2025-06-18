Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789CBADE7A1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E6710E7EA;
	Wed, 18 Jun 2025 09:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mSWalhnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBEA10E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:59:55 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AF955288;
 Wed, 18 Jun 2025 11:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750240781;
 bh=B3dq0sEpe5AT9qctfQAR4vjZEu+9Or2HA//TK9hQ9OY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mSWalhnhoqpNSAlK1Vq7C9//mECRuAb86zLq4yBYFkLdZXvhpxf2qhqSY7sbF535e
 rbkDDyp3KgCAhUQdyc410v62EUpsy6gX2bIJO48w4361yvdIdQ9U1FgDiRLru7UFSX
 xdSv/qsNfXypLd2d1RCUJ/BJtZWDXgickQuaeZ9g=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:20 +0300
Subject: [PATCH v4 17/17] drm/bridge: cdns-dsi: Don't fail on
 MIPI_DSI_MODE_VIDEO_BURST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-17-862c841dbe02@ideasonboard.com>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
In-Reply-To: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=B3dq0sEpe5AT9qctfQAR4vjZEu+9Or2HA//TK9hQ9OY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo4Cm9WSHu5ul0FLGjPBlHGU7cspWgy2eAURb
 KxUES9AIJGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKOAgAKCRD6PaqMvJYe
 9ewUD/9FAokWtzhtDn9Z+8u+/+5MlZcIEC2OOKxjX5GL2PbefUPOjrk+HNISEOopeVSR73XaN1W
 Fme0uL0cQEuJHwK6nmfXOkYMwuwgaYHUNHB9ar4382ofLFHGdA/o9kSQb3dSYbuVrTYIQKUIPGV
 DN//ujwi0V+Ef5eD/sBoXZySIiGSr5kOrVDr6/72SLfTcJ2hS+7eYTY0QsmS+QVQqaWUbNrghju
 XBLNM5OD8Dw/qpAVJ4tdjHQezx02TXw3shJfujRhJ1cz2oOHCg5A1u7rKCSvX6r4Lq25MMXifCp
 d+iC3/mXxHByOcmCxgxCvkOeZlUnHsvN3mQTICXdZHJuuAOPHZwL/7jFC9RalZ7PJOocA+9A7ty
 Err+ffK5hUcX2qMoMtl7XXJCMkIYHpPSE9OYwJ0ay5b7yoQ8fvX6Tfm5mMpYCeexJuF390o18QM
 Vx+U6odM5pEND4s9n03L6Qppsf6gc+sqU8HJk4PX31jHgfbpFku+rKMlEyyYDxiqSAO1DNi/ecH
 p2iZVT0lyB17P3JKwV3upODe7k2Gp6b42bPSduX1hoL+5N9CPjTiLBKImJkjzGax9atv8T0AAh3
 RLJZIdEaPr5yTDDTu5G4pEG/5ORbeCe+NLK0M39YfmUznAuPwSgt5ensRmI8UkacIPh+FTOy41u
 LqWSuGztD8G3+Zw==
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

Tested-by: Parth Pancholi <parth.pancholi@toradex.com>
Tested-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 114d883c65dc..09b289f0fcbf 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1052,10 +1052,6 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
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

