Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1D681CDDB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79210E867;
	Fri, 22 Dec 2023 17:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B9310E85E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33674f60184so2029709f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266963; x=1703871763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSehpxE7VFQUy0YWI/0+kwR1zv6c+kt9jZ6SUI8YNPA=;
 b=PvTXU5z3zxXHW4urEJDbdOEyMkJzekJWDrAtdeFJghnzqHZO+ch4JfzgSp7jdIQL7O
 NkgI9DBWCCANwL0VzJ4mRhmOoC/vSyLgFOQcKUeCgyjI4BxGXDXMMzoG743esN+sP51I
 uiJtmRXmNP/uCZ86LkuN8fKiFkUNikQtocsJFfoxcdOuVNi+v4pcPJNLNsiooh3fZ1ad
 2IuKivyZROcmgS68WGHI8PqrOqILJhD0AtECOulIzc+Dq7J+mM6tWo6aLkxRUbk/RYcP
 nBlOqNjS7RC6vc1ZfeZNGjYazr9YoIF0suOHDw+7ORpiEBD8H1R8IRDLeAVLTknJoBXu
 83OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266963; x=1703871763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSehpxE7VFQUy0YWI/0+kwR1zv6c+kt9jZ6SUI8YNPA=;
 b=pq3WbCnXE3HW+4HYME5TSRmJDp/xsmDNfYpK1C0rtUytG1HeS/OCQBxLRzqDRFa378
 D0pjNrbGgCeqnJeuiWHozcSPREH/4C1Yt9lQYyoPEGUeGROX+qmMMLUF3h7OxmY/rUTW
 SHVDAjvXFow8fSgIYwtbkENiQsaIjWuS6QfkrXt7nmExTdwGnTKW/ncO1EfENGNP/jQ4
 r9VEiOmKiLNzU5xbI4WIeDtvacY7ndcCP9mkMioG6w6xEuiHKpNp0NkCSCGZ/7NNlRXc
 rkuCgT3czlqWsc6UBbQ4X0DbdSfzvklJkDuDrcXPHgqiB8oE6MwUilUdUnoCcCREq7Ff
 mQuQ==
X-Gm-Message-State: AOJu0YwCs+HzWShs48pzxdKo8+UdBlat43e5nyZX8kXprle5qm0ei5w/
 oA26XF5CeLDqu5T4C+R06A==
X-Google-Smtp-Source: AGHT+IGLyV7PwzD0uMRgFbjueBNdwVNWCv/14yX+9ci/Je+qQb52KMqiGZ6KKsCnxRVJYWwB1HUPrw==
X-Received: by 2002:adf:ed47:0:b0:332:e337:7c5f with SMTP id
 u7-20020adfed47000000b00332e3377c5fmr904774wro.61.1703266963000; 
 Fri, 22 Dec 2023 09:42:43 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:42 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 29/29] ARM: dts: rockchip: Enable HDMI output for XPI-3128
Date: Fri, 22 Dec 2023 18:42:20 +0100
Message-ID: <20231222174220.55249-30-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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

changes in v4:
 - none

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

