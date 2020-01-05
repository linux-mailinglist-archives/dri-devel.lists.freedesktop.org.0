Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC6413079E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 12:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3794989C0D;
	Sun,  5 Jan 2020 11:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F331289C0D
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 11:06:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AE11F20054;
 Sun,  5 Jan 2020 12:06:09 +0100 (CET)
Date: Sun, 5 Jan 2020 12:06:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v7 0/8] add driver for "boe, tv101wum-nl6", "boe,
 tv101wum-n53", "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Message-ID: <20200105110607.GA3309@ravnborg.org>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=QOvxnjmS4eJAzMLy2VwA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao.

On Sat, Oct 12, 2019 at 11:07:12AM +0800, Jitao Shi wrote:
> Changes since v6:
>  - fix boe_panel_init err uninit.
>  - adjust the delay of backlight on.
> 
> Changes since v5:
>  - covert the documents to yaml
>  - fine tune boe, tv101wum-n53 panel video timine

I finally found some time to looks at this.

The bindings does unfortunately not pass a dt_binding_check

I had to locally do the following to make on of the bindings pass:
diff --git a/Documentation/devicetree/bindings/display/panel/auo,b101uan08.3.yaml b/Documentation/devicetree/bindings/display/panel/auo
,b101uan08.3.yaml
index c0939f8c7274..cafa870120fb 100644
--- a/Documentation/devicetree/bindings/display/panel/auo,b101uan08.3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/auo,b101uan08.3.yaml
@@ -11,6 +11,9 @@ maintainers:
   - Sam Ravnborg <sam@ravnborg.org>
   - Rob Herring <robh+dt@kernel.org>

+allOf:
+  - $ref: panel-common.yaml#
+
 properties:
   compatible:
         const: auo,b101uan08.3
@@ -33,6 +36,8 @@ properties:
   backlight:
     description: phandle of the backlight device attached to the panel

+  port: true
+
 required:
  - compatible
  - reg
@@ -46,7 +51,9 @@ additionalProperties: false

 examples:
   - |
-    &dsi {
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
         panel@0 {
             compatible = "auo,b101uan08.3";
             reg = <0>;

I will follow-up with review feedback on the drivers later as time
permits.

	Sam



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
