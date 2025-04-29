Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1AAA3D19
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D945F10E559;
	Tue, 29 Apr 2025 23:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h6sP6cDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C46110E556;
 Tue, 29 Apr 2025 23:52:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2F73A4C352;
 Tue, 29 Apr 2025 23:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2A0C4CEE3;
 Tue, 29 Apr 2025 23:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745970741;
 bh=7Mqkh/DfpJaKhMCrCkYPgeCnFVkfSR9IgPhX19vd/Ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h6sP6cDHtIDcI9pWHM9wlBC1nkzjVniG9pIN7tK2Fhp6dk+MeSjIHu8S5KB0TzAGh
 Sg6E9OGbl1cCMB5ZuBzZsys51jYJELYIlASV3qHEFz55SgQMKK96eWrr1QHs1NRM4F
 2YrM2gz/2cbTHVy9x2PRfszirAET+2cYGKoTRV24ljyU7HG9xK1GRP4ZEzutovMdNB
 Q8iAW9Gyb4Idw4kbuZ6Spdvg3tmRkmG/fw0bRwDTJ2PB2ezdpVN6zg2Ai3ffdeqmJn
 ohoN62LQnFSgZNWlvfQhxetDcQEJiMeT5jZNEy1Y/J9FgsI7RepxHN0rv13TucMeTj
 f7ArJEztEEBnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Susanto <nsusanto@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Mark Broadworth <mark.broadworth@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
 nicholas.kazlauskas@amd.com, paul.hsieh@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 31/37] drm/amd/display: Enable urgent latency
 adjustment on DCN35
Date: Tue, 29 Apr 2025 19:51:16 -0400
Message-Id: <20250429235122.537321-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235122.537321-1-sashal@kernel.org>
References: <20250429235122.537321-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.25
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

From: Nicholas Susanto <nsusanto@amd.com>

[ Upstream commit 756c85e4d0ddc497b4ad5b1f41ad54e838e06188 ]

[Why]

Urgent latency adjustment was disabled on DCN35 due to issues with P0
enablement on some platforms. Without urgent latency, underflows occur
when doing certain high timing configurations. After testing, we found
that reenabling urgent latency didn't reintroduce p0 support on multiple
platforms.

[How]

renable urgent latency on DCN35 and setting it to 3000 Mhz.

This reverts commit 3412860cc4c0c484f53f91b371483e6e4440c3e5.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Nicholas Susanto <nsusanto@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit cd74ce1f0cddffb3f36d0995d0f61e89f0010738)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 47d785204f29c..beed7adbbd43e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -195,9 +195,9 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_5_soc = {
 	.dcn_downspread_percent = 0.5,
 	.gpuvm_min_page_size_bytes = 4096,
 	.hostvm_min_page_size_bytes = 4096,
-	.do_urgent_latency_adjustment = 0,
+	.do_urgent_latency_adjustment = 1,
 	.urgent_latency_adjustment_fabric_clock_component_us = 0,
-	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 3000,
 };
 
 void dcn35_build_wm_range_table_fpu(struct clk_mgr *clk_mgr)
-- 
2.39.5

