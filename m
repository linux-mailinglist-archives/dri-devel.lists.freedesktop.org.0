Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B644A4A8D7F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF61410E5C6;
	Thu,  3 Feb 2022 20:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9721010E5BF;
 Thu,  3 Feb 2022 20:31:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D72EB835A3;
 Thu,  3 Feb 2022 20:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309BCC340EB;
 Thu,  3 Feb 2022 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643920287;
 bh=lBHimcATICmd6RmV7TM8LZX1e4583VieU32x9Qnf21E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KTZk4nfl8ikUOseDCIB1sugGevulBMBfvegYM4jBniazmksQFVaaks3WpTeoqZAzo
 TQ9IXpNLIPglzSEi3T05vZOtTrZmwP9XRE4aAlFFJQCuu4tqbS7mRSI2jiKpz2kr8O
 PDMEhGn+z9PMVv1m0PBf2ZbH1Q9gj2711zI0Wx9njjsKkXnDI/54CvOQlDhTXP2pbM
 BQ8ICvlErb9oYDiGgm5AK17tYo0aFzgz51ZjWihT1yW/jRYNtEivv7DQL7brzafR7c
 wiTMkeQ2zv+tIWP2kgIFDMyzEL3xfBxMfr3pb1VhJB6Jar31LxJ+6fvPJxPFm4ZWA2
 yu6MldNiTNrzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 38/52] drm/amd/display: Correct MPC split policy
 for DCN301
Date: Thu,  3 Feb 2022 15:29:32 -0500
Message-Id: <20220203202947.2304-38-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203202947.2304-1-sashal@kernel.org>
References: <20220203202947.2304-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Charlene Liu <charlene.liu@amd.com>,
 angus.wang@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com, Zhan Liu <zhan.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com, charles.sun@amd.com,
 airlied@linux.ie, Dmytro.Laktyushkin@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhan Liu <zhan.liu@amd.com>

[ Upstream commit ac46d93235074a6c5d280d35771c23fd8620e7d9 ]

[Why]
DCN301 has seamless boot enabled. With MPC split enabled
at the same time, system will hang.

[How]
Revert MPC split policy back to "MPC_SPLIT_AVOID". Since we have
ODM combine enabled on DCN301, pipe split is not necessary here.

Signed-off-by: Zhan Liu <zhan.liu@amd.com>
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
index e472b729d8690..8af80bc05b364 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
@@ -686,7 +686,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.disable_clock_gate = true,
 	.disable_pplib_clock_request = true,
 	.disable_pplib_wm_range = true,
-	.pipe_split_policy = MPC_SPLIT_DYNAMIC,
+	.pipe_split_policy = MPC_SPLIT_AVOID,
 	.force_single_disp_pipe_split = false,
 	.disable_dcc = DCC_ENABLE,
 	.vsr_support = true,
-- 
2.34.1

