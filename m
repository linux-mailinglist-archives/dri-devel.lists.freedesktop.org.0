Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3F9A4936
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C639810E9C4;
	Fri, 18 Oct 2024 21:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sYcqgWUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E07410E9CA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso2586808e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288170; x=1729892970; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z3JlxuYLRvmuBAe/hXPotObPdIzfa3RGXwRrg41qHxk=;
 b=sYcqgWUF9QUQo53/+S66Kig5/o281J/V0RSaa/L1RFGjzCujRf0K6EPltBUGYS7dg2
 nMYBoxKssztZJELLfTuiE631iRvwTQvhpDrVeK7OOVqBcuRbuPoKFzYYsBHtlFK+K79i
 KotoE91aRYhLvIr25kp7hubWlBlmPeTj320zPg9lB5JTOMa26hriK+NEUEnMimgcQSQL
 fiAvOqLAxbIG+Mk/MdwlwWLD7rtUtyLO7N3Mg+R8y6FiyMFrOFd1XuGa2wSlEVs/MMl+
 eXOJchZCsPNbvBrPC53iFUvZTk+VahVhyzkBVbDh3UB8ypUqY3j88moiajCyBI2oXtVu
 6dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288170; x=1729892970;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z3JlxuYLRvmuBAe/hXPotObPdIzfa3RGXwRrg41qHxk=;
 b=IFNnivXDW9NtgZEJ6GRQhn4pW4UR6/w0MjFAgSHsCCdijzcwC4tO7Xbcbutf3LtIaY
 ZH3VP7EdIKaWSfgC+OdkeMDGL0pslDjsoEOa45gMJZrfzBAeswSmW+0msbO562JQTdQ/
 wAmcKZK0/QxsoGHPadolnyBBCGBIQwxTApl/3CmgyqUlkwfemYorGZZWoBGwGqJ6jDPH
 9sE8FFJG822SGf/AQL6PRhmFueWmB/W0BCuB+7s/ZJu4HeODKxFaWNftqcDgUxyC7X5p
 wsMPDvRjLlpFCQHVpb3THy2jLy8pJJ5utiYP5K0BK+vcpFFX04Ifm/r0tfm+HhgySyOk
 aDwA==
X-Gm-Message-State: AOJu0YwkBf1rfXfDppCU6Y5gWoQjZYQeYyP5kY4Jbk5E+xF2pSbjbB5O
 //aeolasvSCXDDvpdhMlYnDmn+QTn9lOi1m33ap2X37qTM5LC4cLzhKriSzmKDk=
X-Google-Smtp-Source: AGHT+IHnKKr9DRlmVgrVc32PqUJ1XzjQFynXLr6N7p9iMEp4ytq6PRLtyD5ZxAK9ZZhPA+gqE3INBw==
X-Received: by 2002:a05:6512:3f12:b0:53a:41a:69bb with SMTP id
 2adb3069b0e04-53a15b995c1mr1118216e87.28.1729288170302; 
 Fri, 18 Oct 2024 14:49:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:17 +0300
Subject: [PATCH 6/6] drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-6-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vSGIECGW576rwJsHdegRSgB/e6dJJG1yWk4yZ40815g=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7rQ9Xve2779/pDOty7EYZXSyS8qsUqzJ364anNd+p/J8
 axaczmmTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMhFmQg6FNq7pWwjTa9/oz
 WwuPtULRWf7X2PdL+6+8e0tGRqG5R2r53MZrAjmrDb9tnWobqfHvwV3Gjhvqc1+sWT+x861LHd+
 ClVqcwj7lJZ8V+eR8VjbqCh4IzX0iXf90n0Ivr3x7ofi3pofPvr6VXbVcKp+l5IJueQa/9oOCD9
 /uXLlVfzNo6iaBwwUfrZI02pvOXz+e3v5v+673Idzia9prJ1QXdHxIK66sduHjulG9cU3ylzrLu
 /N3Wz6ezTMj0s9N6wTjufBcB/uDM28wl4l8ltwl0Jma+Tg03VzAeMLx7BwRhdf8QueFZ90Wu3Ar
 Pj41i/2RqZC/m+sz/wfVr58X+X18xFzvyvPm6M6g5aHlAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Set the drm_bridge's ycbcr_420_allowed flag if the YCbCr 420 output is
supported by the hardware.

Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0031f3c54882..996733ed2c00 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3503,6 +3503,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
+	if (hdmi->version >= 0x200a)
+		hdmi->bridge.ycbcr_420_allowed = plat_data->ycbcr_420_allowed;
+
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
 	pdevinfo.id = PLATFORM_DEVID_AUTO;

-- 
2.39.5

