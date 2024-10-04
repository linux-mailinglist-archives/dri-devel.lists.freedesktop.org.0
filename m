Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB5990B35
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FF110EA6B;
	Fri,  4 Oct 2024 18:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kzV6aP0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065E310EA6B;
 Fri,  4 Oct 2024 18:24:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 413205C04CF;
 Fri,  4 Oct 2024 18:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2E8C4CECC;
 Fri,  4 Oct 2024 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728066263;
 bh=cszQHSgiIse5imySQqkeEZNtFj3mZdir1yrb0GQ8BJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kzV6aP0WjSJf6A6OWkTuf8Fk37Db+gMXsyIHrcKNANFWvOuJYXeFPUZ+boBr7zElc
 evwgBT97na9i5U+ysmnJqmcPUrlh3BvZItVubjV+Xp2yg9bSsB7lsoxwboOE2uvlpR
 C+B2Ih9mS2gpAOAvP3tOmr1Cq49o2fjwqty/gR3uTVOpP+qJcXKD067+3yiwPfVpxK
 /lanj72TDKlNSrvXK5HTD8xRnBQoQ12rcmGobhoH8FUfdoDsU8lUVcaG6RUBFezB//
 uyJ7opBn7yd676f5EQwQwsDd0xASgR7S15ZPzGj+MeCGYWaU7Z1/z9t7fLy3aSehqJ
 os7tn2OfkGPpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, wenjing.liu@amd.com,
 sungjoon.kim@amd.com, nicholas.kazlauskas@amd.com, dillon.varone@amd.com,
 aurabindo.pillai@amd.com, chiawen.huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 67/70] drm/amd/display: Check null pointer before
 dereferencing se
Date: Fri,  4 Oct 2024 14:21:05 -0400
Message-ID: <20241004182200.3670903-67-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182200.3670903-1-sashal@kernel.org>
References: <20241004182200.3670903-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.13
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

[ Upstream commit ff599ef6970ee000fa5bc38d02fa5ff5f3fc7575 ]

[WHAT & HOW]
se is null checked previously in the same function, indicating
it might be null; therefore, it must be checked when used again.

This fixes 1 FORWARD_NULL issue reported by Coverity.

Acked-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index da237f718dbdd..128fb580b789f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1816,7 +1816,7 @@ bool dc_validate_boot_timing(const struct dc *dc,
 		if (crtc_timing->pix_clk_100hz != pix_clk_100hz)
 			return false;
 
-		if (!se->funcs->dp_get_pixel_format)
+		if (!se || !se->funcs->dp_get_pixel_format)
 			return false;
 
 		if (!se->funcs->dp_get_pixel_format(
-- 
2.43.0

