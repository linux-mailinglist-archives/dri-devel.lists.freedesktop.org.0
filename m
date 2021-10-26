Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DAC43AE28
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 10:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913E76E442;
	Tue, 26 Oct 2021 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD4E6E442;
 Tue, 26 Oct 2021 08:34:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C8B360FE8;
 Tue, 26 Oct 2021 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635237268;
 bh=aqX/BUKmfRta3pa2yzNOCRTmiB629p+qvxg28trH85k=;
 h=From:To:Cc:Subject:Date:From;
 b=iNJHjft9O86KkRz1OcOu6OlAUgJTcpntFvQIEV3zRcSmiDlHR9wHIh2oKUmeftdmZ
 fDZvWx4W/ZgFPMiM0fLzo+s8oD4uw6V2/VxrhDCicRY1czWpHU6VtwVcOL4uZ+L952
 Y3PJcyLBWwrxQP+MbLX3jnNmjqCn8eksHoYTKgW6JBbh9X84YW5nJYIgX+4xcEKy3X
 T3XpgTNXz9Tr1GMgom3opfnJ9F/WTpluH0aTyEq4Yd+DBbujOsqhIJKfob2LLB6q6d
 JyrFWvbQmabjCL5a+M1rcn++qxb8dwe9k3cYNyaZQ+LT+iDcx7/boLm52YFmb1Hd+D
 8r32CVf7MC1KQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/dmabuf: include asm/smp.h for cache operations
Date: Tue, 26 Oct 2021 10:34:16 +0200
Message-Id: <20211026083423.3461555-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The x86 low-level cache management operations are declared in
asm/smp.h, so drivers that call into this code need to include
the header:

drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:248:3: error: implicit declaration of function 'wbinvd_on_all_cpus' [-Werror,-Wimplicit-function-declaration]
                wbinvd_on_all_cpus();
                ^

Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1adcd8e02d29..853a989fcb9b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -7,6 +7,7 @@
 #include <linux/dma-buf.h>
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
+#include <asm/smp.h>
 
 #include "i915_drv.h"
 #include "i915_gem_object.h"
-- 
2.29.2

