Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224436818C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 15:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FE66EA8B;
	Thu, 22 Apr 2021 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA416EA8B;
 Thu, 22 Apr 2021 13:35:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBFFA6145B;
 Thu, 22 Apr 2021 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619098556;
 bh=d8G2H9mh1LJNBBM4BpJVdYdRdIV6lqbGhrLt219FUzY=;
 h=From:To:Cc:Subject:Date:From;
 b=W7TO386JUSq/S336+os/0lgLShCElbkv53kGPxp6KQarPHhKpLiEjAnSGSGT6UEyg
 aHtyuj/tasIYfMWfNt6jIYbB5vV2yR+JVUeZg+hrrgD1a6bwVra3yV2I7/EM6ne9dm
 vw5h6CXpyeYL96pDBY3cIi8MJDU3tmlFugP8CliUVe1b1DaEY+E+9CP/vxLRg1+gEv
 bBcBbDejf8MB1KqbmKJilHgGozMb9ObntzBfkw4fJg1JWDMDlzUJeE6BwupGlilB/L
 +OfPEYXifqTBW10STFYS7v6ok/kWUGNxQ/NwHhvC1z6/hyn6jmBL9LcY1EU6MFUorX
 zAtThf1ti9Zkg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV
Date: Thu, 22 Apr 2021 15:35:33 +0200
Message-Id: <20210422133547.1861063-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 intel-gfx@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The Kconfig dependency is incomplete since DRM_I915_GVT is a 'bool'
symbol that depends on the 'tristate' VFIO_MDEV. This allows a
configuration with VFIO_MDEV=m, DRM_I915_GVT=y and DRM_I915=y that
causes a link failure:

x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `available_instances_show':
gvt.c:(.text+0x67a): undefined reference to `mtype_get_parent_dev'
x86_64-linux-ld: gvt.c:(.text+0x6a5): undefined reference to `mtype_get_type_group_id'
x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `description_show':
gvt.c:(.text+0x76e): undefined reference to `mtype_get_parent_dev'
x86_64-linux-ld: gvt.c:(.text+0x799): undefined reference to `mtype_get_type_group_id'

Clarify the dependency by specifically disallowing the broken
configuration. If VFIO_MDEV is built-in, it will work, but if
VFIO_MDEV=m, the i915 driver cannot be built-in here.

Fixes: 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")
Fixes: 9169cff168ff ("vfio/mdev: Correct the function signatures for the mdev_type_attributes")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 7a5b7a93d33e..791cc9556863 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -111,7 +111,7 @@ config DRM_I915_GVT
 	bool "Enable Intel GVT-g graphics virtualization host support"
 	depends on DRM_I915
 	depends on 64BIT
-	depends on VFIO_MDEV
+	depends on VFIO_MDEV=y || VFIO_MDEV=DRM_I915
 	default n
 	help
 	  Choose this option if you want to enable Intel GVT-g graphics
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
