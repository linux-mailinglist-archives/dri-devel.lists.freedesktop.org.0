Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4BACA29C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5892510E44D;
	Sun,  1 Jun 2025 23:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WgOxkLOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5BC10E44C;
 Sun,  1 Jun 2025 23:38:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B0DA44A2D0;
 Sun,  1 Jun 2025 23:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C7CC4CEF1;
 Sun,  1 Jun 2025 23:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821115;
 bh=mnKbzSiush0N9uYd61einoT2skMLwrp/HoUJm3ZK0MU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WgOxkLOKPNVAY6Z+uW/0QiZrhAqRXBIOGrIUbjtzW1WkwnhruqDw1MhWVts5Dupgk
 Rc3JEIVu6ZX86MeagsrYh/nYkqCpoPcgi6nvMSoHVvgdTIanEa15EexDqSEtEd9pXt
 QNMa/yRDj5xgmq3Z1gzim8ACoN2sCq4VUon0EvvBXljdANX/blLkADbSF7yaUU+jzY
 vpkVzGWbybib0JVWTum4WYFcEL8+fLfTPwEZR5PB082DfLvKB6lsBzyQDznBh/Bx/I
 xHKOqhOceth8BdOhxUn108Okg+FkvO8OmfAep45Vu/hLSjQIOVh8DwDU73NoPd1rJt
 3rIVXV2Lf3lpw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Wayne.Lin@amd.com, ray.wu@amd.com,
 rodrigo.siqueira@amd.com, mwen@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 19/66] drm/amd/display: Do Not Consider DSC if
 Valid Config Not Found
Date: Sun,  1 Jun 2025 19:36:56 -0400
Message-Id: <20250601233744.3514795-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601233744.3514795-1-sashal@kernel.org>
References: <20250601233744.3514795-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Type: text/plain; charset=UTF-8
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

From: Fangzhi Zuo <Jerry.Zuo@amd.com>

[ Upstream commit 146a4429b5674b7520a96aea34233949731c6086 ]

[why]
In the mode validation, mst dsc is considered for bw calculation after
common dsc config is determined. Currently it considered common dsc config
is found if max and min target bpp are non zero which is not accurate. Invalid
max and min target bpp values would not get max_kbps and min_kbps calculated,
leading to falsefully pass a mode that does not have valid dsc parameters
available.

[how]
Use the return value of decide_dsc_bandwidth_range() to determine whether valid
dsc common config is found or not. Prune out modes that do not have valid common
dsc config determined.

Reviewed-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Analysis of the Bug **1. Nature of the Issue**
This commit fixes a clear logic bug in the DSC (Display Stream
Compression) mode validation for MST (Multi-Stream Transport) displays.
The problem is in the `is_dsc_common_config_possible()` function in
`drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c`. **2. The
Bug Details** The current implementation has a flawed detection
mechanism for valid DSC configurations: ```c // OLD (buggy) code:
dc_dsc_compute_bandwidth_range(..., bw_range); return
bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16; ``` The
bug is that it only checks if `max_target_bpp_x16` and
`min_target_bpp_x16` are non-zero, but these values might be set even
when the DSC configuration is invalid. The function
`dc_dsc_compute_bandwidth_range()` returns a boolean indicating whether
a valid DSC configuration was actually found, but this return value was
being ignored. **3. The Fix** The fix correctly uses the return value
from `dc_dsc_compute_bandwidth_range()`: ```c // NEW (fixed) code: bool
is_dsc_possible; is_dsc_possible = dc_dsc_compute_bandwidth_range(...,
bw_range); return is_dsc_possible; ``` ## Impact Analysis **1. User-
Visible Impact** - **Before**: The driver could incorrectly approve
display modes that don't have valid DSC parameters, leading to display
failures or poor visual quality - **After**: Only modes with valid DSC
configurations are approved, preventing display issues **2. Risk
Assessment** - **Risk of Regression**: Very low - the change makes the
validation more restrictive, only rejecting modes that shouldn't have
been approved - **Scope**: Limited to AMD display driver DSC MST
functionality - **Size**: Very small, contained change (3 lines of code)
## Comparison with Similar Commits All the provided similar commits were
marked as "Backport Status: NO" because they were: 1. Feature additions
(enabling new DSC functionality) 2. Policy improvements (changing
compression ratios) 3. New algorithm implementations (fair share
algorithms) 4. API extensions (adding DSC support to PBN calculations)
This commit is fundamentally different - it's a **pure bug fix** that
corrects faulty logic without adding new features. ## Stable Tree
Suitability This commit meets all stable tree criteria: ✅ **Fixes
important bugs**: Yes - prevents display mode validation failures ✅
**Small and contained**: Yes - only 3 lines changed in one function ✅
**No architectural changes**: Yes - uses existing API correctly ✅
**Minimal regression risk**: Yes - makes validation more conservative ✅
**Clear side effects**: Yes - only rejects invalid modes that were
incorrectly approved ✅ **Affects critical subsystem**: Yes - display
functionality is critical for users ## Technical Verification From
examining the kernel code, I confirmed that
`dc_dsc_compute_bandwidth_range()` performs comprehensive validation
including: 1. Intersection of DSC capabilities between source and sink
2. DSC configuration setup with timing constraints 3. Bandwidth range
calculation with `decide_dsc_bandwidth_range()` The old code ignored
these validation results and only checked if some bandwidth values were
set, which could happen even with invalid configurations. This is a
textbook stable tree candidate: a small, low-risk fix for a clear logic
error that affects user-visible functionality.

 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 2698e5c74ddfd..66c1905102a5d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1620,16 +1620,17 @@ static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
 					  struct dc_dsc_bw_range *bw_range)
 {
 	struct dc_dsc_policy dsc_policy = {0};
+	bool is_dsc_possible;
 
 	dc_dsc_get_policy_for_timing(&stream->timing, 0, &dsc_policy, dc_link_get_highest_encoding_format(stream->link));
-	dc_dsc_compute_bandwidth_range(stream->sink->ctx->dc->res_pool->dscs[0],
-				       stream->sink->ctx->dc->debug.dsc_min_slice_height_override,
-				       dsc_policy.min_target_bpp * 16,
-				       dsc_policy.max_target_bpp * 16,
-				       &stream->sink->dsc_caps.dsc_dec_caps,
-				       &stream->timing, dc_link_get_highest_encoding_format(stream->link), bw_range);
-
-	return bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16;
+	is_dsc_possible = dc_dsc_compute_bandwidth_range(stream->sink->ctx->dc->res_pool->dscs[0],
+							 stream->sink->ctx->dc->debug.dsc_min_slice_height_override,
+							 dsc_policy.min_target_bpp * 16,
+							 dsc_policy.max_target_bpp * 16,
+							 &stream->sink->dsc_caps.dsc_dec_caps,
+							 &stream->timing, dc_link_get_highest_encoding_format(stream->link), bw_range);
+
+	return is_dsc_possible;
 }
 
 enum dc_status dm_dp_mst_is_port_support_mode(
-- 
2.39.5

