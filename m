Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD75A24A7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F6910E7E2;
	Fri, 26 Aug 2022 09:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A7310E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id l8so1264977lfc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qWb9HqeFqbEjNo0sX8LWqplCuUfM7JNEP4wMIZnoIBI=;
 b=NGf+DQWXQ5hozu+8Vb2gZUGGz9qnwo3us1L8EiFM6rrC0BncmtMMMJIPszws1Bj9bg
 8jwSi6yw41MGbMCL3hLaxH6QfANE00+UJ/4Sr5+PE6WHtNIxLXKhBY+SZHY6uPuIDHZ9
 MBWLSDGh8yYnl1mHIvWNsMFWqb4rJ2ClyVldRS2ZhxfqFHOA6oPCwaqgThHbWo3lO2sa
 bIS1nyCeIpwMugQk5u7o8tZFwtZiLf0HaS2+m3vcKRCIuHh4+cujd9acAgPZ0l5pvtwl
 tJOweNonRWYXB9wvFgKC1DXD4X2jQ7vDyikduNH6xdp5sFeu7cXH1AdGv7uyeUvRHTMt
 26Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qWb9HqeFqbEjNo0sX8LWqplCuUfM7JNEP4wMIZnoIBI=;
 b=iEkY4ZLnf2+SROtki3+3cgI9+n+IKPC+q7awrhyRzEJrt5FUh3lTncj0L36gC4yy/O
 x5X8oaFj4wtVtkMM0Da+TrbnHjmqBLs7wRwlC4PT9UvY4xG/wAEShgxFWJinsmJ1+pr0
 l01WZ1BcHbpYMd48HBlJcABZGogezaW9DuL2CWfjDqTrMusy7xZ6Z9+k6gCObEZUFyen
 DjNxNRbPZKZOzHzufSytCisXz6uXBVYMrjhy+2RUBuwbTf0RJlx2n4rlEzLszPszPNPw
 BD4Pi6aHD84wgTCDxv+LUb4hlYUNbOIYPvULildRKimMR9OtIyrNsc0SiWPEjIBi4HaX
 4gfQ==
X-Gm-Message-State: ACgBeo3O3h7oZmO1k5of3LfuxU5gQWLdMWiY/tsczq27SnVZPEHPFu2l
 n7TmqAXpktPAD000LSMyH2y42Q==
X-Google-Smtp-Source: AA6agR6KpPktXTIffRko51lBRjKetKH/0kFJEkJQx8jlsskHvwLVgjRaJr32l9jyc9jbvgrgjVhqDg==
X-Received: by 2002:a19:f010:0:b0:492:ca3b:e34 with SMTP id
 p16-20020a19f010000000b00492ca3b0e34mr2196875lfc.563.1661506770071; 
 Fri, 26 Aug 2022 02:39:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/5] drm/msm/hdmi: use devres helper for runtime PM
 management
Date: Fri, 26 Aug 2022 12:39:23 +0300
Message-Id: <20220826093927.851597-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..1d4557de6872 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -252,7 +252,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
-	pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
 
-- 
2.35.1

