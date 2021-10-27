Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8553943D336
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB036E900;
	Wed, 27 Oct 2021 20:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52936E900;
 Wed, 27 Oct 2021 20:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=DCX9q09z8tXg5bvLCU7mK4ylZma0Aj+ui0Z+ZwYz7w4=; b=ChN2fVno3u+2S8lH/bNNRWYfd6
 umxx7lnMdiRXNJLkzS+SzM8jyQ7Ry4VBoK3riQJpaQV4waGt7oKz7L/8G2SXvOnfZPEXqbL41k0wT
 jvIoI5gJpdUFhCYG5WnMijDVi82xBseSZfx5IJ9emAl1ENS0m86h9aDhp6V3dYQx63HL+jdyZNb9K
 u9ePAkCnHqhK/IwmyyrooV8mDJCOUhv+JjoBLFCFx4Y8LJBeEsCqoVk79sKZ7KHFei767viLS2XC7
 +JKZVVeAr5t901mZMpcYtZc30vzkU5xSLgTD4ELlSvrcu3m1fLhlwa/EoYJsadvxny6CztGaP4saH
 12HBmzbw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfpux-0066Im-3Q; Wed, 27 Oct 2021 20:53:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH -next] i915/gem/dmabuf: add <asm/smp.h> to fix build error
Date: Wed, 27 Oct 2021 13:53:02 -0700
Message-Id: <20211027205302.19222-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When CONFIG_SMP is not set, wbinvd_on_all_cpus() is not declared,
due to missing <asm/smp.h>.

Fixes this build error:

../drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c: In function 'i915_gem_object_get_pages_dmabuf':
../drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:251:3: error: implicit declaration of function 'wbinvd_on_all_cpus'; did you mean 'wrmsr_on_cpus'? [-Werror=implicit-function-declaration]
   wbinvd_on_all_cpus();

Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20211027.orig/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ linux-next-20211027/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -8,6 +8,7 @@
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
 #include <linux/module.h>
+#include <asm/smp.h>
 
 #include "i915_drv.h"
 #include "i915_gem_object.h"
