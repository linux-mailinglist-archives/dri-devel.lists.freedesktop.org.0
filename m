Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7A613175D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 19:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22E66E4F9;
	Mon,  6 Jan 2020 18:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B866E4F3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 18:17:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8248F8051C;
 Mon,  6 Jan 2020 19:17:32 +0100 (CET)
Date: Mon, 6 Jan 2020 19:17:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: dt-bindings: fix warnings in xinpeng,xpp055c272.yaml
Message-ID: <20200106181731.GA24294@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=NXpJzYs8AAAA:8 a=VwQbUJbxAAAA:8
 a=i8DPN7MwQ2D8WwEsYkQA:9 a=1B2umpmUSmRfsa1z:21 a=al_32F_5cpsT22RA:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cwV61pgf2j4Cq8VD9hE_:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reg property in the example caused following warnings:

xinpeng,xpp055c272.example.dts:20.17-27: Warning (reg_format): /example-0/dsi@ff450000/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)

xinpeng,xpp055c272.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
xinpeng,xpp055c272.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
xinpeng,xpp055c272.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
xinpeng,xpp055c272.example.dts:18.21-24.15: Warning (avoid_default_addr_size): /example-0/dsi@ff450000/panel@0: Relying on default #address-cells value
xinpeng,xpp055c272.example.dts:18.21-24.15: Warning (avoid_default_addr_size): /example-0/dsi@ff450000/panel@0: Relying on default #size-cells value

Added #address-cells and #size-cells to silence the warning.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---

I forgot to push this fixed while applying the patch.

	Sam

 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index 378cf9e2549d..186e5e1c8fa3 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -35,6 +35,8 @@ additionalProperties: false
 examples:
   - |
     dsi@ff450000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
         panel@0 {
             compatible = "xinpeng,xpp055c272";
             reg = <0>;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
