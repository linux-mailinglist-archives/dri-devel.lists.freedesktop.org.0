Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4D78CD58
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 22:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB0B10E155;
	Tue, 29 Aug 2023 20:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963C010E155;
 Tue, 29 Aug 2023 20:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTaj6Em2oN39/YG7fZNLqba7me4KTwtzlLzBwVLkojFsLfT1oAFIqeZmM02uYXGI5gnc6nVvP7+7DDmnEHmE4hE4QVi2ok99VUEyTDC2ZUkH5oojMVLBEzxHD94GRW77L8NKs7PW2tLCM+Aso6Y9vuqgMuk6iVbkXwDT63KqfcrCujGmBjksBpsjpxInsSinIIrsSlVj+u2drKMrEbItIceGJjmHY4IPUHRLd1z1GOYWnJu7wqUJLQAzo98NmtHdM9j5zAs7EuqcDARYA5AV43IdJ+CwW5XeZAn3VakBd2aX+MnpEtMVBuu6+MRu07XzmFMpBFvpnn7EvdfDp8kn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKALJpNrHb7YVMA4grUe5PopruitW91en2ugqoMSn+w=;
 b=XkJyKzzd4Iv2eeBzottCtGIgAWAD1/JUTeQPwxtx9to0HBqxC69WogkEAEr0cda9CHDrxSevKOgBgUQnyzlRrk35gDMrnGzbRQg0iQCkp5vdaqYYYgBxERR9jOJvMIqTg4CZzEiVVhcGtyS+djjPb3a/j9euBLfXpElLEXgv6IfcOa8VHMgqTMTRlNq6nrZhB/42CKs5L81jOCj4EXWrayjYM264DK1Wn9lIyCPfFPbPN3NdTFtshUW3a2SnD5Ehhjyvvj5jYtzW2V+OrLviZZLeU5N74Fn2CwUDJXPjhAkUX2vqFeZpv5qDuuHf8Ha+3db63I5bZTRw7Tn58GQBMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKALJpNrHb7YVMA4grUe5PopruitW91en2ugqoMSn+w=;
 b=iwwAy+TO/WwDwGsZhm4M4/6SgW+EVhWjNpcKrpWmlq6p1lHrTJTtk1r1N2aN8CJU9UapkCMDwSUjB4CdDPxY8XKHO/7G+AyZM7eJIqdc34xSn4kNs8xo+1icAXTCTY6cmBktqVQbvYs6aehJulSU+NInycc+0A8sBTHzz05ZJes=
