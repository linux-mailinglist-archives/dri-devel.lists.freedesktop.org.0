Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5F462075
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 20:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DB76F9D3;
	Mon, 29 Nov 2021 19:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE186F9D3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1638214067; bh=2tcgcuVx80VzE4HILFYDigYj1ddMAtFMGwsLwzeYJTE=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=kFbX93nVReDYouw6rmj01uRjYOerEJ1fhlHSgiBtoJheGnRRkAqFLM4VTPmtEiAqY
 Qo2Lx8/PNvJR7p1Vx9hF/sb0xvhnKtzbhoh+Xv1P1CejhN1doggzivEAEFlLp7ri7g
 2iEW2X0BfFBNBcTAyQSyIxWSINJ/qVviAJ297xjU=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon, 29 Nov 2021 20:27:47 +0100 (CET)
X-EA-Auth: f6dgvTlaAqO2oTPEOC2hHY8CdKMsDGMTCWBI8qLYN/QciFxzFyYn367HsKxggpua43yNhgBTghzuyu8g8HNK1DNA8kPcBq0V
Date: Mon, 29 Nov 2021 20:27:45 +0100
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: fix error found in some cases after the patch
 d1af5cd86997
Message-ID: <YaUpsaP7hng6zpFh@gineta.localdomain>
References: <YaC7zXW119tlzfVh@gineta.localdomain>
 <20211128142015.GB5295@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211128142015.GB5295@xsang-OptiPlex-9020>
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
Cc: 0day robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
calls in drm core, files drm_a*.c") fails when the drm_device
cannot be found in the parameter plane_state. Fix it.

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core, files drm_a*.c")
Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index aef2fbd676e5..8bd4472d7949 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -312,7 +312,7 @@ update_connector_routing(struct drm_atomic_state *state,
 
 	if (!new_connector_state->crtc) {
 		drm_dbg_atomic(connector->dev, "Disabling [CONNECTOR:%d:%s]\n",
-				connector->base.id, connector->name);
+			       connector->base.id, connector->name);
 
 		set_best_encoder(state, new_connector_state, NULL);
 
@@ -805,6 +805,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					bool can_update_disabled)
 {
 	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *dev = plane_state->plane ? plane_state->plane->dev : NULL;
 	struct drm_rect *src = &plane_state->src;
 	struct drm_rect *dst = &plane_state->dst;
 	unsigned int rotation = plane_state->rotation;
@@ -828,8 +829,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	}
 
 	if (!crtc_state->enable && !can_update_disabled) {
-		drm_dbg_kms(plane_state->crtc->dev,
-			       "Cannot update plane of a disabled CRTC.\n");
+		drm_dbg_kms(dev, "Cannot update plane of a disabled CRTC.\n");
 		return -EINVAL;
 	}
 
@@ -839,8 +839,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
 	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
 	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->crtc->dev,
-			       "Invalid scaling of plane\n");
+		drm_dbg_kms(dev, "Invalid scaling of plane\n");
 		drm_rect_debug_print("src: ", &plane_state->src, true);
 		drm_rect_debug_print("dst: ", &plane_state->dst, false);
 		return -ERANGE;
@@ -864,8 +863,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 		return 0;
 
 	if (!can_position && !drm_rect_equals(dst, &clip)) {
-		drm_dbg_kms(plane_state->crtc->dev,
-			       "Plane must cover entire CRTC\n");
+		drm_dbg_kms(dev, "Plane must cover entire CRTC\n");
 		drm_rect_debug_print("dst: ", dst, false);
 		drm_rect_debug_print("clip: ", &clip, false);
 		return -EINVAL;
-- 
2.33.0



