Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIZoN9n5m2l5+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:55:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDD172685
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D2110E24D;
	Mon, 23 Feb 2026 06:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SzxoIp41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ADD10E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:55:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59e60b3ccdfso5294717e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771829714; x=1772434514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfKVvY3zEHHWaD06pd/pcj59qAyzkCZLLQIV8hNmtWk=;
 b=SzxoIp41+9ATVvxxri6yqF9bP6GLFb4j3jHACAn6a9V3I+yJkJtnzQDeD5WppiR+wR
 9+EC2PD26ZGvHjA/Hz8gA0BjtlOhjeQaYySACmd/YvyFSXYbDXBuxDldfkKNb6Ta5uFb
 5Xye7JJe5/qBqt4IqIr65Nwkhl26XTa1CAu0+biNMyK0/N0rjSG4950Rc3R/eaLxeqtX
 KDG/kPkp4aWGOR+5ULgkq7in6UyGU1k8kWhZRdVNUIg/mla1QEQejfhtK0+T5IBAhXH9
 tP/3Yf2h996bUjDLkyqHkRP4DWegDx2KvXc3+E7SQvwLTX4pwuobcaWP90XHL/9ikLLj
 X8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771829714; x=1772434514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tfKVvY3zEHHWaD06pd/pcj59qAyzkCZLLQIV8hNmtWk=;
 b=Sxqn7MMlX6GtcnHzLLPecGRZmFwsBLV70Bw16TrpG3uKrF3U1gp9QJ7DZL7DIBR9Ld
 2U8vVKOoVvdOW/JHrdaCewoJO03bc0jd4ASHMIdKMVV6fvjFlpOxuWOWYIb33Y9iki3I
 eZwdObwtKrP3/iRI4hJwtbRl5jZ9JLjTSmgOrc11flAwlpmzEO/KFMVTQaqkXlDTMNWa
 98osImH/hhZIXE3SUg1FT+qY5STS/tLcGAfXHTe/P2+7013fl+q96mB4y4RecRb1IesI
 oEyB4LIem4uZOuT5NZp99Xhzf1l0M3338qQGrwR/jtdTWMkexuEvks0/WhaOK3TSJsLz
 PdiQ==
X-Gm-Message-State: AOJu0YznWnXZigXeZZG4E8TMmFmZyXf+YoiuzzUvW1+Hq3fOx15tyZUC
 HT3jC6LLnggdGFY3EhkIhASeK0x3nwd83UIteIJI8sxXXAiHy8wH68La
X-Gm-Gg: AZuq6aJdC+GduNIEIwZ8SC5NlzpbtsiiR0ttQ/rcgvb0C3x4m6jCsLgWR+Vm9LrH721
 fyFAZL2IbWe/JoJRZZWQJ4DezDIBlxiteomBk4d1TZIqGktp/FSzBAzPCSFDXco38XVPdYfNPFs
 uTVFiUxy41V1IdZvuZdhQFrq0h4VffGmIUkNyImiTlP9kDDjwHoaYkHPXpceriR4wVt16FmjIfB
 xzncHFy0TSLJ1MO0HKq6gMuwjYR4VdZPcKSZI+eaGklGj9pAci2E80kMXZ3pvL8XcYqkc3Hxx2X
 iMMI5JyqIhzt6SCWb4zhdU0cQtSSh7bSZGj+/1eWPeR6pyf0EkcrnLWqkjYqgxIiqXSYgM0Hn90
 oWo7fjiAx3Yv45ojYwsxxB9vZOUYokwsz5V37BZUlHXccave4C8wdyDdxEN48C3qCbiBoP18qk1
 9FTTg5XNGxPm2h
X-Received: by 2002:a05:6512:2348:b0:59f:76ca:9893 with SMTP id
 2adb3069b0e04-5a0ed87f9d5mr2208819e87.4.1771829713866; 
 Sun, 22 Feb 2026 22:55:13 -0800 (PST)
Received: from xeon ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c60bsm1373802e87.84.2026.02.22.22.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 22:55:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Date: Mon, 23 Feb 2026 08:55:00 +0200
Message-ID: <20260223065500.13357-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065500.13357-1-clamor95@gmail.com>
References: <20260223065500.13357-1-clamor95@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:treding@nvidia.com,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[3.60.63.64:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,3.60.141.96:email]
X-Rspamd-Queue-Id: 55FDD172685
X-Rspamd-Action: no action

All ASUS Transformers have micro-HDMI connector directly available. After
Tegra HDMI got bridge/connector support, we should use connector framework
for proper HW description.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

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
-- 
2.51.0

