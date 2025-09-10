Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C449B50AB5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D8C10E34F;
	Wed, 10 Sep 2025 02:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="emn5psqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DAA10E34F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:05:43 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2445826fd9dso74894575ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757469943; x=1758074743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zE+EZUy1vWC0mqe6ZjTgyhTREFlC0ZMwwUZ5vlxwF8I=;
 b=emn5psqav1oOhsBCf7Yh9Y33zH1MpJmH0Y9CEAMpAfUBjRRaN4ZZ0TN1EqL62KiV/g
 G96uv+YWRLeelTI7aC7xvv4kjMMrbEtBz5+1luf5EdBJ7devqI9iFlDN+OqRuZp16s4C
 n/AotXhhMqt8nIqg8/Lr0D7UoD/sAf+i7+EI2b+i8eAd65HvzD6BLHUaH2X98MwRpS8w
 3M9WOIIffQw4+o3TFGfNmPIFB4udAJJF93YZFsuKqbKNnj8ppL+ZSlECxk+NwbMUooR7
 5V3PUXFw/INwo3cUpb+k7BfZV1rCAQ9bKrWKhIon5xJjZtFdxwTea1Z5BCO9wzIbhiuo
 zB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757469943; x=1758074743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zE+EZUy1vWC0mqe6ZjTgyhTREFlC0ZMwwUZ5vlxwF8I=;
 b=QDzfF7CxX1dvsu6O54tY5s1LkBJuRauqQyWkew1KjIO0R4oLhniS5msNEz5K+BmjbX
 DeXpXQE7eZBcWFMA9IG9XeL2fsDOXxl6y5lW3efmKavHsEcl8F90gW9arSFn4XRAC3kX
 QG9Te5EXs1cEXLxVSCliUOEzFSsfrhsy0hHNQcIWo+TF1g/fTg/ivZ+oVd2VognzPyFt
 UY4rcRrGOEKHa+qQ/cCHmBGwfayW+db736v0M1DHWKX2X/Y4gUs/w2AELURJdsRCXFko
 8vWnmL1Igh3mAyu5cH2C0UHFsiMeefnfxltGQUzv+axrWVzmNntgsuLoN1bRknW6UatX
 KlOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX595cJTZZe9j+JiYLll/PNPTIIPgQx5DDBBba2XeXNsS8Qaq4phdpiiqtON7wu+JSdBqHCikNn0jM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaCINGKV6WUg5KIZeOm2jhmcMG+6dAQjewkMxQ3cioXxL33VuJ
 q2CpDx45/b1PTjRZyHGtVFdkhv1yBXl9b95/zN2XQ17mhO6uyTJA18ba
X-Gm-Gg: ASbGncuoWOyDTyZASyLNnuaVJ3Cge3iMzXszdzRs7q6+SxTmgfeDRNZGwHHJjFU4pBM
 IxJkHgvs1vkwt5XW1ZOtA64rpw9khzibFuKT+SCw+dcX0mIniqOKmsLQi5Me/3Nq0G6I9RAP9k1
 cW71rZlb4xghLKS3hFk8qqQ3Sqhi43IOr+wPuPxnTgLc/GJy7+tSMEgtDucVQEY9uHeKNwKuMhy
 CAABQXdXvoIAr16mzgRokGBTIyYWTixsit0+uzhhlWwOzQKQggSI4OJHqHtu6pPl8wFxvmg2E7Z
 yF249nDAUc3DQergFtLj0AIMs25T9ny/3CS/K2MeKTciqd3ccRZ6S90FYkKe9BFEXJxlOLt37Yy
 8ZOJAsv2dYUIO8r39HsaRmUr3H1GV6PUx37qD
X-Google-Smtp-Source: AGHT+IHfsM+uQNdeDlEV8Gi3sfhH4rxp5TEHRWiyAFDuYJhy1hRqhib9ntEdtEsP9dyG9OLtpdKBRQ==
X-Received: by 2002:a17:903:2a8b:b0:24b:270e:56d3 with SMTP id
 d9443c01a7336-2516ef54cd4mr178901465ad.4.1757469942906; 
 Tue, 09 Sep 2025 19:05:42 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 19:05:42 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
Date: Tue,  9 Sep 2025 23:05:23 -0300
Message-Id: <20250910020525.342590-1-festevam@gmail.com>
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

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..ce31b873fb95 100644
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
@@ -199,7 +202,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1

