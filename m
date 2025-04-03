Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E99A7AAA6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08D010EA9C;
	Thu,  3 Apr 2025 19:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hu7zNH0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889910EA9A;
 Thu,  3 Apr 2025 19:14:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EEA70A45B9B;
 Thu,  3 Apr 2025 19:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68715C4CEE3;
 Thu,  3 Apr 2025 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707687;
 bh=rkKuz933FEHxdUL/5+1WUTOu7CoJgDLgYSN+J1Ym2w4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hu7zNH0Wn9OexD7i/nYjV3zzSLFao2uK93T32EYgVIacGHy6ZwPj+IKBW59TLh2m8
 QlRUUhzDy+bTLas4MY0Ev05vSS3QpUYASQpQSEoUtVvmsHrlmD2htMAT+1nJc/437s
 6HgUQKe+gbyK8db7utgQfRAvdWTk3tMgP1DUYYRy7A6T4wapd9FO7kbIYJ5TUSBYZl
 0lzeaNlSW+MWrSlsmfXbEVlLWK837bindwUlhNXLF0yhar3Hz66h4ZBX26Rac4YC86
 kgYm4IeXpYHxVZDuGcR1GDQyBiCG5mokyFsT023j7VRmTjI05oj5id6GHmdeANzC4m
 nyhufohAGEX/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryan Seto <ryanseto@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, siqueira@igalia.com, alex.hung@amd.com,
 colin.i.king@gmail.com, aurabindo.pillai@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 32/44] drm/amd/display: Prevent VStartup Overflow
Date: Thu,  3 Apr 2025 15:13:01 -0400
Message-Id: <20250403191313.2679091-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
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

From: Ryan Seto <ryanseto@amd.com>

[ Upstream commit 29c1c20496a7a9bafe2bc2f833d69aa52e0f2c2d ]

[Why]
For some VR headsets with large blanks, it's possible
to overflow the OTG_VSTARTUP_PARAM:VSTARTUP_START
register. This can lead to incorrect DML calculations
and underflow downstream.

[How]
Min the calcualted max_vstartup_lines with the max
value of the register.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Ryan Seto <ryanseto@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 8ed49a9df3780..c1ff869512f27 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -15,6 +15,7 @@
 //#define DML_MODE_SUPPORT_USE_DPM_DRAM_BW
 //#define DML_GLOBAL_PREFETCH_CHECK
 #define ALLOW_SDPIF_RATE_LIMIT_PRE_CSTATE
+#define DML_MAX_VSTARTUP_START 1023
 
 const char *dml2_core_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type)
 {
@@ -3726,6 +3727,7 @@ static unsigned int CalculateMaxVStartup(
 	dml2_printf("DML::%s: vblank_avail = %u\n", __func__, vblank_avail);
 	dml2_printf("DML::%s: max_vstartup_lines = %u\n", __func__, max_vstartup_lines);
 #endif
+	max_vstartup_lines = (unsigned int)math_min2(max_vstartup_lines, DML_MAX_VSTARTUP_START);
 	return max_vstartup_lines;
 }
 
-- 
2.39.5

