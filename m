Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C33922D555B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B59E6EA41;
	Thu, 10 Dec 2020 08:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99C066EA10
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:52:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C4251042;
 Wed,  9 Dec 2020 03:52:02 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.24.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96EC73F718;
 Wed,  9 Dec 2020 03:52:00 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: mali-midgard: Add dynamic-power-coefficient
Date: Wed,  9 Dec 2020 11:51:42 +0000
Message-Id: <20201209115143.15321-2-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209115143.15321-1-lukasz.luba@arm.com>
References: <20201209115143.15321-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Cc: airlied@linux.ie, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a property dynamic-power-coefficient which allows to register Energy
Model for the Mali Midgard devices.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 .../bindings/gpu/arm,mali-midgard.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index e9c42b59f30f..696c17aedbbe 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -90,6 +90,23 @@ properties:
 
   dma-coherent: true
 
+  dynamic-power-coefficient:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description:
+      A u32 value that represents the running time dynamic
+      power coefficient in units of uW/MHz/V^2. The
+      coefficient can either be calculated from power
+      measurements or derived by analysis.
+
+      The dynamic power consumption of the GPU is
+      proportional to the square of the Voltage (V) and
+      the clock frequency (f). The coefficient is used to
+      calculate the dynamic power as below -
+
+      Pdyn = dynamic-power-coefficient * V^2 * f
+
+      where voltage is in V, frequency is in MHz.
+
 required:
   - compatible
   - reg
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
