Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEBD8683CD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 23:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386C010E811;
	Mon, 26 Feb 2024 22:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C65DFQpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AA810E810
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 22:34:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-512be9194b7so3640545e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708986887; x=1709591687; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yQyChIs7HE6okKAmXRC92ti30ggyCCOzkDVev1q6Lp8=;
 b=C65DFQpQllRfOMUhS7hqOSIe4iuOjw5TWXiXl0llSW3QJou01mn0bLlz6gmLenUIJy
 V15x91oKfr+pivLE7UaFoEoCYyiWirky+gxiS/5nvDudMVN0AebQvdcF3wwkmWNYtVlB
 oGfYqY/UYFSA6eEPfi/OMKHYOt3VIbdjg+3vtg5XrKa/InnK+oFiHtWm3w5tvlu00n0E
 xnInAHvCxYyLb7Uh3+B9eY/3A8QGVmRd9UpZZt+Vu9s5MLdMTTVOwR7xAwsGMSIn65c+
 GsCFieV+3WICP6Q4fZGIavng8lGeJ8uzqZ6mKKk2bI9t/2O9XOibHnvve9EnivBKlBbi
 WK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708986887; x=1709591687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yQyChIs7HE6okKAmXRC92ti30ggyCCOzkDVev1q6Lp8=;
 b=Nlr00PQSEp9rE+6DFKPOPoWNfo49cudAoGXfwPzfql4dcY2luyTMTLqSaxFv0Pp0Pw
 WqIM5wtb3F/8gDqZmAbjL6PkoRMsclWiAvaFCea8obrOcJhl76mIVXnhmneVBuLbE49p
 7SWQj0r8syw1RjlEADbAKtZSLrkL9MFQ65VX/mMXi7Bc/FuqrA/u002Zq1+D0nNiY7Q5
 rqcxuwsl/fflF5veyrt867HOV+RLGiH8qfy/ddurXu6vSWLcxn/uZ0Z23wDpNcK7KzSB
 vJEZdm6UpnOfDhILQz11fk/QQuwsh8A+s/9u4JiYQCRUbs7pEO5SHgfoQbM/DwtMywPf
 ZHcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFlTzz6R1Vqn/f7eZb+Yk7d4BO3SbWntxtma7HsOQdnGD2458LLA3q9RjAS8CiG47dYS+b58BHIhFrmqUNFqA4cvS7mFKaJjqT8cKTTJQG
X-Gm-Message-State: AOJu0Yxae85ih+jOVEmyQa/DHDqPySfJCTC0Jl5vNkPhfM9p+PF+lsUw
 ZNlPAM1wZDuqf2s97wUjPsTT7rZ+skdW4uRcywg7GjcHHu6GoZVvX07J8r5p21k=
X-Google-Smtp-Source: AGHT+IGrx//bIIH2O6Sn2/9dUKpFd5KxgKX8eYYdMPd0RYKbN6C+owSEI3tjysUFeXhVqZTQY+HU/w==
X-Received: by 2002:a05:6512:a8f:b0:512:f66f:eb64 with SMTP id
 m15-20020a0565120a8f00b00512f66feb64mr3821894lfu.68.1708986887114; 
 Mon, 26 Feb 2024 14:34:47 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a19c513000000b00512ed78a845sm968783lfe.129.2024.02.26.14.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 14:34:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dp: fix runtime_pm handling in dp_wait_hpd_asserted
Date: Tue, 27 Feb 2024 00:34:45 +0200
Message-Id: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

The function dp_wait_hpd_asserted() uses pm_runtime_get_sync() and
doesn't care about the return value. Potentially this can lead to
unclocked access if for some reason resuming of the DP controller fails.

Change the function to use pm_runtime_resume_and_get() and return an
error if resume fails.

Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..1a264e7deb90 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -509,7 +509,10 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
-	pm_runtime_get_sync(aux->dev);
+	ret = pm_runtime_resume_and_get(aux->dev);
+	if (ret)
+		return ret;
+
 	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
 	pm_runtime_put_sync(aux->dev);
 
-- 
2.39.2

