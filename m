Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2236A3708
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5D10E2D5;
	Mon, 27 Feb 2023 02:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBBD10E2D5;
 Mon, 27 Feb 2023 02:06:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26E9FB80CBB;
 Mon, 27 Feb 2023 02:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA56C433D2;
 Mon, 27 Feb 2023 02:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463580;
 bh=refRfdVOY0fqJmuhPjzV0aYbNmjqFSznQ3frwbW/KL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nf6OZiqME9I9jAnNOWVZAesGJ78KMCV1HMV2bkNiDXzP2yMjNtozFmxhmFGVloiYW
 VAqK/do7ikZmdXxgs0Db3KYNOWrzToueGfpkUeDFnNetpTBUJJF8cC/394iB2KIaE/
 +t1dq450y9EWWPHU8w959kYbxJQSW+p7Ow9DtF27D24ylMwuZKflYFZ84vSow3IfLY
 8gd4BLEjFkyyfyTREnoHvyhUUhMkHDHvuixF5cR28aEMrXOzGcUK6TZeipwjzx5nwk
 yfRrjqPCrfuojS4UAyHejCukUsv4NDzUCoqy8YIMwrWyoKj8gl+Dx1k18a96JXapQ9
 0Fv+FTdCZkaDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 17/58] drm/amd/display: fix mapping to
 non-allocated address
Date: Sun, 26 Feb 2023 21:04:15 -0500
Message-Id: <20230227020457.1048737-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, steve.su@amd.com,
 HaoPing.Liu@amd.com, alex.hung@amd.com,
 Daniel Wheeler <Daniel.Wheeler@amd.com>, Brandon Syu <Brandon.Syu@amd.com>,
 Alvin.Lee2@amd.com, Martin Leung <Martin.Leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Paul.Hsieh@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brandon Syu <Brandon.Syu@amd.com>

[ Upstream commit 9190d4a263264eabf715f5fc1827da45e3fdc247 ]

[Why]
There is an issue mapping non-allocated location of memory.
It would allocate gpio registers from an array out of bounds.

[How]
Patch correct numbers of bounds for using.

Tested-by: Daniel Wheeler <Daniel.Wheeler@amd.com>
Reviewed-by: Martin Leung <Martin.Leung@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Brandon Syu <Brandon.Syu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c   | 6 ++++--
 .../gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   | 6 ++++--
 .../gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   | 6 ++++--
 drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h             | 7 +++++++
 4 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c b/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
index 9b63c6c0cc844..e0bd0c722e006 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
@@ -138,7 +138,8 @@ static const struct ddc_sh_mask ddc_shift[] = {
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 3),
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 4),
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 5),
-	DDC_MASK_SH_LIST_DCN2(__SHIFT, 6)
+	DDC_MASK_SH_LIST_DCN2(__SHIFT, 6),
+	DDC_MASK_SH_LIST_DCN2_VGA(__SHIFT)
 };
 
 static const struct ddc_sh_mask ddc_mask[] = {
@@ -147,7 +148,8 @@ static const struct ddc_sh_mask ddc_mask[] = {
 	DDC_MASK_SH_LIST_DCN2(_MASK, 3),
 	DDC_MASK_SH_LIST_DCN2(_MASK, 4),
 	DDC_MASK_SH_LIST_DCN2(_MASK, 5),
-	DDC_MASK_SH_LIST_DCN2(_MASK, 6)
+	DDC_MASK_SH_LIST_DCN2(_MASK, 6),
+	DDC_MASK_SH_LIST_DCN2_VGA(_MASK)
 };
 
 #include "../generic_regs.h"
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
index 687d4f128480e..36a5736c58c92 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
@@ -145,7 +145,8 @@ static const struct ddc_sh_mask ddc_shift[] = {
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 3),
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 4),
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 5),
-	DDC_MASK_SH_LIST_DCN2(__SHIFT, 6)
+	DDC_MASK_SH_LIST_DCN2(__SHIFT, 6),
+	DDC_MASK_SH_LIST_DCN2_VGA(__SHIFT)
 };
 
 static const struct ddc_sh_mask ddc_mask[] = {
@@ -154,7 +155,8 @@ static const struct ddc_sh_mask ddc_mask[] = {
 	DDC_MASK_SH_LIST_DCN2(_MASK, 3),
 	DDC_MASK_SH_LIST_DCN2(_MASK, 4),
 	DDC_MASK_SH_LIST_DCN2(_MASK, 5),
-	DDC_MASK_SH_LIST_DCN2(_MASK, 6)
+	DDC_MASK_SH_LIST_DCN2(_MASK, 6),
+	DDC_MASK_SH_LIST_DCN2_VGA(_MASK)
 };
 
 #include "../generic_regs.h"
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c b/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
index 0ea52ba5ac827..9f6872ae40203 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
@@ -149,7 +149,8 @@ static const struct ddc_sh_mask ddc_shift[] = {
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 3),
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 4),
 	DDC_MASK_SH_LIST_DCN2(__SHIFT, 5),
-	DDC_MASK_SH_LIST_DCN2(__SHIFT, 6)
+	DDC_MASK_SH_LIST_DCN2(__SHIFT, 6),
+	DDC_MASK_SH_LIST_DCN2_VGA(__SHIFT)
 };
 
 static const struct ddc_sh_mask ddc_mask[] = {
@@ -158,7 +159,8 @@ static const struct ddc_sh_mask ddc_mask[] = {
 	DDC_MASK_SH_LIST_DCN2(_MASK, 3),
 	DDC_MASK_SH_LIST_DCN2(_MASK, 4),
 	DDC_MASK_SH_LIST_DCN2(_MASK, 5),
-	DDC_MASK_SH_LIST_DCN2(_MASK, 6)
+	DDC_MASK_SH_LIST_DCN2(_MASK, 6),
+	DDC_MASK_SH_LIST_DCN2_VGA(_MASK)
 };
 
 #include "../generic_regs.h"
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h b/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
index 308a543178a56..59884ef651b39 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
+++ b/drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h
@@ -113,6 +113,13 @@
 	(PHY_AUX_CNTL__AUX## cd ##_PAD_RXSEL## mask_sh),\
 	(DC_GPIO_AUX_CTRL_5__DDC_PAD## cd ##_I2CMODE## mask_sh)}
 
+#define DDC_MASK_SH_LIST_DCN2_VGA(mask_sh) \
+	{DDC_MASK_SH_LIST_COMMON(mask_sh),\
+	0,\
+	0,\
+	0,\
+	0}
+
 struct ddc_registers {
 	struct gpio_registers gpio;
 	uint32_t ddc_setup;
-- 
2.39.0

