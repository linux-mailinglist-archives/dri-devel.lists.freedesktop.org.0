Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98185F2623
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 00:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C1A10E13A;
	Sun,  2 Oct 2022 22:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBEE10E121;
 Sun,  2 Oct 2022 22:50:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AF1F60F10;
 Sun,  2 Oct 2022 22:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECC2C433C1;
 Sun,  2 Oct 2022 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664751034;
 bh=uqE5ur36D/j3wyibxM/2VFbnUp+W6l2mwUdymFR+0BA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gTnkP8b5uBXpNU94sWKg76bOR2mYsnQz7DBparleEzTjEIgwgIUbpDSgh/0toX1dD
 KTkkGlM/PxUsz7lAohzqGPG97JIXkuvXI6ozFV70R3bIotqaZfaZ5Aj7hAWQ7qrPdY
 rQxLZy1UPFNwDBYugPewrwXD1Hv4vLfsEFQjwAM1lN0xFw2oXOk1aD1AjRvQi/S/md
 f75FoGx2HZxEY3EtVju7FstK/F0lakKDXVA8toaB6GpPoG9I6YCf1mZXXADu3u4LDP
 VQyjA+YphiC7xaQNwwn7F81exI799MTde2o9x0NagqhhbXuqoN06N4GiRkFsB6ZOrF
 mV9gaCJeM8o+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 25/29] drm/amd/display: update gamut remap if
 plane has changed
Date: Sun,  2 Oct 2022 18:49:18 -0400
Message-Id: <20221002224922.238837-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002224922.238837-1-sashal@kernel.org>
References: <20221002224922.238837-1-sashal@kernel.org>
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
Cc: wenjing.liu@amd.com, dri-devel@lists.freedesktop.org, Yi-Ling.Chen2@amd.com,
 Jun.Lei@amd.com, Sasha Levin <sashal@kernel.org>,
 jiapeng.chong@linux.alibaba.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, Alvin.Lee2@amd.com,
 sunpeng.li@amd.com, duncan.ma@amd.com, mwen@igalia.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Sungjoon.Kim@amd.com,
 Hugo Hu <hugo.hu@amd.com>, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hugo Hu <hugo.hu@amd.com>

[ Upstream commit 52bb21499cf54fa65b56d97cd0d68579c90207dd ]

[Why]
The desktop plane and full-screen game plane may have different
gamut remap coefficients, if switching between desktop and
full-screen game without updating the gamut remap will cause
incorrect color.

[How]
Update gamut remap if planes change.

Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Hugo Hu <hugo.hu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index ec6aa8d8b251..213a02a769d4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1520,6 +1520,7 @@ static void dcn20_update_dchubp_dpp(
 	/* Any updates are handled in dc interface, just need
 	 * to apply existing for plane enable / opp change */
 	if (pipe_ctx->update_flags.bits.enable || pipe_ctx->update_flags.bits.opp_changed
+			|| pipe_ctx->update_flags.bits.plane_changed
 			|| pipe_ctx->stream->update_flags.bits.gamut_remap
 			|| pipe_ctx->stream->update_flags.bits.out_csc) {
 		/* dpp/cm gamut remap*/
-- 
2.35.1

