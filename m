Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620039D711A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8D010E522;
	Sun, 24 Nov 2024 13:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T3pLz6QC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9FA10E51F;
 Sun, 24 Nov 2024 13:44:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3C3E5C5639;
 Sun, 24 Nov 2024 13:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A595CC4CECC;
 Sun, 24 Nov 2024 13:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455841;
 bh=du1Bt53xiLW4ccF1yhrtiFQnbnCJCIvDdLzQKDrzXw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T3pLz6QCVCzCPhrsrhfnJsxury7oBHNRQuHr2GlI5hrFtdzCOguZM9nTlCGKxm/WC
 ownkwJ5+45A5BXS11PJREsHWD3ap4Ai32oj0VlecotmmMBYgJXSYopTYoAdcoa8TVZ
 2u0tZ8UuHSCMINwg5F5BjmRbu2pbVyzdIhrn0ub1eyDup8HEB6ceTnzMEfZXCfWmiC
 z5Lr7JV2ELRuOCNzLaPxWOTutgWGy8+uowVOHpAdQN5WVkbyIkRTGZ+En8UUQjolOO
 bqmb7cdeg7r8UlQBk9UcbRNzOTNYBFZ8emWZSITWO04sOx8Cb62LXUlOoXCrDeXSp+
 shtofyV081C3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leo Ma <hanghong.ma@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 chaitanya.dhere@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, Alvin.Lee2@amd.com,
 aurabindo.pillai@amd.com, Samson.Tam@amd.com, alex.hung@amd.com,
 joshua.aberback@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 53/87] drm/amd/display: Fix underflow when
 playing 8K video in full screen mode
Date: Sun, 24 Nov 2024 08:38:31 -0500
Message-ID: <20241124134102.3344326-53-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Leo Ma <hanghong.ma@amd.com>

[ Upstream commit 4007f07a47de4a277f4760cac3aed1b31d973eea ]

[Why&How]
Flickering observed while playing 8k HEVC-10 bit video in full screen
mode with black border. We didn't support this case for subvp.
Make change to the existing check to disable subvp for this corner case.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Leo Ma <hanghong.ma@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index ef0150a258b12..49d9e4d7b911e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -862,7 +862,7 @@ static void populate_dml21_plane_config_from_plane_state(struct dml2_context *dm
 	plane->immediate_flip = plane_state->flip_immediate;
 
 	plane->composition.rect_out_height_spans_vactive =
-		plane_state->dst_rect.height >= stream->timing.v_addressable &&
+		plane_state->dst_rect.height >= stream->src.height &&
 		stream->dst.height >= stream->timing.v_addressable;
 }
 
-- 
2.43.0

