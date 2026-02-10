Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM1yD8iYimk8MQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B511651A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FE910E4AA;
	Tue, 10 Feb 2026 02:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mf1hBEFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23D410E4A9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:32:36 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-89577f866d6so31523106d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 18:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770690756; x=1771295556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OjIpriE1D5q9CrKvcFy05qi1JMSgSn4z95yFd7boFs=;
 b=mf1hBEFFhikO2UbLqxeePc278+Ji0VWk8fjMgKA97/StMqOqxCWf8Mim23NAVEDQVY
 BPCGgKUXnUebl+8Xcoh/KoGcpJ4ZKimPIlFvNlyy6XhSgVeVWd+EZgHy9erINPYkk5+G
 qup1Aq902dfW+quvoN7TjmrB8XyhfQs5N2IuE6PWgN35NfuUEkYpncqAeo5qiS3J3GYK
 Ul9FFR5b/+3O3AerJVT9ii5KVx/uo5WB7cDOeUuClNda+nX8tBPUgsAoKuB5IsF/tiX2
 7LaUL5QOpp+l+wqM0bynSMjUvTqK+mFb//ZCgLYOuLw8yBKlOJRDToRtWMDLBMMh9dip
 A0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770690756; x=1771295556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8OjIpriE1D5q9CrKvcFy05qi1JMSgSn4z95yFd7boFs=;
 b=fLZgzRSJ25QtaJxgyQ8WHeWQLTW1FjqABrez3dq0fXWnflKPtUA0jvbvgRTXqv7mRF
 19RQ3nNHcGW8b3/0S3uKwi+99YIIRuRa8L8rJgui9k+mNqWyBnmNz1xRRJsTmmfqW6A9
 fLX4i56aMt4r207PmdMlYvnH674VSVIqLuFpufqxkA2QxhaPNhatlELe48LHggWdBBFR
 hI2EykHg4SnsRRYg0J73ZSbAektX1VvZfRPXfkEzORn2R5C7T4SAuG54FfmOLiFEUkE6
 9OteDiPsZYzhIzOnMqlYu783QtIyrD/zmTvvhkDHAkwlwkvPvOe82Jv2EMXB5zvYNCph
 fLyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvnkfJcsPslAA7WJpnDrY+J72KKos199cL+oeRoUptwWfFLLyuePnRwnrL/5xyn334412JFxoywi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKQKGMkGhW+DwzNmBGwmoQAWJzl9V/w8+ROYlTqLlVarDJRSXA
 siwuIT+N29tzzZ2Za+Qd6gfZSO3XwxJwM2mr95dfn2riyZ+YQl9P7o6FRx8YUA==
X-Gm-Gg: AZuq6aKS3woAiO2Jp3o5L2qshzK1ptJAx1BX3c/PCnbSLN7lha9MQXNUHrkL0AvmI74
 JvmrVFet+x9NFTjLxx6119TyMTjDAzuCBeygkOlp0rpF+ROjSXeDornLe0SnuqL1SC+TEME4q2W
 HGYGbgfI3ue3LhfpmEFzTmWJ4/l7ynBz0wCimC/bNZW3vaM7+VvK5TT92Z+EbEAb7jNWYM61jS/
 l6bFQ6V8hvrzPmfRjw1McvBh7TFClZrHdBkJS808Onceb21/OFzaLBNMPz6fK3JarUmGh7Uxvg/
 cbYklfFfK3CPC6H3JxbhDNzswY/ShNDizQNQWzAWT0YkgGbMH2AM3wQ15oKfJbdwuyGnyxehxMv
 OFmScvGEfCFlNnfi8RUY9q/Ff+fhnxXwjKfl/bwN8Gv0H55whXrAYglFvUO6NIZtBeByrNfSjMD
 Gpwil/Q0Efwl2eptH2Ts+9N26V3hatt+ZrMvxLtdeVWCGZUyJDXsgsGdOugC5ffm/fboL4h/YUW
 +V5+IL+LsZAu5Q=
X-Received: by 2002:a05:6214:f2a:b0:896:fa81:5652 with SMTP id
 6a1803df08f44-8970d55dadamr12177806d6.34.1770690755710; 
 Mon, 09 Feb 2026 18:32:35 -0800 (PST)
Received: from localhost
 (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8953c03d704sm89679786d6.27.2026.02.09.18.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 18:32:35 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 5/6] arm64: dts: qcom: sdm670-google: add common device tree
 include
