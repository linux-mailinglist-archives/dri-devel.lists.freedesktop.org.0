Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02359B929F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EB310E9D7;
	Fri,  1 Nov 2024 13:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PHi5uF8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF8810E9D7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 13:54:26 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-720d5ada03cso369972b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730469266; x=1731074066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=;
 b=PHi5uF8ZrZNvMhZdzqsHGhXYGZMzk1dm5U4crKLy9I2KDeXK2rQ7CU60Qf2LXr50Ej
 QK1GQ8XAhI+jj74rCO4I+HnO1yq5e8lKp0GkWjbeBUuz6WqhYcagat1/r3yu8SdmbduU
 yWrT11M3UFSpIN0aUZX7Ryht2mqPcJ+jUmanGhzX2umynp7A1Ul8+RGQ7n9S/UW0TOAV
 Er8v5nx3AC0hFB/5jzf68D9jU4R2cMRgFgr9T1C9EzU1Gdxn3YTLNVbiafhd0KjNUORK
 gUhQvQAotnW372FC9P7q1khgLRWrj0WsFdPxFq2IEWo1h2Fa7nBzScNCQz9l88JZSQZL
 D25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730469266; x=1731074066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=;
 b=T9IvNrBrUIzGwhqnpsco768RI5F4KA3YiLyok5Fw3Ni+Dq7sgcfxmlU9639+el35O0
 e9bhNFiZhpEH3esRqQ2/GDIMDF83jeJUbo4uRWYO83w81qj3AqRoDMnlDoZ8ont5gCIN
 oKSMCqcy2Xa0k9AFXsxas4rssyk4T1uTxaimLjPxjrxr6e8oceKyeKCjpVB+ZPNIQ/hS
 0CaPi7it94z7FlgPcxdX4/RwaO0Jv7a6E9GJ/FiFZAX2cMuF4+fdMavYp0ZD9WhYMkcF
 0ng2wDk7a/lgzwzcuaSWYNzinGL/rVpcUZvNY32kM+QLMAJ2ofN2ufTbUBsn6AuZ1TG/
 8/OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLPTJLlenAtYIzuzk3ztQ8h4o040JVq3b3ILPFI7yPzejzHF+cVUmWKlxX+6ZzcUug8lFEjRalGU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRqw2EFBgnepMunLviAPK8OSqNFLwWlIdmtSRB3y2gMfJ5DzUB
 HRrSO/+YDgt1QiPfxKm7wq4wZEnCUV/bS2KH9XKHmMAdJUTsTssBP7nTMg==
X-Google-Smtp-Source: AGHT+IFDJu2muMMX574LjGpxqR6z30/n/2YRYNEjaDajZtXr5fX5zoOaIGrofmuOBUvyB3txoWtOUA==
X-Received: by 2002:a05:6a00:2d9c:b0:71e:6a57:7290 with SMTP id
 d2e1a72fcca58-720b99f28e8mr10309705b3a.0.1730469266034; 
 Fri, 01 Nov 2024 06:54:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:54:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Fri,  1 Nov 2024 10:54:04 -0300
Message-Id: <20241101135406.47836-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Also update the example.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..aa3204b6aff9 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -19,7 +19,6 @@ properties:
       - enum:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
-          - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -32,6 +31,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
@@ -182,7 +185,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1

