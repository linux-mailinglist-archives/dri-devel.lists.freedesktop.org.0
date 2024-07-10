Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52E92D70D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC06310E847;
	Wed, 10 Jul 2024 17:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fIZa39x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB1A10E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:05:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-367975543a8so4403415f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720631119; x=1721235919; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qJL9ctqEQ6EbrQ1caBlXUSKz2PPn/p138eO0sdvXuFQ=;
 b=fIZa39x7bs/ncEZiqdkDA6dMOkFTQqlTERytUrLBA6WhzNPE3XfzuYpznOO7Uw6FFP
 GrYrjlGRdfdklB4715DsfNyj+i50j4VwgHKwF5kISgYVwaFsaGqGiny1BO97po0YrDGI
 DBzkpbV7TDy+WzBSdGi6M/qV6JRub7olK2djiy4//gtfcE0uEegVor8LdUIRas6gbIMi
 UT9fyfvy6LxMqlN5K378y8N1ZEeUZtn6HevDKPBpzMlx7hbhNathWaQOVwIpKYXx9D1p
 EayixaqXf8Dkn7MfCrwCtPLfN3KwSEyCgnj5v/5w9fpQ6C6KbwkfGiFJoIMprsb+syyX
 RhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720631119; x=1721235919;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJL9ctqEQ6EbrQ1caBlXUSKz2PPn/p138eO0sdvXuFQ=;
 b=sLmVIvmGugO68D2jOTYkFGFc30eVUwrZrJTjVa0URhbasE6bNEgQDmuU2RcBFjLrqv
 8Ck2n4V1DBSknKS9wQPgS9AVxtBxZ5LPj4oApSO8JRR2tPgqgbYFuSTBwEiw962Nap/0
 WBUllOEd/r+anKmfb/llKeU/Vt8Zgyzia7+Czp8LPHvFYfQQGJDzFAXPouVi3/ZzsnaM
 XP9VD6Dl7DzN10eXn/vzk4KnM/cZ8CR9aT61lVwaL2VPhqrlW1GH8JrL0enNp22Y05FB
 DjTHkyV2lwhMlHrbibNJ1RWilEry8BiSHt0xEMkzrFt9CLnrh9/hVUAn5AD3hnD0uzPe
 YQqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3XCBH5kx+IXbtKuuXTD+oODmzcGq49YS4klyIeZjlEDTeCxbtS5Xc2Ej1vO5m1lnPzdAqhmkSBYE50FJFBWpqIW9vDZVFRNAm+0KX4tJ8
X-Gm-Message-State: AOJu0YwhUvz0UB3koXx+9dAQUTZ8g2qgcuM2I9BuXSWPTbQlmNZ4wzB7
 c0e/FUiTcGKZuslNzQza2LiwVcenN+hL3km7aR4ME+c0s/WajZg5MoaOiLjGAI0=
X-Google-Smtp-Source: AGHT+IH53Sy5DifFmLWeIWcstw3PzJyB9vgs2HFmeKb0z3bxjT4/dpNjOk8wqX3EUyluYvb65bRiiw==
X-Received: by 2002:a5d:4811:0:b0:367:8a3e:c127 with SMTP id
 ffacd0b85a97d-367cead9253mr4193011f8f.63.1720631119088; 
 Wed, 10 Jul 2024 10:05:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 10:05:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 19:05:01 +0200
Subject: [PATCH 5/5] arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-backlight-v1-5-eb242311a23e@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0
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

This is needed for the display panel to work on the Qualcomm
sc7180-trogdor-homestar and x1e80100-crd.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c9fcf9ad395..9572c337ec29 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -889,6 +889,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
+CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m

-- 
2.44.1

