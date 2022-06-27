Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6759055BBC6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA0611B2B0;
	Mon, 27 Jun 2022 19:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6FA11B2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r20so14522857wra.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CI3fJo8A+eaieUlzNYpta6LCY7AsQa7tJxY+upYt5DU=;
 b=NCjs560wHII6fVECQB9/GdNlhvJNFE4pkOGLs8jP+UxuRPiuWEHK2RAq+jRyb7l21B
 lfShg0ET3/X/0mjEMGlwSBSEdfkuN/jOG4+hLlup2Q1NEGgyw8TvLXt6Sh1ng8wnUUF6
 ACyhrCvbH8GLUqGorfK03QyZ/EOUgFIIkp9U/rze0vaIL0pGtOjj0l2WGg8p0UVFtKdE
 2GtvloqzOeXu8KfiG3wMjVq/vAsjfcHvwx3Fvw+Z7IhEjjmeAf2mLbSlaMXjwCsQ5NF8
 F9+tVjwoFB7PMmDlGl56M6lK2Iw5z3M3LCYB6VBFZ/Gv2C7k/N+jEVee+9P4Wub30j/G
 soHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CI3fJo8A+eaieUlzNYpta6LCY7AsQa7tJxY+upYt5DU=;
 b=1GkYgPDS2APAukEKTKp7lf7FyoyUU9hzMSfhpFaYudhmuqrZHNZwGKD1WoNOPV+md6
 giZ+2v/QQH85J1eGCZC0L4QeHFiXsZMDSUq4Vj2vVI1P9h1FvjLcxMFR20AwvqkO+Knd
 P/xkDWF8S3iQbeQ47mCNsrUfcUk9f74rScsmX3YY4QP+UdntZZ0B5iGGNWkXsddru9iL
 7uef205i3vdGSQIH0AyMiKIxkZR4Kqpz+ilSmqyWrd5CP4E4WzMhbbkMT/RKZYPU+lJw
 9V9jp8aVj3DjFhXyiC1IiBR3OJqjArUX98eTPIPTw8RXiLKPL3NIuG2V2w4v2Oy4muh0
 GEIQ==
X-Gm-Message-State: AJIora9gjMV74h53m2km/eh7dg8jWIbZP2uozExlZeGhcpfCQ7DQpAzC
 ctvTgsNZuIRmSbYfWIXV4D6x3A==
X-Google-Smtp-Source: AGRyM1vB7FfkKSm2wSwW9aXIKCoZFOmSwRYKxi54RsU01e+Y3cIcwbXfb6XLRuYxVHKTOGWa9mvMRw==
X-Received: by 2002:a05:6000:18d:b0:21b:901e:9b27 with SMTP id
 p13-20020a056000018d00b0021b901e9b27mr14202414wrx.389.1656358887406; 
 Mon, 27 Jun 2022 12:41:27 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:26 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 07/16] dt-bindings: memory-controllers: add canaan k210
 sram controller
Date: Mon, 27 Jun 2022 20:39:55 +0100
Message-Id: <20220627194003.2395484-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string & document it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I made myself maintainer since I didn't have anywhere else
to point a finger, but I am happy to let someone else take
that on!

The corresponding U-Boot code seems to be:
static int sram_init(void)
{
	int ret, i;
	const char * const banks[] = { "sram0", "sram1", "aisram" };
	ofnode memory;
	struct clk clk;

	/* Enable RAM clocks */
	memory = ofnode_by_compatible(ofnode_null(), "canaan,k210-sram");
	if (ofnode_equal(memory, ofnode_null()))
		return -ENOENT;

	for (i = 0; i < ARRAY_SIZE(banks); i++) {
		ret = clk_get_by_name_nodev(memory, banks[i], &clk);
		if (ret)
			continue;

		ret = clk_enable(&clk);
		clk_free(&clk);
		if (ret)
			return ret;
	}

	return 0;
}

Which, without having the hardware etc, I suspect is likely to keep
working after the move.
---
 .../memory-controllers/canaan,k210-sram.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
new file mode 100644
index 000000000000..837eb65854fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K210 SRAM memory controller
+
+description: |
+  The Canaan K210 SRAM memory controller is initialised and programmed by
+  firmware, but an OS might want to read its registers for error reporting
+  purposes and to learn about the DRAM topology.
+
+maintainers:
+  - Conor Dooley <conor@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - canaan,k210-sram
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sram0 clock
+      - description: sram1 clock
+      - description: aisram clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sram0
+      - const: sram1
+      - const: aisram
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    memory-controller {
+        compatible = "canaan,k210-sram";
+        clocks = <&sysclk K210_CLK_SRAM0>,
+                 <&sysclk K210_CLK_SRAM1>,
+                 <&sysclk K210_CLK_AI>;
+        clock-names = "sram0", "sram1", "aisram";
+    };
+
-- 
2.36.1

