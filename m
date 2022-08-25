Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0245A061C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E3FABC61;
	Thu, 25 Aug 2022 01:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB877D0BE8;
 Thu, 25 Aug 2022 01:37:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB0C9B826C8;
 Thu, 25 Aug 2022 01:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35473C433C1;
 Thu, 25 Aug 2022 01:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391450;
 bh=XFGhVs/LHdWs58uDFg8hQoy3JeWZ3/j6TuTHMImljLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b68hAwoO0vGAS2DAHyvQdcqNDzXxydrNNS+nl2X7hMZfCmPzPbItUZh8zjt6UM861
 ePMREHICyunnULwuQWLq8lgAPKCkr/LqboYA9AqvPOF+LZbJ0A+s0FDpxncTT/SUcJ
 1pJVk1qfb90MLcHl8Kjni4SXL+cp8fBs6qB0vBhJAaQUNtkdt8AFSVGIX+wB6fH3m+
 hXgFmrw0yUBuwPhUB+opLgkxdIoi84+o7liq2TR7fhZWc3u/+nPUWedxckQrNM37iR
 7xssobIkB90SXRZLgMr08Z8lJD60i1NmjvGOHI7vMlCIzu8NadbyjULJ5yjf1TxihY
 BolBN9p2K0BWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 04/20] drm/amd/display: Fix HDMI VSIF V3
 incorrect issue
Date: Wed, 24 Aug 2022 21:36:56 -0400
Message-Id: <20220825013713.22656-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013713.22656-1-sashal@kernel.org>
References: <20220825013713.22656-1-sashal@kernel.org>
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
Cc: felipe.clark@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Angus.Wang@amd.com, Anthony Koo <Anthony.Koo@amd.com>,
 Sasha Levin <sashal@kernel.org>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, Bing.Guo@amd.com, HaoPing.Liu@amd.com,
 sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 harry.vanzylldejong@amd.com, Leo Ma <hanghong.ma@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, lv.ruyi@zte.com.cn, Xinhui.Pan@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Ma <hanghong.ma@amd.com>

[ Upstream commit 0591183699fceeafb4c4141072d47775de83ecfb ]

[Why]
Reported from customer the checksum in AMD VSIF V3 is incorrect and
causing blank screen issue.

[How]
Fix the packet length issue on AMD HDMI VSIF V3.

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Leo Ma <hanghong.ma@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/modules/freesync/freesync.c   | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index b99aa232bd8b..4bee6d018bfa 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -567,10 +567,6 @@ static void build_vrr_infopacket_data_v1(const struct mod_vrr_params *vrr,
 	 * Note: We should never go above the field rate of the mode timing set.
 	 */
 	infopacket->sb[8] = (unsigned char)((vrr->max_refresh_in_uhz + 500000) / 1000000);
-
-	/* FreeSync HDR */
-	infopacket->sb[9] = 0;
-	infopacket->sb[10] = 0;
 }
 
 static void build_vrr_infopacket_data_v3(const struct mod_vrr_params *vrr,
@@ -638,10 +634,6 @@ static void build_vrr_infopacket_data_v3(const struct mod_vrr_params *vrr,
 
 	/* PB16 : Reserved bits 7:1, FixedRate bit 0 */
 	infopacket->sb[16] = (vrr->state == VRR_STATE_ACTIVE_FIXED) ? 1 : 0;
-
-	//FreeSync HDR
-	infopacket->sb[9] = 0;
-	infopacket->sb[10] = 0;
 }
 
 static void build_vrr_infopacket_fs2_data(enum color_transfer_func app_tf,
@@ -726,8 +718,7 @@ static void build_vrr_infopacket_header_v2(enum signal_type signal,
 		/* HB2  = [Bits 7:5 = 0] [Bits 4:0 = Length = 0x09] */
 		infopacket->hb2 = 0x09;
 
-		*payload_size = 0x0A;
-
+		*payload_size = 0x09;
 	} else if (dc_is_dp_signal(signal)) {
 
 		/* HEADER */
@@ -776,9 +767,9 @@ static void build_vrr_infopacket_header_v3(enum signal_type signal,
 		infopacket->hb1 = version;
 
 		/* HB2  = [Bits 7:5 = 0] [Bits 4:0 = Length] */
-		*payload_size = 0x10;
-		infopacket->hb2 = *payload_size - 1; //-1 for checksum
+		infopacket->hb2 = 0x10;
 
+		*payload_size = 0x10;
 	} else if (dc_is_dp_signal(signal)) {
 
 		/* HEADER */
-- 
2.35.1

