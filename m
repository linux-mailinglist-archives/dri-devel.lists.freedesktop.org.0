Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3428449AA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4742E10FCF6;
	Wed, 31 Jan 2024 21:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E002410FCF6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 21:17:27 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a366ad7ad45so17509466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 13:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735786; x=1707340586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7WAHmXqhwFGwnUoVVTvOT31zVVDiv5ormXLbiLzvJr0=;
 b=Mn1PtPlSoQDIW7Vfo02E0F9okP1Pm5uIixKO9SSjfH5YYrWjrnpGQsglEn3QCmzTV8
 YxfPXJIDAWU0jQqJ9mFs9RPbOICtQhDlf5274CVlYRTS63AOxjr2/MlYfviCRg/D3mjL
 gcM6TFmhkLgUIryHk6Cf9fXnPSgRnsZfi5J2haYu+ku4uQdFQM2f2rmaH0r4gjunl/Pw
 P1esOYivpcm1BKii0/beqj27+V7fKxQ5WnBg2zMo0WHZ3Q3IUHbvAIGKiNhuLJbtztqM
 Yw9+sBNpom5KuK5EKvsE00Wo7A+Sbhv3RbCjnzvg9VBPLAylmuRbaGwdG36E7RsepdMo
 tccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735786; x=1707340586;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WAHmXqhwFGwnUoVVTvOT31zVVDiv5ormXLbiLzvJr0=;
 b=B6vMbkg3VD+3TzSVaWlORq2l3WreiK/mpFd2VNx1iP7gJDZugTeC/8EDXDUrvE7FNY
 ELKgo5Rr5SN4TQcm35rWsVNUsXLQNCS76xPsoqBv8CU69mTVvzXKC/g2VIhK/6kQRDFB
 Dc63szr2CrMuVNs/Jm9At9uPTekk4C/PcbakPIPkTufbVTeJ3X9aFmL18ny/1qDQm/gA
 LcVYs4VN8vZpICQPiAcNAtRnytmhCM/O9JMXIzm5ORwNPocTdXHqLPb35ls/JPyLC+9R
 N5br9e/YoLQuUuWkl90jU9i5pjE3G6TUXd45h4DVHSpMPNp/pi99NHR1K3lyecxBaZJg
 mZyQ==
X-Gm-Message-State: AOJu0YyyoArP5eV1JWCNmhB4dzE9wmGYrcf9Mg6dv9Jtt66uuLLXc7Oh
 4vi3lN7msUFe+gfutudVw1QfqDnhDAFAbeW76XZmN/HLos1liInC
X-Google-Smtp-Source: AGHT+IG1BFq7Pp2hw0FCVuWw6rIJcYrAM9nq28Kr5azCiS9LKzq/m7hwGTr5nk2ETTNoY9f8m7yc6A==
X-Received: by 2002:a17:906:da06:b0:a35:edda:ca8b with SMTP id
 fi6-20020a170906da0600b00a35eddaca8bmr1992854ejb.76.1706735786182; 
 Wed, 31 Jan 2024 13:16:26 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVc2fs4IrBG2YWUC5LcZZStHjB+RqDtXVILboDRP8Y2Xm1IoMKnaO2pMi/h4SQUCrAruBblHzoOgDf+Aud6ulOos3QKpvTrOPDbWDrqrs4HoncHMRv6melTKIpllEW8OtFwnN33yPaEFX9kPiIJVFaz94d8Y4gJLNprrxIiTqgEwAzZF7DeO5/IO+fEX+0/dhCvlliQGm9DqOzAUU99bBQXn8o6SMzo0Hgoqm5QeA2k8zgHOry8CgP0VBNfmF6GRhoZHfwmUaL8uBJq2XbfcWxvunXQBbU7jqJRykZJI7KloTyZpPzrwxL2fFFCF6Bhxt2IUP/Th38ZoCpdRzQ6aMCLFa2oh+q58pPry2SEjx389pdHUxDhLD1zBehNndrSw2rsYkLQxOTTyGj1urAZFRt7Si96ewe9IW1EE5T+1hm6QZu0b3o05WuKCL0qn+GsDGuC/NhYfkqoWV0flggiV7whpyZ47IjqSXr14Zgh9zg3S1LmTND+9p305Lhk7uaXtn3un3AdZ6x3agLqjRDz/BlXoxQTGjcJ4DNSh7kyURpMcQ7mZNxtPNxNIrdB1QW1nlxVxlpJ1FUsiiLxuuc=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ty5-20020a170907c70500b00a35a8571419sm4040634ejc.135.2024.01.31.13.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 13:16:25 -0800 (PST)
Message-ID: <5c45527a-e218-40a3-8e71-a5815417e5f7@gmail.com>
Date: Wed, 31 Jan 2024 22:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 2/6] dt-bindings: display: rockchip,dw-hdmi: add
 power-domains property
To: robh+dt@kernel.org
References: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
Content-Language: en-US
In-Reply-To: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: daniel@ffwll.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 tzimmermann@suse.de, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 andy.yan@rock-chips.com, markyao0591@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most Rockchip hdmi nodes are part of a power domain.
Add a power-domains property and include it to the example
with some reordering to align with the (new) documentation
about property ordering.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changed V2:
  keep reg-io-width together with reg
  explain reordering
---
 .../bindings/display/rockchip/rockchip,dw-hdmi.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 391c2a7e79de..af638b6c0d21 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -94,6 +94,9 @@ properties:
       - const: default
       - const: unwedge

+  power-domains:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

@@ -138,16 +141,18 @@ examples:
     #include <dt-bindings/clock/rk3288-cru.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3288-power.h>

     hdmi: hdmi@ff980000 {
         compatible = "rockchip,rk3288-dw-hdmi";
         reg = <0xff980000 0x20000>;
         reg-io-width = <4>;
-        ddc-i2c-bus = <&i2c5>;
-        rockchip,grf = <&grf>;
         interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
         clock-names = "iahb", "isfr";
+        ddc-i2c-bus = <&i2c5>;
+        power-domains = <&power RK3288_PD_VIO>;
+        rockchip,grf = <&grf>;

         ports {
             #address-cells = <1>;
--
2.39.2

