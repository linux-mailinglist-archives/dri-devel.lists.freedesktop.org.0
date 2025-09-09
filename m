Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A972B4ABD6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E70B10E6AC;
	Tue,  9 Sep 2025 11:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f2lXXLLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75F10E6AC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 299AB60224;
 Tue,  9 Sep 2025 11:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F9DC4CEF5;
 Tue,  9 Sep 2025 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417306;
 bh=LWMwWgxlSuTtSuOURzT1TA64RCWbQgjSTT2NJkNWunA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=f2lXXLLV9vWnyyKo33F+yGZkMmucOVKKkTOoh/h806DGEaWQEm6lXNQ+U/1ur/quE
 74o05+xW/uuXfpIXVjInTv3aAfegS5jDIvcLp6Zy2gOWGEF15DB1UdivHxuPQjnT6p
 Uixehl9wN7XMBsbCrnXkSI4AD56nyV2DETJXJ3EZxvXdyhUjSHNISbYLOKiHNF+R1I
 pT5UgO+mSUBnJNO5n3eQAIKv15ukBcD+iVtaWb6YWuYkDgxuGa5mwNIJ9MxC0dkqkR
 iwA+TUqi9yXI8AYKz5Woas3QiTw997CymhI+nYtsWfqiIGkyb711xscnkWGzDzzf8e
 cZdf0itgktHAA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:32 +0200
Subject: [PATCH v3 13/39] drm/armada: Drop always true condition in
 atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-13-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LWMwWgxlSuTtSuOURzT1TA64RCWbQgjSTT2NJkNWunA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+NXnFJ1UkT627kfUzcTJfYUcS/M7ui6x2jRmTe3fN
 WPtY7v0jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR/1cZ612q/umrezs1ndNL
 Fw06+vD1z+3X3n/Mcz8jaX1MPuDzV3bRzwnC5VsZpzpF/tH4puYoythwesWCyJbbLAdV8tiX7VO
 tvWxxU/xg8tbsdcsOOngdrrXZaMR49knnHl+Zs2IH4y4rnP8DAA==
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

The drm_atomic_state pointer passed to atomic_check is always valid, so
checking if it's NULL or not is pointless. Remove the check.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_plane.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index cc47c032dbc151a463cbd0b0d048c74c2828f253..976b6a271c912421e3fec7525f77234e73a74212 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -83,25 +83,20 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct armada_plane_state *st = to_armada_plane_state(new_plane_state);
 	struct drm_crtc *crtc = new_plane_state->crtc;
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_existing_crtc_state(state, crtc);
 	bool interlace;
 	int ret;
 
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
 		new_plane_state->visible = false;
 		return 0;
 	}
 
-	if (state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								crtc);
-	else
-		crtc_state = crtc->state;
-
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  0,
 						  INT_MAX, true, false);
 	if (ret)
 		return ret;

-- 
2.50.1

