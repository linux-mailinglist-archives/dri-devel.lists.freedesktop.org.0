Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869475A05C8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE66D07D9;
	Thu, 25 Aug 2022 01:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECBCD0728;
 Thu, 25 Aug 2022 01:34:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2BC9B825ED;
 Thu, 25 Aug 2022 01:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9FFC433D6;
 Thu, 25 Aug 2022 01:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391282;
 bh=yNrF37xl4SIiS1ML8HYlB+YP3QAwylGrbARyAhcG6B8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IFIz2Mjmak3wR4GUl3laq84TYni0/wiiZXWRmK8jCWyENoNcaHcbS6f+UjK7/8qjG
 V5rnJ+LrHa1vwRBn084srLIyLEU1ZQ+t+blRKeo0WXlRohKzn7T8WsgSbk40mmsBD1
 RUCsha18smFyfNZWlWEj+CRdj+0kV94naLcZ/hiP6JLoPFToEgyMFrYhmaSFsgi+HD
 1oEDLRSYxfCXTUfzgZzQwIAodUlrwSicA+JQyedwnHJrQEnAyS/577rXeVSiA3h3Ng
 +Irke+w9fX5Xho+UBil2LYOWXcK1IIG/ZSe/4Qp3OjFEV82mG0bnmIr5VUPExA+Ui6
 CLymlTcM+qL/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 06/38] drm/amd/display: Device flash garbage
 before get in OS
Date: Wed, 24 Aug 2022 21:33:29 -0400
Message-Id: <20220825013401.22096-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, dale.zhao@amd.com, dri-devel@lists.freedesktop.org,
 Yi-Ling.Chen2@amd.com, isabbasso@riseup.net, Anthony Koo <Anthony.Koo@amd.com>,
 Sasha Levin <sashal@kernel.org>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, Jerry.Zuo@amd.com,
 Sungjoon.Kim@amd.com, sunpeng.li@amd.com,
 Chiawen Huang <chiawen.huang@amd.com>, duncan.ma@amd.com, mwen@igalia.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, hanghong.ma@amd.com,
 agustin.gutierrez@amd.com, dingchen.zhang@amd.com,
 Tom Chung <chiahsuan.chung@amd.com>, Xinhui.Pan@amd.com, Roman.Li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chiawen Huang <chiawen.huang@amd.com>

[ Upstream commit 9c580e8f6cd6524d4e2c3490c440110526f7ddd6 ]

[Why]
Enabling stream with tg lock makes config settings
pending causing the garbage until tg unlock.

[How]
Keep the original lock mechanism
The driver doesn't lock tg if plane_state is null.

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Chiawen Huang <chiawen.huang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index e3a62873c0e7..d9ab27991535 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -108,6 +108,7 @@ void dcn10_lock_all_pipes(struct dc *dc,
 		 */
 		if (pipe_ctx->top_pipe ||
 		    !pipe_ctx->stream ||
+		    !pipe_ctx->plane_state ||
 		    !tg->funcs->is_tg_enabled(tg))
 			continue;
 
-- 
2.35.1

