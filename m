Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C147E4F13
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 03:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199BA10E368;
	Wed,  8 Nov 2023 02:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C86910E368
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 02:46:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AF3B614B1;
 Wed,  8 Nov 2023 02:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80ACC433C7;
 Wed,  8 Nov 2023 02:46:22 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm/Makefile: Move tiny drivers before native drivers
Date: Wed,  8 Nov 2023 10:46:13 +0800
Message-Id: <20231108024613.2898921-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
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
Cc: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
device_initcall to subsys_initcall_sync") some Lenovo laptops get a blank
screen until the display manager starts.

This regression occurs with such a Kconfig combination:
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_DRM_SIMPLEDRM=y
CONFIG_DRM_I915=y      # Or other native drivers such as radeon, amdgpu

If replace CONFIG_DRM_SIMPLEDRM with CONFIG_FB_SIMPLE (they use the same
device), there is no blank screen. The root cause is the initialization
order, and this order depends on the Makefile.

FB_SIMPLE is before native DRM drivers (e.g. i915, radeon, amdgpu, and
so on), but DRM_SIMPLEDRM is after them. Thus, if we use FB_SIMPLE, I915
will takeover FB_SIMPLE, then no problem; and if we use DRM_SIMPLEDRM,
DRM_SIMPLEDRM will try to takeover I915, but fails to work.

So we can move the "tiny" directory before native DRM drivers to solve
this problem.

Fixes: 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from device_initcall to subsys_initcall_sync")
Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdomain/T/#t
Reported-by: Jaak Ristioja <jaak@ristioja.ee>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8e1bde059170..db0f3d3aff43 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -141,6 +141,7 @@ obj-y			+= arm/
 obj-y			+= display/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
+obj-y			+= tiny/
 obj-$(CONFIG_DRM_RADEON)+= radeon/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
 obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
@@ -182,7 +183,6 @@ obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
 obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
 obj-y			+= hisilicon/
 obj-y			+= mxsfb/
-obj-y			+= tiny/
 obj-$(CONFIG_DRM_PL111) += pl111/
 obj-$(CONFIG_DRM_TVE200) += tve200/
 obj-$(CONFIG_DRM_XEN) += xen/
-- 
2.39.3

