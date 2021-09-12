Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE3407FF8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15486E057;
	Sun, 12 Sep 2021 20:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9FA6E057
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:09:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id g128so690814wma.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1AOM2RfjwsrGWR/uPrYeS/Sf+AYl6Sxk5Zgv7MiC4jY=;
 b=Dq3P3RRgJcqhcBh5BG9KO6CwsVH0mrKQnWOGCvOT4T1EFxj1AAlWyrHItGMz3hadTC
 lwz6mX2UdEXVMPLyyEUpCx8CRfbN0DQ+byj4Sy0rmHY3whnxhPMXVI5prvpxA2YWNsZ2
 KkNXQhfT+Vd5SjTt8wehgzX4wSdNOrqfP1m5rqm/xZ6b+7b25rvaalgv8G8myN2HCB4F
 jZslbkJsNeOWiy8sk/nT4Y7T3XGE1SzHXOgvlL0RWEDSdpwv5l4zveiR9pMXBCaiRLhR
 X1ulXY03uY6Qk36KfGgg9hK5mFE1ACgns2v7NgdU6Nk566CAx+Ldnf37dN3/n/nFsrdO
 LwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1AOM2RfjwsrGWR/uPrYeS/Sf+AYl6Sxk5Zgv7MiC4jY=;
 b=SR2zcNn1ucqW2eyMVWK6Hs1Iasu0DxSwO9MYxWz+KcnAXmmgnGfBtFjwubqrtQLFi2
 6q9CGS1niQ51lUqmaxCBXB6cuTZ74+tacq6+1vFIbD4jVvd9pLgWpQBGudSwjZOev1R4
 YU4VJ+Lwct+FY2YF1qvvM9DERwd6+xlixMWtaIcXmW9dc0kNibh2zX2boLMYgA0WIFjM
 m+qEYhYbd3l3CUDI6eu2cLYvXgf+BNVl5HiN6oFkdcA+qejWhfRYLdPkUbfiACgco/gs
 JWs9yzhBi5OtXgGqZLB/kj86Y8qhWV4F2RIzuA4zhOyC1uEhL7ItcP8JjeW+OCrGZ5Xk
 TUQA==
X-Gm-Message-State: AOAM531MtC45k18Yxqf3Be13Ucaw/Uok8FXfS2zD7CoqBnxuPLv0nbnp
 aNnRf+6YfktI7ghkjRVIM6g=
X-Google-Smtp-Source: ABdhPJxw34GNDCRDT8MU7zKTgdsV2n63kBh9Hmu14z0qokFeoDFjF2GQ8OyM2QjooyQFpIy1D/5WBw==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr7712537wmc.7.1631477392315;
 Sun, 12 Sep 2021 13:09:52 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:52 -0700 (PDT)
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
Subject: [PATCH v11 08/34] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Sun, 12 Sep 2021 23:08:06 +0300
Message-Id: <20210912200832.12312-9-digetx@gmail.com>
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

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..e61999ce54e9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -19,6 +19,7 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - host1x
+  - mc
 
 Optional properties:
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
@@ -198,6 +199,7 @@ of the following host1x client modules:
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
     - 2d
+    - mc
 
   Optional properties:
   - interconnects: Must contain entry for the GR2D memory clients.
@@ -224,6 +226,8 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
 
   Optional properties:
   - interconnects: Must contain entry for the GR3D memory clients.
-- 
2.32.0

