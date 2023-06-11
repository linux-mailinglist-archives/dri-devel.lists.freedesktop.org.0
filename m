Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDBD72B275
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 17:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9120D10E0E3;
	Sun, 11 Jun 2023 15:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D02E10E0E3;
 Sun, 11 Jun 2023 15:23:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxZ+kH54VkptwCAA--.4558S3;
 Sun, 11 Jun 2023 23:23:52 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxVeQH54VkHBATAA--.55302S2; 
 Sun, 11 Jun 2023 23:23:51 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alvin Lee <Alvin.Lee2@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Samson Tam <samson.tam@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, Alan Liu <HaoPing.Liu@amd.com>
Subject: [PATCH v2] drm/amdgpu: Add error reporting code for the display core
Date: Sun, 11 Jun 2023 23:23:51 +0800
Message-Id: <20230611152351.24569-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxVeQH54VkHBATAA--.55302S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr1kAFykJryDJF1xCryxCrX_yoW5uFW7pw
 4fGa1YgrWUAwnIqrZxJay0vF1fAa4fKF40yry3Cw1Sqa9rtrn3Jr48Gr1ayay3JFZxWa4I
 qFZ0y3y5uF12krcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
 twAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
 8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8hID7UUUUU==
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

[why]

Because the drm/amdgpu drivers do not work with Navi 10 [RX 5700] series
GPUs on non-x86 platforms, this patch helps find out where the drivers fail.
After applying his patch, the following error message can be found:

[drm:dc_create [amdgpu]] *ERROR* dc_construct: failed to create resource pool
[drm:dc_create [amdgpu]] *ERROR* dc_create: dc construct failed
[drm] Display Core failed to initialize with v3.2.230!

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

