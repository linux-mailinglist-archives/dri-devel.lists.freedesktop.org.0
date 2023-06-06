Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3B724C98
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3E810E394;
	Tue,  6 Jun 2023 19:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3DDC10E255;
 Tue,  6 Jun 2023 19:11:03 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxUem3hH9kQk0AAA--.396S3;
 Wed, 07 Jun 2023 03:10:47 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxCOW3hH9k7voCAA--.11776S2; 
 Wed, 07 Jun 2023 03:10:47 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alvin Lee <Alvin.Lee2@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Samson Tam <samson.tam@amd.com>, Dillon Varone <Dillon.Varone@amd.com>,
 Alan Liu <HaoPing.Liu@amd.com>
Subject: [PATCH] drm/amdgpu: add error reporting code
Date: Wed,  7 Jun 2023 03:10:46 +0800
Message-Id: <20230606191046.300194-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxCOW3hH9k7voCAA--.11776S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF4UtF1fGw1xur48tF4fZwc_yoW5Ar4xpw
 4fGa1Y9rWUJwnIqrZxAay0qF1fAa4fKF40yry3Cw1Sva9rtr13tr48Cr1ay3y3JFZxWFyI
 qFWDKa15uF12krcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcsjjDUUUU
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 29 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 52564b93f7eb..d33b78aa3e58 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -951,7 +951,7 @@ static bool dc_construct(struct dc *dc,
 		goto fail;
 	}
 
-        dc_ctx = dc->ctx;
+	dc_ctx = dc->ctx;
 
 	/* Resource should construct all asic specific resources.
 	 * This should be the only place where we need to parse the asic id
@@ -990,16 +990,21 @@ static bool dc_construct(struct dc *dc,
 	}
 
 	dc->res_pool = dc_create_resource_pool(dc, init_params, dc_ctx->dce_version);
-	if (!dc->res_pool)
+	if (!dc->res_pool) {
+		dm_error("%s: failed to create resource pool\n", __func__);
 		goto fail;
+	}
 
 	/* set i2c speed if not done by the respective dcnxxx__resource.c */
 	if (dc->caps.i2c_speed_in_khz_hdcp == 0)
 		dc->caps.i2c_speed_in_khz_hdcp = dc->caps.i2c_speed_in_khz;
 
 	dc->clk_mgr = dc_clk_mgr_create(dc->ctx, dc->res_pool->pp_smu, dc->res_pool->dccg);
-	if (!dc->clk_mgr)
+	if (!dc->clk_mgr) {
+		dm_error("%s: failed to create clk manager\n", __func__);
 		goto fail;
+	}
+
 #ifdef CONFIG_DRM_AMD_DC_FP
 	dc->clk_mgr->force_smu_not_present = init_params->force_smu_not_present;
 
@@ -1022,14 +1027,18 @@ static bool dc_construct(struct dc *dc,
 		goto fail;
 	}
 
-	if (!create_links(dc, init_params->num_virtual_links))
+	if (!create_links(dc, init_params->num_virtual_links)) {
+		dm_error("%s: failed to create links\n", __func__);
 		goto fail;
+	}
 
 	/* Create additional DIG link encoder objects if fewer than the platform
 	 * supports were created during link construction.
 	 */
-	if (!create_link_encoders(dc))
+	if (!create_link_encoders(dc)) {
+		dm_error("%s: failed to create link encoders\n", __func__);
 		goto fail;
+	}
 
 	dc_resource_state_construct(dc, dc->current_state);
 
@@ -1314,11 +1323,15 @@ struct dc *dc_create(const struct dc_init_data *init_params)
 		return NULL;
 
 	if (init_params->dce_environment == DCE_ENV_VIRTUAL_HW) {
-		if (!dc_construct_ctx(dc, init_params))
+		if (!dc_construct_ctx(dc, init_params)) {
+			DC_LOG_ERROR("%s: dc construct failed\n", __func__);
 			goto destruct_dc;
+		}
 	} else {
-		if (!dc_construct(dc, init_params))
+		if (!dc_construct(dc, init_params)) {
+			DC_LOG_ERROR("%s: dc construct failed\n", __func__);
 			goto destruct_dc;
+		}
 
 		full_pipe_count = dc->res_pool->pipe_count;
 		if (dc->res_pool->underlay_pipe_index != NO_UNDERLAY_PIPE)
@@ -1349,8 +1362,6 @@ struct dc *dc_create(const struct dc_init_data *init_params)
 
 	DC_LOG_DC("Display Core initialized\n");
 
-
-
 	return dc;
 
 destruct_dc:
-- 
2.25.1

