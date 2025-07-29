Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E113AB148EB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 09:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EB210E5D6;
	Tue, 29 Jul 2025 07:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 916 seconds by postgrey-1.36 at gabe;
 Tue, 29 Jul 2025 06:45:00 UTC
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4575A10E1D1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 06:45:00 +0000 (UTC)
Received: from jtjnmail201605.home.langchao.com
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202507291408431416;
 Tue, 29 Jul 2025 14:08:43 +0800
Received: from localhost.localdomain.com (10.94.7.32) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.57; Tue, 29 Jul 2025 14:08:42 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH 1/1] gpu: drm: fix compilation errors in drm_vram_helper
Date: Tue, 29 Jul 2025 14:07:28 +0800
Message-ID: <20250729060728.82402-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.7.32]
tUid: 2025729140843678e23873c30db11b3d61f0bbdc984db
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Tue, 29 Jul 2025 07:08:13 +0000
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

We encountered the following errors while compiling drm_vram_helper.ko

ERROR: modpost: "drm_gem_ttm_print_info" [drivers/gpu/drm/drm_vram_helper.ko] undefined!
ERROR: modpost: "drm_gem_ttm_mmap" [drivers/gpu/drm/drm_vram_helper.ko] undefined!

The functions drm_gem_ttm_mmap and drm_gem_ttm_print_info are defined in drm_gem_ttm_helper.c. This patch adds drm_gem_ttm_helper.o to DRM_VRAM_HELPER to resolve the undefined symbol errors.

Signed-off-by: chuguangqing <chuguangqing@inspur.com>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4dafbdc8f86a..abbe32ddf6d0 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -125,7 +125,7 @@ drm_suballoc_helper-y := drm_suballoc.o
 obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o
-obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
+obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o drm_gem_ttm_helper.o
 
 drm_ttm_helper-y := drm_gem_ttm_helper.o
 drm_ttm_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_ttm.o
-- 
2.43.5

