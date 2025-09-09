Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A3BB4ABC6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114310E6A9;
	Tue,  9 Sep 2025 11:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="etbuzFGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C4910E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:27:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8809660224;
 Tue,  9 Sep 2025 11:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02DCC4CEFA;
 Tue,  9 Sep 2025 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417276;
 bh=nppOwUaIquC4uQ/ndMXPWtPrvVZ6uHPTHc+84Kp3MqA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=etbuzFGFATVrK9om98P0okTZb7LlAPqH+Zm9bc1mkk/cHQNdhRj2JzBT8SE6Fp3r+
 nT460P9G/NDvm09HQ1rpJG3rPkl7ptjf1jMMnuizAoUj7Q/xV/vZo/4eqU5ojWpRPI
 KZSBZ1mZzQv4bYDoM8J6DhKZ/lnmF7up296YnK93EJ3dVD45tKR2xzu0P3Ir5WtPRc
 qNOWgpe4q7Nu/09D9Yq5G4MKj6eESMGqOKoJg1je5n8pnEtHTP8hbs3/2e/vBZZG6n
 P4CW9OzPXWmPm9EZiA159pP12XI562+QIlOHDKHRO2FQQtzgDXEtd5hGU5gbXGW95K
 +Rn72elAViFqA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:21 +0200
Subject: [PATCH v3 02/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-2-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+JW+xEzcuPVH/pJanmdnyq7Mdd38mTXyds3Na++Yc
 0xF1nK2dkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlCxlrOE6dM1aTeabZVid
 6tndDPOFTFkd17zsY7Besafn3jleIw6Fe4tWPFkTq28ZPDVxxuufrxjrzPaWXEgxea6p/2ue8Qc
 Dp2USx4Vfbf54OEi39c8J+Uv8p9iLZQ/kWnw2PLQqaYVm9Cs7AA==
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

