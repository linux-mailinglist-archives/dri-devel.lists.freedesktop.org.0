Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24178D06CA
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E17A10ED0E;
	Mon, 27 May 2024 15:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GS48Vn9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D667110ED0E;
 Mon, 27 May 2024 15:54:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1E4B5CE0187;
 Mon, 27 May 2024 15:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0315C2BBFC;
 Mon, 27 May 2024 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716825255;
 bh=hSoxJtACmv/83j56N2qI1nRQXowbbOKE8x2vsRg61d4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GS48Vn9WgLKM0SFqzzkHqSl/y+mwPD74HGSGNCRsENDiL5/PQVzZwTu6rAJkc/VL5
 RRo3RVM5lfVixp3YUtFNJCxLOwxHBMHrBC7DZXPQVdRWxHo5D4Q7MrOT7T/7j4ScaP
 tKazlB2+IcWIVzFcM1c659khZSYngmQE+m9S9tYN7MVDs95/QXELK5yBK90FJBYS8o
 KvOnq2uvPZh0MfdVgmcTqdoZGHCQNV0IPmgx6fJLkIZTLN/xOZ/ptKvHH5CrZ4Ea6l
 99wUl3DRIvLPJeWgbS9LU60VhiKoSWfrYUPggkJMHXVRNdjND+3qX1zbsk+l3bZHbd
 kIMzZFDGYoeeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Xi (Alex) Liu" <xi.liu@amd.com>, Daniel Miess <daniel.miess@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Roman Li <roman.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 charlene.liu@amd.com, sungjoon.kim@amd.com, chiahsuan.chung@amd.com,
 jun.lei@amd.com, danny.wang@amd.com, alvin.lee2@amd.com, allen.pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 06/20] drm/amd/display: add root clock control
 function pointer to fix display corruption
Date: Mon, 27 May 2024 11:52:49 -0400
Message-ID: <20240527155349.3864778-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155349.3864778-1-sashal@kernel.org>
References: <20240527155349.3864778-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
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

From: "Xi (Alex) Liu" <xi.liu@amd.com>

[ Upstream commit de2d1105a3757742b45b0d8270b3c8734cd6b6f8 ]

[Why and how]

External display has corruption because no root clock control function. Add the function pointer to fix the issue.

Reviewed-by: Daniel Miess <daniel.miess@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Roman Li <roman.li@amd.com>
Signed-off-by: Xi (Alex) Liu <xi.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c
index 143d3fc0221cf..069e48573f4a9 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.c
@@ -147,6 +147,7 @@ static const struct hwseq_private_funcs dcn351_private_funcs = {
 	//.hubp_pg_control = dcn35_hubp_pg_control,
 	.enable_power_gating_plane = dcn35_enable_power_gating_plane,
 	.dpp_root_clock_control = dcn35_dpp_root_clock_control,
+	.dpstream_root_clock_control = dcn35_dpstream_root_clock_control,
 	.program_all_writeback_pipes_in_tree = dcn30_program_all_writeback_pipes_in_tree,
 	.update_odm = dcn35_update_odm,
 	.set_hdr_multiplier = dcn10_set_hdr_multiplier,
-- 
2.43.0

