Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC6168F77
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3A26E916;
	Sat, 22 Feb 2020 15:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0E86E919
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:01:45 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD9051A52;
 Sat, 22 Feb 2020 16:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383703;
 bh=L1NOKXeqtnLX14F7hkwvJLgmPRCXhOFZUgqtQAuHOtY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MKDQSp9bSviOvTQGePisI03VFGwTOkF0bhRZrgzQ7fYueBGJbYZLgbgqJmWsKn0W9
 FC4d1k9m4B71VwaU1SEGpoE+zZG+nwaHNckiMKHHEIyN+5C9K7FDWo6uRd0UF8msOl
 tDrbwx+mwailgHtSTvlU14NKVkfSwr1m5yHksZ1A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 06/54] drm/bridge: Improve overview documentation
Date: Sat, 22 Feb 2020 17:00:18 +0200
Message-Id: <20200222150106.22919-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
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
---
 Documentation/gpu/drm-kms-helpers.rst |  6 +--
 drivers/gpu/drm/drm_bridge.c          | 76 ++++++++++++++++++++-------
 2 files changed, 60 insertions(+), 22 deletions(-)

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
index 68ab933ee430..5f55a9e17a7c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -39,25 +39,36 @@
  * encoder chain.
  *
  * A bridge is always attached to a single &drm_encoder at a time, but can be
- * either connected to it directly, or through an intermediate bridge::
+ * either connected to it directly, or through a chain of bridges::
  *
- *     encoder ---> bridge B ---> bridge A
+ *     [ CRTC ---> ] Encoder ---> Bridge A ---> Bridge B
  *
- * Here, the output of the encoder feeds to bridge B, and that furthers feeds to
- * bridge A.
+ * Here, the output of the encoder feeds to bridge A, and that furthers feeds to
+ * bridge B. Bridge chains can be arbitrarily long, and shall be fully linear:
+ * Chaining multiple bridges to the output of a bridge, or the same bridge to
+ * the output of different bridges, is not supported.
  *
- * The driver using the bridge is responsible to make the associations between
- * the encoder and bridges. Once these links are made, the bridges will
- * participate along with encoder functions to perform mode_set/enable/disable
- * through the ops provided in &drm_bridge_funcs.
+ * Display drivers are responsible for linking encoders with the first bridge
+ * in the chains. This is done by acquiring the appropriate bridge with
+ * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
+ * panel with drm_panel_bridge_add_typed() (or the managed version
+ * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
+ * attached to the encoder with a call to drm_bridge_attach().
  *
- * drm_bridge, like drm_panel, aren't drm_mode_object entities like planes,
+ * Bridges are responsible for linking themselves with the next bridge in the
+ * chain, if any. This is done the same way as for encoders, with the call to
+ * drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation.
+ *
+ * Once these links are created, the bridges will automatically participate
+ * along with encoder functions to perform mode setting, enable and disable
+ * through the corresponding operations provided in &drm_bridge_funcs. This
+ * requires no intervention from display drivers.
+ *
+ * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
  * CRTCs, encoders or connectors and hence are not visible to userspace. They
  * just provide additional hooks to get the desired output at the end of the
  * encoder chain.
  *
- * Bridges can also be chained up using the &drm_bridge.chain_node field.
- *
  * Both legacy CRTC helpers and the new atomic modeset helpers support bridges.
  */
 
@@ -212,14 +223,41 @@ void drm_bridge_detach(struct drm_bridge *bridge)
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
