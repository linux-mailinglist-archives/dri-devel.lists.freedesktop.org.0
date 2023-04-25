Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03C6EEADC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 01:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2810E81F;
	Tue, 25 Apr 2023 23:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081BE10E1F0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 23:11:12 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 422AF1F892;
 Wed, 26 Apr 2023 01:11:10 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 26 Apr 2023 01:11:10 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: Drop unused members from HW structs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230418-dpu-drop-useless-for-lookup-v3-2-e8d869eea455@somainline.org>
References: <20230418-dpu-drop-useless-for-lookup-v3-0-e8d869eea455@somainline.org>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v3-0-e8d869eea455@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of these members were initialized while never read, while others
were not even assigned any pointer value at all.  Drop them to save some
space, and above all confusion when looking at or accidentally
dereferencing these members.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h   | 5 -----
 6 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 84ee2efa9c664..a9c90249a6aca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -374,7 +374,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 	 */
 	c->idx = idx;
 	c->cap = cfg;
-	c->mdss = m;
 	_setup_intf_ops(&c->ops, c->cap->features);
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 643dd10bc0306..e07b2e33af3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -90,7 +90,6 @@ struct dpu_hw_intf {
 	/* intf */
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
-	const struct dpu_mdss_cfg *mdss;
 
 	/* ops */
 	struct dpu_hw_intf_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index cf70a9bd1034f..bb3ddec5c7d73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -812,7 +812,6 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 	}
 
 	/* Assign ops */
-	hw_pipe->catalog = catalog;
 	hw_pipe->ubwc = catalog->ubwc;
 	hw_pipe->idx = idx;
 	hw_pipe->cap = cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 74b98b6b3bc3a..5004a02fd61e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -341,7 +341,6 @@ struct dpu_hw_sspp_ops {
  * struct dpu_hw_sspp - pipe description
  * @base: hardware block base structure
  * @hw: block hardware details
- * @catalog: back pointer to catalog
  * @ubwc: ubwc configuration data
  * @idx: pipe index
  * @cap: pointer to layer_cfg
@@ -350,7 +349,6 @@ struct dpu_hw_sspp_ops {
 struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
-	const struct dpu_mdss_cfg *catalog;
 	const struct dpu_ubwc_cfg *ubwc;
 
 	/* Pipe */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index a3e413d277175..f33b48045b5c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -263,7 +263,6 @@ struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
 	}
 
 	/* Assign ops */
-	c->mdp = &m->mdp[0];
 	c->idx = idx;
 	c->caps = cfg;
 	_setup_wb_ops(&c->ops, c->caps->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 3ff5a48541e2e..b91923f879f13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -76,15 +76,12 @@ struct dpu_hw_wb_ops {
 /**
  * struct dpu_hw_wb : WB driver object
  * @hw: block hardware details
- * @mdp: pointer to associated mdp portion of the catalog
  * @idx: hardware index number within type
  * @wb_hw_caps: hardware capabilities
  * @ops: function pointers
- * @hw_mdp: MDP top level hardware block
  */
 struct dpu_hw_wb {
 	struct dpu_hw_blk_reg_map hw;
-	const struct dpu_mdp_cfg *mdp;
 
 	/* wb path */
 	int idx;
@@ -92,8 +89,6 @@ struct dpu_hw_wb {
 
 	/* ops */
 	struct dpu_hw_wb_ops ops;
-
-	struct dpu_hw_mdp *hw_mdp;
 };
 
 /**

-- 
2.40.1

