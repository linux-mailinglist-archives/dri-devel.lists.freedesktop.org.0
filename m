Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A418A3D79
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 17:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE27210FCD8;
	Sat, 13 Apr 2024 15:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DSVc7AL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAFB10FCD8
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 15:38:09 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56e2c1650d8so1705897a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 08:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713022687; x=1713627487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ExJoTB3hhXa5q9DtvmCjzuPMuLoa33GZY+I61ZoNag=;
 b=DSVc7AL8sNanHPOwjefb5OHqowb9ArRVSACBhJujB2tjnjhsGsZwIeRbT44LFCjZuC
 F3IR/yF+ROvwMearm97dceBnwYY4FXFKGOYezUr+BC0+DRevzCVildk6O7fOVfioj8BQ
 raMvyDIVoukNw3tthbFhAmo9lQzr8nr2fUpF8FcyJaEj2idOiP8qyYsQXi9ssecRS+38
 rG5NuUv/eVNcY7x+T1vwDUFgLQH/ljMYgcCUaaewh1DgqKvWJfMcc84dZRXWdfQwlFmT
 7/8Phe4YTeYywb5v+EEBhqXIJlSkTM87LjsCN0s+xmQDN2hJI49+MenuMwfjteDqY8Hy
 Ir1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713022687; x=1713627487;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3ExJoTB3hhXa5q9DtvmCjzuPMuLoa33GZY+I61ZoNag=;
 b=Zs0uEQSSZCA2AplXsWbwYlvMwvzNbGEKoKbSdEbGJK4nwZ+J+UVcSQrUOQMg9va6Zt
 AYIOCH8o/FdjaWqA5DkZb8nGiQsU+VOk62p2XD50kV/ZQIch5dXL7Tt8XUn9lce3BhC1
 yn5PVKZb7L8l3QMYtvklsUhKYuexMEyp09yK713OJuyCgYqasmH5IgjHSBk19fMdAZNF
 FclYOOEN6R9hPj8MaWRbMJOsgNKrSn45r/O2+1M1Qk4d9a8T0tUauhKI7WFWHO1avsEC
 e2y7nxPmQKJQpcOQfhSt2bfaaZ3s1TX24d5eBuVXSXVZ0m6OMz+Ns3Kanao+wH573SEz
 uxLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtgP3xw36Dg2psYgZMM1n38mMs9LEgo3Qwq/0kWF9rxpbSTD2os8Cdh3eaugy/47XY5WHOno84OVDsHMAEeTVRWzG+Oa+zAwm/E8WCCt1O
X-Gm-Message-State: AOJu0YwdxoNEas1QKNzMtDIDOWuMZvMMoxua+Rps0vRzcn3Nq9pPcLoj
 v2nlaN77Qp6oRRF8Vufa9XamgvUfyFOj9ypvXUy2K569g/WjHHhB
X-Google-Smtp-Source: AGHT+IEEl2sbrq/BBwP47g9sQFrSN4a3dH6bzRegvZZXLOpd9zEimISYPga1ISSsuvLUCDhddb9hpg==
X-Received: by 2002:a17:906:dffa:b0:a52:52e5:bb19 with SMTP id
 lc26-20020a170906dffa00b00a5252e5bb19mr758772ejc.40.1713022687356; 
 Sat, 13 Apr 2024 08:38:07 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 cx10-20020a170906c80a00b00a51b5282837sm3131680ejb.15.2024.04.13.08.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Apr 2024 08:38:07 -0700 (PDT)
Message-ID: <3a035c16-75b5-471d-aa9d-e91c2bb9f8d0@gmail.com>
Date: Sat, 13 Apr 2024 17:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: display: add #sound-dai-cells property to
 rockchip dw hdmi
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, markyao0591@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip DWC HDMI TX Encoder can take one I2S input and transmit it
over the HDMI output. Add #sound-dai-cells (= 0) to the binding for it.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../bindings/display/rockchip/rockchip,dw-hdmi.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index af638b6c0d21..2aac62219ff6 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -15,6 +15,7 @@ description: |

 allOf:
   - $ref: ../bridge/synopsys,dw-hdmi.yaml#
+  - $ref: /schemas/sound/dai-common.yaml#

 properties:
   compatible:
@@ -124,6 +125,9 @@ properties:
     description:
       phandle to the GRF to mux vopl/vopb.

+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
@@ -153,6 +157,7 @@ examples:
         ddc-i2c-bus = <&i2c5>;
         power-domains = <&power RK3288_PD_VIO>;
         rockchip,grf = <&grf>;
+        #sound-dai-cells = <0>;

         ports {
             #address-cells = <1>;
--
2.39.2

