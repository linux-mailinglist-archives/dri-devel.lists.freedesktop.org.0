Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNm5CjH/imnJPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:49:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E21191A0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD9F10E52B;
	Tue, 10 Feb 2026 09:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UgcknWQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7773310E528
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:49:30 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-59dd263bf42so5551373e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770716969; x=1771321769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=docz6ooNYgx/jlwVUrg5MGlatBXXa4vDb6cy3X3gZsU=;
 b=UgcknWQ189AcV5WqHxltAYNv9qq1S0Zbn2OcoMwuO4eQ6lCt58SYift+rSbWvI6K5a
 men6QmDM2J95pVyY8OIIEP459J+8mZwnTCKWQBAdLxKDFeC9MBMkLeBS10Zw+DDLSstd
 azfUgRg9Bb4dlweySqSV2l9piJhu2iHMg370MqfauHB5UpCoeTarQe3IXlxXkBoBASav
 k/ECZGYWxdeAYFsukizrv1FDzY3PBfWYl1/pewc0FDPw7k0x9hycuyx22q6ytQYJPrir
 fUyHuBrgSKJL2cHmxzGxBPa2owr2Yyqt9VZTUWdtZj9OjIStYy2M+zx9kpZcW912NonT
 AZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770716969; x=1771321769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=docz6ooNYgx/jlwVUrg5MGlatBXXa4vDb6cy3X3gZsU=;
 b=CAWopGdQyWGMIj2f0kE/40vLIM7r2IySNFm386AEGTPEdaSpv3Y74fc1q+s0uSixU+
 tU9K8vw1+krKNscBn8M9kZ1UPUVAcULHI3IgW1WZgLWgIe+1CthZV9KgnTxlfsn2SCk4
 /xLuOWxlAvX/LTqaJVslVoGgCzvQfTvEsisRIffCmSseejujtLbw/ruF4tf/6FRDYqpo
 ekrP+slWnUrt/gYj5YxWCg2+aTmXeQoN5JAlBuFpEkz5Fvmbw8zPjLedJ4dGnO0aP5UU
 ZQHQsytiyi8+Zo+HxrHkBB8QMcZAebLW/+uP3iW/Yrr9ognj7lj46gENHZsT0sQBcWCC
 5oBg==
X-Gm-Message-State: AOJu0YzkBf/vIr2WOF6xQmeHoC4lVZHW0Vxc+LvLZ5DkbCfbNV3Xzlfy
 gCxFCpLw+0CxMK6MfPx2rWFqa9JyiTaznrwbbwdxy88ch2BeAFUukSAb
X-Gm-Gg: AZuq6aJt1kYmu4N+IPUHe/KsV9A/KCE+CH0U17jfgS8sPSO+b4LfdtpNskr7zjnwXSZ
 JP6Rac3fWQ7CHDdmAOw9kotDvjGBP9qC66ACfuMkf5NgLSsFuwPzxd6PVExDcX2lBVRgOjh24Y7
 t4CmyKx9M/DduZWN6DLJmbO4kk+OaPE9+S1WMEVUm5w0bHQRXksQUjocpo+m18QBIinnNAUB9au
 nC73FDJICwW5aDCSQfGs1RrejtlxeYQYFtHd8CDpH5umo2B14u3vKP4gue/tDq5QvcTkJkBRUVs
 97rpdheAkUpzOxpzvzd4WhGyKcobxr5ZlxO7O1LJP4gQp7RjVIDIrr4z4nijYNkQw+vo8v7Nx2j
 cKzwAMq4YsUHX+v1MsR2inWjxmn0eqo443GtwhcbnLanx/mIZIwjZb8H+dJ3FJNEkChvV+6bVu0
 mhGY0xquyAJSAS
X-Received: by 2002:a05:6512:b16:b0:59e:1663:941 with SMTP id
 2adb3069b0e04-59e55b7404cmr537077e87.3.1770716968637; 
 Tue, 10 Feb 2026 01:49:28 -0800 (PST)
Received: from xeon ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e44e231d5sm3191691e87.81.2026.02.10.01.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 01:49:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: tegra: transformers: add connector node
Date: Tue, 10 Feb 2026 11:49:08 +0200
Message-ID: <20260210094908.14276-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210094908.14276-1-clamor95@gmail.com>
References: <20260210094908.14276-1-clamor95@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_PROHIBIT(0.00)[3.60.141.96:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,3.60.63.64:email]
X-Rspamd-Queue-Id: 939E21191A0
X-Rspamd-Action: no action

All ASUS Transformers have micro-HDMI connector directly available. After
Tegra HDMI got bridge/connector support, we should use connector framework
for proper HW description.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra20-asus-transformer-common.dtsi      | 22 ++++++++++++++++---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 ++++++++++++++++--
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++++++++++--
 3 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
index 73c7ee378865..51d99998d836 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
@@ -79,9 +79,11 @@ hdmi@54280000 {
 			pll-supply = <&hdmi_pll_reg>;
 			hdmi-supply = <&vdd_hdmi_en>;
 
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -951,6 +953,20 @@ clk32k_in: clock-32k-in {
 		#clock-cells = <0>;
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 1ed0536ae3fa..498780a96cf9 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -67,8 +67,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 
 		lcd: dsi@54300000 {
@@ -2302,6 +2305,20 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index 53382e10f29f..0b0713d62e32 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -166,8 +166,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1713,6 +1716,20 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
-- 
2.51.0

