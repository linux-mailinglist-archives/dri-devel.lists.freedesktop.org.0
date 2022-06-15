Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BF254C949
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A5110E6A1;
	Wed, 15 Jun 2022 12:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779CA10E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:57:06 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id v8so2117664ljj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3lVlj1KKNHBEo54nqDtt6bYRWwOKPlUpIBRqxeMjlg=;
 b=JgGvBPV9MF2UOBPmhw7nC7nM+kL2Zf582u1CGh9aYJpx0gFohrzbrHh1OwD9JT48Zs
 CPV04XhiIYfUplyDtw911XnlkoNINjsgB1g2Q2CfcjhNt+cczDr9sKp6vJP2oZMTLtHc
 ODneIIB7tWAPqjzD8+ZPCefYS7G7jGAYust0DtmKEb7pnX4ecJpvCP4iatAtvA7GF7ZS
 ssh/3aKeURbysmeaOJRX/5An03NPmAbfjEcXbhPKSOogzcICQClnRySJRkTCCFErq8Xd
 vR+dlfssXm3PdaIQuBaNaOTnrOb6fTtm8zMGjPoQAAjekQ6Zv/AAYWBE9UPx+DrkVvDt
 /KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3lVlj1KKNHBEo54nqDtt6bYRWwOKPlUpIBRqxeMjlg=;
 b=04j93X6tTiErFHmxN6S8yEZ7RW/NVunetdg+kr56tUGbacUs3Ba+2QGmJ8pb51ncAl
 Qb5Tva9IfjehDXj35f43OolzKI+mYv2cuZlg9g8eBqOKDmU/GUsiinDoKuAVzDY9TwHw
 9mPncnUc/XbUECvV2qM0V46a7HbETBdiILkaRKMSdd5Bmlo/c1s2W0AswFexHQOXWBIt
 0lqg6Wde38cx9wX0eiZxVGHYFRYd7RMd2kqpNSH83cb2/q54Z91+vnkRH5GIZ9aRQrwd
 SuXHDXK6KjjXdZk42YgSLcLsKupmawCJerKDbflHBnoaMAwX/j7lMZBQ4ZiDiQhB9CBY
 o2VQ==
X-Gm-Message-State: AJIora/c8jsIWYNFbmyRk7JE+QYP6fjL4+vJGaAXNBXMFKzX+847g1wS
 gSB6L2vuSlbDSLcAc0VlyNKU8Q==
X-Google-Smtp-Source: AGRyM1swLq5IAWEw0pYZnwfi64+I3HJ1EkOBvA8ctl5T7zkei9G/V1FNwfKeiJX28Emsg2SFVbFKAA==
X-Received: by 2002:a2e:2a44:0:b0:256:abe5:275e with SMTP id
 q65-20020a2e2a44000000b00256abe5275emr5008546ljq.190.1655297824791; 
 Wed, 15 Jun 2022 05:57:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05651220cd00b0047255d21100sm1798013lfr.47.2022.06.15.05.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 05:57:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 2/3] drm/msm/dpu: fix error handling around dpu_hw_vbif_init
Date: Wed, 15 Jun 2022 15:57:02 +0300
Message-Id: <20220615125703.24647-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
References: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_vbif_init() function can not return NULL.
So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1255d00c92cf..922725c92898 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1135,10 +1135,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
+		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			if (!dpu_kms->hw_vbif[vbif_idx])
-				rc = -EINVAL;
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
 			dpu_kms->hw_vbif[vbif_idx] = NULL;
 			goto power_error;
-- 
2.35.1

