Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB62169077
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 17:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B00896A5;
	Sat, 22 Feb 2020 16:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E930E896A5
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 16:48:58 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A423B33E;
 Sat, 22 Feb 2020 17:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582390137;
 bh=+jE9B/oJwsIGu79/V1K+AiiabAKoGDYbnB79+nyUI3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qTIFZ5+skvkZT2JnTAtNu0SFQo5hVqHh6ixxvZlOHqOaSeFl4XfDOK8cazhPKwLfo
 CO7Dinm/yVBeLqvQR86BPZjZcTJLTV7veYS95pKfc0GY7FG3QWdI4teEvJWwieR8cd
 8YkiduPmECDO1pC8m5AwC9/2TaActsANC1/hRpcI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7.1 06/54] drm/bridge: Improve overview documentation
Date: Sat, 22 Feb 2020 18:48:32 +0200
Message-Id: <20200222164832.18338-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-7-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up the drm_bridge overview documentation, and expand the
operations documentation to provide more details on API usage.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
Change since v7:

- Detail how bridge operations are used by atomic helpers
---
 Documentation/gpu/drm-kms-helpers.rst |   6 +-
 drivers/gpu/drm/drm_bridge.c          | 101 +++++++++++++++++++-------
 2 files changed, 79 insertions(+), 28 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 9668a7fe2408..fe155c6ae175 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -139,11 +139,11 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: overview
 
-Default bridge callback sequence
---------------------------------
+Bridge Operations
+-----------------
 
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
-   :doc: bridge callbacks
+   :doc: bridge operations
 
 
 Bridge Helper Reference
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 68ab933ee430..52dfc67a6cf8 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -39,26 +39,50 @@
  * encoder chain.
  *
  * A bridge is always attached to a single &drm_encoder at a time, but can be
- * either connected to it directly, or through an intermediate bridge::
- *
- *     encoder ---> bridge B ---> bridge A
- *
- * Here, the output of the encoder feeds to bridge B, and that furthers feeds to
- * bridge A.
- *
- * The driver using the bridge is responsible to make the associations between
- * the encoder and bridges. Once these links are made, the bridges will
- * participate along with encoder functions to perform mode_set/enable/disable
- * through the ops provided in &drm_bridge_funcs.
- *
- * drm_bridge, like drm_panel, aren't drm_mode_object entities like planes,
+ * either connected to it directly, or through a chain of bridges::
+ *
+ *     [ CRTC ---> ] Encoder ---> Bridge A ---> Bridge B
+ *
+ * Here, the output of the encoder feeds to bridge A, and that furthers feeds to
+ * bridge B. Bridge chains can be arbitrarily long, and shall be fully linear:
+ * Chaining multiple bridges to the output of a bridge, or the same bridge to
+ * the output of different bridges, is not supported.
+ *
+ * Display drivers are responsible for linking encoders with the first bridge
+ * in the chains. This is done by acquiring the appropriate bridge with
+ * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
+ * panel with drm_panel_bridge_add_typed() (or the managed version
+ * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
+ * attached to the encoder with a call to drm_bridge_attach().
+ *
+ * Bridges are responsible for linking themselves with the next bridge in the
+ * chain, if any. This is done the same way as for encoders, with the call to
+ * drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation.
+ *
+ * Once these links are created, the bridges can participate along with encoder
+ * functions to perform mode validation and fixup (through
+ * drm_bridge_chain_mode_valid() and drm_atomic_bridge_chain_check()), mode
+ * setting (through drm_bridge_chain_mode_set()), enable (through
+ * drm_atomic_bridge_chain_pre_enable() and drm_atomic_bridge_chain_enable())
+ * and disable (through drm_atomic_bridge_chain_disable() and
+ * drm_atomic_bridge_chain_post_disable()). Those functions call the
+ * corresponding operations provided in &drm_bridge_funcs in sequence for all
+ * bridges in the chain.
+ *
+ * For display drivers that use the atomic helpers
+ * drm_atomic_helper_check_modeset(),
+ * drm_atomic_helper_commit_modeset_enables() and
+ * drm_atomic_helper_commit_modeset_disables() (either directly in hand-rolled
+ * commit check and commit tail handlers, or through the higher-level
+ * drm_atomic_helper_check() and drm_atomic_helper_commit_tail() or
+ * drm_atomic_helper_commit_tail_rpm() helpers), this is done transparently and
+ * requires no intervention from the driver. For other drivers, the relevant
+ * DRM bridge chain functions shall be called manually.
+ *
+ * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
  * CRTCs, encoders or connectors and hence are not visible to userspace. They
  * just provide additional hooks to get the desired output at the end of the
  * encoder chain.
- *
- * Bridges can also be chained up using the &drm_bridge.chain_node field.
- *
- * Both legacy CRTC helpers and the new atomic modeset helpers support bridges.
  */
 
 static DEFINE_MUTEX(bridge_lock);
@@ -212,14 +236,41 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 }
 
 /**
- * DOC: bridge callbacks
- *
- * The &drm_bridge_funcs ops are populated by the bridge driver. The DRM
- * internals (atomic and CRTC helpers) use the helpers defined in drm_bridge.c
- * These helpers call a specific &drm_bridge_funcs op for all the bridges
- * during encoder configuration.
- *
- * For detailed specification of the bridge callbacks see &drm_bridge_funcs.
+ * DOC: bridge operations
+ *
+ * Bridge drivers expose operations through the &drm_bridge_funcs structure.
+ * The DRM internals (atomic and CRTC helpers) use the helpers defined in
+ * drm_bridge.c to call bridge operations. Those operations are divided in
+ * two big categories to support different parts of the bridge usage.
+ *
+ * - The encoder-related operations support control of the bridges in the
+ *   chain, and are roughly counterparts to the &drm_encoder_helper_funcs
+ *   operations. They are used by the legacy CRTC and the atomic modeset
+ *   helpers to perform mode validation, fixup and setting, and enable and
+ *   disable the bridge automatically.
+ *
+ *   The enable and disable operations are split in
+ *   &drm_bridge_funcs.pre_enable, &drm_bridge_funcs.enable,
+ *   &drm_bridge_funcs.disable and &drm_bridge_funcs.post_disable to provide
+ *   finer-grained control.
+ *
+ *   Bridge drivers may implement the legacy version of those operations, or
+ *   the atomic version (prefixed with atomic\_), in which case they shall also
+ *   implement the atomic state bookkeeping operations
+ *   (&drm_bridge_funcs.atomic_duplicate_state,
+ *   &drm_bridge_funcs.atomic_destroy_state and &drm_bridge_funcs.reset).
+ *   Mixing atomic and non-atomic versions of the operations is not supported.
+ *
+ * - The bus format negotiation operations
+ *   &drm_bridge_funcs.atomic_get_output_bus_fmts and
+ *   &drm_bridge_funcs.atomic_get_input_bus_fmts allow bridge drivers to
+ *   negotiate the formats transmitted between bridges in the chain when
+ *   multiple formats are supported. Negotiation for formats is performed
+ *   transparently for display drivers by the atomic modeset helpers. Only
+ *   atomic versions of those operations exist, bridge drivers that need to
+ *   implement them shall thus also implement the atomic version of the
+ *   encoder-related operations. This feature is not supported by the legacy
+ *   CRTC helpers.
  */
 
 /**
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
