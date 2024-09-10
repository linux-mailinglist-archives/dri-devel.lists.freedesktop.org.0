Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FAC973614
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 13:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536EF10E797;
	Tue, 10 Sep 2024 11:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wAZgJ9Dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1EE10E797
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 11:19:42 +0000 (UTC)
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BBABC8A;
 Tue, 10 Sep 2024 13:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1725967104;
 bh=NITUG13tg6OeRjUeeRV7q4yVc5SHqZar4SuO8+29cuA=;
 h=From:Subject:Date:To:Cc:From;
 b=wAZgJ9Dwzdy0Cy+BVVn5PYr7PFtBpzLdqbkdrdKJQzvzuIJMUSUkBJLjYAwUbDFYC
 vVUGAbxYZFVmcpGoKvthtIWHC/WIbsD2w3kPyOgL/xeYGD5MJgQZLrDfZWX4omnYEl
 d8UckE94fKz9ZYFpWYejNYBEGTlmdou1Afcw/3co=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/3] drm: xlnx: zynqmp: Add DP audio support
Date: Tue, 10 Sep 2024 14:19:18 +0300
Message-Id: <20240910-xilinx-dp-audio-v3-0-75560793f4d0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADcr4GYC/3XNQQ7CIBCF4as0rMUU2lBx5T2MiykDdhKFBpTUN
 L27tCsTdfm/ZL6ZWbKRbGLHambRZkoUfIlmVzEzgL9aTliayVq2dSMkn+hGfuI4cngiBd6qA6C
 QTjvVsnI1Ruto2sTzpfRA6RHia3uQxbr+t7LgNVdamU47MH2vT4QWUvB9gIh7E+5sJbP8ZPQ3I
 wujJSpsoDPQ2R/Msixv8Z7ofvwAAAA=
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3325;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=NITUG13tg6OeRjUeeRV7q4yVc5SHqZar4SuO8+29cuA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm4CtFkj2OEzt5vjCDAw7ixveNwniJGPXDDCDjG
 3q9ejfqVZyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZuArRQAKCRD6PaqMvJYe
 9cOBEACK/WWJMncR8gV/veFBv7cUYc7po2u4ALuJ/rDNhCEQjnerX31CWZOFsBTiRQpIKzWSFYP
 vGZCwxwunaszhccgL05hhkYN8v7dKgpuLgFJicmjLq/OpE3KJoyDSIwwtcyptzMPPAuV7nz3976
 WamvaCeWoB/J9B1cFqan2GK09+XCW8XY2+DCFLEYStNoYm/4ZyzMMbH1b1AIrtn8nfEfwd3A2AO
 0TL4YHSMJcuyOwXqf51pu47u/vrg0FESIO9SXowYExsaM4sfOZICfPVgVnQfpZk9MDCZwPubmUS
 yGXQcRrHADZcKop3zIATQszwQtgBxuQiXRkDSplVhB7pISQLa1okZkWQYKyJ5nnsC7nvFQsqDTY
 1f2nG0Q5TNoXTgzzHaxUlrCuqG0NIJavKf8jmt5r+e35c62Pj0w1Hj1Bg7yVS9ZOwTzhPRylJqJ
 v15kk+z8IT0ES9nSzSXTSOSTlR9S/CIEyl+K4yNyIn1vNJLmrPQgt7DjZZ2TyYEmgFtjtwMIato
 HVgcOF+sQ/qv8a+9Qgr0+bf6OnU24eC7FUK3oC6EvxONdvRuBUgsqyonWH589Cgnp+O5NCaAI2I
 OObfIKVT0fHCtVrj8DyIIOm5oESeONwDRenPvW0XLF6XYnAtsoKN3bi2JRLWqvLKd1BAepeYRdj
 Bf9RdgmrHaZbaHA==
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

Add DisplayPort audio support for Xilinx ZynqMP platforms.

This depends on patch adding cyclic DMA mode for DPDMA driver:

https://lore.kernel.org/all/20240228042124.3074044-3-vishal.sagar@amd.com/

If that patch is missing, starting an audio playback will fail with an
ASoC error. The cyclic DMA patch has recently been accepted to the DMA
tree.

The current DT is, for some reason, missing the DMA channels for the
audio. This series adds that to the bindings and the dts file, but to
support older dtb files without the audio DMA, the driver will not fail
if the audio DMA is missing, but will just mark the audio support as
disabled.

To: Lars-Peter Clausen <lars@metafoo.de>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Michal Simek <michal.simek@amd.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Vishal Sagar <vishal.sagar@amd.com>
Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Péter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Changes in v3:
- Expand the description in "dt-bindings: display/xlnx/zynqmp-dpsub: Add
  audio DMAs" to be more clear about the DT binding change.
- Rebased on top of current upstream
- Link to v2: https://lore.kernel.org/r/20240319-xilinx-dp-audio-v2-0-92d6d3a7ca7e@ideasonboard.com

Changes in v2:
- Fix a missing double-quote in the DT binding
- Link to v1: https://lore.kernel.org/r/20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com

---
Tomi Valkeinen (3):
      dt-bindings: display/xlnx/zynqmp-dpsub: Add audio DMAs
      arm64: dts: zynqmp: Add DMA for DP audio
      drm: xlnx: zynqmp_dpsub: Add DP audio support

 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   |  10 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   7 +-
 drivers/gpu/drm/xlnx/Kconfig                       |   9 +
 drivers/gpu/drm/xlnx/Makefile                      |   1 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |  48 ---
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h            |   7 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  54 ++-
 drivers/gpu/drm/xlnx/zynqmp_dp.h                   |   7 +
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c             | 461 +++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |  39 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |  15 +-
 11 files changed, 553 insertions(+), 105 deletions(-)
---
base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
change-id: 20240312-xilinx-dp-audio-468ad12f9f64

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

