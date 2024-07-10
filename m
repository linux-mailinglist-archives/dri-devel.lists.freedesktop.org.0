Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136F292D70C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92610E846;
	Wed, 10 Jul 2024 17:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pbyVmnPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A26610E838
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:05:17 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3678f36f154so3457862f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720631116; x=1721235916; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ri1KrrJv5lGlLAnLFws19LhHfpuP+FO80ojRQ99yShw=;
 b=pbyVmnPysOuL1ASEtzbMkXQxOB8ilLNyVcVIUHgRp2vOumKUIFmpN24gPWcdgwxekb
 7N5mTcSWpzgyX6Xmo4/5XxiN9vagp57NIZ3Ar7MI1UMzxndTg2eKKA4y/AFrVs3G3mhz
 AXQXM2IvW/zA8upmj6SAfJUzeYacQh2lTfgtf17KL9l5/+48MQ7wL2en+xZxYFiCZlaC
 +FUqeqXFsUZZWqArE7SwXTfaQvTGQr16de2USKuIhgH9uboaXUDCPRiFB014dR7nckg/
 /vPvpCooeBBjQSkDAaOqECj7gkHA/Pif47Iz8KF9M4UUH9cyPZtqbSnyMWSlTNv04SG+
 HBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720631116; x=1721235916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ri1KrrJv5lGlLAnLFws19LhHfpuP+FO80ojRQ99yShw=;
 b=LucMnFQ8YUELSDIS67d9N7jWw92DJY4K2o+aOjsu0HT7YogvxVu4GrD9h9wp426MBY
 46oSzrqC34eOwjbXw+MQ3txiIUAR6CEfnILtuHT51ghZma9Zs3yICRiQmSvu6BQn6RQ8
 OG0wlZA7h4VGWRAlasr6s5XjE3QvKF/2MLVd61agtJI9/k1pg4eBE90mHn3DPV2L6Dr2
 Jfd/DmpeCpUQcJkbcIerCqJg8i6sp/wD8cEnsZI+SLK/6ozJwJzDyQoN67uIJAaIAons
 epIDntKd2v6dgXiN9WVP/lOZerUDxi5sij93vZzo4ltw2NdroA2idoJUFvnfuxSpr5vU
 tX/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB2CdlG842duqxixxsHf+WPcUdcAuOM45J4egVfaUMkSMsWwkIQmuLo5nJiZ6DUQJWivEi4mQ4zAQa3shSRVHoHEnFvqb4wAfUl3WJjjU2
X-Gm-Message-State: AOJu0Yy+LQwbLo75Tfn13tCXTYB/yDv6wPsl8JRbdD1vz7NBwYMssJc3
 /3YuTRW1WDc3kbTn9Z8TCHMpn3F3ZspjlAd6UUakQGwMYbGS3MMXp4FWcklP/HI=
X-Google-Smtp-Source: AGHT+IG2I2vfs2A9BrUdEREFeLsTLIRYJLTlw8D0se40K1gnpRKxO6FDo/ods9+emAorOvUndvejzA==
X-Received: by 2002:adf:978f:0:b0:366:e9f3:c242 with SMTP id
 ffacd0b85a97d-367cea46887mr3987846f8f.12.1720631115960; 
 Wed, 10 Jul 2024 10:05:15 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 10:05:15 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 19:04:57 +0200
Subject: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
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

The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
control over the DP AUX channel. While it works almost correctly with the
generic "edp-panel" compatible, the backlight needs special handling to
work correctly. It is similar to the existing ATNA33XC20 panel, just with
a larger resolution and size.

Add a new "samsung,atna45af01" compatible to describe this panel in the DT.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 765ca155c83a..d668e8d0d296 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: samsung,atna33xc20
+    enum:
+      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
+      - samsung,atna33xc20
+      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+      - samsung,atna45af01
 
   enable-gpios: true
   port: true

-- 
2.44.1

