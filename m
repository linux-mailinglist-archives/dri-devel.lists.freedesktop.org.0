Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC443B4ABD1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A41810E661;
	Tue,  9 Sep 2025 11:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T60uXWfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D13010E661
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5AD86021F;
 Tue,  9 Sep 2025 11:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37961C4CEF4;
 Tue,  9 Sep 2025 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417298;
 bh=U5snXCML5rwRhIfPdptmhVSbh4f2NxnBRB2vkMoDCMY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=T60uXWfljJRx7Sj8L1Vc+XZkIbiwkVaDrtKNibq0EiwyyH1tv5Aer82wIbRJ74npn
 2m8zjTON5v+SV3vx1uUj+ZJDQGjyVe+tzb7lmk7GpPAQGb+nHTrkpXAdesyrah/kLP
 3U1OsGYAw4bs0eqQynMGputON/zxl8UBdd6F/jzwpCZsTtgweS6QBP9dN9irXfSkvP
 v2XLv70oG2HHxTEw8B2vC4TF7qNfTpBcOCL2G4Vck9u9dbZEPpkhCfqXw0g/0vXhIE
 LNpFl16FG025Iffeq3i4y4sC3nNpOt20ZkXwzDO5jt1PCR6KMKAkhHJs6X0xKAd0cA
 ie1RztXhWKHEQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:29 +0200
Subject: [PATCH v3 10/39] drm/atomic: Convert drm_atomic_get_crtc_state()
 to use new connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-10-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502; i=mripard@kernel.org;
 h=from:subject:message-id; bh=U5snXCML5rwRhIfPdptmhVSbh4f2NxnBRB2vkMoDCMY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+NVWxHqZv7xvueIs0wPlKX5rn3X4nSqZqvq3S8yWe
 d7M2yGdHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiVlMZG/4Vcxw6mq4/Z1P7
 DqbYXoeAGFXvfSJ+5R/X6zuX3emdzMXXsV1JRvPs1R0/5pevmPzUhLE+40pdmYtF22NRjdNnb39
 1qnG1mOTUGRIVlBIeUf57rnPxQnkpQ8lWhR2M6bnTsk1v5wEA
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

The drm_atomic_get_crtc_state() function calls the deprecated
drm_atomic_get_existing_crtc_state() helper to get find if a crtc state
had already been allocated and was part of the given drm_atomic_state.

At the point in time where drm_atomic_get_crtc_state() can be
called (ie, during atomic_check), the existing state is the new state
and drm_atomic_get_existing_crtc_state() can thus be replaced by
drm_atomic_get_new_crtc_state().

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 15584928f06a9175308c3ef8f1ecbe1b33b17f47..435a93c83149e60e4a1bf4310ee5e865242cac7b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -347,11 +347,11 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	int ret, index = drm_crtc_index(crtc);
 	struct drm_crtc_state *crtc_state;
 
 	WARN_ON(!state->acquire_ctx);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (crtc_state)
 		return crtc_state;
 
 	ret = drm_modeset_lock(&crtc->mutex, state->acquire_ctx);
 	if (ret)

-- 
2.50.1

