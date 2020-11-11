Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6692AEA84
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE4989F3B;
	Wed, 11 Nov 2020 07:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57789E15
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 23so3085476wmg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
 b=L2nGyd1hoSYca71deEj6QrNwd1Mfe1ynvvNfAPZdbM0r3u8YjBetM0GAj0Yl8apMh2
 ArJr0wlVHFXCXwooBpJ48JzrG+pss1VD+jcfPwqLPiPIuwYy4N+yjANNoEXQaNAsHPLh
 ib7I/uDe9pCkid7o0VliV55R7Q4LYwc2NfPDhCSFh0KFCaAZgqyYpfqjRrj7F43esTrT
 75SY10Eg2eJkEDzrqsp4tLAp1hRYN2nOsZNuK94+x3Ei7MbSi4ijzewbyhPpVezLia63
 MVUrELU7H7JO1oKotzWtxKLF/MhcpbGjWd7OFx0wnWSTWuUv4602iO04zgMmX1yz5Hic
 vZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
 b=H6jkL67pCi15qCLSXSMixNaltDhtTOV2iz4EZ0uG6Xda5z28iupp+1c6cjXY0Pygls
 WrtMw1tPZJ+jwAQFdT47PMa8wDIXoa6Hs5jl+X/I/z+T2EHr760K5Cu6UeuUEniC5O5j
 HCntGgEWAdDMOpRINwEONn94nIcyDViznWXUzuNUq2JyH2fbl/q/+qROSYNUGP3bx2+B
 xoAMMseW5J0YJ4opxiFDEsw26JIgSUCkZlbx4nBGKtbWuErqaXmF+acR+CK9g6cjOI7V
 +ltem4pDVdRsY+OLGlgkLsi7ZYhbELN9JJ0lT43RFaorAVF9SY05lZZG+PWKlgHFOTMH
 errw==
X-Gm-Message-State: AOAM533dFLEZVszLNGtVac+xLaCLkfgelImoUwIMvOyGMnPqY94aPzQg
 MWa5uhVmvg4bJtyAHlKwbxw=
X-Google-Smtp-Source: ABdhPJzERI9IUMPDNlGr8X9mBk7KyFjpvv1wNzeOj81e8oT8e6EKe6MSqWpz1EQDoUwz4RNFe2LdAg==
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr936438wmi.124.1605057347455;
 Tue, 10 Nov 2020 17:15:47 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v8 22/26] ARM: tegra: Add interconnect properties to Tegra124
 device-tree
Date: Wed, 11 Nov 2020 04:14:52 +0300
Message-Id: <20201111011456.7875-23-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111011456.7875-1-digetx@gmail.com>
References: <20201111011456.7875-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect properties to the Memory Controller, External Memory
Controller and the Display Controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 64f488ba1e72..1801e30b1d3a 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -113,6 +113,19 @@ dc@54200000 {
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
 			nvidia,head = <0>;
+
+			interconnects = <&mc TEGRA124_MC_DISPLAY0A &emc>,
+					<&mc TEGRA124_MC_DISPLAY0B &emc>,
+					<&mc TEGRA124_MC_DISPLAY0C &emc>,
+					<&mc TEGRA124_MC_DISPLAYHC &emc>,
+					<&mc TEGRA124_MC_DISPLAYD &emc>,
+					<&mc TEGRA124_MC_DISPLAYT &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor",
+					     "wind",
+					     "wint";
 		};
 
 		dc@54240000 {
@@ -127,6 +140,15 @@ dc@54240000 {
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
 			nvidia,head = <1>;
+
+			interconnects = <&mc TEGRA124_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA124_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA124_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA124_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
 		};
 
 		hdmi: hdmi@54280000 {
@@ -628,6 +650,7 @@ mc: memory-controller@70019000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -637,6 +660,8 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <0>;
 	};
 
 	sata@70020000 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
