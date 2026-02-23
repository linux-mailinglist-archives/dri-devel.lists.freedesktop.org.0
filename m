Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG6wIldinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A4183BCE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1D810E4EE;
	Tue, 24 Feb 2026 08:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c9fawWc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D080810E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:26:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so28698225e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 12:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771878410; x=1772483210; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
 b=c9fawWc4V2RswClg14S+hSg+HnX5C/l6KkHWJojQ95EXTYu/Gczx39Spd9PuOtUgTa
 yfmCKjinMNNr3g4S6W7/Q1uvRMbdRVmazmkDrsWEfZIp4EL3eYYqB2iSu10SvoercxHz
 B4cFJ/xemPjIrMCOjsH/Bb8805hPVg6SQlYRhIIzMfH9nTv+bSLI2NNO2Gj9uXba3vg9
 EaOosrjTymmGlf4xwOyWL96OF4UDRsNQsO0LwpZejm90grhxz4VGLvLGQwxSpq+ByhAc
 +XGIcI06SJjdst2BtjlhpjbK6LBQVJ3LB7lYwxPTc0li3rWkqBhGtwCHQTPITPQUCVdp
 p6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771878410; x=1772483210;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
 b=wVTB7cKhLkrr+qa+1DDXaSsMM9a7JAHR13K43dPW9CgAo1W5vYoiogTHF6JJdsGF2U
 2+yORDnP6H990NSVhBYLxgGDLIcGYa+PLecjCknb9ay6iqWuBYYLhUpjlNH+jEzkVmWM
 iyZWpytW5CZaD+hae61kRhHLrgPIJVEPje6dwNGDBgfKS7nHQdhk15uYMYUkuTY+9he9
 3zX9sEcIFlW+xtxOfw4FoTogVcZCFIEiZTdKAIVRnF7ljy3dn+LSVeNvkuPKFfLmp0ZW
 qt4ccAonhaqezUuInC2q1C7Gb6QHURjzYZtw5riaXhdOhQA5N+4Ulp+IozHm66OX4kr8
 jTRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsHecWa8FQv/mFDrjjlxmypqg0lBS+QapYfUiA95Zw/JmYLRbJPCKAYE1Sa4EEJTKnDvP/FqdLT6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5YnSDvYgLkFzcqyNp0j1IrRz9XCOZA3nsC9+Nmy3wZOkI44lI
 SSoIkraig/ZKeeS6DOliqGPChvj35Sra6S7NGwuMPJNWVW6tWOsqMyq5
X-Gm-Gg: AZuq6aJDPQuFuQY7gCnEkNV4DBHyTThfj2GXKQUDZHR+dOgQq/Pv6RYAcfeSDXBn6bD
 Ga5ZmGGESgsnTRl88l9jOjTRz+q1K+QhtFXjamAbvcwsa+SwU0AeFhTI/97G7BAypD9EXBlOy2Q
 OA33XU0obm+vh4RO3iyPDZadLTWYGJLGZ3q4UyT8Vs8g3kSY/S0PPd9+DWjSmgRKZTOjhHBjTmg
 eRPBv/lIg+PVPDPU4UHI2vnZaeQGBM4QidyrIkn1fU6guUQz0Ys6VFnbKskPPeqJdiPILFwNCJx
 SLKOJ9woTOS9rZJhZR5tlrTMvLtW7BZNw+WBAG5ZTqMxD1/qM2fhIAr7GaAlXibo5ginx20HC0r
 jFdb7vXFfhNFHanZf/rx6jPl/p/ubXUQPn4GJ1X2AKiQWViExglCX8k0EanNQsC0hDz/YRODWBm
 xhl9qqy7yS7IyxaoARHjaqnRUz3SPAD94Ad09ut+LP3wromLgkEBZVf9VOvXTK/D0=
X-Received: by 2002:a05:600c:45ce:b0:483:7813:90d8 with SMTP id
 5b1f17b1804b1-483a95bd80fmr166896275e9.1.1771878409631; 
 Mon, 23 Feb 2026 12:26:49 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il.
 [46.116.183.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d54c5csm21369551f8f.38.2026.02.23.12.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 12:26:49 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 22:26:22 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v2-3-1b6ad471d540@gmail.com>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
In-Reply-To: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771878400; l=3240;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=CzJleqofENKnSdtHil5FSilRw3jXdV+MFbWEBQ/PF4k=;
 b=4Hhv4ch+g+2onoP3Oj07ZKaZi7xK++T1hTIP4SwL26WVmrtzuj8vNednVCZtqagKaNtpQGpLe
 ieKeg8ZLtT9Br/fX6to5HizVk92Xfd/E4/eBnIdCZV2bRg9R/PipQ5p
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedaya.ka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:yedayaka@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,protonmail.com:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 1E8A4183BCE
X-Rspamd-Action: no action

Enable the MDSS nodes and add supplies and bindings for the Samsung
S6E8FCO panel.

The ldo and iovcc pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..10fd01143a644004b807fc455d2235f8e6a9737a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,32 @@ key-volume-up {
 		};
 	};
 
+	panel_ldo_supply: panel-ldo-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_ldo_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_ldo_en>;
+		pinctrl-names = "default";
+	};
+
+	panel_iovcc_supply: panel-iovcc-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_iovcc_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_iovcc_en>;
+		pinctrl-names = "default";
+	};
+
 	thermal-zones {
 		rf-pa0-thermal {
 			thermal-sensors = <&pm6125_adc_tm 0>;
@@ -128,6 +154,46 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l18a>;
+
+	pinctrl-0 = <&mdss_default>;
+	pinctrl-1 = <&mdss_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8fco";
+		reg = <0>;
+
+		vddio-supply = <&vreg_l9a>;
+		ldo-supply = <&panel_ldo_supply>;
+		iovcc-supply = <&panel_iovcc_supply>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm6125_adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
@@ -387,6 +453,34 @@ &sdhc_2 {
 
 &tlmm {
 	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	panel_ldo_en: panel-ldo-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdss_default: mdss-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdss_sleep: mdss-sleep-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_iovcc_en: panel-iovcc-default-state {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.53.0