Date: Mon,  9 Feb 2026 21:32:59 -0500
Message-ID: <20260210023300.15785-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210023300.15785-1-mailingradian@gmail.com>
References: <20260210023300.15785-1-mailingradian@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BE6B511651A
X-Rspamd-Action: no action

The Pixel 3a XL can be supported by reusing most of the device tree from
the Pixel 3a. Move the common elements to a common device tree include
like with other devices.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 ...le-sargo.dts => sdm670-google-common.dtsi} |  17 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 710 +-----------------
 2 files changed, 20 insertions(+), 707 deletions(-)
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
similarity index 97%
copy from arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
copy to arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 2e86bed9ea8c..29efff444845 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -6,8 +6,6 @@
  * Copyright (c) 2022, Richard Acayan. All rights reserved.
  */
 
-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
@@ -28,9 +26,6 @@
 /delete-node/ &gpu_mem;
 
 / {
-	model = "Google Pixel 3a";
-	compatible = "google,sargo", "qcom,sdm670";
-
 	aliases { };
 
 	battery: battery {
@@ -38,7 +33,6 @@ battery: battery {
 
 		voltage-min-design-microvolt = <3312000>;
 		voltage-max-design-microvolt = <4400000>;
-		charge-full-design-microamp-hours = <3000000>;
 	};
 
 	chosen {
@@ -50,11 +44,8 @@ chosen {
 
 		framebuffer: framebuffer@9c000000 {
 			compatible = "simple-framebuffer";
-			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
-			width = <1080>;
-			height = <2220>;
-			stride = <(1080 * 4)>;
 			format = "a8r8g8b8";
+			status = "disabled";
 		};
 	};
 
@@ -518,8 +509,6 @@ rmi4-f01@1 {
 
 		rmi4_f12: rmi4-f12@12 {
 			reg = <0x12>;
-			touchscreen-x-mm = <62>;
-			touchscreen-y-mm = <127>;
 			syna,sensor-type = <1>;
 		};
 	};
@@ -534,7 +523,7 @@ &mdss_dsi0 {
 	status = "okay";
 
 	panel: panel@0 {
-		compatible = "samsung,s6e3fa7-ams559nk06";
+		// compatible is provided in specific device trees
 		reg = <0>;
 
 		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
@@ -544,6 +533,8 @@ panel: panel@0 {
 
 		power-supply = <&vreg_l6b_3p3>;
 
+		status = "disabled";
+
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&mdss_dsi0_out>;
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 2e86bed9ea8c..7a3e24997232 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -1,715 +1,37 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * Device tree for Google Pixel 3a, adapted from google-blueline device tree,
- * xiaomi-lavender device tree, and oneplus-common device tree.
+ * Device tree for Google Pixel 3a (non-XL).
  *
- * Copyright (c) 2022, Richard Acayan. All rights reserved.
+ * Copyright (c) 2023, Richard Acayan. All rights reserved.
  */
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-#include <dt-bindings/power/qcom-rpmpd.h>
-#include "sdm670.dtsi"
-#include "pm660.dtsi"
-#include "pm660l.dtsi"
-
-/delete-node/ &mpss_region;
-/delete-node/ &venus_mem;
-/delete-node/ &wlan_msa_mem;
-/delete-node/ &cdsp_mem;
-/delete-node/ &mba_region;
-/delete-node/ &adsp_mem;
-/delete-node/ &ipa_fw_mem;
-/delete-node/ &ipa_gsi_mem;
-/delete-node/ &gpu_mem;
+#include "sdm670-google-common.dtsi"
 
 / {
 	model = "Google Pixel 3a";
 	compatible = "google,sargo", "qcom,sdm670";
-
-	aliases { };
-
-	battery: battery {
-		compatible = "simple-battery";
-
-		voltage-min-design-microvolt = <3312000>;
-		voltage-max-design-microvolt = <4400000>;
-		charge-full-design-microamp-hours = <3000000>;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		framebuffer: framebuffer@9c000000 {
-			compatible = "simple-framebuffer";
-			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
-			width = <1080>;
-			height = <2220>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		autorepeat;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&vol_up_pin>;
-
-		key-vol-up {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
-		};
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-
-		mpss_region: mpss@8b000000 {
-			reg = <0 0x8b000000 0 0x9800000>;
-			no-map;
-		};
-
-		venus_mem: venus@94800000 {
-			reg = <0 0x94800000 0 0x500000>;
-			no-map;
-		};
-
-		wlan_msa_mem: wlan-msa@94d00000 {
-			reg = <0 0x94d00000 0 0x100000>;
-			no-map;
-		};
-
-		cdsp_mem: cdsp@94e00000 {
-			reg = <0 0x94e00000 0 0x800000>;
-			no-map;
-		};
-
-		mba_region: mba@95600000 {
-			reg = <0 0x95600000 0 0x200000>;
-			no-map;
-		};
-
-		adsp_mem: adsp@95800000 {
-			reg = <0 0x95800000 0 0x2200000>;
-			no-map;
-		};
-
-		ipa_fw_mem: ipa-fw@97a00000 {
-			reg = <0 0x97a00000 0 0x10000>;
-			no-map;
-		};
-
-		ipa_gsi_mem: ipa-gsi@97a10000 {
-			reg = <0 0x97a10000 0 0x5000>;
-			no-map;
-		};
-
-		gpu_mem: gpu@97a15000 {
-			reg = <0 0x97a15000 0 0x2000>;
-			no-map;
-		};
-
-		framebuffer-region@9c000000 {
-			reg = <0 0x9c000000 0 0x2400000>;
-			no-map;
-		};
-
-		/* Also includes ramoops regions */
-		debug_info_mem: debug-info@a1800000 {
-			reg = <0 0xa1800000 0 0x411000>;
-			no-map;
-		};
-	};
-
-	/*
-	 * The touchscreen regulator seems to be controlled somehow by a gpio.
-	 * Model it as a fixed regulator and keep it on. Without schematics we
-	 * don't know how this is actually wired up...
-	 */
-	ts_1p8_supply: ts-1p8-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "ts_1p8_supply";
-
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&pm660_gpios 12 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3312000>;
-		regulator-max-microvolt = <3312000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/*
-	 * Supply map from xiaomi-lavender specifies this as the supply for
-	 * ldob1, ldob9, ldob10, ldoa2, and ldoa3, while downstream specifies
-	 * this as a power domain. Set this as a fixed regulator with the same
-	 * voltage as lavender until display is needed to avoid unneccessarily
-	 * using a deprecated binding (regulator-fixed-domain).
-	 */
-	vreg_s2b_1p05: vreg-s2b-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vreg_s2b";
-		regulator-min-microvolt = <1050000>;
-		regulator-max-microvolt = <1050000>;
-	};
-
-	cam_front_ldo: cam-front-ldo-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "cam_front_ldo";
-		regulator-min-microvolt = <1352000>;
-		regulator-max-microvolt = <1352000>;
-		regulator-enable-ramp-delay = <135>;
-
-		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam_front_ldo_pin>;
-		pinctrl-names = "default";
-	};
-
-	cam_vio_ldo: cam-vio-ldo-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "cam_vio_ldo";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-enable-ramp-delay = <233>;
-
-		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&cam_vio_pin>;
-		pinctrl-names = "default";
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pm660-rpmh-regulators";
-		qcom,pmic-id = "a";
-
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vph_pwr>;
-		vdd-s3-supply = <&vph_pwr>;
-		vdd-s4-supply = <&vph_pwr>;
-		vdd-s5-supply = <&vph_pwr>;
-		vdd-s6-supply = <&vph_pwr>;
-
-		vdd-l1-l6-l7-supply = <&vreg_s6a_0p87>;
-		vdd-l2-l3-supply = <&vreg_s2b_1p05>;
-		vdd-l5-supply = <&vreg_s2b_1p05>;
-		vdd-l8-l9-l10-l11-l12-l13-l14-supply = <&vreg_s4a_2p04>;
-		vdd-l15-l16-l17-l18-l19-supply = <&vreg_bob>;
-
-		/*
-		 * S1A (FTAPC0), S2A (FTAPC1), S3A (HFAPC1) are managed
-		 * by the Core Power Reduction hardened (CPRh) and the
-		 * Operating State Manager (OSM) HW automatically.
-		 */
-
-		vreg_s4a_2p04: smps4 {
-			regulator-min-microvolt = <1808000>;
-			regulator-max-microvolt = <2040000>;
-			regulator-enable-ramp-delay = <200>;
-		};
-
-		vreg_s6a_0p87: smps6 {
-			regulator-min-microvolt = <1224000>;
-			regulator-max-microvolt = <1352000>;
-			regulator-enable-ramp-delay = <150>;
-		};
-
-		/* LDOs */
-		vreg_l1a_1p225: ldo1 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1250000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l2a_1p0: ldo2 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l3a_1p0: ldo3 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l5a_0p848: ldo5 {
-			regulator-min-microvolt = <800000>;
-			regulator-max-microvolt = <800000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l6a_1p3: ldo6 {
-			regulator-min-microvolt = <1248000>;
-			regulator-max-microvolt = <1304000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l7a_1p2: ldo7 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l8a_1p8: ldo8 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-enable-ramp-delay = <250>;
-			regulator-always-on;
-		};
-
-		vreg_l9a_1p8: ldo9 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l10a_1p8: ldo10 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l11a_1p8: ldo11 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l12a_1p8: ldo12 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l13a_1p8: ldo13 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l14a_1p8: ldo14 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l15a_1p8: ldo15 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l16a_2p7: ldo16 {
-			regulator-min-microvolt = <2696000>;
-			regulator-max-microvolt = <2696000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l17a_1p8: ldo17 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l19a_3p3: ldo19 {
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3312000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pm660l-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vph_pwr>;
-		vdd-s3-s4-supply = <&vph_pwr>;
-		vdd-s5-supply = <&vph_pwr>;
-
-		vdd-l1-l9-l10-supply = <&vreg_s2b_1p05>;
-		vdd-l2-supply = <&vreg_bob>;
-		vdd-l3-l5-l7-l8-supply = <&vreg_bob>;
-		vdd-l4-l6-supply = <&vreg_bob>;
-		vdd-bob-supply = <&vph_pwr>;
-
-		/* LDOs */
-		vreg_l1b_0p925: ldo1 {
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <900000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l2b_2p95: ldo2 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l3b_3p0: ldo3 {
-			regulator-min-microvolt = <2850000>;
-			regulator-max-microvolt = <3008000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l4b_2p95: ldo4 {
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l5b_2p95: ldo5 {
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l6b_3p3: ldo6 {
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l7b_3p125: ldo7 {
-			regulator-min-microvolt = <3088000>;
-			regulator-max-microvolt = <3100000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		vreg_l8b_3p3: ldo8 {
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3312000>;
-			regulator-enable-ramp-delay = <250>;
-		};
-
-		/*
-		 * Downstream specifies a fixed voltage of 3.312 V, but the
-		 * PMIC4 BOB ranges don't support that. Widen the range a
-		 * little to avoid adding a new BOB regulator type.
-		 */
-		vreg_bob: bob {
-			regulator-min-microvolt = <3296000>;
-			regulator-max-microvolt = <3328000>;
-			regulator-enable-ramp-delay = <500>;
-		};
-	};
-};
-
-&camss {
-	vdda-phy-supply = <&vreg_l1a_1p225>;
-	vdda-pll-supply = <&vreg_s6a_0p87>;
-
-	status = "okay";
-};
-
-&camss_port1 {
-	camss_endpoint1: endpoint {
-		data-lanes = <0 1 2 3>;
-		remote-endpoint = <&cam_front_endpoint>;
-	};
-};
-
-&cci {
-	pinctrl-0 = <&cci1_default>;
-	pinctrl-1 = <&cci1_sleep>;
-	pinctrl-names = "default", "sleep";
-
-	status = "okay";
-};
-
-&cci_i2c1 {
-	camera@1a {
-		compatible = "sony,imx355";
-		reg = <0x1a>;
-
-		clocks = <&camcc CAM_CC_MCLK2_CLK>;
-
-		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
-		assigned-clock-rates = <19200000>;
-
-		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
-
-		avdd-supply = <&cam_front_ldo>;
-		dvdd-supply = <&cam_front_ldo>;
-		dovdd-supply = <&cam_vio_ldo>;
-
-		pinctrl-0 = <&cam_mclk2_default>;
-		pinctrl-names = "default";
-
-		rotation = <270>;
-		orientation = <0>;
-
-		port {
-			cam_front_endpoint: endpoint {
-				link-frequencies = /bits/ 64 <360000000>;
-				remote-endpoint = <&camss_endpoint1>;
-			};
-		};
-	};
-};
-
-&gcc {
-	protected-clocks = <GCC_QSPI_CORE_CLK>,
-			   <GCC_QSPI_CORE_CLK_SRC>,
-			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
-};
-
-&gpi_dma1 {
-	status = "okay";
-};
-
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/sdm670/sargo/a615_zap.mbn";
-};
-
-&i2c9 {
-	clock-frequency = <100000>;
-	status = "okay";
-
-	synaptics-rmi4-i2c@20 {
-		compatible = "syna,rmi4-i2c";
-		reg = <0x20>;
-		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&touchscreen_default>;
-
-		vio-supply = <&ts_1p8_supply>;
-
-		syna,reset-delay-ms = <200>;
-		syna,startup-delay-ms = <200>;
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		rmi4-f01@1 {
-			reg = <0x01>;
-			syna,nosleep-mode = <1>;
-		};
-
-		rmi4_f12: rmi4-f12@12 {
-			reg = <0x12>;
-			touchscreen-x-mm = <62>;
-			touchscreen-y-mm = <127>;
-			syna,sensor-type = <1>;
-		};
-	};
 };
 
-&mdss {
-	status = "okay";
+&battery {
+	charge-full-design-microamp-hours = <3000000>;
 };
 
-&mdss_dsi0 {
-	vdda-supply = <&vreg_l1a_1p225>;
+&framebuffer {
+	reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
+	width = <1080>;
+	height = <2220>;
+	stride = <(1080 * 4)>;
 	status = "okay";
-
-	panel: panel@0 {
-		compatible = "samsung,s6e3fa7-ams559nk06";
-		reg = <0>;
-
-		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&panel_default>;
-
-		power-supply = <&vreg_l6b_3p3>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&mdss_dsi0_out>;
-			};
-		};
-	};
 };
 
-&mdss_dsi0_out {
-	remote-endpoint = <&panel_in>;
-	data-lanes = <0 1 2 3>;
-};
-
-&mdss_dsi0_phy {
-	vdds-supply = <&vreg_l1b_0p925>;
-	status = "okay";
-};
-
-&mdss_mdp {
+&panel {
+	compatible = "samsung,s6e3fa7-ams559nk06";
 	status = "okay";
 };
 
-&pm660_charger {
-	monitored-battery = <&battery>;
-	status = "okay";
-};
-
-&pm660_gpios {
-	cam_vio_pin: cam-vio-state {
-		pins = "gpio13";
-		function = "normal";
-		power-source = <0>;
-	};
-};
-
-&pm660_rradc {
-	status = "okay";
-};
-
-&pm660l_flash {
-	status = "okay";
-
-	led-0 {
-		function = LED_FUNCTION_FLASH;
-		color = <LED_COLOR_ID_WHITE>;
-		led-sources = <1>, <2>;
-		led-max-microamp = <500000>;
-		flash-max-microamp = <1500000>;
-		flash-max-timeout-us = <1280000>;
-	};
-};
-
-&pm660l_gpios {
-	cam_front_ldo_pin: cam-front-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <0>;
-	};
-
-	vol_up_pin: vol-up-state {
-		pins = "gpio7";
-		function = "normal";
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-		input-enable;
-		bias-pull-up;
-	};
-};
-
-&pon_pwrkey {
-	status = "okay";
-};
-
-&pon_resin {
-	linux,code = <KEY_VOLUMEDOWN>;
-	status = "okay";
-};
-
-&qupv3_id_1 {
-	status = "okay";
-};
-
-&sdhc_1 {
-	supports-cqe;
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	mmc-ddr-1_8v;
-
-	qcom,ddr-config = <0xc3040873>;
-
-	vmmc-supply = <&vreg_l4b_2p95>;
-	vqmmc-supply = <&vreg_l8a_1p8>;
-
-	status = "okay";
-};
-
-&tlmm {
-	gpio-reserved-ranges = <0 4>, <81 4>;
-
-	panel_default: panel-default-state {
-		te-pins {
-			pins = "gpio10";
-			function = "mdp_vsync";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-
-		reset-pins {
-			pins = "gpio75";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		mode-pins {
-			pins = "gpio76";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-disable;
-		};
-	};
-
-	touchscreen_default: ts-default-state {
-		ts-reset-pins {
-			pins = "gpio99";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-			output-high;
-		};
-
-		ts-irq-pins {
-			pins = "gpio125";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		ts-switch-pins {
-			pins = "gpio135";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-			output-low;
-		};
-	};
-};
-
-&usb_1_hsphy {
-	vdd-supply = <&vreg_l1b_0p925>;
-	vdda-pll-supply = <&vreg_l10a_1p8>;
-	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
-
-	status = "okay";
-};
-
-&usb_1 {
-	qcom,select-utmi-as-pipe-clk;
-	status = "okay";
-};
-
-&usb_1_dwc3 {
-	/* Only peripheral works for now */
-	dr_mode = "peripheral";
-
-	/* Do not assume that sdm670.dtsi will never support USB 3.0 */
-	phys = <&usb_1_hsphy>;
-	phy-names = "usb2-phy";
-	maximum-speed = "high-speed";
+&rmi4_f12 {
+	touchscreen-x-mm = <63>;
+	touchscreen-y-mm = <127>;
 };
-- 
2.53.0

