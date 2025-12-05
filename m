Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E9CA66DC
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 08:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D2D10E230;
	Fri,  5 Dec 2025 07:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701E610E230
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 07:31:12 +0000 (UTC)
X-UUID: 5b2c58e6d1ac11f0a38c85956e01ac42-20251205
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:c49a27f6-661c-4317-a775-fa33b1c4c367, IP:0,
 UR
 L:0,TC:0,Content:34,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:34
X-CID-META: VersionHash:a9d874c, CLOUDID:ecd4d238eb2ef9ab7702e5f362e2a12b,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|898,TC:nil,Content:4|15|50,E
 DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5b2c58e6d1ac11f0a38c85956e01ac42-20251205
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 127752674; Fri, 05 Dec 2025 15:31:04 +0800
From: yaolu@kylinos.cn
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/atomic: determine the hotspots attribute first for drm
 plane
Date: Fri,  5 Dec 2025 15:30:54 +0800
Message-Id: <20251205073054.137965-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

From: Lu Yao <yaolu@kylinos.cn>

For drm driver which has 'DRIVER_CURSOR_HOTSPOT' feature and register
the 'atomic_set/get_property' function in drm_plane_funcs, will causing
hotspots property set/get error.

Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..bf2cb0a2abb1 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -550,9 +550,6 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		return ret;
 	} else if (property == plane->scaling_filter_property) {
 		state->scaling_filter = val;
-	} else if (plane->funcs->atomic_set_property) {
-		return plane->funcs->atomic_set_property(plane, state,
-				property, val);
 	} else if (property == plane->hotspot_x_property) {
 		if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 			drm_dbg_atomic(plane->dev,
@@ -569,6 +566,9 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 			return -EINVAL;
 		}
 		state->hotspot_y = val;
+	} else if (plane->funcs->atomic_set_property) {
+		return plane->funcs->atomic_set_property(plane, state,
+				property, val);
 	} else {
 		drm_dbg_atomic(plane->dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
@@ -627,12 +627,12 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 			state->fb_damage_clips->base.id : 0;
 	} else if (property == plane->scaling_filter_property) {
 		*val = state->scaling_filter;
-	} else if (plane->funcs->atomic_get_property) {
-		return plane->funcs->atomic_get_property(plane, state, property, val);
 	} else if (property == plane->hotspot_x_property) {
 		*val = state->hotspot_x;
 	} else if (property == plane->hotspot_y_property) {
 		*val = state->hotspot_y;
+	} else if (plane->funcs->atomic_get_property) {
+		return plane->funcs->atomic_get_property(plane, state, property, val);
 	} else {
 		drm_dbg_atomic(dev,
 			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
-- 
2.25.1

