Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F064818D2C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9DF10E1BC;
	Tue, 19 Dec 2023 17:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C9C10E027
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d2764c0f2so11335115e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005268; x=1703610068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LuKwY9nW5+R7DeHCNpC77KMqCvSYagjOBXGDTeiO2JI=;
 b=VcH8okqraNjtIIkfaCgMYFiP82ZcjsxQpNdtK9L7K2BJSMVnGXZ49YQc9aiv/8kC8Y
 8BcPzoQYiZ6m6ex8IwSgdv7JVSddYEw1oFoop6xWj/Hy+x+Zsfw3hpuq8MKMt3t5mEhE
 CZYqSsPdHLBykPSN9OqEMnYQ0kdCGrXsSvDkmezz2nmmyWTlJveBxRUe4alQRrUKRcEY
 JrOxN90R2Z8Gn/D3ABXN76x81867uk9I0+5svuiz/3aUIMp6ueg+JFBvlPI0erZilM3y
 tNIQeWt2pfmiTc3+hdOVpuaah/+LB7pY40eqRX1Qphjost84Dhm5JVxh7ll5cUl7qvTf
 Q8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005268; x=1703610068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LuKwY9nW5+R7DeHCNpC77KMqCvSYagjOBXGDTeiO2JI=;
 b=NKm1vpyIsnVW/7WSsJJRzW0NEjxsg1lrtcriJMPsetKVTp5z1i8WSBKwWulZsk2As3
 pqlK7xO0OXmfWnGqWInMZk03jfQAK3xb8PREhtGQV+wuzzw+Ka1MqyER4YT56gtXP3Lb
 BtWebWDCb7M9I+n+Zn/dhXYbJMQTta763UeH7J2iMpqQiMjalDpVpykAR1Mb6uDtdK/p
 pg8xd/qwoI7l2SSBeZGWOmqq56RKVQTQsfvHwS7k75CxwYxK7HpCG8jzzycvr1x/1OUt
 Npwl5568M4a3t42C8ON4r6u0A4TLk0cQT/1nGpyhlYK/y2j2k0T5uhEebdrP1sDmlNQ2
 shZA==
X-Gm-Message-State: AOJu0YxJas4o/sjryIWsZi7zXOnt/rHytB86qbohMKbtgVMFnDvSHI2Z
 SUXKZDZ5fLF9FfG7wM//GQ==
X-Google-Smtp-Source: AGHT+IHjyJcBo9pFgVWTlwbgCdScLicwo5eWIY6pSPcbe8l2hqtFhG18/pJv3xIxu5MSaFiQGfmU6A==
X-Received: by 2002:a05:600c:5408:b0:40d:3084:e66b with SMTP id
 he8-20020a05600c540800b0040d3084e66bmr127509wmb.163.1703005267997; 
 Tue, 19 Dec 2023 09:01:07 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:07 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 01/29] dt-bindings: display: rockchip,
 inno-hdmi: Document RK3128 compatible
Date: Tue, 19 Dec 2023 18:00:31 +0100
Message-ID: <20231219170100.188800-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The integration for this SoC is different from the currently existing: It
needs it's PHY's reference clock rate to calculate the DDC bus frequency
correctly. The controller is also part of a powerdomain, so this gets added
as an mandatory property for this variant.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
changes in v2:
 - clarify that the controller itself is part of the powerdomain
 - simplify clock-names
 - made power-domains property only allowed (and required) for new variant

changes in v3:
 - collect RB

 .../display/rockchip/rockchip,inno-hdmi.yaml  | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 96889c86849a..be78dcfa1c76 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3036-inno-hdmi
+      - rockchip,rk3128-inno-hdmi
 
   reg:
     maxItems: 1
@@ -22,10 +23,19 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: The HDMI controller main clock
+      - description: The HDMI PHY reference clock
 
   clock-names:
-    const: pclk
+    minItems: 1
+    items:
+      - const: pclk
+      - const: ref
+
+  power-domains:
+    maxItems: 1
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -55,6 +65,32 @@ required:
   - pinctrl-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3036-inno-hdmi
+
+    then:
+      properties:
+        power-domains: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3128-inno-hdmi
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

