Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F601AA8F30
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93AC10E04C;
	Mon,  5 May 2025 09:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vyB0kF7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F4110E04C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:16:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d4ff56136so4947115e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746436602; x=1747041402; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+GvHgNN9nS8EKTq3WiT7gHOgXYtnHXDfWTIDwaJfrKc=;
 b=vyB0kF7JyJyJB72f+SjzD5HstyFj9rODt9+a3S4AOfdp0PprvJ90VXGRbjgHLqrE2Q
 iU1ikV4odrSAdYsVA5aP9PcKCpDT7UT6lfz9Y4DXG16nkkuU5m/2E8SLMuwT9MIHqn58
 KQ8pSZoZ/6nsc8q2xas/GFNs71pUJq1aMGf79fLkU6Pl7qsbaXTMwyUTMw12osf4Ruki
 D+FTvC+Ywzs7EYB1bsgLy4e72QSwRKLyc1sE0rCZFiuZHfwyiFdEwioJn3FBIj1/BpTU
 IlRHZbWmqBcyGF39cnpAsSV3AJX0IzR0wkNL14vprwlCM4Gl8m8MOgpX1mhSdX3BD62L
 2AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746436602; x=1747041402;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GvHgNN9nS8EKTq3WiT7gHOgXYtnHXDfWTIDwaJfrKc=;
 b=BeBF3QoXwvIXuuwo4RfwZPqyTLU25dL3rdzmK5rlQS5G7GBcFdGyrQkwvwEnfjrXUi
 x9G1cLoGimSzSGU7BXifZeb5TO6ny2WIxVDHUHwx+TJ0Qaz1FtePcx4J4dB6z75u2haJ
 bNQubDzWzubmgfOZSYwwPEoJh48x7ZnixWqBuNmgJj9SAcCneJE9BorMnu2mw4QeBqGH
 8G6s01bN7x5b7okyETs9er95ngVWbf9sRVpLFUgl9p3DXTHfUD8FSztRPv9wNICrDBqX
 F8SjpyA4BX4zNbZwMIs+e0D5Cf0rntnOs3swYqgKDt0Go9ZmRJHKrEeiT4bpDHJPvkGz
 SC5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2qN8E9ZJ+jH/OhJU/HVyiImBM3TGqDlMjrNT5E+8uAKAk6GP5yNt6SL7PubCwbJYEzAPziehAAkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFYnJ5TrG1phRZG3MLdMR2qv7Mt6ZRWK9zbQC9TihVisDa9hWt
 I/RaYqkZgHxRLLqIFZih/e1xaSx3+UkVKlrmjh7meDcw64pnfw2PRzrfFuyLWxqos8jPFBpKIMq
 u
X-Gm-Gg: ASbGncsSoQKwKpwWcT8JAKGjG5MupfzLqBkNykwmE/dUW2Gjvs6uSKXsdCRmZ8GnUU6
 AP7vgRFOxPXRC1nzLS0La5iACH6fmkPuKrGQmUUoHN04WpFEv1zLndemebqp6zqAIb0UcWgLCne
 0eMk7+6hmf0AMSnjkwagtmnWg0BXkyFKqUv0EmZJMKQMR0a6X9UN56K8q7htAJCVnGf0LX5OdZQ
 5h9h/0azgLOzqEvDzwShsMf2X1tBvs4+pDHvFv/+JH7vTzvFPFadpNloowqPpfbf8v29ft/v2rA
 TZ32gXXAJe4QW7PEOvo2tS7TCB9oSlNYRb/YjXvSC5TJ5iqlFHSLOLzxDRk=
X-Google-Smtp-Source: AGHT+IHwXnx4n+J2n2EvRnaTe8Cay07NE0L065IdHInb8uYa78mM4hgMDYARnzzTlGxyuCFJBK6sLg==
X-Received: by 2002:a05:600c:3d90:b0:439:9a1f:d73d with SMTP id
 5b1f17b1804b1-441bbf412c1mr36857365e9.8.1746436601809; 
 Mon, 05 May 2025 02:16:41 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2aece0asm171784775e9.14.2025.05.05.02.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:16:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] drm/panel: Add Novatek NT37801 panel driver
Date: Mon, 05 May 2025 11:16:27 +0200
Message-Id: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuBGGgC/zWNQQrDIBBFryKz7oCRaEuuUrJQM20HorFqS0rI3
 SsNXb4H//0NCmWmAoPYINObCy+xQXcS4B823gl5agxKKi171WMJl7OWOHFJs/1gspFmNM4Yb73
 TUnbQpinTjddf9joenOn5avV6SHC2EPolBK6DiLRW/D/AuO9fu/Y1OJcAAAA=
X-Change-ID: 20250424-sm8750-display-panel-6b66cacb5001
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GZsCEmxTNR3TybbFW4Uny89Ft6R2/iD9rzXjkRyHWNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGIHzizxrcXFsC6PCqZV6EvICoj/THNgJz+p2o
 S1NAQqLbauJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBiB8wAKCRDBN2bmhouD
 16BzD/4j5M8/ZGKtM6q9xDxrPsNqRGsUFU3PUmkjiastBMMcmbfu/pd7AGm/e3Smkll9DKprXPA
 wsqp1VJpUW2N1Zz5g3rxVFL+TZct8/I2WDdjaAUKQsch+MOpYUYTA4cdz107YR9djRaGw6Bpqje
 GYBJY2uhxy+SsNU9Osc0CZaSUjWVXm877J2kdfTbB5SfkX7g1YdI/zw/sMqMGuXbLhS7CQ7W0Zr
 /rTmYZ0+q8yqt0JlcukZ1dRlwtDf+QVjYcxNW1OF+oNvdsdRpEO7A67HElVGZUXLS44MejYM/MF
 APJOxUM04ti/38Pub1UxYwcEhslQPX1JLncjLCa22/4TwgaowDyomylHRf/hN6OGZ9voz3P7vBM
 +gyjerlEIcp3MGHJnWg4MbULZKb7piogWRpMq/vzolJ0xjKqzhKlNP2qdG4yWuOiAQAzCuLq2J7
 1QcSza+NDl0SUNgZ60S2ut8snoj2EI+1Q17lNJz3/7S/4RSl6egc9OkhytcBfuYmhh8PXgNiw2u
 hSPoo/8Uajz28RKLJ9Kw7DdWf1ceSCL2zICaemRKfWggENmLhh5lJDHldMfltSyFtuOyjwMK7mJ
 LOz9PxPYAAhXe8sMGxFkDlD+yD+NR7nqVG1LXsrS3j0LgXuHfwKLV/JDgScrip8nPCCrIWH5hOp
 rapgL3H18LUdI1g==
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

Add driver for the Novatek NT37801 or NT37810 AMOLED DSI panel, used on
Qualcomm MTP8750 board (SM8750).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: display: panel: Add Novatek NT37801
      drm/panel: Add Novatek NT37801 panel driver

 .../bindings/display/panel/novatek,nt37801.yaml    |  69 +++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      | 336 +++++++++++++++++++++
 5 files changed, 422 insertions(+)
---
base-commit: 0273d02b2f84f645e8b8ab317722931eb96f6130
change-id: 20250424-sm8750-display-panel-6b66cacb5001

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

