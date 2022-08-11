Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A625358FF84
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B18B436D;
	Thu, 11 Aug 2022 15:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6072B9EC;
 Thu, 11 Aug 2022 15:30:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 941C2B8215D;
 Thu, 11 Aug 2022 15:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89671C433D6;
 Thu, 11 Aug 2022 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231856;
 bh=mNT78fvZUN02mlXBFilWDP/18n51R5iWoqARi/+ZHuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e12vZcykQGW3Pra5E8uhciMfOxbuYY7zBoRms3b3H5EK/RjXqs/v+GmqMK1DYKuc2
 QennEGSZXO35IPzKaDID9OosClmj1EXFGpp+oWs0GUFPNIr8f1U43VImRfDq/O7ht7
 ZaTVxb56UVy7iqCuLqHKc73Kmfrt7iv0O5kbRKIyYeEraABztsDLjzG67SbA1j7ucr
 ozA0AfP/kS348I+imTYGoRdVxIhVwuZqO1fy5INawgUIEd10wVaz1+nnJa+mQPehlh
 LW+6Do/DNo0nl/nADpr0SnKQHW47pNGGjesDa2oaCtUckBrWMp1MA0ae9ttvt/Pc/m
 uKxZSim7f4d5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 017/105] drm/amd/display: Fix dpp dto for
 disabled pipes
Date: Thu, 11 Aug 2022 11:27:01 -0400
Message-Id: <20220811152851.1520029-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 Yi-Ling.Chen2@amd.com, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 isabbasso@riseup.net, Jun.Lei@amd.com, Jimmy.Kizito@amd.com,
 Sasha Levin <sashal@kernel.org>, gabe.teeger@amd.com, wenjing.liu@amd.com,
 amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com, sunpeng.li@amd.com,
 Duncan Ma <duncan.ma@amd.com>, mwen@igalia.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Sungjoon.Kim@amd.com,
 Hansen Dsouza <Hansen.Dsouza@amd.com>, Xinhui.Pan@amd.com,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Duncan Ma <duncan.ma@amd.com>

[ Upstream commit d4965c53b95d7533dfc2309d2fc25838bd33220e ]

[Why]
When switching from 1 pipe to 4to1 mpc combine,
DppDtoClk aren't enabled for the disabled pipes
pior to programming the pipes. Upon optimizing
bandwidth, DppDto are enabled causing intermittent
underflow.

[How]
Update dppclk dto whenever pipe are flagged to
enable.

Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Reviewed-by: Hansen Dsouza <Hansen.Dsouza@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Duncan Ma <duncan.ma@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index ec6aa8d8b251..8b2c15a3cd92 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1412,11 +1412,15 @@ static void dcn20_update_dchubp_dpp(
 	struct hubp *hubp = pipe_ctx->plane_res.hubp;
 	struct dpp *dpp = pipe_ctx->plane_res.dpp;
 	struct dc_plane_state *plane_state = pipe_ctx->plane_state;
+	struct dccg *dccg = dc->res_pool->dccg;
 	bool viewport_changed = false;
 
 	if (pipe_ctx->update_flags.bits.dppclk)
 		dpp->funcs->dpp_dppclk_control(dpp, false, true);
 
+	if (pipe_ctx->update_flags.bits.enable)
+		dccg->funcs->update_dpp_dto(dccg, dpp->inst, pipe_ctx->plane_res.bw.dppclk_khz);
+
 	/* TODO: Need input parameter to tell current DCHUB pipe tie to which OTG
 	 * VTG is within DCHUBBUB which is commond block share by each pipe HUBP.
 	 * VTG is 1:1 mapping with OTG. Each pipe HUBP will select which VTG
-- 
2.35.1

