Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED94C07FD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 03:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D4810E3E9;
	Wed, 23 Feb 2022 02:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B23910E3A9;
 Wed, 23 Feb 2022 02:30:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68C7FB81DD2;
 Wed, 23 Feb 2022 02:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80311C340F0;
 Wed, 23 Feb 2022 02:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645583412;
 bh=SUYm3KrWmrbIaiLj6N2qj9bIbQJ53sf2Jm7PIRoNyM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MR65jpYXxy29mSOY4e+qE+zxGzawKEDN9Rv2lvhLGczmwq67Xi3tWXvUuQKKelVz5
 /buGm8bwh2MG5drwykenZMVuSNNo9L5y81BLXaekXm9/COJyMyhDZvn7dTj4SOLY2E
 eHS2+aVefPWXHUhEOyO2U2HxgRfJFtTQXniF33uT4kH0xESRWIdWikR0VNoD/kpY+e
 ivpIzD+nmKbQus9LvqPfpB0KpZ509r0Beo8gFK1iFLn5zgjmJLnZonJV1b9VyB5iW1
 bVSETRsLwdzTISycXtSZWX7QJqVP4oSGZTXhjCtasdSTnD5mbiWU1m+A4/eSWWAcTw
 DCt7tNQAvRcXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 20/28] drm/amd/pm: correct UMD pstate clocks for
 Dimgrey Cavefish and Beige Goby
Date: Tue, 22 Feb 2022 21:29:21 -0500
Message-Id: <20220223022929.241127-20-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223022929.241127-1-sashal@kernel.org>
References: <20220223022929.241127-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, lijo.lazar@amd.com, Jack.Gui@amd.com,
 airlied@linux.ie, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org, darren.powell@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 kenneth.feng@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 0136f5844b006e2286f873457c3fcba8c45a3735 ]

Correct the UMD pstate profiling clocks for Dimgrey Cavefish and Beige
Goby.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 26 +++++++++++++++----
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.h   |  8 ++++++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index f89bf49965fcd..20ab937c6450a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -1278,21 +1278,37 @@ static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu)
 				&dpm_context->dpm_tables.soc_table;
 	struct smu_umd_pstate_table *pstate_table =
 				&smu->pstate_table;
+	struct amdgpu_device *adev = smu->adev;
 
 	pstate_table->gfxclk_pstate.min = gfx_table->min;
 	pstate_table->gfxclk_pstate.peak = gfx_table->max;
-	if (gfx_table->max >= SIENNA_CICHLID_UMD_PSTATE_PROFILING_GFXCLK)
-		pstate_table->gfxclk_pstate.standard = SIENNA_CICHLID_UMD_PSTATE_PROFILING_GFXCLK;
 
 	pstate_table->uclk_pstate.min = mem_table->min;
 	pstate_table->uclk_pstate.peak = mem_table->max;
-	if (mem_table->max >= SIENNA_CICHLID_UMD_PSTATE_PROFILING_MEMCLK)
-		pstate_table->uclk_pstate.standard = SIENNA_CICHLID_UMD_PSTATE_PROFILING_MEMCLK;
 
 	pstate_table->socclk_pstate.min = soc_table->min;
 	pstate_table->socclk_pstate.peak = soc_table->max;
-	if (soc_table->max >= SIENNA_CICHLID_UMD_PSTATE_PROFILING_SOCCLK)
+
+	switch (adev->asic_type) {
+	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
+		pstate_table->gfxclk_pstate.standard = SIENNA_CICHLID_UMD_PSTATE_PROFILING_GFXCLK;
+		pstate_table->uclk_pstate.standard = SIENNA_CICHLID_UMD_PSTATE_PROFILING_MEMCLK;
 		pstate_table->socclk_pstate.standard = SIENNA_CICHLID_UMD_PSTATE_PROFILING_SOCCLK;
+		break;
+	case CHIP_DIMGREY_CAVEFISH:
+		pstate_table->gfxclk_pstate.standard = DIMGREY_CAVEFISH_UMD_PSTATE_PROFILING_GFXCLK;
+		pstate_table->uclk_pstate.standard = DIMGREY_CAVEFISH_UMD_PSTATE_PROFILING_MEMCLK;
+		pstate_table->socclk_pstate.standard = DIMGREY_CAVEFISH_UMD_PSTATE_PROFILING_SOCCLK;
+		break;
+	case CHIP_BEIGE_GOBY:
+		pstate_table->gfxclk_pstate.standard = BEIGE_GOBY_UMD_PSTATE_PROFILING_GFXCLK;
+		pstate_table->uclk_pstate.standard = BEIGE_GOBY_UMD_PSTATE_PROFILING_MEMCLK;
+		pstate_table->socclk_pstate.standard = BEIGE_GOBY_UMD_PSTATE_PROFILING_SOCCLK;
+		break;
+	default:
+		break;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h
index 38cd0ece24f6b..42f705c7a36f8 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.h
@@ -33,6 +33,14 @@ typedef enum {
 #define SIENNA_CICHLID_UMD_PSTATE_PROFILING_SOCCLK    960
 #define SIENNA_CICHLID_UMD_PSTATE_PROFILING_MEMCLK    1000
 
+#define DIMGREY_CAVEFISH_UMD_PSTATE_PROFILING_GFXCLK 1950
+#define DIMGREY_CAVEFISH_UMD_PSTATE_PROFILING_SOCCLK 960
+#define DIMGREY_CAVEFISH_UMD_PSTATE_PROFILING_MEMCLK 676
+
+#define BEIGE_GOBY_UMD_PSTATE_PROFILING_GFXCLK 2200
+#define BEIGE_GOBY_UMD_PSTATE_PROFILING_SOCCLK 960
+#define BEIGE_GOBY_UMD_PSTATE_PROFILING_MEMCLK 1000
+
 extern void sienna_cichlid_set_ppt_funcs(struct smu_context *smu);
 
 #endif
-- 
2.34.1

