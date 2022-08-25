Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA925A0623
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B06D0B85;
	Thu, 25 Aug 2022 01:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9B0D0B1B;
 Thu, 25 Aug 2022 01:37:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F5E5B826E6;
 Thu, 25 Aug 2022 01:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E97C433C1;
 Thu, 25 Aug 2022 01:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391459;
 bh=oZYVGgsaH2VFtB7OQwCBUSbZUvNKRGqOMHp98jOx8nE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZZ/e/vaU9Kp5DhrW1wWqdligfV7/WvMZup8Ko7Oj0R2LWLLHeaUEHXOxMPu9XdWwG
 6eBu5tllLM5kyoo0ueK5HTryCO2COHBdrlp1+VSXyxNwoE9GIfZbxsq1gU/kP59+yb
 wOK79hkMG0PQBqQae8/gZboT87HU25e88Q8gPYEcNz7B6fUtMOyMPLub7L1xshd3NX
 oAOdym4lh4Ea8+hHB72mICdCHpz0gihCZ7/fCqyUgMmLawth4NDSaYGFv6mO+l8c58
 L1g4zJjOXkspyJ/0Vyw5F+i8Y9HVEG7dARq2M5iiDtGvQht8f3pAy48DypXeJ7Lwmw
 3h73TO8Aq0htQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/20] drm/amd/display: clear optc underflow
 before turn off odm clock
Date: Wed, 24 Aug 2022 21:36:58 -0400
Message-Id: <20220825013713.22656-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013713.22656-1-sashal@kernel.org>
References: <20220825013713.22656-1-sashal@kernel.org>
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
Cc: Fudong Wang <Fudong.Wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 Tom Chung <chiahsuan.chung@amd.com>, Charlene.Liu@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, HaoPing.Liu@amd.com, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, isabbasso@riseup.net,
 Jun.Lei@amd.com, christian.koenig@amd.com, oliver.logush@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fudong Wang <Fudong.Wang@amd.com>

[ Upstream commit b2a93490201300a749ad261b5c5d05cb50179c44 ]

[Why]
After ODM clock off, optc underflow bit will be kept there always and clear not work.
We need to clear that before clock off.

[How]
Clear that if have when clock off.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Fudong Wang <Fudong.Wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
index 37848f4577b1..92fee47278e5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
@@ -480,6 +480,11 @@ void optc1_enable_optc_clock(struct timing_generator *optc, bool enable)
 				OTG_CLOCK_ON, 1,
 				1, 1000);
 	} else  {
+
+		//last chance to clear underflow, otherwise, it will always there due to clock is off.
+		if (optc->funcs->is_optc_underflow_occurred(optc) == true)
+			optc->funcs->clear_optc_underflow(optc);
+
 		REG_UPDATE_2(OTG_CLOCK_CONTROL,
 				OTG_CLOCK_GATE_DIS, 0,
 				OTG_CLOCK_EN, 0);
-- 
2.35.1

