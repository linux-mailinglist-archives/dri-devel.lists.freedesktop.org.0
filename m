Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27C57E53BF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 11:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0D410E084;
	Wed,  8 Nov 2023 10:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B5D10E4F9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 10:44:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40859c466efso48582395e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 02:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699440258; x=1700045058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGrUPXldQQyi7i1y6HTuSgGxtg81Z3Wiq2G+ebaMhpQ=;
 b=AC9m5xxL+SXhWXoWZNn6MHZ+F6ffbeR8XLml1n7dLCiQvtSbT0oNVPvFCenP/TtWaM
 FkjFE/j6cY8QN/wvITvFT5jTTsBTumyMqJdzaWWocssRy4zrGaPK+GePSa+cS4lRXUcF
 nzfuCJdAoir5FRbejixrUgKn36FjBVLRGMspbDYwYIL72OPtf4i63FM/BFTDfRxsBscK
 u0WoQynWCPAJ+rIFbnlnizEhCpqB/4/a8SHRUHVfhahvio2MwWm92L9ukudAFcsoAISu
 yrLhEBb5jLOYyLnP+6Li+WylZYqrL8JQDL4bLmgrV/PIiSx6A1lDZOIfRlyDZLGu1iUn
 8hKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699440258; x=1700045058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGrUPXldQQyi7i1y6HTuSgGxtg81Z3Wiq2G+ebaMhpQ=;
 b=ay8zjekwy5HN9WdysgATlx6tsMI5BCl1prqxUh89AH4sOCpOSx1mmdLTsH2dRedtk5
 L8MVDjNKypFiWob4JDKudqQch1UAtruv9H2+0yS/BhP7eAqPeqSAhXqxRvjEeuy+ROL2
 LYoiPgv0dSxSDACpBOzYUcmh+3mkSmu+7Hcnq2chfG2LIYQjpeZnYNFVMOauXpwrL9Vc
 eXb7YISCYo1hBJxuQ5j20yo8Q0oYW7gYZWVROfObJpSL89z3kxYpEmValoKiRn7TqE/h
 w5UmOAEtd3Q8NgB8DRwp0+SPqm7YAtqGZKS3Nwcg61w0n++ag/SjyPqE8OR9sHDnlHXV
 8P+w==
X-Gm-Message-State: AOJu0YysDCCcqlUVP7EWOZrUSV1BpucZPU+vhIKF946tlK8jqLqR7XA4
 BqPjxgXKdgn2/XG7V6BB0zPKRw==
X-Google-Smtp-Source: AGHT+IGzkWzdSSfC10gvMcrdr+HWpovdFD2tWKhVyooAAzLg7iLljfH0hHjLNTv+Bpu3NP726JCxaA==
X-Received: by 2002:a05:600c:3553:b0:406:c6de:2bea with SMTP id
 i19-20020a05600c355300b00406c6de2beamr1367091wmq.17.1699440257975; 
 Wed, 08 Nov 2023 02:44:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 02:44:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 06/17] dt-bindings: rtc: s3c-rtc: add specific compatibles for
 existing SoC
Date: Wed,  8 Nov 2023 11:43:32 +0100
Message-Id: <20231108104343.24192-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung Exynos SoC reuses several devices from older designs, thus
historically we kept the old (block's) compatible only.  This works fine
and there is no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
index d51b236939bf..bf4e11d6dffb 100644
--- a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
@@ -17,6 +17,11 @@ properties:
           - samsung,s3c2416-rtc
           - samsung,s3c2443-rtc
           - samsung,s3c6410-rtc
+      - items:
+          - enum:
+              - samsung,exynos7-rtc
+              - samsung,exynos850-rtc
+          - const: samsung,s3c6410-rtc
       - const: samsung,exynos3250-rtc
         deprecated: true
 
-- 
2.34.1

