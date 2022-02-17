Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E639F4B96D6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F2410E738;
	Thu, 17 Feb 2022 03:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5810E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:45:05 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id o6so6359528ljp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/YRcQBG+8CmKlfSNRGmKhbYNFYa0GOg31OmQ3eN8P4=;
 b=JlqKAQ6AUL8g9W9NO3LJ6vb9NdsRoKYoAyf63GcrRH3GnZy7hPS068H52YdeHrYmAF
 XaqrMBVvCQf9LbU+0j4n+SaekNIjKsNx8bnk+TE+3MHPTGX0RH0Nt3zspYARomIBe0Nw
 BGBQZWKMKZjfR4xuvrbUe+oz9UT3DkI2rzP//GhSSSRwT7KM8Ou8uwBy6z88/v4cZZUa
 rBMtfeSJ95LVdF+z3JIVTptiaj1ms5gKUbkLHE/84CnxOSbJlboEkjLamKSKGLX81WFo
 ms1Ytw7jPbIEygTsEyQSiHQymiR0OpnyJtCoIhGuVRF+Bo+vmtgUhVA147ns8LP6arHw
 6amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U/YRcQBG+8CmKlfSNRGmKhbYNFYa0GOg31OmQ3eN8P4=;
 b=b+KqwRJaOu/6Xg9tItAt92aOpnVrOS8oZOzHrB4+q4oLb3EiiBrW1gzoiAzFW4AA5E
 HhkTA2JyEWbJXW2gDla5L103UXIrRyUvKqx44jjhrO7u3agVNGY91wKP74siP6B8fB9H
 ylfcMxo1kvlVkvLPZJNpdh7RaOFcjanFZgiCxFqQChrWGxofLUlvDs9oO4O6u2MKyEY6
 NW/pZCnqoIzKgtsuu2w2/CJeyYs3eQUhRcFp17W6BgnWzKKNT5YdiZQP54ol5JQ/xcNN
 uutFP6YGNAda33144U8MuDhzUjmulZm91stFI8x2gThx8O+TBKGbaxS9qedb6vhb/Eqp
 diAA==
X-Gm-Message-State: AOAM531LdmyW+dIBQzbNv60iHn6oHnd7djD0VRUqkcodtt32yGMzcAGl
 jUxxtwJDZZUTwTaz8KvbaGgm1A==
X-Google-Smtp-Source: ABdhPJxtd7V+S/bnD3Oc615ZGRXme/XvFNSXsqKMmYXNLWx/nQ0uqusSKV6JWhSTpFwOb2DxKZhZgg==
X-Received: by 2002:a2e:87d3:0:b0:244:c1ab:91ae with SMTP id
 v19-20020a2e87d3000000b00244c1ab91aemr820892ljj.277.1645069504092; 
 Wed, 16 Feb 2022 19:45:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c25sm822268lfc.22.2022.02.16.19.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:45:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/dpu: fix error handling around dpu_hw_vbif_init
Date: Thu, 17 Feb 2022 06:45:01 +0300
Message-Id: <20220217034502.464312-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_vbif_init() function can not return NULL.
So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 81a35c8d62e7..f8f1bf3b511d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1102,10 +1102,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
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
2.34.1

