Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030BFB80371
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AE410E87A;
	Wed, 17 Sep 2025 14:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JlJaiEeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9724810E870
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 14E056023C;
 Wed, 17 Sep 2025 14:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6540EC4CEE7;
 Wed, 17 Sep 2025 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120455;
 bh=FadWVl0XUOaS5LmQryFy6zz2jBp3A92cD687fESFP00=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JlJaiEeXt/+QLXgSTABgfujEObyQ/o2N3i4bYpQnySoeO5dbk44SFF5dBKrz3vjBU
 LBE5oI9Z74N6K8LgncnQcH6JQB4ZThVGylAM5Rk2ejDgC8Jlk9Sv/WhAKQo1ImE8yD
 1o0oFXQu5qh9uAxFjUTk9wKSXzoiIvVoautwRgpUFenwmqSsQIxKQirrjPQ8ECaqh1
 284fkBPWRMNWc0aWwNu/FM9NVewoHWOkZSt36U8YpzrrHcq6ygCLHDobW/DJEFkpXQ
 hqHO7Fnk6UQTmTVhyRpLrP40VYGkR4L+6jp6DPUl79Z+b+CO34x2o3SxD5trbQzzUu
 T4VS2XXjdh2EQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:11 +0200
Subject: [PATCH v4 30/39] drm/tilcdc: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-30-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FadWVl0XUOaS5LmQryFy6zz2jBp3A92cD687fESFP00=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq5xvXX+WXjF1y6BwE0xaplpy19I7dBvzhY5P+E8u
 8bG+7zXOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEAo4xNsz9vzNZcDH3y/86
 qu/r2HjfZc64+SettHot/xOuKb22Mmpp1dGTW/eE/L+Uk6AlaJOymLG+LvOkWqakyl7Fvdf3h1l
 UbY+fYjxR1zqqV6CDLyTkc8S0rsqUi9K3t88J//Lx5+FVeycAAA==
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

The tilcdc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tilcdc/tilcdc_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index cf77a8ce7398040814ec20eeffc6da960e36dfc0..aa72ca679598b6617366e89ffb3838ed8b323f2f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -40,12 +40,11 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 		dev_err(plane->dev->dev, "%s: crtc position must be zero.",
 			__func__);
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
 		return 0;
 
 	if (crtc_state->mode.hdisplay != new_state->crtc_w ||

-- 
2.50.1

