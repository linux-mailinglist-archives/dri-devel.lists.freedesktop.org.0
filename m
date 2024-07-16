Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F693287D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ED510E73D;
	Tue, 16 Jul 2024 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YMpbDqEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3722210E739;
 Tue, 16 Jul 2024 14:27:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9BB01CE130A;
 Tue, 16 Jul 2024 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311ACC4AF09;
 Tue, 16 Jul 2024 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721140066;
 bh=ZgkkHsHE/75SC2ff7WEeeFJjsv482GEMLDFH/s5vuMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YMpbDqEaCBj0ALbXalFzpAsnwBXnCIoQMCudyfmwn4mEGae1Vysg0gtZiwqvaoJbA
 Nll6TdsnOtlgieZXyBQG8+YXACnTSRT08+mO1dgB5XVCsk9UK6bBkxhdMXc5Nhau0v
 54P8+lQDLlSHaSCxY4e9yK2MPc8uX131urcZE+w3EWCbAbt3oaoxgtuNgrGuhA9+vt
 dmVEpKMc0kIE720gf9VKcIMrmVyGy0SWX8nQTkuSipwOxTqDJmTfANhFjLhJ4iB8xx
 ktoIjRTJTH450A8ELRd/e5Q2Bg8GV0iApKeulxVJ/GtqnRgeUKdJXCOi3DEfHe/Sd9
 8skqqDVLHLLJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tom Chung <chiahsuan.chung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, hamza.mahfooz@amd.com,
 roman.li@amd.com, joshua@froggi.es, wayne.lin@amd.com,
 srinivasan.shanmugam@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 11/18] drm/amd/display: Add refresh rate range
 check
Date: Tue, 16 Jul 2024 10:26:46 -0400
Message-ID: <20240716142713.2712998-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142713.2712998-1-sashal@kernel.org>
References: <20240716142713.2712998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.40
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

From: Tom Chung <chiahsuan.chung@amd.com>

[ Upstream commit 74ad26b36d303ac233eccadc5c3a8d7ee4709f31 ]

[Why]
We only enable the VRR while monitor usable refresh rate range
is greater than 10 Hz.
But we did not check the range in DRM_EDID_FEATURE_CONTINUOUS_FREQ
case.

[How]
Add a refresh rate range check before set the freesync_capable flag
in DRM_EDID_FEATURE_CONTINUOUS_FREQ case.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a1acc8108586f..023fd3945e47a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10760,9 +10760,11 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		if (is_dp_capable_without_timing_msa(adev->dm.dc,
 						     amdgpu_dm_connector)) {
 			if (edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) {
-				freesync_capable = true;
 				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
 				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
+				if (amdgpu_dm_connector->max_vfreq -
+				    amdgpu_dm_connector->min_vfreq > 10)
+					freesync_capable = true;
 			} else {
 				edid_check_required = edid->version > 1 ||
 						      (edid->version == 1 &&
-- 
2.43.0

