Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F15887911E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C43B112D4B;
	Tue, 12 Mar 2024 09:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kx///rIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A3C112887
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:41:37 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D66AD13AC;
 Tue, 12 Mar 2024 10:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710236475;
 bh=eqk80KT5Hg0+A1d1PLo19GF//BADE5/tRXTctPDKUYs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kx///rIW2/IU8urV9myiMh2wZ5sU3k0F7F/IwOVKKHosnMWgZ2jKfkT6C+fBH6SmM
 Q5KJwNYE0m4JaX0OTKa/j6VN/nl0r+METdxc7r1rlEu+qNSDIEpZIFcBPcNp6ZOmrc
 LdOtzlvH3Pu6vEufySVRiW0xCgghFO7wo+gSTndk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 12 Mar 2024 11:41:03 +0200
Subject: [PATCH 2/4] dt-bindings: display/xlnx/zynqmp-dpsub: Add audio DMAs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-xilinx-dp-audio-v1-2-696c79facbb9@ideasonboard.com>
References: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
In-Reply-To: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=eqk80KT5Hg0+A1d1PLo19GF//BADE5/tRXTctPDKUYs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl8CNLSFAaEuuv54MbSbVeCFWrsPfOUtznqja5v
 V1IAykhV6qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZfAjSwAKCRD6PaqMvJYe
 9QXEEACuwaAocwwGrot8pawUgEAzFpXRCUg59ItcIBz6LhuMfoDFgbGiAtgwm9Mkt43NnDFtP8L
 Qr8A0HjYYTv7GCfV+MYuzUMhJ5Zf6ozXEK7pSMfiTPHSegCVf5bR2XTto/HyJWyDY/n4lPzBpB5
 RGbznfrP5PjmkHk40dR3bPoW3RH3oCPTjmdBwCfevr3a3T5+tVVxOxaRQHHF0jkwlxW3ny7nZEr
 DjtS/kosA+bPQpRgm20OWRwzo/YIIyRu/atndxvpySMsJFv65rR0Xyv6bgCGbvnZRbIYS53WgY1
 zsZTkvsKkkJQqMmwzHg7cLTBC0imhRAjwf95U55jqGXaNfBSyywiwk9pAWsXhDWrgE0pILGJKBm
 uvmYvrpxlr2yQ0N0soPFi3OsJkdybF6TvHw97qtX1MKM1fdkiQxic6BrcnsWcr/5n8B8hP8NwdI
 tT5JOrK3yTBC+DF07nr6yFa13jbSNQP3Ys+9GgNQnm0lE/9ARMYMbgE4jqMVpT5AFGJY5B14Jhy
 Tru6f5QDkjZ0bPNfVNJ2e5llYqFpO6VqBJF9XqrXAhG/SRHT/hcWP1NqCEE6BCcZQQpxu6RRL5z
 AZCXILfC0ExU1IRjUHmeDI07XdqoE5UvhVzit/PWzCbsCL6nCCpU90UdB4wNDJgebZqiIyD+jpZ
 bRuXeN3dxrK5DxA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

The DP subsystem for ZynqMP support audio via two channels, and the DP
DMA has dma-engines for those channels. For some reason the DT binding
has not specified those channels, even if the picture included in
xlnx,zynqmp-dpsub.yaml shows "2 x aud" DMAs.

Add the two audio DMAs to the binding.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index 554f9d5809d4..8a56ab923cca 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -100,12 +100,16 @@ properties:
       - description: Video layer, plane 1 (U/V or U)
       - description: Video layer, plane 2 (V)
       - description: Graphics layer
+      - description: Audio channel 0
+      - description: Audio channel 1
   dma-names:
     items:
       - const: vid0
       - const: vid1
       - const: vid2
       - const: gfx0
+      - const: aud0
+      - const: aud1
 
   phys:
     description: PHYs for the DP data lanes
@@ -194,11 +198,13 @@ examples:
         power-domains = <&pd_dp>;
         resets = <&reset ZYNQMP_RESET_DP>;
 
-        dma-names = "vid0", "vid1", "vid2", "gfx0";
+        dma-names = "vid0", "vid1", "vid2", "gfx0", "aud0", "aud1;
         dmas = <&xlnx_dpdma 0>,
                <&xlnx_dpdma 1>,
                <&xlnx_dpdma 2>,
-               <&xlnx_dpdma 3>;
+               <&xlnx_dpdma 3>,
+               <&xlnx_dpdma 4>,
+               <&xlnx_dpdma 5>;
 
         phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
                <&psgtr 0 PHY_TYPE_DP 1 3>;

-- 
2.34.1

