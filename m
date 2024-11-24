Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754119D7066
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79F110E4CC;
	Sun, 24 Nov 2024 13:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ektTkZ2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C63E10E039;
 Sun, 24 Nov 2024 13:33:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0922F5C4A5F;
 Sun, 24 Nov 2024 13:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2F3C4CECC;
 Sun, 24 Nov 2024 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455214;
 bh=gQhLTHHexreWu6vGLnNR+R7mKdozoHlwdHtZyWiXySU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ektTkZ2b+ZtSD8tmlZTic5JN1DF8LKy++IUXRMHc2jaZ2dNGAE+kOdHCgijhfQdJv
 HLH2U2WSsCHcJYC7iHYuX2xUsQ34QvQ5XZP27j420xFWMAah/LQmjAU/V4pApR8UMu
 qlWg9smNGVomHiA5tkyMTz8SyA7o0w9DrUZF3M5pBc2X645rl1y654ZfhJjaoxh8F0
 LjMyw73t4MoRLOf5WC0WllUCEHXZk0lb0O/t7t/Ir1HF2FiuD7pudMNlxVbcuvRgDr
 EitHOR6VYsA/2ISBsRAlOIxKUtEcXTvL2O7DU+Ez9IVvK2blkfnr3JV2sMCPLy5ktN
 iecwDP0Yr3UGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael Strauss <michael.strauss@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Ovidiu Bunea <ovidiu.bunea@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, alex.hung@amd.com, george.shen@amd.com, daniel.sa@amd.com,
 Ausef.Yousof@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 016/107] drm/amd/display: Block UHBR Based On
 USB-C PD Cable ID
Date: Sun, 24 Nov 2024 08:28:36 -0500
Message-ID: <20241124133301.3341829-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Michael Strauss <michael.strauss@amd.com>

[ Upstream commit 4f01a68751194d05280d659a65758c09e4af04d6 ]

[WHY]
Currently the absence of UHBR cable ID caps from USB-C PD does not block UHBR
rates. In situations where DPCD reports valid UHBR capability but USB-C PD
does not, such as using a USB-C to DP1.4 dongle connected to a native DP2.1
cable, link loss and lightup failures can be seen as a result.

Additionally, in edge cases where a platform supports cable ID but DMUB
doesn't correctly return cable ID caps, driver currently also allows UHBR.

[HOW]
Block UHBR rates over DP alt mode if cable id indicates no UHBR support.
Additionally, block UHBR rates if a cable ID supported platform receives no
reply from a DMUB cable id query.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Reviewed-by: Ovidiu Bunea <ovidiu.bunea@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/link/protocols/link_dp_capability.c    | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index d78c8ec4de79e..fe4aa2c158eae 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1409,7 +1409,8 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 
 	if (!link->ctx->dmub_srv ||
 			link->ep_type != DISPLAY_ENDPOINT_PHY ||
-			link->link_enc->features.flags.bits.DP_IS_USB_C == 0)
+			link->link_enc->features.flags.bits.DP_IS_USB_C == 0 ||
+			link->link_enc->features.flags.bits.IS_DP2_CAPABLE == 0)
 		return false;
 
 	memset(&cmd, 0, sizeof(cmd));
@@ -1422,7 +1423,9 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 		cable_id->raw = cmd.cable_id.data.output_raw;
 		DC_LOG_DC("usbc_cable_id = %d.\n", cable_id->raw);
 	}
-	return cmd.cable_id.header.ret_status == 1;
+
+	ASSERT(cmd.cable_id.header.ret_status);
+	return true;
 }
 
 static void retrieve_cable_id(struct dc_link *link)
@@ -2103,6 +2106,8 @@ struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 	/* get max link encoder capability */
 	if (link_enc)
 		link_enc->funcs->get_max_link_cap(link_enc, &max_link_cap);
+	else
+		return max_link_cap;
 
 	/* Lower link settings based on sink's link cap */
 	if (link->reported_link_cap.lane_count < max_link_cap.lane_count)
@@ -2136,10 +2141,15 @@ struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 	 */
 	cable_max_link_rate = get_cable_max_link_rate(link);
 
-	if (!link->dc->debug.ignore_cable_id &&
-			cable_max_link_rate != LINK_RATE_UNKNOWN) {
-		if (cable_max_link_rate < max_link_cap.link_rate)
-			max_link_cap.link_rate = cable_max_link_rate;
+	if (!link->dc->debug.ignore_cable_id) {
+		if (cable_max_link_rate != LINK_RATE_UNKNOWN)
+			// cable max link rate known
+			max_link_cap.link_rate = MIN(max_link_cap.link_rate, cable_max_link_rate);
+		else if (link_enc->funcs->is_in_alt_mode && link_enc->funcs->is_in_alt_mode(link_enc))
+			// cable max link rate ambiguous, DP alt mode, limit to HBR3
+			max_link_cap.link_rate = MIN(max_link_cap.link_rate, LINK_RATE_HIGH3);
+		//else {}
+			// cable max link rate ambiguous, DP, do nothing
 
 		if (!link->dpcd_caps.cable_id.bits.UHBR13_5_CAPABILITY &&
 				link->dpcd_caps.cable_id.bits.CABLE_TYPE >= 2)
-- 
2.43.0

