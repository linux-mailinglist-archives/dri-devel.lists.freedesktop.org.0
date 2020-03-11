Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9618239F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 22:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082406E4E6;
	Wed, 11 Mar 2020 21:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA56E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 21:00:04 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id p125so3292606oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7phUkchvkdDhI0qJQteXXrbvWqBV29LumyqHqAKAGfw=;
 b=DKEHmpIWlL29cMVFWe6xjU8gFVRSfh+JmPnUg+aC/f/dRk65+C5pIvZuwTvHTk1yKK
 nprcxp5VKsDIbibGRV6WtJxjwnbc1oFs8j2GXfFHUitinNps9fcCtjcrqoyhAOw44PgM
 noKuGoe11mnG2wH45cSQOELIqhKy3ni+5zB+GuaIL53GrtLMJ/2Ug/QfRABr1Dp/ZFLz
 LPwzTXO4pHHEdp+IZuPow4+V/VM6s5ekLCA830a0E0ccU113yphfKjkGzvXGp7EhQ6Tu
 FXURexQM/sMVBLvfWZHJ3EoXBOy/VwiCCf/iDfXUGPsAS5fh5No85MEJNWziRrEIdSG8
 JgYA==
X-Gm-Message-State: ANhLgQ2365L74nLvUMvMbVmqL2vSTMcAr3EWlwBXc2gVDyMn8LzC0bQi
 2xQZPJDD5wrPHFZiMRJQPktlLlE=
X-Google-Smtp-Source: ADFU+vt16JBJitN1b4tjKD/58wMS3bY1wUUrgmNH3EbK4CL9Ke6XCgMF9CDaBHhmiDnMFZbI7bhplQ==
X-Received: by 2002:a05:6808:248:: with SMTP id m8mr403527oie.91.1583960403280; 
 Wed, 11 Mar 2020 14:00:03 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z22sm634145oog.45.2020.03.11.14.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 14:00:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: Fix dtc unit-address warnings in
 examples
Date: Wed, 11 Mar 2020 16:00:01 -0500
Message-Id: <20200311210001.5102-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extra dtc warnings (roughly what W=1 enables) are now enabled by default
when building the binding examples. These were fixed treewide in
5.6-rc5, but some new display bindings have been added with new
warnings:

Documentation/devicetree/bindings/display/panel/raydium,rm68200.example.dts:17.7-27.11: Warning (unit_address_vs_reg): /example-0/dsi@0: node has a unit name, but no reg property
Documentation/devicetree/bindings/display/panel/panel-simple-dsi.example.dts:17.19-31.11: Warning (unit_address_vs_reg): /example-0/mdss_dsi@fd922800: node has a unit name, but no reg property
Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.example.dts:17.7-26.11: Warning (unit_address_vs_reg): /example-0/dsi@0: node has a unit name, but no reg property
Documentation/devicetree/bindings/display/ti/ti,am65x-dss.example.dts:21.27-49.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
Documentation/devicetree/bindings/display/ti/ti,j721e-dss.example.dts:21.27-72.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dts:20.27-42.11: Warning (unit_address_format): /example-0/dss@02540000: unit name should not have leading 0s

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml  | 3 +--
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml    | 2 +-
 .../devicetree/bindings/display/panel/raydium,rm68200.yaml     | 2 +-
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 2 +-
 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml   | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
index 6e6ac995c27b..2e7c65b093d7 100644
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -39,7 +39,7 @@ required:
 
 examples:
   - |
-    dsi@0 {
+    dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
@@ -50,4 +50,3 @@ examples:
       };
     };
 ...
-
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 8b60368a2425..b2e8742fd6af 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -50,7 +50,7 @@ required:
 
 examples:
   - |
-    mdss_dsi@fd922800 {
+    dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
index 09149f140d5f..a35ba16fc000 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
@@ -42,7 +42,7 @@ required:
 
 examples:
   - |
-    dsi@0 {
+    dsi {
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index cac61a998203..aa5543a64526 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -121,7 +121,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
-    dss: dss@04a00000 {
+    dss: dss@4a00000 {
             compatible = "ti,am65x-dss";
             reg =   <0x0 0x04a00000 0x0 0x1000>, /* common */
                     <0x0 0x04a02000 0x0 0x1000>, /* vidl1 */
diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
index ade9b2f513f5..6d47cd7206c2 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -154,7 +154,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
-    dss: dss@04a00000 {
+    dss: dss@4a00000 {
             compatible = "ti,j721e-dss";
             reg =   <0x00 0x04a00000 0x00 0x10000>, /* common_m */
                     <0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
index 385bd060ccf9..7cb37053e95b 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
@@ -81,7 +81,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
-    dss: dss@02540000 {
+    dss: dss@2540000 {
             compatible = "ti,k2g-dss";
             reg =   <0x02540000 0x400>,
                     <0x02550000 0x1000>,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
