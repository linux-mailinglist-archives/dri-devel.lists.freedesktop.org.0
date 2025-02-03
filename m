Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3FA26165
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AC110E52D;
	Mon,  3 Feb 2025 17:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KyZdKzKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF47C10E11B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:29:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-436284cdbe0so7132485e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738603774; x=1739208574; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ac3ZGWXz9aMploZ1G1mRKC1Oavzr9ThgkWG1OTuVbdI=;
 b=KyZdKzKU1gFXbSNpY6xvjQI17eScj0M2wkTiChd5jmab+/tO1Xk4jE7mPj1rjok8mb
 zjWCPzapMtHbFWo/gQ0FIJkLkVqDL89UyWDcd2Y2QOH5/JmBoUr26m2mRTwURAbxpBCD
 M1XgZO/VANEpgv6rkp3KO/sWyRxs7DLLB7/AX4FeDjMeof0FFcGPm1/94Yi7pMPbgSrp
 fqHwt1GqvEv5SoD9xhynMGYIWcCwbfjNlPI6uPItyp2KBvue5nQC98uGocH5rT3uPPTN
 rPJW0ND5LDR7YFXRgNDiLSp0bVZyX3Qjueq33GwG18IlkV2SJE9gVZqh0x0fHiPTul4B
 Izsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603774; x=1739208574;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ac3ZGWXz9aMploZ1G1mRKC1Oavzr9ThgkWG1OTuVbdI=;
 b=iJm+b6CX3E0RALkJHxg4m1g0ZM7Z2dIHtpsK/ejKqT0E0Y4dhrjjuVjkU6d6rxBaA7
 A2De+GPGHzAsht1S10WMnBDs62clPtrOyGCTGZ6I9mZBTDZqvKNN7E6iWNx0vHMkbrow
 8M78QbkhMwmCyRWBddn68sjj/hIOD8oQWG0aHrNQtj3eLq1jKXHjIsmnAW3BZJZSXkTW
 WBzVV+pC7Wy3Mkxb4BDv5/kyK7ocpwXNv9Lp8+fNUtG+oGmFTcTSQAPM7Fj2Erx6e5hR
 cNzHN14Nb/YhBTqRAWsQCoIlSa5JzxKp/AlJ2wV3tYytoEilcAJC2aFXITGqKZiGwRbF
 hIGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQr8RBFsggQqqO1+rC6s5dWVXWCeMinawDflmmoEWqm3HkTX6JCJVRguqLMXKipmxlUKfF7oB1r5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2FzXXH1YVL8Vt1PBaQaShpvQ3fISEeaAR5+tWx3/o0MNU2aBg
 FFjSJh+iA8zrLmqHfsaSW6/uX3J8d4qdapvQbwkbjPJW4TWn9/Gkk+i7heXkEn0=
X-Gm-Gg: ASbGncvkWbw0pmmOH0k4eUaD2tb68EBusNZeOa8ok3q1yeYHnKN8ffkawL4MVneq2Hv
 SI1Q72oyHfxM9H/uFebQZ4J0Oa7c4INX5019YGE4jhr1vB4KtrW+lPYk6Zk9KAOcyVvnxmhmDIZ
 lkcv2fZDOvbOzfjc5KXlRNUi1T/lmJk5hZPKrCzv29AFHEHzmyC+AvjYlFcmKAsGhBBbL8AAz/C
 M7Go+AIzhVldUlR+lEGV12NGGuEWbAnLuDYSOWkvYFoPDHz4ed84pQNd0IaK0V03dUAArgTpPry
 PFJdQEDp/jHlrsu601d0w6yyZCxSQgg=
X-Google-Smtp-Source: AGHT+IGhFOaPD9fivuzNwrn6DbS1oY42IZc5g4YMWW4YJcP2EujI+TZGHiQLa1LvRIr4LmUuX30ymw==
X-Received: by 2002:a05:6000:1846:b0:385:fd31:ca24 with SMTP id
 ffacd0b85a97d-38da4e6d513mr127982f8f.12.1738603774242; 
 Mon, 03 Feb 2025 09:29:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:29:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Mon, 03 Feb 2025 18:29:17 +0100
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO38oGcC/4WNQQqDMBBFryKz7hQTsa1deY/iIppJHFATJkUq4
 t2beoEu34P//g6JhCnBs9hBaOXEYcmgLwUMo1k8IdvMoEtdl6pSaGXGOc0Yxw3jNOHgPAp5vFP
 du9qYxrob5HUUcvw5y68u88jpHWQ7j1b1s/+bq8ISq75pyFGv6WHbiRcj4RrEQ3ccxxcfDAUyv
 wAAAA==
X-Change-ID: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xQlurBY3u5RMDcS/VvVMofyyxRzpGwGZd0Miww3VF4E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz2NHzN+CYGJtw78qYAAuNDg/s27In4dTA0U
 BeJ9Fcjj0KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D89gAKCRDBN2bmhouD
 11oiEACIsS+R4Iaiy1r8xY8+KgniLX5HGt1Q7AxG8GGu+xivL5XvJ+E+v/Y0QDR1rqCXHKFg5lC
 qXRmr5H3oI+K+0P5U2V5+/VArm34IYBlq+U6m7U6nW9na4063mVZM6Jrpb/R33MPBbca0K2Krwq
 8g0KsV+KLSpAqoeHUHvwCgA74VOSGQOMFwNF481pmCfDjpUgjLLNjQgymPhqtjkOGS0E88zLfyx
 ZBFbPzH2eGvzfvUaxzoQ6I34dGaYh5l1l4U4qDZEWmEMxfRE9OuIZqKOHAYbayCDEZlJnesoqmw
 5n8vQS3tbtSvycOIJvKXv9x0AygwMaANZPNnwidfOBLXYv3BG/H8SswC4BhXMGMVr9s8scVeU+L
 AfJkIvX2my+lsXp6eCgZnunR/DzmgXlUz2Iv6BxV4L8B5qkGyB5xr1BzJi7lQZpL9wO8mIY3hdm
 uTClZC+t1GBWv6h/F0wNiijzn7xM2RAd6a/7fSs4v53wgH9la5s7z+EpRwSraRD6/Dm2B6n5/Uk
 LEydvTFXBQJ8yhTHlI0BB/FW+QC2yFT6n3LhrhD1lXf+Hb4b19kIUGHfl8DMpR9QbZmlmFOoz42
 CCCcSrDa1qnaceJQakW1PflS0FQfeijiGuLN0Uj3+JunMFAihmORTDToxEk5dAFoWxAYPJPAsm7
 qd+wyiV0WoYdlbA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Changes in v2:
- Add Fixes tag
- New patch #4
- Link to v1: https://lore.kernel.org/r/20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org

Calling these improvements, not fixes, because I don't think we ever hit
actual concurrency issue.  Although if we ever hit it, it would be very
tricky to debug and find the cause.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
      drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 70 ++++++++++++++--------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++-
 2 files changed, 55 insertions(+), 27 deletions(-)
---
base-commit: 3270483b5a99a2ada44c72d6c2ae20d77c6e5c28
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

