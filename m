Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2029BAC95E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBF410E56E;
	Tue, 30 Sep 2025 11:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nEo5kpJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367D10E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 316E944259;
 Tue, 30 Sep 2025 11:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA70CC4CEF7;
 Tue, 30 Sep 2025 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230010;
 bh=s5fxPUrR9nGUSrsW0yyF1l85BFj/JMLiIMEzttpPBaI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nEo5kpJKYddZKx5joClzsYPTxdXMTOiVmhdRlYAxNgrMpiOsWKJZ4ar/9FRTa8qzB
 DgrZXtzi3/S6wMpqHXb+15Cx9CxXog0FtYrzA4iZFYADwIoKe9CzQGDhTn+0T7EFAc
 EjXYEPsADSZnjlWDlbLZy54kdCLAzKUtncZg3z9kEjU0tDk/MuNVYVTQhMTb5gVoy4
 EtXcjqUI0ANTbM/0lmUxPpIxK66WItLvULwpGwqJ0bTIugpzodA14S4NC2gulZBd2n
 TLMn7LYSmTikoXAw5anXNcX1KMLiZ+XZ3S9RdCrzSquuIF6cITxr4/pA1XJYQyN0Jl
 pkzMM+2dBTVEw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:17 +0200
Subject: [PATCH v5 02/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-2-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=mripard@kernel.org;
 h=from:subject:message-id; bh=s5fxPUrR9nGUSrsW0yyF1l85BFj/JMLiIMEzttpPBaI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyg8jbsa+3GBUef3tBV73nQUzvHd1Xfq0DwJj5IVK
 58Wi+ne7pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT6WpmbFhjyTfl7Hrxuzfl
 ykyeVXvvendDect2Jq5tHtcPeZb71D7gKPrf8N3zCXf4osx7KxyuqjE2zKxNnbAoPlD/bkhz5eU
 sZ1eew3872w/cP7HP4F4tz/u+znbebm2hqfklmTMVNK3P59kCAA==
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
2.51.0

