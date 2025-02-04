Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57FAA27527
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB2110E68A;
	Tue,  4 Feb 2025 15:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n/aQcFVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B0510E68A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:00:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89E875C4686;
 Tue,  4 Feb 2025 15:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F01C4CEDF;
 Tue,  4 Feb 2025 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681243;
 bh=bDFzSB1N/8eD1Wxk9D/RS0yHlXy3r7EmA4MdBs3iBEk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=n/aQcFVXKsyEzg+xqZ9yIlCk618BRZ6bCFxh0VQWF3zd5/n7EHGu/yhyvhhu1TQlY
 Lc134NmJnH1TCEZS87CF3p8y8XyLFsQf6eB2CP9xU3qU6FNMxY/6WETS/SSX0p7Zr5
 Mg9OOpDK05TE/9bVwFINLsE7eVGZxFWvphKSvJGTQ/ZWfYsvgem+dycj8QJ8XCqwPP
 AHIQiPXUvvufwx6LdwjXAcxmnlu22wJh/Jr3jtFoxaaUtVU4aRicBUX57+YsPcZb4y
 y00uo698jCmY97C0BOvijTcIvCqc4yDhNqlmUAjgylPLu9QYq/K09vEf3XT1TRxGZD
 GZVF9Z+RtlE7g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:57 +0100
Subject: [PATCH v2 29/35] drm/bridge: Assume that a bridge is atomic if it
 has atomic_reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-29-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bDFzSB1N/8eD1Wxk9D/RS0yHlXy3r7EmA4MdBs3iBEk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL56rOlbvCWtTG2bx7KcM2+mmL0MFsvryVn17/vzm
 Ojnizf87JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT8U1nrLNz489LaN71sLiu
 edIKV6ueqH+f7s9O13FgTXEN47twLO53q24dy6859queJhyNrTt9grE+Ky/efPHZeK+Z7LEZF8z
 C6z59Le9pmFj6y+bPxlNFjQKf7x+Y2urtXtCkaaSUxnzCbwoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

A bridge is considered atomic-enabled if it has an atomic_check
implementation. However, atomic_check is optional and thus a driver
might very well not provide an implementation, and yet still be atomic.

Switch to atomic_reset, which allocates the initial bridge state and is
thus a better candidate.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d7c17a26e86fd9a3e5a39f335edff4ffce30dd79..ad91a0ac375a9c8cf82834354ec7f654a59a7292 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -794,23 +794,25 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
 static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
 {
-	if (bridge->funcs->atomic_check) {
+	if (bridge->funcs->atomic_reset) {
 		struct drm_bridge_state *bridge_state;
 		int ret;
 
 		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
 							       bridge);
 		if (WARN_ON(!bridge_state))
 			return -EINVAL;
 
-		ret = bridge->funcs->atomic_check(bridge, bridge_state,
-						  crtc_state, conn_state);
-		if (ret)
-			return ret;
+		if (bridge->funcs->atomic_check) {
+			ret = bridge->funcs->atomic_check(bridge, bridge_state,
+							  crtc_state, conn_state);
+			if (ret)
+				return ret;
+		}
 	} else if (bridge->funcs->mode_fixup) {
 		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
 					       &crtc_state->adjusted_mode))
 			return -EINVAL;
 	}

-- 
2.48.0

