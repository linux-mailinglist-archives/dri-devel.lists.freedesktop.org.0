Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3B2987DD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E43C6E880;
	Mon, 26 Oct 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116B6E207
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id c21so7734159ljj.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRlFO/P8PM5Cn8H1AicqJgfFzNfpVD518mHY1P3SV5Y=;
 b=SzJggAwDoCLpZKnhs4yqU1TOOL/PVnhO+B5UsLYstn5FSBOpAL/YAdp0J+RMrpcnUi
 BRBz0jixKxyk4C7oG0PCr60QEWHyxCjSuCgbhbi3CdalucyJm+cbeGD5khJkCjY/RHZI
 ipWS66W9KITel7MbfBgmgTjG22Bw/4fGeF2f5imTiwKucbL5JFmXOPC+Fi1tQaw73BUg
 1dWQFCjSfvtru2ifRg4XXsajcRkUris/kZ8IV7iiqXQl/y8SVc+cT0jEDWDobjY8hvRw
 iAzYf9vYdib6qBhnfQ1lfrQeCXdmmkcQcEsVMeX52wdeuunXLCfichXwuWnhCyy9WR+z
 zbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRlFO/P8PM5Cn8H1AicqJgfFzNfpVD518mHY1P3SV5Y=;
 b=Wu8Z/nrxclShvrApN0+BIkZZ03+tg7F0cRhC5zoU4cXiL1JY3MNrlYTYrcxEGyR3LE
 8kNTYHxaGR8RDhtJnEuX459lPzdjwuA+0epQP/tZ4TqU5aBILXnzCZPXWqA5xkHVLqpW
 R6JqjHUl3D60G5wbEQfSgfVfd4niDvPpY/IqiaUhSHMQONx83izvkJswpT7LL3oNbXYo
 glTvSreHpAsPxoxEcI/yWZNWekXIdX8tvXmVu1rt+pJBoqk5I7AYeJaG5K1hdYa951rt
 TVnM++Q9LaOE4pQmoJpM/XTBr3Kr8W2dWfjK2XqCoY6e6K76VMgZ7rAdnLkSDfwoF94t
 6r6A==
X-Gm-Message-State: AOAM531N28qBTJTda9mqKK8Oqd4Z3/2kz/XLSDGluZoI1fsXFvSE52oz
 GxEewT78UVSgOXeGt/RgaNw=
X-Google-Smtp-Source: ABdhPJyYBlMuWAyftPV0ynOBRahvzDJ4fYyvi7bDLQzk2E9d4+m3IffSaErKR3DR72K6XIKkmNbITw==
X-Received: by 2002:a2e:88c2:: with SMTP id a2mr4715037ljk.438.1603664294746; 
 Sun, 25 Oct 2020 15:18:14 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:14 -0700 (PDT)
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
Subject: [PATCH v6 23/52] ARM: tegra: Add interconnect properties to Tegra124
 device-tree
Date: Mon, 26 Oct 2020 01:17:06 +0300
Message-Id: <20201025221735.3062-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
