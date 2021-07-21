Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB05F3D1227
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855B16E958;
	Wed, 21 Jul 2021 15:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8B16E853
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:18:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB96F61246;
 Wed, 21 Jul 2021 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626880726;
 bh=rHewC8c5p0knxx95PKPppJx1ZIfzczey+Q7nqFGbe1g=;
 h=From:To:Cc:Subject:Date:From;
 b=biu8xVWJdFQe9hPe1MR00MmTDZLvkdzJrXLSyc44H3ao7+QlvaF2qavXQqnwvznps
 +ZiKWdt6IAid+59oKGhrSqbnXZCEhQA68Ujpi/zVaEF8Qe6scucrjVw2ScLSu23fDs
 UGuh8jHTm0tWFqOc/3bxfMQIPhhpUjIib1gms4e3WkWl5hnd9EtlMDlXfaCZDjATrC
 Qfi7IWDPof+2XLJT96RQhpLpr4B72j0qIJswSVNpGjsSTebX7Njj5ZS2dHJAnUOGbm
 DooGKftfv1YwvTCXz4iTnBhHfG2/owHkaGiG1Y6uuxJQYikPKgRkxezcVvwuInngO+
 JWjlkmeAcPzOg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] fbdev: simplefb: fix Kconfig dependencies
Date: Wed, 21 Jul 2021 17:17:46 +0200
Message-Id: <20210721151839.2484245-1-arnd@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

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
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/of/base.c           | 1 +
 drivers/video/fbdev/Kconfig | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 48e941f99558..073ea7cd007b 100644
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
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 8a98539ec490..5fbcb3cc2e8e 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2207,8 +2207,9 @@ config FB_HYPERV
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
-- 
2.29.2

