Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966987AC886
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 15:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F0810E10F;
	Sun, 24 Sep 2023 13:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA5F10E10F;
 Sun, 24 Sep 2023 13:17:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 11D3DB8076A;
 Sun, 24 Sep 2023 13:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57D2C433C7;
 Sun, 24 Sep 2023 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695561424;
 bh=f7svWX4LhN0qqlnBQMmb8TmUmLfmAjr0QCKdIyqSPkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O48YInccd7ylnoSvfOOXoAQtMf0PSyelOyy/IUBAFePvcD8aBotcFPjfF1rI0j01c
 TaE7HYd3KriFec/gz4Jf1PJIBAj7SSt9IMUcpLuXD5UfcxN8byGZyzB2civCZybBz1
 n8jc6jCxN+XDF9dFtT8mm/tjaPlQVaMKcTeWYuAcxQjJCzp/gTAzrUiAAApqNNTmqj
 P/c+Ck1IGMWJtqM8jJGxQWK4bdet6eozUeLSLkoM0zP0PIFOS9m1nub/LzOA1drvnh
 dwhFOlsOSeE53whvKAX//KocJykRTum8B+rfa7TaHE5JJULVJsG0zZLdBTbZ2ksGKt
 d00e5+kajodgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 27/41] drm/amd/display: Add dirty rect support for
 Replay
Date: Sun, 24 Sep 2023 09:15:15 -0400
Message-Id: <20230924131529.1275335-27-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230924131529.1275335-1-sashal@kernel.org>
References: <20230924131529.1275335-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.5
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
Cc: Stylon Wang <stylon.wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 srinivasan.shanmugam@amd.com, dri-devel@lists.freedesktop.org,
 Sun peng Li <sunpeng.li@amd.com>, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, haoping.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 hersenxs.wu@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>

[ Upstream commit 679fc891bf11845730b572fc44f8a0eb846aba29 ]

Dirty rect can be used with replay, so enable them to allow for more
powersaving.

Reviewed-by: Sun peng Li <sunpeng.li@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3123ea2f4f30a..5c63a13f25193 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8038,7 +8038,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		bundle->surface_updates[planes_count].plane_info =
 			&bundle->plane_infos[planes_count];
 
-		if (acrtc_state->stream->link->psr_settings.psr_feature_enabled) {
+		if (acrtc_state->stream->link->psr_settings.psr_feature_enabled ||
+		    acrtc_state->stream->link->replay_settings.replay_feature_enabled) {
 			fill_dc_dirty_rects(plane, old_plane_state,
 					    new_plane_state, new_crtc_state,
 					    &bundle->flip_addrs[planes_count],
-- 
2.40.1

