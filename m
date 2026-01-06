Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2CCF96C8
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 17:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518410E516;
	Tue,  6 Jan 2026 16:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="NgsZzBLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5AF10E516
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 16:43:14 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1767717793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=195iBqV5eoJAKk9Y2KXt/3tGtboP6oculGGs/M6v76U=;
 b=NgsZzBLIagpOPtzt9rJ6oVaAeROC8PlfcUaVIPM1qwlX/r2tjDjPNBetjrNl3pesW0kJhY
 dPFpWJb6puCAcJagVNEnSkRKei483r8hm1uLJsEPJlyyB27sGotn4SJVE41APVhtluCwo4
 DHUiWX2bqjtlqAeyqJznEzHh4LqzBI8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 3/4] drm: zynqmp: Make the video plane primary
Date: Tue,  6 Jan 2026 11:42:46 -0500
Message-Id: <20260106164247.472544-4-sean.anderson@linux.dev>
In-Reply-To: <20260106164247.472544-1-sean.anderson@linux.dev>
References: <20260106164247.472544-1-sean.anderson@linux.dev>
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

(no changes since v1)

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 816bea4ea986..284acb23c53e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -162,8 +162,8 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 		if (!formats)
 			return -ENOMEM;
 
-		/* Graphics layer is primary, and video layer is overlay. */
-		type = i == ZYNQMP_DPSUB_LAYER_VID
+		/* Graphics layer is overlay, and video layer is primary. */
+		type = i == ZYNQMP_DPSUB_LAYER_GFX
 		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
 		ret = drm_universal_plane_init(&dpsub->drm->dev, plane, 0,
 					       &zynqmp_dpsub_plane_funcs,
@@ -323,7 +323,7 @@ static const struct drm_crtc_funcs zynqmp_dpsub_crtc_funcs = {
 
 static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_plane *plane = &dpsub->drm->planes[ZYNQMP_DPSUB_LAYER_GFX];
+	struct drm_plane *plane = &dpsub->drm->planes[ZYNQMP_DPSUB_LAYER_VID];
 	struct drm_crtc *crtc = &dpsub->drm->crtc;
 	int ret;
 
-- 
2.35.1.1320.gc452695387.dirty

