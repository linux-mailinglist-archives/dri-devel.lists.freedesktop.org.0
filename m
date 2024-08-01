Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D292943B05
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D6110E79C;
	Thu,  1 Aug 2024 00:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AltNdXEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372B910E79C;
 Thu,  1 Aug 2024 00:22:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B2E0A624B0;
 Thu,  1 Aug 2024 00:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69510C4AF0E;
 Thu,  1 Aug 2024 00:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471764;
 bh=k1OzG/Ph8FLCQr2rJ2EcfbDg5sZPpBE/xjv0ztn/6f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AltNdXEAuhbPdHZHOf3dBhkGScqQP1MEsl+Tvh4/k2iAgtIE4V3mWMrxnNHmH+YZp
 7BrjsAXVr0uL3rkbOatTEWBie6/k/rYRF9acDf/OTNMjWbl6vSEbplJ9tq/JaoRlF5
 +IXlnjWr6h8pvtgRpWVZwLu2OMymt24jHBpNsTgDzkciGh8qUfl0MmaNoz5JvbFFgL
 IWnxnGII7xnC2QTQ+3gRsVBzMA59psrxxWzhvXmXb2K5w5S/hWC82xJJVWXaLDX4vr
 ltL/Fi2L43HsKo9H6VpwKeRQNH5fzH4YzpGYudYki84obvtEUKPsUe5tdn1rn3Iu4F
 UpjF0bYEnhVmQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 wenjing.liu@amd.com, george.shen@amd.com, zaeem.mohamed@amd.com,
 michael.strauss@amd.com, ran.shi@amd.com, daniel.sa@amd.com,
 Bhawanpreet.Lakha@amd.com, yao.wang1@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 18/83] drm/amd/display: Fix Coverity
 INTEGER_OVERFLOW within decide_fallback_link_setting_max_bw_policy
Date: Wed, 31 Jul 2024 20:17:33 -0400
Message-ID: <20240801002107.3934037-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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

[ Upstream commit 83c0c8361347cf43937348e8ca0a487679c003ae ]

[Why]
For addtion (uint8_t) variable + constant 1,
coverity generates message below:
Truncation due to cast operation on "cur_idx + 1" from
32 to 8 bits.

Then Coverity assume result is 32 bits value be saved into
8 bits variable. When result is used as index to access
array, Coverity suspects index invalid.

[How]
Change varaible type to uint32_t.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 9a0beaf601f87..16f4865e4246d 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -528,7 +528,7 @@ static bool decide_fallback_link_setting_max_bw_policy(
 		struct dc_link_settings *cur,
 		enum link_training_result training_result)
 {
-	uint8_t cur_idx = 0, next_idx;
+	uint32_t cur_idx = 0, next_idx;
 	bool found = false;
 
 	if (training_result == LINK_TRAINING_ABORT)
-- 
2.43.0

