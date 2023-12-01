Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478BD801530
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F5B10E978;
	Fri,  1 Dec 2023 21:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB0910E961
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:18:51 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9bf8964c3so34686301fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465530; x=1702070330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fk9k8663Tnf/ZvGnQtLLkkb39J+oGBXyzS7lQqTvGqk=;
 b=WTGohMfh5em+9h//a9FTtYT0THO9MNzN6MIzUUo/xQctvAD9CkYo67c7w3I8BcuYDD
 2FPmJnjgbBuui+eQavjaBp+s9Wm+CuY1oJPUIPJMS/8mS1v1W/TWumAW8EbmJq9UHzgZ
 96MfgtZZ0hu+IX0DFTTB2nYOUqhtw3xw1ahrLW4mmK44Xqv1pOw3zgy3mNSrKHzuKIYL
 pq8McUhdPq7+GerKaTjGBZSbHX9riaJmrs8W4f/4E3x3E3fiGHzYxIPokqTGKmoWceAB
 4CVTVyrhQNe4qCfJ1e7jqrsajIo2YGQYDhXP/34Zdgjx5P8HFhP/vGYUi7h//pNrRlIf
 4How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465530; x=1702070330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fk9k8663Tnf/ZvGnQtLLkkb39J+oGBXyzS7lQqTvGqk=;
 b=fV31Bx6pbUzHhQXQbM0Rb6Zv5dNF48SG0WuMZA2wcmht/vsydvI65gJgiN5Qrv3QGV
 +z+s8emEt74jfT7XF06ELeQ5pIhss6AMfL4cCyBzKU/qu3UQJkp9Smjhmpp1A193ES07
 vpcQO+83CUIOt0+vO5zJrmwIYns47vbaC7kDznpy8ORpwcWXolPjL81AmsA55RTwaXC3
 Y79bNCd5rbsMDuBvg+XI0DLh98wCE52pg5jkW4ie//p1iA5D05FXsJlfyIwyTPSfVavJ
 u1XbEv5DawDqcAy16TvrQQsPRbYjrumvYtpAjFKHWWDsXO6aSNURTM3fNOlKEFSFXk0q
 q7sA==
X-Gm-Message-State: AOJu0YyXO2ZCmxQjzI5n1QNEhLcbyOoT3Gmx/yMWCJZ6EhTGvcypHEpz
 oq9yCKiq9ZAAurCLuKIYHwGlXw==
X-Google-Smtp-Source: AGHT+IHzDXzzn3CUGnmqm3EEyNubJmdY+zXQDz2tcPoGIFER1numZ9HJKPnGcxSjDn2JZogkbdukKg==
X-Received: by 2002:a2e:b522:0:b0:2c9:a9ba:97ec with SMTP id
 z2-20020a2eb522000000b002c9a9ba97ecmr1044945ljm.38.1701465529933; 
 Fri, 01 Dec 2023 13:18:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
Date: Sat,  2 Dec 2023 00:18:34 +0300
Message-Id: <20231201211845.1026967-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3b6ed60e1143..8fa1f8f52e70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1150,7 +1150,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

