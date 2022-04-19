Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0283A5072E3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E053110F0DE;
	Tue, 19 Apr 2022 16:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C24A10F0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:20:35 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id c15so21174263ljr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXeyTFTsfoYPFo06SZsNQ99dRK1p3DG4c0ZdovqUbmc=;
 b=LlSwrxiPNMbBWlTQRPNdY0n/WTrx7v4OLM1b9B0AdYIzdT66DCpNAY1SH+iygwDyjE
 MbKrYNyJ0pAPF560Z2eTWPDgql9FneKUBBs4Pnpeaa7m5bCQMPv6JdeRpUqD8kZpCYBo
 2uNIf9xO84BCBRbyiiExxvhkqY3+iGuQSgfUjynB0v7zPry9Pt5Y60clo8lN7r/QQ0Z6
 YHbjSeCOvnzlhWW0WP97FQyM2h2jx7DciH4doNI5WYXMTnt9l4DyHi0NyjU2op7IS8N3
 dDM9+ci1gYwox8Uy86qtdMPxAYCafgRj5Fu+tpnxcBjIWgakE32uLK6FTb/tEWl+/9zK
 2hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXeyTFTsfoYPFo06SZsNQ99dRK1p3DG4c0ZdovqUbmc=;
 b=E0p8hhhQbu1roYFFjh+jYnzbX7jSb8xkaplxvqGZ1LTOVGpVvMFNHmqKa/foX6VwZO
 xeiLTdM2MAzMoyHqdW9s+g0kcii28ZGd/BGYIxzZLgFsaEKjPKjYGFy4NdE6Jqm5Hc1T
 IgzILgKPMwt9BHKS70TZY8D/p6oVG4818f5MnSvyzJ/NxWyL+/GcWYdKWVlUd2ORBBiA
 fnQpnTsJtLUwXbvH+wxIs0QTm/GoeNJ/v3re83ONRz72KCK0U6zGDgw2bp1fwYs60Xg9
 jF5Mt6d0oP3XkzrM+OwgUv1r0LGL5U+ZCuA41yYtOPgli85MlZKVL38c4LFok89MSg7d
 bDAA==
X-Gm-Message-State: AOAM5333ZF8qt0vEJItj974mfBtii1iWd6oAsdcMyEb2pgyv6tybTHoo
 4+7+pndc2XHdgIJsxotu9U+NCBdi3U/T/A==
X-Google-Smtp-Source: ABdhPJxwdScriRJx3uR0TFUsQrgBLKqdu/LnEG3C8Zkr02oQlpUTup8+q24MTTMVTCgO4xXB5kDVFw==
X-Received: by 2002:a2e:7002:0:b0:249:b34a:69d3 with SMTP id
 l2-20020a2e7002000000b00249b34a69d3mr10678980ljc.474.1650385233468; 
 Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/3] drm/msm/dpu: fix error handling around dpu_hw_vbif_init
Date: Tue, 19 Apr 2022 19:20:29 +0300
Message-Id: <20220419162030.1287562-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
References: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aadf032a190b..d38c55f9f003 100644
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
2.35.1

