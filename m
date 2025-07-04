Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD494AF8F0B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99FC10E9C8;
	Fri,  4 Jul 2025 09:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="eE7Hu5zg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9635310E9D9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:49:10 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5649mwXr264780;
 Fri, 4 Jul 2025 04:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1751622538;
 bh=1xhFBCswGeNy7iF602Ww8g7YukHk4l20I8/G7K/iQn8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=eE7Hu5zg+zkRPFm5TT7pCvPVERD3s3RGleybbjbkrTqmBt7V6RZu0N8HdLk8qg2+W
 cl5aDGWWoEqdY6sT1smcXwhS+nubv+ZZhuYZV63gXTqu9V48uJJQL8PqI4PMPOzSAL
 TCglS75bGVhK5j6dLXStKIyAYzeWn3WwllWwIDMg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5649mwna2705195
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 4 Jul 2025 04:48:58 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 04:48:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 04:48:58 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.166])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5649mvdx2499180;
 Fri, 4 Jul 2025 04:48:57 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <j-choudhary@ti.com>
Subject: [PATCH v4 3/3] drm/tidss: oldi: Add atomic_check hook for oldi bridge
Date: Fri, 4 Jul 2025 15:18:51 +0530
Message-ID: <20250704094851.182131-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704094851.182131-1-j-choudhary@ti.com>
References: <20250704094851.182131-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Since OLDI consumes DSS VP clock directly as serial clock, certain
checks cannot be performed in tidss driver which should be checked
in oldi driver. Add check for mode clock and set the curr_max_pclk
field for tidss in case the VP is OLDI.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 63e07c8edeaa..486e7373531b 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -309,6 +309,29 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
+	struct drm_display_mode *adjusted_mode;
+	unsigned long round_clock;
+
+	adjusted_mode = &crtc_state->adjusted_mode;
+
+	if (adjusted_mode->clock > oldi->tidss->curr_max_pclk[oldi->parent_vp]) {
+		round_clock = clk_round_rate(oldi->serial, adjusted_mode->clock * 7 * 1000);
+
+		if (dispc_pclk_diff(adjusted_mode->clock * 7 * 1000, round_clock) > 5)
+			return -EINVAL;
+
+		oldi->tidss->curr_max_pclk[oldi->parent_vp] = round_clock;
+	}
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.attach	= tidss_oldi_bridge_attach,
 	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
@@ -317,6 +340,7 @@ static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_check = tidss_oldi_atomic_check,
 };
 
 static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
-- 
2.34.1

