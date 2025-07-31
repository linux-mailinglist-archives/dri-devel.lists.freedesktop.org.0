Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C9B17436
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AB310E7C8;
	Thu, 31 Jul 2025 15:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1DA10E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:52:58 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 8A7EA1C2718;
 Thu, 31 Jul 2025 17:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.1
Received: from fluffy-mammal.metal.fwg-cag.de (unknown
 [IPv6:2001:9e8:cdc9:0:1347:874c:9851:58c6])
 by srv01.abscue.de (Postfix) with ESMTPSA id 274A41C2710;
 Thu, 31 Jul 2025 17:52:52 +0200 (CEST)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Thu, 31 Jul 2025 17:51:16 +0200
Subject: [PATCH v3 03/16] dt-bindings: display: sprd: add memory-region
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-ums9230-drm-v3-3-06d4f57c4b08@abscue.de>
References: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
In-Reply-To: <20250731-ums9230-drm-v3-0-06d4f57c4b08@abscue.de>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Eric Anholt <eric@anholt.net>, 
 Kevin Tang <kevin3.tang@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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

Explain that the DPU node supports a memory-region property that can be
used to describe an initial framebuffer set up by the bootloader,
usually in order to create a passthrough mapping for this framebuffer
when the IOMMU is used.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 .../devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
index 7f34652080b22e7b7072a709fd390a72375110ef..fa9ad2600f150e1023606898322a1a7b4675bab3 100644
--- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
@@ -48,6 +48,14 @@ properties:
   iommus:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description:
+      A phandle to the framebuffer region configured by the bootloader. This
+      can be used together with an iommu-addresses property on the reserved
+      memory region to create an initial passthrough mapping for the boot
+      splash framebuffer.
+
   port:
     type: object
     description:

-- 
2.50.0
