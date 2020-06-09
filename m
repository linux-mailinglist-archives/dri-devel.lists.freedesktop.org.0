Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED281F4F21
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2294A6E453;
	Wed, 10 Jun 2020 07:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722536E2D5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a9so21431493ljn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AG+TQmILbbrHUh9/3fg4pGtkuDKOX+TOZbe0Aj0MBf0=;
 b=EiGhSOh1ZZPDLaZRrYIeHCwKkcNsouIcTJjk0UxCLEePd/J+r5pwQyDnLWuIeTo8cq
 gV/ci5m3Vqo4aYx143Z/Mzz9uozgdSH6gSl1TK3z0y/3VP1U3hPVMHRWHoYj6C5KYwda
 HroGQYKYI0+uAe1cm29/AeJ07m8HZKzojXdxbRujvQUuOgVxLWrHXRtSHD9IQVEaBMuE
 CJJOTef/97J7HEvFO6iicAJq/7/e8AY3fuCvYSQ2AsdLNPDDOCCHQMNqYh/yRrxCSjnF
 2TpuG2F+JIqqL6kTkzDfCZ448ytMSV92/cOS2dmdXZer+G85yg9YyWrjGVr4Fabt2XoN
 UiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AG+TQmILbbrHUh9/3fg4pGtkuDKOX+TOZbe0Aj0MBf0=;
 b=QqpQYZglBXt++S92g7k+QVzb5V53p4B3ooHJd9i3geHa7M0uyV8XA7ILKTwr5WyeR/
 KbRuuz5Iz+eZXbya12mwCm0/c+UL3eKhKJ1bZ6x7q+kVydurliIPEbDvHfK+NVjOlT1U
 2zSds1JdjyTLFnvZUy7AJxK1O6LiLfZBJ0kcd1a74328raAVzQMHqXVnXKTvtHf5T3/5
 SLWIv4+WeDHjyb215Ovf0mmMF+2CYMvQdZGwPp8bKPazEjjdvGRfLpJ9W7VtcV4wmoMn
 XS+E1bX26MP+IHydMDrolwpUhmKPeoeQNy8stqdfgGTVGGGYUNt0/x6okyh32CiCKseY
 8Rsg==
X-Gm-Message-State: AOAM530b6pPZlr56wnDpL5qslnZmuWeFwjhVYL3zLoSlxVcPE5J9/OuR
 xhFSkF6q06og4hRFtUX0dE8=
X-Google-Smtp-Source: ABdhPJyiYfbTzP2nZhf3fgnnkhVUB7Ysq7mpxP+V8W5Yvzw4oCoUQgYrSVYyt565zMhI60iILUnTfQ==
X-Received: by 2002:a2e:89da:: with SMTP id c26mr13060673ljk.447.1591708496791; 
 Tue, 09 Jun 2020 06:14:56 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:56 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 26/37] ARM: tegra: Add interconnect properties to Tegra30
 device-tree
Date: Tue,  9 Jun 2020 16:13:53 +0300
Message-Id: <20200609131404.17523-27-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect properties to the memory controller, external memory
controller and the display controller nodes in order to describe hardware
interconnection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index d2d05f1da274..2b183025629f 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -208,6 +208,15 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0A &emc>,
+					<&mc TEGRA30_MC_DISPLAY0B &emc>,
+					<&mc TEGRA30_MC_DISPLAY0C &emc>,
+					<&mc TEGRA30_MC_DISPLAY1B &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -227,6 +236,15 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA30_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA30_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA30_MC_DISPLAY1BB &emc>;
+			interconnect-names = "display0a",
+					     "display0b",
+					     "display0c",
+					     "display1b";
+
 			rgb {
 				status = "disabled";
 			};
@@ -733,15 +751,18 @@ mc: memory-controller@7000f000 {
 
 		#iommu-cells = <1>;
 		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
-	memory-controller@7000f400 {
+	emc: memory-controller@7000f400 {
 		compatible = "nvidia,tegra30-emc";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <0>;
 	};
 
 	fuse@7000f800 {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
