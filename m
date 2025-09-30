Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC1BAC9A0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853DE10E57A;
	Tue, 30 Sep 2025 11:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pJs6ibBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF65810E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFA0A43C61;
 Tue, 30 Sep 2025 11:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5507FC113D0;
 Tue, 30 Sep 2025 11:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230065;
 bh=Ap3y2IZNECtUVtZYAKsVVhheRsMsLVBT+a46r7P8x3M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pJs6ibBtNlAbnZznoOAp+bzcAo6q4QNN0TVIRS7Itnj0mpRmU3y+V5ImE3Y+Lb41I
 9FfMYxYt106KdlVqbReUcDyoF2SaQyQj0rEs3EKOaqJdWyviNYqFQAa0yZvn6St3PM
 14ApG2GgMojJeJqkuWjdBY3ZxwOl9eQR2w78beyUjf0oePRuybdwF0bEOwX8SbKDRu
 hasG1X0r52L1YE9Md+lsps6ms8Ce+rzMg8s3kD1d90nB9QA6N5Vp2Ea6j5BxZoFqr3
 qo1MF8ZjcAsjrW22o14vvrM+lINW8EzB8z2brxMrUCvbCcGNcVOmqsA/N3PUqXBsnd
 SMZEuk9lFtjGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:36 +0200
Subject: [PATCH v5 21/39] drm/kmb: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-21-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ap3y2IZNECtUVtZYAKsVVhheRsMsLVBT+a46r7P8x3M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d2j8i7I5xPLlbCzD3pikJ9sF1cOyGATWnFS8cPfoU
 r9M03nHOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBERFQY65ON1c24ehos1T4Y
 P5ld8skxf7OS+swXc2Pbt285eDTzoWJU3clf/Axb+fy/7jNkjnAxYaxTYzztFHzH98Ah28NW+7w
 e6wtarbJZU36x8JSKwur5b7fMezsn9Pgqvw+9E1bY/xb+GZUDAA==
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

The kmb atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: Edmund Dea <edmund.j.dea@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb5ab4e2cbd71940ef4c147a7aa5ad..9562fe6711ffe2c5ad377e9973fcfdb76bf04daa 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -127,12 +127,11 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 		drm_dbg(&kmb->drm, "Cannot change plane height or width after initial configuration");
 		return -EINVAL;
 	}
 	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state,
-						   new_plane_state->crtc);
+		drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 	return drm_atomic_helper_check_plane_state(new_plane_state,
 						   crtc_state,
 						   DRM_PLANE_NO_SCALING,
 						   DRM_PLANE_NO_SCALING,
 						   can_position, true);

-- 
2.51.0

