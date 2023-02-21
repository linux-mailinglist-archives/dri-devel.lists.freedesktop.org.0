Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B369E8CC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 21:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9709010E18D;
	Tue, 21 Feb 2023 20:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8747A10E18D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 20:04:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 07DE485917;
 Tue, 21 Feb 2023 21:04:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1677009857;
 bh=1qr5cvYf8jeOiYzdXUoMig1VLxMb60u49LInU9530xQ=;
 h=From:To:Cc:Subject:Date:From;
 b=D2exX44nDxfOuN+Y1ESq02iroyC4DQVMjBiyngjBceTpWiAvM4jSz+wm0P3ow1VoW
 LtJNH1dnoQ73s68SxAqEbFqVG6mcFNPlIatHwKBqtNDeDOR9W0Uf3LOAs+dwmgBQV4
 r0o54v7u2DgruiWSs3Wo4shsaqqPyjVSUWV76gG9ThCqcFdZNFPEtOM+ZmYZxLoSSv
 nThMzdcwy7moSLn7wjJp6+sSf69DPkbd2+jHYIIGArMj/Zw5HSQFVTVpYDmMTZFddb
 ZfFg1x0pcB1S9A8GVvEAcjfHrcbAKdU45fQAuOQcKG88s7iq9f69ziHyFo9CFUDbVW
 t0xd1aEG9mO3Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: Start the info graphics with HS/VS
 change
Date: Tue, 21 Feb 2023 21:04:07 +0100
Message-Id: <20230221200407.16531-1-marex@denx.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VS signal change is synchronized to HS signal change, start the
info graphics with that event, instead of having that event occur in
the middle of it.

Scope trace of DPI bus with HS/VS active HIGH looks as follows:
         ________________...__
VS...___/__         __        \______...
HS...___/  \_______/  \__...__/  \___...
        ^                        ^
	|                        |
        |    Used to start here -'
	|
	'--- Start info graphics here

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 .../bindings/display/panel/panel-timing.yaml  | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
index 0d317e61edd8f..aea69b84ca5d8 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
@@ -17,29 +17,29 @@ description: |
 
   The parameters are defined as seen in the following illustration.
 
-  +----------+-------------------------------------+----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vback_porch                 |          |       |
-  |          |        v                            |          |       |
-  +----------#######################################----------+-------+
-  |          #        ^                            #          |       |
-  |          #        |                            #          |       |
-  |  hback   #        |                            #  hfront  | hsync |
-  |   porch  #        |       hactive              #  porch   |  len  |
-  |<-------->#<-------+--------------------------->#<-------->|<----->|
-  |          #        |                            #          |       |
-  |          #        |vactive                     #          |       |
-  |          #        |                            #          |       |
-  |          #        v                            #          |       |
-  +----------#######################################----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vfront_porch                |          |       |
-  |          |        v                            |          |       |
-  +----------+-------------------------------------+----------+-------+
-  |          |        ^                            |          |       |
-  |          |        |vsync_len                   |          |       |
-  |          |        v                            |          |       |
-  +----------+-------------------------------------+----------+-------+
+  +-------+----------+-------------------------------------+----------+
+  |       |          |        ^                            |          |
+  |       |          |        |vsync_len                   |          |
+  |       |          |        v                            |          |
+  +-------+----------+-------------------------------------+----------+
+  |       |          |        ^                            |          |
+  |       |          |        |vback_porch                 |          |
+  |       |          |        v                            |          |
+  +-------+----------#######################################----------+
+  |       |          #        ^                            #          |
+  |       |          #        |                            #          |
+  | hsync |  hback   #        |                            #  hfront  |
+  |  len  |   porch  #        |       hactive              #  porch   |
+  |<----->|<-------->#<-------+--------------------------->#<-------->|
+  |       |          #        |                            #          |
+  |       |          #        |vactive                     #          |
+  |       |          #        |                            #          |
+  |       |          #        v                            #          |
+  +-------+----------#######################################----------+
+  |       |          |        ^                            |          |
+  |       |          |        |vfront_porch                |          |
+  |       |          |        v                            |          |
+  +-------+----------+-------------------------------------+----------+
 
 
   The following is the panel timings shown with time on the x-axis.
-- 
2.39.1

