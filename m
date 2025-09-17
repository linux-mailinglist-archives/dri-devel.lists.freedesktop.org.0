Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E371B803A5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5044110E87F;
	Wed, 17 Sep 2025 14:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UiNnzMxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C83A10E88A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 34F0944087;
 Wed, 17 Sep 2025 14:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C8BC4CEE7;
 Wed, 17 Sep 2025 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120478;
 bh=waVGEXJV6pf+Zx1gbOBpgiakDJ7zc18IhinVqlLSylk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UiNnzMxorFv4Ihzi0HXpQKoFO6ITBE8rTMc05TMXpC37dktC2364Tt2Al6j5mLXXF
 KpwcPVF0oAltWQdtLz5eshOnHcIo1MQDEvR0ihzRg9AW2dpG03rsdwd9lHRgff92/U
 t1Mf9mG1BdaKSFh0hLx5ZtmEm5c+oeIDCM8nJigp8av+yhCuqqu4oPIU29eK53dLNY
 UH4k2bU3ow8FDW84YqwnQJrM8yeMpCJb1Bj44aqb0i7dXftcMQxmHn5cr5JWSDVHI2
 waiTCTIUjMbhXD2SeGDsqK5E/ydNSFxZIxOTznSSDacguOhc72UU90PC5vNzMWIIlh
 ANB746ZiVePkQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:19 +0200
Subject: [PATCH v4 38/39] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-38-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=mripard@kernel.org;
 h=from:subject:message-id; bh=waVGEXJV6pf+Zx1gbOBpgiakDJ7zc18IhinVqlLSylk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTm4Qf6Lmq27j1vl3c8/COZ9DG0xuGDuxdh4pdIxid
 s0WdH/XMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbikcFY7/H8a3lSz+V31mkr
 TRLPMO5M/6jB+zOhrn/O/k+KH72vSR4uPi7LsP/wx//Wv9bFM92MY6wzCJEpmvvivmrSEt/Q/jj
 h4ILWjGjOnQynxb1XKHjYTTGTWxF45NV/Ne/Qj4vNbA20MgA=
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

