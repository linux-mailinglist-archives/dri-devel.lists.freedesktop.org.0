Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1788C77E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA50C10F086;
	Tue, 26 Mar 2024 15:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ieQ1/zKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE8810F084
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:41:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A1CC612BC;
 Tue, 26 Mar 2024 15:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C3BC43609;
 Tue, 26 Mar 2024 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711467702;
 bh=qqwR8snTsMUCSQhySgzRiBMtDFLDW3r/mg7D3AAdcrw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ieQ1/zKpaN6WK1eamMR1I54zoQeFCmErVGOryySxLoxhH0PKCtTC0c9iLYcYcpCj6
 zQaBpK0xkkcrD45bcNm+ssOEpgX30xmjfoSPhc04aOF1jOgx1mtTIYas/YgEMFmbWG
 YykuOzEAleVenk6ezmLxTwsk3lSpMJOUCZjhsAYnPwVqPDFULv4gmShW70yNDf2Pnm
 A+P7sv9ng3UhJFTlXKCmpwXN5Qy8ZXJJ8tzA/gKm0NVzSgsoSWaXz7tQF3Nn882/JW
 FfYdwYN+DtEFsWftJwE68/DlxidFPt5kdi5zcCYWlR9pZRtWuSrjd0FIGIBWk1FwEL
 yQyx04ggXfX9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 16:40:29 +0100
Subject: [PATCH v11 25/28] drm/vc4: tests: Remove vc4_dummy_plane structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240326-kms-hdmi-connector-state-v11-25-c5680ffcf261@kernel.org>
References: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
In-Reply-To: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3744; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qqwR8snTsMUCSQhySgzRiBMtDFLDW3r/mg7D3AAdcrw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMb7JWCB+P/3ZnN9PptYIyge9X+Gwv+xH1dbZvxAeXr
 Qv1PnS/7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATmSvC2HCXecr6incBi9Pm
 CmyZUvE8Kv+vzxbfOr8HzuHppz6Vl6ye0b90VuZLV8ONNU3yxz1OqTHWSp1q4poxbYY+L9sh8zk
 /jG2Cl5u0Te05Xvhmktr9K+KGLxdM/Zrb9ns2Y15uwEmXc9mbAA==
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

The vc4_dummy_plane structure was introduced as a mean to add
mock-specific fields.

However, we never really used it and it's still strictly equivalent to
vc4_plane (which is in the same situation vs drm_plane), so we can
simply remove the vc4_dummy_plane structure and make the mock code
cleaner.

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c       |  6 ++----
 drivers/gpu/drm/vc4/tests/vc4_mock.h       |  9 ++-------
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c | 14 +++++---------
 3 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index becb3dbaa548..0731a7d85d7a 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -107,20 +107,18 @@ static const struct vc4_mock_desc vc5_mock =
 );
 
 static int __build_one_pipe(struct kunit *test, struct drm_device *drm,
 			    const struct vc4_mock_pipe_desc *pipe)
 {
-	struct vc4_dummy_plane *dummy_plane;
 	struct drm_plane *plane;
 	struct vc4_dummy_crtc *dummy_crtc;
 	struct drm_crtc *crtc;
 	unsigned int i;
 
-	dummy_plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
+	plane = vc4_dummy_plane(test, drm, DRM_PLANE_TYPE_PRIMARY);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
 
-	plane = &dummy_plane->plane.base;
 	dummy_crtc = vc4_mock_pv(test, drm, plane, pipe->data);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_crtc);
 
 	crtc = &dummy_crtc->crtc.base;
 	for (i = 0; i < pipe->noutputs; i++) {
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.h b/drivers/gpu/drm/vc4/tests/vc4_mock.h
index 2d0b339bd9f3..002b6218960c 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.h
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.h
@@ -19,17 +19,12 @@ struct drm_crtc *vc4_find_crtc_for_encoder(struct kunit *test,
 			return crtc;
 
 	return NULL;
 }
 
-struct vc4_dummy_plane {
-	struct vc4_plane plane;
-};
-
-struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
-					struct drm_device *drm,
-					enum drm_plane_type type);
+struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
+				  enum drm_plane_type type);
 
 struct vc4_dummy_crtc {
 	struct vc4_crtc crtc;
 };
 
diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
index 62b18f5f41db..973f5f929097 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
@@ -20,28 +20,24 @@ static const struct drm_plane_funcs vc4_dummy_plane_funcs = {
 
 static const uint32_t vc4_dummy_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-struct vc4_dummy_plane *vc4_dummy_plane(struct kunit *test,
-					struct drm_device *drm,
-					enum drm_plane_type type)
+struct drm_plane *vc4_dummy_plane(struct kunit *test, struct drm_device *drm,
+				  enum drm_plane_type type)
 {
-	struct vc4_dummy_plane *dummy_plane;
 	struct drm_plane *plane;
 
-	dummy_plane = drmm_universal_plane_alloc(drm,
-						 struct vc4_dummy_plane, plane.base,
+	plane = __drmm_universal_plane_alloc(drm, sizeof(struct drm_plane), 0,
 						 0,
 						 &vc4_dummy_plane_funcs,
 						 vc4_dummy_plane_formats,
 						 ARRAY_SIZE(vc4_dummy_plane_formats),
 						 NULL,
 						 DRM_PLANE_TYPE_PRIMARY,
 						 NULL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_plane);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
 
-	plane = &dummy_plane->plane.base;
 	drm_plane_helper_add(plane, &vc4_dummy_plane_helper_funcs);
 
-	return dummy_plane;
+	return plane;
 }

-- 
2.44.0

