Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482ACC14999
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5715410E3E6;
	Tue, 28 Oct 2025 12:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JdeGhDul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F1010E3E5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:23:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso62164725e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761654182; x=1762258982; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7AA+eU2wI/RWlo1U3OzSgcPOQwGTX/TmL/QDC7Uo/70=;
 b=JdeGhDulqAd1NkvzyLhGfxKnvnBchsQK4+yKenG50vDyEXh396wJ1aCBJfLsZnOK7n
 QjNWkFZ4NW3vplx34ZgEHlAZqZFVfA2F8BfJdIsKT7pVFQb3eGjswDL8avHEr2vEs6u2
 wmsrwDWwf7TJAv4h/o6+yvDUXcO5homjEZFPWqFcD7EtY8FYcP7KxJEzLFqC022/2QJ2
 QvKyn9JlCT3WkA0jMsZ2qZa5IbkAgklU9jW+LQCPWAauIR5ygG014xie0EAjHy//adCb
 /zlQN8Cebp4zoUeSjRR+GuxiBhq6F5vewqkqL032O7ArVTSJBcCVGrFPpn/w65H9sya/
 a21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761654182; x=1762258982;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7AA+eU2wI/RWlo1U3OzSgcPOQwGTX/TmL/QDC7Uo/70=;
 b=SX1Qs23F86qoVScsxUfyu+vSz/jbOJOgkrRZ+e09pKxsk0ovBeu4T/tBJ24Dh5oAPH
 uIi5rDw7EVOzHGFl4dBgsTJhA6SRF3WTlh65I/2/QBVxeDWUN4GRQKYPvjDtTiMjO/Iu
 Z6s7dXaVl4tMXbMow7IGP7gC6gYSTJ6tAXSQCJrb2xJMImknYH4pU0QzaRbL0JowWeYn
 L4aQOuk32uCOf2XYTsHd68cweDWe2WpTQxi1Kut0te1fBf7c3Z/nyusEWDhuGYJYwVhF
 qW+rk8Nli4UsbMlx0zMB2ZrebSYigcb3Sh9ZofYpMYtFD3JX5yypeIhkY/ac+9pdAzy5
 jK4A==
X-Gm-Message-State: AOJu0Yw0H+6PpxHarD7PACTldL+gpq4P/8rdz/rgyxW2NXVixpbNia4B
 0CkRCwzww0z9QlJSmXDd1FneZmhMVDlxgV6+WyQr9YZ4RYyyX4BLPANNVY/J2PJIKlg=
X-Gm-Gg: ASbGnctiGNERwZZmPaW/EvC1hf6KZm4gLyQoWSt4oUcXRDLmkr4RGb0NA9vf7wtq0ON
 uQdpyyJ+49dCKjSVhtFoWm67lOc+vmfshpBfrdFm6UOwZVZ5SBX2z3Xlk98RL4wykkTzj8GCXGz
 nPxetIKCsjHjiLNplija4ZLnfwMRjx7b1JxmAtojy9rfShYKmOmFyGJ1q4gHaoG8lrkC1+mgFsL
 V6bmb8PkTUiRqqWm/YCDpzcr2gXfoZAhOI6GD1o3/vcvRqd/hIuGSnkw1hwN1ZDvaNpt/q6/cpN
 NmRTpCeg+o+WyAiT8TXSd5LtPPrTcDbRzmRJzPcnPuETb3uly92OPNqXEsYSOkjknwuxAu9Yonn
 XQjqVcFNioft/3kYW5aJ2C6YyaM24CJ+zwqp1FD0xdFLV+ydHlWzMnfrvnwyYB9etr/OQgXlLBg
 ==
X-Google-Smtp-Source: AGHT+IEp5j1iQ96MMXAlx70JaD765dVDYKZjqUaSOrp+MJb+kKKrMyzgoJCPGSfOUySwQ9s68QlWPQ==
X-Received: by 2002:a05:600c:4ecc:b0:45d:e6b6:55fe with SMTP id
 5b1f17b1804b1-47717e75d4amr36383815e9.34.1761654182221; 
 Tue, 28 Oct 2025 05:23:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7dcsm20851329f8f.11.2025.10.28.05.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 05:23:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 14:22:48 +0200
Subject: [PATCH] dt-bindings: display: panel: samsung,atna33xc20: Document
 ATNA60CL08
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-drm-panel-samsung-add-atna60cl08-v1-1-73123789fcdb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJe1AGkC/x3NQQqDQAxA0atI1g2MA8rYq5Qu0km0AU1lUosg3
 t2hy7f5/wCXouJwbw4o8lPXj1W0twbym2wSVK6GGGLXhpiQy4IrmczotPhmExIz0teoD3kOCcN
 Lhr4bZMyJoWbWIqPu/8XjeZ4Xa1TdNHIAAAA=
