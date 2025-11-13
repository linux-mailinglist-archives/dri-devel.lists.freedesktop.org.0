Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A474C59FC4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7103810E201;
	Thu, 13 Nov 2025 20:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="w8X9Xq+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D040310E201
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:37:41 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763066260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocCd5w26fdc1J8cjXCJJ44FOPQqL/aFGod/qtI7VzAQ=;
 b=w8X9Xq+jerxDx0SSpkQri6sf4OS6D6LncLOPZkPgFHpWLI0Y1tBCDTlAPa0MLvZSla5ZeH
 4HkuOPyiGf7h2L7hcXg1hDiLMJQye7l/8fPwykUjfmKKCQAe6Dar7aoDkyNnxMZvdfAi1f
 XpkKEre7Q2GWyU4Sjh9SCtX0e1vv2XM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/3] drm: zynqmp: Make the video plane primary
Date: Thu, 13 Nov 2025 15:37:13 -0500
Message-Id: <20251113203715.2768107-3-sean.anderson@linux.dev>
In-Reply-To: <20251113203715.2768107-1-sean.anderson@linux.dev>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The zynqmp has two planes: "video" and "graphics". The video plane

- Is on the bottom (zpos=0) (except when chroma keying as the master plane)
- Supports "live" input (e.g. from an external source)
- Supports RGB, YUV, and YCbCr formats, including XRGB8888
- Does not support transparency, except via chroma keying (colorkey)
- Must cover the entire screen (translation/resizing not supported)

The graphics plane

- Is on the top (zpos=1)
- Supports "live" input (e.g. from an external source)
- Supports RGB and YUV444 formats, but not XRGB8888
- Supports transparency either via
  - Global alpha channel, which disables per-pixel alpha when enabled
  - Per-pixel alpha, which cannot be used with global alpha
  - Chroma keying (colorkey)
- Must cover the entire screen (translation/resizing not supported)

Currently the graphics plane is the primary plane. Make the video plane
the primary plane:

- The video plane supports XRGB8888, which is the default 24-bit
  colorspace for X. This results in improved performance when compared
  to RGB565.
- The graphics plane can be used as an overlay because it has a higher
  z-pos and supports a per-pixel alpha channel. Unfortunately, clients
  like weston cannot currently take advantage of this because they
  expect overlay planes to support translation/resizing.

One downside to this approach could be that the graphics plane has worse
support for YUV and YCBCr, so it may be more difficult to compose video
streams into the window of a media player. However, no existing software
could rely on this because there is no way to enable the per-pixel alpha
channel when the graphics plane is enabled. This makes it impossible to
"carve out" an area in the graphics plane where the video plane shows
through. This limitation is addressed in the next patch, but it means we
do not need to worry about compatibility in this area.

An alternate approach could be to pretend that the graphics plane
supports XRGB8888 by using the supported ARGB8888 mode instead and
enabling the global alpha channel. However, this would rule out ever
using the per-pixel alpha channel.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index c80a2d4034f3..456ada9ac003 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -161,8 +161,8 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 		if (!formats)
 			return -ENOMEM;
 
-		/* Graphics layer is primary, and video layer is overlay. */
-		type = i == ZYNQMP_DPSUB_LAYER_VID
+		/* Graphics layer is overlay, and video layer is primary. */
+		type = i == ZYNQMP_DPSUB_LAYER_GFX
 		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
 		ret = drm_universal_plane_init(&dpsub->drm->dev, plane, 0,
 					       &zynqmp_dpsub_plane_funcs,
@@ -322,7 +322,7 @@ static const struct drm_crtc_funcs zynqmp_dpsub_crtc_funcs = {
 
 static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_plane *plane = &dpsub->drm->planes[ZYNQMP_DPSUB_LAYER_GFX];
+	struct drm_plane *plane = &dpsub->drm->planes[ZYNQMP_DPSUB_LAYER_VID];
 	struct drm_crtc *crtc = &dpsub->drm->crtc;
 	int ret;
 
-- 
2.35.1.1320.gc452695387.dirty

