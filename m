Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09E985E26B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37F810E7F5;
	Wed, 21 Feb 2024 16:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4f7NFMLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10A110E7E0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:02:51 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4127721e3a3so3513235e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708531370; x=1709136170;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=uJcFO/xGgbOVSQxGadPSKw44B07ENxOsKQVgT1VUOcI=;
 b=4f7NFMLXyY3uKMINS9NgBXGe9vcdI4iA8eqicmiCdxpHt6+3wbxugJPUr7Bp/S2CW8
 DCi51608Eh4ItjTGVB7dy4IB/1iT9mnnqLvWm+J+ZUFUQLsyNY+0QuhSUhWWgk4ZIMVX
 v/jTbtFq1Z8AXJ2XB5yk+Bss6ukmJjtfG2I/X1ic8zBPKNtC6g43jJ+fmJkn1YC9EqHn
 ZLeDn13J1Ak3mRUIMaqT0aliUW4fdy1VA/yQ1VEcoErNqrW+ZyCmR6WtPb6htivsTbfm
 fvjwztUTo9jFwU7jGeVnbYL0mB1SUEtO3p2WvEZQaca63ltuRKotliBP3JVGF2YT6yn8
 pS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531370; x=1709136170;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uJcFO/xGgbOVSQxGadPSKw44B07ENxOsKQVgT1VUOcI=;
 b=grVX6qqp0YYIz85WaWGF5aBZYVMweAf7YdVzP27uA1v8nbev+0d62B7AY9RHYAGUYW
 VVjgCIaFdDqfJ2AHCiVkJFL/kuzZ2DUTtGau+gPANVgUnWPgIPBxgzUDAfgj9UKgT3TZ
 UiIxawd7MHZ8IIVXfum/Uo8KxagvQOZ1zj7SehZ9zJATnG4RrcxWk76NbKVuNlGrpSdK
 9ZttS+ujj2YvDed9TgbnDtYKmmwbtkBxc/vvg5Bj0rKjxops2qPGFIlJcfeWwp1wEZc1
 wjBrYyjxXQIvbxYzMGCAPH2fECO2rGC+K/5EHWVYisnSmOpEZc78r7CdRi1g9HBW0JUc
 jrng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAEkSd8D6CQpR7ohGIA8RUZ0h9kUiKLRY+gSWxuR7QuHReXcbAG6riCjN6LKdMicJBQQbCjQKmx2ck8eu78BZ7U0HPrKAQLDhdZZ58dh7U
X-Gm-Message-State: AOJu0Yz3fagwz97n+Xljr0TlcR1ReJoWxik2SR+lHf8HsFDtqZeZpJVM
 5FQyfYLzDPwuCchrQREF9DbVm9IUEfAVr4RDdqbtlUtnxE+lHWALV8s7eIDYqe/jyG7E/5Cbayd
 DNtOh+pdPjA==
X-Google-Smtp-Source: AGHT+IFnMaUiTT10wCVZyUhR3i9pyygKGuccyDW9jYOcsfg+eIDrv/na4oAAuxTKgYs+YCfAOgNSqDiyggHsfg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:54cc:b0:412:26f1:1d9b with SMTP
 id iw12-20020a05600c54cc00b0041226f11d9bmr116452wmb.0.1708531370075; Wed, 21
 Feb 2024 08:02:50 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:15 +0000
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-10-panikiel@google.com>
Subject: [PATCH v2 9/9] ARM: dts: chameleonv3: Add video device nodes
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Add device nodes for the video system present on the Chameleon v3.
It consists of six framebuffers and two Intel Displayport receivers.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../socfpga/socfpga_arria10_chameleonv3.dts   | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dt=
s b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
index 422d00cd4c74..2f48f30cb538 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
@@ -10,6 +10,158 @@ / {
 	compatible =3D "google,chameleon-v3", "enclustra,mercury-aa1",
 		     "altr,socfpga-arria10", "altr,socfpga";
=20
+	soc {
+		fb0: video@c0060500 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060500 0x100>,
+			      <0xc0060f20 0x10>;
+			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			google,legacy-format;
+		};
+
+		fb_mst0: video@c0060600 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060600 0x100>,
+			      <0xc0060f30 0x10>;
+			interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst0_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_0>;
+				};
+			};
+		};
+
+		fb_mst1: video@c0060700 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060700 0x100>,
+			      <0xc0060f40 0x10>;
+			interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst1_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_1>;
+				};
+			};
+		};
+
+		fb_mst2: video@c0060800 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060800 0x100>,
+			      <0xc0060f50 0x10>;
+			interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst2_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_2>;
+				};
+			};
+		};
+
+		fb_mst3: video@c0060900 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060900 0x100>,
+			      <0xc0060f60 0x10>;
+			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_mst3_0: endpoint {
+					remote-endpoint =3D <&dprx_mst_3>;
+				};
+			};
+		};
+
+		fb_sst: video@c0060a00 {
+			compatible =3D "google,chv3-fb";
+			reg =3D <0xc0060a00 0x100>,
+			      <0xc0060f70 0x10>;
+			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+			port {
+				fb_sst_0: endpoint {
+					remote-endpoint =3D <&dprx_sst_0>;
+				};
+			};
+		};
+
+		dprx_mst_irq: intc@c0060f80 {
+			compatible =3D "altr,pio-1.0";
+			reg =3D <0xc0060f80 0x10>;
+			interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			altr,interrupt-type =3D <IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells =3D <2>;
+			interrupt-controller;
+		};
+
+		dprx_sst_irq: intc@c0060fe0 {
+			compatible =3D "altr,pio-1.0";
+			reg =3D <0xc0060fe0 0x10>;
+			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			altr,interrupt-type =3D <IRQ_TYPE_EDGE_RISING>;
+			#interrupt-cells =3D <2>;
+			interrupt-controller;
+		};
+
+		dprx_mst: dp-receiver@c0062000 {
+			compatible =3D "intel,dprx-20.0.1";
+			reg =3D <0xc0062000 0x800>;
+			interrupt-parent =3D <&dprx_mst_irq>;
+			interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+			intel,max-link-rate =3D <0x1e>;
+			intel,max-lane-count =3D <4>;
+			intel,multi-stream-support;
+			intel,max-stream-count =3D <4>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dprx_mst_0: endpoint {
+						remote-endpoint =3D <&fb_mst0_0>;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					dprx_mst_1: endpoint {
+						remote-endpoint =3D <&fb_mst1_0>;
+					};
+				};
+
+				port@2 {
+					reg =3D <2>;
+					dprx_mst_2: endpoint {
+						remote-endpoint =3D <&fb_mst2_0>;
+					};
+				};
+
+				port@3 {
+					reg =3D <3>;
+					dprx_mst_3: endpoint {
+						remote-endpoint =3D <&fb_mst3_0>;
+					};
+				};
+			};
+		};
+
+		dprx_sst: dp-receiver@c0064000 {
+			compatible =3D "intel,dprx-20.0.1";
+			reg =3D <0xc0064000 0x800>;
+			interrupt-parent =3D <&dprx_sst_irq>;
+			interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+			intel,max-link-rate =3D <0x1e>;
+			intel,max-lane-count =3D <4>;
+
+			port {
+				dprx_sst_0: endpoint {
+					remote-endpoint =3D <&fb_sst_0>;
+				};
+			};
+		};
+	};
+
 	aliases {
 		serial0 =3D &uart0;
 		i2c0 =3D &i2c0;
--=20
2.44.0.rc0.258.g7320e95886-goog

