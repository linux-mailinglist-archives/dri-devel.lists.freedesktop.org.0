Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961E84275E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1C811318D;
	Tue, 30 Jan 2024 14:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DD71131C6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 14:58:40 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-511216374b3so106987e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706626659; x=1707231459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q/NVySBHvc0o4wdoGiVlWfEl/BNyNyErkR0wz3BaYxg=;
 b=KOAA+Zk6rd0WcrYPxj2vM8ghfYcWuFrmhE/e++RAhn6eMchC2tk5A+7+KVus5gktuT
 G0dhkHcmwFix4wTe9NQA6NVDjiGm+j2AHc0ZDSvg4asHRdSC9oZBpKRKyW7rB3cgptbt
 CwZB3/tDbLbEmMoMjAIuxwUq/1fVV6S1O0okDIdTLiPvCTtNKSF60MChqX4EvjXT5v5s
 bZlBSdZh2cEHdPMFi2rQtVYwoEtNo7YfJeO/uuzs/zQS4IKUHulzHgKEbny7oYmUnITs
 mCC1wlX4paIyUj+Q4DqaSmQUalebVA5Xp4Oc9UaVpy4Da514/PW4zxeLsyuRXDKtpHjB
 9soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706626659; x=1707231459;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/NVySBHvc0o4wdoGiVlWfEl/BNyNyErkR0wz3BaYxg=;
 b=bDUAxXDKq/+UDdDOG5fdBaMFYLnf/f2Jdj7/gsvU66cGpI5vAGJDkvUZ6j/aOX+veN
 3h+T6wjN1pW62uBNasExn2u0jTUVkEd/QlbGCaCHANPzEFQ545dpM3QbjlMtFbNMluld
 XvfUnq5uhcF9BAivBTYYmRfSQphmoQ6X7LQXdZh4QJphINaBDQJCy25KQmeotrRQWbmx
 XAlAUbkB2j9OtbpOW0KOw8GPi9w9k4HL5PcogB32LX51Gz7xtWEuSO9oWbxNescMw4dU
 P8xgvm8hAWhYkHGYSK4E3f2sq4AVGqIwl0qhu0nVof+bztr8DGd40FmYq+xjf+QYXR8X
 tsrA==
X-Gm-Message-State: AOJu0YweKQKXQsTE03d00sYtdlTlq9jbh//fHTLoKAzIWV9cfnn4XqnA
 /vsjGqKqP6xp0iQVDGmq9I/5bYVuLbxokvDwOZTW6wVhyfABHcp+
X-Google-Smtp-Source: AGHT+IFn1Z26pvSzf1A60+etpdAcRjcbap+od6ft3lxl2E7sSOHZhEaK9JTfGX8g1RPOH8q3h/609w==
X-Received: by 2002:ac2:4835:0:b0:50e:7b4d:887e with SMTP id
 21-20020ac24835000000b0050e7b4d887emr4801358lft.65.1706626659027; 
 Tue, 30 Jan 2024 06:57:39 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXtKPcxeDPDHRPcyvyciixUjP+8gxE9F9UoeTDo7kJsrWyOhFqmDwdKPVwCfKEYUPpJOm5LG+01o329oSO/CXK0fVXevvNd3hNwpoKGDQdW+O5c8GqFk7fQMph1uP6is4ZTXtj+0ofR3OLPG/JW/T65FczgaWc+i5lsqLJTzra1KQjLrmAUx4Uf6LFmUBzNrx/P+Nc1TTyjn0caviinMNAiUSFFtOCflrNF1wMr6Jv/r7XYpqYk59yjb09oFe/DHHejCJc7ou+F67/Yu/kegjf8myxnjnfEdjqL7ub3Y2qbBf2Nfgu8wn7x/LnL8ZxVxjvmCjGSafl7OGYkiXtcRmzCQM07NbIOVI5c4e5nPFOoNMYJR+eHKm+FxhxYRp+HkGDwd3vIohSxUCJEzwwO70ty6ubeDVJt3mZeh9aPOkW9yEtaZ1Fe4FHmzf2L+KREOHkg1gqGNX6pLVN8vQjDMrABxBlqcuvaPU7OUDb4/s7AD5T6vWQdDQ+LA3KWus/EsrlIRdwDP6fKO2+womw9Umlk6/igm6NG9Cw=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa7da47000000b0055f0c027a3esm1879542eds.30.2024.01.30.06.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:57:38 -0800 (PST)
Message-ID: <691c3a0e-8831-4d3b-98b8-f08235cb3b83@gmail.com>
Date: Tue, 30 Jan 2024 15:57:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 3/6] ARM: dts: rockchip: fix rk3288 hdmi ports node
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

Fix rk3288 hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index ead343dc3df1..1a63281dcb36 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -1239,28 +1239,38 @@ edp_out: port@1 {
 	hdmi: hdmi@ff980000 {
 		compatible = "rockchip,rk3288-dw-hdmi";
 		reg = <0x0 0xff980000 0x0 0x20000>;
-		reg-io-width = <4>;
-		#sound-dai-cells = <0>;
-		rockchip,grf = <&grf>;
 		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>, <&cru SCLK_HDMI_CEC>;
 		clock-names = "iahb", "isfr", "cec";
 		power-domains = <&power RK3288_PD_VIO>;
+		reg-io-width = <4>;
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

