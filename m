Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F049B83748E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 21:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3394610ED23;
	Mon, 22 Jan 2024 20:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E477310ED32
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 20:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E9F70B811A9;
 Mon, 22 Jan 2024 20:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2388EC433F1;
 Mon, 22 Jan 2024 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705956664;
 bh=cD2X26TCLky80GPoDVS7IZ4B/2/aC8m0TzrgrR2pAl4=;
 h=From:To:Cc:Subject:Date:From;
 b=tlVgspKRLXT64aZlDEUrm580u6cSI3uGk3uXztzHuCUOuIn1ir55bWdzRhWh6mqcz
 DXBawWcQ8oeo4s7uzmXKf13oB9svg3exL+hNwzEqGeLb4txve2/s5geRtfYIZvk+tP
 kJWBh92NpvpZWha4whVzLj0wJAhXIsiYXFaVPVIawBuTO3oTMiMJQILUBHoKysEvM8
 TbNhlKyBJJr735OnqYcZokBoomnYkvQVKSe+kgt7ugkYhK0C8b1d4iQycS0cfy8wAE
 onPk31WX93H5xNgrLAboH21GZiStC0nF2lH0BghVJCFjLGLp5f8BWdBPe4P2iJPVPE
 cO5RpXyAmhBmA==
From: Rob Herring <robh@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH] dt-bindings: display: nxp,
 tda998x: Fix 'audio-ports' constraints
Date: Mon, 22 Jan 2024 14:49:58 -0600
Message-ID: <20240122204959.1665970-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The constraints for 'audio-ports' don't match the description. There can
be 1 or 2 DAI entries and each entry is exactly 2 values. Also, the
values' sizes are 32-bits, not 8-bits. Move the size constraints to the
outer dimension (number of DAIs) and add constraints on inner array
values.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/bridge/nxp,tda998x.yaml    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
index 21d995f29a1e..b8e9cf6ce4e6 100644
--- a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
@@ -29,19 +29,22 @@ properties:
 
   audio-ports:
     description:
-      Array of 8-bit values, 2 values per DAI (Documentation/sound/soc/dai.rst).
+      Array of 2 values per DAI (Documentation/sound/soc/dai.rst).
       The implementation allows one or two DAIs.
       If two DAIs are defined, they must be of different type.
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 2
     items:
-      minItems: 1
       items:
         - description: |
             The first value defines the DAI type: TDA998x_SPDIF or TDA998x_I2S
             (see include/dt-bindings/display/tda998x.h).
+          enum: [ 1, 2 ]
         - description:
             The second value defines the tda998x AP_ENA reg content when the
             DAI in question is used.
+          maximum: 0xff
 
   '#sound-dai-cells':
     enum: [ 0, 1 ]
-- 
2.43.0

