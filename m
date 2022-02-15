Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064ED4B6FC6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEC210E5C9;
	Tue, 15 Feb 2022 15:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E2A10E5C0;
 Tue, 15 Feb 2022 15:29:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9129E61661;
 Tue, 15 Feb 2022 15:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D584AC340ED;
 Tue, 15 Feb 2022 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644938982;
 bh=Oi/z8FXJe7HaSYVUhQ0ZeCMIKUhAiYSLwLD4ZSc+Jec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JHlduCBgsyaB2sBCz7+FJuuN1wKvv/zMrSM2r8ayM2CLQhwnPhFIn7X/c8SgBHzLA
 pqKIdf6kzrkDRd3WUbJX6xXz9piVPkExWICLBZIbHpARbcA4aoJjy4T3OgISHDCbi6
 S5rfyY7v/W3yq0WEcIJv/W4wwJYrCl88vKaUGJsMkclU/7hwj3UYmEW+6trPGJ1nha
 hfjAga9rafXV2lNNlB5JS1y1UZSUA1cAl61/DyZoUQALPt/uG38pE4CcMjsIp57QNV
 OB9bSqSxv8ZOSUMcphqaDdChT2Le53vTcY0VB5bakO/+Veg+z0UqT5dMxyAAZVVOz2
 yY7WC1fLGMShA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 29/33] drm/amd/display: Cap pflip irqs per max
 otg number
Date: Tue, 15 Feb 2022 10:28:27 -0500
Message-Id: <20220215152831.580780-29-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152831.580780-1-sashal@kernel.org>
References: <20220215152831.580780-1-sashal@kernel.org>
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
Cc: Lewis.Huang@amd.com, haonan.wang2@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, meenakshikumar.somasundaram@amd.com,
 jun.lei@amd.com, lee.jones@linaro.org, Jimmy.Kizito@amd.com,
 Sasha Levin <sashal@kernel.org>, anthony1.wang@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 Jerry.Zuo@amd.com, aurabindo.pillai@amd.com, michael.strauss@amd.com,
 Anson.Jacob@amd.com, nikola.cornij@amd.com, Martin.Leung@amd.com,
 MarkAlbert.Morra@amd.com, Eric.Yang2@amd.com, shenshih@amd.com,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, Roman Li <Roman.Li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, roy.chan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Li <Roman.Li@amd.com>

[ Upstream commit 328e34a5ad227399391891d454043e5d73e598d2 ]

[Why]
pflip interrupt order are mapped 1 to 1 to otg id.
e.g. if irq_src=26 corresponds to otg0 then 27->otg1, 28->otg2...

Linux DM registers pflip interrupts per number of crtcs.
In fused pipe case crtc numbers can be less than otg id.

e.g. if one pipe out of 3(otg#0-2) is fused adev->mode_info.num_crtc=2
so DM only registers irq_src 26,27.
This is a bug since if pipe#2 remains unfused DM never gets
otg2 pflip interrupt (irq_src=28)
That may results in gfx failure due to pflip timeout.

[How]
Register pflip interrupts per max num of otg instead of num_crtc

Signed-off-by: Roman Li <Roman.Li@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c          | 2 ++
 drivers/gpu/drm/amd/display/dc/dc.h               | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 16556ae892d4a..5ae9b8133d6da 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3230,7 +3230,7 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 
 	/* Use GRPH_PFLIP interrupt */
 	for (i = DCN_1_0__SRCID__HUBP0_FLIP_INTERRUPT;
-			i <= DCN_1_0__SRCID__HUBP0_FLIP_INTERRUPT + adev->mode_info.num_crtc - 1;
+			i <= DCN_1_0__SRCID__HUBP0_FLIP_INTERRUPT + dc->caps.max_otg_num - 1;
 			i++) {
 		r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_DCE, i, &adev->pageflip_irq);
 		if (r) {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 1860ccc3f4f2c..4fae73478840c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1118,6 +1118,8 @@ struct dc *dc_create(const struct dc_init_data *init_params)
 
 		dc->caps.max_dp_protocol_version = DP_VERSION_1_4;
 
+		dc->caps.max_otg_num = dc->res_pool->res_cap->num_timing_generator;
+
 		if (dc->res_pool->dmcu != NULL)
 			dc->versions.dmcu_version = dc->res_pool->dmcu->dmcu_version;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 3ab52d9a82cf6..e0f58fab5e8ed 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -185,6 +185,7 @@ struct dc_caps {
 	struct dc_color_caps color;
 	bool vbios_lttpr_aware;
 	bool vbios_lttpr_enable;
+	uint32_t max_otg_num;
 };
 
 struct dc_bug_wa {
-- 
2.34.1

