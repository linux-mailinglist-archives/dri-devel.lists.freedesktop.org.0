Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9268AB3FABC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C530B10E633;
	Tue,  2 Sep 2025 09:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kQTliF1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996A410E633
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 81744401B4;
 Tue,  2 Sep 2025 09:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B13C4CEF7;
 Tue,  2 Sep 2025 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805805;
 bh=vxH+nzeCsbFnxXQGIGvhfJGZy++l91+CQmtXEk/gT1I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kQTliF1T61XVmzBdI6BupUxAe8Z38z8KtJBBV4U7jwtbtUBVNDy+kqtZ9dOKOGf5e
 jWaJAUXCS3JPE7Z0ax8vUgw413cQEncKKoRIpF9SlzjLh99b/MukgggdAdr4NXxu/i
 rd7cYf0Ate0rom3jjtlr1/NqIpK9Q7idJ0/8UEy0cvO/92TJC/MHUQr0Dg+FycyNI+
 lpIggL2Z4WJhraf/n5XY3w96D5QYNVEFqRyS4uxHeQpOuRjgqfxzbHz4NbmQK4NB6p
 cqHmKnoui+4kiEEshRu5STvy7npYA44p4cLBxFgwI/fX9zWEc5DDfHF4EwfvdTI37R
 GT5morD1fpsWQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:29 +0200
Subject: [PATCH v2 30/37] drm/vboxvideo: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-30-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vxH+nzeCsbFnxXQGIGvhfJGZy++l91+CQmtXEk/gT1I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkXsOdf6W1T6i4mTpEtUQJaPOv+e5vgnhcH6mZpyl
 8zdXN93TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIlsO8tYZ3c59uVPk6lNXbeE
 Vezu/vd+b8Mj8FegmFUmuPhf/OHMb2Kzu5IV2lp4T0/rmH+NyVuGsaEvcvnGpLMTj016OmlruXp
 J/oe9YhlV7AvZt7vwddz3cL5zll3vWqGSRtpHx0tFNszPJAA=
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

The vboxvideo atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Hans de Goede <hansg@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 9ff3bade979577df0bc2e6e9653b3fb8fd486062..aa0dded595b6e00a9aa2027b36ca11711ccc0439 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -260,12 +260,12 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
 
 	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
@@ -342,12 +342,12 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
 	u32 width = new_state->crtc_w;
 	u32 height = new_state->crtc_h;
 	int ret;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,

-- 
2.50.1

