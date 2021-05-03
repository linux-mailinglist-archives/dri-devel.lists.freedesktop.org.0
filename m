Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBA3719C0
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316106E93E;
	Mon,  3 May 2021 16:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9F36E936;
 Mon,  3 May 2021 16:36:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BB656054E;
 Mon,  3 May 2021 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059802;
 bh=rbzHGteRRXA+HYT6QScnhUlW7tlUz+0AaOJknEJ07EQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dnz3DXCCuGTp3L/c/BwFg2+4JwTAU23Aw60SIT3dSWtGV2vA/gPwY13VJDnr5ZCRq
 98xtIDJP3tvXr2tuPLsRVJ2JssHePe+akOmtVbVdKPOPnbjRhNomt4E+e+K7RtTKCu
 KeNoIOdNce+5y8ygDQuStiqRjriISdhvfNGMBJR+wXEPxcNuZBb0mzMMcuyNDfXjv1
 wc9PzU0nYYdgyfQv9O5h8tbJoSy4kky8dGq4w8TvANKHmHuwQzyPn2YDHPXjeWEP/T
 6ff0ObSU+M5Pf8dPrB9tOuHbg2BAkaojnVCL+rmdMUg383qu42LkwggbzGwOnTylg+
 luuiq1nSrIhkw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 057/134] drm/amd/display: Fix potential memory
 leak
Date: Mon,  3 May 2021 12:33:56 -0400
Message-Id: <20210503163513.2851510-57-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163513.2851510-1-sashal@kernel.org>
References: <20210503163513.2851510-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 amd-gfx@lists.freedesktop.org, Solomon Chiu <solomon.chiu@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qingqing Zhuo <qingqing.zhuo@amd.com>

[ Upstream commit 51ba691206e35464fd7ec33dd519d141c80b5dff ]

[Why]
vblank_workqueue is never released.

[How]
Free it upon dm finish.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Solomon Chiu <solomon.chiu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 167e04ab9d5b..9c243f66867a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1191,6 +1191,15 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 	if (adev->dm.dc)
 		dc_deinit_callbacks(adev->dm.dc);
 #endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	if (adev->dm.vblank_workqueue) {
+		adev->dm.vblank_workqueue->dm = NULL;
+		kfree(adev->dm.vblank_workqueue);
+		adev->dm.vblank_workqueue = NULL;
+	}
+#endif
+
 	if (adev->dm.dc->ctx->dmub_srv) {
 		dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
 		adev->dm.dc->ctx->dmub_srv = NULL;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
