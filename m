Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBEB4ABF2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0722F10E6C3;
	Tue,  9 Sep 2025 11:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kmj1761g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7299B10E6C1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E533A60226;
 Tue,  9 Sep 2025 11:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C51BC4CEF5;
 Tue,  9 Sep 2025 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417356;
 bh=aTNFnaeJg1Fx40MqwJxUkU2NDzyQ/3OknzeF6+I1Eog=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kmj1761gPenlIVugiCTQoPqiwgD7gvsVH6ojy2lwDn6PJ2DGoeXrVLYN8nAKsQozR
 DKbi9J/bS/dz8E0d1dg8k4gs0j3x3vwQb5cVc3/5xfejalfZ1KZVRKmXwU623Mjrtf
 kDpPc3tjquaDNgCNj9Bl/mcBwYUCviWCUGoej/oDqa5ri/ZwABPG4Fajw4YNgrDAdz
 xAjO9Ms8n3TLmskIVFrtfxsA+G0W2vAmB2imUczlpcgK0uJdtUxdapHlV1ZX1K5dzR
 yjZqmabBlhYI/naybph1Jdpu7SIW5ugEanA54xaxPhzgv5yqUPuLqwWm5GVJbMwS/a
 q63c+By5qcxgQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:50 +0200
Subject: [PATCH v3 31/39] drm/vboxvideo: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-31-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aTNFnaeJg1Fx40MqwJxUkU2NDzyQ/3OknzeF6+I1Eog=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+PXFpgYkKx+qXPZF4HRdTX/c53vT2t+56K9kYCs+I
 Jp86XlCx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIsR7Ghl0KkWWKa8Rk7djX
 vb6gYCfka6AXwWizpt3vTKwgoz1rUqJC/Srnb8zrIptqxVpXf9nFWF/RnP1XdYlK1mnVqWsftu/
 85J0x81eXh+cMq0Nl8dWX0tMfVK54tmfXw/2yS5hkRc9NsgQA
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

The vboxvideo atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Hans de Goede <hansg@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 9ff3bade979577df0bc2e6e9653b3fb8fd486062..aa0dded595b6e00a9aa2027b36ca11711ccc0439 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -260,12 +260,12 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
 
 	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
@@ -342,12 +342,12 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
 	u32 width = new_state->crtc_w;
 	u32 height = new_state->crtc_h;
 	int ret;
 
 	if (new_state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								new_state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state,
+							   new_state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 	}
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,

-- 
2.50.1

