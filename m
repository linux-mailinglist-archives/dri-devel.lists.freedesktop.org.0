Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E544174621
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB896E2EA;
	Sat, 29 Feb 2020 10:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B196F4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913984;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=0JJycjUZuE0K+moN1m3lrjoPSKtB8+IZld+xTNxi9ls=;
 b=EPwjHxVHLUZJT7/uxtgUSdtugRxAz0E855IVaHkTXEHUtb9D3ShaLxF5qiroDIkCos
 qDiSN8ht46dKzap0eaZNU5/5pfQ1vIb1TLaLrfcGRpSuojsLmTOxwOLkyDR2zgfN3Hmq
 ThMVh7hWVBa5XaqCmpAK8mXWLl0abNBJYwUnK1m21syL8s6B4aWxRcyV5YKwk3jwnMLq
 WUOYWysW8Zln6OxqXzyoi8P7c7RsZorLbCjmQxjc76811NdESB2PiIFy0ZMfncEFupLc
 fqksSODd8LGZZ2W0wI27++ZK7FU29eT09lpqndkM/ruj2wxB6jIArrPsbyeBu1NR6AGj
 6dCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw1SIJd2Lt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 Feb 2020 19:19:39 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC v2 7/8] MIPS: DTS: CI20: add HDMI setup
Date: Fri, 28 Feb 2020 19:19:32 +0100
Message-Id: <d28386df7983b6ecab5cceb3580fc3bd6508d3ad.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

We need to hook up
* HDMI power regulator
* HDMI connector
* DDC pinmux
* HDMI and LCD endpoint connections

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 64 +++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 37b93166bf22..efa8270afbba 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -60,6 +60,28 @@
 		enable-active-high;
 	};
 
+	hdmi_power: fixedregulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "hdmi_power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpa 25 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	hdmi_out: connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&dw_hdmi_out>;
+			};
+		};
+	};
+
 	wlan0_power: fixedregulator@1 {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan0_power";
@@ -423,6 +445,12 @@
 		bias-disable;
 	};
 
+	pins_hdmi_ddc: hdmi_ddc {
+		function = "hdmi-ddc";
+		groups = "hdmi-ddc";
+		bias-disable;
+	};
+
 	pins_nemc: nemc {
 		function = "nemc";
 		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
@@ -459,3 +487,39 @@
 	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
 	assigned-clock-rates = <3000000>, <3000000>;
 };
+
+&hdmi {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_hdmi_ddc>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dw_hdmi_in: endpoint {
+				remote-endpoint = <&lcd_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dw_hdmi_out: endpoint {
+				remote-endpoint = <&hdmi_con>;
+			};
+		};
+	};
+};
+
+&lcd {
+	status = "okay";
+
+	port {
+		lcd_out: endpoint {
+			remote-endpoint = <&dw_hdmi_in>;
+		};
+	};
+};
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
