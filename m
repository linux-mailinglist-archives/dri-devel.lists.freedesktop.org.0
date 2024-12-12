Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D699EECF8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 16:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792DF10E7BF;
	Thu, 12 Dec 2024 15:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q0xmnt6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC63F10E7BF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 15:40:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E1941A41D89;
 Thu, 12 Dec 2024 15:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B7CC4CEE2;
 Thu, 12 Dec 2024 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734018007;
 bh=aRKXXlVvbGjmh5A+HdJrSujq5fMFWNfh7Xt/6YwYcF4=;
 h=From:To:Cc:Subject:Date:From;
 b=Q0xmnt6rZpwAtD5n9ViAEkWAC3irVnIX4WZQnUaOO4mlkGExsMYKbsxUo4lghR4VY
 mlgww7v5IWseQTJXU4Q2SqlKvMJQp4xzA7OpLfkCuYdrt2MO6sGwCesTBu6cOMfeUX
 qg+hhAbA1ZBJfX/7aqGAu1hph3fi0KNSZSJr/FZ5SpFDKSO/n0zSmAmbDRXpcvxROC
 FkwK8Ba5c6gY4JID4DKM/kzRRJC1C8aNKk1fPncv8BtQP1FOenLZSVH4ujPn6cTGYE
 esqwELwPgVoT5V3f2rDUccMdFYybULluoqTekQy291yaEe5txPPBK0ILGFiGiFnSt9
 ss+m8CTwOwpsg==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 John Ogness <john.ogness@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Larsson <andreas@gaisler.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/log: select CONFIG_FONT_SUPPORT
Date: Thu, 12 Dec 2024 16:39:50 +0100
Message-Id: <20241212154003.1313437-1-arnd@kernel.org>
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

Without fonts, this fails to link:

drivers/gpu/drm/clients/drm_log.o: in function `drm_log_init_client':
drm_log.c:(.text+0x3d4): undefined reference to `get_default_font'

Select this, like the other users do.

Fixes: f7b42442c4ac ("drm/log: Introduce a new boot logger to draw the kmsg on the screen")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/clients/Kconfig | 1 +
 lib/fonts/Kconfig               | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index c18decc90200..7b81fd0f4cae 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -77,6 +77,7 @@ config DRM_CLIENT_LOG
 	select DRM_CLIENT
 	select DRM_CLIENT_SETUP
 	select DRM_DRAW
+	select FONT_SUPPORT
 	help
 	  This enable a drm logger, that will print the kernel messages to the
 	  screen until the userspace is ready to take over.
diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
index 3ac26bdbc3ff..ae59b5b4e225 100644
--- a/lib/fonts/Kconfig
+++ b/lib/fonts/Kconfig
@@ -10,7 +10,7 @@ if FONT_SUPPORT
 
 config FONTS
 	bool "Select compiled-in fonts"
-	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
+	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC || DRM_CLIENT_LOG
 	help
 	  Say Y here if you would like to use fonts other than the default
 	  your frame buffer console usually use.
-- 
2.39.5

