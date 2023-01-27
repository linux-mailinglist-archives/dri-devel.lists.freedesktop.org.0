Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073FA67E05E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 10:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526FC10E434;
	Fri, 27 Jan 2023 09:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9C710E434
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 09:36:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A93DE61A74;
 Fri, 27 Jan 2023 09:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3989C433EF;
 Fri, 27 Jan 2023 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674812196;
 bh=wlz6HIVQ/GgIj0YbTS0RXKypfcVwy2vvEGBqBClsFuo=;
 h=From:To:Cc:Subject:Date:From;
 b=Tir3d55g29BmdExqeS9YYdmYN3bB9BIsEcfWaB4gHjRQgIO8DPGdyUbu8a/h5jel7
 wqVAdY0QxPgzZ8nAJrUxKX2rkHn0ipkyfFP73Eg4NTygD1wosC1bd5jRxEdSmWMzNq
 PUGnUrXSQ2AMGsUKfkRZsrWwOUOt7C89Ou7P4a6320syjhHDnqOH1KHDRKYDFMAwMP
 dEMELwYPsl0pM0VEfTXtHIT3HgN1pF4TDrlJ57QDkqodr9+Gp+bXLa2RRI6EfUyQ/J
 mT8tXwQvo5u9E+ImLVjmuudBFc69W/JU8nIwqBH79cGtmkHp37C8hqFqG040dnIh9E
 G+fwgYcmFJh3g==
From: Arnd Bergmann <arnd@kernel.org>
To: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH] accel: work around DRM_ACCEL dependencies
Date: Fri, 27 Jan 2023 10:36:20 +0100
Message-Id: <20230127093631.2132187-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

At the moment, accel drivers can be built-in even with CONFIG_DRM=m,
but this causes a link failure:

x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_dev_init':
ivpu_drv.c:(.text+0x1535): undefined reference to `drmm_kmalloc'
x86_64-linux-ld: ivpu_drv.c:(.text+0x1562): undefined reference to `drmm_kmalloc'
x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_remove':
ivpu_drv.c:(.text+0x1faa): undefined reference to `drm_dev_unregister'
x86_64-linux-ld: drivers/accel/ivpu/ivpu_drv.o: in function `ivpu_probe':
ivpu_drv.c:(.text+0x1fef): undefined reference to `__devm_drm_dev_alloc'

This could be avoided by making DRM_ACCEL a tristate symbol, which
would mean that every ACCEL driver is guarantee to be able to link
against DRM as well. However, having both as =m causes another link
failure because the DRM core code also links against the accel driver:

x86_64-linux-ld: drivers/gpu/drm/drm_drv.o: in function `drm_minor_register':
drm_drv.c:(.text+0x259): undefined reference to `accel_debugfs_init'
x86_64-linux-ld: drm_drv.c:(.text+0x298): undefined reference to `accel_minor_replace'

I think it will be necessary to establish a link hierarchy between drm.ko
and drm_accel.ko to avoid circular dependencies like this, but until then
the only way that both can be used is to have both subsystems built into
the kernel. Enforce this using a Kconfig dependency.

Fixes: 8bf4889762a8 ("drivers/accel: define kconfig and register a new major")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 834863902e16..dd18d3b2028c 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -8,7 +8,7 @@
 #
 menuconfig DRM_ACCEL
 	bool "Compute Acceleration Framework"
-	depends on DRM
+	depends on DRM=y
 	help
 	  Framework for device drivers of compute acceleration devices, such
 	  as, but not limited to, Machine-Learning and Deep-Learning
-- 
2.39.0

