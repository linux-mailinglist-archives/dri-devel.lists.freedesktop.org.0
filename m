Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE8F84274C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AEB10F308;
	Tue, 30 Jan 2024 14:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C3410F308
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 14:56:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-55ef011e934so3221901a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706626546; x=1707231346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+gO8ZOe0pnwzVp9ud1Vv3npsbTRCsdAJJfeT82uG86Y=;
 b=gk01vqXGMkWsw/0CHiTVrzJXDf3O8IhRDqKUw89mqjkE3qucoAcsrHkuBNjWnr5Xdy
 ArIzH8cwAEZQsQbjHw63PC25iqDVKjDxqgt2qp4/WHgeagiEzl9wkMxPOLsRtdVQEv0U
 SVM25j4wohZVdS4DaPCE0bK2m/Zm9ynHmSEse6GPmEdQBiNxGuqYJZu70EzPSyVfR2s4
 Ncf9Cd9v2Anw683HcBXQWxMQzs0+NJIN69WcD5kjVXzVFiwKt9s9qemzgioQ8aQUrfI+
 KT0PFcOctfM/rKdIIFqXATSwjKuzZcScwmH7qbfB2KTAJ/S6Ffgtw7d1EGOQh90lh74Q
 E3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706626546; x=1707231346;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+gO8ZOe0pnwzVp9ud1Vv3npsbTRCsdAJJfeT82uG86Y=;
 b=aI4GqhoLFMUdp6G0NpCXSoOhclGIrXFNqXeYzk7i0kAfdMqgsDFKXLI+U/vKTN30ib
 5Ve7A3JLj0OKSO61IcNCyOQPyC0mhWjc32j9xdKX9+8H12sZ3HfEJH39PR3rf8gCC3Xg
 GBWwNmzX6LNMybY+ixrv96RiV8pLumtr7v9DR9QkP8syHGanQwSkQw8j84JWA0U5MQBu
 +JognUouFnFCQwOCaGpTIbS4l6iPbMjHHX35nqoY9ZEQwptqd+gQdjz0Am/xxsoZEuaM
 i3iidImkYS4lraynxXHag5FPKJ3MaPIkqutlE1g7JjjU1lGjvovSLe1LUKjslAPKRRXT
 0egA==
X-Gm-Message-State: AOJu0YwOytb+WYOfQl4rC2MOpNpTzBp75lGTVhc2rLB6WfxQyc5AgBcH
 w6C1DzmBQ5yQ5hoEJLhhoKsu8WmOlQV91w58NXrzNvbwgbo7SU4X
X-Google-Smtp-Source: AGHT+IFRi9GyQXJSDsExLjRideZaSaED5yGKhx4CIr1ncWL2nfC+HtMvB4YtSvuuO6qpUWW+snUifQ==
X-Received: by 2002:a05:6402:b4c:b0:55f:327c:d18a with SMTP id
 bx12-20020a0564020b4c00b0055f327cd18amr1583915edb.36.1706626545234; 
 Tue, 30 Jan 2024 06:55:45 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXqWmkvvZvd/lwxAk5iOs/VBqiWjnua4Cq/9D+o3F2xLZwmzEJMPNiiOjtfh9LrBXqnGvYMSd88PILzT8o3xzK9P+3yp3sqWYnh9NLKrY0hvwe7NU7JZQ0IbQ8uR0NFWWsIngFyK6hMspO4slIDwkejfYFCHuDhg5YWuYQ/j3lMjtmfRzxgplPg2gvPKKop3D3KOYnfFzFnkqtGcNM3AaUafagYD8RZAwUsC0Q8WDsXGVMdxReIZkzlhXqdhnP4oYMKjAA9x8mQyMmNeBh7DPxdCSUGhKGkGheL0vvxU9eK5QwO+oIbNs+WT7znL8d4caxfiZycFAURrmrN+sJlfk0kVLLBXN8vvHv91bOoDXxlmnRQYv2chZzfs/3g0GmQI8VCmU6orQxG8n23lnDYRaqkTeCBK5lhr+MLgbWh8vkgr2rCD1NC5KvR+vVRMmbo5YZOe0dqCTHw4D4W6ZdVi5xMUZptn1m/ttlJjjyk0AApmbHio84E8u7Rf+v2dribs36sZUh7b6hdhSrvM/TMQcpHXiLPf7nDUI8=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa7da47000000b0055f0c027a3esm1879542eds.30.2024.01.30.06.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:55:44 -0800 (PST)
Message-ID: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
Date: Tue, 30 Jan 2024 15:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/6] dt-bindings: display: rockchip: rockchip,dw-hdmi:
 deprecate port property
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, andy.yan@rock-chips.com, airlied@gmail.com,
 markyao0591@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdmi-connector nodes are now functional and the new way to model
hdmi nodes with, so deprecate the port property and make port@0 and
port@1 a requirement. Also update example.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../display/rockchip/rockchip,dw-hdmi.yaml    | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index 7e59dee15a5f..cd0a42f35f24 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -97,8 +97,11 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-    patternProperties:
-      "^port(@0)?$":
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        deprecated: true
+      port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description: Input of the DWC HDMI TX
         properties:
@@ -108,11 +111,14 @@ properties:
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
@@ -147,7 +153,11 @@ examples:
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

@@ -155,11 +165,20 @@ examples:
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

