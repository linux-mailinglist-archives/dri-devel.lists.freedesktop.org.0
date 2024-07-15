Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161D49313E0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220D10E36F;
	Mon, 15 Jul 2024 12:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qXNoYxJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E14410E375
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:16:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so1190729f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721045766; x=1721650566; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CwYPDTPYAwmjKmZ1/Gf11accW/fLFhZgeFXsYW2+ut4=;
 b=qXNoYxJk1EHMIYo+h9XFvAxzzohnKxDok2YABQsYObKPxNh4vw2jHwxQV65ov2RLVJ
 3byd6A7SCzvTxjYqXIHbxBP/H84+ZI11TCXhWockSWtnS2cPvTO9xi8Den43gb5yNhS3
 c+dX75I2a7Q7JcWxG++1G4MfMUdf/9NdbrDiSPlh4rIjNo5zMf9W8IEb3Tv9a3VFPIoP
 7ldgljffNCi3XzLRE4cCtyiXqJxzdDSbVFAK08iS7XVGHx2OB7D5DVPqGom8rG9OMChg
 7FzZwstf5hgU3qQzVQOkMn91v/Ga8/ta5GfZKZHiZr4eDVWECP0NWWomghY76jtDURec
 4OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721045766; x=1721650566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwYPDTPYAwmjKmZ1/Gf11accW/fLFhZgeFXsYW2+ut4=;
 b=WJH1LFiiNZGR1yz6Ob7iMAaFmUHZxflrEcWNBKbwzPNs41KhAeqqCOQYpCuKZgjpzE
 hffB+fqVJzBI0dcO6kxKpNFaWT7tYb+OblsLsvHfEgsy+npiPQ3dBcZxlwd8DOLyZwf0
 PYT8n4/mpKTqdb7St69GGHRTMe9KoddD2j5W9iq2nXNpJ6HahumxkoFZ/KlTTXo/5RVS
 P/Ii5szmaLl7YIcCRYOyOxKITTY85vtkqdlar1DW7QeC9ph8bFGQzyQ76m6LDHX82WLM
 /jdiFOZ7APHk6Dx3v4X5hBSOwzratmEwBr5dRqzZ0taMRz5s+vD9Yc1i3PIg+f0U08rJ
 Cm0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGvy7h/2KUFGo379LvdW0+IekTHJ7zpm7m9EI83P7rYAHMg7X4vmb1n7G+UZqjmVOvQryf1CJZkADPi4Vn56T14jcKbae6IcOPVtKhQ0V6
X-Gm-Message-State: AOJu0Yx0Ir6DazoJT/nNILb9Wx0w+7xPeX4ApUoGmxYRPIJQKn/hkmT1
 WOQLR2WN3IHLbtk7uzvH6fjLhWUFr7zshvBAvvAsHu+C7032MJ1+rsxsRVAc8is=
X-Google-Smtp-Source: AGHT+IGqx28NbMNvmzLw5J0w/TQ3ZQHmxkK+h/DWdncxb76LIdC5qwbxWV7jVF8Ibsfqau3YeIjlGw==
X-Received: by 2002:a5d:47c3:0:b0:367:8a3b:2098 with SMTP id
 ffacd0b85a97d-367cea46076mr15982239f8f.3.1721045765987; 
 Mon, 15 Jul 2024 05:16:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:886b:1a3a:7569:3d95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680d9771aasm6369201f8f.0.2024.07.15.05.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 05:16:05 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Jul 2024 14:15:37 +0200
Subject: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
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

The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
control over the DP AUX channel. While it works almost correctly with the
generic "edp-panel" compatible, the backlight needs special handling to
work correctly. It is similar to the existing ATNA33XC20 panel, just with
a larger resolution and size.

Add a new "samsung,atna45af01" compatible to describe this panel in the DT.
Use the existing "samsung,atna33xc20" as fallback compatible since existing
drivers should work as-is, given that resolution and size are discoverable
through the eDP link.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 765ca155c83a..5192c93fbd67 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -14,7 +14,13 @@ allOf:
 
 properties:
   compatible:
-    const: samsung,atna33xc20
+    oneOf:
+      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
+      - const: samsung,atna33xc20
+      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+      - items:
+          - const: samsung,atna45af01
+          - const: samsung,atna33xc20
 
   enable-gpios: true
   port: true

-- 
2.44.1

