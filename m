Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296B45C843
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64796E940;
	Wed, 24 Nov 2021 15:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743BB6E947
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:08:23 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 618D4800A7;
 Wed, 24 Nov 2021 16:08:21 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	david@lechnology.com
Subject: [PATCH 3/6] dt-bindings: display: sitronix,
 st7735r: Remove spi-max-frequency limit
Date: Wed, 24 Nov 2021 16:07:54 +0100
Message-Id: <20211124150757.17929-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124150757.17929-1-noralf@tronnes.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZLv5Z0zb c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=3IttHYtGSP5F0p6lhesA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The datasheet lists the minimum Serial clock cycle (Write) as 66ns which is
15MHz. Mostly it can do much better than that and is in fact often run at
32MHz. With a clever driver that runs configuration commands at a low speed
and only the pixel data at the maximum speed the configuration can't be
messed up by transfer errors and the speed is only limited by the amount of
pixel glitches that one is able to tolerate.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 .../devicetree/bindings/display/sitronix,st7735r.yaml         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index f81d0d0d51fe..157b1a7b18f9 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -32,15 +32,13 @@ properties:
               - okaya,rh128128t
           - const: sitronix,st7715r
 
-  spi-max-frequency:
-    maximum: 32000000
-
   dc-gpios:
     maxItems: 1
     description: Display data/command selection (D/CX)
 
   backlight: true
   reg: true
+  spi-max-frequency: true
   reset-gpios: true
   rotation: true
 
-- 
2.33.0

