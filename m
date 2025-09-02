Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCEB3FA8A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A372310E61F;
	Tue,  2 Sep 2025 09:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AUH7YYO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103CD10E61F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CB5E6020C;
 Tue,  2 Sep 2025 09:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D56C4CEF8;
 Tue,  2 Sep 2025 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805732;
 bh=JNCew2TjuNCGdYEhtSD+0+LKdo9PaIAw7oXU6uRh7MY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AUH7YYO85Uz9WDCXRxTNTEFSnAmzaiPIBygcbTbRkoyUNUA+Pp/2YoPI3+EdbAf+7
 LY+9JpqzREqY38cs/4tVR6Ni/gLxoxlejuxiMVIuhmawLdPHZC6GI3+JZI6v0HKHbQ
 pqetcG1prKkeStVuXV4ZAYwy4xBn6XHvFBtmPDuFap2cLVPxp876+Fn/H7jzc7fbvc
 RSAixogRSN01UaP8SxKBckIb9E6/exPORc0aHrKrQXc3+43lElRWrGdcC9zwDHitTO
 +TljyeOxcQk06s0oVWtarWQO1FSrJIyb7pS39eD2/iG6Een5LZxkg3m5+AyyLhXuaz
 MOf8Q538AyCKQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:01 +0200
Subject: [PATCH v2 02/37] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-2-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JNCew2TjuNCGdYEhtSD+0+LKdo9PaIAw7oXU6uRh7MY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdvmc0s2by+Jx6/dSsZrLaZFhL6eeYbrAKX30SOGdh
 Q/DG1RDOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEbrxibPj0TUMofZ3snodf
 D5xhavPVfHLiZpeSWvTCBWbRD+e7KnAwt/RUb04IW1LFfHbHLvm6Y4x11l+rJSJKJm4ycVjzatG
 iwvtTvgTmK51qfBrzSi3A7IFpsnbFeZufjCv4f88ydFkwu+IrAA==
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

