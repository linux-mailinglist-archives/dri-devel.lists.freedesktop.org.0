Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C552AB802E1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E1E10E85E;
	Wed, 17 Sep 2025 14:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gCsq6dTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602E210E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4802244AD6;
 Wed, 17 Sep 2025 14:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8572C4CEF7;
 Wed, 17 Sep 2025 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120377;
 bh=nppOwUaIquC4uQ/ndMXPWtPrvVZ6uHPTHc+84Kp3MqA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gCsq6dTs585tsSo+Uyx0DOi4J93pyLcaKG91AaOgnQd/adbhW+QkTeiV5KoLN2w6x
 sWQewZU2ag4GmlACRCq8HgbSodBlYekFkIHB6PDJ0REgYfoRstimcZ81UFCNDvw6d5
 azY+vFKdxkdDVykY/5/UXXSyZpAwocM5H93L6rYEZeh3ECNWlyABQnqnlI1396FlS3
 a706u/LcQuNfz6JbS0CCqh41PKiff9Ey942Wv4/McSGRmrW/oEitO7yMfgds9qQ8/x
 s854RbL+YnGBbHARafqZ6J39K5w/ai0Qb55biCMYdh1rhVbCa9ALRkwR43X3bFakzO
 HRW3IFAgbE6Yg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:43 +0200
Subject: [PATCH v4 02/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-2-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nppOwUaIquC4uQ/ndMXPWtPrvVZ6uHPTHc+84Kp3MqA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi5Q5Zt0KNtdSeR24nu5kuJjBRslJdfdk3JcunKxn
 v/vess1HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiMq8Zq9nmxqqmaZtczr61
 16KQa699yQ1/58nWxzqWmjBe5U+dvvCbwt9z1TU+4Vc/B3S/jLhygbGh5c8Lwxl6G70Wzz6Z6zz
 jcqV014cH0jMb6woZz/zul7c7f/BAsl5N9KUTTxYGf/tcXegLAA==
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

The drm_atomic_get_existing_connector_state() function is deprecated and
isn't used anymore, so let's remove it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..321c866d5b0a46df7a9adbbf5e4cabd1ff987aad 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -729,33 +729,10 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
 			       struct drm_plane *plane)
 {
 	return state->planes[drm_plane_index(plane)].new_state;
 }
 
-/**
- * drm_atomic_get_existing_connector_state - get connector state, if it exists
- * @state: global atomic state object
- * @connector: connector to grab
- *
- * This function returns the connector state for the given connector,
- * or NULL if the connector is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_connector_state or
- * @drm_atomic_get_new_connector_state should be used instead.
- */
-static inline struct drm_connector_state *
-drm_atomic_get_existing_connector_state(const struct drm_atomic_state *state,
-					struct drm_connector *connector)
-{
-	int index = drm_connector_index(connector);
-
-	if (index >= state->num_connector)
-		return NULL;
-
-	return state->connectors[index].state;
-}
-
 /**
  * drm_atomic_get_old_connector_state - get connector state, if it exists
  * @state: global atomic state object
  * @connector: connector to grab
  *

-- 
2.50.1

