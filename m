Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52DB4ABE5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76FB10E6B9;
	Tue,  9 Sep 2025 11:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aAj60pLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F80510E6B9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF5D46021F;
 Tue,  9 Sep 2025 11:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28093C4CEF5;
 Tue,  9 Sep 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417334;
 bh=aroUlCeMCynoYWP5WThhBDdmLNk2LhKt3G8zy2OJ0vw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aAj60pLlEA9dwCHZHg0gys07vMA9uVItfNxqjJf7P+yts+9cGQCSul4wrIuwiM7Mg
 doJtzzz9GR4iAfhPBd/6n6xsrGBGOwxG96vL/ZUpKxeoELazDhOlz8neSTwnWhhXtF
 SgSLK2y1tkfzqpNwaSNEtq8tBlHEbk8Jft1HmWmxiDxPPZBYfqYzUEjJFddTj4qeug
 NiWr1vP2eLCuk2LIIAVwGbTcJMmaCZDYP/x32xYynYu+R44VJgC4+Q/Gmp3sghTZWl
 ET9AKW3AKaFEU6/AQ+hgkff3oRcNyg2eUD/Lue4qZXvKLQuuA+T3Ic+Uq0lMNKMnsY
 YlMvxXv0QNdYQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:42 +0200
Subject: [PATCH v3 23/39] drm/loongson: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-23-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Sui Jingfeng <suijingfeng@loongson.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aroUlCeMCynoYWP5WThhBDdmLNk2LhKt3G8zy2OJ0vw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+HUOrXfUrT9+0LoqiH39N5tnr9g5zGwarzqZcaWLX
 00y+tjdMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZS08HYMG+uRdv1yTmWC3PY
 XRrvRzk4brZmrGg36Ho3r/NWdobgt33B4dM/GxnJ/8o3OarE83kBY330nmXVNxN/zTy9Q+jg0oX
 xZyIaW3q/Tf7wn/P64YZeqTZm28K1h5v7suoysi+Fae9tZgIA
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

The loongson atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/loongson/lsdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index aa9a97f9c4dc28eea3098507ce52e6aa6caa46eb..2967a5cca06936d5d2480fac258b01e11f8d28e1 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -194,11 +194,11 @@ static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
 		drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
 			new_state->crtc_w, new_state->crtc_h);
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (!crtc_state->active)
 		return -EINVAL;
 
 	if (plane->state->crtc != new_state->crtc ||
 	    plane->state->src_w != new_state->src_w ||

-- 
2.50.1

