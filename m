Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08197DF04
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 23:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90E910E199;
	Sat, 21 Sep 2024 21:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JzTQTI26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4479E10E326
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 21:14:51 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5365c512b00so3731653e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726953289; x=1727558089; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sv1Xt51+REJ6qseUldVGpJwkDcR1DsT84Q0fO/g01zY=;
 b=JzTQTI2623Aj3K0vI6SihnI9rKnxck6YcSOOzFLnJp+Vfa4zfea+0AkU1OxmR0Qmrt
 p9n/icYi3OoIoPboD1D5D+103DWrRISQBiy1eq7WY/87PPkxwcZItgB3LGFznneyodS9
 3XoQ1lIGjtpWK518pYQ6tcwS2/7Cz//6tSWe92PxuF5CEMW31K4Pn2nWaiEWL2JusQve
 LadgLyFLCfZUUHkGySXPIrr09Tb4Bcyh9Ie2otw860BToR/ZWzu2hvYbcfWhBBCPL6Qa
 wNLTJF7l+NngZSTu6LtqyiWQpCTuKYUqpMBDl8pRjqI9aHFZEuE641GHwDkT019r0EFo
 yNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726953289; x=1727558089;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sv1Xt51+REJ6qseUldVGpJwkDcR1DsT84Q0fO/g01zY=;
 b=FmOZfkSaUw0UFzkHoPUnelyxNuYcArPLi0hhlhlc0vB9Pl5MjccbdpinUKGab6gk3R
 2ZAdmcXIazrOm2c4DVrSVv1B9vo5PBvKAxzZtttC97ChjzxyCv6IPWOSHltei1WveyeZ
 dMkNhY6vDqgiXeYsaJGuyvjt5ZmE6TymiHgHMbqJ+hd/kTdlyYdFfbcdHbTpW4gFpPCU
 WPINY+45P4lLQxqjzR0RTbdVwnbvkacDqj7l2idweSR3MOybOAfwsH+ouD1YerroT1+5
 EjtEFOtMbFEoRgeE66AKPqsVBnvnsJ1XxUa+lIBLeoFI+koyJL99Cuwo/AQ5iJz/P1m5
 0PQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0damOyE+py+aFMMeR9yoAiLgPj/aGRa2KPX8tds1mv6Mq7xpZtEBWpyexIdQIOSbdeHrzEa4kMLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysSSJWZnd3JTP65qDszmUjdX/Bv7QQswtObx1TPEt+T/wFf/ni
 vKRHpQyq9OMXeobA4bCEacGSMUYjmY1OqD2//jGBzTLUUzJ5CP7W3x9+LgA57qc=
X-Google-Smtp-Source: AGHT+IHTsq5saqDVm+y4PSRF+njyLcIJFFfoV4sIth84Hce11asUbga8hoCpD/yJPHbn+yr2huGaew==
X-Received: by 2002:a05:6512:2353:b0:52c:e326:f4cf with SMTP id
 2adb3069b0e04-536ac2d64c1mr3971548e87.3.1726953289156; 
 Sat, 21 Sep 2024 14:14:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b4192sm2696645e87.253.2024.09.21.14.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 14:14:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Sep 2024 00:14:48 +0300
Subject: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEc372YC/x3MQQqDMBBG4avIrDuQBmnVq5QuYvKnnYVRMkSE4
 N0NLr/Fe5UUWaA0dZUydlFZU8Pz0ZH/u/QDS2gma2xvRmt50YVDXjcuqSgCx5I8zyPeLxcGGDh
 q6ZYR5bi3n+95XrAJ32tmAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XCA9l6jIuwYih0fkmBs7/+esJ31azn4rphomjgMvutQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7zdIInNhl3riGlKSk1rgC8g02RdnnV5F20Fey
 jMFqY4jSlOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu83SAAKCRCLPIo+Aiko
 1UxXCACSlqB+A6P1dzNuIExNPQMPdzpKyXpyMltim4fr71qV920qm+A/pRY94R64jtWm2Wa6r7L
 Hxgo1o6qu+xUMNI5x6OEKefajGLyCUxWkcDxxWsHzL9MV5hXmtK1yvDe1m+kQy0lQoVV42W+3/y
 RNxRSkvxHKSXW3eU39Y1WlPVoMtgIVynk8Tkdlx+ucG2WfTjGu8b3o8MAmRMJEC68KkYOmePU0s
 QZ0k9pV2PpfQrl7+qA/WpBrssyTJgfHzSxdRKlg2lXgTCFF99ayfWgVzewc39xrN5LWou6Z58qf
 xHwspIYPq/YsSXLuHOrl4ytByW1Z50WaBmI9Bfo5Hkum4oIt
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

The pll_cmp_to_fdata() was never used by the working code. Drop it to
prevent warnings with W=1 and clang.

Reported-by: Jani Nikula <jani.nikula@intel.com>
Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 0e3a2b16a2ce..e6ffaf92d26d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -153,15 +153,6 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
 	return dividend - 1;
 }
 
-static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
-{
-	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
-
-	do_div(fdata, HDMI_PLL_CMP_CNT);
-
-	return fdata;
-}
-
 #define HDMI_REF_CLOCK_HZ ((u64)19200000)
 #define HDMI_MHZ_TO_HZ ((u64)1000000)
 static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)

---
base-commit: 32ffa5373540a8d1c06619f52d019c6cdc948bb4
change-id: 20240922-msm-drop-unused-func-b9e76ad8e0ea

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

