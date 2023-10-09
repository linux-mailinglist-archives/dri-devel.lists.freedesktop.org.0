Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254307BE8FB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8215810E2AD;
	Mon,  9 Oct 2023 18:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4102510E2A5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50306b2920dso5897162e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875046; x=1697479846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=znTJnZe1eU48JjBsnTfzCMGOflPzOp8ZDEbta/LuWII=;
 b=DEXrXZETr6iKgZ7xIu8IwaiDfivIKONlEhoq4jVUVV7yXh9eI6CBDUyJll+QPDw4xo
 l9Nzus5lHMI7Tw8K6C2ns/uKpxnBH3Adwa2IFc3kNT12MjoCXwedXLtx6ag9gvO/ohuW
 YrnbOJWP7tGP3FXSrOVI88BnmlyHolJU6OXvb05ZQ31b9nnet6GorPSJ5E4aK38MH8p4
 sin59h9/3WYEUkSwoAP4/yRLQIF0I6fpjAn9tHIrov04U8kvBL651caDqQYmiSz6QUQ3
 wKItz8PfoxZ0s7BUcFkahYj5zipgMyGerHrWsz/xzvF8xSfXM9/o6tqw32URhEdKftCP
 6hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875046; x=1697479846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=znTJnZe1eU48JjBsnTfzCMGOflPzOp8ZDEbta/LuWII=;
 b=NOBTyGclorTXKGfOTTNDRfn4hhjRPKGh3AbVK5PW4ftgtzykdPwAfVwXm6FUl3oACA
 cEbOBgbCw9GvGSDCpqL7K42byHKokFhkCR8OGS6o806xQDGQ9Zw73b9kXhuiuUT1cT2b
 IGqIFT1DNqh0IV30fBgyoWJazBc4KA2rBL3xKR3+ae+x2eByJi2CgjVgqLrg+JPjQY1K
 B924YRst7nRfJ+Dr/GppzACrlq8Ftm9fhLjsSvH2WWOMomU0BOdaL27ZMVXZKTfT9PFY
 /iP+ekZItcyHQ+kx0RxZONjEUIZyh/506YNTe50bLS0EafYHHx/FyEHqkHJysqYcZFM0
 Hspg==
X-Gm-Message-State: AOJu0YxFedHw7MfNM3xTAI2HspSSZ8QWLVxPDwaJSAMrIEtxKSS4LFsn
 ChD2EED3Ldnvs0G8eYE9ADi/Cw==
X-Google-Smtp-Source: AGHT+IHE6rUV6n/8/o3X/GGKBulZ/BEWEElLvf0NxLXzu3dOfhP4sDOjS2sIfxkEd+5dKWvsn3UBxw==
X-Received: by 2002:a05:6512:3995:b0:4f8:586a:d6ca with SMTP id
 j21-20020a056512399500b004f8586ad6camr9733327lfu.9.1696875046534; 
 Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 06/13] drm/msm: drop pm ops from the headless msm driver
Date: Mon,  9 Oct 2023 21:10:33 +0300
Message-Id: <20231009181040.2743847-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

The msm_pm_prepare()/msm_pm_complete() only make sense for the
KMS-enabled devices, they have priv->kms guards inside. Drop global
msm_pm_ops, which were used only by the headless msm device.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7617c456475a..fe885bfd9742 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1122,11 +1122,6 @@ void msm_pm_complete(struct device *dev)
 	drm_mode_config_helper_resume(ddev);
 }
 
-static const struct dev_pm_ops msm_pm_ops = {
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
-};
-
 /*
  * Componentized driver support:
  */
@@ -1305,7 +1300,6 @@ static struct platform_driver msm_platform_driver = {
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
-		.pm     = &msm_pm_ops,
 	},
 };
 
-- 
2.39.2

