Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D721BB3FAC3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB06010E641;
	Tue,  2 Sep 2025 09:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SsjCBTiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A13B10E641
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:37:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60E5B60206;
 Tue,  2 Sep 2025 09:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD57C4CEED;
 Tue,  2 Sep 2025 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805821;
 bh=wEEtAsp+QLXBA6Tnr+TtPzBIiNw7OL9zplaHi+CdUw0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SsjCBTiImSLYQvhTWU4ol6nBBSVXSf39oyeJtp/l/izVBdY4YlZyTuXzrJTFVLFqR
 sHudXz9XheyXrTWyp2uxQcwv6RAntNM0R9D27wC+id/226gvH+vUgipPV3yUGZxMJn
 Sij0XhtileOZ+mf1L0kS6qGivGbyDHVJq8rRFWv8XZzqFwfZlFXoarEKUN4Q17cl4t
 9qxZ6+jl6ZAXgiaSEm7aai/ycDvlLFjTwN9ZEsEpymYAc5JulAhz65t/9Z6MbtzO0l
 eIL0fZT+8IbsIMTb7D7z08au7JhEPBt5FnTbgdCwp1nqHkGo8bYfm47JsTTECSHjRA
 W4WBkqB5pZwbA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:35 +0200
Subject: [PATCH v2 36/37] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-36-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wEEtAsp+QLXBA6Tnr+TtPzBIiNw7OL9zplaHi+CdUw0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkVnG3bVHjeb1ZT8iOfa/k9JX+fmFAvuv9T5e/XWg
 tRFdiVuHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiSV8ZG/bstvaaUyionKz9
 b79Hzp7u8o+Pf+bv8Ltm87ZvwwuFS6Lnbu+dYX9LM8Z9QVXH5qJ0EcYa7ssBGzdevirjud/VY2e
 xaHKlkZJhyaRPrNmPJz+fpnkn9Jfy0htJvnOWr8gs8j7VHfAbAA==
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

The drm_atomic_get_private_obj_state() function tries to find if a
private_obj had already been allocated and was part of the given
drm_atomic_state. If one is found, it returns the existing state
pointer.

At the point in time where drm_atomic_get_private_obj_state() can be
called (ie, during atomic_check), the existing state is the new state
and we can thus replace the hand-crafted logic by a call to
drm_atomic_get_new_private_obj_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d6a53b678e7b52c0852b2e590d8bc041616cb80d..754981ead01ffa27434be55079e9f967eb576be5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -829,18 +829,18 @@ EXPORT_SYMBOL(drm_atomic_private_obj_fini);
  */
 struct drm_private_state *
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 				 struct drm_private_obj *obj)
 {
-	int index, num_objs, i, ret;
+	int index, num_objs, ret;
 	size_t size;
 	struct __drm_private_objs_state *arr;
 	struct drm_private_state *obj_state;
 
-	for (i = 0; i < state->num_private_objs; i++)
-		if (obj == state->private_objs[i].ptr)
-			return state->private_objs[i].state;
+	obj_state = drm_atomic_get_new_private_obj_state(state, obj);
+	if (obj_state)
+		return obj_state;
 
 	ret = drm_modeset_lock(&obj->lock, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.50.1

