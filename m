Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046662BFDE7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96C689AB7;
	Mon, 23 Nov 2020 01:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CFF89B78
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 00:31:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b17so16119272ljf.12
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 16:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
 b=YufEOZGlcie2JDpQAxDfwDTP/9PGmFqD1aL94c96xtWFoZ9+VeGl/wyxS1ZXO6h5Tx
 3OCD7XeGobT/HJcOVPfQ+POUnxXMJnKN6zlOSrPAtLNWr9Ex/Szu8Bz2OEdKDW1DA/fs
 y1Sho+MhZEZ2dE8WdYqDyGrtQd/HOQo/ppbwCfaJvvd+UHsRW7+f/KCuEJRrckJGO91d
 BbyAoZ7zQSu++obmcY7YbEsaQKGprDAltUFh3nE9TGDgxkD2l4S5sTJLaVrxDEmuIF/Q
 wF8a1nn8iGTValzQ04cBO6nuXlCIfnbD+XNDlmtH7UtT+izKD4nLQAHj+PrVdPskTbE9
 0JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLbRWZodAWHryje7XdgngwZooRzE7B+sWeFpLwWIFLg=;
 b=QYQJcNfJvTAScHzRI8HDRO9HKF9y+JjlFfA/SWX+J8BdfK0e1KxQEwl6nCfPrhw8ZF
 aV90Ye5xZV8XSBibRzXZnqAw035Q4UkGvWGtROlY3tTfju6TZOHXw5wq+XvramEnX1ao
 U8EBCO/WEBnj5MK7OtrDmjid2pBxOpfZe11vm2kAaTpN85Q6qeX+L/TidoRgmd6xlLcr
 12RmUg6bE92/0ULp2ETxihRlw81/Zryp/4MpjrgsSJVNEUIQ5JgweDHcOiuZKbHII1IO
 PBSf8s+08Hw6oxC+EIzZ3u9IP6/ltFB6mtmvAC8mmhi+zCj1jJ/uayOgiRfDZg0cAm0O
 YUiQ==
X-Gm-Message-State: AOAM530sJFQMjN/ZvPbHFgA/3GwIqCV7cLFDNxZBjl64ZBVlhXHN01cz
 XnrKYOKRpkoBdGhn31M0JdA=
X-Google-Smtp-Source: ABdhPJzlbOW1fWwxx4IasK5xVIghnxNQsUMTnkUV04K/2TB50nUcGltAPpOpooNRptnY6x45PgCotA==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr1407672ljm.446.1606091490637; 
 Sun, 22 Nov 2020 16:31:30 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 16:31:30 -0800 (PST)
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
Subject: [PATCH v10 15/19] ARM: tegra: Add interconnect properties to Tegra124
 device-tree
Date: Mon, 23 Nov 2020 03:27:19 +0300
Message-Id: <20201123002723.28463-16-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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
