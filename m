Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD7ADABBF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2036D10E2F9;
	Mon, 16 Jun 2025 09:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="8Hn71vgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B08610E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:23:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G93VaH021379;
 Mon, 16 Jun 2025 11:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PWhNXOfPjDZW7k+9cbgV4wS145BPewRuTiI1JHa99ho=; b=8Hn71vglaGZGk6T8
 3KJTs4aREHjVYKpSz8YFfnkDPfunAuFkrG07QqAgPxiOJLABtTHY+d2Qyqy+p3Lw
 /FYWBdURdT/6/QfIQzqtkgGuztLxZLqIWgUsjeIEgMonBE/3hjrnErAUsp74Pnc/
 Z8p1DaQMyMq1tERMhePfiB3h6SvqbcOWvEMoqSnXqomQ0sFAXVRCxV9DYgks6RCT
 Ry9zf8fzbI5NbAYepn4X11t6qc+ljSH+DXl8t+xwsem0eeTeQlkIWjijTQs59VrS
 u1W5UjOCW3YsxuLpV/kl3o4U/uQ/RhEnaEYbTnFniQKo6qaE4Y3vfMpx/V9EMou6
 hgJLZw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478xgmg80x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 39FBE40057;
 Mon, 16 Jun 2025 11:22:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 611AFAA6ECA;
 Mon, 16 Jun 2025 11:21:09 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:09 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:04 +0200
Subject: [PATCH 3/6] dt-bindings: spi: stm32: update bindings with SPI Rx
 DMA-MDMA chaining
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-spi-upstream-v1-3-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
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

Add MDMA channel, and new sram property which are mandatory to enable
SPI Rx DMA-MDMA chaining.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../devicetree/bindings/spi/st,stm32-spi.yaml      | 48 +++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index 76e43c0ce36c..ca880a226afa 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -18,6 +18,38 @@ maintainers:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32f4-spi
+
+    then:
+      properties:
+        st,spi-midi-ns: false
+        sram: false
+        dmas:
+          maxItems: 2
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp25-spi
+
+    then:
+      properties:
+        sram: false
+        dmas:
+          maxItems: 2
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
 
 properties:
   compatible:
@@ -41,16 +73,28 @@ properties:
 
   dmas:
     description: |
-      DMA specifiers for tx and rx dma. DMA fifo mode must be used. See
-      the STM32 DMA controllers bindings Documentation/devicetree/bindings/dma/stm32/*.yaml.
+      DMA specifiers for tx and rx channels. DMA fifo mode must be used. See
+      the STM32 DMA bindings Documentation/devicetree/bindings/dma/stm32/st,*dma.yaml
+    minItems: 2
     items:
       - description: rx DMA channel
       - description: tx DMA channel
+      - description: rxm2m MDMA channel
 
   dma-names:
+    minItems: 2
     items:
       - const: rx
       - const: tx
+      - const: rxm2m
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandles to a reserved SRAM region which is used as temporary
+      storage memory between DMA and MDMA engines.
+      The region should be defined as child node of the AHB SRAM node
+      as per the generic bindings in Documentation/devicetree/bindings/sram/sram.yaml
 
   access-controllers:
     minItems: 1

-- 
2.43.0

