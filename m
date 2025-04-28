Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54113A9F415
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 17:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F302A10E594;
	Mon, 28 Apr 2025 15:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qdYuVUBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DD810E594
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 15:08:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 35F8544D83;
 Mon, 28 Apr 2025 15:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B3FC4CEE4;
 Mon, 28 Apr 2025 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745852878;
 bh=jxTwfAcECygf5CIL5YAyFGJI9HrtjGfkmcaFSr4z1Us=;
 h=From:To:Cc:Subject:Date:From;
 b=qdYuVUBbXL6NTpfZ6clt4loWwrgjyzitkl9NMyTlYhx0Egx5zo/sapVWVxmLXaX9w
 KrYiwPMNKLX2nBK5GP1vJhsqPCoAZ7bRBrG0ok1ROrloR4tCjL/WxRunEopF9VuGxD
 MWDils7CFgiqxAWJWAVeAkpheLZP7GSJoTDtFidWLaS0/TsY1xq0/0AS1CRH5kGmHE
 VEcR2zSQY3vxK0K1whQJYz6OTiQJzg235GqS9phytgatqctBio+s3jqdMi/FImQLxr
 LOGWAjMElNT7l35yLf37XcctqlUnstywmmU+PnqpZ+OeHp5rqjElcQywvAl1F97rtN
 cQ04GQoy53Alg==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Lechner <david@lechnology.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Alex Lanzano <lanzano.alex@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION
Date: Mon, 28 Apr 2025 17:07:45 +0200
Message-Id: <20250428150752.3970145-1-arnd@kernel.org>
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

The newly added driver calls drm_client_setup(), but that is not
always built in:

x86_64-linux-ld: vmlinux.o: in function `st7571_probe':
st7571-i2c.c:(.text+0x7b7119): undefined reference to `drm_client_setup'

Select the appropriate Kconfig symbol.

Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tiny/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 1dfe6291d9c0..654cd6f25faa 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -215,6 +215,7 @@ config TINYDRM_ST7586
 config DRM_ST7571_I2C
 	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
 	depends on DRM && I2C && MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-- 
2.39.5

