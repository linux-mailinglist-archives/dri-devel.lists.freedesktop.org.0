Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3888B943B7D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D07D10E774;
	Thu,  1 Aug 2024 00:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O87GQpeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8605310E774;
 Thu,  1 Aug 2024 00:28:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B400ECE1881;
 Thu,  1 Aug 2024 00:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B752BC32786;
 Thu,  1 Aug 2024 00:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472100;
 bh=m5sgOSAD3BvmjhEOo4qqxP7WUR7dUGmX77YFDOuB1O8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O87GQpeOvoq8IFYewbu+/WxBLZAsYC3KAotmkKe9TWr2wYmbeWlNxLcSOmMzkUHE3
 vseL4uKegyoggFYU4B+P/A6ek+amS0KOlPDkWPKd6RR90+gh6ZOz14QtDyf8gaKVX0
 NunQdCoS/8w2CTLgIFhHs2l0l5is6LWvxwZ9Olq2IvlZ4uq+SSIBYdzkRtDMT95SR2
 7d5f+3siLSmROWsyl16rh309JvhhASLZ9c9ydMaDqbL+V8bhRJ1IhxL73HKIaiq5Kr
 v5mpM2ewdgR+3ZeTq7ZrSnsmJT8YPdxB08V+h1NbBfGfN2+pqD1/JWMw2e7YXEeVrI
 ScYAVardhmbFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, kenneth.feng@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, kevinyang.wang@amd.com, Jun.Ma2@amd.com, bob.zhou@amd.com,
 mario.limonciello@amd.com, ruanjinjie@huawei.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 04/61] drm/amd/pm: fix warning using uninitialized
 value of max_vid_step
Date: Wed, 31 Jul 2024 20:25:22 -0400
Message-ID: <20240801002803.3935985-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit 17e3bea65cdc453695b2fe4ff26d25d17f5339e9 ]

Check the return of pp_atomfwctrl_get_Voltage_table_v4
as it may fail to initialize max_vid_step
V2: change the check condition (Tim Huang)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index d8cd23438b762..0d7fb8542249b 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -2575,8 +2575,11 @@ static int vega10_init_smc_table(struct pp_hwmgr *hwmgr)
 		}
 	}
 
-	pp_atomfwctrl_get_voltage_table_v4(hwmgr, VOLTAGE_TYPE_VDDC,
+	result = pp_atomfwctrl_get_voltage_table_v4(hwmgr, VOLTAGE_TYPE_VDDC,
 			VOLTAGE_OBJ_SVID2,  &voltage_table);
+	PP_ASSERT_WITH_CODE(!result,
+			"Failed to get voltage table!",
+			return result);
 	pp_table->MaxVidStep = voltage_table.max_vid_step;
 
 	pp_table->GfxDpmVoltageMode =
-- 
2.43.0

