Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14604BAC982
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90910E573;
	Tue, 30 Sep 2025 11:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+7j5wFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18E910E575
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C0E714032E;
 Tue, 30 Sep 2025 11:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431AFC4CEF0;
 Tue, 30 Sep 2025 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230030;
 bh=tDilpiePXkLtY0m2qz4Cv3ffcTnYb884//dBRiKZn6A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=E+7j5wFVJ6oBqb2cRk15vO+G7RJoDDSueYjf9VBL5FJ8+Zpw+8gyaa0pBRXpeQbLT
 2+JbB0pUYYqteeomHGKsBp01adb8A7lv+Kd1UAKdm2WgarL4e05OHlZD3Od+2uB8f2
 uUEN43KWTNQ1xWLato0L8YiAaZeVxOEyKNXfuF2vkO/yJiZbjjH/ZBn3d1lOsXg13n
 76aNvztroledsPiBVh5p7vAnVN/5vIUkJpew4aRA5wJOGQZfWCb3bGzKl6wmYRtsJ5
 MH7RK+qRAemHAPOMPVbImsJ4+AsBNa4wioZZLcsmhcr4MMU3LSl16a6f/LLHdTvu2h
 y3DprvdPO1m9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:24 +0200
Subject: [PATCH v5 09/39] drm/atomic: Document __drm_planes_state state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-9-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tDilpiePXkLtY0m2qz4Cv3ffcTnYb884//dBRiKZn6A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyi/L9mbVSZTIS2+0nZn4/3714/+Pva56VTxZHnHL
 4zPSm73dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJHNRhrPfqX2P5eNet+cVN
 incVGeIv1rh8X7389Kptbdfenz5v8s2ocfcR/QRenl2nay7NOtw7vY2xYYN8lZzxm+RMT8XZNz0
 fukvnMUn9vTIzUXePn/r9A2rW1t69q0qFn0aITFgnkKopt4wbAA==
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

While the old and new state pointers are somewhat self-explanatory, the
state pointer and its relation to the other two really isn't.

Now that we've cleaned up everything and it isn't used in any
modesetting path, we can document what it's still useful for: to free
the right state when we free the global state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_atomic.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index b2cc9c4a9beb59980a8fb3629a11a45d08f2e86e..a05012adcf94741e2374d2a0c2cd66eb1d7ef98f 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -157,11 +157,27 @@ struct drm_crtc_commit {
 	bool abort_completion;
 };
 
 struct __drm_planes_state {
 	struct drm_plane *ptr;
-	struct drm_plane_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_plane_state we will need to free when
+	 * tearing down the associated &drm_atomic_state in
+	 * $drm_mode_config_funcs.atomic_state_clear or
+	 * drm_atomic_state_default_clear().
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_plane_state *state;
+
+	struct drm_plane_state *old_state, *new_state;
 };
 
 struct __drm_crtcs_state {
 	struct drm_crtc *ptr;
 	struct drm_crtc_state *state, *old_state, *new_state;

-- 
2.51.0

