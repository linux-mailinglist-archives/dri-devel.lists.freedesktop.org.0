Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFC731EAF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 19:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E0910E521;
	Thu, 15 Jun 2023 17:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1789310E515;
 Thu, 15 Jun 2023 17:06:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 672D86194D;
 Thu, 15 Jun 2023 17:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74575C433CB;
 Thu, 15 Jun 2023 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686848785;
 bh=pBH7ctxxtgC1B5e2uq+BToOm9A5Oq68fbzBEajU80s4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PB3qfgpt5Mq4cS2ibXgBEVd7mf4HGge8j2/63DI6+t9Maxc/mkRjMxIg/TYTx4ndx
 MWhQ/A8u7/HABWDSxoxIfm2oySbeuXoxklIaLHBjXBK/Po3rtOAxjlRlGwNMOC26Sh
 RD8qDp4IwwMbVH5u1kIRA+K7n7bMHef7dYErhqmiBQAdRbnbAlCvSZlCfyDtBtC3kC
 F4CkeyLqyqVOYYDLqoBOyxfpbNX5qKBW32MaHo6Q7A0hxlxDxT5l3xT3mJzp+q/3uc
 tW7z31i5eYpQPo36Qib7L0IaimJMXwT+yC2B+FyVviyNq/3wfuVGJimgFAKfkWKgH2
 Yhgrf24aMizDw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 15 Jun 2023 10:06:09 -0700
Subject: [PATCH 2/2] drm/amdgpu: Move clocks closer to its only usage in
 amdgpu_parse_cg_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230615-amdgpu-wunused-const-variable-wo-debugfs-v1-2-06efd224aebb@kernel.org>
References: <20230615-amdgpu-wunused-const-variable-wo-debugfs-v1-0-06efd224aebb@kernel.org>
In-Reply-To: <20230615-amdgpu-wunused-const-variable-wo-debugfs-v1-0-06efd224aebb@kernel.org>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6322; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pBH7ctxxtgC1B5e2uq+BToOm9A5Oq68fbzBEajU80s4=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCndrgKbzn8/ftYq7KQEq+9KHb516Xdnx8hflWVZv+GN4
 +SpIdc6OkpZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBETq1g+J9r83Mzs7zCB9ng
 8PmHVd2++rF/y3VVjJvLu8HyhXV6tQjD/2pTu60C2vHPdRuEnDt03+xeF7tI6M/mkJP3zRLPd13
 cyQoA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit a25a9dae2067 ("drm/amd/amdgpu: enable W=1 for amdgpu"),
