Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09D4D7D64
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 09:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5132A10E97D;
	Mon, 14 Mar 2022 08:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9646C10E97C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 08:12:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 673E261236;
 Mon, 14 Mar 2022 08:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C92C340EE;
 Mon, 14 Mar 2022 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647245542;
 bh=GkGAVMXi8bcR8Bg1eScTPyHOlJeUQ/Bt5ulSfp/y+JU=;
 h=Subject:To:Cc:From:Date:From;
 b=NcYKCJc3k/wowCVzB0HXmobV/x55I/gkjPWnOMAh+Jv5aRDd4GtnR0IRFiKwFWlP5
 RxvrWAaJ5XjOkmUPGHsiOA9L4IlaijU5kb1LdKP1tcjfoz8oxhscRKfYiPjG8qDlIh
 01mqkeTptKhQ3n3exJybkpm2O5NBej5wYCqu68LE=
Subject: Patch "drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP" has been
 added to the 5.16-stable tree
To: airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, lkft@linaro.org, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 naresh.kamboju@linaro.org, sam@ravnborg.org, tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Mon, 14 Mar 2022 09:12:19 +0100
Message-ID: <164724553910296@kroah.com>
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP

to the 5.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-panel-select-drm_dp_helper-for-drm_panel_edp.patch
and it can be found in the queue-5.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 3755d35ee1d2454b20b8a1e20d790e56201678a4 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 3 Feb 2022 10:39:22 +0100
Subject: drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 3755d35ee1d2454b20b8a1e20d790e56201678a4 upstream.

As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
the option to fix the build failure. The error message is shown
below.

  arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
    `panel_edp_probe': panel-edp.c:(.text+0xb74): undefined reference to
    `drm_panel_dp_aux_backlight'
  make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1

The issue has been reported before, when DisplayPort helpers were
hidden behind the option CONFIG_DRM_KMS_HELPER. [2]

v2:
	* fix and expand commit description (Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 9d6366e743f3 ("drm: fb_helper: improve CONFIG_FB dependency")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://lore.kernel.org/dri-devel/CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com/ # [1]
Link: https://lore.kernel.org/all/20211117062704.14671-1-rdunlap@infradead.org/ # [2]
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20220203093922.20754-1-tzimmermann@suse.de
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/panel/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -95,6 +95,7 @@ config DRM_PANEL_EDP
 	depends on PM
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
+	select DRM_DP_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.16/drm-panel-select-drm_dp_helper-for-drm_panel_edp.patch
