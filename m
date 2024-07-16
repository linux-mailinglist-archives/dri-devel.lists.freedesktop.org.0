Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAAD9328A8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F3710E74B;
	Tue, 16 Jul 2024 14:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MjUa6hYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B5410E74A;
 Tue, 16 Jul 2024 14:29:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B62B660DF7;
 Tue, 16 Jul 2024 14:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFF2C4AF09;
 Tue, 16 Jul 2024 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721140179;
 bh=Dv/0YvJe59S64bHhucHtmRhGHizH3UTI0ncKtrTZ8v4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MjUa6hYIztB0ObRIxZkRBTuBaz+DxuPtf4A+FXCPCUyA44sP0s3AwI1rQu+VPwPgr
 YaEqJl7Ho9ZRXZ2buJVaDpeU0YUOWcXD53q8SG6QxDZ1dPuM3+2alq17hmoydzQ7NA
 IGvkJXjqDLFvtCycOMhDFflPCBhdgfe+pTVEKrV/Ucnpwyo1gLM1cUa0nJaoCTrUg/
 xdO76RMyRXAt9VhAQB30on1ob/t2EvOrM0d7gD0BvBSYz6GW8nBiiGJq/L5AmQZHXH
 X/mfKgyHK/TU4fkKsPAjOMVBwsNuoic4CdiuUY8CzMwykyx9JyJqCdkxyr6uJrtPdS
 0VEjqHvObuM1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tom Chung <chiahsuan.chung@amd.com>, Sun peng Li <sunpeng.li@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, alex.hung@amd.com,
 hamza.mahfooz@amd.com, roman.li@amd.com, mario.limonciello@amd.com,
 joshua@froggi.es, wayne.lin@amd.com, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 6/9] drm/amd/display: Reset freesync config
 before update new state
Date: Tue, 16 Jul 2024 10:29:08 -0400
Message-ID: <20240716142920.2713829-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142920.2713829-1-sashal@kernel.org>
References: <20240716142920.2713829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.162
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

[ Upstream commit 6b8487cdf9fc7bae707519ac5b5daeca18d1e85b ]

[Why]
Sometimes the new_crtc_state->vrr_infopacket did not sync up with the
current state.
It will affect the update_freesync_state_on_stream() does not update
the state correctly.

[How]
Reset the freesync config before get_freesync_config_for_crtc() to
make sure we have the correct new_crtc_state for VRR.

Reviewed-by: Sun peng Li <sunpeng.li@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b821abb56ac3b..cbf1a9a625068 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10475,6 +10475,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	}
 
 	/* Update Freesync settings. */
+	reset_freesync_config_for_crtc(dm_new_crtc_state);
 	get_freesync_config_for_crtc(dm_new_crtc_state,
 				     dm_new_conn_state);
 
-- 
2.43.0