there is an instance of -Wunused-const-variable when CONFIG_DEBUG_FS is
disabled:

  drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:38:34: error: unused variable 'clocks' [-Werror,-Wunused-const-variable]
     38 | static const struct cg_flag_name clocks[] = {
        |                                  ^
  1 error generated.

clocks is only used when CONFIG_DEBUG_FS is set, so move the definition
into the CONFIG_DEBUG_FS block right above its only usage to clear up
the warning.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 76 +++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index a57952b93e73..386ccf11e657 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -35,44 +35,6 @@
 #include <linux/pm_runtime.h>
 #include <asm/processor.h>
 
-static const struct cg_flag_name clocks[] = {
-	{AMD_CG_SUPPORT_GFX_FGCG, "Graphics Fine Grain Clock Gating"},
-	{AMD_CG_SUPPORT_GFX_MGCG, "Graphics Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_GFX_MGLS, "Graphics Medium Grain memory Light Sleep"},
-	{AMD_CG_SUPPORT_GFX_CGCG, "Graphics Coarse Grain Clock Gating"},
-	{AMD_CG_SUPPORT_GFX_CGLS, "Graphics Coarse Grain memory Light Sleep"},
-	{AMD_CG_SUPPORT_GFX_CGTS, "Graphics Coarse Grain Tree Shader Clock Gating"},
-	{AMD_CG_SUPPORT_GFX_CGTS_LS, "Graphics Coarse Grain Tree Shader Light Sleep"},
-	{AMD_CG_SUPPORT_GFX_CP_LS, "Graphics Command Processor Light Sleep"},
-	{AMD_CG_SUPPORT_GFX_RLC_LS, "Graphics Run List Controller Light Sleep"},
-	{AMD_CG_SUPPORT_GFX_3D_CGCG, "Graphics 3D Coarse Grain Clock Gating"},
-	{AMD_CG_SUPPORT_GFX_3D_CGLS, "Graphics 3D Coarse Grain memory Light Sleep"},
-	{AMD_CG_SUPPORT_MC_LS, "Memory Controller Light Sleep"},
-	{AMD_CG_SUPPORT_MC_MGCG, "Memory Controller Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_SDMA_LS, "System Direct Memory Access Light Sleep"},
-	{AMD_CG_SUPPORT_SDMA_MGCG, "System Direct Memory Access Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_BIF_MGCG, "Bus Interface Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_BIF_LS, "Bus Interface Light Sleep"},
-	{AMD_CG_SUPPORT_UVD_MGCG, "Unified Video Decoder Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_VCE_MGCG, "Video Compression Engine Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_HDP_LS, "Host Data Path Light Sleep"},
-	{AMD_CG_SUPPORT_HDP_MGCG, "Host Data Path Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_DRM_MGCG, "Digital Right Management Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_DRM_LS, "Digital Right Management Light Sleep"},
-	{AMD_CG_SUPPORT_ROM_MGCG, "Rom Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_DF_MGCG, "Data Fabric Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_VCN_MGCG, "VCN Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_HDP_DS, "Host Data Path Deep Sleep"},
-	{AMD_CG_SUPPORT_HDP_SD, "Host Data Path Shutdown"},
-	{AMD_CG_SUPPORT_IH_CG, "Interrupt Handler Clock Gating"},
-	{AMD_CG_SUPPORT_JPEG_MGCG, "JPEG Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_REPEATER_FGCG, "Repeater Fine Grain Clock Gating"},
-	{AMD_CG_SUPPORT_GFX_PERF_CLK, "Perfmon Clock Gating"},
-	{AMD_CG_SUPPORT_ATHUB_MGCG, "Address Translation Hub Medium Grain Clock Gating"},
-	{AMD_CG_SUPPORT_ATHUB_LS, "Address Translation Hub Light Sleep"},
-	{0, NULL},
-};
-
 static const struct hwmon_temp_label {
 	enum PP_HWMON_TEMP channel;
 	const char *label;
@@ -3684,6 +3646,44 @@ static int amdgpu_debugfs_pm_info_pp(struct seq_file *m, struct amdgpu_device *a
 	return 0;
 }
 
+static const struct cg_flag_name clocks[] = {
+	{AMD_CG_SUPPORT_GFX_FGCG, "Graphics Fine Grain Clock Gating"},
+	{AMD_CG_SUPPORT_GFX_MGCG, "Graphics Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_GFX_MGLS, "Graphics Medium Grain memory Light Sleep"},
+	{AMD_CG_SUPPORT_GFX_CGCG, "Graphics Coarse Grain Clock Gating"},
+	{AMD_CG_SUPPORT_GFX_CGLS, "Graphics Coarse Grain memory Light Sleep"},
+	{AMD_CG_SUPPORT_GFX_CGTS, "Graphics Coarse Grain Tree Shader Clock Gating"},
+	{AMD_CG_SUPPORT_GFX_CGTS_LS, "Graphics Coarse Grain Tree Shader Light Sleep"},
+	{AMD_CG_SUPPORT_GFX_CP_LS, "Graphics Command Processor Light Sleep"},
+	{AMD_CG_SUPPORT_GFX_RLC_LS, "Graphics Run List Controller Light Sleep"},
+	{AMD_CG_SUPPORT_GFX_3D_CGCG, "Graphics 3D Coarse Grain Clock Gating"},
+	{AMD_CG_SUPPORT_GFX_3D_CGLS, "Graphics 3D Coarse Grain memory Light Sleep"},
+	{AMD_CG_SUPPORT_MC_LS, "Memory Controller Light Sleep"},
+	{AMD_CG_SUPPORT_MC_MGCG, "Memory Controller Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_SDMA_LS, "System Direct Memory Access Light Sleep"},
+	{AMD_CG_SUPPORT_SDMA_MGCG, "System Direct Memory Access Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_BIF_MGCG, "Bus Interface Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_BIF_LS, "Bus Interface Light Sleep"},
+	{AMD_CG_SUPPORT_UVD_MGCG, "Unified Video Decoder Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_VCE_MGCG, "Video Compression Engine Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_HDP_LS, "Host Data Path Light Sleep"},
+	{AMD_CG_SUPPORT_HDP_MGCG, "Host Data Path Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_DRM_MGCG, "Digital Right Management Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_DRM_LS, "Digital Right Management Light Sleep"},
+	{AMD_CG_SUPPORT_ROM_MGCG, "Rom Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_DF_MGCG, "Data Fabric Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_VCN_MGCG, "VCN Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_HDP_DS, "Host Data Path Deep Sleep"},
+	{AMD_CG_SUPPORT_HDP_SD, "Host Data Path Shutdown"},
+	{AMD_CG_SUPPORT_IH_CG, "Interrupt Handler Clock Gating"},
+	{AMD_CG_SUPPORT_JPEG_MGCG, "JPEG Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_REPEATER_FGCG, "Repeater Fine Grain Clock Gating"},
+	{AMD_CG_SUPPORT_GFX_PERF_CLK, "Perfmon Clock Gating"},
+	{AMD_CG_SUPPORT_ATHUB_MGCG, "Address Translation Hub Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_ATHUB_LS, "Address Translation Hub Light Sleep"},
+	{0, NULL},
+};
+
 static void amdgpu_parse_cg_state(struct seq_file *m, u64 flags)
 {
 	int i;

-- 
2.41.0

