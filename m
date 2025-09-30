Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83548BAC9F1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A31110E593;
	Tue, 30 Sep 2025 11:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aCz/ntCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C7B10E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CEE334188C;
 Tue, 30 Sep 2025 11:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51720C4CEF7;
 Tue, 30 Sep 2025 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230094;
 bh=Z1ZeG2J7StVPzEr1tSZDjhMdLJlR78VCc7Hk4x9ndJ8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aCz/ntCJNoGA8th1hhOsF2TLeSFYuRz3e0h7VaB+pSm0eLaf0lNcPaX/m26ZdHNyZ
 2HZbtvm21H0CQ11tVFFDz9/0ll15lfyqnthiLRnSEXvbwZYOhd9WoXCxVqICk0Lcns
 jMYegfzEN1FyBx7KDuEEO3P9Gxs9y4pgAucKiJNQaWj7hyGKOWDN/XFs4XqAOHsW6W
 DrXt+AF9A2TlXrn6ayOHrggd2sFyoVw864g8QyEe//KYsXfRCWSfPML2T+ZDHZldKG
 qw/aePF+xglOwkyuTzE3kwdplwSwT4YcR0pav2geIzJAASET2PQx84flX/4eL+ucGy
 GVZG5fqO/jrOA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:46 +0200
Subject: [PATCH v5 31/39] drm/vboxvideo: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-31-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Z1ZeG2J7StVPzEr1tSZDjhMdLJlR78VCc7Hk4x9ndJ8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d+jKbW9p28AneGHyJl85rac3PiVt46jb2HFi7dvyj
 18PijvzdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJqAkyNsxbtqejnHWr47fl
 DRKfV3zpjLGedCfs5Q7GY90XD/v+tIxaIpt4LffdtogOHv5rBRI5Sxgbtl3wPbKhJHFP0BG5N8F
 au5zvXZz95MfFjXvly9hKz92/29evGHDlXph5oJei817jHpmXAA==
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
2.51.0

