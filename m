Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2A628ACD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 21:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7085A10E063;
	Mon, 14 Nov 2022 20:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81F810E063;
 Mon, 14 Nov 2022 20:50:34 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id k5so11429420pjo.5;
 Mon, 14 Nov 2022 12:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QXeA+y+MM1L5GCQKRlS8sHVhUjtEuhwBzouoQoIPKAg=;
 b=R+WSP8EB91o8AyNj0awZIrD1OG47NnQDd1LvocHtU2qwVretNZi39qGTppPQdk9dhr
 R9d23QxaizOi+AJfTwyWhiSHC8wH/tsw4awjTmmZZGtVYf5PJdFXcLIjBH23CIagb2hF
 cy1uUWdMRHQQR0ov4xBYg6JsrEjmSeay5fYuApn3psXmBPIS4XiSpCYarbe+mpNJjsP8
 1O9DsAAshBRVfk097hnyHenZZoE70NYcAwCz7FrtdL6IjBpzkVuX/dIibEOUPy+CjNdn
 8NqdI88n93O+X9/5Ca+N29Z7FGV+8hkIjt2H+Mg4o/I1jdtaDj2ezhAvGsgDhktASXUp
 +Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QXeA+y+MM1L5GCQKRlS8sHVhUjtEuhwBzouoQoIPKAg=;
 b=YNCBmqNA3h6SbLeLzo0XDcXVP4y+SvYy8U19ur1gPoRWQkIm/v8YrJUEkFNqKnokrX
 /iXZGFC1dKR7DwvjnHa85n7zDGGg2cp/Ur0cWXadbyH3xnMVoajdEZ3Dt7B1Yja66XDP
 vdYxwctCECmyEuPlyudMnlVKlBVp3yHk7E6k+aTuQbdLUlScuH+j433AVU+JV2v+z/kV
 1oEyMSxy5hKGvDVGTwh0JBu6I+01jTi9nOoIWjYwoh7dW32gA4IFYH4ZO5y0PQUAZTHg
 Mr7u/eN67FWypCllwYgI2DgHp1joCYPf+rDD3G4hm5ccZefW5rkXpOqqLdjv/n6mgnLE
 XuLA==
X-Gm-Message-State: ANoB5pm9wG+KcmZ/KZSKNj67OHcngVfLcAzslP7DwzyPsL3Jh82W/EPg
 TsGIdOvd6qPfKzc9YmwP5EwAatS5QUY=
X-Google-Smtp-Source: AA0mqf7pvZO/46MnyFzwdRFWRLAvLvWkgsxE5il3I8AEPtYOWHaydI9zLZQjD0WFq8NQFdvIiTuT5Q==
X-Received: by 2002:a17:90a:138d:b0:213:b853:5e45 with SMTP id
 i13-20020a17090a138d00b00213b8535e45mr15373339pja.97.1668459034137; 
 Mon, 14 Nov 2022 12:50:34 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902d2cc00b001767f6f04efsm7983959plc.242.2022.11.14.12.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 12:50:33 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
Date: Mon, 14 Nov 2022 12:50:53 -0800
Message-Id: <20221114205055.1547497-1-robdclark@gmail.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
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

Fixed: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7fe60c65a1eb..6ae77e88060f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
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
+			      "failed to read speed-bin. Some OPPs may not be supported by hardware");
+		return ret;
 	}
 
 	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
 
-done:
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
 	if (ret)
 		return ret;
-- 
2.38.1

