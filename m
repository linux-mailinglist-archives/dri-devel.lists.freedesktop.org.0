Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D71943A1B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730F410E705;
	Thu,  1 Aug 2024 00:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sgubpro1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1E310E703;
 Thu,  1 Aug 2024 00:10:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 231CD6246A;
 Thu,  1 Aug 2024 00:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46381C116B1;
 Thu,  1 Aug 2024 00:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471030;
 bh=0VXbUl11Rtte8Kli2pOK4K2w0PnCqNRTqNw9MqpWpOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sgubpro1JN+OpyqCejgJPrCf6zDKUXl3711ZujYC3PdY5spkWt1b9z3OPew4KyIzM
 TjFuePtE8m9SFvc46Mvda7HIc1kEB6DpM3H+u8BqwRzKA7JCnusIgzSLv+AgxY8rX2
 rIuBxRWlPXBGXKtvVcWlAVkvkjnb5dmS4KGoSpiKJQkC8hibfdQ+FjMLhMO3wkk+Vy
 c14Hyf9Yq+U3g7Vs3SvfoLYDisWIZsf8Vd7DGWSQEcbdHumn5rAfTeaPB3ePzCy7v1
 jzDbdFzwFEOB+N79CxJX0Wky8RMhKBv7EvX0DTRa2Qz4p3zet68PX5KlQd7KBGwDXm
 BMiWmJqV83CSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 hamza.mahfooz@amd.com, roman.li@amd.com, mario.limonciello@amd.com,
 Wayne.Lin@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 021/121] drm/amd/display: Release state memory if
 amdgpu_dm_create_color_properties fail
Date: Wed, 31 Jul 2024 19:59:19 -0400
Message-ID: <20240801000834.3930818-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Hersen Wu <hersenxs.wu@amd.com>

[ Upstream commit 52cbcf980509e6190740dd1e2a1a437e8fb8101b ]

[Why]
Coverity reports RESOURCE_LEAK warning. State memory
is not released if dm_create_color_properties fail.

[How]
Call kfree(state) before return.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c893cf8f2d36e..fca6f7d4c28e2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4206,8 +4206,11 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 	}
 
 #ifdef AMD_PRIVATE_COLOR
-	if (amdgpu_dm_create_color_properties(adev))
+	if (amdgpu_dm_create_color_properties(adev)) {
+		dc_state_release(state->context);
+		kfree(state);
 		return -ENOMEM;
+	}
 #endif
 
 	r = amdgpu_dm_audio_init(adev);
-- 
2.43.0

