Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E279B528C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 20:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCBF10E6E8;
	Tue, 29 Oct 2024 19:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mDxF8U+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D7110E6E8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 19:16:47 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20e6981ca77so62743005ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730229407; x=1730834207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HYm6/tVCLa0IRn8QK44VqcJkbGs60MVOw3b3ZJUZb70=;
 b=mDxF8U+KQMfuFa9CtNtcPq6ECl8ynpd4f3+QvTqJKaazSIp+aB4hd2j9tO/9UeJ1aP
 RkZCbHN3oy0+hiKMzxHnD1rYOLXJZs7CWguMcmhnVtk+zn4NplUp6OE89wesxSRTdz8W
 3gOpS3fs9r82QwPLeDPjX0pKbttQoJOw1psazIpdrREXt+yCdLSzhN0SK2c82iXHQCja
 VCptEyZedul9HMyKwi7Gam8fcTXrnwitxN4bjMAL8DbrI7aZ3D56GBxlMu/zoHsxq36T
 0IIpErBVz9FggmcFblZYzIYmEE4WiFmlVa+U4KKkQz6Mx4Z3DHlgmnv7Y6E/qnaPt3HO
 4HEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730229407; x=1730834207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYm6/tVCLa0IRn8QK44VqcJkbGs60MVOw3b3ZJUZb70=;
 b=AgdBSCyelzryQq1AfUMafENII2ahMintBhMrfKjsBF17U8RpLC871Jw+uO5ZD0vyNE
 uz0B9j6H5MaOF+1jE0Y+a4qwaX6u3S+TxXbBmodzLiW7KqPcnJ8BqBGiM3RO3ljbyBCT
 W/ez3ULhJAxEl7R7T2cTtCtwyniiL7Cy6s0NGDX0zvsDh+P4sbswcd0eK2aNjkB9VLLC
 YMGVNfwRgQQ5k6J+0vXJHlSO55EhBN1BCsLvXW5oxDj8qOp5HTN8EVikuGN1WsgUfqAo
 TP6anDg7OlJojyqBKWKEGZ/hFST1oTUeEzWn5s9GOlJa/zj2goH12a+ccpbX4xS2kJoc
 CpLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUZzVaSp+tlaTihtGxx7ynd/O91zGw5nwCYAkC7ph4iZGZhLy0Pi/EpI4r3hQ4UD6LwoNt7q+ipqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3IP8aq4n5pGN1FemPKPo5XDsriboinQ1lRqQBaDOkuAR2khlb
 0W+wcuxePWRSo2P32tYBrO16r1Q+HGOBhkmuGhgRcYRmFNeFPsdrZ8nLMg==
X-Google-Smtp-Source: AGHT+IFflxdhOOdhlw0WMMCci3BlMlyqQZ2ZA9xv59ogXANUwG9RzYtz7JlPEFXLPDfj8fEW5WQ+0w==
X-Received: by 2002:a17:902:f686:b0:20b:8ef3:67a with SMTP id
 d9443c01a7336-210c68744a1mr195187515ad.7.1730229407280; 
 Tue, 29 Oct 2024 12:16:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 12:16:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de, a.fatoum@pengutronix.de, andreas@kemnade.info,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue, 29 Oct 2024 16:16:38 -0300
Message-Id: <20241029191640.379315-1-festevam@gmail.com>
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
Changes since v2:
- Only document fsl,imx6sx-lcdif with a fallback.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..ad0cca562463 100644
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
-- 
2.34.1

