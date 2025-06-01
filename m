Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347AACA338
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC7C10E4A0;
	Sun,  1 Jun 2025 23:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JHiA3ept";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303E710E4A4;
 Sun,  1 Jun 2025 23:44:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16D3243544;
 Sun,  1 Jun 2025 23:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA673C4CEF2;
 Sun,  1 Jun 2025 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821459;
 bh=gwnCW4wrQlcLzSZbrVYpf9FxhFsi+UyUOtlSvcR0UAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JHiA3eptL8KJ8N8pzE+kqCoEo/WO1Uv5J7JRQZNU7D5HNfiQz1L7jEPr5qd+9Lfhi
 TuES2H4r34rTL33eqGK8d3h1Gwu06r/6qG8m/RwSySpYtgaPbnfTTz87v3LZfFkyAW
 m9ECALbnfQnWON8xNnL70Ir0ZRaVD1tOFULyANjDgVJZsgY5G/oVxsdLDEPYPpwfJS
 1A/ZOjg+wcvx3dM71cy0/SAqOYU9k/HbGgGJjgHBnBC/uKmB9geRMmQXFpGDawY6nX
 FFBbVSIy2OR3e3m29qc+6kEeaSGiHmo9OGXirOxi+N+I+NeyreG53NiOd51fUy0y1a
 ldwfHSJw4wuog==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Roman Li <roman.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, mario.limonciello@amd.com, Wayne.Lin@amd.com,
 dominik.kaszewski@amd.com, mwen@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/34] drm/amd/display: Add NULL pointer checks
 in dm_force_atomic_commit()
Date: Sun,  1 Jun 2025 19:43:32 -0400
Message-Id: <20250601234359.3518595-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234359.3518595-1-sashal@kernel.org>
References: <20250601234359.3518595-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit 3f397cd203f247879c2f1a061e90d4c8d23655de ]

This commit updates the dm_force_atomic_commit function to replace the
usage of PTR_ERR_OR_ZERO with IS_ERR for checking error states after
retrieving the Connector (drm_atomic_get_connector_state), CRTC
(drm_atomic_get_crtc_state), and Plane (drm_atomic_get_plane_state)
states.

The function utilized PTR_ERR_OR_ZERO for error checking. However, this
approach is inappropriate in this context because the respective
functions do not return NULL; they return pointers that encode errors.

This change ensures that error pointers are properly checked using
IS_ERR before attempting to dereference.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, here's my assessment: **YES** This commit should
be backported to stable kernel trees. Here's my detailed analysis: ##
Commit Analysis **1. Bug Fix Nature:** This commit fixes a clear
programming error where `PTR_ERR_OR_ZERO()` was incorrectly used to
check error pointers returned by `drm_atomic_get_connector_state()`,
`drm_atomic_get_crtc_state()`, and `drm_atomic_get_plane_state()`. The
commit message clearly states these functions "do not return NULL; they
return pointers that encode errors." **2. Specific Code Issues Fixed:**
- **Before:** Used `PTR_ERR_OR_ZERO(conn_state)` which is inappropriate
since these functions never return NULL - **After:** Uses
`IS_ERR(conn_state)` followed by `PTR_ERR(conn_state)` which is the
correct pattern for error pointer checking **3. Comparison with Similar
Commits:** Looking at the provided examples, this commit closely matches
**Similar Commit #4 (Status: YES)** which also: - Adds null pointer
checks for proper error handling - Fixes potential crashes from
dereferencing error pointers - Is a small, contained bug fix - Addresses
static analysis findings (Coverity-style issues) **4. Risk Assessment:**
- **Low Risk:** The change is minimal and only affects error handling
paths - **No Architectural Changes:** This is purely a bug fix with no
feature additions - **Contained Impact:** Only affects the
`dm_force_atomic_commit()` function in AMD display driver - **Improves
Stability:** Prevents potential kernel crashes from dereferencing error
pointers **5. Stable Tree Criteria Met:** - ✅ Fixes an important bug
(potential crash) - ✅ Small and contained change - ✅ No new features
introduced - ✅ Minimal regression risk - ✅ Clear fix for incorrect API
usage **6. Critical System Impact:** The DRM subsystem is critical for
display functionality, and improper error handling in atomic commits
could lead to: - Kernel oops/crashes during display mode changes -
System instability during hotplug events - Potential security
implications from dereferencing invalid pointers The fix ensures proper
error propagation in the display driver's atomic commit path, which is
essential for system stability.

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 260133562db53..45420968e5f12 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8098,16 +8098,20 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
 	 */
 	conn_state = drm_atomic_get_connector_state(state, connector);
 
-	ret = PTR_ERR_OR_ZERO(conn_state);
-	if (ret)
+	/* Check for error in getting connector state */
+	if (IS_ERR(conn_state)) {
+		ret = PTR_ERR(conn_state);
 		goto out;
+	}
 
 	/* Attach crtc to drm_atomic_state*/
 	crtc_state = drm_atomic_get_crtc_state(state, &disconnected_acrtc->base);
 
-	ret = PTR_ERR_OR_ZERO(crtc_state);
-	if (ret)
+	/* Check for error in getting crtc state */
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
 		goto out;
+	}
 
 	/* force a restore */
 	crtc_state->mode_changed = true;
@@ -8115,9 +8119,11 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
 	/* Attach plane to drm_atomic_state */
 	plane_state = drm_atomic_get_plane_state(state, plane);
 
-	ret = PTR_ERR_OR_ZERO(plane_state);
-	if (ret)
+	/* Check for error in getting plane state */
+	if (IS_ERR(plane_state)) {
+		ret = PTR_ERR(plane_state);
 		goto out;
+	}
 
 	/* Call commit internally with the state we just constructed */
 	ret = drm_atomic_commit(state);
-- 
2.39.5

