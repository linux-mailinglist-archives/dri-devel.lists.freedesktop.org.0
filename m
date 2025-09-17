Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE0B8033D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B49A10E86D;
	Wed, 17 Sep 2025 14:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ag+nUar3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2A310E870
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5385B4395F;
 Wed, 17 Sep 2025 14:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95EAC4CEFC;
 Wed, 17 Sep 2025 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120430;
 bh=fZ6nQwQ/Aj3XOE8jytaPo2Y1tAwYXtQBT68VYrvL5NE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ag+nUar3fD04tPhg5KCkQN+KKE2qI+TSY6q2E95DCK3tR/l3Tnj65NALswKIz+4b6
 9W+z6lcYf006J915VPwJwCF+qAWAsgxy7x7etVa9aX3mkgmBc0qUYWApK+yX0usz64
 K3dpjUkOVrNR/mM+qUqujp8+j7LaFhK+MF9t1bkbNOBlfzuIoJkuJNisgyYIFBfFiD
 9COA4HeWOlkXOIw9GMFtJMBWQ3v0qaKRCzLVQOrcmKYJu94vz9tW+B+n22O5ns+I6R
 6Q6trQ7T3Z6Sus1dNapZSCrk2mZVbaHR3sVDdEDHs9vIitPLVUMPTTVrRty5E35Y2Q
 5GLGhY/kxn1qw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:02 +0200
Subject: [PATCH v4 21/39] drm/kmb: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-21-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fZ6nQwQ/Aj3XOE8jytaPo2Y1tAwYXtQBT68VYrvL5NE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq7I/SHx/+azr+cEjKZKP1gppeqwK1mtrVv7ywNJr
 mCmNO/VHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiEysZ68y7fZpfJe3bZNly
 nPXnHbVKwyUz+fo99Tdqy5zu1T62pOCw8K4T3W9KNEONDqfot0QfYawVV18t7Rt8NmLz2fkxT4S
 fcTQx6p4JvxV1RsC04vf+C75Si98Vufm3u7yL1Ln4boe10REA
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
2.50.1

