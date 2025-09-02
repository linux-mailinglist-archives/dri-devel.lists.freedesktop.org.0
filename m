Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775ADB3F87C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B3E10E5E4;
	Tue,  2 Sep 2025 08:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RLwRQkRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276CE10E5E3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 372DA60209;
 Tue,  2 Sep 2025 08:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF74C4CEF8;
 Tue,  2 Sep 2025 08:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802006;
 bh=dxIMcnZXqFeVSb69JHsUsUX0GPYjiSufclb+3jXwpPk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RLwRQkRkACo8pJRB/IOaydCjEX9xJZO0bdZN0LzGLB4IdrnEX2pQotjgtbY4xlyUW
 QANwKYBfKiCu74x8HEf8s8GF94BqDmCJOvwNXZ0HkLasguNGBnlmyuC+G1xwm6f237
 hFu6JaEqQjuBwOEmqRyyZcLubz0siwI6ziRshnMfOC4x6djhNn6ugvj5uJgXRrNwYD
 1+eE67KVo5bwJqnHyQ0/0etHAOJAa05is/4HE0d/cXSpaqk6nBF7aJwj8trVMSurFz
 NIIQ2rVR1TEs5iSIKArbOCkHpVQ6eXoz3yzssAfTRxv/8lgJ3NBd7rFVJuqIUdj5IX
 oxA9TGheorNbA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:34 +0200
Subject: [PATCH 06/29] drm/bridge: Implement atomic_print_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-6-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dxIMcnZXqFeVSb69JHsUsUX0GPYjiSufclb+3jXwpPk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVm93P2Qj3zpBa+Nan9cH/k6eHX7So2Azw9FM74QfV
 zm+rzhyrGMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5JE6Y31YjCkbr7K8zbPi
 N4ePhexQ/ju56ezvTZk+is3CtUk7TJJ4/hmHcH3qVv58XXrDqq9xgowNsx9Yz3ebrl9ztibjML9
 6ePSv/Vf/P1JTaXJW0/yjKuKgkVH/x+hOAROfgavvhdKVC8sB
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

Bridges have some fields in their state worth printing, but we don't
provide an atomic_print_state implementation to show those fields.

Let's do so.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index dd439d55177a867acb7ab73c02182bada44d93c9..e803dfd8fd5aae9c16931445213df04d8715b9f6 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -370,13 +370,31 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
 	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
 
 	bridge->funcs->atomic_destroy_state(bridge, state);
 }
 
+static void
+drm_bridge_atomic_print_priv_state(struct drm_printer *p,
+				   const struct drm_private_state *s)
+{
+	const struct drm_bridge_state *state =
+		container_of_const(s, struct drm_bridge_state, base);
+	struct drm_bridge *bridge = drm_priv_to_bridge(s->obj);
+
+	drm_printf(p, "bridge: %s", drm_get_connector_type_name(bridge->type));
+	drm_printf(p, "\tinput bus configuration:");
+	drm_printf(p, "\t\tcode: %04x", state->input_bus_cfg.format);
+	drm_printf(p, "\t\tflags: %08x", state->input_bus_cfg.flags);
+	drm_printf(p, "\toutput bus configuration:");
+	drm_printf(p, "\t\tcode: %04x", state->output_bus_cfg.format);
+	drm_printf(p, "\t\tflags: %08x", state->output_bus_cfg.flags);
+}
+
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
+	.atomic_print_state = drm_bridge_atomic_print_priv_state,
 };
 
 static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
 {
 	return bridge->funcs->atomic_reset != NULL;

-- 
2.50.1

