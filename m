Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16924BC35D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A6C10E180;
	Sat, 19 Feb 2022 00:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126E610EA7E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:06 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 767D383B9F;
 Sat, 19 Feb 2022 01:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230544;
 bh=Npyt74H0xfvsIzBT3cAcKU1K4YM4l/gvVblubqCNQ2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MF5LzCyJX3sMyjwBL3rxztmHP2lcYQQBa3UawEUHYnO3kJWhVrMKE75OhDlsyOZeJ
 mxciAMj+hx5mw56nQOUgT29kEwRJpKenvTbAa9FHmwAlJgvZdo2tbasIieOAEPyLoT
 S18mS6605u+zIwAy4IZYkTgBQVN8SI1ket+XFErRy/IX5JqqVvj9vlKcLrB3tQRzP1
 F7ZgTqvej03n9mCixhvxHiHpra/Ct6pWlRXSDRq02ImlQdiq8DZCi/k9epAsf7Gqr1
 PRV29PdPKa3+5ZSVmIpwOCzWTC4UiqAK9Iqc7zGa8DBY4KzKA3CeHhdaZxJ90waxYR
 vG3ChuBcSFnew==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/bridge: Extend struct drm_bus_cfg with clock field
Date: Sat, 19 Feb 2022 01:28:40 +0100
Message-Id: <20220219002844.362157-4-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219002844.362157-1-marex@denx.de>
References: <20220219002844.362157-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend struct drm_bus_cfg with a clock field. This makes it possible for an
upstream bridge (further from scanout engine) to indicate to a downstream
bridge which frequency it expects on a link. This is particularly useful in
case of DSI bridges which derive their own internal clock from the DSI HS
clock.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_bridge.c | 6 ++++++
 include/drm/drm_atomic.h     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a069c50cc7d6b..6a5981b82499a 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -859,7 +859,9 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 		 */
 		if (cur_state) {
 			cur_state->input_bus_cfg.format = MEDIA_BUS_FMT_FIXED;
+			cur_state->input_bus_cfg.clock = 0;
 			cur_state->output_bus_cfg.format = out_bus_cfg->format;
+			cur_state->output_bus_cfg.clock = out_bus_cfg->clock;
 		}
 
 		return 0;
@@ -911,7 +913,9 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 
 	if (first_bridge == cur_bridge) {
 		cur_state->input_bus_cfg.format = in_bus_cfgs[0].format;
+		cur_state->input_bus_cfg.clock = in_bus_cfgs[0].clock;
 		cur_state->output_bus_cfg.format = out_bus_cfg->format;
+		cur_state->output_bus_cfg.clock = out_bus_cfg->clock;
 		kfree(in_bus_cfgs);
 		return 0;
 	}
@@ -926,7 +930,9 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 
 	if (!ret) {
 		cur_state->input_bus_cfg.format = in_bus_cfgs[i].format;
+		cur_state->input_bus_cfg.clock = in_bus_cfgs[i].clock;
 		cur_state->output_bus_cfg.format = out_bus_cfg->format;
+		cur_state->output_bus_cfg.clock = out_bus_cfg->clock;
 	}
 
 	kfree(in_bus_cfgs);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1701c2128a5cb..32455cf28f0bc 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1077,6 +1077,11 @@ struct drm_bus_cfg {
 	 * @flags: DRM_BUS_* flags used on this bus
 	 */
 	u32 flags;
+
+	/**
+	 * @clock: Clock frequency in kHz used on this bus
+	 */
+	u32 clock;
 };
 
 /**
-- 
2.34.1

