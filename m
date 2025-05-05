Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B6AAA156
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6162610E53A;
	Mon,  5 May 2025 22:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lfSZi23A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7AB10E534;
 Mon,  5 May 2025 22:46:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D1895C0687;
 Mon,  5 May 2025 22:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70548C4CEE4;
 Mon,  5 May 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485174;
 bh=IM+quJAHAyIiqqydPfve0lj9WWv+tWG5QphYLrWXjIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lfSZi23Akh1MtCPOeXv3yPUueE3YnRlJvvaYk7VHyzFTQoKW9tzqgAtQKSXG19Yoa
 YzaFTv/deVheEltH9b61rXJoTsTvHTPOSeVY1jj9Qfh8lD2QNj6Oa20EMePoS0MhMm
 0ar0IN+R47geJsIPLNsePhNJur2kjItvgMrb/5kAcTMyN9v/NxWngrVMIDEHgyg4qr
 rcFbOdudzorSGtAOzQm13R48vO1TLFk3/2wcZHShM+NmjptHcAh+BxBGCYQ5yWwh3r
 4KSUAQ0GIgQWKolJz6KFqMrBpz08Iculw0KJU9oKG8JV1BjCPPD8j6pQbIupt/CUJJ
 5HaChF5lwWNbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: George Shen <george.shen@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, roman.li@amd.com,
 michael.strauss@amd.com, PeiChen.Huang@amd.com, Ausef.Yousof@amd.com,
 Cruise.Hung@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 198/486] drm/amd/display: Skip checking FRL_MODE
 bit for PCON BW determination
Date: Mon,  5 May 2025 18:34:34 -0400
Message-Id: <20250505223922.2682012-198-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: George Shen <george.shen@amd.com>

[ Upstream commit 0584bbcf0c53c133081100e4f4c9fe41e598d045 ]

[Why/How]
Certain PCON will clear the FRL_MODE bit despite supporting the link BW
indicated in the other bits.

Thus, skip checking the FRL_MODE bit when interpreting the
hdmi_encoded_link_bw struct.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/link/protocols/link_dp_capability.c    | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 885e749cdc6e9..23e650e39910e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -250,21 +250,21 @@ static uint32_t intersect_frl_link_bw_support(
 {
 	uint32_t supported_bw_in_kbps = max_supported_frl_bw_in_kbps;
 
-	// HDMI_ENCODED_LINK_BW bits are only valid if HDMI Link Configuration bit is 1 (FRL mode)
-	if (hdmi_encoded_link_bw.bits.FRL_MODE) {
-		if (hdmi_encoded_link_bw.bits.BW_48Gbps)
-			supported_bw_in_kbps = 48000000;
-		else if (hdmi_encoded_link_bw.bits.BW_40Gbps)
-			supported_bw_in_kbps = 40000000;
-		else if (hdmi_encoded_link_bw.bits.BW_32Gbps)
-			supported_bw_in_kbps = 32000000;
-		else if (hdmi_encoded_link_bw.bits.BW_24Gbps)
-			supported_bw_in_kbps = 24000000;
-		else if (hdmi_encoded_link_bw.bits.BW_18Gbps)
-			supported_bw_in_kbps = 18000000;
-		else if (hdmi_encoded_link_bw.bits.BW_9Gbps)
-			supported_bw_in_kbps = 9000000;
-	}
+	/* Skip checking FRL_MODE bit, as certain PCON will clear
+	 * it despite supporting the link BW indicated in the other bits.
+	 */
+	if (hdmi_encoded_link_bw.bits.BW_48Gbps)
+		supported_bw_in_kbps = 48000000;
+	else if (hdmi_encoded_link_bw.bits.BW_40Gbps)
+		supported_bw_in_kbps = 40000000;
+	else if (hdmi_encoded_link_bw.bits.BW_32Gbps)
+		supported_bw_in_kbps = 32000000;
+	else if (hdmi_encoded_link_bw.bits.BW_24Gbps)
+		supported_bw_in_kbps = 24000000;
+	else if (hdmi_encoded_link_bw.bits.BW_18Gbps)
+		supported_bw_in_kbps = 18000000;
+	else if (hdmi_encoded_link_bw.bits.BW_9Gbps)
+		supported_bw_in_kbps = 9000000;
 
 	return supported_bw_in_kbps;
 }
-- 
2.39.5