X-Change-ID: 20251028-drm-panel-samsung-add-atna60cl08-0be9659efc8d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=CEjvF/rXJZsXAc246Is0WAGvmoGx4JsfoR3gcf5uF/A=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpALWfbbMRU3Ia07dT7ta2MsUExokqWb0XS4gM7
 GNR01YFppaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQC1nwAKCRAbX0TJAJUV
 Vl79D/9D58qh5dOtmUd/ocHKcOLp0PrQFraOGu0xPZlTe91z+FSX7UrtMZcZRygCMgrUNXn7FWp
 xLVgBXbJOZKu86PjRe7CIIfXf/4GjSTS25VMb/MwEIo6OK6vrUqX6CIz6fQ9Ild/XCoOHpDx67N
 NxranSt6StuVYDzolc9jwRpG7Ffy/aUjF4M6U1VGoEfTPHBrv6ZtaYsmBtvMULgD4QmXCwoBhYD
 LE2cyv2ZEdsstTDQhdXgAHZYwjXq6cgJFQj2ijmzIlkQm+TK9K9gGHasw/sJdeDmHBGRv9OhQJU
 5uD2j2zUd1TWXtDvl1FgEZq566YMhdxsxd+T0VwMHuiQj69ak9dUGbTIRxFuEkTX1hlOQGr/bV+
 XijWh786G0vKgGFRhOWLz5IdjQAz49Xf1Ijz8X9MQkhxZyTTazr9AFTast9nG17tjnRu6FKktLF
 tdWDT+ngSjuJHcxkVb6CZ/EAl+bzC5qwBBvVxTO5GldFCFzLrk0ab198mxdaEuB0PDgJFiv4Mt8
 18sYHPYJ1IsaP4Su7VY/I39Ll7DIvmq884qOvcoK1zSybquBzCMCfH0wOP4rsUkrL7EaJXoVYYQ
 40uXRQBJQUHVX1vOEWnwZNIgaTaGit2ZsHxlZTvvjI7EvatzAa+H3sBv/6Tuc5zyjWSvRM3rQkB
 cT7L3WWx6nYzZfg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

The Samsung ATNA40CT06 panel is a 16" AMOLED eDP panel. It is similar to
the ATNA33XC20 except that it is larger and has a different resolution.
It is found on Qualcomm Glymur CRD platform.

Raw panel edid:

00 ff ff ff ff ff ff 00 4c 83 a6 41 00 00 00 00
00 20 01 04 b5 22 16 78 03 0b d1 af 51 3d b6 23
0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 cb fe 40 64 b0 08 18 70 20 08
88 00 58 d7 10 00 00 1b cb fe 40 64 b0 08 c8 7a
20 08 88 00 58 d7 10 00 00 1b 00 00 00 fd 00 30
78 da da 42 01 00 00 00 00 00 00 00 00 00 00 02
00 00 00 00 19 96 c8 46 1c 5e c8 00 00 00 01 4c

70 20 79 02 00 20 00 0c ba 41 59 a6 41 00 00 00
00 00 16 00 21 00 1d 48 0d 98 08 40 0b 08 07 00
f2 ea 50 d7 d3 b6 3d 42 0b 01 45 54 40 5e d0 60
18 10 23 78 26 00 09 07 06 03 00 00 00 50 00 00
22 00 14 e7 f3 09 85 3f 0b 63 00 1f 00 07 00 07
07 17 00 07 00 07 00 81 00 1f 73 1a 00 00 03 03
30 78 00 a0 74 02 60 02 78 00 00 00 00 8d e3 05
80 00 e6 06 05 01 74 60 02 00 00 00 00 00 5f 90

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index ccb574caed2838273e84c6412ef128e74ec3681a..f1723e9102525d6ca4a0e53033f0769b1df107ca 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -33,6 +33,8 @@ properties:
               - samsung,atna45dc02
               # Samsung 15.6" 3K (2880x1620 pixels) eDP AMOLED panel
               - samsung,atna56ac03
+              # Samsung 16.0" 3K (2880x1800 pixels) eDP AMOLED panel
+              - samsung,atna60cl08
           - const: samsung,atna33xc20
 
   enable-gpios: true

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-drm-panel-samsung-add-atna60cl08-0be9659efc8d

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

