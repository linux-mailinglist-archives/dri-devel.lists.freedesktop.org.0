Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16664943A0D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C75210E6F5;
	Thu,  1 Aug 2024 00:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s8ZNe8qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3FD10E6F5;
 Thu,  1 Aug 2024 00:09:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F93162569;
 Thu,  1 Aug 2024 00:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B63C32786;
 Thu,  1 Aug 2024 00:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722470999;
 bh=fgiPoZwn9qiy3fBSpCl/aJUVApcDXGDJwFtJim0JWyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s8ZNe8qyjqEjEbXd+mma1uZxDEUcDI0xnozori5w1SuvB+qeqR7/MKgDZAMbUEMpc
 czqrKZJqyvfHtP6ZYMGUfkw1RCx/XUQtgC3Os07dA1vtHZb9nAT6zHpFjqKpAmdL4M
 ZfjLDIymWpyHb9njX6oyv6Ussi4qn6ORaUEN2KK1f66RjwWUybS5fyA19nKEIFYpca
 DPODOtK0+4LufdZkWHyuakJTYryrNewKQJ7prY9bZj5pnEcu6bei3yl/wBRgSMm0gL
 BosHl5PHIBsfIlT3g359eeRx/THJdfexCj2NDIKa0LJr2ffL/Fh+/QbuQncGl+RHQK
 162+AF/7IBD5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, wenjing.liu@amd.com, wayne.lin@amd.com,
 zhikai.zhai@amd.com, arnd@arndb.de, cruise.hung@amd.com, ivlipski@amd.com,
 sungjoon.kim@amd.com, michael.strauss@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 015/121] drm/amd/display: Check index for
 aux_rd_interval before using
Date: Wed, 31 Jul 2024 19:59:13 -0400
Message-ID: <20240801000834.3930818-15-sashal@kernel.org>
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

[ Upstream commit 9ba2ea6337b4f159aecb177555a6a81da92d302e ]

aux_rd_interval has size of 7 and should be checked.

This fixes 3 OVERRUN and 1 INTEGER_OVERFLOW issues reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 1818970b8eaf7..b8e704dbe9567 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -914,10 +914,10 @@ static enum dc_status configure_lttpr_mode_non_transparent(
 			/* Driver does not need to train the first hop. Skip DPCD read and clear
 			 * AUX_RD_INTERVAL for DPTX-to-DPIA hop.
 			 */
-			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA && repeater_cnt > 0 && repeater_cnt < MAX_REPEATER_CNT)
 				link->dpcd_caps.lttpr_caps.aux_rd_interval[--repeater_cnt] = 0;
 
-			for (repeater_id = repeater_cnt; repeater_id > 0; repeater_id--) {
+			for (repeater_id = repeater_cnt; repeater_id > 0 && repeater_id < MAX_REPEATER_CNT; repeater_id--) {
 				aux_interval_address = DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1 +
 						((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (repeater_id - 1));
 				core_link_read_dpcd(
-- 
2.43.0

