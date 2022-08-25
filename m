Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965035A066B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61E4D0FE5;
	Thu, 25 Aug 2022 01:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDC6D0E35;
 Thu, 25 Aug 2022 01:39:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6216DB826C6;
 Thu, 25 Aug 2022 01:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD41C433B5;
 Thu, 25 Aug 2022 01:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391576;
 bh=Si1aPxgcvJy78GQs4fgXZOdxEB0Ayzx9ujfRXTCW+Qk=;
 h=From:To:Cc:Subject:Date:From;
 b=nGdrozcQEP/Rl4lVYWKw42J2h3ibYjGbkhTtOqGRPzysnxH4fS0mfxU63V6TF+42O
 OcAePGU0JgFCc7k/nwZB6ZzxU3uD/OfK2NMUlmc4KaddlD5iBOayp2NYNvFKYB923h
 yAYjvl85I6a/UN0EGnXHN9a/jDjWJyZUv1WDEgqtrPKj0gMadfcwZ/QcxvNRejP5Lp
 nAOpQOd11Kba5Vo5R+TLJGpU2aSaUNWGp8/QA4f87qIy3IUwII4JPbYKAPREzDE6dA
 eqgv6pas2vP954x0yQXlZDjey+Edz+jJOlYHHaj4Gny3npeyASwHs3fXZFdDfq1eP3
 YViNawQzXN9wQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/8] drm/amd/display: Avoid MPC infinite loop
Date: Wed, 24 Aug 2022 21:39:20 -0400
Message-Id: <20220825013932.23467-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Sasha Levin <sashal@kernel.org>, jiapeng.chong@linux.alibaba.com,
 chiahsuan.chung@amd.com, Alex Hung <alex.hung@amd.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 isabbasso@riseup.net, Jun Lei <Jun.Lei@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Josip Pavic <Josip.Pavic@amd.com>

[ Upstream commit 8de297dc046c180651c0500f8611663ae1c3828a ]

[why]
In some cases MPC tree bottom pipe ends up point to itself.  This causes
iterating from top to bottom to hang the system in an infinite loop.

[how]
When looping to next MPC bottom pipe, check that the pointer is not same
as current to avoid infinite loop.

Reviewed-by: Josip Pavic <Josip.Pavic@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c | 6 ++++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c
index 8b2f29f6dabd..068e79fa3490 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c
@@ -118,6 +118,12 @@ struct mpcc *mpc1_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 	while (tmp_mpcc != NULL) {
 		if (tmp_mpcc->dpp_id == dpp_id)
 			return tmp_mpcc;
+
+		/* avoid circular linked list */
+		ASSERT(tmp_mpcc != tmp_mpcc->mpcc_bot);
+		if (tmp_mpcc == tmp_mpcc->mpcc_bot)
+			break;
+
 		tmp_mpcc = tmp_mpcc->mpcc_bot;
 	}
 	return NULL;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
index 5a188b2bc033..0a00bd8e00ab 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
@@ -488,6 +488,12 @@ struct mpcc *mpc2_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 	while (tmp_mpcc != NULL) {
 		if (tmp_mpcc->dpp_id == 0xf || tmp_mpcc->dpp_id == dpp_id)
 			return tmp_mpcc;
+
+		/* avoid circular linked list */
+		ASSERT(tmp_mpcc != tmp_mpcc->mpcc_bot);
+		if (tmp_mpcc == tmp_mpcc->mpcc_bot)
+			break;
+
 		tmp_mpcc = tmp_mpcc->mpcc_bot;
 	}
 	return NULL;
-- 
2.35.1

