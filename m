Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11322359D30
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 13:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9806EC15;
	Fri,  9 Apr 2021 11:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12676EC0A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617967257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PD3Q7CnsV9MqbBn+Rr4TRlOA2dr68nSidgD5C8Dw+e8=;
 b=O/UOgQW41J7EJwcNayZ9bp9RQ4rtZu7hI5GiM65Yrw9Q3Tw9koLENkHtF4V9wAx/dbVz6s
 tMxvGfwnztvZOSIbst/8YZLpRV4m36LregBUm+iycIBdzzu76ie3gwa97EiIyhuLzQ3ZH5
 UKggSe0e9eAXB/TeZtXKBP0ke0r2UkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-ohRWwxMiOb2g9zARlvyeqQ-1; Fri, 09 Apr 2021 07:20:53 -0400
X-MC-Unique: ohRWwxMiOb2g9zARlvyeqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD7664157;
 Fri,  9 Apr 2021 11:20:48 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F4195D9E3;
 Fri,  9 Apr 2021 11:20:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
Date: Fri,  9 Apr 2021 13:20:35 +0200
Message-Id: <20210409112035.27221-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: linux-fbdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 David Hildenbrand <david@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Suman Anna <s-anna@ti.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 etnaviv@lists.freedesktop.org, Peter Collingbourne <pcc@google.com>,
 linux-arm-kernel@lists.infradead.org,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>, linux-mm@kvack.org,
 Andrew Jeffery <andrew@aj.id.au>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Random drivers should not override a user configuration of core knobs
(e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
which depends on CMA, if possible; however, these drivers also have to
tolerate if DMA_CMA is not available/functioning, for example, if no CMA
area for DMA_CMA use has been setup via "cma=X". In the worst case, the
driver cannot do it's job properly in some configurations.

For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and DMA_CMA if
available") documents
	While this is no build dependency, etnaviv will only work correctly
	on most systems if CMA and DMA_CMA are enabled. Select both options
	if available to avoid users ending up with a non-working GPU due to
	a lacking kernel config.
So etnaviv really wants to have DMA_CMA, however, can deal with some cases
where it is not available.

Let's introduce WANT_DMA_CMA and use it in most cases where drivers
select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
of recursive dependency issues).

We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.

With this change, distributions can disable CONFIG_CMA or
CONFIG_DMA_CMA, without it silently getting enabled again by random
drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
and CONFIG_DMA_CMA if they are unspecified and any driver is around that
selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
DRM_KMS_CMA_HELPER.

For example, if any driver selects WANT_DMA_CMA and we do a
"make olddefconfig":

1. With "# CONFIG_CMA is not set" and no specification of
   "CONFIG_DMA_CMA"

-> CONFIG_DMA_CMA won't be part of .config

2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA

Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)

3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"

-> CONFIG_DMA_CMA will be removed from .config

Note: drivers/remoteproc seems to be special; commit c51e882cd711
("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains that
there is a real dependency to DMA_CMA for it to work; leave that dependency
in place and don't convert it to a soft dependency.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Peter Collingbourne <pcc@google.com>
Cc: Suman Anna <s-anna@ti.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: etnaviv@lists.freedesktop.org
Cc: linux-mips@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Let's see if this approach is better for soft dependencies (and if we
actually have some hard dependencies in there). This is the follow-up
of
  https://lkml.kernel.org/r/20210408092011.52763-1-david@redhat.com
  https://lkml.kernel.org/r/20210408100523.63356-1-david@redhat.com

I was wondering if it would make sense in some drivers to warn if either
CONFIG_DMA_CMA is not available or if DRM_CMA has not been configured
properly - just to give people a heads up that something might more likely
go wrong; that would, however, be future work.

v2 -> v3:
- Don't use "imply" but instead use a new WANT_DMA_CMA and make the default
  of CMA and DMA_CMA depend on it.
- Also adjust ingenic, mcde, tve200; these sound like soft dependencies as
  well (although DMA_CMA is really desired)

v1 -> v2:
- Fix DRM_CMA -> DMA_CMA

---
 drivers/gpu/drm/Kconfig         | 2 ++
 drivers/gpu/drm/aspeed/Kconfig  | 2 --
 drivers/gpu/drm/etnaviv/Kconfig | 3 +--
 drivers/gpu/drm/ingenic/Kconfig | 1 -
 drivers/gpu/drm/mcde/Kconfig    | 1 -
 drivers/gpu/drm/tve200/Kconfig  | 1 -
 drivers/video/fbdev/Kconfig     | 2 +-
 kernel/dma/Kconfig              | 7 +++++++
 mm/Kconfig                      | 1 +
 9 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 85b79a7fee63..6f9989adfa93 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -201,12 +201,14 @@ config DRM_TTM_HELPER
 config DRM_GEM_CMA_HELPER
 	bool
 	depends on DRM
