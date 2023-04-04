Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CADA6D61E0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB6E10E2E1;
	Tue,  4 Apr 2023 13:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0BD10E2D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:08:38 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a44so15108706ljr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jOx9lf6aed6FSoTQsBDzqel9MF48cuFoO1q09iRRNAw=;
 b=ulRSoVWgLTZRYaygsqQze2UmUZt2Hkp0vkR1J7XHAlUHXfbSoB92be6i8aX8Aw3vYY
 ZvkMYsuuMe7k5p/7sXeiTZ0iBsZKVNvaluOfiNBmV4NTApDE7sBwOKA3LQVhnwRSS+Nw
 VBbNRigvMl3ZR4qtkwOUR3zmvzNo1Djs1g20vR6E39qi0b2gqHwQduBrIeo4ELnNAuoR
 hBZaap0yAyars1q34gLPNMauVDnnL1EajxTiz9PvuzWEZYSLCufpfrQDaWkkKER1c3qA
 S07KSjtJCk+7BQmP9liNtUF2t9GQScaZzegldqi7wK46S5v2iJMSjlM5GtrmIB9rDa1c
 C0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jOx9lf6aed6FSoTQsBDzqel9MF48cuFoO1q09iRRNAw=;
 b=zDzpA9J+faFMp2cAX+JIWah+ks0KxQEBTHAeEaeyuwQ5nOI2sT60wngVkvMg4stgZF
 sgzQ0Ezvf9IbO2SmkV8iTAUlouZdkxnqbWvmPnWMhHNryW+7kAlPlN8oy2piMpjfKqQU
 gGxDjM0/X6xeJcipPACqvP90W7kfmkstHCcunmP5qy5CQHTfhJJuQJt7qS00w9aGIagX
 PpGHYzAsDeTwZdylGsPu7K89LFNzXhJzny7SRgD59WXeYvwrENIp1om55z/4NbG88BBW
 gd3EW/37nU3BZe4WALQQ4iMmAQK/mAYOZF805lDRLwWExuCIvX0GoaHlpAnigo+meGnG
 XYpw==
X-Gm-Message-State: AAQBX9fedXVeglwG/9ObqF3D8gqhJNvJlc7t34QjkbfFlFGDN/dVxnRe
 kGc9GdoZ3TmOOH04UBJ04NP75w==
X-Google-Smtp-Source: AKy350ZCAn/ghhAlLwGs9xsruf5nmbl+irnifljSdYgZNThzxSOwuJ8ASFypwLjL66/LuO8r/2H/4g==
X-Received: by 2002:a2e:9dc3:0:b0:29e:98e2:31bf with SMTP id
 x3-20020a2e9dc3000000b0029e98e231bfmr798891ljj.6.1680613717851; 
 Tue, 04 Apr 2023 06:08:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:08:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 04/42] drm/msm/dpu: constify DSC data structures
Date: Tue,  4 Apr 2023 16:05:44 +0300
Message-Id: <20230404130622.509628-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC hw catalog data is not supposed to be changed, so mark it as const
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f4ffd7fc4424..2dbd4783a57b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1836,14 +1836,14 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 	.features = _features, \
 	}
 
-static struct dpu_dsc_cfg sdm845_dsc[] = {
+static const struct dpu_dsc_cfg sdm845_dsc[] = {
 	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
 	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
 	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
 	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
 };
 
-static struct dpu_dsc_cfg sm8150_dsc[] = {
+static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
 	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
 	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 2f532543848c..fe360fb7c77b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -872,7 +872,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_merge_3d_cfg *merge_3d;
 
 	u32 dsc_count;
-	struct dpu_dsc_cfg *dsc;
+	const struct dpu_dsc_cfg *dsc;
 
 	u32 intf_count;
 	const struct dpu_intf_cfg *intf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 619926da1441..4e1396575e6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -175,7 +175,7 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
+static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
 				       const struct dpu_mdss_cfg *m,
 				       void __iomem *addr,
 				       struct dpu_hw_blk_reg_map *b)
@@ -207,7 +207,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
 				   const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_dsc *c;
-	struct dpu_dsc_cfg *cfg;
+	const struct dpu_dsc_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
-- 
2.39.2

