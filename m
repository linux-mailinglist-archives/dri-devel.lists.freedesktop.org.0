Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB690AC3A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 12:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D6610E33C;
	Mon, 17 Jun 2024 10:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="SgtpN/FW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4A610E219
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 10:53:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HArSBg117216;
 Mon, 17 Jun 2024 05:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718621608;
 bh=FRu3MIrJp12Tscm2aUNYEnItvNMFaJ0I8NvmTz0QMiw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=SgtpN/FW/ptL0pH+qk2ZEvA6PhrQQtOAnm3tDX83V4XthneXcr3gph+cz9a4joaBN
 2Tk1srMKgroPZzVe3xKgk/vwHJEOg9NLG19ISENnX9NhzOZ2tOUHN8eyZA66hQ9LCf
 7xCss6xHFhYf7j8cDejt0IB7c5QZXpWR2XcOfsck=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HArSe2055933
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 Jun 2024 05:53:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 05:53:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 05:53:28 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HArRiS106218;
 Mon, 17 Jun 2024 05:53:27 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Dominik Haller <d.haller@phytec.de>, Sam
 Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Devarsh Thakkar
 <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra
 <j-luthra@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v3 10/10] drm/bridge: cdns-dsi: Use pre_enable/post_disable to
 enable/disable
Date: Mon, 17 Jun 2024 16:23:11 +0530
Message-ID: <20240617105311.1587489-11-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617105311.1587489-1-a-bhatia1@ti.com>
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

The cdns-dsi controller requires that it be turned on completely before
the input DPI's source has begun streaming[0]. Not having that, allows
for a small window before cdns-dsi enable and after cdns-dsi disable
where the previous entity (in this case tidss's videoport) to continue
streaming DPI video signals. This small window where cdns-dsi is
disabled but is still receiving signals causes the input FIFO of
cdns-dsi to get corrupted. This causes the colors to shift on the output
display. The colors can either shift by one color component (R->G, G->B,
B->R), or by two color components (R->B, G->R, B->G).

Since tidss's videoport starts streaming via crtc enable hooks, we need
cdns-dsi to be up and running before that. Now that the bridges are
pre_enabled before crtc is enabled, and post_disabled after crtc is
disabled, use the pre_enable and post_disable hooks to get cdns-dsi
ready and running before the tidss videoport to get pass the color shift
issues.

[0]: See section 12.6.5.7.3 "Start-up Procedure" in J721E SoC TRM
     TRM Link: http://www.ti.com/lit/pdf/spruil1

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 32 +++----------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index acbd4007b38c..a92814c3e0d6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -655,8 +655,8 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
-					   struct drm_bridge_state *old_bridge_state)
+static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -676,15 +676,6 @@ static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
 	pm_runtime_put(dsi->base.dev);
 }
 
-static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-						struct drm_bridge_state *old_bridge_state)
-{
-	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
-	struct cdns_dsi *dsi = input_to_dsi(input);
-
-	pm_runtime_put(dsi->base.dev);
-}
-
 static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 {
 	struct cdns_dsi_output *output = &dsi->output;
@@ -754,8 +745,8 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
 	dsi->link_initialized = true;
 }
 
-static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
+static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -906,19 +897,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	writel(tmp, dsi->regs + MCTL_MAIN_EN);
 }
 
-static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					      struct drm_bridge_state *old_bridge_state)
-{
-	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
-	struct cdns_dsi *dsi = input_to_dsi(input);
-
-	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
-		return;
-
-	cdns_dsi_init_link(dsi);
-	cdns_dsi_hs_init(dsi);
-}
-
 static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 					       struct drm_bridge_state *bridge_state,
 					       struct drm_crtc_state *crtc_state,
@@ -949,9 +927,7 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.attach = cdns_dsi_bridge_attach,
 	.mode_valid = cdns_dsi_bridge_mode_valid,
-	.atomic_disable = cdns_dsi_bridge_atomic_disable,
 	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
-	.atomic_enable = cdns_dsi_bridge_atomic_enable,
 	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-- 
2.34.1

