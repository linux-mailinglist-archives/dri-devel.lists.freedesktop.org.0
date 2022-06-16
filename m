Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D354DC5C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CEE10FBA8;
	Thu, 16 Jun 2022 07:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBCF10FBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:59:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id h23so1015181lfe.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pK63Gcracvx3JbDdqH695RF+R5AO+vccoaxrk2U/rT0=;
 b=ulfzvg9gGWWYXDoIVd4DDhUq5mL/v79PzsN5xF5oXtvlndr9LBXuSMvSDXxYqusdcs
 0gVi8Idoz7oTS845qmfQ5AepB7lXVRMrNeM0lUk4bGPvdA4rByBJGWGpK0rS1i9gmXdV
 JDMLDVG2BHO1Nbo59WpJh4O7loVbpnLGSbvNOYIll+IZ5Agl42wyl6GBcA/X/D7QLZYo
 T/ZiQALG+qtImAS6Hk5FnnaJ/OMGtDmdjZP0wkBeE4T5ND9junO6+jLSCji0bW7cDIJm
 8CP+M+xfM6tgjZD+rIBtek25WdnHXZTjZKg1bB3XKKW6aRvlJVEPmvWR8JQu04mLtOd0
 qpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pK63Gcracvx3JbDdqH695RF+R5AO+vccoaxrk2U/rT0=;
 b=AH6Op9kyg5k/csxlHAJZxLOk6cs/4aFfXQ3QBznq8f48Anwx9ssxebitCs0BXis/rt
 PA/c0O4HonaaTE1q5C+9P6pPPKlztsTvbOeAbdeRv9soaziuSpwTqzVzvraNLdiwfj/J
 cuF67ixMpe52NozKkwOYTWe745+F8kG4TxoCgwUy0SU3px9Brcgb3TyOh8SnHgNj2jWM
 D2tNzG6JRQ1D40RCGrS7N7mgtsaAC3A3c0D1xTe3OY8FEcNTP6Ty/8phRHG8S72Xv3YD
 DAzFNwWkd5MLmuzKSt79IcXjQ09HGv80UN2QAyDY3dyPam2mbdiTa5mu7SmfEPoV9RGT
 PTJQ==
X-Gm-Message-State: AJIora8BsfJEPMhB4cjtuJz73JavjBSLENh4pWF0YQYYIB4b2OKBwiWa
 Uh3I+iD37yE8bWzzmoUV/rSHug==
X-Google-Smtp-Source: AGRyM1u0mQRtd4eiR+Efh9ifaiEjyhP2i5EJCeLCZln2lk0Zx/7+DUx1YDseK3T5FxHmGIsKOpDppQ==
X-Received: by 2002:ac2:5e76:0:b0:478:f72e:7531 with SMTP id
 a22-20020ac25e76000000b00478f72e7531mr1943784lfr.187.1655366389822; 
 Thu, 16 Jun 2022 00:59:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 00:59:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/3] drm/msm/hdmi: use devres helper for runtime PM management
Date: Thu, 16 Jun 2022 10:59:45 +0300
Message-Id: <20220616075947.347888-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
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

Use devm_pm_runtime_enable() to enable runtime PM. This way its effect
will be reverted on device unbind/destruction.

Fixes: 6ed9ed484d04 ("drm/msm/hdmi: Set up runtime PM for HDMI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6acc17e0efc1..9ff9a68b201b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -247,7 +247,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
-	pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
 
-- 
2.35.1

