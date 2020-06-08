Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C42D1F2304
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10FE89CB5;
	Mon,  8 Jun 2020 23:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0776E0DC;
 Mon,  8 Jun 2020 23:12:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1701F20E65;
 Mon,  8 Jun 2020 23:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657973;
 bh=AN4+Ouy4r6PuoweN6SQVEtPsqTvyyPgIEM8Ru3zOnRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o0TNMQPoh9l8kGsYn5opGuftNojJa322vh4xd112QfsOfX8eCHE6/lzT7qp6nX89+
 rEJa3Ldx4WA9TzhFbUa5FkesN0T1qNhoZpeqMdn3wPXOTFsYtUBiFYiiXnTQfjQPPk
 0/vOrjf0K6Yncg371bZnvtIImgx/xD5r14WaWOfg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 035/606] drm/amd/display: add basic atomic check
 for cursor plane
Date: Mon,  8 Jun 2020 19:02:40 -0400
Message-Id: <20200608231211.3363633-35-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Roman Gilg <subdiff@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

commit 626bf90fe03fa080d8df06bb0397c95c53ae8e27 upstream.

This patch adds a basic cursor check when an atomic test-only commit is
performed. The position and size of the cursor plane is checked.

This should fix user-space relying on atomic checks to assign buffers to
planes.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reported-by: Roman Gilg <subdiff@gmail.com>
References: https://github.com/emersion/libliftoff/issues/46
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <hwentlan@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8136a58deb39..5e27a67fbc58 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7716,6 +7716,7 @@ static int dm_update_plane_state(struct dc *dc,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
 	struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
+	struct amdgpu_crtc *new_acrtc;
 	bool needs_reset;
 	int ret = 0;
 
@@ -7725,9 +7726,30 @@ static int dm_update_plane_state(struct dc *dc,
 	dm_new_plane_state = to_dm_plane_state(new_plane_state);
 	dm_old_plane_state = to_dm_plane_state(old_plane_state);
 
-	/*TODO Implement atomic check for cursor plane */
-	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+	/*TODO Implement better atomic check for cursor plane */
+	if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+		if (!enable || !new_plane_crtc ||
+			drm_atomic_plane_disabling(plane->state, new_plane_state))
+			return 0;
+
+		new_acrtc = to_amdgpu_crtc(new_plane_crtc);
+
+		if ((new_plane_state->crtc_w > new_acrtc->max_cursor_width) ||
+			(new_plane_state->crtc_h > new_acrtc->max_cursor_height)) {
+			DRM_DEBUG_ATOMIC("Bad cursor size %d x %d\n",
+							 new_plane_state->crtc_w, new_plane_state->crtc_h);
+			return -EINVAL;
+		}
+
+		if (new_plane_state->crtc_x <= -new_acrtc->max_cursor_width ||
+			new_plane_state->crtc_y <= -new_acrtc->max_cursor_height) {
+			DRM_DEBUG_ATOMIC("Bad cursor position %d, %d\n",
+							 new_plane_state->crtc_x, new_plane_state->crtc_y);
+			return -EINVAL;
+		}
+
 		return 0;
+	}
 
 	needs_reset = should_reset_plane(state, plane, old_plane_state,
 					 new_plane_state);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
