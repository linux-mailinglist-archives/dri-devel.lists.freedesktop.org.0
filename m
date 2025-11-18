Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B714CC69953
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038F10E4A3;
	Tue, 18 Nov 2025 13:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wg5h+YI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9EF10E4A3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:24:19 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7ad1cd0db3bso4663540b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763472259; x=1764077059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JfHC3Wbcd3Ds6ua6qw+uzzcAe5uA1zhG8wWh+jJWWKk=;
 b=Wg5h+YI0b65gJ0gNyxNYOI2oGNix/vpfSdf9Eh1N7h1WXtZYIhr3IPDVGbAcCjCWFe
 QM9+eNUTMYzVejdMjLXNDTsxrW2INauM5R3zlqPOSdE2OUJgypw1XsKL3e5z3rGUf14c
 4cX1lWhhpjPgy2X9qdKRj0YCdLmLiH+yRpxte3ITWPoZqpiUu0W/z5plBtbYl4fl4t4q
 9H8o7qQgcwap6zlR2sJzS3P67WyRvtVKFSlYt3Nf6movvr74UUAuHJJIXyQplKr9khtG
 R27p0wSRXhEXp+tuJ8XEHtij/b+hWTkU/3ilGkRxMEUpnfF+qBhLQ8qDpzGgq6mh7FJV
 Tmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763472259; x=1764077059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JfHC3Wbcd3Ds6ua6qw+uzzcAe5uA1zhG8wWh+jJWWKk=;
 b=gD57GeEvyiOstP9XRE9R+WugSf05maYyKoAFQdVtCtVkrXeFZI3xVos0nWHWZotaOP
 BOAVPRqS2Rii7uGNodmRZnAlxI6VDDUI6IH16yHELJ/n9iOv+poP29R+VSNUwM9Cevrd
 bK1tdySjNGqL/vrzpPNwAgTNCh/pP/LazOodBsQXuKKB4C6Rw6M3SMGKcnXXM8WB9HVn
 /qwINv+L9zE/5CDdnvJBUpDOlBbSVpN1oM2/8M2wi3HzgT4zHz46MagVXBxf52Whv0o5
 Cq3mPKN8AmmnX9Hh0uNG7ByS/zUjFxklRsZGTrvs87QE7tEQUeGczBHaPExg7D0W+1Yt
 TGnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViacYewLU2ZABXSSq9cGshfMPpPE3q3ZdcaZ65Eho/+IGda3vtlDBDZQBmEj1UOfGsUcdQz0ewEI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRBoS5c1gvORcTqHfUQVc8chiMRT/EeOnicpSRnF2YR3TN8ZOz
 20uzM9vhZ8MD8h/ZaDuWn9wrVdOKmAD+Q1LN7a12g2tZDF2Ge+iCqYVs
X-Gm-Gg: ASbGnctcTKXnITxsD4LazjZ5slSfw0qpelpmWDAoQiSAxmEddo89LsI+BAoIYHFoMJG
 8eALVQqdbhKv/vDIpMPRkNYlrsFRyiKQiGklbWyqm3iVeeFwvH12zkJUf0qgBC8/oZdABv9HfNr
 pDCd/GZkOrciJaiWkDpCoQdd7KikSORu+rdFyTj2k917BHyz9Mcr6HwMXaXDhIj3c6XLHTd4bJw
 JOf+8BFopCOKJkk2KJyHWe07FEH77IXPbYv4Dnjddm6noqgl6lq3BjYe1Vo00g5MRyCTkFeRJKg
 nfff2F2qtI16bW+KXDznmRFnJqF301bSmOZuMUItXOVm6e10DSXvtJI+4Wv3CKLdoqN774WHE39
 6zbqAi3G4LFc/7+XwynED/OAN5aLqpTu/+Qgitgeyfle4yfkiYr3vSrAXu4YnRgOoPRllEsJOWh
 jh2yaHcGoXXoh8DBTHMPGywr5DIOyrnqLVkA8=
X-Google-Smtp-Source: AGHT+IEjOHi7qZdY1X7C4XG0KQgH5xR1MDapZ2pWxtotMjqqRBYXWUWNxE9uH3alv8dfQKa3CAlMSQ==
X-Received: by 2002:a05:7022:3c15:b0:11b:c86b:386a with SMTP id
 a92af1059eb24-11bc86b3a2amr3153643c88.5.1763472259170; 
 Tue, 18 Nov 2025 05:24:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b060885d8sm66885134c88.2.2025.11.18.05.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 05:24:18 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: bridge: ldb: Document nxp,
 termination-resistor
Date: Tue, 18 Nov 2025 10:22:07 -0300
Message-Id: <20251118132208.143315-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the optional nxp,termination-resistor property for the
i.MX LVDS display bridge.

This boolean property indicates that the built-in 100 Ohm termination
resistor on the LVDS output is enabled. It is controlled via the HS_EN
bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
signal quality and may prevent visual artifacts on some boards, but
increases the power consumption.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/display/bridge/fsl,ldb.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90d..6bc786204e65 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -35,6 +35,15 @@ properties:
       - const: ldb
       - const: lvds
 
+  nxp,termination-resistor:
+    type: boolean
+    description:
+      Indicates that the built-in 100 Ohm termination resistor on the LVDS
+      output is enabled. This property is optional and controlled via the
+      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
+      quality and prevent visual artifacts on some boards, but increases
+      power consumption.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1

