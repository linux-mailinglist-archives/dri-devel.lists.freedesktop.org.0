Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127F52B9C9
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 14:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554AE10F017;
	Wed, 18 May 2022 12:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D13B10F06E;
 Wed, 18 May 2022 12:27:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7826961610;
 Wed, 18 May 2022 12:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A982C385AA;
 Wed, 18 May 2022 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652876839;
 bh=E0vUSpxPLIELQGfG4YeyedZtqjlmxegQcKpK3CCbthE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sfHUldWT8Xb55/imk/v5BODMMKCN37xvePjU41MIbiDHoezb+xFXONij+GgN19QZi
 OQywl3CjOGckobljrFa6h7nJM2pzW0wiOlnVY1Up+qMguoGwVevXZkOL+fyup/y7sW
 WlIqVJX6uuYQNFs2roi1I8nIijM3gJHjhxxi/wRn3goesns21C+aN8NulUtnv3kF9I
 EPMqw1qL/Vs38q4ZS/gleijfWIKGFuGPpSg5tLbGFBgVKU/uKa5v6I0FLHjzJVl32d
 U0e69RVqk8b2wayLtKVHqBw9/AqLQzlHIubnQRBfSnZzUrK8wnnFLWoYsFshIQHBM4
 5fCXq4E9zGzkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 13/23] drm/amd/display: undo clearing of z10
 related function pointers
Date: Wed, 18 May 2022 08:26:26 -0400
Message-Id: <20220518122641.342120-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518122641.342120-1-sashal@kernel.org>
References: <20220518122641.342120-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Eric Yang <Eric.Yang2@amd.com>,
 haonan.wang2@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 wyatt.wood@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 mikita.lipski@amd.com, nicholas.kazlauskas@amd.com,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eric Yang <Eric.Yang2@amd.com>

[ Upstream commit 9b9bd3f640640f94272a461b2dfe558f91b322c5 ]

[Why]
Z10 and S0i3 have some shared path. Previous code clean up ,
incorrectly removed these pointers, which breaks s0i3 restore

[How]
Do not clear the function pointers based on Z10 disable.

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Pavle Kotarac <Pavle.Kotarac@amd.com>
Signed-off-by: Eric Yang <Eric.Yang2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
index d7559e5a99ce..e708f07fe75a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
@@ -153,9 +153,4 @@ void dcn31_hw_sequencer_construct(struct dc *dc)
 		dc->hwss.init_hw = dcn20_fpga_init_hw;
 		dc->hwseq->funcs.init_pipes = NULL;
 	}
-	if (dc->debug.disable_z10) {
-		/*hw not support z10 or sw disable it*/
-		dc->hwss.z10_restore = NULL;
-		dc->hwss.z10_save_init = NULL;
-	}
 }
-- 
2.35.1

