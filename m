Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C55F93EB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1CE10E558;
	Sun,  9 Oct 2022 23:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F7410E557;
 Sun,  9 Oct 2022 23:51:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5F675CE102B;
 Sun,  9 Oct 2022 23:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFCBC433B5;
 Sun,  9 Oct 2022 23:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359480;
 bh=0Mkkz5bfFZBlBKXGzFz6TYYw1H49rCJnHuktGD6YMI8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ahje+cu0uJRI2KWNXTiElJg4DNMt95ToVUp2aTlpmHOMJjsHttpRXkbjHvev3TPf+
 M0HtfvaHFKrSfTCPlhQMT+bf6LSFXfszCz3taS0ERyBdZ4LZ3p69/nnqoY/YjyXzoZ
 MdvxxWGYH+QQRXyQqCYSlkFICMeTE08t9beHaaO9k9E/7Zm1ISokuDtS2C85F1yRIY
 x4508q1mRIT0OxNYqI5vrlkcoeJOJJieGE/wTy84VC6weZLohESoN+pzcVYD6VHdmZ
 8qi/2iIFrhJ/lbRj9vFSEWR0YuHbw9C1l8okBS+YmOWKWD5c6w0qPBycA9l6uELbmp
 4iPc5tSoJa68A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 30/44] drm/amd/display: Fix urgent latency
 override for DCN32/DCN321
Date: Sun,  9 Oct 2022 19:49:18 -0400
Message-Id: <20221009234932.1230196-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, David.Galiffi@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, George Shen <george.shen@amd.com>,
 Rodrigo.Siqueira@amd.com, samson.tam@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Alvin.Lee2@amd.com,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 yang.lee@linux.alibaba.com, Jun.Lei@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: George Shen <george.shen@amd.com>

[ Upstream commit e7f2f4cd67443ce308480ca461806fcc3456e0ba ]

[Why]
The urgent latency override is useful when debugging issues
relating to underflow.

Current overridden variable is not correct and has no effect
on DCN3.2 and DCN3.21 DML calculations.

[How]
For DCN3.2 and DCN3.21, override the correct urgent latency
variable when bounding box override is present.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Reviewed-by: Nevenko Stupar <Nevenko.Stupar@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index e573e706430d..b9d3a4000c3d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -2199,6 +2199,7 @@ void dcn32_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_pa
 		if ((int)(dcn3_2_soc.urgent_latency_us * 1000) != dc->bb_overrides.urgent_latency_ns
 			&& dc->bb_overrides.urgent_latency_ns) {
 			dcn3_2_soc.urgent_latency_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
+			dcn3_2_soc.urgent_latency_pixel_data_only_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
 		}
 
 		if ((int)(dcn3_2_soc.dram_clock_change_latency_us * 1000)
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
index c87091683b5d..b6369758b491 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
@@ -489,6 +489,7 @@ void dcn321_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_p
 		if ((int)(dcn3_21_soc.urgent_latency_us * 1000) != dc->bb_overrides.urgent_latency_ns
 			&& dc->bb_overrides.urgent_latency_ns) {
 			dcn3_21_soc.urgent_latency_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
+			dcn3_21_soc.urgent_latency_pixel_data_only_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
 		}
 
 		if ((int)(dcn3_21_soc.dram_clock_change_latency_us * 1000)
-- 
2.35.1

