Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E431586FE78
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E40910FF33;
	Mon,  4 Mar 2024 10:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d5xTq9TW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB94310FF31
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:11:54 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a446b5a08f0so525198866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709547113; x=1710151913; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eJK/ZZpOUq8+bFA/FBthzsUU3+Ts6yS8JiIZkaVwCyU=;
 b=d5xTq9TWP+xHxKHwP2yz5JzcPLCk1TkuiFxuTsKgY86x+Hu7vnXCwWPgVOKHouIa/d
 N866BtLkLhicVaKANA0dcBU2+OHt1O5RMbDSM58oqIFQjgJTh8cCvHmowtj/3Sozdj2Z
 awL/DAtUUKLHzwHAL5u0MVPpdLrw8yYkwErDX1n4FR6csydEaMtmKPFnVyglvWfYJVDr
 MuH/Odno8cMSHbr1TIzBX2AvNvkJj8ah7xA+EnB0HpHpAM8feWV07UKcV0N76+kRumyJ
 OtjSUC9Fn31WCK9xPtDR9hC2KhIdkvywRDRha/a+HJHacS9ar4xpyCjRg+J4nIJ/xP8X
 C5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709547113; x=1710151913;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eJK/ZZpOUq8+bFA/FBthzsUU3+Ts6yS8JiIZkaVwCyU=;
 b=CZzf1Q1rj7OXcbeRGIsVyl5B2IyW1brQgH9+mEUN1AXzO1y7xCDwS/2vw2Dtf8YVcS
 B/jj2OfHftGmYN0COXIdG8y1H9Zkns68xqdYS34jBGfFBxgXxuT6Chx/FbmmaE8TEOCC
 GA5DmclGfL7/+MuQfH6CBzC3pXT2YCXcD5N4Oe8ZkRqiEW/5tonpEY6VQVNnJlnNFLng
 fEDgRexctoZGlJo4oDXK/kWpFgDngg79xMvh1/zCOvJmBnWjOE/SOOi11JAX1ZHPE2SU
 Vzwne7wDteuKrzLQRd00FR1C6majDSeFSeiT83x1ENzeMmKqmVOhZxPL2TobYkWfNgaf
 DHYg==
X-Gm-Message-State: AOJu0Yyo8vssla2iW35dRz4NdZ8hIP55SCD0Af/Tj4eKrkMGDcL+ZZG6
 m4Mjo2MESjwPGnSGBlVzU62auOKRY9+XdGO5gcqUgOSvZLuX35ovNiU3rLnkvXM=
X-Google-Smtp-Source: AGHT+IHZE7yeVB2iVKBhJxbVE1pgPHbTCTtzc2QKtPQnk0+uRO6kJqqAwgSPdV91EQzA6wVWbRasbw==
X-Received: by 2002:a17:906:1155:b0:a45:73b0:bcc3 with SMTP id
 i21-20020a170906115500b00a4573b0bcc3mr705495eja.34.1709547112780; 
 Mon, 04 Mar 2024 02:11:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 ef11-20020a17090697cb00b00a44bc99cd89sm2938481ejb.42.2024.03.04.02.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:11:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] backlight: Simplify probe in few drivers
Date: Mon, 04 Mar 2024 11:11:37 +0100
Message-Id: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFme5WUC/x3MQQqAIBRF0a3IHyeoRYO2Eg00X/UpUjQiCPeeN
 DyDe1/KSIxMg3gp4ebM4azQjaB5s+cKyb6ajDKdalUnnZ33g9ftkjEFB9lqD2gs6HtDtYoJCz/
 /cZxK+QD3cVb4YQAAAA==
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OH7NMQUj9xup9rOtpZMXbczseEaMEMJgnLbgyXngbZ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5Z5dtncXmblc14GzkUUxjTcJ79A3s5elTn7Qu
 /wxqyXw/CGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZeWeXQAKCRDBN2bmhouD
 135QEACP8yEtprvbd9at0xw0H2t+hJLRhjMI+Ro3IfuXFHyJyqBFmK0784zd1uuuICJCToCMhCk
 I4lE8leqiLL2WM/2dCZLBkPdy9oXnZ4MYAi1jXXmkljBr4tyHFs6ZbaIS4SZxYWG5x/7XGok+r4
 o09ykWvDXg0SjjvwHCKAPl7MlBOQrrN3XblcBBDSvE1KKz5lUrWPTUh6o1Kkw/8Qx5oc3aSxcpq
 Qwn9pxptQ62HWVmlbIISMUUMlC/qzML+MlEx8k5JuD7ECLA6UkJ2d+E0zMOY3hkytKOFENnLiQ2
 U8X5F+gGqIv5kexKKXS/HmWAHS9vKrA3UlPjI11r/ggruvLdkc8VPOo3MfrBE4IN+yDD04d+Wez
 EEHxsWDbcwqvcWdtOY04P7roKxbtSCHBq2MoVbgHoBEbjVpZQN6ngIg44eUPTP5PFYE4sU4zLQI
 fjtkvo2wSlNdFhnHxvPx6rhgtMRgt1xF+GfNT2yJz+zVgqSbhG+i7bnHK70LCZ6Gvuxv6xo9r9/
 GDRkLun9z4dDpm3XOgWAT5vi6+5mE7p4Xm7YtEO1TDnXmk8hArv2O8iFBpNdsnCRGbnIFXlBqP6
 vZLzU5YWBVi7MfziBeYwz/u5lzxzN+HFD6INptjm55Nff+kgSDCA5zmn5nzRWtkn9bzC2xOz5Ur
 aScFZfLhOOHRV8Q==
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

Hi,

Simplify old code in few backlight drivers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      backlight: gpio: Simplify with dev_err_probe()
      backlight: l4f00242t03: Simplify with dev_err_probe()
      backlight: bd6107: Handle deferred probe
      backlight: as3711_bl: Handle deferred probe
      backlight: lm3630a_bl: Handle deferred probe
      backlight: lm3630a_bl: Simplify probe return on gpio request error
      backlight: pandora_bl: Drop unneeded ENOMEM error message

 drivers/video/backlight/as3711_bl.c      |  6 ++----
 drivers/video/backlight/bd6107.c         |  9 +++------
 drivers/video/backlight/gpio_backlight.c | 10 +++-------
 drivers/video/backlight/l4f00242t03.c    | 34 +++++++++++++-------------------
 drivers/video/backlight/lm3630a_bl.c     | 13 +++++-------
 drivers/video/backlight/pandora_bl.c     |  4 +---
 6 files changed, 28 insertions(+), 48 deletions(-)
---
base-commit: 1870cdc0e8dee32e3c221704a2977898ba4c10e8
change-id: 20240304-backlight-probe-31dee1efe662

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

