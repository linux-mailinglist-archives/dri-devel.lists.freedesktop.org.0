Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D564574A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ECF10E1A0;
	Wed,  7 Dec 2022 10:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F1D910E1A0;
 Wed,  7 Dec 2022 10:13:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-03 (Coremail) with SMTP id rQCowAAnLnJRZ5BjUr8+BQ--.9743S2;
 Wed, 07 Dec 2022 18:13:38 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, bas@basnieuwenhuizen.nl,
 Martin.Leung@amd.com, Jun.Lei@amd.com, Chris.Park@amd.com,
 aurabindo.pillai@amd.com, mwen@igalia.com
Subject: [PATCH] drm/amd/display: Add check for kzalloc
Date: Wed,  7 Dec 2022 18:13:36 +0800
Message-Id: <20221207101336.22264-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAnLnJRZ5BjUr8+BQ--.9743S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryDCFWDCw1rCF1xWr1xZrb_yoWrJry7pa
 1xJw1jqwsrAF4ktFy3JF1UWF4rJ3WIka4FkrZ8A3sIvF1UAryrCry5AF1jvanYgF4DAr17
 J3Wjgr45WFnFyrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6c_
 fUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As kzalloc may fail and return NULL pointer, it should be better to check
the return value in order to avoid the NULL pointer dereference.
Moreover, dcn3_clk_mgr_construct should return the error and
should be checked cascadingly.

Fixes: 4d55b0dd1cdd ("drm/amd/display: Add DCN3 CLK_MGR")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c         | 9 ++++++---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c | 6 +++++-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h | 2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index f276abb63bcd..c08916bd5650 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -257,15 +257,18 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 			return NULL;
 		}
 		if (ASICREV_IS_SIENNA_CICHLID_P(asic_id.hw_internal_rev)) {
-			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+			if (dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg))
+				return NULL;
 			return &clk_mgr->base;
 		}
 		if (ASICREV_IS_DIMGREY_CAVEFISH_P(asic_id.hw_internal_rev)) {
-			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+			if (dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg))
+				return NULL;
 			return &clk_mgr->base;
 		}
 		if (ASICREV_IS_BEIGE_GOBY_P(asic_id.hw_internal_rev)) {
-			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+			if (dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg))
+				return NULL;
 			return &clk_mgr->base;
 		}
 		if (asic_id.chip_id == DEVICE_ID_NV_13FE) {
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index 3ce0ee0d012f..86c29dc45b70 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -517,7 +517,7 @@ struct clk_mgr_funcs dcn3_fpga_funcs = {
 };
 
 /*todo for dcn30 for clk register offset*/
-void dcn3_clk_mgr_construct(
+int dcn3_clk_mgr_construct(
 		struct dc_context *ctx,
 		struct clk_mgr_internal *clk_mgr,
 		struct pp_smu_funcs *pp_smu,
@@ -568,11 +568,15 @@ void dcn3_clk_mgr_construct(
 	dce_clock_read_ss_info(clk_mgr);
 
 	clk_mgr->base.bw_params = kzalloc(sizeof(*clk_mgr->base.bw_params), GFP_KERNEL);
+	if (!clk_mgr->base.bw_params)
+		return -ENOMEM;
 
 	/* need physical address of table to give to PMFW */
 	clk_mgr->wm_range_table = dm_helpers_allocate_gpu_mem(clk_mgr->base.ctx,
 			DC_MEM_ALLOC_TYPE_GART, sizeof(WatermarksExternal_t),
 			&clk_mgr->wm_range_table_addr);
+
+	return 0;
 }
 
 void dcn3_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
index 2cd95ec38266..8bdfed735184 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
@@ -88,7 +88,7 @@
 #endif
 void dcn3_init_clocks(struct clk_mgr *clk_mgr_base);
 
-void dcn3_clk_mgr_construct(struct dc_context *ctx,
+int dcn3_clk_mgr_construct(struct dc_context *ctx,
 		struct clk_mgr_internal *clk_mgr,
 		struct pp_smu_funcs *pp_smu,
 		struct dccg *dccg);
-- 
2.25.1

