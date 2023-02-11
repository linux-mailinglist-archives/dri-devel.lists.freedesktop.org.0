Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB98692CD9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8A010E31A;
	Sat, 11 Feb 2023 02:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA4210E2D5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:10:58 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jg8so20202742ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC603h/Wh7FJFBpj8NoIQjPcoycjSSQW4waFHn2mSZw=;
 b=xGE4wTN7QZo2BAMaFFDeC7Sx0/EcRgzAAlaQDcWchZgUlNkE1S/7SpYXxZnWYiOEWI
 u8ctIMI07BdBjc8FqAlbEZ9nseYN9SwysiSzCpr33Yh5/hN1F5/6IxL6wVQO6noNgdz8
 GEjt1REcGIHXl3CifCAsTtjE4wQZPnSQqB4236LuePK9hCC5Mqja/eZ4F9Vfix7gZqC/
 jRZfLk1iv0kaWCWr2GsDXn4kv9uNdP+uLz/YJVaAhoH4rUw6+4E0PhrTs6xI5tstZoxP
 /XQxnpK1wOto8qiTxiM4TQpvuoFI6l7YvCYcpSqSD7nrSgDNGlWuAdsaqLiz+BMTLtiP
 kAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC603h/Wh7FJFBpj8NoIQjPcoycjSSQW4waFHn2mSZw=;
 b=FFzsguUo5J74Y2tFnYcRBNy63wE8LtsirL0SGrI5YDlC0Lak7HLVvi6/HIvJBJrgIf
 pQVVvxrFkXdUCIINozxslbNimIK2zEtdBtCw6AQoIk6EFJViayFu4dphdvDMfG5JOV7Q
 QbEGJ+/ETDHDF+tgR/nxWkCRLnmUCHvzKWsOSg5iPwihQKMhQhfgxP3YphYGxe4qkCp1
 THRMrRl0CZNJMp/JKw149eXp80puD9PJEKUyRIowH8mev4zjyl39Pa4flgdXiwRSnVBG
 gxej8rG1DeU8lCauN+602GDb2PWgZplvdVZWK+T+JmJdRx+jFnIM4LJFnepM58STq9KS
 TpWw==
X-Gm-Message-State: AO0yUKXYqXir1dbGHuGmicWymsaSaPn0qPiqb1ySBI0wpNKjFVdTHaY5
 JlJrLl/yt5vZKRXziXOmiG+thA==
X-Google-Smtp-Source: AK7set9ycZleEANd9Q8t5QnbZ4uCGmOVJBHkru1OUHvacU0RGlFEHpyut2gbjWPsCjGfCqUpagmwpw==
X-Received: by 2002:a17:907:d2a:b0:8af:ef9a:1911 with SMTP id
 gn42-20020a1709070d2a00b008afef9a1911mr1875000ejc.5.1676081456416; 
 Fri, 10 Feb 2023 18:10:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:10:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 01/43] drm/msm/dpu: constify DSC data structures
Date: Sat, 11 Feb 2023 04:10:11 +0200
Message-Id: <20230211021053.1078648-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC hw catalog data is not supposed to be changed, so mark it as const
data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 814baec38a22..5c393a822ff1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1831,14 +1831,14 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
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
index e6590302b3bf..a56581b34ddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -867,7 +867,7 @@ struct dpu_mdss_cfg {
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
2.39.1

