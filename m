Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF447FB75A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4CD10E494;
	Tue, 28 Nov 2023 10:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7CF10E48F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:25:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 00EBBCE1ABE;
 Tue, 28 Nov 2023 10:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB250C433B7;
 Tue, 28 Nov 2023 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167126;
 bh=T7BGbpPZ3AlM96tkJBI+UFTFXx2WsbuihikI0ttB014=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=f/Bpu358TNzYIPG5mpFwKYmtNrkcMtijeR/lWbQf23dFAxrkGAY6QUZr6Oju6+603
 +pgJFt8oUqVt7m+zeVuvqKhXooUoZRm7QeBzshDJAqwvJjwwq+nNGeaAF8gNZsGCn0
 NUz5wuozBrE09q4FXj/TJGaniH925vhwVhimQaTsg3fyAFxBjXSVhGbSChbKRztjeD
 7VP129ivYXCeS5tO8/tKf3C6BxL+B29NrQ4R3rgO8DmhVIOq0siqqsMJpLuv9IqiEo
 txzV/R2rUjWEB2rX+YPybp78LczMd08j2/aGpf/PckoIMH1xtyUJYeH1Uwzu2nXqXo
 3oky2fjdPLB3g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:33 +0100
Subject: [PATCH v4 22/45] drm/vc4: tests: Convert to plane creation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-22-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T7BGbpPZ3AlM96tkJBI+UFTFXx2WsbuihikI0ttB014=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y+xmf458dT/1RwJHv2u3WfWfF/O8vviLRbXR0kZY
 n7akjfrO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjAR7nBGhnfajw78nOJ3c2Pt
 4mkHeiveGlioz126dtnJ3Tw9a7TXLpNn+MXUMWNuxeSDq1I7s8o0lgpOD/u5ZKto0cPTN+LKpj8
 3FmcBAA==
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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
2.41.0

