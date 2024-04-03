Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DCC8966FC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BB61126F3;
	Wed,  3 Apr 2024 07:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WEcvUXcZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8E1126F3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:46:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33ecb04e018so4386487f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712130402; x=1712735202; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
 b=WEcvUXcZOndUEdRHVmwAiJY6uovREKY8TiWo2N82ra8l+Cp1iCDQQCiaW83m+EZQwI
 f4Jbixd91yuXbtFzPzh9UFYhkadGmFream7QaiKS419ITIX6277t5NAvNdzVLgT7tgF5
 GlptckoBYGlaiCzs8WfBi9RW7XmNz7zaCOAMKr6siOhgk6VRVD6Y8uan84m+TYQ7ARIa
 uKhkLdt+BbELuWery4Y0x9hN4jdceqQYcxYa1Nm+ub2caIhly/1v0CkFPleZuNrRNEa2
 bjvTMhT9EkQErsr2IKUAqGcpND9wy89i13PaGKoRK16e5/xDE1XtQcbMJmNK0Ld+Qqap
 JphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712130402; x=1712735202;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
 b=NDFCANiq46Ln8UqU5N85OLPvM5rZ9tP01ApA2ejXhTFQjdLnihwLJmHoboqWsOie/n
 DiO5yYKJYDL/XLz+r3Sepbft051BzMS5NR4+euP0fDA/FArKGyC9ZULvI6WNleyZ25JQ
 VNGnmdRasxcQLOXQ3vlnY6gC+dv2gXy0aqAwyQBLqkyCfoGvi5NWg8+nhF7brWvN9I3B
 w/KmA1VPUS0O0zqNysLyeW0BRXbUAu4goG8Wc6KXizshO5pQ6klLCzFuYHelRiwncc41
 oNKwNgU/Z5KL+B8+les07wqqdEQ2nDdokHVbwJl529sOd3Ts/zAZMrNdukAGasDvNDeL
 X1cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3H12saZ2/VOppsWUUROitw9HuIwU+1IEp4fDJKXGuvjG7OP+ZhBo+ADH4jTLkI9/8qc/XLvDCJJLP7+68TQ+OnJvDk4j1bvABInZHitKw
X-Gm-Message-State: AOJu0Yxr1aFgcF7DWvJWL+K2EYeXTOkJehi1146NJbbeyAQh+Xg6jyLB
 Y1kugMzhAYh81Ya0wqkoJmgxZKmeERTrq1wgvoCBi21rhP/9b8dcFQ6MKLunCFo=
X-Google-Smtp-Source: AGHT+IFpo5g4fDFTNor1Pe0aeivWgmpXOELK6V5rSuDJZCAtGNmUdkMpcWyHvS/4yOhpE/5AVNdHSw==
X-Received: by 2002:adf:f48c:0:b0:343:3538:4ee4 with SMTP id
 l12-20020adff48c000000b0034335384ee4mr10426871wro.45.1712130402349; 
 Wed, 03 Apr 2024 00:46:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 00:46:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:32 +0200
Subject: [PATCH v12 1/7] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-1-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N3wP+RQ7VRT4++7kCDqamWluNf4gtoR05YTHGQbChM4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQldDTI+SzRhJHYhYdxII9aDRXpw4ZQGmnVanvis
 mpDKm3uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXQAKCRB33NvayMhJ0aIrEA
 CAjaaiTIpkxGPcKnI9vHfiZrWIDEIV5Fc17MC23AFXn9y6vUK8I6k8t8tjcY70647b9i10lUOnDW+u
 QTmTVl2J8iqRbWeZ0NUuJkvdiCgHXbuD9N3sJ6rRln1tpGfl6tzAsO1qDOmSoFxIzN3d1LMcisZ9IG
 EVOso7m5sSQYUpp1jUnx1mXDc1GS77MvuIvE7nwv1vmrkyUh53cxhK9wrFByd2ze7/fShUf2PNzW+X
 QDeYZbKG6/wq1fPfSCgK7mOS+IjpavXy8aWAIdNoKVvxK8vcv4EuGB2L7ityGXeqEu7h6CIFVQ1VoW
 oefOSy/kh9jS6GlK+SJBfSdsjHwidkgecN077CdoDspmvB0OSJTN094d0aVTTdZKLc2zbywRzs6TIz
 1IHqKljLDCfdlcuI/8tWs0x7PH/cJuXfwYZ+soy/2LONuf8tgFdVXUv0mHoh516guNw7vOry4s08iN
 IXPc1pYAakMqeuEo4oqLXAIrcZfJtQ7vNW+0miLYAa4LSP7ZzC5fcoNpik5doys5EZDbIDAJyHBnIN
 duMPHjicb1tOpnatuxPEIypWYT9DuaN5h57UxiUJ9FuDmEXZxSM8XfrmiNACLVNJmIa/j3792PWKEE
 RfyY3lIrcz8qTs59bJCSHXyezl31JWRG8Svl2gQBFRQN62IEUU7hiTBe9aCg==
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 949537cea6be..b66b93b8bfd3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -157,6 +157,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

