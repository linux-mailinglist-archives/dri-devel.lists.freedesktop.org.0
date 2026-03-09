Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BsNEtP7rmnZKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:56:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D726423D2CF
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C595F10E56E;
	Mon,  9 Mar 2026 16:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WsuyxrF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE1610E569
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:56:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77FE3434F6;
 Mon,  9 Mar 2026 16:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EBCC4CEF7;
 Mon,  9 Mar 2026 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773075406;
 bh=sQcxHQ4I4ZLAaDXAbllvvwrUduN3PDwYexQoUDrYufU=;
 h=From:To:Cc:Subject:Date:From;
 b=WsuyxrF3fepv4Rxy+E8SdmdaopavU7qN0J28/P7/9PVrbcUGvBDaIfTvB+thcM01s
 08wOb7tHBBfA2c9HYwtQujVv2nhn5es0MlcT8Gk4FeMfFFtGiERjVHI6LoKcvCxWkZ
 fQqmD6xfLQmukweMO5s++aRWNXF7OzROlN+d7pQktBMhZaBh+hT0bhUy8ek0/jeq6+
 XQ2eYjoa7ZzP7TBPMBMAaVhxHOJ9HTHSZTQkOX3z8+Z7B14GwunW4eofSMEp66lSRe
 hC1jm8UrBVJVrtpwVdqXFiBiaN9o8MWemeUUTSwxnPQq4KjnHtajOmBEMl0fps/fyf
 YSJrEQ9WRS+Cw==
Received: by wens.tw (Postfix, from userid 1000)
 id 04B8A5FD80; Tue, 10 Mar 2026 00:56:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get
 display memory
Date: Tue, 10 Mar 2026 00:56:33 +0800
Message-ID: <20260309165635.1138413-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: D726423D2CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:jernej@kernel.org,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:linux-sunxi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
adds a new helper, which covers fetching a drm_framebuffer's GEM object
and calculating the buffer address for a given plane.

This patch uses this helper to replace our own open coded version of the
same function.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 16 ++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 27 ++------------------------
 2 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f08f6da55dd0..72c92203ae63 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -124,25 +124,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 {
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_dma_object *gem;
 	dma_addr_t dma_addr;
 	u32 ch_base;
-	int bpp;
 
 	ch_base = sun8i_channel_base(layer);
 
-	/* Get the physical address of the buffer in memory */
-	gem = drm_fb_dma_get_gem_obj(fb, 0);
-
-	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
-
-	/* Compute the start of the displayed memory */
-	bpp = fb->format->cpp[0];
-	dma_addr = gem->dma_addr + fb->offsets[0];
-
-	/* Fixup framebuffer address for src coordinates */
-	dma_addr += (state->src.x1 >> 16) * bpp;
-	dma_addr += (state->src.y1 >> 16) * fb->pitches[0];
+	/* Get the start of the displayed memory */
+	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index ca3ab59e108d..cd8d6c2da0c7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -197,38 +197,15 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *gem;
-	u32 dx, dy, src_x, src_y;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int i;
 
 	ch_base = sun8i_channel_base(layer);
 
-	/* Adjust x and y to be dividable by subsampling factor */
-	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
-	src_y = (state->src.y1 >> 16) & ~(format->vsub - 1);
-
 	for (i = 0; i < format->num_planes; i++) {
-		/* Get the physical address of the buffer in memory */
-		gem = drm_fb_dma_get_gem_obj(fb, i);
-
-		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
-
-		/* Compute the start of the displayed memory */
-		dma_addr = gem->dma_addr + fb->offsets[i];
-
-		dx = src_x;
-		dy = src_y;
-
-		if (i > 0) {
-			dx /= format->hsub;
-			dy /= format->vsub;
-		}
-
-		/* Fixup framebuffer address for src coordinates */
-		dma_addr += dx * format->cpp[i];
-		dma_addr += dy * fb->pitches[i];
+		/* Get the start of the displayed memory */
+		dma_addr = drm_fb_dma_get_gem_addr(fb, state, i);
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
-- 
2.47.3

