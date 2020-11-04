Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A992A7917
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15246E9FB;
	Thu,  5 Nov 2020 08:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADCF6E221
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:59 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a7so28001562lfk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRlFO/P8PM5Cn8H1AicqJgfFzNfpVD518mHY1P3SV5Y=;
 b=JjuvAMG7mUgnQj24tLTtOndGkC1aW9WCMpYSx1Uqdlnjva57fFgswNL7gZIz5Vsca7
 /fj5kxRVQy02daPia7Tr9OOeM1NsbKOKIIfZPHXaamUt29sf8bmpDpU4mqM5YgInB92w
 RYQoy727Tgfjh9JDARE+Yx8M8ZT8z4fQVofOB18BFKvopiwUabMaIxxkaoVoUx1r0OgQ
 NVF2/KOWAAmbwPWHOnWvs9F6AibWjWxF9VvylhwHdVgBudiGyPa5A6mM7Lzvco7gAWbk
 dDxQ0T8C8swVpSiFygSfBRiaioQZkg7BC6Em09ZGoMPlUl2l6gXGKO0rw+5YEe9RkTid
 k+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRlFO/P8PM5Cn8H1AicqJgfFzNfpVD518mHY1P3SV5Y=;
 b=BzBAgw68cqwRB/rMm+9J90GiEHSnx5o22sgCVzMvWDAJ7R49GtgMqG7z3VnXx38hqz
 pKffcTm2fkduII2Z8OJzRUKUWnyku/YRFwQ5gjG0iLvTXt/ax3IKilZgIEPVG7biHaAM
 OnrLjAhWa+dZ3ej5IIWjx9KWMELRs35iAptmSEVtI9qY0Ywly/+1RjYR66Lh0SajGSTg
 SBaOgu/C7RhugnV0MoC9v816xyQbbqc3EwSsmZmkq+wD90P3qLpa0StXW97nTNpUIGap
 51qZFHFJmCmnfH2IB3RKy5UMeI8sOe12lDGzvzRvk4/N2+ueJLG1Yb2KzaJIs43xN6vf
 +uWA==
X-Gm-Message-State: AOAM5324dtGbxSzDJ4TTBRkEwuaI96l8vBWE1/JOOf3wk46ay2/NJ+BC
 oKvuFiPKY24lWz4PukO27XI=
X-Google-Smtp-Source: ABdhPJzNYKMXhnv2y71K4IH8Od3EIl2zV3SAC5E1nwSgucyjo2ZrsUQlvh9kkTAkh+Vsje/0FjHNFQ==
X-Received: by 2002:a19:5e19:: with SMTP id s25mr10683956lfb.430.1604508597896; 
 Wed, 04 Nov 2020 08:49:57 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:57 -0800 (PST)
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
Subject: [PATCH v7 23/47] ARM: tegra: Add interconnect properties to Tegra124
 device-tree
Date: Wed,  4 Nov 2020 19:48:59 +0300
Message-Id: <20201104164923.21238-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
