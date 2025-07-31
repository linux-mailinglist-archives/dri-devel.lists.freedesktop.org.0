Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE407B1788E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F5F10E7F4;
	Thu, 31 Jul 2025 21:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ngn9A1kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3972610E2C4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:56:41 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so692708f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753999000; x=1754603800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WaU8Mr1UR0mq2VfC3Szstcef7WFJ3UI069OoWTPISF0=;
 b=ngn9A1kf7WKP7Gx8+jF2xXGjtE8yxArJ8yiq8hwKnVRW3iwb1+shLUOPn3gxMkpcWm
 r+RTcwxedBBisvMOcwzYhNLIlHIdxhkaTt9JJmxzkLmb6dUoGQfAkz8l9hTOXswJLNvX
 6Jx9eIo/qFyFiU5AqPn1keqocBVh7NXIo2l00Z60V0Xx/X7KvX0wf8i73NoILEuPWpph
 wfWGIKr4UeGmNHwoAURTGF7Tpdhh+CKuXui1vtiorUIb9TGEJ6eV3UOi3OGD40CJcIRD
 KAcZd9wibStBo0OPZCuoBKsvzVY6401cx53totKQ79UNt4lULB7Tv9LhyA7E/tTdMD4m
 sfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753999000; x=1754603800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WaU8Mr1UR0mq2VfC3Szstcef7WFJ3UI069OoWTPISF0=;
 b=ZAXty/duZ1BjjvrqOGq0UbQRjs0w6pTZBiriFVnMLxRPNiTVXbeMj8xbfsOcyfJGuU
 U0vs+t7A4F1v2zHTTbL/oRbWps27rY7y7S8KrNJzCrHM7QWZ5PMCH4NUkUqkeYVPT5Ld
 diiTIxCb2J/ogok862SfPXmL4l32fEW3jmeU0Jhgx77zaQwjjCHGvLk4fmbDi9PDGGYY
 jJiQVagYwDVnCygUGI8jVZLcEH50ywVhDHEHAia9dumCGwBpQs7b+k+M0CXyjG7aecXn
 tKhbFUTFuB3fpHZey5gXkOJZfVYqsoP8aj8roCcYIyNeF52peK/k8+2hd9nbobx6lZ4M
 e0Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbxpMCqbDPV97uSKk55SelpIlNSJBzEuEktaWB9yIoK0yvPOdzYeUAQ92MaXwzJvS5NYu3A+xXs1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza4yE/WJvHs/N8/zpDGVTn4hc5h1+nS54tXerRiOaPt5KP23q8
 6NGBfFpZv8o+cRZ5EZVvLboXCpLWJBs7DZEkrwVH56VWMplRu0Jdp0o=
X-Gm-Gg: ASbGncu/QTqWhDve6Mo/FnLjwRekATjDY5udvfPZKfrnfK0iQvlTBTOlvJOmBPuevBx
 x4+/Yiv07ILiGVkFEGoaHlCzRhfbznF6sKuP1JsYpfz1HazeOTWYiyW8kGRye/fVD20yIuD9qCQ
 PC/6Z2MQh9pT9ChxuZ3ILjLnl7V3oseoEUaXlXDDFxXkkSuvTrqQmD8H7EgXCz4q7ZC6gsXDZLX
 u7bIDk45jN16zZwza/jqfsZfQytxZ1cHMGScpnzbtsSEEpEQ5HHAdJprSvEnJRq6TJ4KVLCvckB
 AHApltzPoNqB69WZLgXPwtfFq+oAYms+eVpe8xeiNfqyNx69b4UzjmWZf5UXz/pevSzpXgCsEx7
 cleOObeQakdcxjae5j6CSJFUALpAbQqr+FyDO68pM
X-Google-Smtp-Source: AGHT+IEWRM0eQnY2E3e7z3gwrOAVP9wzgLtdNFzkY+6ZwWTgcY5DlQcLCnYF7CBwQ/f53uM33TIBWQ==
X-Received: by 2002:a05:6000:3101:b0:3b7:6804:9362 with SMTP id
 ffacd0b85a97d-3b794fd7b4dmr6256398f8f.26.1753998999649; 
 Thu, 31 Jul 2025 14:56:39 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536abb1sm86622565e9.4.2025.07.31.14.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 14:56:39 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: samsung,
 atna40ct06: document ATNA40CT06
Date: Thu, 31 Jul 2025 23:55:09 +0200
Message-ID: <20250731215635.206702-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250731215635.206702-1-alex.vinarskis@gmail.com>
References: <20250731215635.206702-1-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The Samsung ATNA40CT06 panel is a 14" AMOLED eDP panel. It is
similar to the ATNA33XC20 except that it is larger and has a
different resolution. It is found in some arm64 laptops, eg.
Asus Zenbook A14 UX3407QA.

Raw panel edid:

00 ff ff ff ff ff ff 00 4c 83 0d 42 00 00 00 00
00 22 01 04 b5 1e 13 78 02 0c f1 ae 52 3c b9 23
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
88 00 2e bd 10 00 00 1b 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc
00 41 54 4e 41 34 30 43 54 30 36 2d 30 20 01 7d

70 20 79 02 00 20 00 0c 4c 83 00 0d 42 00 00 00
00 00 22 00 21 00 1d ca 0b 5e 07 80 07 b0 04 00
e1 fa 51 cb 13 b9 3d d2 0c 01 45 54 40 5e d0 60
18 10 23 78 26 00 09 07 06 03 00 00 00 50 00 00
22 00 14 8d 5a 02 85 7f 07 9f 00 2f 00 1f 00 af
04 23 00 07 00 07 00 81 00 0b e3 05 80 00 e6 06
05 01 74 60 02 2e 00 06 00 45 40 5e d0 60 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 b0 90

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 5e2ce200025f..ccb574caed28 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -21,6 +21,8 @@ properties:
           - enum:
               # Samsung 13" 3K (2880×1920 pixels) eDP AMOLED panel
               - samsung,atna30dw01
+              # Samsung 14" FHD+ (1920x1200 pixels) eDP AMOLED panel
+              - samsung,atna40ct06
               # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
               - samsung,atna40cu11
               # Samsung 14" WQXGA+ (2880×1800 pixels) eDP AMOLED panel
-- 
2.48.1

