Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7C15DB89
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD45C6F97C;
	Fri, 14 Feb 2020 15:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6D26F974;
 Fri, 14 Feb 2020 15:49:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E404224650;
 Fri, 14 Feb 2020 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695372;
 bh=w72o9lcZbaZku5BCWTjN8fzU+n6bQrTtcghNJBGySBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0/EytJ1FBGpi+CzroumUQWiU1E+lQZU19a8zwNTS/kFG+zePcj4gurTCJPolErIOQ
 ondLQH43Qi6GzN19EQYoAWemqaTeRpzUKyDxit45IB//J2hf3p3dCbZ/N/4h3z2vw1
 NUSsTS5Cnd9meR+mQXV0IwWxe4ST69ZfdH+WrE78=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 029/542] drm/amd/display: Map ODM memory correctly
 when doing ODM combine
Date: Fri, 14 Feb 2020 10:40:21 -0500
Message-Id: <20200214154854.6746-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 Nikola Cornij <nikola.cornij@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nikola Cornij <nikola.cornij@amd.com>

[ Upstream commit ec5b356c58941bb8930858155d9ce14ceb3d30a0 ]

[why]
Up to 4 ODM memory pieces are required per ODM combine and cannot
overlap, i.e. each ODM "session" has to use its own memory pieces.
The ODM-memory mapping is currently broken for generic case.

The maximum number of memory pieces is ASIC-dependent, but it's always
big enough to satisfy maximum number of ODM combines. Memory pieces
are mapped as a bit-map, i.e. one memory piece corresponds to one bit.
The OPTC doing ODM needs to select memory pieces by setting the
corresponding bits, making sure there's no overlap with other OPTC
instances that might be doing ODM.

The current mapping works only for OPTC instance indexes smaller than
3. For instance indexes 3 and up it practically maps no ODM memory,
causing black, gray or white screen in display configs that include
ODM on OPTC instance 3 or up.

[how]
Statically map two unique ODM memory pieces for each OPTC instance
and piece them together when programming ODM combine mode.

Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dcn20/dcn20_optc.c    | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
index 3b613fb93ef80..0162d3ffe268f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
@@ -233,12 +233,13 @@ void optc2_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_c
 		struct dc_crtc_timing *timing)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-	/* 2 pieces of memory required for up to 5120 displays, 4 for up to 8192 */
 	int mpcc_hactive = (timing->h_addressable + timing->h_border_left + timing->h_border_right)
 			/ opp_cnt;
-	int memory_mask = mpcc_hactive <= 2560 ? 0x3 : 0xf;
+	uint32_t memory_mask;
 	uint32_t data_fmt = 0;
 
+	ASSERT(opp_cnt == 2);
+
 	/* TODO: In pseudocode but does not affect maximus, delete comment if we dont need on asic
 	 * REG_SET(OTG_GLOBAL_CONTROL2, 0, GLOBAL_UPDATE_LOCK_EN, 1);
 	 * Program OTG register MASTER_UPDATE_LOCK_DB_X/Y to the position before DP frame start
@@ -246,9 +247,17 @@ void optc2_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_c
 	 *		MASTER_UPDATE_LOCK_DB_X, 160,
 	 *		MASTER_UPDATE_LOCK_DB_Y, 240);
 	 */
+
+	/* 2 pieces of memory required for up to 5120 displays, 4 for up to 8192,
+	 * however, for ODM combine we can simplify by always using 4.
+	 * To make sure there's no overlap, each instance "reserves" 2 memories and
+	 * they are uniquely combined here.
+	 */
+	memory_mask = 0x3 << (opp_id[0] * 2) | 0x3 << (opp_id[1] * 2);
+
 	if (REG(OPTC_MEMORY_CONFIG))
 		REG_SET(OPTC_MEMORY_CONFIG, 0,
-			OPTC_MEM_SEL, memory_mask << (optc->inst * 4));
+			OPTC_MEM_SEL, memory_mask);
 
 	if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
 		data_fmt = 1;
@@ -257,7 +266,6 @@ void optc2_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_c
 
 	REG_UPDATE(OPTC_DATA_FORMAT_CONTROL, OPTC_DATA_FORMAT, data_fmt);
 
-	ASSERT(opp_cnt == 2);
 	REG_SET_3(OPTC_DATA_SOURCE_SELECT, 0,
 			OPTC_NUM_OF_INPUT_SEGMENT, 1,
 			OPTC_SEG0_SRC_SEL, opp_id[0],
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
