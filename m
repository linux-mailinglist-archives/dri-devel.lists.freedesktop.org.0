Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2805F60322F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 20:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BFD10EFC4;
	Tue, 18 Oct 2022 18:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BE510EFC4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=u1jSsa7KqxmCrkOFvnCR72ZfQLGaAXjkoUkUU1lr3G8=; b=KJi6nSw4Ag2zEO7s5ov0ONErxv
 fGEmJ9nNV38vIpdnD8BPWG8CEY/cFTNQ8G2Lyt0q3Qbn+JcyFAkEC09BjAGh6JLQhmm31W0Vidb2g
 rqe1daF/U/g1Z+D1X9f3jelTyP8XHMVgd5h1qDpf2MfEbDsA2KLSx4LVt9VS8nwBNmRo5DE/2F2uL
 xNS8KFJtysjer8qzcMw8dcB1va8LBi45n2sSKJF3f142famaY51K9ky6UgVOxVAyZ6AMI6PkF4whT
 +kGGGTsmnq9BOab4VZofipUqypVmeZcDzWICjJ951bpTSx9B27+EqObVuANkLjFczLufynTP+vXxH
 dOcDlTYw==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1okrAk-00AvHD-HN; Tue, 18 Oct 2022 18:18:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on RCAR_MIPI_DSI
Date: Tue, 18 Oct 2022 11:18:28 -0700
Message-Id: <20221018181828.19528-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.0
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_DRM_RCAR_DU=y and CONFIG_DRM_RCAR_MIPI_DSI=m, calls
from the builtin driver to the mipi driver fail due to linker
errors.
Since the RCAR_MIPI_DSI driver is not always required, fix the
build error by making DRM_RCAR_DU optionally depend on the
RCAR_MIPI_DSI Kconfig symbol. This prevents the problematic
kconfig combination without requiring that RCAR_MIPI_DSI always
be enabled.

aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
rcar_du_crtc.c:(.text+0x3a18): undefined reference to `rcar_mipi_dsi_pclk_enable'
aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
rcar_du_crtc.c:(.text+0x47cc): undefined reference to `rcar_mipi_dsi_pclk_disable'

Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: LUU HOAI <hoai.luu.ub@renesas.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/rcar-du/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,6 +4,7 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on DRM_RCAR_MIPI_DSI || DRM_RCAR_MIPI_DSI=n
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
