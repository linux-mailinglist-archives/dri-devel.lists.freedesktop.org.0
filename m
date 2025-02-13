Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E889AA34334
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5825A10EAEF;
	Thu, 13 Feb 2025 14:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q4St6TMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128310EAEF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 24265A42547;
 Thu, 13 Feb 2025 14:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55406C4CEE2;
 Thu, 13 Feb 2025 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457922;
 bh=vZ1zwX+EIT22jLVdxPPeOac2s5CTPENPj9BdJWzzYrU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Q4St6TMhkyhIG6lEgIn9qNLxZbjFXwDd9fSZ6TQXMgtpYHiVcKPK4SInA1j0Wf7wN
 SHhztO4/8epvX1EZolbSWgW2b1RrROvmL4AG/ktlfSst6N/+Dxx4ZXenmDChf1/u2N
 zgN0LcjKc05pq72Wv3v4OXuhmYEstVSie168c+3qqR5nyUBkKDaqSmwWatorPUdMdC
 6YklDE6CbppIPmrSbwVPQf4McPOgVnMTdbLZ2sUQWUyyKlL7GxzeERzYV/rypGfb/V
 4eSQY69SZCV6Asuubwx2NrB9tPo6t52oa2M3+Ylz7rKebEaSRlzmQCcfCIFEUKuTps
 UxRpcUCqk4Kag==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:51 +0100
Subject: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vZ1zwX+EIT22jLVdxPPeOac2s5CTPENPj9BdJWzzYrU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWFVUXqTGbf4fsZ9lsVeOXKP+i5taP9tlk58bX2LbY
 ZTcs/tPx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIwH7G+oTq2u9LT9XaiTAV
 OL1cctbg4r65/KIn/gadMnO9saF65Zk606Nv5m2e6vdC4UFsul68GWOt8H0OKeNY7a0rFLUuioQ
 +/+drWPJ/vnmnstObKce1vec1CTQ75zy9EPhc0kGkM+uj5nkA
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4cc12b8bbdfe2b496546607d1ae0b66a903c8f89..a4dd9be13c5205512c2b3441a3d87d557f411bfb 100644
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

