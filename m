Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AC9858C8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567210E931;
	Wed, 25 Sep 2024 11:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OfA4jTbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9705710E929;
 Wed, 25 Sep 2024 11:47:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 266BA5C58D8;
 Wed, 25 Sep 2024 11:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4100C4CECE;
 Wed, 25 Sep 2024 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264828;
 bh=kF6RvkLxqI02RrnAuVGVZ3sm5FL0CzeDfPDuo0gquvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OfA4jTbogbkcTuFWbhTJMLuo7MtJ5GBatYmX8FXY0YbBSJr7vXe3wJpJiGmk6/qIF
 W14SwlJ8UbKpb83nm0Hl50mCg8z3kKVou1tHFDx6mSM8RK27sIY1MbnbX3Kz2OtVfR
 UrRmugOBoKdpT8C+DqSrHIwkaqqHHxt8h1DC0Sh+l17utF62BsOghF1iq4gJuM60K3
 TVRJzs8uQ0eAcMTBXWUdLo0kF+OeEicJs4+EilNm32F1QGYK+8suOCUpWUrTWVLbTb
 HG0PwZLaZezC5hiHr3MGRH6wdB5+quy6/pUwwOOby+nwkoqLxXnM33M8zv2Vn9pmLS
 Q4SyihhtyUmTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alvin.lee2@amd.com, wayne.lin@amd.com,
 wenjing.liu@amd.com, sungjoon.kim@amd.com, aurabindo.pillai@amd.com,
 dillon.varone@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 157/244] drm/amd/display: Check null pointers
 before using dc->clk_mgr
Date: Wed, 25 Sep 2024 07:26:18 -0400
Message-ID: <20240925113641.1297102-157-sashal@kernel.org>
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

[ Upstream commit 95d9e0803e51d5a24276b7643b244c7477daf463 ]

[WHY & HOW]
dc->clk_mgr is null checked previously in the same function, indicating
it might be null.

Passing "dc" to "dc->hwss.apply_idle_power_optimizations", which
dereferences null "dc->clk_mgr". (The function pointer resolves to
"dcn35_apply_idle_power_optimizations".)

This fixes 1 FORWARD_NULL issue reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 9e7ba846e032b..81fab62ef38eb 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -5383,7 +5383,8 @@ void dc_allow_idle_optimizations_internal(struct dc *dc, bool allow, char const
 	if (allow == dc->idle_optimizations_allowed)
 		return;
 
-	if (dc->hwss.apply_idle_power_optimizations && dc->hwss.apply_idle_power_optimizations(dc, allow))
+	if (dc->hwss.apply_idle_power_optimizations && dc->clk_mgr != NULL &&
+	    dc->hwss.apply_idle_power_optimizations(dc, allow))
 		dc->idle_optimizations_allowed = allow;
 }
 
-- 
2.43.0

