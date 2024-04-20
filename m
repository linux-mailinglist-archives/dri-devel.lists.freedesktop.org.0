Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B273C8AB8D4
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C649F10E59C;
	Sat, 20 Apr 2024 02:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HmRiounJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BA810E59C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 02:41:05 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5193363d255so3475234e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713580863; x=1714185663; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ka09RLa2D8cd7MUnxWwNSTSulzyGO8xmtqt8/hCCE6E=;
 b=HmRiounJCu41BGtBJ+mjLngFoUHg6JFBPwdBDRJGC80T0jpqHSc1hFQ4Gj3ZFVNRi9
 oSMCKcauZ+sJqb5CsvzCvCQRhgMvJFtFTIbs5VdN8rAnon+Nz7D4DPfmdwoUoyqH99Ei
 LqKymGL7dqdum4pxBH0Z2pSnhJHA1Ji3DpwHGmZndVodYKjCuaOMJde6GmhbaGaOV0xh
 olBv4mGUbTeWYlmeO4YNR0kBVzTR65vw8Cam1u61fmykfityapfv2s/huiSaU2CU79yf
 Kp756Mhy/2WftqSPjqAX9jRIEkGn59d/zRzzPwrtHnxitViw64Jf5dp3wJ5AFyZ6FzjG
 Dk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713580863; x=1714185663;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ka09RLa2D8cd7MUnxWwNSTSulzyGO8xmtqt8/hCCE6E=;
 b=OuHUffplKYd9lAMR7WXBss44us2Ljk6TaYC3yyAYfLpLwjYybNn+OxIaBnHCiiL05Q
 lAvlEUy6XFItGsahyc7PCMv+rLflEnj0j3dR1Tv5mHBlmQhyVOAQ/t08nSG5Y4lngVxv
 GvsfPvT7/L/lVO7rmaYpLV0GghzZubvixWRwvo0gmCC+TZ/3pzVVDyRkm/FMRoqSdMcz
 8zNWnE89IzF21rI3DBuq74cXq2yQCiW38MieKAztvj6UTksW6MJ4yDInhU1+IqFPj7Qk
 13uDuhlHVocsW11gQdLtlh/sCAfRnagEN+HNPILaZhNP7fhzaGW5bko3Ze2x2/ceGp0c
 +63g==
X-Gm-Message-State: AOJu0YyT6QJ7+YHWAY5HgF3+7H3ZCdl+PFYsA0TjBevjYwQK5hAXLOMh
 LSeZMFO3bctm9jsOcPwVlfCP+np+WcDbmk38tG28Ba3GVicjItkwCdht0/BtcMclWmSKJC9jzQA
 J
X-Google-Smtp-Source: AGHT+IEdjJXBFb5w49+fE8NoJQfuH+OO2sjGj2Uz4GZt2MgBoQ+8VACBUKhVAr7kAgjhUCv+o8HcSA==
X-Received: by 2002:a05:6512:2027:b0:516:d18b:eaea with SMTP id
 s7-20020a056512202700b00516d18beaeamr2100925lfs.33.1713580863266; 
 Fri, 19 Apr 2024 19:41:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 p1-20020a19f001000000b00518c69b3903sm956951lfc.84.2024.04.19.19.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 19:41:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/panel: two fixes for lg-sw43408
Date: Sat, 20 Apr 2024 05:41:00 +0300
Message-Id: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwrI2YC/x2MWwqAIBAAryL73YLaFtVVoo8eay2EhUIF0t2TP
 mdgJkHkIByhUwkCXxLl8BlMoWDeRr8yypIZrLakyWo8R887xptK0g06edC5uqJ2NtZMDLk7A2f
 9P/vhfT+h6DYrYwAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=646;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WnDKoF43rGKHBFX9wId0eAqt9FNHwqM5SXYYZGgXU40=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmIys+0HvzUeklhoAa/Wvr+hJ00ZA693pY2m20+
 MDs211otJGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiMrPgAKCRCLPIo+Aiko
 1UJeB/9eALufS4MclyWW91OqSYOkuYXZm1GgWZ4tvkSA2otVRDZdCjAtmOOfQIxEYr2v3LgsRnI
 ZZRQtwhgvgIp5iS25hSeHFOZp3Mtl11m1Jz4DmGoNXMPlWh1hw0qe1F2ArWZEc8KQvgS1bJk6L4
 /XTyWI0iuY+i/PDMrz5s5KLMMkL4pSOteMEhY/CjGHhBkThxdkT2WdAtt+oUIEWIVda+5YTUqt8
 1j+DNMF05je9MYIH/MFm/aua27MjPIzwCaXobYcEF7CgdTcxpgCtItP5g6em5jpvdkMbTPJeC3B
 Dum2Ej6r5ciu385ngagFZQAS6EV2fob2UGRSp2z/coh5oSu5
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

Fix two issues with the panel-lg-sw43408 driver reported by the kernel
test robot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/panel/lg-sw43408: depends on CONFIG_DRM_DISPLAY_DP_HELPER
      drm/panel/lg-sw43408: mark sw43408_backlight_ops as static

 drivers/gpu/drm/panel/Kconfig            | 1 +
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: a35e92ef04c07bd473404b9b73d489aea19a60a8
change-id: 20240420-panel-sw43408-fix-ff6549c121be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

