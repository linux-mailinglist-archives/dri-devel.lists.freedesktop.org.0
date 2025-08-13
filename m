Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF81B24561
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23CD10E6B0;
	Wed, 13 Aug 2025 09:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V0UuzWKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423FB10E6B0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755077211;
 bh=AoywWFXPt1U7hz3T4fQSeToA2u6EsmMVO0TClTJKObI=;
 h=From:Subject:Date:To:Cc:From;
 b=V0UuzWKWUDTBXGCPUe5Zs6i+g5/6hNgJ5Rv9wRPJjMHRUWqTsSjH11YEUubVDqh0G
 wrUrTXdiUJN9u9UeE/6COEBfJDScc1Xmt/o9Ut+rzw2Nyx64jH8GuL4P4SI27u1YJ3
 U/wjejqfbeyHVuxLE5GXj61S9dRHUW24PtIzRHdxNJW6r4d/wcU/8Ue0HFAK+hZfEe
 AVJLMPO/sl3SnkZwLpvHV0/hSsQI0Cpsmo0lDMSep4cFlbfkwZW1us/noYgJ8wXYWm
 ++K6w3f87i1IslPZ4Pt6wk2RV7eHARYTKwhbLvnMhsSIeLlVT7UA3mxcVZ2ft2nU/r
 +DEq4ux5Mn41A==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FBA517E00A3;
 Wed, 13 Aug 2025 11:26:51 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Add Mali GPU support for Mediatek MT8365 SoC
Date: Wed, 13 Aug 2025 11:25:41 +0200
Message-Id: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZanGgC/y3MQQqDMBCF4auEWXdAE2JTr1JcxDjagSbaJBZBv
 HuDdvk/eN8OiSJTglbsEOnLiedQor4JcC8bJkIeSoOspK5MLdFnoxqNFGz/JpyWFa16GKUHZ++
 jg/JbIo28neazuzrSZy10vkbobSJ0s/ecWxFoy/jnFXTH8QNDPM2GlAAAAA==
X-Change-ID: 20250812-mt8365-enable-gpu-a39835dca7fc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077211; l=4686;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=AoywWFXPt1U7hz3T4fQSeToA2u6EsmMVO0TClTJKObI=;
 b=0NhWTT+jKcB7ZY2xJGYPN6+qAi8eG2/oFgZrzPKyRDahaVDGorLQEDi4LcQD+kDz18Qabl/zC
 JLlUNU0bU3nBE0xwPDn20/0P5BWQIFuiBuZWoWeMYdLCk3sxruFy5CS
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

This patchset adds the support of the ARM Mali G52 MC1 GPU (Bifrost),
integrated to the Mediatek MT8365 SoC, and its enablement to the
Mediatek Genio 350-EVK board.

I've tested this patchset on a Mediatek Genio 350-EVK board,
with a kernel based on linux-next (tag: next-20250813).

The panfrost driver probed with the following messages:
```
panfrost 13040000.gpu: clock rate = 450000031
panfrost 13040000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status
  0x0
panfrost 13040000.gpu: features: 00000000,00000df7, issues: 00000000,
  00000400
panfrost 13040000.gpu: Features: L2:0x07110206 Shader:0x00000003
  Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
panfrost 13040000.gpu: shader_present=0x1 l2_present=0x1
[drm] Initialized panfrost 1.4.0 for 13040000.gpu on minor 1
```

Running glmark2-es2-drm with MESA 25.2 is also OK:
```
=======================================================
    glmark2 2023.01
=======================================================
    OpenGL Information
    GL_VENDOR:      Mesa
    GL_RENDERER:    Mali-G52 r1 (Panfrost)
    GL_VERSION:     OpenGL ES 3.1 Mesa 25.2.0-1
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
    Surface Size:   1200x1920 fullscreen
=======================================================
[build] use-vbo=false: FPS: 513 FrameTime: 1.950 ms
[build] use-vbo=true: FPS: 507 FrameTime: 1.976 ms
[texture] texture-filter=nearest: FPS: 484 FrameTime: 2.070 ms
[texture] texture-filter=linear: FPS: 483 FrameTime: 2.074 ms
[texture] texture-filter=mipmap: FPS: 476 FrameTime: 2.105 ms
[shading] shading=gouraud: FPS: 432 FrameTime: 2.318 ms
[shading] shading=blinn-phong-inf: FPS: 389 FrameTime: 2.571 ms
[shading] shading=phong: FPS: 257 FrameTime: 3.903 ms
[shading] shading=cel: FPS: 235 FrameTime: 4.267 ms
[bump] bump-render=high-poly: FPS: 267 FrameTime: 3.756 ms
[bump] bump-render=normals: FPS: 427 FrameTime: 2.344 ms
[bump] bump-render=height: FPS: 349 FrameTime: 2.869 ms
[effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 134 FrameTime: 7.504 ms
[effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 46 FrameTime:
  22.139 ms
[pulsar] light=false:quads=5:texture=false: FPS: 384 FrameTime: 2.610 ms
[desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4:
  FPS: 58 FrameTime: 17.476 ms
[desktop] effect=shadow:windows=4: FPS: 250 FrameTime: 4.001 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
  =0.5:update-method=map: FPS: 80 FrameTime: 12.596 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
  =0.5:update-method=subdata: FPS: 80 FrameTime: 12.536 ms
[buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction
  =0.5:update-method=map: FPS: 99 FrameTime: 10.127 ms
[ideas] speed=duration: FPS: 286 FrameTime: 3.506 ms
[jellyfish] <default>: FPS: 113 FrameTime: 8.878 ms
[terrain] <default>: FPS: 13 FrameTime: 78.283 ms
[shadow] <default>: FPS: 155 FrameTime: 6.457 ms
[refract] <default>: FPS: 29 FrameTime: 35.077 ms
[conditionals] fragment-steps=0:vertex-steps=0: FPS: 528 FrameTime:
  1.896 ms
[conditionals] fragment-steps=5:vertex-steps=0: FPS: 333 FrameTime:
  3.011 ms
[conditionals] fragment-steps=0:vertex-steps=5: FPS: 533 FrameTime:
  1.878 ms
[function] fragment-complexity=low:fragment-steps=5: FPS: 471 FrameTime:
  2.126 ms
[function] fragment-complexity=medium:fragment-steps=5: FPS: 232 FrameTime:
  4.326 ms
[loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 468 FrameTime:
  2.138 ms
[loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 469
  FrameTime: 2.133 ms
[loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 231
  FrameTime: 4.337 ms
=======================================================
                                  glmark2 Score: 296 
=======================================================

```

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8365 SoC
      arm64: dts: mediatek: mt8365: Add GPU support
      arm64: dts: mediatek: mt8365-evk: Enable GPU support

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |  9 +++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 41 +++++++++++++++++++++-
 3 files changed, 50 insertions(+), 1 deletion(-)
---
base-commit: b07a7e2e073bce5df5974fb07be06d869149948e
change-id: 20250812-mt8365-enable-gpu-a39835dca7fc

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

