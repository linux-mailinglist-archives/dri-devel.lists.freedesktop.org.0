Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF6A47EDF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 14:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7C10EAE6;
	Thu, 27 Feb 2025 13:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QpjlQW8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981910EAF2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 13:20:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52FD95C5777;
 Thu, 27 Feb 2025 13:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAE0C4CEDD;
 Thu, 27 Feb 2025 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740662441;
 bh=FLYX4MtQxNdE09SlMrP22m+WXbicdAzLZnnz94YMMU8=;
 h=From:To:Cc:Subject:Date:From;
 b=QpjlQW8zNpmJ08WB9JTBJqlF36PognoNnSxjJT4tKa/l4ZaFM4w5dpNn+VhYJjU5s
 OEotBr056p3g1inqlXhP9bDQpWQ9686G5QktZbrtWl/m0Fi2c3OGLt1gHEUmuqqzyW
 7M2nS6lvIxRpR6Kus5NMH92N8IDOYpiX+fF00t3gvEn7Bx+0k83cm5qeRokiID3461
 3EBuBvfN/aEO8C3a/C10HFjRnfka4BhCcUdtH1r4OnDqVeLg1nXJ9Go8txXaqCZS5B
 MMuls9Q5smhRdLfS+6lbTeGPVAiA9jHTeu/9uFKMMmDSVqQqNxUmTuG6PHSVYO70or
 rE82cHC1EXnPQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Vishal Sagar <vishal.sagar@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: fix Kconfig dependencies for ASoC
Date: Thu, 27 Feb 2025 14:20:32 +0100
Message-Id: <20250227132036.1136600-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

The new audio code fails to build when sounds support is in a loadable
module but the GPU driver is built-in:

x86_64-linux-ld: zynqmp_dp_audio.c:(.text+0x6a8): undefined reference to `devm_snd_soc_register_card'
x86_64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x1bc): undefined reference to `snd_soc_info_volsw'
x86_64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x1f0): undefined reference to `snd_soc_get_volsw'
x86_64-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp_audio.o:(.rodata+0x1f4): undefined reference to `snd_soc_put_volsw'

Change the Kconfig dependency to disallow the sound support in this
configuration.

Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xlnx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index dbecca9bdd54..cfabf5e2a0bb 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -22,6 +22,7 @@ config DRM_ZYNQMP_DPSUB_AUDIO
 	bool "ZynqMP DisplayPort Audio Support"
 	depends on DRM_ZYNQMP_DPSUB
 	depends on SND && SND_SOC
+	depends on SND_SOC=y || DRM_ZYNQMP_DPSUB=m
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Choose this option to enable DisplayPort audio support in the ZynqMP
-- 
2.39.5

