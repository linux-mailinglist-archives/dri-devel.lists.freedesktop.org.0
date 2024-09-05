Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320E96CCFE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A741B10E3DA;
	Thu,  5 Sep 2024 03:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cdpg7Wjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9E210E418
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:08:26 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-533488ffaf7so245599e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725505705; x=1726110505; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aCUd9z1LcLMx6hSjP2k+xgb3eFs9dKtX8QI9QhSVFF0=;
 b=cdpg7WjgDJcQdcrxi4kzuJnfOu/80ccBvVwbZXpHfO2yhiEhe2tnO/7WGaJWg5QrR/
 HKQ8e5/6ZU27jGK6kIV7qe2/vNXinXUFEurrGs1Rxsh7e0wt7jsQ2NWf08zRgMvy7B5F
 PWxui8URicETlZtZFRcrxj42jCdn8HdKo/bYToXzyI4YunOii13Mp+UlgC/KWEtqyQRu
 JRRuEUifP6EIXMJzSMfSWxXMumPgSmh9f84Yz8juX45agHbwEwkoUSpM4Ag7GPukKUxk
 ygA9CnTqOOmSB8hFIDfnUOhdPfjVcVedDdctG8NiSm26K6kRulue5scT7VdEHFnnHwWo
 gILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725505705; x=1726110505;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCUd9z1LcLMx6hSjP2k+xgb3eFs9dKtX8QI9QhSVFF0=;
 b=udnOBI6l9mgA8RC+bLqzPWvVlGUYLl5lqEdeRHbNFtj5GjYgw0i1Atx60fZo8q1ruL
 +L7kIWQVlH8IGqlYr91f8N0kH6q6EwGfMgL2mk+c1CFmboSRK1qy2lLXMmH1cVZI044E
 hoqPQixgNt7hqGPD7btGI2rKEvYuGsev4H84nFXmUQ/0xpymr2DtukTCpNHYPmiF+AJY
 C1SW/vJOXXg29vIUPOdyrNnKiLI9qyQJZqgErLQ3K1t+S15U2BHZ1HUbsCStX/uvkdFf
 +qNc6laP8RaEJAjFro9njQ2sQ8hwe58ERDupI1UZM30nynKWeGsCFdaarYfNuWf5tIz+
 zNNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqZ+anKasNeHeDW5mtXiz76PEWE6xDqd5wzWjwkCIQaCRqBwH4cRQDYPahPz1Qh8WMX9UMmWPlkqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsC1ai/UG+QxeSlqyA/YjnAyzwVsetCo/arn1j++bZi2zHLZDU
 Oe0ra73/LRXkowTLuY+GPpxr8nRUMFkBd4YSKwCDRlWstOfN0zB+0WKPUmmTfFKEJcY89Wp+83f
 1
X-Google-Smtp-Source: AGHT+IE/2jE3CvFlvvIXHzJupYuHbi2/1IhdOJoiEbZkzmE63Jt8Mh6dMcluwOLczC02VOgLi+O/ew==
X-Received: by 2002:a05:6512:b82:b0:530:ae22:a6ea with SMTP id
 2adb3069b0e04-53546b91ef2mr14631592e87.40.1725505704199; 
 Wed, 04 Sep 2024 20:08:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac190sm2485277e87.96.2024.09.04.20.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:08:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 05 Sep 2024 06:08:21 +0300
Subject: [PATCH 1/2] drm/xe: select DRM_DISPLAY_DSC_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-fix-dsc-helpers-v1-1-3ae4b5900f89@linaro.org>
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
In-Reply-To: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/uc/spJSdC+Q0uOvIRVDDGVfhgEPfChpAlvRBCMAkJQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2SClH3jAjsQwXueRbupby/Qyxo1pNCBRE+FYy
 TrQumjDJhWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkgpQAKCRCLPIo+Aiko
 1WUdB/4mLKT7toID+4EsvnWOp5TQO7a7GiChrUuI653sWs0XNN89QO+aQlpsdo+wgVvTcrvWvBO
 C6i8x2AwjrHm9cSIn5uu66DDhCRRCiCelWh8vwvtQNgwDP30tOt38PSkFuLdZhEQfeJZvBPBC/u
 JS/Y5Npl49z2KqrYk9QbimEg9oy0KI9Aj0nva6UW5rNWFw0ZBy1d2taaUr/KBPdp1F2VkUtoWtx
 ecBErdsaSdt5CHrTfB4FXFE8eVr083nB6qqd2UQNsHA2SdUD3IFLJCk0zqUkbyZ0UCXzgizmuf7
 vixPcb25txPAUaZD+YKZIsHQ2gGnzMPV7x1YmszSmdjXVpUA
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

The Xe driver shares display code with the i915 driver, pulling in the
dependency on the DSC helpers this way. However when working on
separating DRM_DISPLAY_DSC_HELPER this was left unnoticed. Add missing
dependency.

Fixes: ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409032226.x6f4SWQl-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 7bbe46a98ff1..ebd0879e04d4 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -14,6 +14,7 @@ config DRM_XE
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER

-- 
2.39.2

