Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2730DCA27E1
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5D010E854;
	Thu,  4 Dec 2025 06:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J7mengeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D34310E84C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:17:18 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso905861a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764829037; x=1765433837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
 b=J7mengeE9IUAzSCE4FAIQKxjzUxezwjyQIf62BH6VtxCBullDld/D4KzgQFU++0Mf6
 TViPYJAhx4H2wC0G6tlQHisLIttGMwqAVVPpMFYuzPOWi/5zW93SDEKnXUcGga0Yw/iv
 dkxLGG6pCTLG47cgWKrXm8e3tpNmOIRYQVKZ9p3LXlJ68NAkcjCArcDkTFWjnrd3du27
 8ArEaJEf0uG/aKVo7NaQEUA4UgahZ5AlPoshVdKgkN9+Z/qXboWVB5ddUzwI4yiH7Oa1
 EB/MMDClJdVL3/NVgSMQw3+V1Zgl7tFpxrISUbUQniVgZQDhjAYQ92xJ46pNIx9nb81P
 RbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764829037; x=1765433837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xO0aKgv2KbReOFRNCLP5zz82s3c058MLvHztpGFjRTA=;
 b=TCQ4MwUy9Jk/GhxT0iEpyiTF49qc356HcP6wVvsr+Z2qCamkxCyz2UR1xbJ1nDLTpR
 qY99lRVMBF2FJa1mhv9+0lsR0c1ymEftP2C/F7o96roMAnubHcjBF4lR9KEaZMlEOnR9
 rlIW4gR5Q7OOHfdvh7yW8VC65nKeXyB6PrIYgqvyaItbBQbBQ8BNCEXSGN6/522DwpWQ
 lilDSSvdHgczTRxXAb2Rks/GJMgwdUGqHfLQa+oaU3EU3+d+36MIlyX9sPLuil1EUIXC
 bkq6O1NTpwo9SQldP2+D2kZOQhpU/vyeNppi34/SSqAmqidFdfo1gKPC6wo0KyQsRMbI
 rJDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLmWpxLQZpt6dbxTl6Vgq841QThAFBEkYX5epshWbJHlo86uxyRYrtAODstpYTYMEKNLDYqdyFVJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt0/C4RiFPQbEwZCLWgzBbqeTpwXmQlG2HsB3KIXEg5WbXN6tR
 VlZBI2d1RGqx2fbUzOgNBgUbEcwmm/47EGYLfCX9p3rsM0D7PamCD95M
X-Gm-Gg: ASbGncs9EJjdpniZ/YUZGS1KRBNhczfgtTCCt5AL5VXLKgHXlOqsQmQEJB6K6d5JMwP
 Xi2AOl2fwnx1VXCDw8uE2GsWas4CDZicBCG0GB0c4E6b/JBU2Mx3OhPoEYz3H5VpGVFAdpMLRUJ
 fRMeE+ToyE1GCVrnJGa1MBIM61Pw3NeBAQlNwK1APPz7WzZnPnKMaO6oCLDIJUgUNVYB61s3zea
 XtfA1DeiV4sSwgw1h3kTo8hM+iNL6kEiU9VgBcv6OIY9VIfSdvISFC0UyGALXDBfPTsdk1ZFXT+
 NXK2qxnnV41HPHn7B2xCw9lGVDvnLtKsFo0Nr9GeOnIRy+cvGLvIW20fc7GI4ik1shPq3Ry1yIX
 I8UY5YTsMZLfIz3+zpGDhkbs+vsfi6+veMEqf0rMcUMUXP9QRrM5Gx+lGUOLITAjoq71LNdOX34
 xpg89Cu7OWjw==
X-Google-Smtp-Source: AGHT+IF1K60L8X5YUUDbUfaqT+WhDWzWe2HWAZE3zZLtHiewIpC9IHuMviFoxvCFWSRO/KZ3uycBcQ==
X-Received: by 2002:a17:906:6a20:b0:b73:b05b:1f9c with SMTP id
 a640c23a62f3a-b79dbe857e6mr544792366b.14.1764829036626; 
 Wed, 03 Dec 2025 22:17:16 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:17:16 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for Tegra20/Tegra30
Date: Thu,  4 Dec 2025 08:17:03 +0200
Message-ID: <20251204061703.5579-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
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

Add missing nvidia,mipi-calibrate and cells properties to DSI nodes.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 5cdbf1246cf8..39c0f791c7ee 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -238,7 +238,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsi_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSI pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index be752a245a55..fecd4891e751 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -343,7 +343,11 @@ dsi@54300000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsia_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 3>; /* DSIA pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		dsi@54400000 {
@@ -356,7 +360,11 @@ dsi@54400000 {
 			reset-names = "dsi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsib_dvfs_opp_table>;
+			nvidia,mipi-calibrate = <&csi 4>; /* DSIB pad */
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
-- 
2.48.1

