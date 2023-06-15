Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4B7320CC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B7910E53A;
	Thu, 15 Jun 2023 20:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3504E10E536
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:19:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2C1D986128;
 Thu, 15 Jun 2023 22:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860356;
 bh=/csT2Il7fjHxe5mvF9WyO+HeaLXOG9b34dxkOlTjR0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FUrJeY8JwUWuPwkNjE0mz1Z5vRif3yQR7NRBVWEGFwZfbF0MzisT9hxCadOEE6Qzp
 oLrA7wpmCdOwdS4C3u3WcYGFBTqvNmVoa3baDApSPLDRnzSDWZawbXlHasKjEbPFvU
 DjplJWQhWf3yBukyAB2yUkBGonfCjmhEXjejU2vZ5qiTUrtIkNuL2lCGR37VB81jUa
 +NYa9StnwohL3/NEcP2hNlzVSSI2041G03FvJJwJrdvxJrrGS3wj4wWhZtEleeTMtM
 TOAM/gFnVysjR04F4aCsWZk7pw+2Enu+H9Wf1mOyqBn6pDCFSMV3q16wGhLhjVQ1h9
 2WJOUsYbPz+IA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/bridge: tc358762: Switch to atomic ops
Date: Thu, 15 Jun 2023 22:18:59 +0200
Message-Id: <20230615201902.566182-2-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615201902.566182-1-marex@denx.de>
References: <20230615201902.566182-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch the bridge driver over to atomic ops. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358762.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index df9703eacab1f..5e00c08b99540 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -126,7 +126,7 @@ static int tc358762_init(struct tc358762 *ctx)
 	return tc358762_clear_error(ctx);
 }
 
-static void tc358762_post_disable(struct drm_bridge *bridge)
+static void tc358762_post_disable(struct drm_bridge *bridge, struct drm_bridge_state *state)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
@@ -148,7 +148,7 @@ static void tc358762_post_disable(struct drm_bridge *bridge)
 		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
 }
 
-static void tc358762_pre_enable(struct drm_bridge *bridge)
+static void tc358762_pre_enable(struct drm_bridge *bridge, struct drm_bridge_state *state)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
@@ -165,7 +165,7 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
 	ctx->pre_enabled = true;
 }
 
-static void tc358762_enable(struct drm_bridge *bridge)
+static void tc358762_enable(struct drm_bridge *bridge, struct drm_bridge_state *state)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
@@ -185,9 +185,12 @@ static int tc358762_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs tc358762_bridge_funcs = {
-	.post_disable = tc358762_post_disable,
-	.pre_enable = tc358762_pre_enable,
-	.enable = tc358762_enable,
+	.atomic_post_disable = tc358762_post_disable,
+	.atomic_pre_enable = tc358762_pre_enable,
+	.atomic_enable = tc358762_enable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.attach = tc358762_attach,
 };
 
-- 
2.39.2

