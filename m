Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAENEcixk2kK7wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:09:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC471483A9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1138810E415;
	Tue, 17 Feb 2026 00:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e+yxo96D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C531D10E415
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 00:09:40 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8cb5138df1aso240387585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771286980; x=1771891780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oa4VVnq/PmbRXPOCA0iMVFkR6b/DwoIi4kzwka75JGM=;
 b=e+yxo96DdBFSBPvyoN38gfVC4n1qciez2RqyUUUgecUdC3dehaPHY/LfdUktk4UNL/
 uqmIxtwVAuu+H79OOjYH+RFbw5xc9oAlT8m7ko6MYGXPfJlb4evrV/niCxtmosKrqU5B
 C/I/WFa8YC/oVJJ09SY6w+UdIV/BpM1PMxRYm3UDj1ZkSElR8/gqPh2M0JywVP/JOSpR
 7k1TSPkk17X+RHp0svIu8Vl2lz4OsB/MxA1JDwdGyBHDdcq6HiEwEjY9HBuBGzFw2i6P
 3dHQ21aal3IKmpUUOBRFMGwHFFFhf+YngkZXpUhpzAP9fdoq8/OYe29Vfzuv3XQst1Q2
 xZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771286980; x=1771891780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Oa4VVnq/PmbRXPOCA0iMVFkR6b/DwoIi4kzwka75JGM=;
 b=r47TPgrSk9wFnqqwyQBkDo2cQnePQNiRorqHrRBKwQsb8c7mofRee7lIuMpZxICCuf
 v8Kne/yf2erS6zTFgz4pqaRRGRZ30OlJl+XT8bZ2KhFBbtVRPzs7ILd/KsreHla8pqCl
 v2GJsJP+jo+C8TmZY20YPZ/I32fWHzm5d7wdNlv/OOxAPL+lv3aJdryhfVfeiqvUHx/h
 CRQRlTnPIaxjelavF1zFZitey4Vf8nibmz0xtOR36PQejai3L9VUNxllhRg1hQhldKeg
 zPHVbpofblHKRIL2wTR96gJ3bf8PeacAJ9Zpaq6AqtzvymfADx6FM9N+tdt1u3bZyG7u
 7nDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmn1r1OwhWU6bpF17OnuOwJfgywNRGGGp8ggxSnwHR8Qip6uF/9/Dhm+zF4DJvxVV0GF2bz5h4ypM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJOKAaPiFRAKHXoxWd96zam+/Mj4xHaZvcgqg0Rd17Q3VkQHap
 TUnn5gG3TIUjxPeiehjI/IjRGmUXvA2IYTmVWwagkCe7PVNt3Z34hkEu
X-Gm-Gg: AZuq6aLhbV9ATb3DfaQArAdoiKagtA9ouDmCLVQmpYnCmk0Ur8VnV/FM+MMAW9SltnX
 Q9FVTA8m/DxGXwdxTbKRcbsdYYpNUDc1Ce1s3aYg9AbASyOX1hFTAkCT4tLk1OamXXcXIhcpOaM
 GJdxx2zX5A5YIMmdSEg+Mn8iBC61NkFRxzDRg+K34XtTongrfpXTzLRRpPiWXrbRrDlhXykobcH
 nKt3bUc4VXSXGYvr3tKBDfVcFEsZJ4lQYP7wUaz8UQNWaGm8bIAJ6o2j/J/vLt2nq5VsxYXe94G
 2iJhVCs3F1P4f4OIEY72aED36rYGtLQ1lHnXyHoH8UG6WNIY1rp5E9DKAgQCJmK4TVsO0KuA6Xn
 osX7bPVivzT6FaRgLe3aGE/uFnnG13TOHJWKM2gQmzsOp+t8tnyUcN7SLVP8YIVlYMewo64f73s
 QgLs5Gm1dTxYGwiWDVOSVKCB8NCo+z4w==
X-Received: by 2002:a05:620a:2952:b0:8cb:4289:6c1a with SMTP id
 af79cd13be357-8cb4c01e31amr1045501585a.75.1771286979891; 
 Mon, 16 Feb 2026 16:09:39 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971cdc554fsm150087946d6.48.2026.02.16.16.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 16:09:39 -0800 (PST)
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
Subject: [PATCH v2 6/6] arm64: dts: qcom: add support for pixel 3a xl with the
 tianma panel
Date: Mon, 16 Feb 2026 19:08:54 -0500
Message-ID: <20260217000854.131242-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: ADC471483A9
X-Rspamd-Action: no action

The Pixel 3a XL has variants with either a Samsung Display Controller (SDC)
panel or a Tianma panel. Add the device tree for the variant with the
Tianma panel.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..6237aeb0e36d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -245,6 +245,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-bonito-tianma.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 
 sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
new file mode 100644
index 000000000000..da309434b511
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device tree for Google Pixel 3a XL with the panel connected to the Samsung
+ * Display Controller.
+ *
+ * Copyright (c) 2023-2024, Richard Acayan. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sdm670-google-common.dtsi"
+
+/ {
+	model = "Google Pixel 3a XL (with Tianma panel)";
+	compatible = "google,bonito-tianma", "google,bonito", "qcom,sdm670";
+};
+
+&battery {
+	charge-full-design-microamp-hours = <3700000>;
+};
+
+&framebuffer {
+	reg = <0 0x9c000000 0 (1080 * 2160 * 4)>;
+	width = <1080>;
+	height = <2160>;
+	stride = <(1080 * 4)>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "novatek,nt37700f";
+	status = "okay";
+};
+
+&rmi4_f12 {
+	touchscreen-x-mm = <69>;
+	touchscreen-y-mm = <137>;
+};
-- 
2.53.0

