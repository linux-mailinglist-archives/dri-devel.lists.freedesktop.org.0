Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C7792BA7A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1D410E53F;
	Tue,  9 Jul 2024 13:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tw1T1A+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF48610E53F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:05:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4266ed6c691so9102605e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720530352; x=1721135152; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RNYTbjIMKVSDiH/xJuw3Zytc6A7ArsYi4rf3qcOyoPw=;
 b=Tw1T1A+9eok3i8Q5keKzdLbnCr41uTQ33nVd+UkAug3MdGWJZ4ZbPj2s7rLRdYizj6
 jSbP5JPvSaXs+7qTTSlu+1aWcx2cOohvPMSWYeKzadxwHBH+ENxbMh6oSfw5wMC9XdEt
 LvGQ4wG+bNQxMf+10s5L4cHB4npLTIg/pZjrfrqFUaAQTQMZk0gf2n64U8UhdyTN+OdG
 bdClptIqX7CYWcD2pUVGeCDShfIZhgKgULQHd6UTNgIGwbt5ynOvETdkxSS/XXwW0pae
 4iyKXSw1EgzrMyV/reC+MN6RqZzdptGeH9f+ySS/+6RHDCVLdxblXB92x2Q1IOaTBRhG
 +gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720530352; x=1721135152;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RNYTbjIMKVSDiH/xJuw3Zytc6A7ArsYi4rf3qcOyoPw=;
 b=MOLoJNlOsLfiYr2rOk2gybEjKt4XDeAJY2bAvu/gQ2RJN2vp+AwOHAMzAaH84INfGa
 ql2DiVMgCaobdzjNzVg3yDWifLTpv93Q3TYDiZUbC+Ff2dEFSUDiG+qziCj8i1Xw583Z
 U6+Xl2JyPok/BIX14RpUyC7JDcRaeneH2tGoewDnsKwsutNGRZhRP7ldlzJaV2AMhHMD
 pvbtheocoKqB12qagz5Ce47mm9zp53M1Y+oeFJwUxnCqsB//BLOppTjpUVGNYvHZvuTN
 /9O+brDqerh9y0s3yKix64EA8ZQxNhOb1UwfeIAIQD0thN8nJokeXgdCCwFOP5JJg6bP
 oytA==
X-Gm-Message-State: AOJu0Ywi2aNt6X2rhl9jVQ/J3TJ1UY7K6UlSVX1/kzGFQsGdnjddRsWG
 D5LqFlyUJ7zbyiOhPm9Pder+wqKhqeN+vPLR1dOKxonmILsImgR5H1Ca8jm1nq4=
X-Google-Smtp-Source: AGHT+IGsaR2SEoZuwYFEX2b7nxfECWW4MF8SmNYbk80FEK7DTzyDt3HJTX3f37ZEIT193q+ytjYC0g==
X-Received: by 2002:a05:600c:178f:b0:426:5f8f:51a4 with SMTP id
 5b1f17b1804b1-426707d89e4mr16302355e9.12.1720530352023; 
 Tue, 09 Jul 2024 06:05:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:e487:133f:fb1b:7fc5:f63a:ac6f:62c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f736939sm40812395e9.37.2024.07.09.06.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:05:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] drm/panel: add support for the BOE TV101WUM-LL2 DSI
 Display Panel
Date: Tue, 09 Jul 2024 15:05:43 +0200
Message-Id: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKc1jWYC/x3NwQrCMAyA4VcZORvIZqroq8gO3ZpqwHWlqTIYe
 3eLx+/y/zuYFBWDe7dDka+arqmhP3Uwv3x6CmpohoEGpivdsK5ZZ7SwsCP8ZKtF/IJ12i7kIma
 f5I2xPwfn4hSYGVopF4m6/S+P8Th+N/uTzXUAAAA=
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=y/kAQ0zrsn4Fn6QnpD2wQSaWn2gFgqCN+RBsS7/Zy4k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmjTWq7u/vRFdMHqQR+TZnokI/grdUcCqWI2cfT
 H25cPhA1Z+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZo01qgAKCRB33NvayMhJ
 0WepEACBeuFsTRLqDMmX2eb/KI/eFXarGJKIihJqFEGfJ7B+D10dFVnA6KBs3qcf+5w2kS5j/2f
 9NJ+SMfE/P7jUDJ8sxb3SXQiCTIm2Y7hEIpqLfOl769d8rGOkmdVjaayw3Ll7JK2Xsd5/gTV4nP
 TIObSgUodofSrjd8/K3Bzp7Ax4pwzeB6Jl32BJKVfgMF76qlCE0YMMG7H1+LUh0XMOeEdTXK2B9
 b5Oy9TLfkBHsU8qhZEqSTcQ3J9aOVYaFnIue6ouybhCk1KTmsnFtfi+v0C4EUAwrYLn0peDTvLv
 ngMz1yBQudmSVaTBTuMbF1ht8ytISzbWmDNsSUYn9sMnAwd0jrrQukz/3n/BVVz8ToTMGjgTRtq
 EQZtqqdnWDUvojyjZZHp/7uQjfDKQrwD5vGdo2rVkSq2izNld88uR6glMknaf1p9cyoCCABde0V
 6BabSkH4CaMf0PO0wt3cAS1l0zCkRMkiqaNFJi4PS6Ywi04GqBtsXlLKnRGyqkDGYFyeeNmzPUG
 yIrw9qGe/ZHTvqV1veR1YnOmo47arg+cPj3lATL2wUEVcnM4GxpK+ZHz8KgcWH2Q879WLW/lXEk
 BBdLKNxCfjl56fXGiQq6ogeuJcuuN6rurfyGotbK138HRA6Kc77wNBHSpT8DXq3ZpwRXBT4+2xs
 2RK5jOLaVsJ8x8g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document and add support for the 1200x1920 BOE TV101WUM-LL2 DSI
Display Panel found in the Lenovo Smart Tab M10 tablet.
The controller powering the panel is unknown.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: display: panel: document BOE TV101WUM-LL2 DSI Display Panel
      drm/panel: add BOE tv101wum-ll2 panel driver

 .../bindings/display/panel/boe,tv101wum-ll2.yaml   |  63 ++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     | 240 +++++++++++++++++++++
 4 files changed, 313 insertions(+)
---
base-commit: 97e1ea2dc264da85da53b6ae5726a130bef690a3
change-id: 20240709-topic-sdm450-upstream-tbx605f-panel-f13d55fbd444

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

