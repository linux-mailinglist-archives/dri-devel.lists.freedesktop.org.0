Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4858E58FF81
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C888B4335;
	Thu, 11 Aug 2022 15:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB81B4383;
 Thu, 11 Aug 2022 15:30:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E01C761490;
 Thu, 11 Aug 2022 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65334C433D6;
 Thu, 11 Aug 2022 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660231846;
 bh=fryF2K+6C57uC+nNGZ3xhsVa5xsK6PpfOvIDAELGqu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E47K3/OKz1q6iZNPcwjuahy9UxFJuNeG4qNLKIm5y9QPIF2W2qkC0SxZD52nDKvaD
 XU3hbGXIDbeOFDLSwIOYoJzULFI8QMsE2RKDt2SfxWD46MDstEx80t++cpldIeKEhb
 FcJz8T/jD/oBadBb1mlQn7RpLoQTCDA/TsLIvFI+AGGhO8QZ5mTbn82SKFglEH8Txr
 uTph1Q+NN2YS8+IJ9KAroa3tuqt+XxIEGCtKANxDY/u4cENXnZDAMr5Z8hTxKuz5m5
 XXavMNcxFn4LytLgdxajddaQBxj5ExA912aNXmgRUC50mr/sQ8POiguxUkSNT+lJvQ
 EM5vxNIpx0ncQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 016/105] drm/amd/display: Correct min comp buffer
 size
Date: Thu, 11 Aug 2022 11:27:00 -0400
Message-Id: <20220811152851.1520029-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 Duncan Ma <duncan.ma@amd.com>, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 airlied@linux.ie, Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, alex.hung@amd.com,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Duncan Ma <duncan.ma@amd.com>

[ Upstream commit 0c56705d8aae9696348cc320b71d531ede001b79 ]

[Why]
In 3-way mpo pipes, there is a case that we
overbook the CRB buffer size. At rare instances,
overbooking the crb will cause underflow. This only
happens when det_size changes dynamically
based on pipe_cnt.

[How]
Set min compbuff size to 1 segment when preparing BW.

Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Duncan Ma <duncan.ma@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 54db2eca9e6b..1b02f0ebe957 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -201,7 +201,7 @@ struct _vcs_dpi_ip_params_st dcn3_15_ip = {
 	.hostvm_max_page_table_levels = 2,
 	.rob_buffer_size_kbytes = 64,
 	.det_buffer_size_kbytes = DCN3_15_DEFAULT_DET_SIZE,
-	.min_comp_buffer_size_kbytes = DCN3_15_MIN_COMPBUF_SIZE_KB,
+	.min_comp_buffer_size_kbytes = 64,
 	.config_return_buffer_size_in_kbytes = 1024,
 	.compressed_buffer_segment_size_in_kbytes = 64,
 	.meta_fifo_size_in_kentries = 32,
@@ -297,6 +297,7 @@ struct _vcs_dpi_ip_params_st dcn3_16_ip = {
 	.hostvm_max_page_table_levels = 2,
 	.rob_buffer_size_kbytes = 64,
 	.det_buffer_size_kbytes = DCN3_16_DEFAULT_DET_SIZE,
+	.min_comp_buffer_size_kbytes = 64,
 	.config_return_buffer_size_in_kbytes = 1024,
 	.compressed_buffer_segment_size_in_kbytes = 64,
 	.meta_fifo_size_in_kentries = 32,
-- 
2.35.1

