Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05B8BF050
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AEC112FC9;
	Tue,  7 May 2024 23:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="URTlsLSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E155112FC8;
 Tue,  7 May 2024 23:02:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C203D61882;
 Tue,  7 May 2024 23:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BADBC4AF17;
 Tue,  7 May 2024 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715122928;
 bh=/vI2vAORbGe6dlIg7gvs2UgWVFM4jEnbGfNAbZdbNsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=URTlsLSoWohIhIZE1+zTdkk8dBimjq8+unG6kPkiRw0EIFEG1BQzjQ1J9MVQN15n+
 Ir87U9DmYQviVkdyUTVpmIU2Rn/2+aETDYAbMEOLB2zN8TUOtWNieDppTWZSagB7pw
 mjfUpgMPvGvLEP9Rh6W54uFh7PUGyl60D9THQJ85PQ3kdiB0zfLmPseJOjqaLHxJZn
 QIGUTbm+mhLnTOd+bkt8lL0+JXPFHME72ihha3+FNQzmtAhLN2gV1cSbO4hmlaLxAN
 ho9J8DTWxYy8bAbBKKkiM7P9c9n/9Lzpbb3AxO4agyDaXSbDN5AR0gjW2oiyjrtaxI
 oEhM4r7QHGXcA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Joshua Ashton <joshua@froggi.es>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, alex.hung@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, srinivasan.shanmugam@amd.com,
 mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 3/3] drm/amd/display: Set color_mgmt_changed to
 true on unsuspend
Date: Tue,  7 May 2024 19:01:56 -0400
Message-ID: <20240507230159.392002-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230159.392002-1-sashal@kernel.org>
References: <20240507230159.392002-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.313
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

From: Joshua Ashton <joshua@froggi.es>

[ Upstream commit 2eb9dd497a698dc384c0dd3e0311d541eb2e13dd ]

Otherwise we can end up with a frame on unsuspend where color management
is not applied when userspace has not committed themselves.

Fixes re-applying color management on Steam Deck/Gamescope on S3 resume.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 98d51bc204172..e4139723c473c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -816,6 +816,7 @@ static int dm_resume(void *handle)
 			dc_stream_release(dm_new_crtc_state->stream);
 			dm_new_crtc_state->stream = NULL;
 		}
+		dm_new_crtc_state->base.color_mgmt_changed = true;
 	}
 
 	for_each_new_plane_in_state(dm->cached_state, plane, new_plane_state, i) {
-- 
2.43.0

