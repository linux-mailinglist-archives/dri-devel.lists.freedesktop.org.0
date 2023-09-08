Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C99798F2C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDA710E119;
	Fri,  8 Sep 2023 19:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6FC89CE3;
 Fri,  8 Sep 2023 19:30:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18B13614BF;
 Fri,  8 Sep 2023 19:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F86BC433CC;
 Fri,  8 Sep 2023 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201423;
 bh=5zPq/XyH5jXlC8JTDfk8+mrKEFb89WHM5ZU/+N7PGS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uoO3KB48LR9OVxmcnyh+UYV7JwD4XCOW0dmi7YHbRrlNdAeR3JWHbr4S7ZeBO0uIW
 khqqhSxyeeluBiU0hD2aP5K+1Z37Gh7gOBvKOMEI/J9K594iwSvdiKdTnj1MaI9niF
 QxzpU8Yj1Ajzxy+CG+Lx0zSJSzcgQVxG34Hk+1Jg2kdugcupjLIzSTQC4WGi4ZzWg4
 w9KyDlQnMeAi05T23oNs7ggFQFsnWXfenyw6rYca2Ehm+uLML/J2Ynr1fUB5ukmkHC
 2ooCsoevdEWGroOUhQ3V1TYgcYR+A88211+FCAS9b46j+vPQSLtqY73hZs7rhMAaln
 02DAZWDnmCDVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 15/36] drm/amd/display: Fix underflow issue on
 175hz timing
Date: Fri,  8 Sep 2023 15:28:26 -0400
Message-Id: <20230908192848.3462476-15-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908192848.3462476-1-sashal@kernel.org>
References: <20230908192848.3462476-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
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
Cc: Sasha Levin <sashal@kernel.org>, Dillon Varone <dillon.varone@amd.com>,
 chris.park@amd.com, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, samson.tam@amd.com,
 nathan@kernel.org, sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alvin.Lee2@amd.com, george.shen@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Jun.Lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leo Ma <hanghong.ma@amd.com>

[ Upstream commit 735688eb905db529efea0c78466fccc1461c3fde ]

[Why]
Screen underflows happen on 175hz timing for 3 plane overlay case.

[How]
Based on dst y prefetch value clamp to equ or oto for bandwidth
calculation.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Leo Ma <hanghong.ma@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/dml/dcn32/display_mode_vba_util_32.c    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index a50e7f4dce421..f74e5fc8218f5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -3459,6 +3459,7 @@ bool dml32_CalculatePrefetchSchedule(
 	double TimeForFetchingMetaPTE = 0;
 	double TimeForFetchingRowInVBlank = 0;
 	double LinesToRequestPrefetchPixelData = 0;
+	double LinesForPrefetchBandwidth = 0;
 	unsigned int HostVMDynamicLevelsTrips;
 	double  trip_to_mem;
 	double  Tvm_trips;
@@ -3888,11 +3889,15 @@ bool dml32_CalculatePrefetchSchedule(
 			TimeForFetchingMetaPTE = Tvm_oto;
 			TimeForFetchingRowInVBlank = Tr0_oto;
 			*PrefetchBandwidth = prefetch_bw_oto;
+			/* Clamp to oto for bandwidth calculation */
+			LinesForPrefetchBandwidth = dst_y_prefetch_oto;
 		} else {
 			*DestinationLinesForPrefetch = dst_y_prefetch_equ;
 			TimeForFetchingMetaPTE = Tvm_equ;
 			TimeForFetchingRowInVBlank = Tr0_equ;
 			*PrefetchBandwidth = prefetch_bw_equ;
+			/* Clamp to equ for bandwidth calculation */
+			LinesForPrefetchBandwidth = dst_y_prefetch_equ;
 		}
 
 		*DestinationLinesToRequestVMInVBlank = dml_ceil(4.0 * TimeForFetchingMetaPTE / LineTime, 1.0) / 4.0;
@@ -3900,7 +3905,7 @@ bool dml32_CalculatePrefetchSchedule(
 		*DestinationLinesToRequestRowInVBlank =
 				dml_ceil(4.0 * TimeForFetchingRowInVBlank / LineTime, 1.0) / 4.0;
 
-		LinesToRequestPrefetchPixelData = *DestinationLinesForPrefetch -
+		LinesToRequestPrefetchPixelData = LinesForPrefetchBandwidth -
 				*DestinationLinesToRequestVMInVBlank - 2 * *DestinationLinesToRequestRowInVBlank;
 
 #ifdef __DML_VBA_DEBUG__
-- 
2.40.1

