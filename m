Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15224AAEC3A
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B8610E1C9;
	Wed,  7 May 2025 19:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qHnAscmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2235B10E1C9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 19:35:43 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5499af0cecdso30533e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 12:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746646541; x=1747251341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mBGWEaSSPZ+Q97XJTP872I0ALcCOso1Sz1JLgKAI3qc=;
 b=qHnAscmppi5wR6ajT+fpk2jRHZIRunfcPGPF8O7T6yhiZytUX04vhAutbdhycVg2Wp
 c1UrrYAhxsVL7GOix7Ka9qF9ftjQemiFp4ivCU0ZZ0NlbK+l4RYTChjOLa8uH6PwiM7Y
 zqmNbosprlDApWJgr6G3vT8ePqzP0ZVnxLRjZl0Yx3zSS9kCFTvGZ98nkjor0ZxASkde
 o+ZkSmCrcV9Mqd67TTed04XWeHJIM/78zyIYdKkYd7QLGbXBnyth99KMl1FQkgY986Q5
 V+gTDeNBllTT+e8Ao4663USrImR187t67w8RMjbzU6EYxY9oEzXw9RTMlX3gUsV32nd6
 xokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746646541; x=1747251341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBGWEaSSPZ+Q97XJTP872I0ALcCOso1Sz1JLgKAI3qc=;
 b=SZ2UGdgTr1wbL+WH4/GkjeUfsqCTDR2d1d3K7AvIRFTOhlEGYd2dUsSYOHE64aF30k
 VkmvX84qy1jaeX6pj1tQLEzNuNL7eJYeh/+h9vPXja5gwBFFamqqy78c/57ek2SNOXq6
 L3DL0zmPB8HinJsyCApML7W9FktazMjLLrGsWAiLkh9DhrG0CMPTjToC/ageSZJdqEfg
 I4wIixiqX14z4j1zihEn9y2ZV4lLbJGvcY5hDcuT3TbNXiBfRjtw7t3gUgsAS69M/wPo
 epwyh4+CdrQ3m0AptjSODKRHt9bPrRvu+1POPrb900Dyz1cNhZ2nPdaUWrE/9DyfFl67
 3PYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1PEHmyYC/sThZDOHvtGifgUY7Mht10EIJVoDbfbXHrwswdx7lVudb2dVHMs3gbEzoF123/dU4Ejw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY2gJyt/xi3ZGRxO6W7lQjy0E8F9DWNKh95sslKm8yzspFUKUF
 1pmaUPZlgaJ04KXbvhTzDXdr0ZunpZUJYoVOo4ThUsmNgRp0ExKmkwasAn9+B2E=
X-Gm-Gg: ASbGnctv296jON+Hl2cnNDvwrAsfsmsm579rEoxLbbOtJktr+300emwQ3ObJn4kO5DJ
 0M3ePwgh9TJT4XvIBJUDk1bwE/AU1eC2D84x0vM5y3ScAvRtaLzTVOzpB6czJNWr6GB/hbjlyOw
 Y3czTPSnNu0U5yIVDCgPeu7ZJbG5B4XlShlbi1hH9YMUi6NoKHAgZ7l2aQD/JMPc98nElV3wUuQ
 DkOmbJCWHDURjoCN44Puuiow5iPwnnPWbBdPuKIzUC1MjmwntBMiYOqRm2HlkDG8Wz0LhR51OYE
 DXYWPc/fDeQB3GBZM3137CRbPkOdZwqFHXfjkDu4UmyQjKLhA8zBIZBf+KCsISPc/u7eabqfXqX
 nJ3cBdt3HzCgHKXBQ3zT2W0Dqhnn2Ww==
X-Google-Smtp-Source: AGHT+IHtds5bXFRbjMaPBJlpofIW978QDvrZvNl3nQjdXjulUScc7U1SYUPoyT7fCQI/v3vFhasjCw==
X-Received: by 2002:a05:6512:3c86:b0:54b:117b:bdba with SMTP id
 2adb3069b0e04-54fb965209amr591699e87.16.1746646541125; 
 Wed, 07 May 2025 12:35:41 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi.
 [88.112.131.206]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee00fsm2432066e87.120.2025.05.07.12.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 12:35:40 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: mdss: use devres version of interface to populate
 children devices
Date: Wed,  7 May 2025 22:35:38 +0300
Message-ID: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trivial change, there is a managed device resource version of
of_platform_populate(), and its usage simplifies the code a bit.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402..116e8f93f8c8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
 	 * Populate the children devices, find the MDP5/DPU node, and then add
 	 * the interfaces to our components list.
 	 */
-	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
 		msm_mdss_destroy(mdss);
@@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss = platform_get_drvdata(pdev);
 
-	of_platform_depopulate(&pdev->dev);
-
 	msm_mdss_destroy(mdss);
 }
 
-- 
2.45.2

