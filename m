Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D453C87911A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295D5112758;
	Tue, 12 Mar 2024 09:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qSi5GOWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C70112758
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:41:34 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA2BE6BE;
 Tue, 12 Mar 2024 10:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710236472;
 bh=2aEimQhgFxmWJYn6GcjIbcGQw3slBQN7rqnpfFA3a7Q=;
 h=From:Subject:Date:To:Cc:From;
 b=qSi5GOWkNp3rBG+Pufp3fLgvoZAdTjDz5F1yUlw1L5lAuqhN4wOPTCZUrBaXvfeXt
 lzF7dcBxpbuyUQnjnefVejUMbdK0E5wWDYrVwgr4VMBJPtzLn1jAcpjpEBi4NHZP7a
 5i+VV31WDxc3w7NpTewN2bdgkBS1jziWKcP3cQv8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/4] drm: xlnx: zynqmp: Add DP audio support
Date: Tue, 12 Mar 2024 11:41:01 +0200
Message-Id: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC0j8GUC/x3MQQqAIBBA0avErBvISaS6SrSQHGsgLJRCkO6et
 HyL/wskjsIJpqZA5EeSnKFCtQ2suw0bo7hqoI501yvCLIeEjO5Cezs5UZvBOkV+9EZDra7IXvJ
 /nJf3/QBk1wuEYQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=2aEimQhgFxmWJYn6GcjIbcGQw3slBQN7rqnpfFA3a7Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl8CNGUu4queGy9PSBXJQ9gvh4uSIIYmIqaQ6Ez
 ookQ6CorvqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZfAjRgAKCRD6PaqMvJYe
 9QkSD/wMNPPabtvMaovE9RIESQnKyXvtLUuJQNoSaZh/P+61WDzI5Bk2WfJpuEm+lNWNTsr/DWb
 3zutn7tAFHWMg1OlttiXezVNI/+3RtNRlGK96b39sgvbDt/NZgfG7QPsKrOgzqYv7KIdFpF7oJj
 G1LJIcdaOT37n5Umfxj+xPlOhONzSZC4jGLISJ0yl8rSf6pP8eq1NZNcw441ACUzqx2p9ZNjYp/
 v2hgYJXwk1AVrzZf371WoihZCoP7DMg1hCDzGpqxt2GjaqrEYDKmEbySZn3syNZCnUj9rzUjQMg
 ob0V0GhpXbPzwYxLF9Two7PMmXnirLV1PfWIlr/zYpx2LocGygZj5a8VjVFQaZ0BHw14E/9s+qC
 nLVk+GRrxQHlm35KcfK5bREWj3hiW5hyEwCFUWi3szZwaVY3/4rlgKE9kvNSJAWulSIYml78Wp2
 WiEtHilmRiP6HG7YzKyke2ZuU1v94IEm9xCAE/Q6MoFFsZRKvACPgjJqw1KT7Ci9U4TttEv8FqJ
 0G0nuVEmvbZmNkvs1DAxGzRMfv2TZ6SwPr3K5dcAIG7Se4uEgWy5KlUyQJq6xyzERc0V9cShiks
 QGYKu1ajblPxpysQfYeTUgAhKwmDlQ/WKHvAoohXjin0IKfS0zQ0ohnKDQK8KU5GrLwyULVhx6B
 YRT4z38AeIRF89g==
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
ASoC error.

The current DT is, for some reason, missing the DMA channels for the
audio. This series adds that to the bindings and the dts file, but to
support older dtb files without the audio DMA, the driver will not fail
if the audio DMA is missing, but will just mark the audio support as
disabled.

The series also includes an improvement to the
soc-generic-dmaengine-pcm.c, required to support two dmaengine_pcms.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (4):
      ASoC: dmaengine_pcm: Allow passing component name via config
      dt-bindings: display/xlnx/zynqmp-dpsub: Add audio DMAs
      arm64: dts: zynqmp: Add DMA for DP audio
      drm: xlnx: zynqmp_dpsub: Add DP audio support

 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   |  10 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   7 +-
 drivers/gpu/drm/xlnx/Kconfig                       |   9 +
 drivers/gpu/drm/xlnx/Makefile                      |   1 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |  50 ---
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h            |   7 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  54 ++-
 drivers/gpu/drm/xlnx/zynqmp_dp.h                   |   7 +
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c             | 461 +++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |  39 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |  15 +-
 include/sound/dmaengine_pcm.h                      |   2 +
 sound/soc/soc-core.c                               |   8 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |   3 +
 14 files changed, 563 insertions(+), 110 deletions(-)
---
base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
change-id: 20240312-xilinx-dp-audio-468ad12f9f64

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

