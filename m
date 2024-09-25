Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2B9858FD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808A210E950;
	Wed, 25 Sep 2024 11:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f/s7OM8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABA710E950;
 Wed, 25 Sep 2024 11:49:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9247A5C5B36;
 Wed, 25 Sep 2024 11:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A74C4CECD;
 Wed, 25 Sep 2024 11:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264940;
 bh=IiEJWeg9HvhsJThCecwE7574GnUAmOuksOLPKp8f/Rs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f/s7OM8cNLlN5mK/N5P6XhuBUu9yB1f37EueK36zKrSWJ6rK9crfQlnm/BLAci6hY
 NKd2UEXQYfbyrPp9QP6U83qrrOkZP0FUt0Q+DuhrLI4JnN9R2UrsoZc1PGrFtm9y3h
 Aux+eyIcOkPmE53oCkmMwDr79henoYRjcearOmzO/AueUQZt16vHRqnfMycNZ83iYd
 hCWhQsNVrT/A375M73jbCNLbkMGMDXWg8KTheyDHiDyRFm3EodpIxwAFB38bvKWyEH
 9H2pizQviUHCV6vXzHYSXap7CHq2glGHHRI7mAwBomehV1lRIIVbayCTfq09fvnkjl
 LSlBpnrNhGe3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chris Park <chris.park@amd.com>, Joshua Aberback <joshua.aberback@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, dillon.varone@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, hamza.mahfooz@amd.com, wenjing.liu@amd.com,
 charlene.liu@amd.com, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 183/244] drm/amd/display: Deallocate DML memory
 if allocation fails
Date: Wed, 25 Sep 2024 07:26:44 -0400
Message-ID: <20240925113641.1297102-183-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Chris Park <chris.park@amd.com>

[ Upstream commit 892abca6877a96c9123bb1c010cafccdf8ca1b75 ]

[Why]
When DC state create DML memory allocation fails, memory is not
deallocated subsequently, resulting in uninitialized structure
that is not NULL.

[How]
Deallocate memory if DML memory allocation fails.

Reviewed-by: Joshua Aberback <joshua.aberback@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Chris Park <chris.park@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_state.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index e990346e51f67..665157f8d4cbe 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -211,10 +211,16 @@ struct dc_state *dc_state_create(struct dc *dc, struct dc_state_create_params *p
 #ifdef CONFIG_DRM_AMD_DC_FP
 	if (dc->debug.using_dml2) {
 		dml2_opt->use_clock_dc_limits = false;
-		dml2_create(dc, dml2_opt, &state->bw_ctx.dml2);
+		if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2)) {
+			dc_state_release(state);
+			return NULL;
+		}
 
 		dml2_opt->use_clock_dc_limits = true;
-		dml2_create(dc, dml2_opt, &state->bw_ctx.dml2_dc_power_source);
+		if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2_dc_power_source)) {
+			dc_state_release(state);
+			return NULL;
+		}
 	}
 #endif
 
-- 
2.43.0

