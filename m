Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DDE8365FF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4A10F1FD;
	Mon, 22 Jan 2024 14:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439EE10F27F;
 Mon, 22 Jan 2024 14:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7FBB0B80E6D;
 Mon, 22 Jan 2024 14:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C1EC433C7;
 Mon, 22 Jan 2024 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935422;
 bh=h2EMJEwn+xtLhnIs1AdEUWAodoqKiuzxMfQyLE/5Ax0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N6MQ946GWyq4ysz102YRflODLX6OKT9QuX7VOrrkUqD68fZdnDLmkFpcbxU2d67NC
 hIjIhn8Df/XGubxbRvfQpMfX9+EIodWek0B3TH18DSgHUVbXzCWpBzy3M4nXpfOPms
 DHfiL2mrDEolUSxJ4kn4GNG2/atYahCjk++SjMMjL6xklIqPAkRfF868ehPBR4j4gs
 GKABjCvq/JBoLw6NzIMpn6jZhC0iDgij74UL4nEy/RAvkXgXRfiy1N2VRf7/zpU+3I
 /ckxm8ZrccB5XL6k5qN73fxJPyYxGWSLT8Jml1qQjUwjfWduos4376Pz3ItczI+lJd
 VuqPBhDkHhYBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 17/88] drm/amd/display: initialize all the dpm
 level's stutter latency
Date: Mon, 22 Jan 2024 09:50:50 -0500
Message-ID: <20240122145608.990137-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: dri-devel@lists.freedesktop.org, Allen Pan <allen.pan@amd.com>,
 hamza.mahfooz@amd.com, airlied@gmail.com, Sasha Levin <sashal@kernel.org>,
 Charlene Liu <charlene.liu@amd.com>, sungkim@amd.com, Rodrigo.Siqueira@amd.com,
 Syed Hassan <syed.hassan@amd.com>, amd-gfx@lists.freedesktop.org,
 jerry.zuo@amd.com, sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 dillon.varone@amd.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 roman.li@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Charlene Liu <charlene.liu@amd.com>

[ Upstream commit 885c71ad791c1709f668a37f701d33e6872a902f ]

Fix issue when override level bigger than default. Levels 5, 6, and 7
had zero stutter latency, this is because override level being
initialized after stutter latency inits.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Syed Hassan <syed.hassan@amd.com>
Reviewed-by: Allen Pan <allen.pan@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index db06a5b749b4..279e7605a0a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -341,6 +341,9 @@ void dml2_init_soc_states(struct dml2_context *dml2, const struct dc *in_dc,
 		break;
 	}
 
+	if (dml2->config.bbox_overrides.clks_table.num_states)
+			p->in_states->num_states = dml2->config.bbox_overrides.clks_table.num_states;
+
 	/* Override from passed values, if available */
 	for (i = 0; i < p->in_states->num_states; i++) {
 		if (dml2->config.bbox_overrides.sr_exit_latency_us) {
@@ -397,7 +400,6 @@ void dml2_init_soc_states(struct dml2_context *dml2, const struct dc *in_dc,
 	}
 	/* Copy clocks tables entries, if available */
 	if (dml2->config.bbox_overrides.clks_table.num_states) {
-		p->in_states->num_states = dml2->config.bbox_overrides.clks_table.num_states;
 
 		for (i = 0; i < dml2->config.bbox_overrides.clks_table.num_entries_per_clk.num_dcfclk_levels; i++) {
 			p->in_states->state_array[i].dcfclk_mhz = dml2->config.bbox_overrides.clks_table.clk_entries[i].dcfclk_mhz;
-- 
2.43.0

