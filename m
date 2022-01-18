Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5F491684
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B531128E8;
	Tue, 18 Jan 2022 02:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1CD1128E8;
 Tue, 18 Jan 2022 02:34:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CF2F611F2;
 Tue, 18 Jan 2022 02:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F7EC36AEF;
 Tue, 18 Jan 2022 02:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473298;
 bh=UH/NsbM9mt79CzA1kPcHg2YVaT+xnxkxbBGOOFUagss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=humUDxq3tFeps3i9tpg5h7urkOPPS6Faw2i7Ei3O6zksAYaVe4Ze+mXLZKTcNkQQ5
 giPwFQZVIw4co8+HuovDH39KmaadAEgTZCEVfPTv0rpklIO2a8u8taHcLvHBKgPz3Z
 WeAiHIaCTMfT4ifD9+oMLzcH/VW23DBIvVcrszPSki9wcgwBQvdQauDeTgBDPLIv4d
 zZh5TXk93RiSn9KW01O4c6xqow/7TC85FNFbRsVE3lZrN8AAm9bZ5RQmwdMweTF4+7
 NPzdRqG5jiW092roooFdJdFBgLFHGbJ/Ubpnd1J7Wai9wWaHoXXRKgUePt/gpY6SQ8
 VXrE9AClf+bZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 056/188] drm/amd/display: add else to avoid
 double destroy clk_mgr
Date: Mon, 17 Jan 2022 21:29:40 -0500
Message-Id: <20220118023152.1948105-56-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, charlene.liu@amd.com, haonan.wang2@amd.com,
 sunpeng.li@amd.com, zhan.liu@amd.com, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, Dmytro.Laktyushkin@amd.com,
 dri-devel@lists.freedesktop.org, Martin Leung <Martin.Leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, mikita.lipski@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Leung <Martin.Leung@amd.com>

[ Upstream commit 11dff0e871037a6ad978e52f826a2eb7f5fb274a ]

[Why & How]
when changing some code we accidentally
changed else if-> if. reverting that.

Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Martin Leung <Martin.Leung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index bb31541f80723..6420527fe476c 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -306,8 +306,7 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 	case FAMILY_NV:
 		if (ASICREV_IS_SIENNA_CICHLID_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
 			dcn3_clk_mgr_destroy(clk_mgr);
-		}
-		if (ASICREV_IS_DIMGREY_CAVEFISH_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
+		} else if (ASICREV_IS_DIMGREY_CAVEFISH_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
 			dcn3_clk_mgr_destroy(clk_mgr);
 		}
 		if (ASICREV_IS_BEIGE_GOBY_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
-- 
2.34.1

