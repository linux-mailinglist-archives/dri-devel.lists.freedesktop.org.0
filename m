Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03C8449AD
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7509810E875;
	Wed, 31 Jan 2024 21:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C2D10E875
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 21:17:47 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so21902166b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 13:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735803; x=1707340603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y9SmInleJJW50YrvZW+J7AO+eV3PNYGh0Bhi/yWPzWQ=;
 b=JpzmCJ0Ud+QjS1qI6csJ/SNJQCR80tAolbS6rY+jFmgjnLGo3xLssPnBQlLlTSSN1a
 U6yO0Y+ipHYx/VytdL+G/YyawYNxZyp20tA3vg1SBr0dV4HVrLuJWND1XfmraI3ago9g
 4NwOJZQuBJvvkvXPfSyQUPq1Wnp8qDY/7DrlQILw73eryXAHE20JDL++UYKKhFUkaKzW
 miIdC6fk1PdBwdBpKoVOviauxQPeJVIYQTQ0ZClNn6esDdWhJa6lHd5yJ2YqxU6BKjdD
 oN4Syl3WzLfS1BN5VS8dML20/QYr3CI+Tm4jNWAkYnw9Uo+xYVjdkonqQ5CSma2qMizG
 D5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735803; x=1707340603;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9SmInleJJW50YrvZW+J7AO+eV3PNYGh0Bhi/yWPzWQ=;
 b=tAXKkmIxf5APY9ci5J7Eyv16WVgldcHHrVKrjFw8rFUnVc5tygVUfIkoClUidBda+s
 TWRfhiX0n7Uukto+0QIO2I5VtIaJniC8Hm4XxExI3QMjCZu4UmjCGn3TJliWvZzEt8x5
 Wr7BKhu5vfBr/se3QZkcHqMvs6Y8nPl6DCmWFr2Lpbh35UsddRFNYWbsmuVnzWweDB4O
 XchpWbZRgxH5xlR4tPN8u6vqz0HCdC+bwMvPzrCInj5QVhspgy1IH09ybMa1Ksw0ebJ4
 m0+oDeHdhD+UISMiMqfb4bwzkhAKkb14aS6M4t8vnO+DhfBBHZHbrZPehZb3R2wLQ2qw
 nMGg==
X-Gm-Message-State: AOJu0YzFFFmfBHvaHbiyXPqm3TtqGo89dLMa+2LCMzJB7hCGPZECG5i3
 zKWNhH/wTsr3rg1ueaLun1Zt2Pr9Ekl5NldW7nC2HqSuIRfVg3f/
X-Google-Smtp-Source: AGHT+IFiNtk2W8Gds5rlEUJucqr0hxZtYVlXx8CB9ZL0yV0dlIBsl7TELozRqSGeP779yRy9JMoREg==
X-Received: by 2002:a17:906:fa92:b0:a36:7291:888f with SMTP id
 lt18-20020a170906fa9200b00a367291888fmr2238279ejb.65.1706735803038; 
 Wed, 31 Jan 2024 13:16:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVj/RaJySAKCvrlAOnjJsXfF/SANVDVD9dt5oLx30qbfHP74A0GI9LD66qJ4884hbNihZ9apPn3ZAAbFpzrkaZKgLp7vGkgRR+JfUqiaGWKEBWH/cqXnosXABbvoq1H/kOLHHsMsFWwlFNDlQ9RUtX2J5fPWK2J60pu6GfS7ODbtoLOBjKyOK+6Lmrc81vyudsuR3NwFx8eCYiSWoofQE/YgtCeqMl0nmGPwYebNcKuDrqzKPzxmH4Ant5DTzhUqhNKJAOA0ExoFEflnMuRtbmQVVzv2hh/4rX77AMIeLe2rbGiY0sIPeI5Fz6sfagpo2z+4TGtYPFfjKV1sqMhwFwqHdrnEZslAwGMyk2ZAQDIweLrFkSqn44rhQW6Bw3jLWU8paue+4/I/lJYkkPSK1tOazJ79ShFvx/ZGKqSIeEBkwvgJU7ERM4S/KJuMfKuK3vKsRdVGd3C0Sne5Hs5n6aZz5MYkFCZcRqdLx5KQCz5ywXobujwvEhVmsuC3rU3OEAF/cKka0SpzdwRoXko3ORfMvZpH0DRMr7P1WxrNROWfBcosCRQ+s1KJFedfrqtTqLLpoeuTVcMnjXxqmY=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ty5-20020a170907c70500b00a35a8571419sm4040634ejc.135.2024.01.31.13.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 13:16:42 -0800 (PST)
Message-ID: <cc3a9b4f-076d-4660-b464-615003b6a066@gmail.com>
Date: Wed, 31 Jan 2024 22:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 3/6] ARM: dts: rockchip: fix rk3288 hdmi ports node
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

Fix rk3288 hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding with some reordering
to align with the (new) documentation about
property ordering.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
  keep reg-io-width together with reg
  reword
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index ead343dc3df1..3f1d640afafa 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -1240,27 +1240,37 @@ hdmi: hdmi@ff980000 {
 		compatible = "rockchip,rk3288-dw-hdmi";
 		reg = <0x0 0xff980000 0x0 0x20000>;
 		reg-io-width = <4>;
-		#sound-dai-cells = <0>;
-		rockchip,grf = <&grf>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>, <&cru SCLK_HDMI_CEC>;
 		clock-names = "iahb", "isfr", "cec";
 		power-domains = <&power RK3288_PD_VIO>;
+		rockchip,grf = <&grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";

 		ports {
-			hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+
 				hdmi_in_vopb: endpoint@0 {
 					reg = <0>;
 					remote-endpoint = <&vopb_out_hdmi>;
 				};
+
 				hdmi_in_vopl: endpoint@1 {
 					reg = <1>;
 					remote-endpoint = <&vopl_out_hdmi>;
 				};
 			};
+
+			hdmi_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.39.2

