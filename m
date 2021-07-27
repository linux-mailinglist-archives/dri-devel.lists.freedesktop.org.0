Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB73D75DD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048C66E40C;
	Tue, 27 Jul 2021 13:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81446E40C;
 Tue, 27 Jul 2021 13:19:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D164E61AA5;
 Tue, 27 Jul 2021 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391973;
 bh=L7w7cyYiD/pSgblXZRqxi2P781WEAhmXqt+HMtYm/iI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mzDNbnZodN7QzjJe7WlXzWUiwSmlmdOrrhH8izZwe4wvwUv+b8HRgp8ZRlMrjSr+5
 VDx36K8b+GYJuq3A8xxIibpT+6EMLCgeGfJo1USIqo6uhnmeMe6nGYCFLUPbDGLly7
 u4f7hDHCWGSFmrI5Q95VP/Ij8FGZ1FzdEsLrkCgT6ddJ3vpiBVQ1iLdFJbIL/kZJ2a
 RQeWynPuw5LIP6JsLmWpsURE2woKnDJ0JxZVSY8qXXd3HNwdEBETo+yxRhN6NY7/Ea
 avtzYuTQYBVb3aUqkVKRixAwidpOqy3dddPywJq8JGCxPhx9+52soiOy3+LORA7fue
 0zIzVQsR+okAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 18/21] drm/amd/display: Fix max vstartup
 calculation for modes with borders
Date: Tue, 27 Jul 2021 09:19:05 -0400
Message-Id: <20210727131908.834086-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131908.834086-1-sashal@kernel.org>
References: <20210727131908.834086-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[ Upstream commit d7940911fc0754d99b208f0e3098762d39f403a0 ]

[Why]
Vertical and horizontal borders in timings are treated as increasing the
active area - vblank and hblank actually shrink.

Our input into DML does not include these borders so it incorrectly
assumes it has more time than available for vstartup and tmdl
calculations for some modes with borders.

An example of such a timing would be 640x480@72Hz:

h_total: 832
h_border_left: 8
h_addressable: 640
h_border_right: 8
h_front_porch: 16
h_sync_width: 40
v_total: 520
v_border_top: 8
v_addressable: 480
v_border_bottom: 8
v_front_porch: 1
v_sync_width: 3
pix_clk_100hz: 315000

[How]
Include borders as part of destination vactive/hactive.

This change DCN20+ so it has wide impact, but the destination vactive
and hactive are only really used for vstartup calculation anyway.

Most modes do not have vertical or horizontal borders.

Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index d7d70b9bb387..81f583733fa8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2093,8 +2093,10 @@ int dcn20_populate_dml_pipes_from_context(
 				- timing->v_border_bottom;
 		pipes[pipe_cnt].pipe.dest.htotal = timing->h_total;
 		pipes[pipe_cnt].pipe.dest.vtotal = v_total;
-		pipes[pipe_cnt].pipe.dest.hactive = timing->h_addressable;
-		pipes[pipe_cnt].pipe.dest.vactive = timing->v_addressable;
+		pipes[pipe_cnt].pipe.dest.hactive =
+			timing->h_addressable + timing->h_border_left + timing->h_border_right;
+		pipes[pipe_cnt].pipe.dest.vactive =
+			timing->v_addressable + timing->v_border_top + timing->v_border_bottom;
 		pipes[pipe_cnt].pipe.dest.interlaced = timing->flags.INTERLACE;
 		pipes[pipe_cnt].pipe.dest.pixel_rate_mhz = timing->pix_clk_100hz/10000.0;
 		if (timing->timing_3d_format == TIMING_3D_FORMAT_HW_FRAME_PACKING)
-- 
2.30.2

