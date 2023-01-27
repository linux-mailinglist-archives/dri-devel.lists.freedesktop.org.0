Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD967F0FF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 23:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9983D10E1C3;
	Fri, 27 Jan 2023 22:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251DC10E1C3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 22:15:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B753BB82148;
 Fri, 27 Jan 2023 22:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065FBC433D2;
 Fri, 27 Jan 2023 22:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674857708;
 bh=tYeVWVDqmrYCQ68BomdAu9i6GwFXBSSVooD9s632kl0=;
 h=From:To:Cc:Subject:Date:From;
 b=FcoP7OuX+aYmdJQtza1BnQZJTENkfGj2s/ORLK/+cRjT/Psyfu1W8AV4ydF3eNhC4
 XXCAoj8GK47nhBs3IU+aL/uffgBty8u8nFWRAk4NG0CJ056LuvVKgN8ZBR+DwVcWMc
 8F+CCJhb/Xt5iPcAdxyiydjRrWCjaAdwfMN/jUNq8C1ssKDlUQCcxeYdZCrmWk0xlf
 zQj+nwBibCyeGIE3dc8O80I5MHFObt+w58qik5L5HMH0sajKK3BcP3YJYioNhqMi2E
 cgGK+g2XhMMQPQ38zdz5a4NPM1OrVk5kQqCHUUJ+vQlBJf2xZkMWoAns3sWxacbMqu
 9s56ZSw5PuR5w==
From: Arnd Bergmann <arnd@kernel.org>
To: Oded Gabbay <ogabbay@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Melissa Wen <mwen@igalia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] [v2] accel: fix CONFIG_DRM dependencies
Date: Fri, 27 Jan 2023 23:14:55 +0100
Message-Id: <20230127221504.2522909-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

The problem is that DRM_ACCEL is a 'bool' symbol symbol, so driver that
only depend on DRM_ACCEL but not also on DRM do not see the restriction
to =m configs.

To ensure that each accel driver has an implied dependency on CONFIG_DRM,
enclose the entire Kconfig file in an if/endif check.

Fixes: 8bf4889762a8 ("drivers/accel: define kconfig and register a new major")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: rearrage the DRM dependency rather than requiring DRM to be built-in
---
 drivers/accel/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 834863902e16..c437206aa3f1 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -6,9 +6,10 @@
 # as, but not limited to, Machine-Learning and Deep-Learning acceleration
 # devices
 #
+if DRM
+
 menuconfig DRM_ACCEL
 	bool "Compute Acceleration Framework"
-	depends on DRM
 	help
 	  Framework for device drivers of compute acceleration devices, such
 	  as, but not limited to, Machine-Learning and Deep-Learning
@@ -25,3 +26,5 @@ menuconfig DRM_ACCEL
 
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
+
+endif
-- 
2.39.0

