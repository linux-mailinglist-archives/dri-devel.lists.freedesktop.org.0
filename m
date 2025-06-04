Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02958ACDE4A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C4A10E6AE;
	Wed,  4 Jun 2025 12:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34B810E6AE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A06916112A;
 Wed,  4 Jun 2025 12:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D820C4CEE7;
 Wed,  4 Jun 2025 12:50:05 +0000 (UTC)
Date: Wed, 4 Jun 2025 08:51:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox  
 <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christian 
 Koenig <christian.koenig@amd.com>, Huang Rui  <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost  <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst  
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not set
Message-ID: <20250604085121.324be8c1@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

From: Steven Rostedt <rostedt@goodmis.org>

When CONFIG_SHMEM is not set, the following compiler error occurs:

ld: vmlinux.o: in function `ttm_backup_backup_page':
(.text+0x10363bc): undefined reference to `shmem_writeout'
make[3]: *** [/work/build/trace/nobackup/linux.git/scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
make[2]: *** [/work/build/trace/nobackup/linux.git/Makefile:1241: vmlinux] Error 2
make[1]: *** [/work/build/trace/nobackup/linux.git/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/work/build/nobackup/tracetest'
make: *** [Makefile:248: __sub-make] Error 2

This is due to the replacement of writepage and calling swap_writeout()
and shmem_writeout() directly. The issue is that when CONFIG_SHMEM is not
defined, shmem_writeout() is also not defined.

The function ttm_backup_backup_page() called mapping->a_ops->writepage()
which was then changed to call shmem_writeout() directly.

Even before commit 84798514db50 ("mm: Remove swap_writepage() and
shmem_writepage()"), it didn't make sense to call anything other than
shmem_writeout() as the ttm_backup deals only with shmem folios.

Have DRM_TTM config option select SHMEM to guarantee that shmem_writeout()
is available.

Link: https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/

Suggested-by: Hugh Dickins <hughd@google.com>
Fixes: 84798514db50 ("mm: Remove swap_writepage() and shmem_writepage()")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
Changes since v1: https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/

- Instead of adding a shmem_writeout() stub, just make CONFIG_DRM_TTM
  select CONFIG_SHMEM (Hugh Dickins)

 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f094797f3b2b..ded28c71d89c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select SHMEM
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
-- 
2.47.2

