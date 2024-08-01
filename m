Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6006943A91
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA5610E74D;
	Thu,  1 Aug 2024 00:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vg1O7d4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9617A10E757;
 Thu,  1 Aug 2024 00:16:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76704CE0292;
 Thu,  1 Aug 2024 00:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48829C116B1;
 Thu,  1 Aug 2024 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471407;
 bh=NYNk1E/z8UGKezZc/Rwzh6Vih06UFSdFwRsCJVJAFIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vg1O7d4N4/L275YhOob1NoHlqVDNR72Cxw4yHHOiySngNTNNxYblCfjVbjAbIxKx4
 PtDeoMpaMYckk9ww6rpUchZeSb2NhU/XxLe25Olu7TwQ2qLjJiULJTLeGfwjEg3KeB
 TeAd3cN0jWZSGVHmXta4ZOST5VvdaWkUQ6fYhuvKJf9Pm1MSzPQ3aowD5Y7cuQssmb
 mP6q21w8d6PQvYlTPdhi3p6ApfyZ59t/ZWpvYcBQGjtOs5FZEZWaXrxGe/5NYAe8Wt
 DffjG14MALB3VGt0f93xBPCcTBRAqH7Te3oHfveHG6MQqYlOP7Ud2NIljkZytkDiJT
 l0Lsjgqtb0InA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 charlene.liu@amd.com, Roman.Li@amd.com, syed.hassan@amd.com,
 josip.pavic@amd.com, ovidiu.bunea@amd.com, daniel.miess@amd.com,
 Qingqing.Zhuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 088/121] drm/amd/display: Check
 UnboundedRequestEnabled's value
Date: Wed, 31 Jul 2024 20:00:26 -0400
Message-ID: <20240801000834.3930818-88-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

[ Upstream commit a7b38c7852093385d0605aa3c8a2efd6edd1edfd ]

CalculateSwathAndDETConfiguration_params_st's UnboundedRequestEnabled
is a pointer (i.e. dml_bool_t *UnboundedRequestEnabled), and thus
if (p->UnboundedRequestEnabled) checks its address, not bool value.

This fixes 1 REVERSE_INULL issue reported by Coverity.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 3e919f5c00ca2..fee1df342f122 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -4282,7 +4282,7 @@ static void CalculateSwathAndDETConfiguration(struct display_mode_lib_scratch_st
 	}
 
 	*p->compbuf_reserved_space_64b = 2 * p->PixelChunkSizeInKByte * 1024 / 64;
-	if (p->UnboundedRequestEnabled) {
+	if (*p->UnboundedRequestEnabled) {
 		*p->compbuf_reserved_space_64b = dml_max(*p->compbuf_reserved_space_64b,
 				(dml_float_t)(p->ROBBufferSizeInKByte * 1024/64)
 				- (dml_float_t)(RoundedUpSwathSizeBytesY[SurfaceDoingUnboundedRequest] * TTUFIFODEPTH / MAXIMUMCOMPRESSION/64));
-- 
2.43.0

