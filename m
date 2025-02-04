Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73933A27511
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D8F10E67B;
	Tue,  4 Feb 2025 14:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OzgTWdh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B410E67B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDD915C6A7E;
 Tue,  4 Feb 2025 14:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3910C4CEE4;
 Tue,  4 Feb 2025 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681163;
 bh=hjljS1IU0lVKl6ryo5OzuwUD5r2/qKEjHeD3Pl3ogRk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OzgTWdh5GBbc1Cjor/eS8bm1JBD4sh3Wlbfexv/lnWoheMBgn2VVHXlOCoMQx4vOv
 BxLwqnjK7/OutrWLY9pWfL/pxle1VR2JflLxMEO0IAAV3eheU3qjz/brd4wnch6uuI
 E/yMIzu4nIAQwjB1J3fSh/KIAXIWqkWt5gOjoyMIe3BVzoXKYCkGWlifCRuan3xGux
 g49/avBZmudkO0ybr7ZVJYm25I7jSEvIa3OWQ7MpxwIrM+bdAFUqzM00uzSFdw9+AT
 4NKdy/4iMJv/EVz9HCqCG1ehlYkkzlmTb6IQ8tMjYf8Oyg9dQKCdFatLCXSffYrjGg
 YOawXwn++StBw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:43 +0100
Subject: [PATCH v2 15/35] drm/atomic-helper: Change parameter name of
 crtc_set_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-15-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hjljS1IU0lVKl6ryo5OzuwUD5r2/qKEjHeD3Pl3ogRk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN5fyZvzR6Or592jI9/yD2yu3D3bOncW/6FybR7ui
 uulgTPnd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJqLQz1kfmzavOlFeIvuPH
 He11dGs4h9yGkPwtm54bbtzbKGF76MLHoryqljer2V+Un4sVto60YGzoDCq2lQiYeaSofCnrXsn
 zl9wf3V1VxHTYLUtVxsjvaFDezKuqLO7q+v6PNC9/iF3tvRAA
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

crtc_set_mode() deals with calling the modeset related hooks for CRTC,
connectors and bridges if and when a new commit changes them. It takes
the drm_atomic_state being committed as a parameter.

However, that parameter name is called as old_state, which is pretty
confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 50b3fdb033eaae8e852a4fd298d2e958be1201f3..55c91f2821d550c8af52b71d8f452e0fdee997e4 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1363,19 +1363,19 @@ void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *stat
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
 
 static void
-crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
+crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
 	int i;
 
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
 		if (!new_crtc_state->mode_changed)
 			continue;
 
@@ -1387,11 +1387,11 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 			funcs->mode_set_nofb(crtc);
 		}
 	}
 
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_display_mode *mode, *adjusted_mode;
 		struct drm_bridge *bridge;
 

-- 
2.48.0

