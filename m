Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E298591D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCD10E963;
	Wed, 25 Sep 2024 11:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gJedkawH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A1A10E963;
 Wed, 25 Sep 2024 11:50:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1A045C1082;
 Wed, 25 Sep 2024 11:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E173FC4CEC7;
 Wed, 25 Sep 2024 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265003;
 bh=M3glKs3i2GpNKEzkN+E8d5VLfMis/iG9FnNW7OOCblI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gJedkawHgWAFB3M3NyRk+rBx9iavhOa5uu9NH+SNjFRQr6yy0uzQ2GRY1ag2dHMY6
 EehMhsKtX9/DLE5tt29hhVZS89jFlrtiDjk/iew8wVKRyyxp6YJO3yzgl2H1C69zwH
 r6saoq9ujLpTxOaHlmfqnV+4bbqpV3gK5HY7gvTA9jyXk8nKV8k79gqbmC46KWjsSj
 S+HiU3l6SPqLB56ajiTxfOFffSGQvukGo+ZGi6sf8gHbBg+xHkXUjTVbPPQda61wz7
 /XncPFNs4mcAO7Zp7kBoiAiRYS5y20NlJcykbMz5SzI4uye3+/p+DfqQmatgTr3YAe
 ozrQPFC1kPxQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, dillon.varone@amd.com,
 moadhuri@amd.com, relja.vojvodic@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 192/244] drm/amd/display: Fix possible overflow
 in integer multiplication
Date: Wed, 25 Sep 2024 07:26:53 -0400
Message-ID: <20240925113641.1297102-192-sashal@kernel.org>
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 3f96f545f877ac59d0c967f52d760b4b2b3b9a47 ]

[WHAT & HOW]
Integer multiplies integer may overflow in context that expects an
expression of unsigned long long (64 bits). This can be fixed by casting
integer to unsigned long long to force 64 bits results.

This fixes 2 OVERFLOW_BEFORE_WIDEN issues reported by Coverity.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/resource/dcn32/dcn32_resource_helpers.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c
index 47c8a9fbe7546..f5a4e97c40ced 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource_helpers.c
@@ -663,7 +663,7 @@ bool dcn32_subvp_drr_admissable(struct dc *dc, struct dc_state *context)
 
 				subvp_disallow |= disallow_subvp_in_active_plus_blank(pipe);
 				refresh_rate = (pipe->stream->timing.pix_clk_100hz * (uint64_t)100 +
-					pipe->stream->timing.v_total * pipe->stream->timing.h_total - (uint64_t)1);
+					pipe->stream->timing.v_total * (unsigned long long)pipe->stream->timing.h_total - (uint64_t)1);
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.v_total);
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.h_total);
 			}
@@ -724,7 +724,7 @@ bool dcn32_subvp_vblank_admissable(struct dc *dc, struct dc_state *context, int
 
 				subvp_disallow |= disallow_subvp_in_active_plus_blank(pipe);
 				refresh_rate = (pipe->stream->timing.pix_clk_100hz * (uint64_t)100 +
-					pipe->stream->timing.v_total * pipe->stream->timing.h_total - (uint64_t)1);
+					pipe->stream->timing.v_total * (unsigned long long)pipe->stream->timing.h_total - (uint64_t)1);
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.v_total);
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.h_total);
 			}
-- 
2.43.0

