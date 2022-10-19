Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6D603CEA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 10:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4AE10F1A6;
	Wed, 19 Oct 2022 08:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC610F1A7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 08:54:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E83BB82398;
 Wed, 19 Oct 2022 08:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681ADC433C1;
 Wed, 19 Oct 2022 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666169637;
 bh=0n3wCM2FLB57ac0bicBovbICBhHb3K3wk0u9suBfZPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=asJX0QaTJV8qDwBShXtiIXXHST2Qybn+sceGuRkw6+BW9Ed6TMkB6Bemzm2WfmJ/u
 G1c2WwoHEUg/WUpDrK2fkWWT92B+zagQucJAkc9sJEeeNJao1WQL2qk/IJc/E6lwmY
 A3UQv3oyYv3nugP2SEBSCQl8dlcrIULq37teh2fQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6.0 352/862] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
Date: Wed, 19 Oct 2022 10:27:19 +0200
Message-Id: <20221019083305.595661084@linuxfoundation.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221019083249.951566199@linuxfoundation.org>
References: <20221019083249.951566199@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 5e01376124309b4dbd30d413f43c0d9c2f60edea ]

Call sysfb_disable() before removing conflicting devices in aperture
helpers. Fixes sysfb state if fbdev has been disabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Fixes: fb84efa28a48 ("drm/aperture: Run fbdev removal before internal helpers")
Cc: Zack Rusin <zackr@vmware.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Changcheng Deng <deng.changcheng@zte.com.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20220718072322.8927-8-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/aperture.c         | 14 ++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 12 ------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 538f2d40acda..d245826a9324 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -8,6 +8,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sysfb.h>
 #include <linux/types.h>
 #include <linux/vgaarb.h>
 
@@ -286,7 +287,20 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 #if IS_REACHABLE(CONFIG_FB)
 	struct apertures_struct *a;
 	int ret;
+#endif
+
+	/*
+	 * If a driver asked to unregister a platform device registered by
+	 * sysfb, then can be assumed that this is a driver for a display
+	 * that is set up by the system firmware and has a generic driver.
+	 *
+	 * Drivers for devices that don't have a generic driver will never
+	 * ask for this, so let's assume that a real driver for the display
+	 * was already probed and prevent sysfb to register devices later.
+	 */
+	sysfb_disable();
 
+#if IS_REACHABLE(CONFIG_FB)
 	a = alloc_apertures(1);
 	if (!a)
 		return -ENOMEM;
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 02b0cf2cfafe..bda4d304feb6 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -19,7 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/major.h>
 #include <linux/slab.h>
-#include <linux/sysfb.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/vt.h>
@@ -1777,17 +1776,6 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 		do_free = true;
 	}
 
-	/*
-	 * If a driver asked to unregister a platform device registered by
-	 * sysfb, then can be assumed that this is a driver for a display
-	 * that is set up by the system firmware and has a generic driver.
-	 *
-	 * Drivers for devices that don't have a generic driver will never
-	 * ask for this, so let's assume that a real driver for the display
-	 * was already probed and prevent sysfb to register devices later.
-	 */
-	sysfb_disable();
-
 	mutex_lock(&registration_lock);
 	do_remove_conflicting_framebuffers(a, name, primary);
 	mutex_unlock(&registration_lock);
-- 
2.35.1



