Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599B89D70E9
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175010E509;
	Sun, 24 Nov 2024 13:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X6lvzjYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549AB10E4F5;
 Sun, 24 Nov 2024 13:41:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3DB35A40B73;
 Sun, 24 Nov 2024 13:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C328FC4CED1;
 Sun, 24 Nov 2024 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455695;
 bh=CpRPvOOUGihhsBREB3zmzzH4lVmAi3W3BoQar+F2gG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X6lvzjYlwo9isUwQ349FguT1+XsKM4+L+JoigE4ZKCslvs5YfFeOCIzoPD22FTScV
 LcRLceqJ3pnaQE/nCmgcMaEemXF2+QuUyBqX9zZVY1taSa7GafAuDTGUKBEw+v0Qxm
 R7KkPQtZ6xGDrStZGSlvk2uiBW3o1y+i8zNMwsOX3fTBPsWZEPtd77ezlZg0CVNWIz
 9QpZi8sjRrw5Cr+5k11TlAwc9A20w0Cwu4ARf3sgyYigtUfPFJfk3+FsBs1g1x1Yl/
 xa5/FADe7V7yZBUFr+BZzThN8HxzfUZI6WQnjVQUn7qRaMfKXvY5nwlEFuo7J90Bdg
 z9bJVLRAfWViA==
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
Subject: [PATCH AUTOSEL 6.11 15/87] drm/amd/display: Block UHBR Based On USB-C
 PD Cable ID
Date: Sun, 24 Nov 2024 08:37:53 -0500
Message-ID: <20241124134102.3344326-15-sashal@kernel.org>
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
index 60015e94c4aa8..ae6d7e3d117e2 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1402,7 +1402,8 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 
 	if (!link->ctx->dmub_srv ||
 			link->ep_type != DISPLAY_ENDPOINT_PHY ||
-			link->link_enc->features.flags.bits.DP_IS_USB_C == 0)
+			link->link_enc->features.flags.bits.DP_IS_USB_C == 0 ||
+			link->link_enc->features.flags.bits.IS_DP2_CAPABLE == 0)
 		return false;
 
 	memset(&cmd, 0, sizeof(cmd));
@@ -1415,7 +1416,9 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 		cable_id->raw = cmd.cable_id.data.output_raw;
 		DC_LOG_DC("usbc_cable_id = %d.\n", cable_id->raw);
 	}
-	return cmd.cable_id.header.ret_status == 1;
+
+	ASSERT(cmd.cable_id.header.ret_status);
+	return true;
 }
 
 static void retrieve_cable_id(struct dc_link *link)
@@ -2087,6 +2090,8 @@ struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 	/* get max link encoder capability */
 	if (link_enc)
 		link_enc->funcs->get_max_link_cap(link_enc, &max_link_cap);
+	else
+		return max_link_cap;
 
 	/* Lower link settings based on sink's link cap */
 	if (link->reported_link_cap.lane_count < max_link_cap.lane_count)
@@ -2120,10 +2125,15 @@ struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
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

