Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638E8366D7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3296910F315;
	Mon, 22 Jan 2024 15:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D971C10F324;
 Mon, 22 Jan 2024 15:07:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44B7961267;
 Mon, 22 Jan 2024 15:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DA5C433F1;
 Mon, 22 Jan 2024 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936054;
 bh=6SE301qFivhe2VzVYSo6NT02PkOD8xmAUqBWNdPdU2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o9Z/HBM9fwGzyHN70ksI1stTAgjUMJI5b3l/hk6uV5JMiiw2fAsV+6UoCAhxjIxNk
 vGmiZD+saouipltmWKvHAQBqSN0/BXSOzfXOs2N8+v72TMtNxMciEdbYBUFMgBBSC6
 MGSS7mK2CPgSB7lDT9Ufd+K0jX/gCGcaaqa2IWzZISTN3vkndMLfazWeXuD2Nz3DvD
 p0tf3Q93O1X806xS4cGNOpYHjSerVJ0iI9U87EwAfwFyFjRpwjp8kcnFanMdrc0cFo
 6SPwQcaMt5c/yOPaV1BHMUY9LVnfoObJcHbD2vytZQfiL/Xt9ue+uBipNfbC3cGwFX
 iU8Vi8sYwP/qw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 56/73] drm/amd/display: make flip_timestamp_in_us
 a 64-bit variable
Date: Mon, 22 Jan 2024 10:02:10 -0500
Message-ID: <20240122150432.992458-56-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 hamza.mahfooz@amd.com, daniel@ffwll.ch, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 Josip Pavic <josip.pavic@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Josip Pavic <josip.pavic@amd.com>

[ Upstream commit 6fb12518ca58412dc51054e2a7400afb41328d85 ]

[Why]
This variable currently overflows after about 71 minutes. This doesn't
cause any known functional issues but it does make debugging more
difficult.

[How]
Make it a 64-bit variable.

Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Josip Pavic <josip.pavic@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index 99880b08cda0..00de342e5290 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -244,7 +244,7 @@ enum pixel_format {
 #define DC_MAX_DIRTY_RECTS 3
 struct dc_flip_addrs {
 	struct dc_plane_address address;
-	unsigned int flip_timestamp_in_us;
+	unsigned long long flip_timestamp_in_us;
 	bool flip_immediate;
 	/* TODO: add flip duration for FreeSync */
 	bool triplebuffer_flips;
-- 
2.43.0

