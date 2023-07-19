Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5A7759643
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 15:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB33B10E4A2;
	Wed, 19 Jul 2023 13:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032610E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:09:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94BA6611F9;
 Wed, 19 Jul 2023 13:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4A5C433C8;
 Wed, 19 Jul 2023 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689772185;
 bh=emvLdW7AGgXpWhAQUruy5IEnajx3zbwFXE7kJcAzRvk=;
 h=From:To:Cc:Subject:Date:From;
 b=RdCHsQw8isbZoU2ldlm5G9kcGyB4SZBiDMYIUpVgXRyghH1YD7DOgHmbg4Ge8tW+I
 opSlEOYrbLMAUHuak2sqi+Z3JPvlSiuV5uw5wo0v2+pBZlULn2lJeUoS8EAAu9bF1p
 Fe6XJerUfw1UpRMvU0XVBqPmOo6vYogitYxhRU24/oZ/t8HV50NV2Vwju3cR9sEh4P
 6ZY/xuCV9kxlqZAHmWfkuZbCpvlChcMaNDuzmfHsYNPAU+EuDa/DX3Y2MvpLn4xLrY
 OSaM7UeJcFhrdqw2fPFgN2GNHPNzBZhhfxE+/sBvtwGx+FlkTBDLilDGkNRVeo38Vr
 cWL2+qPB6GLkQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH] drm/panel: r66451: select CONFIG_DRM_DISPLAY_DP_HELPER
Date: Wed, 19 Jul 2023 15:09:21 +0200
Message-Id: <20230719130940.659837-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver only builds when DRM_DISPLAY_DP_HELPER is enabled:

x86_64-linux-ld: drivers/gpu/drm/panel/panel-visionox-r66451.o: in function `visionox_r66451_enable':
panel-visionox-r66451.c:(.text+0x105): undefined reference to `drm_dsc_pps_payload_pack'

Select both CONFIG_DRM_DISPLAY_DP_HELPER and CONFIG_DRM_DISPLAY_HELPER to
ensure the helper function is always available.

Fixes: a6dfab2738fc2 ("drm/panel: Add driver for Visionox r66451 panel")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 1a0fd0754692e..e8c9f4613a4b4 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -798,6 +798,8 @@ config DRM_PANEL_VISIONOX_R66451
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox
 	  R66451 1080x2340 AMOLED DSI panel.
-- 
2.39.2

