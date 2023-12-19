Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEE818D47
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A0B10E4EE;
	Tue, 19 Dec 2023 17:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D87C10E4D8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so60209585e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005294; x=1703610094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcvRB7T9fUAwMybq5GgUQQU8bu+Y05ebI2TjIjKog/c=;
 b=azsmZhYBjjwfpSXdBz381yRsEagVGx3smVjOYDf1ReGC1UpUdaWhXLIonC/vkmopX1
 +uMssryIjLfeXw9SuOMB0ULcUflxxk2XpPNDt7qtACMU0KFuezM2OFJqywFnW/YT7+j9
 vdk18C2hjVyJHseYhMgxm+8ZzDCR/rx0O6AgnF0w5MNaTC6yxxtysvw5tmly1YcjooX8
 rpzQvfs/4mIZ7OXsUD1xqREFmfsZwI2bRaj8TmZqId8k58Tr8hC9i9wfVrTq6JBp3WuL
 R9xEWStqb3dxmVYPN6zOom78WtiVycWlyNUW3P2C1hK2F+WV/G0+PpcWD8VzoGOE0Tur
 dJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005294; x=1703610094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DcvRB7T9fUAwMybq5GgUQQU8bu+Y05ebI2TjIjKog/c=;
 b=bnKu7ANgIfF/dbuTF/cf4hICONOx7VKRioaGCYazmzAsggzTdWHydh8f73qbwgzGd+
 rRzS4RDi7L82Ja2kqFYoEKTVmiNk0d780DQR2jbr0lm7BQ0Y/OqTZ/5joTsHVYc0cS/K
 R7PhbIsLdzCvrRZnHma9fZB/r7ef6lTb5EYErvAAIC9aV5WqlQTDZmhLSGvj+jAwMHo5
 4L+Ty1l+P7xsnkxRXyidsjebz1i3l7AnDbXYwC38sMFlI+i65v9JPymf2jeLkKR+q8Qr
 EIGei/nunphZJb8HbMit21DokwCUI1C7g35WTZqp3ng3SRX4rcgEdAJidHn6j0gfXmgW
 JlQA==
X-Gm-Message-State: AOJu0Yyp0TMg/2T2R5j9Xt3MNBn2nFeN4mgAQqB9kPMsNYzUzeTefbDK
 tdudoMCeToYjZJLSCLnRJw==
X-Google-Smtp-Source: AGHT+IGrAcc7/m62H6UhRJS1mgnAg6bEsa9UDyoPGrhboqs/G4K/oMz4JwX4/2A9/ksnAk+nV2p4PQ==
X-Received: by 2002:a05:600c:354e:b0:40b:5e21:dd49 with SMTP id
 i14-20020a05600c354e00b0040b5e21dd49mr10028636wmq.119.1703005293973; 
 Tue, 19 Dec 2023 09:01:33 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:33 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 29/29] ARM: dts: rockchip: Enable HDMI output for XPI-3128
Date: Tue, 19 Dec 2023 18:00:59 +0100
Message-ID: <20231219170100.188800-30-knaerzche@gmail.com>
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
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an hdmi-connector node and enable the hdmi, display-subsystem and vop
nodes.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - no changes

changes in v3:
 - no changes

 .../arm/boot/dts/rockchip/rk3128-xpi-3128.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
index 03a97881519a..21c1678f4e91 100644
--- a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
+++ b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
@@ -47,6 +47,17 @@ dc_5v: dc-5v-regulator {
 		regulator-boot-on;
 	};
 
+	hdmi-connnector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
 	/*
 	 * This is a vbus-supply, which also supplies the GL852G usb hub,
 	 * thus has to be always-on
@@ -239,6 +250,10 @@ &cpu0 {
 	cpu-supply = <&vdd_arm>;
 };
 
+&display_subsystem {
+	status = "okay";
+};
+
 &emmc {
 	bus-width = <8>;
 	vmmc-supply = <&vcc_io>;
@@ -328,6 +343,16 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_connector_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
 &mdio {
 	phy0: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -423,3 +448,7 @@ &usb2phy_host {
 &usb2phy_otg {
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
-- 
2.43.0

