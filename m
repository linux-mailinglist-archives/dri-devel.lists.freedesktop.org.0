Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A905786AF2C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 13:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D0B10E625;
	Wed, 28 Feb 2024 12:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KB3pClLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4F10E40C;
 Wed, 28 Feb 2024 12:27:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7FAC760ED6;
 Wed, 28 Feb 2024 12:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9966DC433F1;
 Wed, 28 Feb 2024 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709123276;
 bh=zJkyW1REgGcoo5I8xkc1mIm72bDArJYrzYMZkYH4CyE=;
 h=From:To:Cc:Subject:Date:From;
 b=KB3pClLY5dKCrRpGkbtavnPw1utKoKmS/kX8Uohz+oFYrGvdIXg7tvVk9Lo3h4EPc
 o4WcwGJbOcn6pnyqzT8vd426E4eA4utqcx7B8E0ROL0jzRyCFio6LBB0NIz0D7P6eu
 viaQgw14TQFfcg1FWjm6Y9dJ5SRqTIxPBpRKoHbEvPaHmfyUkAEIc705MRY75IygYF
 dMoM0tMEA9lvhHulq+bxGtvhC4FTBru8fhQdvr+AfJfTZLQUHqmQKLSwoKHCJ9i+gl
 H5zL9urT2k/1YO97uS8YF4FSObxmPm4j8S7Vp0IP+wgfm3c730fy93NH5l4IaDS+V+
 n0L4ar7Z6GNyw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] xe: avoid using writeq() on 32-bit
Date: Wed, 28 Feb 2024 13:27:33 +0100
Message-Id: <20240228122746.3091608-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

32-bit kernels do not provide a writeq(), failing the build:

drivers/gpu/drm/xe/xe_ggtt.c:78:2: error: use of undeclared identifier 'writeq'
   78 |         writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);

Using lo_hi_writeq() instead will write the lower 32 bits to the address
before writing the upper 32 bits to the following word, which is likely
the correct replacement to do on 32-bit targets.

Include the linux/io-64-nonatomic-lo-hi.h header to automatically pick
the regular writeq() on 64-bit machines but fall back to lo_hi_writeq()
on 32-bit ones.

Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5d46958e3144..1ffcc63ca86d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -6,6 +6,7 @@
 #include "xe_ggtt.h"
 
 #include <linux/sizes.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 
 #include <drm/drm_managed.h>
 #include <drm/i915_drm.h>
-- 
2.39.2

