Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0FBAC9EE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B456D10E590;
	Tue, 30 Sep 2025 11:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ElCDpCCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507D010E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3797541667;
 Tue, 30 Sep 2025 11:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1898C4CEF0;
 Tue, 30 Sep 2025 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230115;
 bh=cEXWQ8N+WNUvOLNbTD1rOBz6DZkXDjuyvCilMBSAFd4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ElCDpCCMLU3qj3qqUh/jm1mp2zoCXb2j4z1v1NMsQhTG/dPP1clwwyfvQFuOEvFGq
 PyiZ43HlnQy6W6FGFbkUfdnU2IMVn4R5U38MwEzxnpW5zHE8d9c0Cqr+JxK1TEsPq4
 naL4eZo330F9dLfxb9L32u3BNgXivpKCAjkv8aFGxhmeDM9uZCtAFaK4muZiew03xR
 TLvQT/8lCYEc84P13dJs9SDt1LXZVufd8N5Pjm5lkgd71uvPYyVx2iAtkOD3j/L1CP
 yHC7GWMwmW9OQ0xB0L3BnpW70nP8NTtde8A0YcwqNah+PVK2/yWETr8qDBA8+90Do0
 C24rNa5XDwfQw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:53 +0200
Subject: [PATCH v5 38/39] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-38-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cEXWQ8N+WNUvOLNbTD1rOBz6DZkXDjuyvCilMBSAFd4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dxjIzy94ULqBe9nNxg7Hn64T0thnLok5/2Z7OCOb9
 sLypo1LOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE9A8w1gcLR7MtNs/Lv+81
 ffNLP2UOv0I3V1GDUx/dTSrnl91nlm5y5d9dM0//8eNm2z7GBpYDjA1fl7Na/ucIybd+sTXmh9t
 uP/bkiXm5It1lj3u93zLsX3B06wlx61U+04uvNxuW8LOI6wMA
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
2.51.0

