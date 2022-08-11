Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EAE590227
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8D9961AC;
	Thu, 11 Aug 2022 16:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B6514BC1E;
 Thu, 11 Aug 2022 16:05:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19AA8B821AC;
 Thu, 11 Aug 2022 16:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F65C433C1;
 Thu, 11 Aug 2022 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233906;
 bh=HacvzdrZnmxSn3Ds6DRbQwkz80U2LbgSHuzkHWtp9Y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mum3/2FByQ3R4z6AMdZXV8oeVExiqzsQkCjldmdLgMgbc2IeVhtCPpDNsegHTjh84
 WdnBGiOE5FqB1cH7iT/x4jXikIBp4/E39TbkiBIqky/DSE8A1+JCvD68d50leNy15S
 7zciXlmJGwLIwCA/7hBsTPnNTXHWKA1RDzUxQ0fzDCHJLcneZxB0zjCc2pk8qdVyWZ
 jpzwXyWofbRpFfZGLh3yJj38g5vAkUKxDPqtgocc/9tbeDH6Qo+Z2sG/rFrktu9scM
 FQ8wYReYw2V8FGGTwjTkCDacOOk9dH4nYPv4j2qUYl71ZHMXbkp8+qMoeSeceRZdiY
 NQ67DAg0qeR2A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/46] drm/amd/display: Fix dpp dto for disabled
 pipes
Date: Thu, 11 Aug 2022 12:03:33 -0400
Message-Id: <20220811160421.1539956-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160421.1539956-1-sashal@kernel.org>
References: <20220811160421.1539956-1-sashal@kernel.org>
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
index 3d778760a3b5..7289752d44ad 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1376,11 +1376,15 @@ static void dcn20_update_dchubp_dpp(
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

