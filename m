Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21FEA2752A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3058D10E68D;
	Tue,  4 Feb 2025 15:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XGGfdIge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4478010E68D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:00:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D98AC5C4686;
 Tue,  4 Feb 2025 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFD7C4CEDF;
 Tue,  4 Feb 2025 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681256;
 bh=dVVSqhEjCDXw9391XwgMOugJcxOfDSIJu4GCSZhaJlw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=XGGfdIgeVBmK7L97DIYzeAYAD2C/o039YVVw7KVVLu6L/rUl8biZMC24IKITEF/3s
 dP0x4RiImXyDhKSOk+PhGJxySk4139Uc22eb9BXXnzdR1He+m751rR5HvPRSjgZrNZ
 Tbc5J30d365acn77aCMDvl9OSENohfvOuf3wI+6ibKkK6shXit6+mrhEMwgRe3TTjM
 oHMNQoyR6Y/I/g/u61mPqWWFUkxSuvRNf87gGQKN++25ckfJ+bUHZYvB736KA6Zr0y
 LIasEpNYEzPebdH7gR3sG0f7NuSSWz3m1L/BJUcE9bIrePQUwoczqZV4IGfUuSu4/X
 Vi257FVV0TsBg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:59 +0100
Subject: [PATCH v2 31/35] drm/bridge: Make encoder pointer deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-31-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dVVSqhEjCDXw9391XwgMOugJcxOfDSIJu4GCSZhaJlw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL4Z9qixbHkppHsp3LTxdWfkwt3GCkmx3tOX5+/Ni
 TtwbVtHx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI6WDGhk991191q2b+zWwN
 /cN828XmuGxW8/u9k7cUmn9e5DqD4+m89/2XtzrvWufRHTN5ze9ngowNrydfP8qt+Yc71aSsov/
 5xmfb+/i9/28Oa3vC4ajmbbHpX6PnXLvmYO+9k3bmhn34b94EAA==
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

Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
pointer to other currently bound entities. They are all considered
relevant only for non-atomic drivers, and generally perceived as
deprecated in favour of the equivalent pointers in the atomic states.

It used to be useful because we didn't have alternatives, but now that
we do, let's make sure it's done for drm_bridge.encoder too.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7a3664770c3ab8634a69e953b37a30ac467139b3..80ca28af4c56449ffa760c198c3016b456f1f346 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -822,12 +822,18 @@ enum drm_bridge_ops {
 struct drm_bridge {
 	/** @base: inherit from &drm_private_object */
 	struct drm_private_obj base;
 	/** @dev: DRM device this bridge belongs to */
 	struct drm_device *dev;
-	/** @encoder: encoder to which this bridge is connected */
+
+	/** @encoder:
+	 *
+	 * encoder to which this bridge is connected. Only meaningful
+	 * for non-atomic drivers. Deprecated.
+	 */
 	struct drm_encoder *encoder;
+
 	/** @chain_node: used to form a bridge chain */
 	struct list_head chain_node;
 	/** @of_node: device node pointer to the bridge */
 	struct device_node *of_node;
 	/** @list: to keep track of all added bridges */

-- 
2.48.0

