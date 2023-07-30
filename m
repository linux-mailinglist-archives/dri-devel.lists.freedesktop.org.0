Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBAD76872B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 20:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058B110E10A;
	Sun, 30 Jul 2023 18:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Sun, 30 Jul 2023 18:51:43 UTC
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6C810E10A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 18:51:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.229.201.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id B15C01600D2;
 Sun, 30 Jul 2023 20:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1690742508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rIjfNf3fQPSIJXgNJjDjWAUn7CeY7yXp/BQkpmY3epQ=;
 b=CycAV7ChKq2GloUgehfEl15dM8rK9D3uF/5ePIdk30DtoU1v0oXBWHG9daaEt4f077Kdjw
 qG9qZcwZ72MF8Pb5DsMy6MAHgp95SbugvVfeEfOWo+QXLq/1Bm0dpEpXDiAvVFeKhfVBuv
 e+zhTts70Lw6NtQ03qIPODtzp3P/2q0=
From: David Heidelberg <david@ixit.cz>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>
Subject: [PATCH] dt-bindings: mxsfb: Exclude i.MX8MQ from power-domains
 requirement
Date: Sun, 30 Jul 2023 21:41:20 +0300
Message-Id: <20230730184120.94984-1-david@ixit.cz>
X-Mailer: git-send-email 2.40.1
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
Cc: kernel@puri.sm, devicetree@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Heidelberg <david@ixit.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8MQ uses as secondary compatible fsl,imx6sx-lcdif, which triggers
requirement of power-domains, thou it's not required.

Fixes: f62678a77d58 ("dt-bindings: mxsfb: Document i.MX8M/i.MX6SX/i.MX6SL power-domains property")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/fsl,lcdif.yaml        | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index fc11ab5fc465..2d868276b0f9 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -129,8 +129,15 @@ allOf:
               - fsl,imx8mp-lcdif
               - fsl,imx93-lcdif
     then:
-      required:
-        - power-domains
+      if:
+        properties:
+          compatible:
+            not:
+              contains:
+                const: fsl,imx8mq-lcdif
+      then:
+        required:
+          - power-domains
 
 examples:
   - |
-- 
2.40.1

