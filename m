Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D1B3FABE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B888410E63D;
	Tue,  2 Sep 2025 09:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Btn7aMeJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AD810E63D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE95A43D1D;
 Tue,  2 Sep 2025 09:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410F2C4CEF5;
 Tue,  2 Sep 2025 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805810;
 bh=x39gE7qrvsE8HR2e8tj+TmWRFcEoEqzMus0G7u+tgaw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Btn7aMeJBNXg1hawXeVk/MVx0WOJrq4hviJpYrZkHlWmUFN9G4EkH0p3L4OhKmlN0
 LKbba2Nc+SpIkm0BNpR45N1jA0eGgyElfoNVXStkPB0f5W+0xvXzsaKH+VZRQO1Ouo
 Amc1YY8AY0EV8cY0uOOdFbxZQsHNZxLX1XNvLKqszSP/B2Xp4WKQbOIeRh2XSdg2aj
 wmLAd2iOkfGkaARbI0mz+ghyrk+/p5w91l2exdJNvDm2O1M7tZ6FCR5n+hnK4lQgpG
 6lpJhEK/oSJ2Lz7apKEhDCuhaOALqLydWWMzjL7LPCTuxg3D+v7wTZmVT0fv36LSN4
 k+MaeuSFW4fHA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:31 +0200
Subject: [PATCH v2 32/37] drm/atomic: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-32-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=mripard@kernel.org;
 h=from:subject:message-id; bh=x39gE7qrvsE8HR2e8tj+TmWRFcEoEqzMus0G7u+tgaw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkUqTNnQlTRRfM6W7fHpHCJfQswqd1pfqlO4+WVji
 GRSz6mnHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiu48wNkx9dUiW1WrZNydn
 9WWmx2y/HWM8emVb9KstL+8WybRdvdHdH7DqXyf75fwLKzZzKZcJaDDWu12T7Nw+5XbGzwNr3xr
 +ZNgpLHz9zzvNDM7lNiJpT17f/vBg6vy0p4nh9zS+pi+fN7M6EAA=
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

The drm_atomic_connector_check() function uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 435a93c83149e60e4a1bf4310ee5e865242cac7b..d6a53b678e7b52c0852b2e590d8bc041616cb80d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -478,12 +478,12 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 			       connector->base.id, connector->name);
 		return -EINVAL;
 	}
 
 	if (state->crtc)
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-								state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state->state,
+							   state->crtc);
 
 	if (writeback_job->fb && !crtc_state->active) {
 		drm_dbg_atomic(connector->dev,
 			       "[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
 			       connector->base.id, connector->name,

-- 
2.50.1

