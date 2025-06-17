Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B0ADCB5D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F72D10E625;
	Tue, 17 Jun 2025 12:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oyNvtZJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FC710E60D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 12:25:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F2F295C6687;
 Tue, 17 Jun 2025 12:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAB0C4CEE3;
 Tue, 17 Jun 2025 12:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750163153;
 bh=cGUtX2I1TX5Mw8HpaioqDUtXETjbLf4kkml849rWcMw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oyNvtZJTwe9Sz99WD7ShA0zGmfxgCcGdao99HLk5tN2X7y9ZIuE3MRpyrrb9jceRh
 yiwI99sW5tqLk5h1Ru3IkHwCOvD4IweIb63HB51RBw/52H7UUhuX1Op9WWcF4qpsfu
 e3nUtmNP6rjwfrVWX+slB0Gyypk/I6gHPj38+7yWsJBQahxG86TA6w9hBWQzqqoDP5
 kBN6wYvaJFbFIuDCppupW4CvLMZ5B+bY1Jud3hv/pq6FAWDVryyUhluw03rq+pyDPy
 RGFPYsoiuk+I2NRo27StaMb80N5sahwaO09wkxNON9Uf8/bx1FP1t2VJ/dBSZjt6Fn
 UR7yReJXNk+pg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 17 Jun 2025 14:25:40 +0200
Subject: [PATCH v5 1/2] dt-bindings: reserved-memory: Introduce carved-out
 memory region binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
In-Reply-To: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cGUtX2I1TX5Mw8HpaioqDUtXETjbLf4kkml849rWcMw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmBcScDQ08LhRWeOOWxxC70UXuiE/+Gm/KtO60MXi++8
 jfn7tn3HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiyn2MDT945obO67y+iPtX
 7l6Oz6v5Lv9r0HYQ3TV9V0HJ4ZunGn8s+sYWNuPEujDZaRyf9BhPpDDWaX8MiX9r0vHAt3hb0cT
 or54eV4SrWjYlc6fZ3lVbcPb7WyvhLYWCqUbt9Rsnf/l+i1sSAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Some parts of the memory can be dedicated to specific purposes and
exposed as a dedicated memory allocator.

This is especially useful if that particular region has a particular
properties the rest of the memory doesn't have. For example, some
platforms have their entire RAM covered by ECC but for a small area
meant to be used by applications that don't need ECC, and its associated
overhead.

Let's introduce a binding to describe such a region and allow the OS to
create a dedicated memory allocator for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../bindings/reserved-memory/carved-out.yaml       | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9ab5d1ebd9ebd9111b7c064fabe1c45e752da83b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/carved-out.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Carved-out Memory Region
+
+description: |
+  Specifies that the reserved memory region has been carved out of the
+  main memory allocator, and is intended to be used by the OS as a
+  dedicated memory allocator.
+
+maintainers:
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  compatible:
+    const: carved-out
+
+  reg:
+    description: region of memory that is carved out.
+
+allOf:
+  - $ref: reserved-memory.yaml
+  - not:
+      required:
+        - reusable
+  - not:
+      required:
+        - no-map
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        memory@12340000 {
+            compatible = "carved-out";
+            reg = <0x12340000 0x00800000>;
+        };
+    };

-- 
2.49.0

