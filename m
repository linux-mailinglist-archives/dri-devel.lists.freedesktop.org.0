Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968BCCA7008
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EEB10EA9D;
	Fri,  5 Dec 2025 09:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gkwjp2IA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18610EA96
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 09:52:30 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66F3F1340;
 Fri,  5 Dec 2025 10:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764928211;
 bh=RzSq2b7h3pXJJqHtjfZMXpUK9z6SZ1dKteyFwNFQZAs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gkwjp2IAdh2jZ5E7vLLh4PMPn8r4TSJDnPuwKgZyGUDMaLaDIRNQ9lA/CG9L8Z50Y
 gKwfpjwznXi2bXvzMCNsUK42CFR3jbQwwOEjBGevv3jTImTHZ+cPqgTC7edVPVakKq
 QOg6Ncwrtko+dgTewQ9G/77axGYuONVvuEhBj6Sk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 05 Dec 2025 11:51:49 +0200
Subject: [PATCH 2/4] Revert "drm/mediatek: dsi: Fix DSI host and panel
 bridge pre-enable order"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-drm-seq-fix-v1-2-fda68fa1b3de@ideasonboard.com>
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RzSq2b7h3pXJJqHtjfZMXpUK9z6SZ1dKteyFwNFQZAs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpMqtV1Bz5YLupAlqCBVQfV0Mb8hNkfkNlmb4RE
 8M28qdYt6+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaTKrVQAKCRD6PaqMvJYe
 9YAND/92tsJW0TaalpvTYvqAmYF3JK82lYKeIh0n3ljbzoYQWOF0dQwLi3Fgw5CAcvJgNmhdLb1
 bTGtcMk2CrFsb/4dmaSBGsdRA5i6tn0IlToo4Rc5xk+JnY6NmsNJCn/+gPvLY0CBaCl1wxL+Z9H
 LxY+kyTWuw7zqTh2/FbQDdSNMxcp5SwHWJTdLQkoISnFDlQ8ElEtkjJ7GD8i3GUDseWYRGokDc5
 FAbdx7/f0KBBc0i0hcz0ruBEsN+dkex/EPt5ZRswQhm7G853gEZtgIE5vZ9bMc4EYsr5ok+kXBm
 3DfwhATiXByEjJhyPZug+jl+kGowPoSeRNPQSNbtd2NmTnGUxvKTqz0Tiw6ZsMVIG7pDj4oDS7r
 coN/IzcPwJTMIRBWufEPTRDF5Nu/BDj3D106qUgsZ6LQCMQwL0+wd+Pu2vokbbZ3c21bI/Xh7f9
 uNzEPs1Eict9x+0y716f8sst5eyvCP0froqSwOuOLcU7UXoRf0fix0Y7zzYNt4KTdFZZbUSLFGS
 8CfTLBaPIdl8AwIOFUdoFQnJTup0qAHlFqmuldUotdmj5mk/XBFJrsXQtHaamfPrcZP77wJHO6S
 S6C364XUBDfRltXP2ftIq3NdfU3tya8Jf0/6N/r3lvfZgN2P7zNK5LzsMBPRFbCGtUYSRV+uDlD
 otnLqA/gy60hWkQ==
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

This reverts commit f5b1819193667bf62c3c99d3921b9429997a14b2.

As the original commit (c9b1150a68d9 ("drm/atomic-helper: Re-order
bridge chain pre-enable and post-disable")) causing the issue has been
reverted, let's revert the fix for mediatek.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: stable@vger.kernel.org # v6.17+
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0e2bcd5f67b7..d7726091819c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1002,12 +1002,6 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
 			return PTR_ERR(dsi->next_bridge);
 	}
 
-	/*
-	 * set flag to request the DSI host bridge be pre-enabled before device bridge
-	 * in the chain, so the DSI host is ready when the device bridge is pre-enabled
-	 */
-	dsi->next_bridge->pre_enable_prev_first = true;
-
 	drm_bridge_add(&dsi->bridge);
 
 	ret = component_add(host->dev, &mtk_dsi_component_ops);

-- 
2.43.0

