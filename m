Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967EFADE78E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C254310E7D5;
	Wed, 18 Jun 2025 09:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NMZY4BLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE9C10E7CF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:59:36 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FCC8111D;
 Wed, 18 Jun 2025 11:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750240760;
 bh=2epr8ao5TAgZA57K71+fCAJlw3g10O4XWpdyeMJVQgI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NMZY4BLOr6GDkKjrrVYFz1V4+/4HLXQy+SSfJ4E1Dggty75JUPmC9Zp8DxRDQGjpC
 n2nLzWRA/iQzn1c0BElwzK8O3RaN2xt631nGRoSiHydf/bR9RGKDqPL0l5KYo8eDlq
 sApgXdwuB+jsPrUpprahNIsYpAbq2leB52VW5FXM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 18 Jun 2025 12:59:04 +0300
Subject: [PATCH v4 01/17] drm/bridge: cdns-dsi: Fix the _atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-cdns-dsi-impro-v4-1-862c841dbe02@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SXe0VxRuPHAxO1Ko/oDsuelobFJsNH8ZVsNaLWN6Eow=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo38amO3S0OMdIxHt3vE1hoJ0QkvgnTqfHdwk
 mbxJ98ktTaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN/AAKCRD6PaqMvJYe
 9YSxD/95pwOCPNQnxndxfh7yb0dGnav6xqwiy1eFN9I8tGO9J6IgitbhzE/obVA8Byr+3ZSlW91
 Rfs159+V0ToKFAkd4fU9dPDbfxoRg0ILCeV/VM0SERw3K8uTdyiyALhUnmhAlcJFlmPRGVsGZ3+
 Bz7DFfBk9R4sG8nxfphqd0qklsxjkbAMDzOUNwfscD+5kwUYzxYAWZr8mzd1gaj8BQvyxtFv4pb
 x03MYldbisGIKuK+EvGNqSILppqGwz7BCBELPAdKgwB+t3+ClqVzOAkiauvZPQ2Y1Wx/xqE7Y54
 OUM/wELqb1/g/DQA1DZltEHdu6EeExXJgMyiYLi3qL3XHPG8ITbVwNmLOw9RIsQS+e54988mG3q
 uOX408tXUa4NbbN0SyRzoKX7wmFaGCYUfIlf48D7zID5LGy4+TuqDjHeRAZqpZVO3UgCa0ommfo
 CQUfjYn1nKcg0VjF6PmOpEBI8QCUfsikU/jtTPq0IHFjcZ70S+MIUG2vw7061zz7A+D5Y5Lh7Ze
 GGSZ7tv/qpsSpK6uttDSRiByV6sgbE5TT5y5d4NQIyhPOTaH2VvbJV2d/vURUNGCg1rPq/ULKTE
 SlmqrccIQiLX5UVm3XZar+xn13TbAGjwRf+PBseJgihbwHmL3cbF2NkBdBVpx+06yuMqdLJleIp
 knbwmeevZzWbrEA==
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

From: Aradhya Bhatia <aradhya.bhatia@linux.dev>

Use the "adjusted_mode" for the dsi configuration check, as that is the
more appropriate display_mode for validation, and later bridge enable.

Also, fix the mode_valid_check parameter from false to true, as the dsi
configuration check is taking place during the check-phase, and the
crtc_* mode values are not expected to be populated yet.

Fixes: a53d987756ea ("drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()")
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index a57ca8c3bdae..695b6246b280 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -997,10 +997,10 @@ static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
-	const struct drm_display_mode *mode = &crtc_state->mode;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
 
-	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
+	return cdns_dsi_check_conf(dsi, adjusted_mode, dsi_cfg, true);
 }
 
 static struct drm_bridge_state *

-- 
2.43.0

