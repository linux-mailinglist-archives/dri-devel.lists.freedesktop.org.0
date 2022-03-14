Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113824D82FF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 13:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E30410E2DB;
	Mon, 14 Mar 2022 12:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CF310E328
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 12:11:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2887461314;
 Mon, 14 Mar 2022 12:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F517C340E9;
 Mon, 14 Mar 2022 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647259858;
 bh=MCanwxxSbotRv9mh+b1RN09ulz21n+ZgM4BgmlgR4HE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cxhDsPeZZkcdCZ8E6AJSn/XhIXuaB0HAWhEWDgutGUY6JZTWaf5wJXUpYnPobhHy6
 XuvqJlyiKIX88d+vuIva9r1YUoGs2VXpGjH8dMUxxik9njabeYy2+Ira5BbY0w0BSs
 0uLKQ5+ivfuEQcUld0fl6rF8e3W+QUZIQUXRZxak=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.15 105/110] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
Date: Mon, 14 Mar 2022 12:54:47 +0100
Message-Id: <20220314112745.956467304@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314112743.029192918@linuxfoundation.org>
References: <20220314112743.029192918@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
@@ -83,6 +83,7 @@ config DRM_PANEL_SIMPLE
 	depends on PM
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
+	select DRM_DP_HELPER
 	help
 	  DRM panel driver for dumb panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so


