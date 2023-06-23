Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F673B94C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 15:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8610E645;
	Fri, 23 Jun 2023 13:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B574B10E643
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:54 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b45d7ec066so9325241fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528732; x=1690120732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIPapwS0VMu+wGq+Urug2AT2MCJbQHQnh/g0ltMMjs4=;
 b=Hak4tsYIfEepTwZkWlNigHuwL7fEFVH0RgwEi27fX3YConuf914hnwjqCm3DhGE7je
 mtzbDAlolGPQvAWTD+r06ecDBW7eHuDb18+1bCF3gy/1X/pFjlknvjQfjY6wd5w9n5qI
 j492aylTrQWBe0Yas37fxs3/lbmLLF6no160jBGhGyxEQtrlqoyW0NMOqpjChgM8ctad
 RslcK7KvpEbOfmwNcQU//dlxbux/6WxragZwUmz0i+s4Wybink/PoHsqB1nnJr9h+5mf
 DvqMcTubeyBXlfVfCcsKUysUH0UlBCpW5yzyA+MssBDQkdS5KnJy3oqfuWIkeXCV3LBI
 7ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528732; x=1690120732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIPapwS0VMu+wGq+Urug2AT2MCJbQHQnh/g0ltMMjs4=;
 b=O6D9fhjkoJgdqJ0PMJmPakl4qJ514xH0JzThQ+7zP1Ig2gzTc4lHsPauzNlpynZfOZ
 oWPkVF/sTUsF1MTkS1y8qvMwMSXM2wnmijuBu6KdWX1toJ8Hwx9eG5e4kcCFWf/UeBe4
 xdCbqvEwm9ru1eZ+onG00Ylk6kN86ws6t2+VIVG9cEKm5Kxc/O+tcPyVvMFZsE4soDfA
 XDb/tsxvR4hFoWCINyDzc8+WCfRxFip+Ag6t1EJSjBltHsKTgpRMQpHoPv85kriV+tl8
 lJN2KuRYdYDSeiI+2c80S9P5ZKn39Lopw4Y1YkVs3UChq3nbR8TKF2z1LwaW87TaqBXS
 tRVw==
X-Gm-Message-State: AC+VfDw36fJlkA5gWsOQj/tdIfvWTAqMGBrqHyfajKwml2XQCxTm6bCo
 b0y139+xGqaECKSYWEKoc/df8g==
X-Google-Smtp-Source: ACHHUZ6HhxYzygSwvCnSTPeCfM2VScj9CICogwmsSA5qNEVnWyJGZ/ZEKnW4nAV0d6KT9mUUUZnzlg==
X-Received: by 2002:a2e:b532:0:b0:2b4:5c28:908a with SMTP id
 z18-20020a2eb532000000b002b45c28908amr7611933ljm.7.1687528732761; 
 Fri, 23 Jun 2023 06:58:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 7/7] drm/msm/dpu: merge dpu_csc_blk and dpu_dsc_blk into
 dpu_simple_blk
Date: Fri, 23 Jun 2023 16:58:44 +0300
Message-Id: <20230623135844.1113908-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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

Merge struct dpu_csc_blk and struct dpu_dsc_blk into new struct
dpu_simple_blk, which contains just base and length.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7cb9ef940225..4b3fb104c412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -283,11 +283,6 @@ struct dpu_scaler_blk {
 	u32 version;
 };
 
-struct dpu_csc_blk {
-	u32 base;
-	u32 len;
-};
-
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
  * @base: offset of this sub-block relative to the block offset
@@ -301,11 +296,11 @@ struct dpu_pp_blk {
 };
 
 /**
- * struct dpu_dsc_blk - DSC Encoder sub-blk information
+ * struct dpu_simple_blk - DSC Encoder sub-blk information
  * @base: offset of this sub-block relative to the block offset
  * @len: register block length of this sub-block
  */
-struct dpu_dsc_blk {
+struct dpu_simple_blk {
 	u32 base;
 	u32 len;
 };
@@ -403,7 +398,7 @@ struct dpu_sspp_sub_blks {
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-	struct dpu_pp_blk csc_blk;
+	struct dpu_simple_blk csc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
@@ -444,8 +439,8 @@ struct dpu_pingpong_sub_blks {
  * @ctl: DSC controller sub-block
  */
 struct dpu_dsc_sub_blks {
-	struct dpu_dsc_blk enc;
-	struct dpu_dsc_blk ctl;
+	struct dpu_simple_blk enc;
+	struct dpu_simple_blk ctl;
 };
 
 /**
-- 
2.39.2

