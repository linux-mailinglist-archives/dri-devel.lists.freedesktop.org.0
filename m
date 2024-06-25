Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4ED916A39
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701CC10E678;
	Tue, 25 Jun 2024 14:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KfD2eLHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BEE10E673
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:26:19 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-36703b0f914so439268f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719325577; x=1719930377;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FV4CE0/NkRPUyACNkq6PofDWaP+2ii4ghj22mjGmlA8=;
 b=KfD2eLHMQs/8DO4QPT1sN8AaoQSKBNDCnbJUKUTSnDpeman0ZVajlD0RbFbHgpaACT
 uFROfisNTidNWxyqQuKe2SfwHJ2m8UXsnSQlfAeVFTZQASetKf0yCVzwxoxIXKG+EHBx
 DiOF9yuIdk01m/Blk4aFfcjF1RyUVjXj7R1DuO08zUVr8JYseEZrHp1ntA4WWjCqXgz4
 CF2s9IAgzFVrVxHHVVvGlRV6Z9fVRKEXyQkKFDGmcb+/yzmu7NzYOOWe5n6tOGTjkvy1
 qDQKioLp03x+w8ofEN1pD5DeV/e+FdhxQLagK9u2Fj8fsE1YO6r1yyXEUgHerbeIO3t1
 SOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325577; x=1719930377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FV4CE0/NkRPUyACNkq6PofDWaP+2ii4ghj22mjGmlA8=;
 b=kVXDEoxADXY0UZHv3m0OBCDqIBMJvdxEWhEXZmUcvsuUAF7aG3TRV1KaQBerhKXeIk
 o1Bu6c0OtnkzwQ/vDMcAa3TVbsqoT++tVvMBzB+rQowJ/Bps3d6jQmYqaFAN1pIRXTpz
 qHY3wp5JNv2FFs5BCBKEoYhWUtoVTqPXSigFbABaqE+iKoZz06FhkFBMboUxaF+5yyvc
 BStyeoF6euD4bWM+SDMuTQAW81TcErapnF0Go1qLekYvgQxxYuCdoYe5U59tdG7SsZ/s
 pH4sa1HDZxRo5ygNgU5f4s4NfMGgq6qS/npAas6te63HwkH6Kbg++3BnXAyIviWuAz1D
 ZC9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYzP+x3nfI9c4J2ajCStS9awWZZuCNmW8PcCG5chcnpGgmJ9vRlCwdOqD5zIR2e63kbwuqOTVBRjGS/2RqYsrkqYv0w9VBEKKcCEd57u+N
X-Gm-Message-State: AOJu0Yw6FabnBiPI/MfBqHWhITOvi6dhlT4aJIbwLtgzNW1sYA+6pXbc
 G9/5q9z1GMtemhixddWghI7N0pvdw27Qg3RkH3Ki261hWLsUPsJEHVXGZ9ZxQ+s=
X-Google-Smtp-Source: AGHT+IEVtt66qRDBgXfqzQWK/I+SwGGKWIhnesSejwYHsrjo/RZj+BSNt+XAKeYLuJg9PnW2qsOOIQ==
X-Received: by 2002:adf:f806:0:b0:362:56c2:adb4 with SMTP id
 ffacd0b85a97d-366e3294403mr7027132f8f.18.1719325577668; 
 Tue, 25 Jun 2024 07:26:17 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4247d211881sm213770685e9.46.2024.06.25.07.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:26:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add prefix for lincoln
Date: Tue, 25 Jun 2024 16:25:48 +0200
Message-ID: <20240625142552.1000988-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625142552.1000988-1-jbrunet@baylibre.com>
References: <20240625142552.1000988-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

Lincoln Technology Solutions is a design services and LCD integration
company

Link: https://lincolntechsolutions.com/
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..dc7edf8c33c1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -820,6 +820,8 @@ patternProperties:
     description: Lichee Pi
   "^linaro,.*":
     description: Linaro Limited
+  "^lincoln,.*":
+    description: Lincoln Technology Solutions
   "^lineartechnology,.*":
     description: Linear Technology
   "^linksprite,.*":
-- 
2.43.0

