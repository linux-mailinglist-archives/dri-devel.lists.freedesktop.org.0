Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADBA62C46
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 13:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE9E10E06E;
	Sat, 15 Mar 2025 12:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1043 seconds by postgrey-1.36 at gabe;
 Sat, 15 Mar 2025 12:08:20 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C044310E06E;
 Sat, 15 Mar 2025 12:08:20 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZFKH05shYzDssM;
 Sat, 15 Mar 2025 19:47:40 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
 by mail.maildlp.com (Postfix) with ESMTPS id 3CF331401E9;
 Sat, 15 Mar 2025 19:50:53 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 15 Mar
 2025 19:50:52 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <tzimmermann@suse.de>,
 <dev@lankhorst.se>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/i915/display: Fix build error without
 DRM_FBDEV_EMULATION
Date: Sat, 15 Mar 2025 20:01:43 +0800
Message-ID: <20250315120143.2344958-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf500002.china.huawei.com (7.185.36.57)
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

In file included from <command-line>:
./drivers/gpu/drm/i915/display/intel_fbdev.h: In function ‘intel_fbdev_framebuffer’:
./drivers/gpu/drm/i915/display/intel_fbdev.h:32:16: error: ‘NULL’ undeclared (first use in this function)
   32 |         return NULL;
      |                ^~~~
./drivers/gpu/drm/i915/display/intel_fbdev.h:1:1: note: ‘NULL’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
  +++ |+#include <stddef.h>
    1 | /* SPDX-License-Identifier: MIT */
./drivers/gpu/drm/i915/display/intel_fbdev.h:32:16: note: each undeclared identifier is reported only once for each function it appears in
   32 |         return NULL;
      |                ^~~~

Build fails if CONFIG_DRM_FBDEV_EMULATION is n, add missing header file.

Fixes: 9fa154f40eb6 ("drm/{i915,xe}: Run DRM default client setup")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index ca2c8c438f02..89bad3a2b01a 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_FBDEV_H__
 #define __INTEL_FBDEV_H__
 
+#include <linux/types.h>
+
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
 struct drm_i915_private;
-- 
2.34.1

