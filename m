Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67063024D0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 13:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E336E082;
	Mon, 25 Jan 2021 12:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED736E082;
 Mon, 25 Jan 2021 12:25:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B2F922583;
 Mon, 25 Jan 2021 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611577547;
 bh=WEu6xFibX0AWxe6SUVQhMl1iWA9mDOLr68B6RzcwQlg=;
 h=From:To:Cc:Subject:Date:From;
 b=lZy1xrMCh5by4v6N/nuKNTDygAOQX3S9+fYSQemWPn3VsgS1Cin2TAFqofoIfZjDq
 uaPL7yLPtzK+CuVrbIDeqwt69OAirmhCw2srJkEBNXvgGB4o8sAjzRK3OYE4lpW6rs
 innvECZoTC5IGQdWx8KN65bgy8g0a1KbHZ+RJZlIoe5MSBqI1i/92Uw+gUpLdG4evH
 bj+Yg32P6FdkiZR4bvlSFYKavRhuMEz0qYrGbQlRymixPX/lwEkd+X28tzbjE5VpEQ
 uASJMbqNQ+lvlvXpv92U4Vwd1KwaLESovdzsfNC/SHT3txhhZtRBNx8sDPHFEoaGPf
 DpABsfdL/6bEg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] drm/i915/gem: fix non-SMP build failure
Date: Mon, 25 Jan 2021 13:25:34 +0100
Message-Id: <20210125122542.4144849-1-arnd@kernel.org>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The x86-specific wbinvd_on_all_cpus() function is exported
through asm/smp.h, causing a build failure in the i915 driver
when SMP is disabled:

drivers/gpu/drm/i915/i915_gem.c:1182:2: error: implicit declaration of function 'wbinvd_on_all_cpus' [-Werror,-Wimplicit-function-declaration]

Include that header file explicitly.

Fixes: 30d2bfd09383 ("drm/i915/gem: Almagamate clflushes on freeze")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/i915_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 9b04dff5eb32..2a1643514577 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -36,6 +36,7 @@
 #include <linux/pci.h>
 #include <linux/dma-buf.h>
 #include <linux/mman.h>
+#include <asm/smp.h>
 
 #include "display/intel_display.h"
 #include "display/intel_frontbuffer.h"
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
