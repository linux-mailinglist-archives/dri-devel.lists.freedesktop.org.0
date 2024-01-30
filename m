Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F6842761
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E771131BA;
	Tue, 30 Jan 2024 14:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02201131BA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 14:59:04 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5100ed2b33dso6650856e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706626683; x=1707231483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4KVEU6pfibVE5vwIMFG0DTRVvqGuby5kG2hwyGagW1Y=;
 b=UkNCFZF6zpiqOHJBkokZHwexEaHaby2M1s11PQfdnlX+z1VvJRXFVttDYqfphFOnMU
 txzpa78TPccMmMpmJq3bDOO8R3ztM1InV/luxzTDoyrRIOahoNxaIovJLXQgrveswfOC
 6YnyDn4S3B8cyUChXJVUqCDRChSgHv8G7b4p4+48wv+qccc4vj6gZBUo5r/Gyj2cfA30
 3OoUYgl9/3/bAUgPv5mQprquvH35nRBt+Q4ZKpuwFnpANeJisTYy86iZWmaUB71WfDzC
 w/BxDML7nVC9A8veXq4NRo+Euo2/hGWh6d25o/EJF01kplxqFFqC7bj7CVllOoI6f1+K
 tl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706626683; x=1707231483;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4KVEU6pfibVE5vwIMFG0DTRVvqGuby5kG2hwyGagW1Y=;
 b=d0W3Vj1Z23gMotlAvwK0vtJUdfq5yMqzuNXnCPHk5F0ZFOekflaPhkOrVM+z0YMkA5
 ne0ism5QdkU4fyjbHMaN2tek1k1LZ3UL7jJN5pnwobzUlRmIja8kwW9VHlc+gRCLDhSp
 UI8g4UcqPXj/Iaxckq7hSOFkf8Yf5O2TTbVd5qahpDF2Xtsf1exJUvVdFRKl03ahej+z
 xVrPz4RxcVp5QvRaScAXNOTAApAwysiKGvyT0jtv6i3aUr/0BMU+pNKHP1+S0WD5+pL8
 HAiFkaCwF+fBfxbmUv7+5mDKNDx7WDkd/O3+TUtT0ujJGIQ84O6dC2kAdoOJ2btMliAt
 CpCw==
X-Gm-Message-State: AOJu0YzKs3/7Qc5omshSYMXGyChm/B7pl/sY1VlCGApKG2amn9IgkyeS
 ujqMnrx1JT9Z+Aty9C9zuck/xXgefxp0Q8o95VNSfQWYVwQzxupg
X-Google-Smtp-Source: AGHT+IFjjgAuwmClX/o+HbWS8xl5uKCY8esTk4Nm5+W6LMTSgfafhSjGxp/blXmlubQ+95+DX33G+w==
X-Received: by 2002:a05:6512:603:b0:510:27a7:ccc4 with SMTP id
 b3-20020a056512060300b0051027a7ccc4mr5835024lfe.64.1706626682921; 
 Tue, 30 Jan 2024 06:58:02 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWaUrJEimFY5hJaIsjNuilaWQySKKzwncpg3VoY/OIk6fwNHm2uK4XncD/JZQcpwn9no0P0WSEZzR5MUn1hW0cKjM/lCt2KBRqOl5sDeu7MfSaUsRrXslGeT25IM/ejfROyAGJO9i4gSI5Jne/A5pUZoUlqW6eppbAbUNNk/tiDbKEeBUP+ECTvSoUeTpgT4VpvaHBPJ3ABPZ5wdSkiEnUOmio8Ajwdy/APxlVw0HBw3TMcg3jYpUvEXXsgJibDrMTWBVkZTNqtClEngjfKTUFdNRRUmFe5VZgQSBubZBobh44q0727zHc3K10Vs9YKgajk3tJaIyPCBJHfLKdqV39o63YxF7JwUALlDjOqr4a0UfTP5whmJi59i2lOGFipD3R6nUZRJsI2MSKNl9JsC10OOp0HylpGlIUnEyEeX+WjqlO7x+wMJWZlFFd2/DD4IY3/qbWJuAttWev4r/cpkfDDDKQfUCPjtFZOyGUhtUWBhZEBwvPbYPVx0yc6DZqF5ij1Jr1UfqKHOK1yH1VLGfsQtLLK5MLdpQA=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa7da47000000b0055f0c027a3esm1879542eds.30.2024.01.30.06.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:58:02 -0800 (PST)
Message-ID: <a5a6a7c6-0b71-4918-9da4-d0a4043d203a@gmail.com>
Date: Tue, 30 Jan 2024 15:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 5/6] arm64: dts: rockchip: fix rk3328 hdmi ports node
To: robh+dt@kernel.org
References: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
Content-Language: en-US
In-Reply-To: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, andy.yan@rock-chips.com, airlied@gmail.com,
 markyao0591@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix rk3328 hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index fb5dcf6e9327..749b3f965f32 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -727,7 +727,6 @@ vop_mmu: iommu@ff373f00 {
 	hdmi: hdmi@ff3c0000 {
 		compatible = "rockchip,rk3328-dw-hdmi";
 		reg = <0x0 0xff3c0000 0x0 0x20000>;
-		reg-io-width = <4>;
 		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_HDMI>,
@@ -740,16 +739,26 @@ hdmi: hdmi@ff3c0000 {
 		phy-names = "hdmi";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_cec &hdmii2c_xfer &hdmi_hpd>;
+		reg-io-width = <4>;
 		rockchip,grf = <&grf>;
 		#sound-dai-cells = <0>;
 		status = "disabled";

 		ports {
-			hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
+
 				hdmi_in_vop: endpoint {
 					remote-endpoint = <&vop_out_hdmi>;
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

