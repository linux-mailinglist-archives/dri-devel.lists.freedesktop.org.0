Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A1E844996
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D318510FD0D;
	Wed, 31 Jan 2024 21:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FC810FD0D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 21:15:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-55f15762840so219126a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 13:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735671; x=1707340471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzKBpTO+yAsO6AKq5s8rWuJxCgwGnyxQPNp5dZtPA/4=;
 b=SU/i4lJ5Tsk4+KX3sVC06k7IgwFoprC/A4UsNFrAuXa4eJEPWlcjNVCGlCouokbn7Q
 qYZbgpd6p3KPsO8M5Fy3FntRG0NCakTNkBbe7uOQt8Vs39lQfx/4o2Aq7osPGO4lhK0P
 Q1Mm05LNpMsTFR66xyDgdwRdemjhIneJwJGn2xbVjg4us/ghRj9NJJ+pvb9PHqPFpFTf
 Su9ZvC2yIkdoI87VYXsOPRr3De054JBqoXhTOOjHOviFlJOZQkHyObFw5kiAlOoip+pw
 BJHxAfGiL8RvEtoXlQlAvpayf5Kh5pzg3LySWQCrwd3eHU6xzAvDgyQVNHA8XcR4dZ3U
 PAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735671; x=1707340471;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BzKBpTO+yAsO6AKq5s8rWuJxCgwGnyxQPNp5dZtPA/4=;
 b=AdrVjBgeiLkVm57schd19wX+PzdMUvAioxtnVw5WTAwCVzFrwbnR7kE4tzVpGOHwe+
 WuE6t2hP+Hf+f4QrSPyWELbmmCVsPrNgtdzNyVGgJ4A+4suqyALKXyPbilAn0z6kw4Bx
 1DtB06EyjZ2bKBwYfm0GKX2mJP94+0vflng6TiAnPR94Hop5B1RpmMEYu4lxm2/9nXDU
 evQqXTyTag5usJ/yg5YUlUJhHgJSN7giVs2OJ0PKv5v6wdCvXQquVZ1ISvzRK8CfTE38
 7WIv5XFtoc8tJqj/tvx7nW5Vc97yZZlqIroJTxAUCQOdJV224NyB4JDZfIpxZer1ilu3
 Byeg==
X-Gm-Message-State: AOJu0YwQCxmT4aWPDJPaURDGqTwfDqyDmjHBi3LSDnJx1GtIFnu1xtGa
 pTjHJj4MFB7WS0Z1nExvcffdtU30/s4T2FUh2ti5hiMLjGubayeJ
X-Google-Smtp-Source: AGHT+IGKSAQ0iom5aOWp/ud0qd1AnStLBR0ipcNAgWjoyolxlKbW/Qay9WlmcGjARF23PCDI5a71JQ==
X-Received: by 2002:a50:ed91:0:b0:55f:4ce3:5988 with SMTP id
 h17-20020a50ed91000000b0055f4ce35988mr1738459edr.8.1706735671176; 
 Wed, 31 Jan 2024 13:14:31 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCULQ33QhABS4n6ZmrFSYOAyDgetml7TCChj/sOPv0oioq5VepLJymPA1kx2NkWnR/s/br7OHudwGBzZQ5lJljEVZ0T8ec2Qp1S80hCa2QJ/ToAZa1YotVwMLjl1ixwuX3c7Cu+05OhCGKZkQey/yuZ2Bw6v0NVp2+VtTGbXGVknaBG1caPpDodXH8w2Gv/zN7o5cVAOiQHi9MBkRsVot/HEcvmJEiKtCss4rKm7VvdBqeNBwZBwqxTaQPORu/gHnP6qcawXXJpcVGjzH6VAlZvH3ErYrVqCokAc/Rww/1Xp80adSwmW4MDgtNtHYQQyyLLEZIyow/Bpq6vIbRaYa5ynGN86YgBNPs9PsrXMZrXxxonkYDbgwwceyhD1DlNa1QtF0buPDCKbvEXuDI4YJZ5Hdx4UPHCsKxRufcd+/SKhB9BYYyvLq2uV94mWiDf7SiE8EzadWm2IkK3USljlB47pSTIfHntNiE46d3ZtXcpwD8jpvymiIPIFkfazQVGZ1ljIe8QguTVnuWOzaum/Qon6g7VEJ826bImqyFkegmo5KHphHZieTr3zht96D9DCWQSFQ43PUzoKevPHSvk=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 h28-20020a50cddc000000b0055f384e7530sm2241381edj.32.2024.01.31.13.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 13:14:30 -0800 (PST)
Message-ID: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
Date: Wed, 31 Jan 2024 22:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 1/6] dt-bindings: display: rockchip: rockchip,dw-hdmi:
 remove port property
To: robh+dt@kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: daniel@ffwll.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 tzimmermann@suse.de, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 andy.yan@rock-chips.com, markyao0591@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdmi-connector nodes are now functional and the new way to model
hdmi ports nodes with both in and output port subnodes. Unfortunately
with the conversion to YAML the old method with only an input port node
was used. Later the new method was also added to the binding.
A binding must be unambiguously, so remove the old port property
entirely and make port@0 and port@1 a requirement as all
upstream dts files are updated as well and because checking
deprecated stuff is a bit pointless.
Update the example to avoid use of the removed property.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
  rename title from deprecate to remove
  reword
---
 .../display/rockchip/rockchip,dw-hdmi.yaml    | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 7e59dee15a5f..391c2a7e79de 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -97,8 +97,8 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-    patternProperties:
-      "^port(@0)?$":
+    properties:
+      port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description: Input of the DWC HDMI TX
         properties:
@@ -108,11 +108,14 @@ properties:
             description: Connection to the VOPB
           endpoint@1:
             description: Connection to the VOPL
-    properties:
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Output of the DWC HDMI TX

+    required:
+      - port@0
+      - port@1
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -147,7 +150,11 @@ examples:
         clock-names = "iahb", "isfr";

         ports {
-            port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
                 #address-cells = <1>;
                 #size-cells = <0>;

@@ -155,11 +162,20 @@ examples:
                     reg = <0>;
                     remote-endpoint = <&vopb_out_hdmi>;
                 };
+
                 hdmi_in_vopl: endpoint@1 {
                     reg = <1>;
                     remote-endpoint = <&vopl_out_hdmi>;
                 };
             };
+
+            port@1 {
+                reg = <1>;
+
+                hdmi_out_con: endpoint {
+                    remote-endpoint = <&hdmi_con_in>;
+                };
+            };
         };
     };

--
2.39.2

