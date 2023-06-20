Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B5736AF8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D016C10E2CE;
	Tue, 20 Jun 2023 11:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747E010E2C6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:30:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f86a7a5499so3618604e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687260604; x=1689852604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IWQwth2ZmkJYuqsTZ6NO6uB8o+eUJ5P2P1gJl8kPmvY=;
 b=XlMVVpRa4u3fhb4RQs+wh+2Y7tMaaHJBAsv4tTGoU2N7ig1FAkCYXYn4A+k5Iyu4Sq
 9KGZXgAbs/GnZco6r8C3P0toXcJPX/0LqJ827XvzeiKRh31Rc/nZP90yknzlBmZjO/bV
 TtmyDaMZESSJRgXHfEKqBpWz2JdZS9dnM2XQnJ8pJI8EW9bPwcv5X6kkO8N4Uvl2nlwO
 /gNnZPjnZIkz4FNRZ+C9JdVFx6pOqswU2URrNR+W7hPok2ek8Sug89dX62uaUhY4ANT6
 KA6jy5tKXwdbLrhWXsQqfOlDNVhJAX3eDEevkjgp9OeDAs8SvIHVijL3q66duaFii9g2
 Qw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687260604; x=1689852604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWQwth2ZmkJYuqsTZ6NO6uB8o+eUJ5P2P1gJl8kPmvY=;
 b=O1ccsvXyFimgG18+UDmdPChCpSR35WjQ4JslbZE9BSsuIlZfIt5VQnfeGTGbXrm+cG
 urp7o8Io73hNRwBVDMk0VwOWk2hndfdBgQnkft3hvGaPjaN1pR5fbK8cReCn51gkfwaP
 Nkrd5yMia3X2nsVfv3Y1Hnz7zaAK3RJ1tzz13KFCdvTbvm0bOlqXbtZnfdwWD16jZCp8
 ZxQcNKSvNNNLpDQbBHFDNJ1WQjYN+f6yzDyIVyhVSaNEYAy+jlUysnJLaU8FA3AUToR0
 SkVmj/20md5zPAnLuK3uCFo/8VT6ejlA1egLiGGXhiKbZ1gSqNMEwrx86x1If/m142I5
 NdAQ==
X-Gm-Message-State: AC+VfDyCjyMyd5usIh+sUQO7lRwFeC8S1IEzAwLPrOTofcdpO9G2o999
 INrU7l2gFDu9MkmnmkFhn1K5MA==
X-Google-Smtp-Source: ACHHUZ6clc6Lz3GUg0edmf5UrkMmoSlJ2/O39o0yGVunTiVcpA5+xgkN9zqt9xLWpL9WNovT/NflSw==
X-Received: by 2002:a05:6512:3c4:b0:4f6:140b:743 with SMTP id
 w4-20020a05651203c400b004f6140b0743mr6962300lfp.25.1687260604748; 
 Tue, 20 Jun 2023 04:30:04 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004eed8de597csm335709lft.32.2023.06.20.04.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:30:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:29:59 +0200
Subject: [PATCH 2/2] drm/msm/dsi: Enable runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-dsiphy_rpm-v1-2-446a7fd0ce43@linaro.org>
References: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687260601; l=898;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1cWWrhlZ0Hiex7ffMzQSl8xGBl+Dmf8ZnYPKI8QvzmU=;
 b=Rxf/R7lwV/VjnaZUBbyleX/36anDB/8YdzqjLCTn+vLf9T4VCV1JNySe1o/sOmyE/k4Ji5ClS
 YtUktVaBtcuDIdwFCQSc+bxJ+0LyhfAGpALqAfUulinnaE6EVrOs42Q
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some devices power the DSI PHY/PLL through a power rail that we model
as a GENPD. Enable runtime PM to make it suspendable.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 0a8e1dd4509e..323498237ef4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -687,6 +687,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
 				     "Unable to get ahb clk\n");
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* PLL init will call into clk_register which requires
 	 * register access, so we need to enable power and ahb clock.
 	 */

-- 
2.41.0

