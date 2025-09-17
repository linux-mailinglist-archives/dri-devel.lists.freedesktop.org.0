Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF1B802EA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7F510E862;
	Wed, 17 Sep 2025 14:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qc2EiSFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856B110E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 052A7601ED;
 Wed, 17 Sep 2025 14:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F155C4CEFC;
 Wed, 17 Sep 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120385;
 bh=PF67gsndI/Frtyluuct2FbckNLFWivVOcfenaZN0Otw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qc2EiSFMBLHYSDoGU/dywCawNwABoZ1tfvEi/c5V71RHIam3a5fWqvkxrFyhApcX8
 oULyot7Omjbs2F7L9+xmub1zFUgg+NcH+GwgH1MKjtvqY6cik0CNMrhjydauVWhZAD
 +oK6ItuLG2lPQh8I2oE8c9y8ct9cRmHtkmJNOXeQLrm/fIIu9beJmjhQB1HgO12Mus
 gbEpswTgLfRv8jiBJbTDnmM3pE4sBEXL9t13OpPZ2HThgzle6wcTG13RJ/6BJMG5T7
 U6sHSk2fxSiqWGuGrjyqLHiNJBv3hzrm0gpAbcQLwsE9+vC36snlwWIWMLkVybX3th
 KrNhSKVAznp0w==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:46 +0200
Subject: [PATCH v4 05/39] drm/atomic: Convert drm_atomic_get_plane_state()
 to use new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-5-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PF67gsndI/Frtyluuct2FbckNLFWivVOcfenaZN0Otw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi50VJ9/3urLFN2ZW6Y+3C60MuWcgwtj7nSBjKPC/
 7WvVRuFdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ5C1irJUXvLXg98t357uZ
 RF8t21KaF9HsPIefeU7rRQvGCq6aHcl+9/4mBfSmh265Vh94o3zRE8Z6X7aD/2PfKr9ReOljbrp
 K7fuN43Z3TrPd8n0ua9GnGKUlvthmy7ytkdH7Z8ouyr1npfACAA==
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

The drm_atomic_get_plane_state() function calls the deprecated
drm_atomic_get_existing_plane_state() helper to get find if a plane
state had already been allocated and was part of the given
drm_atomic_state.

At the point in time where drm_atomic_get_plane_state() can be called
(ie, during atomic_check), the existing state is the new state and
drm_atomic_get_existing_plane_state() can thus be replaced by
drm_atomic_get_new_plane_state().

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6d10a3e40b00c58030e4dc9fdf47bd252cac0189..15584928f06a9175308c3ef8f1ecbe1b33b17f47 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -532,11 +532,11 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 	/* the legacy pointers should never be set */
 	WARN_ON(plane->fb);
 	WARN_ON(plane->old_fb);
 	WARN_ON(plane->crtc);
 
-	plane_state = drm_atomic_get_existing_plane_state(state, plane);
+	plane_state = drm_atomic_get_new_plane_state(state, plane);
 	if (plane_state)
 		return plane_state;
 
 	ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
 	if (ret)

-- 
2.50.1

