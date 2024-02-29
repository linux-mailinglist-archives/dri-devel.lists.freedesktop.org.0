Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355386D46A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 21:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706B510E118;
	Thu, 29 Feb 2024 20:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UnBqyPBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CB910E118;
 Thu, 29 Feb 2024 20:39:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4E6B7CE1A80;
 Thu, 29 Feb 2024 20:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB589C433F1;
 Thu, 29 Feb 2024 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709239152;
 bh=F1BWa4jzZKYFHykP4yUqY5Y3/LkmRdmf8Kjmr64U45s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UnBqyPBc6vQZct3ynFoSMxTHtFV0cajnkqJH36TeNWTaotTIfF92b4vxcYKoMwPMH
 beZE7QWOTD2uuEF6tt1Ujogv12Pj4VRKKHcA2z7OzHS3cgMpOUPzVlUuQXE3w5TIEi
 XpXPOkp23yNegPLxo0s8IieM02JRWjpHiA2JpZZ2K7AjkLGG0EE37MFknfBa3YjvYl
 6oFyq1vBpCY3RpipcvtQ/dxbMJ9U051ec0KCVkl+GL9IzEy8jE0CH0rraEeLM10xas
 XPfbwByInw8ULfE7LmsX+t5R00pibZuqB1ril0UMX4ErgZIyY6cvudJ9UvRXM0Ulrd
 lzhtGrx3ocANg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Swapnil Patel <swapnil.patel@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nicholas.kazlauskas@amd.com, hamza.mahfooz@amd.com,
 roman.li@amd.com, syed.hassan@amd.com, sungkim@amd.com, jerry.zuo@amd.com,
 Qingqing.Zhuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 24/24] drm/amd/display: fix input states
 translation error for dcn35 & dcn351
Date: Thu, 29 Feb 2024 15:37:04 -0500
Message-ID: <20240229203729.2860356-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229203729.2860356-1-sashal@kernel.org>
References: <20240229203729.2860356-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.6
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

From: Swapnil Patel <swapnil.patel@amd.com>

[ Upstream commit 27a6c49394b1a203beeb94752c9a1d6318f24ddf ]

[Why]
Currently there is an error while translating input clock sates into
output clock states. The highest fclk setting from output sates is
being dropped because of this error.

[How]
For dcn35 and dcn351, make output_states equal to input states.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Swapnil Patel <swapnil.patel@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dml2/dml2_translation_helper.c    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index 2c379be19aa84..16452dae4acac 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -398,7 +398,6 @@ void dml2_init_soc_states(struct dml2_context *dml2, const struct dc *in_dc,
 	/* Copy clocks tables entries, if available */
 	if (dml2->config.bbox_overrides.clks_table.num_states) {
 		p->in_states->num_states = dml2->config.bbox_overrides.clks_table.num_states;
-
 		for (i = 0; i < dml2->config.bbox_overrides.clks_table.num_entries_per_clk.num_dcfclk_levels; i++) {
 			p->in_states->state_array[i].dcfclk_mhz = dml2->config.bbox_overrides.clks_table.clk_entries[i].dcfclk_mhz;
 		}
@@ -437,6 +436,14 @@ void dml2_init_soc_states(struct dml2_context *dml2, const struct dc *in_dc,
 	}
 
 	dml2_policy_build_synthetic_soc_states(s, p);
+	if (dml2->v20.dml_core_ctx.project == dml_project_dcn35 ||
+		dml2->v20.dml_core_ctx.project == dml_project_dcn351) {
+		// Override last out_state with data from last in_state
+		// This will ensure that out_state contains max fclk
+		memcpy(&p->out_states->state_array[p->out_states->num_states - 1],
+				&p->in_states->state_array[p->in_states->num_states - 1],
+				sizeof(struct soc_state_bounding_box_st));
+	}
 }
 
 void dml2_translate_ip_params(const struct dc *in, struct ip_params_st *out)
-- 
2.43.0

