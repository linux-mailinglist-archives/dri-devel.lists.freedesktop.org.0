Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28E93285D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3593A10E727;
	Tue, 16 Jul 2024 14:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q7cAaT24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F1A10E724;
 Tue, 16 Jul 2024 14:26:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 19BABCE12A5;
 Tue, 16 Jul 2024 14:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D4FC4AF09;
 Tue, 16 Jul 2024 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721139961;
 bh=lFfeEuGvPTnaQ/p4RIp+RBEGX2XyChwT1+a3MqZRhf4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q7cAaT24nLVTkdM59UL6A3s9h2JtWdBHoUHwXctvImwMYQwNrOB6W+zUxGraGk5K+
 MWy86RTKtTLjXFQMSnk2ITtyf7rLcH19J2AaGvHoYJEe1AiaTiJgJNDStjPFiM2qdc
 9bOc8F6gf46IABiFpKeEyo7scNNxgRIqJZwHqlYQ51iyM40rd32eVh8cITDbxso5M8
 mtIK/xZSkpkZt+XFUN2SuNOgqgv4Hl7phftAbnIcz0YPYX7mwZfd6HOzqWoHuLtKut
 KMQK6t5TRnfsWmNUF1NnuxX533oJFY8ri8yIu9wqYzkr9HX3d0nwWJrq+g6nH+7gyN
 g6LiALY9yLAmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alvin Lee <alvin.lee2@amd.com>, Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Nevenko Stupar <nevenko.stupar@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jun.lei@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 13/22] drm/amd/display: Account for cursor
 prefetch BW in DML1 mode support
Date: Tue, 16 Jul 2024 10:24:20 -0400
Message-ID: <20240716142519.2712487-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142519.2712487-1-sashal@kernel.org>
References: <20240716142519.2712487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.9
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

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit 074b3a886713f69d98d30bb348b1e4cb3ce52b22 ]

[Description]
We need to ensure to take into account cursor prefetch BW in
mode support or we may pass ModeQuery but fail an actual flip
which will cause a hang. Flip may fail because the cursor_pre_bw
is populated during mode programming (and mode programming is
never called prior to ModeQuery).

Reviewed-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
Reviewed-by: Nevenko Stupar <nevenko.stupar@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 6c84b0fa40f44..0782a34689a00 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -3364,6 +3364,9 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 							&mode_lib->vba.UrgentBurstFactorLumaPre[k],
 							&mode_lib->vba.UrgentBurstFactorChromaPre[k],
 							&mode_lib->vba.NotUrgentLatencyHidingPre[k]);
+
+					v->cursor_bw_pre[k] = mode_lib->vba.NumberOfCursors[k] * mode_lib->vba.CursorWidth[k][0] * mode_lib->vba.CursorBPP[k][0] /
+							8.0 / (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * v->VRatioPreY[i][j][k];
 				}
 
 				{
-- 
2.43.0

