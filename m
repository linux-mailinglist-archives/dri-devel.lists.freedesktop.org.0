Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A519347B65
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656F66EC6D;
	Wed, 24 Mar 2021 15:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0BB6EC66
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:58 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id u4so30588179ljo.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=26IOf6ZGfzqvI713tnEwpFJ5rZXSRn45wHEBAEtfFJw=;
 b=bEU4tJj2hUeNmYMj40zFcr+OdrAN7FwpKiGZp8uV1d3eqdI4CntrRVHwQf32ki++uf
 4KGsaLSW6+6+xNVGRwm8y3ECdHik1YaU37DghmO5i4oSvIfaf+aiqUBTi2Ll7e1l/xra
 6Z9W1yKnjAkjNltc4/bA0s/gyf87F+3jOcPtXVZrFaUj9gxmlS1gr8zmZ126sh5lE+hK
 1zjCrRw9MOge75GOILWftmoYoHvukqP58/tX8of1h5dQlOQXam5hdFyIVP5+HIPoSw91
 btZ7qwFsAIg9IG98eF8p0Gs4NSLaffwyUNiLCmgZ7rEsFUQ+vbC5vymkbEr0a5hWLmQk
 a+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=26IOf6ZGfzqvI713tnEwpFJ5rZXSRn45wHEBAEtfFJw=;
 b=fJxIb34tuR9pr5bQau2iSX20UJ6bpXFZAzn5AQZQF3DGJsi+FfqJ2+84LKGCKIL7hW
 qiyWu/qI5+6Aq4ZcXXZwX+qgSUsb636I1HUmXUmz/eU/MkaCYg/be5ANk/s//oZ8UUAg
 2zIC6PiWwt0FXYxleAoQW6HbMoOwdTQl8+olAwweU2Y3Rtua5a/9ywTAFJaFnuAPNhNe
 IROxj/KHT6if/jc1oNkc+GVJPXar4k8U/SA3b6gc/0OXxMnQP/XSE9jhetczg1iN1z/R
 wqRR0oNek3h1X+y6p6o8QptAcHqmIe6UWq3PlbCLNZzEEXBSXbVC5Niv6tBnm0yht8IK
 l7dg==
X-Gm-Message-State: AOAM530U5+yKH6Ik/twu9VFEw+janMIWEASZH6ws+8seIL1DPLxPS86K
 owSDuKkknZ+/N7ztWsDEFY1Oqw==
X-Google-Smtp-Source: ABdhPJw1DTyDNc5Uk4UUuw0ofKPSgYgDUc7v5H+MYCxYXtkoEhw/ZjgfqGG/gGQ+T7XJAEdae5ylTg==
X-Received: by 2002:a2e:95d6:: with SMTP id y22mr2334376ljh.361.1616598053703; 
 Wed, 24 Mar 2021 08:00:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 19/21] drm/msm/dpu: call hw_vbif ops directly
Date: Wed, 24 Mar 2021 18:00:22 +0300
Message-Id: <20210324150024.2768215-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace dpu_hw_vbif callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c |  30 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h | 159 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    |  39 ++---
 3 files changed, 100 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index 377d5e8ae615..d7d2e7edc0e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -32,7 +32,7 @@
 #define VBIF_XINL_QOS_RP_REMAP_000	0x0550
 #define VBIF_XINL_QOS_LVL_REMAP_000(v)	(v < DPU_HW_VER_400 ? 0x570 : 0x0590)
 
