Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BA0BAC9F4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BCF10E591;
	Tue, 30 Sep 2025 11:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sCG72DN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FDF10E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F7FB604C3;
 Tue, 30 Sep 2025 11:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E225C19421;
 Tue, 30 Sep 2025 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230117;
 bh=bzKM8UtWYEfCYaSZYBJsPap0TBy4LZi4M3BT9ocKuQs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sCG72DN1KDg/4/daam06+F7nd5oaCiPOdvFubcW2arEI4+PRCBgVVpTZLE02k+JPb
 WUu5QGALHERFREGZVdhvaa0vBJ9azHNNg5aXoCEzvI6OTBSZvWjG4n8axl3tyiKxO5
 cYDSSzAmQGZFhMuGOKpIueL7xbql0RufqUqnage9S8v7P5j0f+1PAHtdH/eiIoGqex
 gv0NNfdYmJBLA160tUpmbaK96Vta7bXjb7Yngc6JFaaYG7Hqh2o0caNaI6YA7dFi15
 KIc8hIM+GJGBJKXPVCHtCzYe4LpSCesqtPHoyvHCSL3GpvQ+ymC9OUCEJiSJHsh770
 y+ZPZVLdJ9ndA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:54 +0200
Subject: [PATCH v5 39/39] drm/atomic: Document __drm_private_objs_state
 state pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-39-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bzKM8UtWYEfCYaSZYBJsPap0TBy4LZi4M3BT9ocKuQs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dxiUPTxR/mrGsZC+vX+OnzjYuEjXtuLKX3O19IDLB
 91Odgrf65jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATWXOcsWF2plF34A7Z3X1F
 73/wRAoyT/Lna9k27XhcumGYTaFZwR6LPon8kKajmx70M6ik1d2/wdjQf4v1iuw2hYxHTI02yl6
 hf/U2fPdZ5bSncuWkzA9mqzxlk1UPpjI1uIl+bMjwP+ohVQkA
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

While the old and new state pointers are somewhat self-explanatory, the
state pointer and its relation to the other two really isn't.

Now that we've cleaned up everything and it isn't used in any
modesetting path, we can document what it's still useful for: to free
the right state when we free the global state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 6b634b7474900d0d2bc51bd645ccedf718a1cb02..c8ab2163bf658cd06b12a8dabada7c088a328654 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -389,11 +389,27 @@ struct drm_private_state {
 	struct drm_private_obj *obj;
 };
 
 struct __drm_private_objs_state {
 	struct drm_private_obj *ptr;
-	struct drm_private_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_private_state we will need to free
+	 * when tearing down the associated &drm_atomic_state in
+	 * $drm_mode_config_funcs.atomic_state_clear or
+	 * drm_atomic_state_default_clear().
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_private_state *state;
+
+	struct drm_private_state *old_state, *new_state;
 };
 
 /**
  * struct drm_atomic_state - Atomic commit structure
  *

-- 
2.51.0

