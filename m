Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC0A78FCF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE5A10E7BB;
	Wed,  2 Apr 2025 13:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NQHUAfPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFF010E7BB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:31:23 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7C9119C9;
 Wed,  2 Apr 2025 15:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743600569;
 bh=3CN4uj1iCwxXdJquhx40R2NHzb/pS+FOmacXJwz76L8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NQHUAfPcH1rwhxyByEIFVaRgsdUCfq2XYKbi/yXKQkeOS0Pi1n1l7ioh7sUYpGwPK
 SswKu8gTOL3mgBzpherhLplNBdr5rAzyX1mPg/NXxrOlkOZien3VL/HPfVbop9jAUv
 imPdp1wS9kvmpXgSEJjj7ZsckJp9ahlz2heCcQ7E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Apr 2025 16:30:48 +0300
Subject: [PATCH v2 06/18] drm/bridge: cdns-dsi: Adjust mode to negative syncs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-cdns-dsi-impro-v2-6-4a093eaa5e27@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3CN4uj1iCwxXdJquhx40R2NHzb/pS+FOmacXJwz76L8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn7Twdw/WedZDgLhiIic9z7RcO+p8ir4C1KqJPF
 U0d60QXZ7yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+08HQAKCRD6PaqMvJYe
 9aaoEACIPT3NJO+z+ih6nFSRkIVA5j6s8OwEPZYFfv3GG651PEeRrOCmHTCuXOwCMc8ZuZFVRzH
 9j1KMTGQ9ZkccMBOo33ZjUz0TWeT18peERi4/4/O1kTJZPLtYRTZ7FUionkIgNCqrCbRqJCMABn
 UH4BDCRaVEg1FdHDVnDfaQmY/ORhppJE5ICsTni6q4FEc9ZCDMRuzM+NWJkW846ptRw1FTOjtne
 09NjoKB3JrllIxRhdlLzrdft/Fh8HN1wZNm5Mehs01dk0Z9aKtFfBNS0sMM9IMvv9H+5GKc2+YU
 6KvkIMFa8njKqmqHzssSsArx5qPTn/AENQjJ3mIAbStlSIicaWlo6AQy44YP0dbQWkHHfRdXS+G
 Cg41EhJVTLpq6d+vFfaUnpY0JuYETBVwfBIZwC+8Po6ceD05ww7LVvquJ3cWP0kP8GVnmRoCPVN
 MZNkeU0n83KTC4t1ksALYouwmfMGIr4GxUvVLvr5M8kGIvDeJSzceXrpfJIPED2+wZARPjbsDJB
 BiEuDgxa1CO2fpS60IDu5q5tA2MOyBvxs9F46Mz+df2EnRUZDaxmZd4eydcMiEUzbkNBEiL8U3N
 tHDYnKvb4zhmi02j024+tj5DW+KVEwtV0pzmbCuEMKR/cLwgYoJQvIRiOXhc7IajPjgsFoNMPeT
 3CFUlpTJi/8jUAA==
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

The Cadence DSI requires negative syncs from the incoming video signal,
but at the moment that requirement is not expressed in any way. If the
crtc decides to use positive syncs, things break down.

Use the adjusted_mode in atomic_check to set the sync flags to negative
ones.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 8a320bd4d34d..53322407c1b0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -992,6 +992,11 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
 	const struct drm_display_mode *mode = &crtc_state->mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
+	struct drm_display_mode *adjusted_crtc_mode = &crtc_state->adjusted_mode;
+
+	/* cdns-dsi requires negative syncs */
+	adjusted_crtc_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	adjusted_crtc_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
 
 	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
 }

-- 
2.43.0

