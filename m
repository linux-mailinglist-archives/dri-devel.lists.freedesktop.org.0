Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7AAAA2B0
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB9A10E5C5;
	Mon,  5 May 2025 23:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U5Lca7IT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B7910E5C4;
 Mon,  5 May 2025 23:04:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 55BBBA4D304;
 Mon,  5 May 2025 22:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3404C4CEED;
 Mon,  5 May 2025 23:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486243;
 bh=VxKNg81st5yBFqNHGE1oif7k67R0iHenoDCXfIenh+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U5Lca7ITHCuIXzLa6SaT+NuUDUvh7AMp+XxupYJKmDiKPA7otZ0rGAhMdsMfyiWj0
 GHs6BERaIp7OmZiMkiMde1x2uuQclpBTS1u7SdAxZFw9MSDHb7UDJrXtthqkis9yWi
 dGEaHREksNWXX+PojYakPSLFc+nfobaVstppdBdlWHMAzeKLa0VbcK5JK/4BS6Hk/2
 B9TvtIbGAjR2K9MUCSd2MoJHaDM+juPh7YVE18TnooKJeCOrqS9G7I7cnI49tqhMuc
 moSVamOVTI/wGh8YdVTBwJuJG1ax2jp+XNPOnlFlqipX4q+gVDsfZ1sUZOGJa/vlHb
 KxWsrTVpNx2Zg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, michael.strauss@amd.com,
 zaeem.mohamed@amd.com, PeiChen.Huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 223/294] drm/amd/display: Don't try AUX
 transactions on disconnected link
Date: Mon,  5 May 2025 18:55:23 -0400
Message-Id: <20250505225634.2688578-223-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

From: Ilya Bakoulin <Ilya.Bakoulin@amd.com>

[ Upstream commit e8bffa52e0253cfd689813a620e64521256bc712 ]

[Why]
Setting link DPMS off in response to HPD disconnect creates AUX
transactions on a link that is supposed to be disconnected. This can
cause issues in some cases when the sink re-asserts HPD and expects
source to re-enable the link.

[How]
Avoid AUX transactions on disconnected link.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index 9bde0c8bf914a..f01a3df584552 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -74,7 +74,8 @@ void dp_disable_link_phy(struct dc_link *link,
 	struct dc  *dc = link->ctx->dc;
 
 	if (!link->wa_flags.dp_keep_receiver_powered &&
-		!link->skip_implict_edp_power_control)
+			!link->skip_implict_edp_power_control &&
+			link->type != dc_connection_none)
 		dpcd_write_rx_power_ctrl(link, false);
 
 	dc->hwss.disable_link_output(link, link_res, signal);
@@ -159,8 +160,9 @@ enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource
 	} else {
 		if (link->fec_state == dc_link_fec_ready) {
 			fec_config = 0;
-			core_link_write_dpcd(link, DP_FEC_CONFIGURATION,
-				&fec_config, sizeof(fec_config));
+			if (link->type != dc_connection_none)
+				core_link_write_dpcd(link, DP_FEC_CONFIGURATION,
+					&fec_config, sizeof(fec_config));
 
 			link_enc->funcs->fec_set_ready(link_enc, false);
 			link->fec_state = dc_link_fec_not_ready;
-- 
2.39.5

