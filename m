Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781774BAC5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2F310E175;
	Sat,  8 Jul 2023 01:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5143910E064
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:15 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6f0508f54so38702521fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778253; x=1691370253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dDa09IPPKyYg+3VZJKhZ3MpuhgcB8Qzz0Yy6G9C0Hg=;
 b=sCHFkAXRMGNLN34irJotyEcd+hn9zqPWNSmMxcrmEowScO05PBx1OEgjsErNy7P1PG
 QXZdrUHEYIPrR+ymYAiUKG58rbU8zL1fG4r51xsbnVKXXBObMbA1X1mCUKC1bVHTQFRS
 8WIXJ3jMAwr09u8l6CzvDOdFFtbhf//Rub3ZZFqo3T1Qig5jq8ir73cySv3WgSduhQ6p
 I/25LuuGClWJQrPqfM2rLJPbXDCzGsk+Tgp2/PULNlqG1po4hP2+imGEcEfAidMJoRlQ
 IcXEeo2rIeVJgfXRzhPgADpTSQ7W/SkLfcN0e2gan23B9L/QREZIqiOTvbrasPG0ICh7
 faOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778253; x=1691370253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dDa09IPPKyYg+3VZJKhZ3MpuhgcB8Qzz0Yy6G9C0Hg=;
 b=OmJBHDZLcQLH/CFynNWgOvVMiNuulrcwEufz3wKhArUOMgov/ONE6yfP8TSoTd5Qp0
 CfbNuY5C4P/WY0m152QdisONpvXVjwYJpGtGy4L+/0OnvcCardo7Hr+fMkkc/TFZgqKW
 /x9y8YnfH7ifdPdPmxK9dlxuyfci0/e3w/ZYT1de0K4He5NEhYuSq4LEMyyJZtFxHlhz
 SU4isty3IOOY+d5dJz4T1v2KbxSdT7e7jawc69+5NzXFjjiPEGdOWmZjqFp5E5q5YyLV
 W3r85EHYk/8VnMVomzemxTQtiMkeS35oemPxatETyr9kHKWm+LjwPUFjOJSoZ7knz3M9
 b44Q==
X-Gm-Message-State: ABy/qLbW7IS4QMUar6Ua0ounytysFLHNKCZcoKEUNrriDHRdhL6hNj9H
 o7LjvHlRt2Z+KiOH6GWi2BrtrQ==
X-Google-Smtp-Source: APBJJlFZI7DJACf80E6XDfRqLGI8AxOmzj91GP7D4NEzNyhKdUniENni2CFKzVBC/CXpA+9+td2koQ==
X-Received: by 2002:a2e:9c8f:0:b0:2b4:6f0c:4760 with SMTP id
 x15-20020a2e9c8f000000b002b46f0c4760mr4282505lji.11.1688778253718; 
 Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 07/17] drm/msm/mdp5: use devres-managed allocation for INTF
 data
Date: Sat,  8 Jul 2023 04:03:57 +0300
Message-Id: <20230708010407.3871346-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Use devm_kzalloc to create INTF data structure. This allows us
to remove corresponding kfree() call.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0a85777625d3..fb2b3bf081ee 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -616,11 +616,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	int i;
-
-	for (i = 0; i < mdp5_kms->num_intfs; i++)
-		kfree(mdp5_kms->intfs[i]);
-
 	if (mdp5_kms->rpm_enabled)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
@@ -741,7 +736,7 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 		if (intf_types[i] == INTF_DISABLED)
 			continue;
 
-		intf = kzalloc(sizeof(*intf), GFP_KERNEL);
+		intf = devm_kzalloc(dev->dev, sizeof(*intf), GFP_KERNEL);
 		if (!intf) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct INTF%d\n", i);
 			return -ENOMEM;
-- 
2.39.2

