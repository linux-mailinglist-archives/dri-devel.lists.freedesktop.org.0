Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E085147F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20AB10ED59;
	Mon, 12 Feb 2024 13:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CF+tMWnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AABF10ED58
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6EB48CE12B0;
 Mon, 12 Feb 2024 13:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAE6C43399;
 Mon, 12 Feb 2024 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707743694;
 bh=9I0REbcpKSt1MVBIkF5lrOnJOl7fX+Traw8aZNWXX1Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CF+tMWnEsHyAg1Jd1/77+v4kTOpFkQj+1p8X/b2Ni0TCg7bGlMtiDNQvJ/yw//UJI
 8za4jfG4dWuO1GwfwsXvK73pC43gBQu1nOS6yvOJRNHH7BF1TmXHGUrLgflmO7Sv0u
 9qRfh7z2ASctZLz3dXldHW/MLNXrkv78oTNvvcEBAks3IciAWAQYJDbxfZp7S+0q0O
 cxWMwwSRmFgGpHayOIWY6x1H77/j0TAR8IHNlRG400rQkdrqPGwC99PlKVCrBUfadb
 n5ICKvyOdIx++xYUSU8paNth4faiiSE5TQ9rceFz5STpgu3mv2NUQxdxkZ15i1C4w5
 x/S+Gh+YhVdCQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:13:13 +0100
Subject: [PATCH v6 30/36] drm/vc4: tests: Convert to plane creation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-30-f4bcdc979e6f@kernel.org>
References: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
In-Reply-To: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9I0REbcpKSt1MVBIkF5lrOnJOl7fX+Traw8aZNWXX1Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJAuvREvsUY9ojPzovJHzkWT07O7tlpqJ/5KrVgQ0K
 G28d1ako5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZ+JGR4SUL45T0TsY9+8TK
 ElXbBdIrmyfIu7UlGitd9uLz+pEXwciwx0hnX79esb5BUsfc/5p9dhUGAucnctgGVNRnCCU0yzM
 CAA==
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

Now that we have a plane create helper for kunit mocked drivers, let's
convert to it in vc4.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c | 34 +++++++-----------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
index 973f5f929097..14357db82238 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
@@ -1,43 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_fourcc.h>
-#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_plane.h>
 
 #include <kunit/test.h>
 
 #include "vc4_mock.h"
 
-static const struct drm_plane_helper_funcs vc4_dummy_plane_helper_funcs = {
-};
-
-static const struct drm_plane_funcs vc4_dummy_plane_funcs = {
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.reset			= drm_atomic_helper_plane_reset,
-};
-
-static const uint32_t vc4_dummy_plane_formats[] = {
-	DRM_FORMAT_XRGB8888,
-};
-
 struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
 				  enum drm_plane_type type)
 {
 	struct drm_plane *plane;
 
-	plane = __drmm_universal_plane_alloc(drm, sizeof(struct drm_plane), 0,
-						 0,
-						 &vc4_dummy_plane_funcs,
-						 vc4_dummy_plane_formats,
-						 ARRAY_SIZE(vc4_dummy_plane_formats),
-						 NULL,
-						 DRM_PLANE_TYPE_PRIMARY,
-						 NULL);
+	KUNIT_ASSERT_EQ(test, type, DRM_PLANE_TYPE_PRIMARY);
+
+	plane = drm_kunit_helper_create_primary_plane(test, drm,
+						      NULL,
+						      NULL,
+						      NULL, 0,
+						      NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
 
-	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
-
 	return plane;
 }

-- 
2.43.0

