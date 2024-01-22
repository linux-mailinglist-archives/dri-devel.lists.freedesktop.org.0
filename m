Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947F8367D5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF6B10F3F2;
	Mon, 22 Jan 2024 15:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C9610F3EB;
 Mon, 22 Jan 2024 15:19:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 17FEFCE1F9C;
 Mon, 22 Jan 2024 15:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E920FC433C7;
 Mon, 22 Jan 2024 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936760;
 bh=xJ4neBRc9rcores4yeDpzeEV0IVbHaw1JnsY+i1CBqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ERRuoMMvKAonYXcFCoWIhImQJ5K+ZUsxuShjNbJDVLnbeuSBK3v28TM4y+fJqgZPG
 idBmN7KWZ4dweHJH/gGFMNu4b+iE0tUyHGzwhuG+8PVxWL0NBqIEXS0JviRHm/iN7J
 OKyw8fvHdJP0mW3zAo402ak4BEPdessINPbBp+mCot0lHo+5Q27Uuzw4T+xH1limnM
 JoHivJ41cnOsqrTSquqYccKnjf8wlfQHnLapBcbZp6NbUYqbyOMZckz4u+opqEkdZp
 rWfqpMIzCdvgxpNPPb7qxx6JpMQ7yE5vEiPZ1VKqK4qSBm3kjhfG/YVpFzVEiYbvS5
 /TBCH28IbCZBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 21/23] drm/amd/display: make flip_timestamp_in_us
 a 64-bit variable
Date: Mon, 22 Jan 2024 10:18:01 -0500
Message-ID: <20240122151823.997644-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151823.997644-1-sashal@kernel.org>
References: <20240122151823.997644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.305
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
 mario.limonciello@amd.com, daniel@ffwll.ch, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 Josip Pavic <josip.pavic@amd.com>, christian.koenig@amd.com,
 hamza.mahfooz@amd.com
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
index b789cb2b354b..c96ff10365d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -357,7 +357,7 @@ union dc_tiling_info {
 	} gfx8;
 
 	struct {
-		unsigned int num_pipes;
+		unsigned long long num_pipes;
 		unsigned int num_banks;
 		unsigned int pipe_interleave;
 		unsigned int num_shader_engines;
-- 
2.43.0

