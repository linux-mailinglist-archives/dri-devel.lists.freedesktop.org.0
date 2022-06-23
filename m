Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD0D557E9A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 17:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC8910E3DC;
	Thu, 23 Jun 2022 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00D710E2CD;
 Thu, 23 Jun 2022 15:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65757B82432;
 Thu, 23 Jun 2022 15:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7644AC3411B;
 Thu, 23 Jun 2022 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655998222;
 bh=9IiqPYfcXWURVQnYyP27liVmnWflaj9GvYBZVI6svWw=;
 h=From:To:Cc:Subject:Date:From;
 b=VSZmB7xf4/SgxNoMlzYMakEXgG68yZQNpr4AwFXTTU6VPvnK41sUGZNxsqeJ2WCks
 bBw1JIE3oOGe+cvo81j5ul18o+q5Px0nvnVtS7LtcBwXeYcSYqeu7QMRz2fK2rfSRM
 Bpzs6XvXPKN3hDZb2t3Cjdb5byCCcxrLqSRcVfU7p3eAW9a4ohC53zt5yeRbJgILAW
 yN52+pp0ILALKyepOIv/1t6IeidtNEWdM3Sy9lBl9Hybhle3SP27txTVXncerSRZKD
 9e9Dm+Z6TDy0pkSsJrbNg8mbMZnBaMTGfr/z2kxjL4/TixwvGPH84kx7CPb1EQMWP6
 NdZatZcRmnTHw==
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/amd/display: Fix indentation in
 dcn32_get_vco_frequency_from_reg()
Date: Thu, 23 Jun 2022 08:30:01 -0700
Message-Id: <20220623153001.3136739-1-nathan@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:549:4: warning: misleading indentation; statement is not part of the previous 'else' [-Wmisleading-indentation]
                          pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
                          ^
  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:542:3: note: previous statement is here
                  else
                  ^
  1 warning generated.

Indent this statement to the left, as it was clearly intended to be
called unconditionally, which will fix the warning.

Link: https://github.com/ClangBuiltLinux/linux/issues/1655
Fixes: 3e838f7ccf64 ("drm/amd/display: Get VCO frequency from registers")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 113f93b3d3b2..4e8059f20007 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -546,7 +546,7 @@ static uint32_t dcn32_get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mg
 		 * this works because the int part is on the right edge of the register
 		 * and the frac part is on the left edge
 		 */
-			pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
+		pll_req = dc_fixpt_from_int(pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_int);
 		pll_req.value |= pll_req_reg & clk_mgr->clk_mgr_mask->FbMult_frac;
 
 		/* multiply by REFCLK period */

base-commit: fdf249c70a36e2daa7ddf1252cf3b71faed87abc
-- 
2.36.1

