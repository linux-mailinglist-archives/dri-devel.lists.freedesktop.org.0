Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A31D39C4
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 20:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36D089130;
	Thu, 14 May 2020 18:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A87C891FF;
 Thu, 14 May 2020 18:52:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E086F206D8;
 Thu, 14 May 2020 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589482364;
 bh=AQ5Ja54zZPWJCzN1n8jzY96BFQlAAx9L0kU4hbgVYnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lewh+dHyHa8kqsuku5Yn3eE4DCrl/jfsdFqs6g2wRmsgzQfRF7d8jIavG1aYTR1O0
 FeGciNaBajurBTEsQdtgYQ6aNR1D9gqUQ7q8yN43rU50rR9gTJE1anQj7RUjHc4DfJ
 xOraXTSdGvLT41Cnschg0YdVlvjoyorA/uxjwT3o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 44/62] drm/amd/display: Update DCN2.1 DV Code
 Revision
Date: Thu, 14 May 2020 14:51:29 -0400
Message-Id: <20200514185147.19716-44-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514185147.19716-1-sashal@kernel.org>
References: <20200514185147.19716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Sung Lee <sung.lee@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sung Lee <sung.lee@amd.com>

[ Upstream commit b95e51eb9f2ee7b6d6c3203a2f75122349aa77be ]

[WHY & HOW]
There is a problem in hscale_pixel_rate, the bug
causes DCN to be more optimistic (more likely to underflow)
in upscale cases during prefetch.
This commit ports the fix from DV code to address these issues.

Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
index a38baa73d4841..b8ec08e3b7a36 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
@@ -1200,7 +1200,7 @@ static void dml_rq_dlg_get_dlg_params(
 	min_hratio_fact_l = 1.0;
 	min_hratio_fact_c = 1.0;
 
-	if (htaps_l <= 1)
+	if (hratio_l <= 1)
 		min_hratio_fact_l = 2.0;
 	else if (htaps_l <= 6) {
 		if ((hratio_l * 2.0) > 4.0)
@@ -1216,7 +1216,7 @@ static void dml_rq_dlg_get_dlg_params(
 
 	hscale_pixel_rate_l = min_hratio_fact_l * dppclk_freq_in_mhz;
 
-	if (htaps_c <= 1)
+	if (hratio_c <= 1)
 		min_hratio_fact_c = 2.0;
 	else if (htaps_c <= 6) {
 		if ((hratio_c * 2.0) > 4.0)
@@ -1522,8 +1522,8 @@ static void dml_rq_dlg_get_dlg_params(
 
 	disp_dlg_regs->refcyc_per_vm_group_vblank   = get_refcyc_per_vm_group_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;
 	disp_dlg_regs->refcyc_per_vm_group_flip     = get_refcyc_per_vm_group_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;
-	disp_dlg_regs->refcyc_per_vm_req_vblank     = get_refcyc_per_vm_req_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;
-	disp_dlg_regs->refcyc_per_vm_req_flip       = get_refcyc_per_vm_req_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;
+	disp_dlg_regs->refcyc_per_vm_req_vblank     = get_refcyc_per_vm_req_vblank(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz * dml_pow(2, 10);
+	disp_dlg_regs->refcyc_per_vm_req_flip       = get_refcyc_per_vm_req_flip(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz * dml_pow(2, 10);
 
 	// Clamp to max for now
 	if (disp_dlg_regs->refcyc_per_vm_group_vblank >= (unsigned int)dml_pow(2, 23))
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
