Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B794540DE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54AC6E406;
	Wed, 17 Nov 2021 06:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483E6E406
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=u9TsPfVua2pwgRzMzKBVPHm36omW56UbBxtvj9Ocw54=; b=njoPg6BUseWHQbB5/AdOoGllFW
 wq2z+48UGzdBL4b1Yi6fsYRMo46LYrahgc76iif1KX3VRanpst2g3djxbUw3VRokOHInqKb+Jt0Gd
 F8CZl5FvvBlU0s5x9Uqp4hswI47kD89reJ3fxVXvTn1JW8PPPPGk3z6jM/MaKoqlMaW3mZVnP/71W
 nBJaOoCCl7qmJBmPhMvv4ueMHBoHcC5p2JlGAn9J9OaBfi2fxSh2oqkBr9awRZTwCytKDrL4o1fqB
 yjNzwMdmlHdM573FNKsP1vHf6E7vzSDRpqeBPpSfgv39Ltkmhy1ZAF2NekmoNpZS7UhkvIy8SrSs4
 KsVlb5Mw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnEPR-003TQW-5q; Wed, 17 Nov 2021 06:27:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: modify Kconfig to prevent build error
Date: Tue, 16 Nov 2021 22:27:04 -0800
Message-Id: <20211117062704.14671-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CONFIG_DRM_KMS_HELPER=m and CONFIG_DRM_PANEL_EDP=y,
there is a build error in gpu/drm/panel/panel-edp.o:

arm-linux-gnueabi-ld: drivers/gpu/drm/panel/panel-edp.o: in function `panel_edp_probe':
panel-edp.c:(.text+0xf38): undefined reference to `drm_panel_dp_aux_backlight'

Fix this by limiting DRM_PANEL_DEP by the value of the DRM_KMS_HELPER
symbol.

Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20211117.orig/drivers/gpu/drm/panel/Kconfig
+++ linux-next-20211117/drivers/gpu/drm/panel/Kconfig
@@ -104,6 +104,7 @@ config DRM_PANEL_EDP
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
+	depends on DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
 	help