-static void dpu_hw_clear_errors(struct dpu_hw_vbif *vbif,
+void dpu_hw_vbif_clear_errors(struct dpu_hw_vbif *vbif,
 		u32 *pnd_errors, u32 *src_errors)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -52,7 +52,7 @@ static void dpu_hw_clear_errors(struct dpu_hw_vbif *vbif,
 	DPU_REG_WRITE(c, VBIF_XIN_CLR_ERR, pnd | src);
 }
 
-static void dpu_hw_set_mem_type(struct dpu_hw_vbif *vbif,
+void dpu_hw_vbif_set_mem_type(struct dpu_hw_vbif *vbif,
 		u32 xin_id, u32 value)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -82,7 +82,7 @@ static void dpu_hw_set_mem_type(struct dpu_hw_vbif *vbif,
 	DPU_REG_WRITE(c, reg_off, reg_val);
 }
 
-static void dpu_hw_set_limit_conf(struct dpu_hw_vbif *vbif,
+void dpu_hw_vbif_set_limit_conf(struct dpu_hw_vbif *vbif,
 		u32 xin_id, bool rd, u32 limit)
 {
 	struct dpu_hw_blk_reg_map *c = &vbif->hw;
@@ -103,7 +103,7 @@ static void dpu_hw_set_limit_conf(struct dpu_hw_vbif *vbif,
 	DPU_REG_WRITE(c, reg_off, reg_val);
 }
 
-static u32 dpu_hw_get_limit_conf(struct dpu_hw_vbif *vbif,
+u32 dpu_hw_vbif_get_limit_conf(struct dpu_hw_vbif *vbif,
 		u32 xin_id, bool rd)
 {
 	struct dpu_hw_blk_reg_map *c = &vbif->hw;
@@ -125,7 +125,7 @@ static u32 dpu_hw_get_limit_conf(struct dpu_hw_vbif *vbif,
 	return limit;
 }
 
-static void dpu_hw_set_halt_ctrl(struct dpu_hw_vbif *vbif,
+void dpu_hw_vbif_set_halt_ctrl(struct dpu_hw_vbif *vbif,
 		u32 xin_id, bool enable)
 {
 	struct dpu_hw_blk_reg_map *c = &vbif->hw;
@@ -141,7 +141,7 @@ static void dpu_hw_set_halt_ctrl(struct dpu_hw_vbif *vbif,
 	DPU_REG_WRITE(c, VBIF_XIN_HALT_CTRL0, reg_val);
 }
 
-static bool dpu_hw_get_halt_ctrl(struct dpu_hw_vbif *vbif,
+bool dpu_hw_vbif_get_halt_ctrl(struct dpu_hw_vbif *vbif,
 		u32 xin_id)
 {
 	struct dpu_hw_blk_reg_map *c = &vbif->hw;
@@ -152,7 +152,7 @@ static bool dpu_hw_get_halt_ctrl(struct dpu_hw_vbif *vbif,
 	return (reg_val & BIT(xin_id)) ? true : false;
 }
 
-static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
+void dpu_hw_vbif_set_qos_remap(struct dpu_hw_vbif *vbif,
 		u32 xin_id, u32 level, u32 remap_level)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -182,7 +182,7 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
 	DPU_REG_WRITE(c, reg_lvl + reg_high, reg_val_lvl);
 }
 
-static void dpu_hw_set_write_gather_en(struct dpu_hw_vbif *vbif, u32 xin_id)
+void dpu_hw_vbif_set_write_gather_en(struct dpu_hw_vbif *vbif, u32 xin_id)
 {
 	struct dpu_hw_blk_reg_map *c;
 	u32 reg_val;
@@ -197,19 +197,6 @@ static void dpu_hw_set_write_gather_en(struct dpu_hw_vbif *vbif, u32 xin_id)
 	DPU_REG_WRITE(c, VBIF_WRITE_GATHER_EN, reg_val);
 }
 
-static void _setup_vbif_ops(struct dpu_hw_vbif_ops *ops,
-		unsigned long cap)
-{
-	ops->set_limit_conf = dpu_hw_set_limit_conf;
-	ops->get_limit_conf = dpu_hw_get_limit_conf;
-	ops->set_halt_ctrl = dpu_hw_set_halt_ctrl;
-	ops->get_halt_ctrl = dpu_hw_get_halt_ctrl;
-	ops->set_qos_remap = dpu_hw_set_qos_remap;
-	ops->set_mem_type = dpu_hw_set_mem_type;
-	ops->clear_errors = dpu_hw_clear_errors;
-	ops->set_write_gather_en = dpu_hw_set_write_gather_en;
-}
-
 static const struct dpu_vbif_cfg *_top_offset(enum dpu_vbif vbif,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -253,7 +240,6 @@ struct dpu_hw_vbif *dpu_hw_vbif_init(enum dpu_vbif idx,
 	 */
 	c->idx = idx;
 	c->cap = cfg;
-	_setup_vbif_ops(&c->ops, c->cap->features);
 
 	/* no need to register sub-range in dpu dbg, dump entire vbif io base */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
index 6417aa28d32c..7a81f0729d9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -11,87 +11,85 @@
 
 struct dpu_hw_vbif;
 
-/**
- * struct dpu_hw_vbif_ops : Interface to the VBIF hardware driver functions
+/*
  *  Assumption is these functions will be called after clocks are enabled
  */
-struct dpu_hw_vbif_ops {
-	/**
-	 * set_limit_conf - set transaction limit config
-	 * @vbif: vbif context driver
-	 * @xin_id: client interface identifier
-	 * @rd: true for read limit; false for write limit
-	 * @limit: outstanding transaction limit
-	 */
-	void (*set_limit_conf)(struct dpu_hw_vbif *vbif,
-			u32 xin_id, bool rd, u32 limit);
-
-	/**
-	 * get_limit_conf - get transaction limit config
-	 * @vbif: vbif context driver
-	 * @xin_id: client interface identifier
-	 * @rd: true for read limit; false for write limit
-	 * @return: outstanding transaction limit
-	 */
-	u32 (*get_limit_conf)(struct dpu_hw_vbif *vbif,
-			u32 xin_id, bool rd);
-
-	/**
-	 * set_halt_ctrl - set halt control
-	 * @vbif: vbif context driver
-	 * @xin_id: client interface identifier
-	 * @enable: halt control enable
-	 */
-	void (*set_halt_ctrl)(struct dpu_hw_vbif *vbif,
-			u32 xin_id, bool enable);
-
-	/**
-	 * get_halt_ctrl - get halt control
-	 * @vbif: vbif context driver
-	 * @xin_id: client interface identifier
-	 * @return: halt control enable
-	 */
-	bool (*get_halt_ctrl)(struct dpu_hw_vbif *vbif,
-			u32 xin_id);
-
-	/**
-	 * set_qos_remap - set QoS priority remap
-	 * @vbif: vbif context driver
-	 * @xin_id: client interface identifier
-	 * @level: priority level
-	 * @remap_level: remapped level
-	 */
-	void (*set_qos_remap)(struct dpu_hw_vbif *vbif,
-			u32 xin_id, u32 level, u32 remap_level);
-
-	/**
-	 * set_mem_type - set memory type
-	 * @vbif: vbif context driver
-	 * @xin_id: client interface identifier
-	 * @value: memory type value
-	 */
-	void (*set_mem_type)(struct dpu_hw_vbif *vbif,
-			u32 xin_id, u32 value);
-
-	/**
-	 * clear_errors - clear any vbif errors
-	 *	This function clears any detected pending/source errors
-	 *	on the VBIF interface, and optionally returns the detected
-	 *	error mask(s).
-	 * @vbif: vbif context driver
-	 * @pnd_errors: pointer to pending error reporting variable
-	 * @src_errors: pointer to source error reporting variable
-	 */
-	void (*clear_errors)(struct dpu_hw_vbif *vbif,
-		u32 *pnd_errors, u32 *src_errors);
-
-	/**
-	 * set_write_gather_en - set write_gather enable
-	 * @vbif: vbif context driver
-	 * @xin_id: client interface identifier
-	 */
-	void (*set_write_gather_en)(struct dpu_hw_vbif *vbif, u32 xin_id);
-};
+
+/**
+ * dpu_hw_vbif_set_limit_conf - set transaction limit config
+ * @vbif: vbif context driver
+ * @xin_id: client interface identifier
+ * @rd: true for read limit; false for write limit
+ * @limit: outstanding transaction limit
+ */
+void dpu_hw_vbif_set_limit_conf(struct dpu_hw_vbif *vbif,
+		u32 xin_id, bool rd, u32 limit);
+
+/**
+ * dpu_hw_vbif_get_limit_conf - get transaction limit config
+ * @vbif: vbif context driver
+ * @xin_id: client interface identifier
+ * @rd: true for read limit; false for write limit
+ * @return: outstanding transaction limit
+ */
+u32 dpu_hw_vbif_get_limit_conf(struct dpu_hw_vbif *vbif,
+		u32 xin_id, bool rd);
+
+/**
+ * dpu_hw_vbif_set_halt_ctrl - set halt control
+ * @vbif: vbif context driver
+ * @xin_id: client interface identifier
+ * @enable: halt control enable
+ */
+void dpu_hw_vbif_set_halt_ctrl(struct dpu_hw_vbif *vbif,
+		u32 xin_id, bool enable);
+
+/**
+ * dpu_hw_vbif_get_halt_ctrl - get halt control
+ * @vbif: vbif context driver
+ * @xin_id: client interface identifier
+ * @return: halt control enable
+ */
+bool dpu_hw_vbif_get_halt_ctrl(struct dpu_hw_vbif *vbif,
+		u32 xin_id);
+
+/**
+ * dpu_hw_vbif_set_qos_remap - set QoS priority remap
+ * @vbif: vbif context driver
+ * @xin_id: client interface identifier
+ * @level: priority level
+ * @remap_level: remapped level
+ */
+void dpu_hw_vbif_set_qos_remap(struct dpu_hw_vbif *vbif,
+		u32 xin_id, u32 level, u32 remap_level);
+
+/**
+ * dpu_hw_vbif_set_mem_type - set memory type
+ * @vbif: vbif context driver
+ * @xin_id: client interface identifier
+ * @value: memory type value
+ */
+void dpu_hw_vbif_set_mem_type(struct dpu_hw_vbif *vbif,
+		u32 xin_id, u32 value);
+
+/**
+ * dpu_hw_vbif_clear_errors - clear any vbif errors
+ *	This function clears any detected pending/source errors
+ *	on the VBIF interface, and optionally returns the detected
+ *	error mask(s).
+ * @vbif: vbif context driver
+ * @pnd_errors: pointer to pending error reporting variable
+ * @src_errors: pointer to source error reporting variable
+ */
+void dpu_hw_vbif_clear_errors(struct dpu_hw_vbif *vbif,
+	u32 *pnd_errors, u32 *src_errors);
+
+/**
+ * dpu_hw_vbif_set_write_gather_en - set write_gather enable
+ * @vbif: vbif context driver
+ * @xin_id: client interface identifier
+ */
+void dpu_hw_vbif_set_write_gather_en(struct dpu_hw_vbif *vbif, u32 xin_id);
 
 struct dpu_hw_vbif {
 	/* base */
@@ -100,9 +98,6 @@ struct dpu_hw_vbif {
 	/* vbif */
 	enum dpu_vbif idx;
 	const struct dpu_vbif_cfg *cap;
-
-	/* ops */
-	struct dpu_hw_vbif_ops ops;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index c9351c69834a..776da9e834a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -23,18 +23,18 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 	bool status;
 	int rc;
 
-	if (!vbif || !vbif->cap || !vbif->ops.get_halt_ctrl) {
+	if (!vbif || !vbif->cap) {
 		DPU_ERROR("invalid arguments vbif %d\n", vbif != NULL);
 		return -EINVAL;
 	}
 
 	timeout = ktime_add_us(ktime_get(), vbif->cap->xin_halt_timeout);
 	for (;;) {
-		status = vbif->ops.get_halt_ctrl(vbif, xin_id);
+		status = dpu_hw_vbif_get_halt_ctrl(vbif, xin_id);
 		if (status)
 			break;
 		if (ktime_compare_safe(ktime_get(), timeout) > 0) {
-			status = vbif->ops.get_halt_ctrl(vbif, xin_id);
+			status = dpu_hw_vbif_get_halt_ctrl(vbif, xin_id);
 			break;
 		}
 		usleep_range(501, 1000);
@@ -125,8 +125,8 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	/* Modify the limits if the target and the use case requires it */
 	_dpu_vbif_apply_dynamic_ot_limit(vbif, &ot_lim, params);
 
-	if (vbif && vbif->ops.get_limit_conf) {
-		val = vbif->ops.get_limit_conf(vbif,
+	if (vbif) {
+		val = dpu_hw_vbif_get_limit_conf(vbif,
 				params->xin_id, params->rd);
 		if (val == ot_lim)
 			ot_lim = 0;
@@ -168,13 +168,9 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	if (!vbif->ops.set_limit_conf ||
-	    !vbif->ops.set_halt_ctrl)
-		return;
-
 	/* set write_gather_en for all write clients */
-	if (vbif->ops.set_write_gather_en && !params->rd)
-		vbif->ops.set_write_gather_en(vbif, params->xin_id);
+	if (!params->rd)
+		dpu_hw_vbif_set_write_gather_en(vbif, params->xin_id);
 
 	ot_lim = _dpu_vbif_get_ot_limit(vbif, params) & 0xFF;
 
@@ -186,15 +182,15 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 
 	forced_on = dpu_hw_setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
-	vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
+	dpu_hw_vbif_set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
 
-	vbif->ops.set_halt_ctrl(vbif, params->xin_id, true);
+	dpu_hw_vbif_set_halt_ctrl(vbif, params->xin_id, true);
 
 	ret = _dpu_vbif_wait_for_xin_halt(vbif, params->xin_id);
 	if (ret)
 		trace_dpu_vbif_wait_xin_halt_fail(vbif->idx, params->xin_id);
 
-	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
+	dpu_hw_vbif_set_halt_ctrl(vbif, params->xin_id, false);
 
 	if (forced_on)
 		dpu_hw_setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
@@ -228,11 +224,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	if (!vbif->ops.set_qos_remap) {
-		DPU_DEBUG("qos remap not supported\n");
-		return;
-	}
-
 	qos_tbl = params->is_rt ? &vbif->cap->qos_rt_tbl :
 			&vbif->cap->qos_nrt_tbl;
 
@@ -247,7 +238,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
 				params->vbif_idx, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
-		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
+		dpu_hw_vbif_set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 	}
 
@@ -262,8 +253,8 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 
 	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
 		vbif = dpu_kms->hw_vbif[i];
-		if (vbif && vbif->ops.clear_errors) {
-			vbif->ops.clear_errors(vbif, &pnd, &src);
+		if (vbif) {
+			dpu_hw_vbif_clear_errors(vbif, &pnd, &src);
 			if (pnd || src) {
 				DRM_DEBUG_KMS("VBIF %d: pnd 0x%X, src 0x%X\n",
 					      vbif->idx - VBIF_0, pnd, src);
@@ -279,9 +270,9 @@ void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
 
 	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
 		vbif = dpu_kms->hw_vbif[i];
-		if (vbif && vbif->cap && vbif->ops.set_mem_type) {
+		if (vbif && vbif->cap) {
 			for (j = 0; j < vbif->cap->memtype_count; j++)
-				vbif->ops.set_mem_type(
+				dpu_hw_vbif_set_mem_type(
 						vbif, j, vbif->cap->memtype[j]);
 		}
 	}
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
