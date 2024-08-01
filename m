Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C0943B9C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631C710E7D9;
	Thu,  1 Aug 2024 00:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hdCfUBxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B8910E7DA;
 Thu,  1 Aug 2024 00:29:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F287661446;
 Thu,  1 Aug 2024 00:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCF5C4AF0E;
 Thu,  1 Aug 2024 00:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472149;
 bh=fv1f1fLbBCDkLiL1oAGmxdCX7giF0BqILDwkHn88ax8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hdCfUBxx4HGYa18/hWqrM73d0CPzyKkngiId3895FpVNtRCaNZDpOgvwg9mG+lB9g
 smtcR1kif2Rfms/ScwAlMH1pLW5Ee8W0qv6dQDHK9bTUDMalHbAaq3DDn4GjBN13vq
 c8Qxk5IF2TLLqadHRNXCN0mWOv3Mwx+FaRqglmnt5NyzzwJXdUHLGtVevuvKnvTatK
 iRvWzGu4XQZ2c/O5bepZLUXGqQo/uvRuIc8ntNp6t4KcvrFE8ToqxbMdbgW9lJ72wu
 izT9OgAqx/dWi4g+kq4RpX1HZobwgWNvG80p/itO5Wnvt7pqjQb1VqSvuJ5N8+KubH
 hYxcPKl65kKdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 14/61] drm/amd/display: Skip inactive planes
 within ModeSupportAndSystemConfiguration
Date: Wed, 31 Jul 2024 20:25:32 -0400
Message-ID: <20240801002803.3935985-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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

[ Upstream commit a54f7e866cc73a4cb71b8b24bb568ba35c8969df ]

[Why]
Coverity reports Memory - illegal accesses.

[How]
Skip inactive planes.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index 1070cf8701960..b2ad56c459ba6 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -1099,8 +1099,13 @@ void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 
 	// Total Available Pipes Support Check
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
-		total_pipes += mode_lib->vba.DPPPerPlane[k];
 		pipe_idx = get_pipe_idx(mode_lib, k);
+		if (pipe_idx == -1) {
+			ASSERT(0);
+			continue; // skip inactive planes
+		}
+		total_pipes += mode_lib->vba.DPPPerPlane[k];
+
 		if (mode_lib->vba.cache_pipes[pipe_idx].clks_cfg.dppclk_mhz > 0.0)
 			mode_lib->vba.DPPCLK[k] = mode_lib->vba.cache_pipes[pipe_idx].clks_cfg.dppclk_mhz;
 		else
-- 
2.43.0

