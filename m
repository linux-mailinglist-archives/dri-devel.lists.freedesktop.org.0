Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AACDA36100
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C1F10E056;
	Fri, 14 Feb 2025 15:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GqtYIHea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B596E10E497
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:09:05 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ab7e08f56a0so38373566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739545744; x=1740150544; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yTE3gACjDkJBHSXQFkTCbxcnRZQf61xIHWSy/iDp6UQ=;
 b=GqtYIHeaiQpAVXI1sLEvBAOihvsXZs3mbTXYcChf/pksZ2q3d8sO2A35kf8tSfEI/Y
 ZcF4PoN/2XkUzziusJ5cHOM7ekHkNxo31HcvfNxPtICRw8O2QxNuvADMgVIHOAThObcO
 2o0m8cLNzD9B/n9zd1UhAIxbkjKCF+udp5G9YPWGWky7TXmMQJSOe2O6x2p7bnBxIAdu
 y/fRR857dlOPOVpwHF807LylxjLLCDeF/KOGgvjHTogpJu5QkdSl0GFnmg6r9/0uIl7r
 V/5JTee3gnKnTPd+FsO7yT2HQeVC9KDqojl9nFIxbpagsT2Ydea7Tjz9uK/Wh9RTc+tC
 JWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739545744; x=1740150544;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yTE3gACjDkJBHSXQFkTCbxcnRZQf61xIHWSy/iDp6UQ=;
 b=pjx6hAhEJEmDCVnS2rvd0IH271uBQrsAYFh7ePsv+FTV81l0/OKGC7+c33+qdT+cqb
 P5GORP6/CVvNjMa4qbnLfXQ6p7TOrGZd+DYqhu9iymSf+p2j92zQ+zA1AdpQn3iSyQSz
 olLxSzdt/TipBP9ZH56pIHm9H0MYjL26kHzcjAqQaoSx2mhFaClUmVeX11CIeJaBDwkQ
 aQVQWmnCjQP64zAnBKdFOKj28EgBImHDDzSxA15t/LxDtsI8oNf2nQ6IK8qyACE5hWkQ
 O+uB7OGspRYIksQFUTS4bm+n/1KwL5y+KKxAt1imDoHx8ff5VWy/gFhiVk/UkaLgK3Qk
 xgbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnMQKwuepTF3LnzV7BDCvuS1aDOpDCQ96f/oPdBuYIWWk+3y+pEtsBIm4uTq3tdFIfaH0KF3u7Tbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+wN5NwJI8K8srAFFHACh80iWWogflNRXWJsDXgAlk622v7KS7
 dfXU2Rcz0Z7J7/5tjiY4UMT6c1HMEe6BOajOHBAkOjHSlf9Hk7U4n7pnOSnP7FcoYlxspAcvFEZ
 /
X-Gm-Gg: ASbGncsN2vKUDArg7tuMvoJtjBxGw6Jw9qLTgljR9Rjyfc2X6YN4WeaW5KzYoYUf8YX
 y6fuCIVjiIkkblsIk8ACUsFpFKAAMypAq12do7mOEsL++XwP2iKJrmmyjRIIeQieYofv5Opqt0w
 PZm4R2CMSo2gTKOyZOjoYZCw8yuQFRsj9VU7HaOtNXots+XJuuEMFAD5xbwdcSt62NF0nnFPdRG
 AGEiHmTthnY8nHphwDjQlQtWimOxtbQSZIHJyOrWIbfDjmaEaP43m+yvoqlrO5BiKZ2SeTuxqFf
 onZXyBbkOv6dJbn40kUqTN8tVCsFjnU=
X-Google-Smtp-Source: AGHT+IHzgKaRbHiTLvYxrSndh1cA0zCykbFaeMqxfMqSMgTgRMaXFYxANRLGE/AUS2gP7blBaOGXAg==
X-Received: by 2002:a17:907:8686:b0:ab7:cd83:98bb with SMTP id
 a640c23a62f3a-aba6939dff4mr107008966b.5.1739545744014; 
 Fri, 14 Feb 2025 07:09:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf70asm356266766b.180.2025.02.14.07.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:09:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/4] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Fri, 14 Feb 2025 16:08:40 +0100
Message-Id: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhcr2cC/4XNQQqDMBCF4atI1p2STIjVrnqP0kU0Ew2okaSEi
 nj3Rjeli9Ll/2C+WVmk4Ciya7GyQMlF56cc8lSwttdTR+BMboYcFRdSgAkjjHGEuV9gHgZobQe
 BOriQaqzSuja2ZPl6DmTd65Dvj9y9i08fluNREvv630wCOMimrslSg1SZ2+AmHfzZh47taMIPh
 Fz+hjBDVYmNkGWrDOIXtG3bG7tTcx4IAQAA
X-Change-ID: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u4YT2mRDI9vOEz0E0V9HN6GrYA7SOM0GmXxkYSP3BpE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr1yHLLYyDJehS+Lyl5tVRCFBKAPeBmUjWYfvx
 4mbFH7/R6SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69chwAKCRDBN2bmhouD
 16LiEACVvDtCLRMfuiT8VpQkuEZNPQh4VQo2O3u0UY/cT0x4qq2KF8l36vj4gL5Dt+BVNgdw0S5
 h3f3cq22DDVS1SqE7I4jIq25kHBHC7so1BPzOGChBxRbhjshsWDVwsTMDdURwLcPYFpZ+I4J7RP
 7HfNUR5lBUz+DRnITEtsfrEnG2xo6+GQZFxD0OynwUUyv3+TvK4maJGI7IEHYDOY5oRgYMRESkm
 UTOchy/Pt7bbmzXCKyO7/9VToAh07H31wz/OCkkyYiUveXSH7jPrIoD5vwhCMAf2k/dHHTa8tec
 xAOuSD6Di44KoxAQgEl4hbAW6GCCC39rXAEVEiJj45iw1KfjiR8q8d9luZhFjEOjLskntN/YiZE
 HB1/hNkErm3URpdzohJfncZWf+KGeGQXg70GpsFj3HPQiDqAsHxWwWN0Lz7z7/8UDY91R3X3Q3e
 Xq/gydE4d2uJGTr5XDo83fmWKKtLTlFarHqH+g9yErvskpQ3kKuSO783sqabF0pBxs61NcPbvAg
 cBHZMYvA3BPSSXOutPYBvWXvh3iN62uQbguq8NzNNzpyjMQ52TeZqsW3h/8udSQf08yQNH/dByj
 fZUBLRk2bbtR/vyDTT8241tFnwQ9BKBPo0kaebPofsmWzm8SL7pHQADR5zRzLg4WMQNqbjG48Yq
 N8x4UNYoVNrekKA==
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

Changes in v3:
- Define bitfields in patches 1-3, so move there parts from patch #4
- Use FIELD_GET
- Keep separate cached->bit_clk_div and pix_clk_div
- I think this implements entire feedback from Dmitry
- Link to v2: https://lore.kernel.org/r/20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org

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

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 63 ++++++++++++++--------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 ++++-
 2 files changed, 52 insertions(+), 23 deletions(-)
---
base-commit: 883d3876ff4bb50d1b9431f525b4d3b257ead6f5
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

