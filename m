Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D1474B7FF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 22:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277810E59C;
	Fri,  7 Jul 2023 20:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156D510E04E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso2936777e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762246; x=1691354246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=K8SzyygLZhcJ1NCDc8Nb0SWwAqFFS2xoH1sytz/vUwBxBpSQtlnoQHDjWwOfp/ouv0
 2kVmdSDs3nVZJhQxv9eqU2SxBNhkndxGfI2+xMgpmalZ6YU+oNyri8jTbu0WqvXBEBmg
 QlqfFPd1sNWIroohbwJbuxndDJ6llL5CZfKMHJ4jrPjPcMutJ7rCnUnGLwFBqVpevcm+
 rHnj5HPdlclbNN6dacK0tnRutFs3AVM0s4xpFzcG+m6UbgULzjJ3xJQ9zz7IEF9Enn0G
 DKjlxzbeKbdvVaVFvQzRBsM29tCNq4HfCyIBrklLUcKZWdtYGE6TekYyNrcneNAn+0r8
 njQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762246; x=1691354246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=KvSjQ6gf98DLFihWdDHxDoikfycVxFFk/bCMCDXmt/VmNA42mgEvPgzLP2Lj27345e
 aweXKpGTc5gdBk8j8/MDuzmh2WJrf4+3rjpOIgidynO6IZU8AhURA9YWY20qv+L5LI1E
 Tz7EErFuF+lqdUlk45IZvPto+4qSxGZTE51NwjbBv6kDNwEKQ8og1J46yeMnF3zp5Aao
 MbxGnTyeDWljoup+2muMUgqNKyojxWXjZRWgkEvbHOp0I3yUTr90tfhIObjI7hNga4R9
 lUD3d6m2PmAgE0CmtCnf3+dYL636qJiG1A9nRhJiPDJwRK+IWKiD0QyjTg0zkFLc774f
 EeDg==
X-Gm-Message-State: ABy/qLbjLgDwHGOkJH1tdtGdGNpTMXtwDYbWA1tfZf4/7Q3/RZBNsLxh
 5c1rA55XP/pHNX9Vx2FREPMX7Q==
X-Google-Smtp-Source: APBJJlEEEGlGG49xFjzciptjIKA5rT715Bv8VLBJcooIHYOgOe71L3exff/WPaP46GEbKhlCVAlihg==
X-Received: by 2002:a05:6512:e86:b0:4f4:7a5:e800 with SMTP id
 bi6-20020a0565120e8600b004f407a5e800mr3257908lfb.10.1688762246383; 
 Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
Date: Fri,  7 Jul 2023 23:37:13 +0300
Message-Id: <20230707203724.3820757-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
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
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7ac02e92f42..85b8c9cc99ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1096,7 +1096,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

