Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64222A7A3C1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 15:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C070C10E9BD;
	Thu,  3 Apr 2025 13:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W2Jg+8bL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A8E10E9CC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 13:33:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 100A0A42158;
 Thu,  3 Apr 2025 13:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38033C4CEE5;
 Thu,  3 Apr 2025 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743687228;
 bh=bUeXH/Wwdj4sAGXZMnX8uO5zLm5ZlWDOVT0q62t00aY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W2Jg+8bLEje7Ib31DEYv5NlcbQ4c29t9zWQ16iXiBvn0k2FbAhJX9SwUBDzxblhz9
 qDDtuCshshgxbQK719bD5GVjVROMaBwyGk8u2kJzDY8uGmPFOBFhiNjVSAhJ+xzPXw
 45QfQkrg/CamteDliPtJgBXZGfGig/hiAvubojWOEFuadMT+GIh8chI7hHs2ADtuhE
 i6YgZXt25gfbWLMgutO/cMHfc6HxcgzOxhTC068nUaXpHwKOoVysTO0p4An3hMBSVT
 1dmtvbTGb3OmwmTkrUkU3dWjbHga7JcyL1sk/VIAtjLVakGY64Fbl/u7PEAPriNpim
 qQ2gfeBpBgWZw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 03 Apr 2025 15:33:31 +0200
Subject: [PATCH v2 2/4] drm/vc4: tests: Document output handling functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-drm-vc4-kunit-failures-v2-2-e09195cc8840@kernel.org>
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bUeXH/Wwdj4sAGXZMnX8uO5zLm5ZlWDOVT0q62t00aY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnv+gz/HhUKeDzXV2aDuMFiTWXmuq1HHBILhba7a8kUb
 hdt2GDeUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlEBjL80zftCknMs5BYP9n3
 +N79gZuFd2vxRhnHls+x2RYrnMzXzsjwRZzz5ZHUtalzXk4M3PnUhaM6Jat71seM4Ctrjy760bm
 WHQA=
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

vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() are public
but aren't documented. Let's provide the documentation.

In particular, special care should be taken to deal with EDEADLK.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
index f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1..577d9a9563696791632aec614c381a214886bf27 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -59,10 +59,23 @@ struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
 
 static const struct drm_display_mode default_mode = {
 	DRM_SIMPLE_MODE(640, 480, 64, 48)
 };
 
+/**
+ * vc4_mock_atomic_add_output() - Enables an output in a state
+ * @test: The test context object
+ * @state: Atomic state to enable the output in.
+ * @type: Type of the output encoder
+ *
+ * Adds an output CRTC and connector to a state, and enables them.
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure. If the error is
+ * EDEADLK, the entire atomic sequence must be restarted. All other
+ * errors are fatal.
+ */
 int vc4_mock_atomic_add_output(struct kunit *test,
 			       struct drm_atomic_state *state,
 			       enum vc4_encoder_type type)
 {
 	struct drm_device *drm = state->dev;
@@ -103,10 +116,23 @@ int vc4_mock_atomic_add_output(struct kunit *test,
 	crtc_state->active = true;
 
 	return 0;
 }
 
+/**
+ * vc4_mock_atomic_del_output() - Disables an output in a state
+ * @test: The test context object
+ * @state: Atomic state to disable the output in.
+ * @type: Type of the output encoder
+ *
+ * Adds an output CRTC and connector to a state, and disables them.
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure. If the error is
+ * EDEADLK, the entire atomic sequence must be restarted. All other
+ * errors are fatal.
+ */
 int vc4_mock_atomic_del_output(struct kunit *test,
 			       struct drm_atomic_state *state,
 			       enum vc4_encoder_type type)
 {
 	struct drm_device *drm = state->dev;

-- 
2.49.0

