Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E6AAA2C6
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9C310E5CE;
	Mon,  5 May 2025 23:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nvfEeqKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B061E10E5CD;
 Mon,  5 May 2025 23:04:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 53D05A4D304;
 Mon,  5 May 2025 22:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2263BC4CEE4;
 Mon,  5 May 2025 23:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486263;
 bh=GDlPJhMl4gn4aKlKaypOgYKBK02KYaGy2G5M0NzjaMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nvfEeqKPDWdwcu44QB8fDrPAOsnAhr16LbMhfalB2L/2lb6tzWIB796j9exkvWfMj
 pWpVHiGiZugpR5trLBKzHeRVcH9XsYUK/9SlUFE/ZNvedvRWO1Hg2DJNXIlvnETc3J
 gFEsJXjpMOECbsLy5me5fURPbOQvl92Wb5lSL9rSBhR5DkTt529AnTPnysmW5WE4fi
 bTQqKazAcRdDoCpUkqkSQOAqA5jkgnrYHOfMJ6uTZJsnO9cRue5kBR6a76uFNRdWbx
 qTEsdoOoMY2II05VJs8+9YYEtQkOnH+GP2ZlNE/fjeDcXv+//EdoW6KFprc5Oer9ON
 TusdXQAHZmltg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 229/294] drm/amd/display/dc: enable oem i2c
 support for DCE 12.x
Date: Mon,  5 May 2025 18:55:29 -0400
Message-Id: <20250505225634.2688578-229-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 2ed83f2cc41e8f7ced1c0610ec2b0821c5522ed5 ]

Use the value pulled from the vbios just like newer chips.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dce120/dce120_resource.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
index 18c5a86d2d614..21f10fd8e7025 100644
--- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
@@ -67,6 +67,7 @@
 #include "reg_helper.h"
 
 #include "dce100/dce100_resource.h"
+#include "link.h"
 
 #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
 	#define mmDP0_DP_DPHY_INTERNAL_CTRL		0x210f
@@ -659,6 +660,12 @@ static void dce120_resource_destruct(struct dce110_resource_pool *pool)
 
 	if (pool->base.dmcu != NULL)
 		dce_dmcu_destroy(&pool->base.dmcu);
+
+	if (pool->base.oem_device != NULL) {
+		struct dc *dc = pool->base.oem_device->ctx->dc;
+
+		dc->link_srv->destroy_ddc_service(&pool->base.oem_device);
+	}
 }
 
 static void read_dce_straps(
@@ -1054,6 +1061,7 @@ static bool dce120_resource_construct(
 	struct dc *dc,
 	struct dce110_resource_pool *pool)
 {
+	struct ddc_service_init_data ddc_init_data = {0};
 	unsigned int i;
 	int j;
 	struct dc_context *ctx = dc->ctx;
@@ -1257,6 +1265,15 @@ static bool dce120_resource_construct(
 
 	bw_calcs_data_update_from_pplib(dc);
 
+	if (dc->ctx->dc_bios->fw_info.oem_i2c_present) {
+		ddc_init_data.ctx = dc->ctx;
+		ddc_init_data.link = NULL;
+		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
+		ddc_init_data.id.enum_id = 0;
+		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
+		pool->base.oem_device = dc->link_srv->create_ddc_service(&ddc_init_data);
+	}
+
 	return true;
 
 irqs_create_fail:
-- 
2.39.5

