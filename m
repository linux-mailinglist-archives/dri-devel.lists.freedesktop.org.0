Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E9629DF1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 16:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E733310E418;
	Tue, 15 Nov 2022 15:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FC110E416;
 Tue, 15 Nov 2022 15:46:14 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id q71so13607032pgq.8;
 Tue, 15 Nov 2022 07:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L+yMIbf0sILuUn/zPTVTjnjYR0wuNHaFeLrP/pUKrjw=;
 b=lpyEvhCVexFe+URWzn5JK3i7TBsdFL7Pu2qdFiw9Vy2J0MEJjW9cdwsEJqIpoO1/0c
 YJ+TEjdYw8OVWmcwaJAFz9pkHTc089X3XVaW8KD4xjjaSn52H9qnDg/j5fyNqxl3hyP3
 B1WbLIawt4TZLtFWIHmv8MOo4nVJhrAwOfX74Wu+tq3b7AdXyqoHwX8o9geFf6BOzo/q
 vzJlTCgJR4f2zRrW+tSacN+mxRtFfIGI3zhmbHtyF6E+uKbiPrVFjD2V6Oxb/yY0sJa3
 1ejFdwMHgfKu0DoF6QpeMw9LpA2DiiPHP097DDToFpgDYWxhl3dTkCahuKfkOjNv7jPC
 91VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L+yMIbf0sILuUn/zPTVTjnjYR0wuNHaFeLrP/pUKrjw=;
 b=dYUMLzEhNbDijNGuywgZeEJTmvRamqZFVUsCXx1tMPuMXRNyKdvVjmTdqk53rJYnYn
 oVgQL9Ldm1JXHVWbIJnskxDy2g/fOQE6sZLJxZLIvC1TiVcsgSWF5BN1CnUz+tmMaKy7
 NOi0C5+NhLXH1Xk8qbwAsJtk6NiiqH1CnDbHbDfiA7Qwm4ExSb6h893tTvoL18SyXn/e
 ksqpXO95B5uI0yBFYNUw6NEjXm7paARn6nL/x+w7vskJNrdAbNHixwU1zt7cAZD0f8y3
 mKwDZ+jU7usAHP/KpZCuB+AIIDueuyodqRPWd9lERAHNnSUsOTVqwcHNjgASweJWFW3n
 ypZw==
X-Gm-Message-State: ANoB5plYpUN5gV7/kVXHqjCGV5Y6ijeEQEbOciCZuHZyZ6lq8Go0ruE1
 xlr/UH/en90ZyvbpF7JIbPYW24nnpmE=
X-Google-Smtp-Source: AA0mqf6sAEQYc95aTWVRmax3Bm9my4SWPwUC3yTXSS6fOB58SfOgyWmGsn0n3MwtRPEJ6Sw2M4pUsw==
X-Received: by 2002:a65:4c89:0:b0:476:c9bd:c0d9 with SMTP id
 m9-20020a654c89000000b00476c9bdc0d9mr1752225pgt.415.1668527173629; 
 Tue, 15 Nov 2022 07:46:13 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a17090311cd00b00174f7d10a03sm5799992plh.86.2022.11.15.07.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 07:46:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
Date: Tue, 15 Nov 2022 07:46:34 -0800
Message-Id: <20221115154637.1613968-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If we get an error (other than -ENOENT) we need to propagate that up the
stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up
end up claiming that we support all the OPPs which is not likely to be
true (and on some generations impossible to be true, ie. if there are
conflicting OPPs).

v2: Update commit msg, gc unused label, etc
v3: Add previously missing \n's

Fixed: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7fe60c65a1eb..ebe9599a8316 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1931,7 +1931,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
-			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
+			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
 			fuse);
 		return UINT_MAX;
 	}
@@ -1941,7 +1941,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 
 static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 {
-	u32 supp_hw = UINT_MAX;
+	u32 supp_hw;
 	u32 speedbin;
 	int ret;
 
@@ -1953,15 +1953,13 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 	if (ret == -ENOENT) {
 		return 0;
 	} else if (ret) {
-		DRM_DEV_ERROR(dev,
-			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
-			      ret);
-		goto done;
+		dev_err_probe(dev, ret,
+			      "failed to read speed-bin. Some OPPs may not be supported by hardware\n");
+		return ret;
 	}
 
 	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
 
-done:
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
 	if (ret)
 		return ret;
-- 
2.38.1

