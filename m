Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C9CDAB35
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 22:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229F510E2C8;
	Tue, 23 Dec 2025 21:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CXK3MB4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292AB10E2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 21:49:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9DCC60146;
 Tue, 23 Dec 2025 21:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE087C116B1;
 Tue, 23 Dec 2025 21:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766526561;
 bh=wbXv80wkGieMtorvtPo9xkBlFgUWbaK88e8WAPc0z+E=;
 h=From:To:Cc:Subject:Date:From;
 b=CXK3MB4hCoGBbojkYOT7XWk+L/iivDSCo3Pto64T4DqMbBN1Q2cO5M61KHFTUdqvi
 KoDWUZtskfEE5VN2Q9NuSe4x54HHJiYoLGhx5LUzlCsjH0YDXmfWhAfVf7RPEtkGGH
 XSkYl3vnUiuSopPn5An0ikZ5HOK5yH6PghPE8xkUwPvuNwqyGpkoynIOh0+GFmn/CR
 leH/RDmsHyASOsmJRxhbCABdmm/2ZRGL7CdMyoMVNvT8Lp+9qO+L2JVrIk83HmfDQ0
 5ZQZChzUIxgALcV6UxnFq02SzWcbvyT3xNt93flVDgy2IPGi7XxvyO2MCQCJQfefLc
 H1F1KGmdEkowQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Eslam Khafagy <eslam.medhat1993@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: pl111: fix build regression
Date: Tue, 23 Dec 2025 22:49:09 +0100
Message-Id: <20251223214915.503913-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The drm_info() function requires the drm/drm_print.h header to be included
first:

In file included from drivers/gpu/drm/pl111/pl111_nomadik.c:7:
drivers/gpu/drm/pl111/pl111_nomadik.h:11:32: error: 'struct drm_device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   11 | void pl111_nomadik_init(struct drm_device *dev);
      |                                ^~~~~~~~~~
drivers/gpu/drm/pl111/pl111_nomadik.c: In function 'pl111_nomadik_init':
drivers/gpu/drm/pl111/pl111_nomadik.c:34:9: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
   34 |         drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
      |         ^~~~~~~~
      |         pr_info

Fixes: a1542b8ca6ed ("drm: pl111: replace dev_* print functions with drm_* variants")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/pl111/pl111_nomadik.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.c b/drivers/gpu/drm/pl111/pl111_nomadik.c
index f3218d59c5f1..0e5153deb1ac 100644
--- a/drivers/gpu/drm/pl111/pl111_nomadik.c
+++ b/drivers/gpu/drm/pl111/pl111_nomadik.c
@@ -4,6 +4,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/bitops.h>
 #include <linux/module.h>
+#include <drm/drm_print.h>
 #include "pl111_nomadik.h"
 
 #define PMU_CTRL_OFFSET 0x0000
-- 
2.39.5

