Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C29A12D35
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB60210E7FF;
	Wed, 15 Jan 2025 21:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q1IRDe/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271D110E7FF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D58445C5E8E;
 Wed, 15 Jan 2025 21:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030E7C4CED1;
 Wed, 15 Jan 2025 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975194;
 bh=dDSrEJOy32MEMpzmIKaY91KJje1WwYUjtbVILeIG9mQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=q1IRDe/v+pmW+pZXDd1ChzHoQlFfqFzBX+jnhylRdmKxV5nAZrdh3kyHT8bf24JKn
 YJzv8BU5kJ3QpKsIjIecl2y7A9hActVpAiV8VJtIg68sInyC8t7x+YkCwFYWxj4hJv
 DMyS4THV4k52tbY8xIv/p3gX5KwcA9vBgIjU5aLqKilZeM5+keUh7UK8MwtDfUfsrP
 rHwIIgEKFt2F84nri5MUwzuWwh0V8BxuCDLHXf50zqACMiHA1KQEmI8TOUjMRAwXwx
 rXCHkOvieBAz9Y4O1FPLqW4kq6hdq0LzrFdzJAoLJOJl2AP6nPemeRkajm/5YKj9Na
 9CWE/QuZdTSYw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:26 +0100
Subject: [PATCH 19/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_cleanup_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-19-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2219; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dDSrEJOy32MEMpzmIKaY91KJje1WwYUjtbVILeIG9mQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyrK3rs5eUNQwgUnq/qO7N/KOrwwNjjkS/atdd5WM+
 uvbT57ndExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJtD9hrOE+KfCqwv1fo61p
 k/t7p4/+fLq98xJLGS0y/eUmLen/yXDwOu+MbMaOnSoTKpe/dzu3mLFOc/GBQ0pHn/I1mcxmy7/
 84EP/W18+29NRfvubhYymOl2ocGksYPz9IvLliqtvGILszXcAAA==
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

drm_atomic_helper_cleanup_planes() is one of the final part of a commit,
and will free up all plane resources used in the previous commit.  It
takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 581fd0f14ba0aa2a9d0334cad49575de3fb5fb20..000ae2d4ded286458ee386e34336d650907a8073 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2977,28 +2977,28 @@ drm_atomic_helper_disable_planes_on_crtc(struct drm_crtc_state *old_crtc_state,
 EXPORT_SYMBOL(drm_atomic_helper_disable_planes_on_crtc);
 
 /**
  * drm_atomic_helper_cleanup_planes - cleanup plane resources after commit
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function cleans up plane state, specifically framebuffers, from the old
- * configuration. Hence the old configuration must be perserved in @old_state to
+ * configuration. Hence the old configuration must be perserved in @state to
  * be able to call this function.
  *
  * This function may not be called on the new state when the atomic update
  * fails at any point after calling drm_atomic_helper_prepare_planes(). Use
  * drm_atomic_helper_unprepare_planes() in this case.
  */
 void drm_atomic_helper_cleanup_planes(struct drm_device *dev,
-				      struct drm_atomic_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	int i;
 
-	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
 
 		if (funcs->cleanup_fb)
 			funcs->cleanup_fb(plane, old_plane_state);
 	}

-- 
2.47.1

