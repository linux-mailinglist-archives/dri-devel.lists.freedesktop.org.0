Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F86A47275
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E074E10EA1C;
	Thu, 27 Feb 2025 02:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cpOIaf1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047710EA18
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:30 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5e04cb346eeso573597a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623129; x=1741227929; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nwMJpPPmQJzExGwtrw5qRSd6mRYkoPvcGAO5V9qYYKM=;
 b=cpOIaf1RzIlUzAnP8ftwwbprQiCq+xcCmN8SvNnr8nPAGQiyAY8H1cewv+rbNZgbOC
 Irp1fxR+lT7hr/QhGy1Tu/QXu9sPDcmZW3mvfrB2EHtTQb7PuL6Vk/sk3/aSu3jyv8bg
 na37oQWsml3416G+g/UZKbhDaA69kUqVB/H0gZYZ2GWaP3pHHzCZObwRZ4oNrOogyzaY
 5O5N8zP7QhAJPE26jk1MvnM4NGuTQklCOf6OvhxDKvO6i36GT8s7nsfR/LEdxq+yYM0+
 XRWA2mSpmFd0ZtsuuAC0yB6ObwwnTsE0mgrU0pjHNLRk6EX2nPbOCBfkBATx+Z9Bosc1
 NNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623129; x=1741227929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwMJpPPmQJzExGwtrw5qRSd6mRYkoPvcGAO5V9qYYKM=;
 b=i3sIdKePQAZ3t09kx9cfaylSSgwv2IoqlevIBKeZeRBdqTwapiLBzP/jfABWAsBsv7
 HL+leu1ylS8XGMC2WGRRmCZpnlzbyx11ml0TIzB8/uCmW3E5IMSE6+p7ZbHJGOw2aNLy
 pKvmPnQlPTbsf+p26sISBnoJQ3WTh8GeqAm8RWnFXhPxccWQ3VfPNfMf4twgq16kw7AL
 e8FgrgnYIcYaEIFf8OykoJbQGP6ZRsQDDocmy4fKk2Ly188sgFmfPTPy0aee3C5CQweP
 E0PaoK9aQOlwQap3hChFrz0G7QQaK7VmjrovYVCjvYjAyenlgtWxyXe22yZnO8Rpr8L+
 NwqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1oHkUbdqZFODUtkPrAsO+cOcipGCLKp/+9G2CcBVUEeEaijpDeKjei5hDK7ZlUFqoeLYNnkd9fJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgQEzlleIofyRBL2wZowNJmOzH4bzlMK3qaxLqzWJAzKjmvrZV
 +NB0k8GMCkuZQ1U7Xv9r1BHQX2njk8cjHm9MAclqDeV0FnirfgC2Mq4kt2187gUWFwCek6tOJNp
 6cCeHYw==
X-Gm-Gg: ASbGncvCNVJfqvDJcNpAMEmmIAq1f9x8tg1u6sNpJkzWXK8xl5aOnSfR16lOlor1NzJ
 Fnq3ugKz7oqx9RokQjjxZwh7ky/bj6Xc3pZZfx+0lCU4QdBUajh5JdYVORbjH65F+L14ItFGwyg
 3hWmG5PWoU0GjPd4G3d3bRnBMrdGfibWaxiXWeqZrj/JY0Ne4Iai4DhQyYU+Kaj+bRboMIt5S5i
 E+1iWSIUJtDnT4U5VHEog/cc1/V3nDiIxNVT7dW2vIbRDqxMwQgtkxP3DBkBobyuuG7uShG3JmB
 vEQPFT+2GXEHnmYV2NCxXiokVxHC/TEbUg==
X-Google-Smtp-Source: AGHT+IFMFzSt2wsG3oOm+5w5wwMdb2DuK5Yp/Au+CFco5T/pzSUdUvjy0J4YD00jtRalqEX70RhAkA==
X-Received: by 2002:a05:6512:200e:b0:548:794f:f9dd with SMTP id
 2adb3069b0e04-548794ffb8cmr4463137e87.10.1740623119107; 
 Wed, 26 Feb 2025 18:25:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:10 +0200
Subject: [PATCH v3 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-2-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ydZYZoA0TUi+Gh3S8eUOrsgEJcPFXVh59QDIeik/wpQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80GyadA2VzNwTHLQ/rRvBiE8jpMBgAfbiyde
 YCGRYQ0O/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1ZDVB/90aFrmR5KOT95tmB3pWLZEsq87+yhuvUptiF1UJSOURslGc6sVg9ydUx9NCix6I56zEbW
 3GyGXkGhjaQdfQhmFp7u32GGTj7dl9MzYhy+0vcprVXVPn3wkOfwYoL+ZP8j7EKEO0azkfZxNBo
 APuBMtzFjaX8PRcgo7MeQMyxLv5di8a/xaX5TF/0FE9FPAE3vnL4erAXNQvSqw1i/dUOr6BMqOs
 ysFDUPsAzvwcqlgqBgJav4+a2KJLzJrt2BDDeH+wsQ+b0SJ/koY1jFvs9pQR/VQ73GVc9rsWqjo
 G5DuZIKjsVNaD71Is+vFt/CQYparpNF4JOOIxVg1hnWhc2bD
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

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5

