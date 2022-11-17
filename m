Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757A62DABC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E1D10E13E;
	Thu, 17 Nov 2022 12:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A642C10E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:26:16 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A02D1056;
 Thu, 17 Nov 2022 13:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668687975;
 bh=J7rA5IBGFcu2N7Sh3o6C5ykD706eiPf84CkDTha4nHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wNY4TSTe80fO5UHNwpmW5p9FeBFOvLGMBpmDKusupfPJBwNft9UY64m20BgSVrMhp
 OFpQHTJgqxy3ENwgGgvC/Rw2CvUzTEf5+8wf4/qfQsclzSah94HdsJ2eok+E/AHgzi
 VPSK4RmEw/d0VqMmQIrPhgfWRYFNewVCjC+WBfGg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] HACK: drm: rcar-du: dsi: use-extal-clk hack
Date: Thu, 17 Nov 2022 14:25:47 +0200
Message-Id: <20221117122547.809644-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Renesas BSP kernel does this for Whitehawk board. It is not clear what
it does, as the bits are marked reserved in the SoC documentation.

Do not merge.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 723c35726c38..c264cb689664 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -598,6 +598,10 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 		return -ENODEV;
 	}
 
+	/* XXX HACK for Whitehawk board. "use_extal_clk" from BSP Kernel. */
+	if (dsi->info->model == RCAR_DSI_R8A779G0)
+		rcar_mipi_dsi_set(dsi, CLOCKSET1, 0x0100000C);
+
 	/* PLL Clock Setting */
 	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 	rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
-- 
2.34.1