+	select WANT_DMA_CMA
 	help
 	  Choose this if you need the GEM CMA helper functions
 
 config DRM_KMS_CMA_HELPER
 	bool
 	depends on DRM
+	select WANT_DMA_CMA
 	select DRM_GEM_CMA_HELPER
 	help
 	  Choose this if you need the KMS CMA helper functions
diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
index 5e95bcea43e9..e5ff33f85f21 100644
--- a/drivers/gpu/drm/aspeed/Kconfig
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -6,8 +6,6 @@ config DRM_ASPEED_GFX
 	depends on MMU
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-	select DMA_CMA if HAVE_DMA_CONTIGUOUS
-	select CMA if HAVE_DMA_CONTIGUOUS
 	select MFD_SYSCON
 	help
 	  Chose this option if you have an ASPEED AST2500 SOC Display
diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
index faa7fc68b009..a3e7649b44a7 100644
--- a/drivers/gpu/drm/etnaviv/Kconfig
+++ b/drivers/gpu/drm/etnaviv/Kconfig
@@ -9,8 +9,7 @@ config DRM_ETNAVIV
 	select THERMAL if DRM_ETNAVIV_THERMAL
 	select TMPFS
 	select WANT_DEV_COREDUMP
-	select CMA if HAVE_DMA_CONTIGUOUS
-	select DMA_CMA if HAVE_DMA_CONTIGUOUS
+	select WANT_DMA_CMA
 	select DRM_SCHED
 	help
 	  DRM driver for Vivante GPUs.
diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 3b57f8be007c..156b11b7bbb8 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -2,7 +2,6 @@ config DRM_INGENIC
 	tristate "DRM Support for Ingenic SoCs"
 	depends on MIPS || COMPILE_TEST
 	depends on DRM
-	depends on CMA
 	depends on OF
 	depends on COMMON_CLK
 	select DRM_BRIDGE
diff --git a/drivers/gpu/drm/mcde/Kconfig b/drivers/gpu/drm/mcde/Kconfig
index 71c689b573c9..217d54c4babc 100644
--- a/drivers/gpu/drm/mcde/Kconfig
+++ b/drivers/gpu/drm/mcde/Kconfig
@@ -1,7 +1,6 @@
 config DRM_MCDE
 	tristate "DRM Support for ST-Ericsson MCDE (Multichannel Display Engine)"
 	depends on DRM
-	depends on CMA
 	depends on ARM || COMPILE_TEST
 	depends on OF
 	depends on COMMON_CLK
diff --git a/drivers/gpu/drm/tve200/Kconfig b/drivers/gpu/drm/tve200/Kconfig
index e2d163c74ed6..d04b7322c770 100644
--- a/drivers/gpu/drm/tve200/Kconfig
+++ b/drivers/gpu/drm/tve200/Kconfig
@@ -2,7 +2,6 @@
 config DRM_TVE200
 	tristate "DRM Support for Faraday TV Encoder TVE200"
 	depends on DRM
-	depends on CMA
 	depends on ARM || COMPILE_TEST
 	depends on OF
 	select DRM_BRIDGE
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4f02db65dede..e8acd4f77d41 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2186,7 +2186,7 @@ config FB_HYPERV
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_DEFERRED_IO
-	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
+	select WANT_DMA_CMA
 	help
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
 
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 77b405508743..928f16d2461d 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -103,8 +103,15 @@ config DMA_DIRECT_REMAP
 	select DMA_REMAP
 	select DMA_COHERENT_POOL
 
+config WANT_DMA_CMA
+	bool
+	help
+	  Drivers should "select" this option if they desire to use the
+	  DMA_CMA mechanism.
+
 config DMA_CMA
 	bool "DMA Contiguous Memory Allocator"
+	default y if WANT_DMA_CMA
 	depends on HAVE_DMA_CONTIGUOUS && CMA
 	help
 	  This enables the Contiguous Memory Allocator which allows drivers
diff --git a/mm/Kconfig b/mm/Kconfig
index 24c045b24b95..169598ee56b1 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -485,6 +485,7 @@ config FRONTSWAP
 
 config CMA
 	bool "Contiguous Memory Allocator"
+	default y if WANT_DMA_CMA
 	depends on MMU
 	select MIGRATION
 	select MEMORY_ISOLATION
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
