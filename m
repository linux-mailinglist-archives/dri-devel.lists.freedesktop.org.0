Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A18D419660
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 16:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2F189FA5;
	Mon, 27 Sep 2021 14:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A463B89FA5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 14:28:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E11F610E8;
 Mon, 27 Sep 2021 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632752901;
 bh=5KL+JiULkFsiAbh9kDxX+k4YOM3LnpWkWceqNENywSw=;
 h=From:To:Cc:Subject:Date:From;
 b=lxzA0fXgPKw9xlD13FdD6gFz9FpAdgQRFrWR+k070lCUmY6OqQObR/WU+zN8Nxw1j
 tuLdF/3BruQ7i8vZpaMF36FkOVkQLMRbPMqH1hAMcGMGbS0saXphLZBxvliAtwngLw
 ZuUjUQjmbwcCZrKIL0wwd1qpopCSbpecqoN+ZlufludMS8FApmE/bpzt0GphapokiW
 ouRk4y1TQmsOTVPC7zIiyNZYRgLM2Q1kRYJYadH+AUi/97Sv4gWaNKKUEqrKb0p+DK
 P15IRtkAeY6wi+c2yMiltL+SSFZX8/PFijBf1Dz2mo4jGnDWAj0CDnq2oV7zupvFK6
 axD5GNXZZxTrQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
Date: Mon, 27 Sep 2021 16:28:02 +0200
Message-Id: <20210927142816.2069269-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

With CONFIG_FB=m and CONFIG_DRM=y, we get a link error in the fb helper:

aarch64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
(.text+0x10cc): undefined reference to `framebuffer_alloc'

Tighten the dependency so it is only allowed in the case that DRM can
link against FB.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Link: https://lore.kernel.org/all/20210721152211.2706171-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I posted this in July, the patch is still required and should work
on its own.
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index cea777ae7fb9..9199f53861ca 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -103,7 +103,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
-	depends on FB
+	depends on FB=y || FB=DRM
 	select DRM_KMS_HELPER
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
-- 
2.29.2

