Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0259E98E4B1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 23:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5810E22C;
	Wed,  2 Oct 2024 21:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="knPHSUzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B3010E0D6;
 Wed,  2 Oct 2024 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MI6xOCQ7+nhzrvIE6O1Lz/t5IEbq+qfqs1XqHlJ+8qA=; b=knPHSUzFCDfb4ioydXzzyqaboi
 qQ8dfDNfVuXVHiG8793XlTNIt6c93vExzfe1mpIL0bHPjSQq2Yy4qhQcQRxx0dr9F+sQMlOwZvcSQ
 Wz4c7DzGYjtGggk4+nS+rwB0SivZ2VZvAEq/SL9wrzLFTEct+bQZViiaA9Qj5Ft2D3g3DKOO8c1R1
 j0/voFi823TQOo4xQEJypUS9XJeFVm5TpQe0Hf9E54Jc6UpTW8JvZI3u1uRJOETo6cBKQqOJ4bFND
 yynNDYFQRyAeisfiC3e5iRjbopbtZEa39p9zwiumwygubDFmsec8GV8hUfZv6s7aK7NyVP8cMksZC
 L8KMPyKA==;
Received: from [187.57.199.212] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sw6iF-0042sU-98; Wed, 02 Oct 2024 23:16:47 +0200
From: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Date: Wed, 02 Oct 2024 18:16:05 -0300
Subject: [PATCH v9 1/2] drm/atomic: Let drivers decide which planes to
 async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241002-tonyk-async_flip-v9-1-453b1b8977bd@igalia.com>
References: <20241002-tonyk-async_flip-v9-0-453b1b8977bd@igalia.com>
In-Reply-To: <20241002-tonyk-async_flip-v9-0-453b1b8977bd@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es, 
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
X-Mailer: b4 0.14.1
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

Currently, DRM atomic uAPI allows only primary planes to be flipped
asynchronously. However, each driver might be able to perform async
flips in other different plane types. To enable drivers to set their own
restrictions on which type of plane they can or cannot flip, use the
existing atomic_async_check() from struct drm_plane_helper_funcs to
enhance this flexibility, thus allowing different plane types to be able
to do async flips as well.

In order to prevent regressions and such, we keep the current policy: we
skip the driver check for the primary plane, because it is always
allowed to do async flips on it.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
Changes from v8:
- Rebased on top of 6.12-rc1
---
 drivers/gpu/drm/drm_atomic_uapi.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7936c2023955..b004fa1d2e2e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -27,8 +27,9 @@
  * Daniel Vetter <daniel.vetter@ffwll.ch>
  */
 
-#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/drm_drv.h>
@@ -1063,6 +1064,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
 		struct drm_mode_config *config = &plane->dev->mode_config;
+		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
@@ -1070,15 +1072,32 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			break;
 		}
 
-		if (async_flip &&
-		    (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY ||
-		     (prop != config->prop_fb_id &&
-		      prop != config->prop_in_fence_fd &&
-		      prop != config->prop_fb_damage_clips))) {
-			ret = drm_atomic_plane_get_property(plane, plane_state,
-							    prop, &old_val);
-			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			break;
+		if (async_flip) {
+			/* check if the prop does a nop change */
+			if ((plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) ||
+			    (prop != config->prop_fb_id &&
+			     prop != config->prop_in_fence_fd &&
+			     prop != config->prop_fb_damage_clips)) {
+				ret = drm_atomic_plane_get_property(plane, plane_state,
+								    prop, &old_val);
+				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+				break;
+			}
+
+			/* ask the driver if this non-primary plane is supported */
+			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+				ret = -EINVAL;
+
+				if (plane_funcs && plane_funcs->atomic_async_check)
+					ret = plane_funcs->atomic_async_check(plane, state);
+
+				if (ret) {
+					drm_dbg_atomic(prop->dev,
+						       "[PLANE:%d] does not support async flips\n",
+						       obj->id);
+					break;
+				}
+			}
 		}
 
 		ret = drm_atomic_plane_set_property(plane,

-- 
2.46.0