Received: from DS7PR07CA0012.namprd07.prod.outlook.com (2603:10b6:5:3af::20)
 by CH0PR12MB5091.namprd12.prod.outlook.com (2603:10b6:610:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 20:11:10 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::cc) by DS7PR07CA0012.outlook.office365.com
 (2603:10b6:5:3af::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Tue, 29 Aug 2023 20:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 20:11:10 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 15:11:07 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amd/display: Remove v_startup workaround for
 dcn3+"
Date: Tue, 29 Aug 2023 16:10:41 -0400
Message-ID: <20230829201042.322173-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|CH0PR12MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: be97deb3-190e-4910-aac0-08dba8cc1641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3a7ZD5qgdb0GP26G/Q89MZ9naEfxITo48CZhcxnhKBGzq6udEEXqCE2fq5BdWFMzrf7B5r6IhxiOO8PcW1uotkhciHfgdS6ere+aNPOWzIWTAXStND9jfEyGP2R4OpYJYXd90a+CJ0isn4Q1rbIHkYSbLnKXaVUvl0+Ymb0lRy09uGAQGupj1dbbWHpI+33Nq6b+oNp2isHB6Nh0Ur7ncg3bF2Fi6UimWQMOFbqJSM7PxwhShtzBJf+XReJYkakPH1dVOgNGrnnZQh9fVaRckXBVJwyfvtQ8VmV3NDb9N2OF4fFJ6wWhy6sUby64bZqPfaY8vHL3rWpyZkgAKsixZpq83Zb+33QHehdsmWoshiWh498xey5xDh8myH1qYLBP9n0ji5df860/cS0ZYR28NFqsgjT6puYUeRNtsy7ynpoquS7ZGXxgdfgXSQRYJvYnh+jPQk9ko0RtuM4n2gnaLPd9UdcOoyLWPgShVLGqtZvF/HEne+5UX+vGytsxn7oUjJKbIUxOgEqKBusAjK3nzPtv+5K/m6VyRkRUCVnpM3drHJvLkbiEAi2xIIPNz3xUeNB60VEXYykS0MU9miTrYl4agJg5WHGsy82Z/yLKnaKTPJnxpkBw9fTkuXslsFbp/AM2M0ZJCovgk8jPUmDVRohgSyWX8ywhNfKb2FjTlCucNycMXaOvLlS/mTxFUmZ8iULbxnW3AySpPU2kFWTR9ScTvpLDnV2L6A8kh/R6PmlXnUyTpNRxIlsO/2gH4yUI+nRRnQ+ETr+31fJyX4a9GMNkWY2mUxm04MaP0tPBEzo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(81166007)(356005)(82740400003)(8936002)(6666004)(70206006)(478600001)(70586007)(54906003)(966005)(6916009)(316002)(41300700001)(40460700003)(36756003)(26005)(16526019)(44832011)(8676002)(5660300002)(1076003)(2906002)(83380400001)(2616005)(47076005)(86362001)(36860700001)(40480700001)(426003)(336012)(4326008)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 20:11:10.2629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be97deb3-190e-4910-aac0-08dba8cc1641
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5091
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
Cc: Daniel Miess <daniel.miess@amd.com>, dri-devel@lists.freedesktop.org,
 Gabe Teeger <gabe.teeger@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Leo Chen <sancchen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Nicholas
 Kazlauskas <nicholas.kazlauskas@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sung Joon Kim <sungjoon.kim@amd.com>,
 Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 3a31e8b89b7240d9a17ace8a1ed050bdcb560f9e.

We still need to call dcn20_adjust_freesync_v_startup() for older DCN3+
ASICs otherwise it can cause DP to HDMI 2.1 PCONs to fail to light up.
So, reintroduce the reverted code and limit it to ASICs older than
DCN31.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2809
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 24 ++++---------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index 0989a0152ae8..0841176e8d6c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1099,6 +1099,10 @@ void dcn20_calculate_dlg_params(struct dc *dc,
 		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =
 						pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
 		context->res_ctx.pipe_ctx[i].pipe_dlg_param = pipes[pipe_idx].pipe.dest;
+		if (dc->ctx->dce_version < DCN_VERSION_3_1 &&
+		    context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
+			dcn20_adjust_freesync_v_startup(&context->res_ctx.pipe_ctx[i].stream->timing,
+							&context->res_ctx.pipe_ctx[i].pipe_dlg_param.vstartup_start);
 
 		pipe_idx++;
 	}
@@ -1927,7 +1931,6 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
 	int vlevel = 0;
 	int pipe_split_from[MAX_PIPES];
 	int pipe_cnt = 0;
-	int i = 0;
 	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
 	DC_LOGGER_INIT(dc->ctx->logger);
 
@@ -1951,15 +1954,6 @@ static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_state *co
 	dcn20_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
 	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
 
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		if (!context->res_ctx.pipe_ctx[i].stream)
-			continue;
-		if (context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
-			dcn20_adjust_freesync_v_startup(
-				&context->res_ctx.pipe_ctx[i].stream->timing,
-				&context->res_ctx.pipe_ctx[i].pipe_dlg_param.vstartup_start);
-	}
-
 	BW_VAL_TRACE_END_WATERMARKS();
 
 	goto validate_out;
@@ -2232,7 +2226,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
 	int vlevel = 0;
 	int pipe_split_from[MAX_PIPES];
 	int pipe_cnt = 0;
-	int i = 0;
 	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
 	DC_LOGGER_INIT(dc->ctx->logger);
 
@@ -2261,15 +2254,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
 	dcn21_calculate_wm(dc, context, pipes, &pipe_cnt, pipe_split_from, vlevel, fast_validate);
 	dcn20_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
 
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		if (!context->res_ctx.pipe_ctx[i].stream)
-			continue;
-		if (context->res_ctx.pipe_ctx[i].stream->adaptive_sync_infopacket.valid)
-			dcn20_adjust_freesync_v_startup(
-				&context->res_ctx.pipe_ctx[i].stream->timing,
-				&context->res_ctx.pipe_ctx[i].pipe_dlg_param.vstartup_start);
-	}
-
 	BW_VAL_TRACE_END_WATERMARKS();
 
 	goto validate_out;
-- 
2.41.0

