Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E337959CD47
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 02:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48CFA7D21;
	Tue, 23 Aug 2022 00:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54FCA7639
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=1SF0SGC2zWjdo96D+0xeHw99mifXdhz/ntpv5NKkPcQ=; b=f7o/RoHl4sysNkGDSqSmiH5bk+
 BVJXkWWoIXlAHXbFVu6OsXOhPlHhz1hdeH447tJvDg9Chs6MB4M73kvLa1CKs/3QBPzOJ1pSXjald
 mb34+DcKN5fLBzAM0CoUmFryXwVKav1A8fJe7pZTLLQiFPSnxNA1IJpMq/O3XyrfTBSOnGqJgw9hh
 K+4YFuuIuRHRValii8PQ6ecLqq0voaN88C4KK4uEWe4k5brxhpey4pAL5TmAMukdo7hcpDOSTMZ6R
 WTF3va/2IKPtSKI45SvDK+XNL657CjTfGdPeiOt0CvjPj49G+IxjVwOtqqf3ryzoIEXpyAJiGoKEv
 JYpiejbA==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oQI03-00Eo63-Lo; Tue, 23 Aug 2022 00:42:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/panel: use 'select' for Ili9341 panel driver helpers
Date: Mon, 22 Aug 2022 17:42:27 -0700
Message-Id: <20220823004227.10820-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Dillon Min <dillon.minfei@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use 'select' instead of 'depends on' for DRM helpers for the
Ilitek ILI9341 panel driver.
This is what is done in the vast majority of other cases and
this makes it possible to fix a build error with drm_mipi_dbi.

Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dillon Min <dillon.minfei@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/panel/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -165,8 +165,8 @@ config DRM_PANEL_ILITEK_IL9322
 config DRM_PANEL_ILITEK_ILI9341
 	tristate "Ilitek ILI9341 240x320 QVGA panels"
 	depends on OF && SPI
-	depends on DRM_KMS_HELPER
-	depends on DRM_GEM_DMA_HELPER
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
 	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_MIPI_DBI
 	help
