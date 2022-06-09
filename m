Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF855451D6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22A312B19B;
	Thu,  9 Jun 2022 16:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9070612B19B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 16:27:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2E0412FC;
 Thu,  9 Jun 2022 09:27:35 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 157B53F73B;
 Thu,  9 Jun 2022 09:27:33 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: display: arm,malidp: remove bogus RQOS property
Date: Thu,  9 Jun 2022 17:27:29 +0100
Message-Id: <20220609162729.1441760-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As Liviu pointed out, the arm,malidp-arqos-high-level property
mentioned in the original .txt binding was a mistake, and
arm,malidp-arqos-value needs to take its place.

The binding commit ce6eb0253cba ("dt/bindings: display: Add optional
property node define for Mali DP500") mentions the right name in the
commit message, but has the wrong name in the diff.
Commit d298e6a27a81 ("drm/arm/mali-dp: Add display QoS interface
configuration for Mali DP500") uses the property in the driver, but uses
the shorter name.

Remove the wrong property from the binding, and use the proper name in
the example. The actual property was already documented properly.

Fixes: 2c8b082a3ab1 ("dt-bindings: display: convert Arm Mali-DP to DT schema")
Link: https://lore.kernel.org/linux-arm-kernel/YnumGEilUblhBx8E@e110455-lin.cambridge.arm.com/
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reported-by: Liviu Dudau <liviu.dudau@arm.com>
---
 Documentation/devicetree/bindings/display/arm,malidp.yaml | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/arm,malidp.yaml b/Documentation/devicetree/bindings/display/arm,malidp.yaml
index 795a08ac9f128..2a17ec6fc97c0 100644
--- a/Documentation/devicetree/bindings/display/arm,malidp.yaml
+++ b/Documentation/devicetree/bindings/display/arm,malidp.yaml
@@ -71,11 +71,6 @@ properties:
       - description: number of output lines for the green channel (G)
       - description: number of output lines for the blue channel (B)
 
-  arm,malidp-arqos-high-level:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      integer describing the ARQoS levels of DP500's QoS signaling
-
   arm,malidp-arqos-value:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -113,7 +108,7 @@ examples:
         clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
         clock-names = "pxlclk", "mclk", "aclk", "pclk";
         arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
-        arm,malidp-arqos-high-level = <0xd000d000>;
+        arm,malidp-arqos-value = <0xd000d000>;
 
         port {
             dp0_output: endpoint {
-- 
2.25.1

