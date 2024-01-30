Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55B842758
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2472E10F86F;
	Tue, 30 Jan 2024 14:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851FA10F86F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 14:58:26 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-55a9008c185so7124996a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706626645; x=1707231445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yBP1sbQ2NlcbjUdIKedXdoU619EWO8zH/xknpjbpMbs=;
 b=LaGRpMYdsHOhQsQbvERg0Z3+7VftErp+kqQSAGGhymRRN1DxrFjVCKCpx5ZEbq+rNT
 W1AFApZw4kusk+mh+bJG2MQLJRwK4kdXA41/J2KCY2lq88EaBVYsGlYDpcXMSP+iIKd8
 Bjopub9xMDoB0h0T5iV1HUDRvYyuh8IDprzhvThwV3/i2kEyfYG8ZDCZMYSCtoSJHy7M
 wj3m6LBwfCWWlYjWEVDG2F4SqSu5J+tj2B4MvQ4coL4SwlYJAUpSlBvFId49e5chVJ73
 IIu3xuf0LMZRXYsAbD6dMc95kIGVPMBLqJ80QRZTmX+qEddLA5tNRFekmqiLVAbX2PLx
 Yiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706626645; x=1707231445;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yBP1sbQ2NlcbjUdIKedXdoU619EWO8zH/xknpjbpMbs=;
 b=pBRGoz4lMpV5mYVO7kWBgi6KFWqO1IVY98z65ddeixDLWQV5zWRh8ZLj0f03dzMKih
 b7SYbryXdieaINAxJqA+VRP4BkJg0WjctgNYVMfgecce0fdrAoQ2nNFA8M6Wj9wqUrza
 Ab9PqkkOoRSNkIUxYasMef3cW6ZYTugRcRGkqqMscaWGi+g2h6O5rRSm5WU9PYfjr9Cm
 Nwxd4cFmaZxeJ2/EeCmhZIeF3TXDO/bBpDoNJS36sR62uW4/Htqb9mfPr2nulXn2tL0C
 A5craqBLBLm4gEbK7i1uI+OHnvXbjUWWKB+pLlCY/XLUGOAXKDlHdOqJZQV5k/wqrz8N
 LVXg==
X-Gm-Message-State: AOJu0Yw+gep80ZB9J5uEgt+wqHfexOFqTCMM9WXquEhSf8SADhnaJN8k
 pgGmSOzrXrw9B6+CVsR3AjYS55F78StniyiJupsIDBB6kph+zE9F
X-Google-Smtp-Source: AGHT+IH//S6wHUjFESQBomnwxG2DYoedW49QyrUW/xp6mvOC/FyH5Af9zjaHLj1VUrPKp0hJ355nag==
X-Received: by 2002:a50:c317:0:b0:55f:3353:3f5f with SMTP id
 a23-20020a50c317000000b0055f33533f5fmr1906511edb.1.1706626644679; 
 Tue, 30 Jan 2024 06:57:24 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWD66v/nfypZCrDeVMlFSJTke9rSFnz4LEWI5XDkPB0fIraAKLfu6mEMXGHcIuQO7Pse/Ni6Bo99H8azYLPwTKhq+rqHwYxKilKFAjPVhVIb9a3WOs8hGvfMxENUDzoQ4VJYpNCz3T+ZSWpipsBmX5z4C6QsCrqROr5OwmysLw7SGoy+/KR3Gu1Jofz+h8B2Gyh14swkAwMXk60fqxZdp6Zt4Vj2YK+QWucrV9ymDnAn0tDHrUmPdyf3lJCFWB1i5QAt3HgTcQjyGzo94dHNle1VVQ+XJ3489Z6bt+yEdZbmxfREBkFdg2pQJ9npQ0YN72FkBBqjAPAlt4hZDg94VMvKEGbZbtYpzOl6Eln+7t1WwXcRfZ3XflyDDIkfg5GXTEDmOTpbbOEMojfpmnr+ro/nMcoco3rs7i02aUMZaugZy6ncBWW5+a/RCdwlciXgO+DkLDJFLElYJlaEb4+1laq34wtqzLloBAsh+KwIB93yD2qVmg305liBHJ9DICey9RVdvDTRrEd+oZahc/jZ+mfFbihRvnnYFs=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa7da47000000b0055f0c027a3esm1879542eds.30.2024.01.30.06.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:57:24 -0800 (PST)
Message-ID: <1ba8b40d-005a-4665-afd9-a4eacf3e3031@gmail.com>
Date: Tue, 30 Jan 2024 15:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/6] dt-bindings: display: rockchip,dw-hdmi: add
 power-domains property
To: robh+dt@kernel.org
References: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
Content-Language: en-US
In-Reply-To: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
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

Most Rockchip hdmi nodes are part of a power domain.
Add a power-domains property. Fix example.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../bindings/display/rockchip/rockchip,dw-hdmi.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
index cd0a42f35f24..6f421740b613 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
@@ -94,6 +94,9 @@ properties:
       - const: default
       - const: unwedge

+  power-domains:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

@@ -141,16 +144,18 @@ examples:
     #include <dt-bindings/clock/rk3288-cru.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3288-power.h>

     hdmi: hdmi@ff980000 {
         compatible = "rockchip,rk3288-dw-hdmi";
         reg = <0xff980000 0x20000>;
-        reg-io-width = <4>;
-        ddc-i2c-bus = <&i2c5>;
-        rockchip,grf = <&grf>;
         interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
         clock-names = "iahb", "isfr";
+        ddc-i2c-bus = <&i2c5>;
+        power-domains = <&power RK3288_PD_VIO>;
+        reg-io-width = <4>;
+        rockchip,grf = <&grf>;

         ports {
             #address-cells = <1>;
--
2.39.2

