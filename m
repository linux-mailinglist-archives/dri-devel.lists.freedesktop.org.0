Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E785F264A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 00:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03F810E157;
	Sun,  2 Oct 2022 22:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7DF10E156;
 Sun,  2 Oct 2022 22:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E4EA60EF1;
 Sun,  2 Oct 2022 22:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44144C433C1;
 Sun,  2 Oct 2022 22:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664751105;
 bh=HfLz4j7DE39PIpdF5+dXZg8UWtbplrHysO5ptm/cBFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uOD8SV4PYbVY5tOOpSyAQQ1Atcr2E+4/UFL68yPUcAdd2DuJcpOBITGUVjYbnHDNN
 uGfyjMPTMt3tJo0mkh8gK8eL4AFhXFiD5MNdzaB0mSOADNIiscIWp7ZbaMFt5RNNN1
 jclRJP36dluwZ4ndftryc4zi+IgdK9GBeiSKPFEgN6fpuylP7loq6g+YscPfehtlWp
 rG/4kjt2xHEyuj0nQImt9KEDR24H4ZzDpi4UrThhnYINLj7pAigGG7OEG9CzTPZr0o
 XMt4s/qCHZ8Sv8fx+UvroycvHFdr5GU+ocbuHdjNQ5MfzHIgfDfPjWW0ck0zACXkOe
 POWk24VhCk5nQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 18/20] drm/amd/display: Assume an LTTPR is always
 present on fixed_vs links
Date: Sun,  2 Oct 2022 18:50:57 -0400
Message-Id: <20221002225100.239217-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002225100.239217-1-sashal@kernel.org>
References: <20221002225100.239217-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, sunpeng.li@amd.com,
 mikita.lipski@amd.com, george.shen@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun.Lei@amd.com, christian.koenig@amd.com, Jimmy.Kizito@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Strauss <michael.strauss@amd.com>

[ Upstream commit 29956d0fded036a570bd8e7d4ea4b1a1730307d2 ]

[WHY]
LTTPRs can in very rare instsances fail to increment DPCD LTTPR count.
This results in aux-i LTTPR requests to be sent to the wrong DPCD
address, which causes link training failure.

[HOW]
Override internal repeater count if fixed_vs flag is set for a given link

Reviewed-by: George Shen <George.Shen@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 6d5dc5ab3d8c..a6ff1b17fd22 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3703,6 +3703,14 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
 				lttpr_dpcd_data[DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT -
 								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
 
+		/* If this chip cap is set, at least one retimer must exist in the chain
+		 * Override count to 1 if we receive a known bad count (0 or an invalid value) */
+		if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN &&
+				(dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) == 0)) {
+			ASSERT(0);
+			link->dpcd_caps.lttpr_caps.phy_repeater_cnt = 0x80;
+		}
+
 		/* Attempt to train in LTTPR transparent mode if repeater count exceeds 8. */
 		is_lttpr_present = (dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt) != 0 &&
 				link->dpcd_caps.lttpr_caps.max_lane_count > 0 &&
-- 
2.35.1

