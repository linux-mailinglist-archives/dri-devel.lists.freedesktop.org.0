Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E970A37C
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 01:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF1610E4A5;
	Fri, 19 May 2023 23:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C397B10E4A5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 23:40:29 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af2db78b38so175271fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684539627; x=1687131627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nrEeUaHJg5tvfQUV7ZJ9RQA7N6g3X5zbRUUxxD+s4dk=;
 b=MjtkRZ9J3FObJ6JfJN2xUsZIb3PkGWM5H1aslAWC1fVy9uMWu1euDQZ9uhtn454oAQ
 JnpAv5U2fL1+sXKU7vy61NICQmZTUNzZBfVqJW5Gw4ZZSW48uu1JxS/hB2JF/vN1o9RJ
 jMtBQWY3ct9CxNBcBhZPCBPSuwP3GLZRTJTTP/b5owfWhvhmELTPG1Xj1BnAiNwH3AVG
 pMdfpU0N8ngAz5ysvNe6AWAA0JbRM5jvIo+FcnmhiOV8kNF82xxGpW4vl+14IYVG+Ue/
 +H36Q+OBNoAuF9psEg52d7bLMwYsZr4AX8emSQGcl1cgAFEdaiDypHOjD90XfGKcqqQF
 Htew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684539627; x=1687131627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrEeUaHJg5tvfQUV7ZJ9RQA7N6g3X5zbRUUxxD+s4dk=;
 b=B80kf++ZUs3EfvZkK2rGq4YAjI2icYS06OaVuEI5GHdvtVoW+PaU2uOSxzTLnZt0rH
 bughQYpIHo2JvvSw3ls4BIZXcYliGdE3lFYIpjNN2sVkqlHNx5udpvTLNkFfjjOMF1fY
 ZHuHmbnnLvez1F5S79rowdr8YzKFCzRMck9zjtbgUCmNROB4ezvKHJqCbKb13qyTpdzx
 SCwFDw27sGON0a5MOjcXMLbbuASgsAwRXc/0sUpjbqf0C575Fwpca03gsU/XWeYOoSNV
 Nk9svJDHDcFlex10A3ku/vwXv5tr6SRiv/Y4oXG0lI0FLRBkMk5HUiyLwLgIG9FfIqDs
 Vagg==
X-Gm-Message-State: AC+VfDzTLx2GsslqoxIyy1tHGEOXjRNz/WR3gaavDgNwi5kuyGwZtG5R
 FS+5nAj0pGPPVYXqJLI0BHvNVw==
X-Google-Smtp-Source: ACHHUZ6NWHUNRWcW5fT7TncahCjkztt2MYDM6c1eeSusriHH2dOVOCIK5d95Qz2Jt2aJ8jHVa00okg==
X-Received: by 2002:a2e:91d4:0:b0:2ac:7137:5f13 with SMTP id
 u20-20020a2e91d4000000b002ac71375f13mr1298139ljg.9.1684539627729; 
 Fri, 19 May 2023 16:40:27 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 16:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/4] drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during
 DSC init
Date: Sat, 20 May 2023 02:40:22 +0300
Message-Id: <20230519234025.2864377-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
References: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_dsc_init() can not return NULL.
Replace the IS_ERR_OR_NULL() call with IS_ERR().

This follows the commit 740828c73a36 ("drm/msm/dpu: fix error handling
in dpu_rm_init"), which removed IS_ERR_OR_NULL() from RM init code, but
then the commit f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in
RM") added it for DSC init.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f0fc70422e56..dffd3dd0a877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -247,7 +247,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
 		hw = dpu_hw_dsc_init(dsc, mmio);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dsc object creation: err %d\n", rc);
 			goto fail;
-- 
2.39.2

