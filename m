Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E39F8BF0AF
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06C2112FE4;
	Tue,  7 May 2024 23:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FvygdZcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AA3112FE0;
 Tue,  7 May 2024 23:09:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEAF7619FF;
 Tue,  7 May 2024 23:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE38C4AF68;
 Tue,  7 May 2024 23:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123384;
 bh=Z1MO1ZagCXquTyQi4RXjNlyeIi8Vavtv2regL3YQls4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FvygdZclTQBMnefzCqISuxqBnwZCrjcvAcWsDyk0zKpFLpTuCsW4CylY/i68rZs8m
 sNePKhY+F/ae2ZfHkm6FBglfY+h4cM/tZp6O3u/oipJHGZZkw2vpqjgBxOLXcR0eGg
 E7xavrZBUCWLCHxRmIRlufUX2ph/GjT7jhNQ9oq2VrhYryHDb0St2P7ysX9rTZGW4S
 f1hadcNqGiLCyRHMcpXe0g80jYPsqM3hty2PFv545Dp2gktqU+cde+CiIwvxr0m0ev
 MUYYxlRViNGbqZy9BKQKMdy1fxUpJXEt8+FiL7+ZkfIxuswONdGsHAOfrbCvTRe9Gs
 d2m5LGMc3nMcw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sung Joon Kim <sungjoon.kim@amd.com>, Anthony Koo <anthony.koo@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, jun.lei@amd.com, wenjing.liu@amd.com,
 aric.cyr@amd.com, dillon.varone@amd.com, chiawen.huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 42/52] drm/amd/display: Disable seamless boot on
 128b/132b encoding
Date: Tue,  7 May 2024 19:07:08 -0400
Message-ID: <20240507230800.392128-42-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230800.392128-1-sashal@kernel.org>
References: <20240507230800.392128-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
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

From: Sung Joon Kim <sungjoon.kim@amd.com>

[ Upstream commit 6f0c228ed9184287031a66b46a79e5a3d2e73a86 ]

[why]
preOS will not support display mode programming and link training
for UHBR rates.

[how]
If we detect a sink that's UHBR capable, disable seamless boot

Reviewed-by: Anthony Koo <anthony.koo@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Sung Joon Kim <sungjoon.kim@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 3c3d613c5f00e..040b5c2a57586 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1804,6 +1804,9 @@ bool dc_validate_boot_timing(const struct dc *dc,
 		return false;
 	}
 
+	if (link->dpcd_caps.channel_coding_cap.bits.DP_128b_132b_SUPPORTED)
+		return false;
+
 	if (dc->link_srv->edp_is_ilr_optimization_required(link, crtc_timing)) {
 		DC_LOG_EVENT_LINK_TRAINING("Seamless boot disabled to optimize eDP link rate\n");
 		return false;
-- 
2.43.0

