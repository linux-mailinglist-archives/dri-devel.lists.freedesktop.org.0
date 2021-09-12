Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5D407FF5
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A116E053;
	Sun, 12 Sep 2021 20:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806F46E055
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:09:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id s24so5121202wmh.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
 b=ijQ9VUVd3E+yAzhUW8LN+qmTp2ecRP2mmWkjTl8uAZSPA/zpjjwrm91O4PToKeDqC4
 vFO3mTKegg4IVvavhdrn+MbBPEpbxDgUBdh7DqlctW88vqJAie0ybyRePtB0ZKvhjjSg
 b/7a3Q6HAWJrkVAy2fywVfzvbX+UyY+AJRdulaqhxB5JkZguuPBwEVKs9rq+R7MQ8oTS
 T2lYnk8I/S7QPhedjPhkp9y79Iqn8sPawMmPQZytgNJCLQ1cquISSJH4xb8LXTpwJI//
 DMAae/2QaieRbscwgAfhPwKD2x6lrNKA7L32d8Qadur4oH0Po7NY3LnqcOAePA1x9BPV
 5e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIkaLltNAZEHFO/c9xmZHlt7cmXZw7U8aSqzSL63yiM=;
 b=Pm2wKi7oYSlkbJegV/yZbwphfsSyrpiO2i8UmKaVMP8BN6j7k5rSc6DdHD3l4bPt6z
 XY93/R7dmcowqKxFpRVRM3s+VZbTDERF3+n8xG0CPs2uNIMlL4xA4F8SA/pbgqlcJ2sj
 2CkeyMIkokCin0pPYnY3NLzM3O074v5byCmQIUZQIM+8TfRszir0v/SJVhVErjLwxOTo
 ufW2Z+UWyLrCK8xWskfYCw3m+GFDnhywMBIy7PN9OEV42f2Ntr3ZvpIHfXWPNs0Gmigy
 QMkk7axpxSNpFkgfVyk/Oss+sNkZBSSj3GE7U7gngjh7KjzFZCH87P2CP5uuRKcWL+wA
 DvTw==
X-Gm-Message-State: AOAM530w5cSmSeJHe5Z1pfK3DRwb7CpqAw6wSMShtf4hxeiOF4cruqDS
 G9CD/bLjKB8ODmyugYQjo3w=
X-Google-Smtp-Source: ABdhPJxyxUlin+TcDC9SzEGP88oLSNh0QPSkbXUWBt5/tW6RXe2v6I0t3nNYmR/wNfym5p2nWbp1lw==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr1537846wmq.77.1631477385110; 
 Sun, 12 Sep 2021 13:09:45 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 05/34] dt-bindings: clock: tegra-car: Document new clock
 sub-nodes
Date: Sun, 12 Sep 2021 23:08:03 +0300
Message-Id: <20210912200832.12312-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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

Document sub-nodes which describe Tegra SoC clocks that require a higher
voltage of the core power domain in order to operate properly on a higher
clock rates.  Each node contains a phandle to OPP table and power domain.

The root PLLs and system clocks don't have any specific device dedicated
to them, clock controller is in charge of managing power for them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra20-car.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
index 459d2a525393..f832abb7f11a 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -42,6 +42,36 @@ properties:
   "#reset-cells":
     const: 1
 
+patternProperties:
+  "^(sclk)|(pll-[cem])$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - nvidia,tegra20-sclk
+          - nvidia,tegra30-sclk
+          - nvidia,tegra30-pllc
+          - nvidia,tegra30-plle
+          - nvidia,tegra30-pllm
+
+      operating-points-v2: true
+
+      clocks:
+        items:
+          - description: node's clock
+
+      power-domains:
+        maxItems: 1
+        description: phandle to the core SoC power domain
+
+    required:
+      - compatible
+      - operating-points-v2
+      - clocks
+      - power-domains
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -59,6 +89,13 @@ examples:
         reg = <0x60006000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+
+        sclk {
+            compatible = "nvidia,tegra20-sclk";
+            operating-points-v2 = <&opp_table>;
+            clocks = <&tegra_car TEGRA20_CLK_SCLK>;
+            power-domains = <&domain>;
+        };
     };
 
     usb-controller@c5004000 {
-- 
2.32.0

