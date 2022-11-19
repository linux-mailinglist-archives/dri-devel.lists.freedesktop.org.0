Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B14630956
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E4110E25C;
	Sat, 19 Nov 2022 02:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AC510E259;
 Sat, 19 Nov 2022 02:12:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 863ADB82677;
 Sat, 19 Nov 2022 02:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06514C433C1;
 Sat, 19 Nov 2022 02:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668823974;
 bh=6/ZcM18fIGlzYOv/MUHM9W2R6Q5LbIMHQh70HdVGb9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eSPddijIcbn7Qz+Y2F8tWf8NAMdRzx20mXzDg3v2nn86/MgtAOvTlP9SUsdM4mZoj
 +RbmpulQ4vRNA4kdOofMLLau0sT6B/yD1mNtmyPDxsoQZUy5AR5U/RwGtD34YFmurA
 AA/VoW2qXGgkTGU7IodT7GsTt5uRuVJsGJRcUw+pUTksp2NhtlL/sqCS52YyJw+O4f
 IgNRFanKJh1fQ7/LWyvWxgL5wcB5E2rjGJjAX7zwajyYc787ITcjXjRxYByN+H3DeH
 6BMXOYh5oAHsiAzhSknj2HLzTlaPcAWW+NGK/UMA2jbCZem7hWsYajrMAZwksGlYFW
 VgyXH+1bJv0NQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 35/44] drm/amd/display: Fix FCLK deviation and
 tool compile issues
Date: Fri, 18 Nov 2022 21:11:15 -0500
Message-Id: <20221119021124.1773699-35-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Sasha Levin <sashal@kernel.org>,
 chris.park@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, nathan@kernel.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, aurabindo.pillai@amd.com,
 yang.lee@linux.alibaba.com, dri-devel@lists.freedesktop.org,
 george.shen@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Dhere <chaitanya.dhere@amd.com>

[ Upstream commit 0d5c5c210a4d4e655feb93b379647f0b179cdafe ]

[Why]
Recent backports from open source do not have header inclusion pattern
that is consistent with inclusion style in the rest of the file. This
breaks the internal tool builds as well. A recent commit erronously
modified the original DML formula for calculating
ActiveClockChangeLatencyHidingY. This resulted in a FCLK deviation
from the golden values.

[How]
Change the way in which display_mode_vba.h is included so that it is
consistent with the inclusion style in rest of the file which also fixes
the tool build. Restore the DML formula to its original state to fix the
FCLK deviation.

Reviewed-by: Aurabindo Pillai <Aurabindo.Pillai@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Alan Liu <HaoPing.Liu@amd.com>
Signed-off-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c | 2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 365d290bba99..d0f3f2414fb8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -4396,7 +4396,7 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 
 		if (v->NumberOfActiveSurfaces > 1) {
 			ActiveClockChangeLatencyHidingY = ActiveClockChangeLatencyHidingY
-					- (1 - 1 / v->NumberOfActiveSurfaces) * SwathHeightY[k] * v->HTotal[k]
+					- (1.0 - 1.0 / v->NumberOfActiveSurfaces) * SwathHeightY[k] * v->HTotal[k]
 							/ v->PixelClock[k] / v->VRatio[k];
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
index 0b427d89b3c5..f174f5c5ff92 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
@@ -30,7 +30,7 @@
 #include "os_types.h"
 #include "../dc_features.h"
 #include "../display_mode_structs.h"
-#include "dml/display_mode_vba.h"
+#include "../display_mode_vba.h"
 
 unsigned int dml32_dscceComputeDelay(
 		unsigned int bpc,
-- 
2.35.1

