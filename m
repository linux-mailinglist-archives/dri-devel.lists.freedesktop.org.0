Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4CB427AC5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 16:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806416E0C2;
	Sat,  9 Oct 2021 14:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E662E6E0C2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 14:18:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BA4660F46;
 Sat,  9 Oct 2021 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633789131;
 bh=OZEzyKwd8LSpRqfA6Wfng0mJCecqkI0pQIz/q8gMY14=;
 h=Subject:To:Cc:From:Date:From;
 b=qih3wKRJHlaBbeb9CmdB4nJFn4hoILxfC3XTYvRbtrDV7VoGIZS4b6r/nKelZiGbS
 e3PyRi+pBTMSsCykdIlSjB+lDcIwSJBB4RWuoBdupyM89MUKbBee2cZDwky+eQnJOy
 35y5GJfss096OtX5Hrz10u47dfwB1NdFDLjSOB0A=
Subject: Patch "fbdev: simplefb: fix Kconfig dependencies" has been added to
 the 5.14-stable tree
To: andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@suse.de,
 broonie@kernel.org, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 geert+renesas@glider.be, gregkh@linuxfoundation.org, javierm@redhat.com,
 lgirdwood@gmail.com, maarten.lankhorst@linux.intel.com, maxime@cerno.tech,
 pcc@google.com, rdunlap@infradead.org, robh@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 09 Oct 2021 16:18:18 +0200
Message-ID: <163378909877181@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    fbdev: simplefb: fix Kconfig dependencies

to the 5.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fbdev-simplefb-fix-kconfig-dependencies.patch
and it can be found in the queue-5.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ec7cc3f74b4236860ce612656aa5be7936d1c594 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Sep 2021 16:52:10 +0200
Subject: fbdev: simplefb: fix Kconfig dependencies

From: Arnd Bergmann <arnd@arndb.de>

commit ec7cc3f74b4236860ce612656aa5be7936d1c594 upstream.

Configurations with both CONFIG_FB_SIMPLE=y and CONFIG_DRM_SIMPLEDRM=m
are allowed by Kconfig because the 'depends on !DRM_SIMPLEDRM' dependency
does not disallow FB_SIMPLE as long as SIMPLEDRM is not built-in. This
can however result in a build failure when cfb_fillrect() etc are then
also in loadable modules:

x86_64-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x1f8): undefined reference to `cfb_fillrect'
x86_64-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x200): undefined reference to `cfb_copyarea'
x86_64-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x208): undefined reference to `cfb_imageblit'

To work around this, change FB_SIMPLE to be a 'tristate' symbol,
which still allows both to be =m together, but not one of them to
be =y if the other one is =m. If a distro kernel picks this
configuration, it can be determined by local policy which of
the two modules gets loaded. The 'of_chosen' export is needed
as this is the first loadable module referencing it.

Alternatively, the Kconfig dependency could be changed to
'depends on DRM_SIMPLEDRM=n', which would forbid the configuration
with both drivers.

Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Acked-by: Rob Herring <robh@kernel.org> # for drivers/of/
Link: https://lore.kernel.org/all/20210721151839.2484245-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch> # fbdev support
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Borislav Petkov <bp@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Peter Collingbourne <pcc@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # v5.14+
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20210928145243.1098064-1-arnd@kernel.org
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/of/base.c           |    1 +
 drivers/video/fbdev/Kconfig |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -36,6 +36,7 @@ LIST_HEAD(aliases_lookup);
 struct device_node *of_root;
 EXPORT_SYMBOL(of_root);
 struct device_node *of_chosen;
+EXPORT_SYMBOL(of_chosen);
 struct device_node *of_aliases;
 struct device_node *of_stdout;
 static const char *of_stdout_options;
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2191,8 +2191,9 @@ config FB_HYPERV
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
 
 config FB_SIMPLE
-	bool "Simple framebuffer support"
-	depends on (FB = y) && !DRM_SIMPLEDRM
+	tristate "Simple framebuffer support"
+	depends on FB
+	depends on !DRM_SIMPLEDRM
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT


Patches currently in stable-queue which might be from arnd@arndb.de are

queue-5.14/fbdev-simplefb-fix-kconfig-dependencies.patch
