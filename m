Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C5F8449B7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262B210FD2E;
	Wed, 31 Jan 2024 21:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE0510FD2E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 21:18:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5110fae7af5so256146e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 13:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735852; x=1707340652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R4aZnJ0HXPSCrrZnvvv03peCc+aJLdST+sQtI6Yh7ug=;
 b=N/mTH3EtOKkRpSUB/BtBG6zL+tQeR6xoVBevBJty/4L3SJ7S+6nDxsbD8XJhfTiEjE
 gqt5YyeTiS6LPvubyZgRnWNm1mWD8pcbduLUKtq7LPSpdVk6CTLsnUlJKsgF+RdbHAyo
 6uT7Q0fV+e5gy5E6JoHnTr1AX1/n4QsWUjWoy7GFjien+1HhLtGHM9FUqOSE9tA3RWrk
 8oToHObgrx5TTkHORpXUJ+H4ImhSVbQxpx+BYdm3vJOu8XB1wiUpuYkz09+Ef7C68aTl
 RzDmOIdsDDUozV174ToQByJWFzedvzvnFNprVR4xZoHk/McRzodVS5+28bOyZJhey5Iy
 8+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735852; x=1707340652;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R4aZnJ0HXPSCrrZnvvv03peCc+aJLdST+sQtI6Yh7ug=;
 b=cGbFBexUD+hzkSGzFdGOduPqj0TKDccaJEbOmw0+7xkqNT0D34qyTDLZuJ2Grw5bto
 xyJyLXvVxaukiYxkAE1/GBJF+h53cJEk4nlIwhmIb+Rks7ugFihajX+5/39+oaSwHlqK
 whWeLM0Od3Z3vfp/A3Ua7gGDA+OM34B6MFHKrnFw1e5HZ/CXEma1P276wjEsdq9DJppe
 Ls5+snM0eupnfkhsy/ZMvAEa0VPqcbna/6Fq/9R6doSEG4swSPyG0WSUZpdxvwpIY9hN
 2YgrPwvrG7Txo/n1xEBdWeXeAHYRAh9iz/Dh0sopdRPqxtpESmVBys/COyFd3rul0e/K
 aDjQ==
X-Gm-Message-State: AOJu0YzYmhuXgl5A4zUImUsYdhsvHQwDjOBWcCB+6B6jVZ2xH0eHNs07
 S41Y3XzGBF2W0tlruUJPm+pNa2F7jJzZTkXNKbxvZE/CvKSXwgFS
X-Google-Smtp-Source: AGHT+IE+0isqNh4+ujtT55m3CO8TfbUQsPsn/Em5gcobBL4NzwWM+JzTycjuSMlXff5ckL/9eHFKzg==
X-Received: by 2002:ac2:559a:0:b0:50e:d514:77bd with SMTP id
 v26-20020ac2559a000000b0050ed51477bdmr437572lfg.18.1706735852064; 
 Wed, 31 Jan 2024 13:17:32 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW+Y6j2zZMzBfnbk/bhkKrrJOnx2LOrJUHkBhyYcPiBX7GMnrzVU7PF8xepNbZlA/Tzl24kBAFvDkoBY/knhdfC/aVwufd/Onk1b7PatvAlaB9BCwDzlkeQJceUguUkRk8AKe9xsdhFH2JnSGzFSGdECPaNYaLKV/6Kexnb7hyeS1T3vgRJmk9BcOHG8h6Z+TDGC3Y+CT6CjIm/loZSAxPgoE5isYhAEru5DRsM5phL5c6vbzdCo5E3OB4DO8WZzJpJUhQl0vaOLlKfWamY2StJi7vrCvn6PTNsIvX7q20SkFlqqGrW0QVEoKUr4bx/kz2mWl0T2IFEQbmwCT8Gqe22XguZVouuNOG+tGyWhreC/XP2lc6TIn2oYtCUaWAmnyAoY3G9bec+5Q7pK015MK4JEor5WAH/W5Mrix00dlx7XJsmP3Pow5jUDpv2kJ5Y75pw1yEMn1Gx5z/4X78vLgEgEwyCmHCEfSqtrr/5cFJTzBYu/ZZj9cc1WoR3GvcgevMXd6cyPIFXFPO7LT2LwTYwgVKxhDHv2S5WLCekbGhEKzLsItaXOIgThqVcJzKg8cIgXVw4klvFxTMFx9E=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ty5-20020a170907c70500b00a35a8571419sm4040634ejc.135.2024.01.31.13.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 13:17:31 -0800 (PST)
Message-ID: <a6ab6f75-3b80-40b1-bd30-3113e14becdd@gmail.com>
Date: Wed, 31 Jan 2024 22:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 6/6] arm64: dts: rockchip: fix rk3399 hdmi ports node
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

Fix rk3399 hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
  keep reg-io-width together with reg
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 0caa842bba0e..9d5f5b083e3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -2022,6 +2022,7 @@ simple-audio-card,codec {
 	hdmi: hdmi@ff940000 {
 		compatible = "rockchip,rk3399-dw-hdmi";
 		reg = <0x0 0xff940000 0x0 0x20000>;
+		reg-io-width = <4>;
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru PCLK_HDMI_CTRL>,
 			 <&cru SCLK_HDMI_SFR>,
@@ -2030,13 +2031,16 @@ hdmi: hdmi@ff940000 {
 			 <&cru PLL_VPLL>;
 		clock-names = "iahb", "isfr", "cec", "grf", "ref";
 		power-domains = <&power RK3399_PD_HDCP>;
-		reg-io-width = <4>;
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
 				#address-cells = <1>;
 				#size-cells = <0>;

@@ -2049,6 +2053,10 @@ hdmi_in_vopl: endpoint@1 {
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

