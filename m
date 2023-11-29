Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C9F7FD5E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 12:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD7110E1AE;
	Wed, 29 Nov 2023 11:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD8D10E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 11:38:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B9FD3B83E0B;
 Wed, 29 Nov 2023 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BDCC433C7;
 Wed, 29 Nov 2023 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701257912;
 bh=MaraAAbR77wuMHigpLQ9a033vE+F6BEBFhIO1I4KWAY=;
 h=From:To:Cc:Subject:Date:From;
 b=VSoB2KAVDCk+9Fcrt6jgLi/HJKmeNyRK92hzWpS/g4wFGrOytNtwdVOzYm6HedTDU
 uZhxrUOBcYPPS5TN1jBAVH97NeymLIGQPH5RysCgf3kZjNhjoTcJDXlm1/Mb28ixle
 mkOhxosewvvccPKOanB6sOWYyHr1eWf2n8Az4JEsWfO2VE0Q/+uxC5bmy4A1CrtIOL
 vboj7S5a45n253tiJsOxczk3znUpF4ab3V9zbTeTgGrxjt1yR9EmnpEUCV5RSWRwp0
 f9shJH9pZ5eIx5IWYyYU/xcwfznxVONhQHb5whxWDUrxvVN7axzGbOlNfpVppLQQWG
 GRd4kxYI30/rA==
From: Arnd Bergmann <arnd@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 1/2] drm/imagination: avoid -Wmissing-prototype warnings
Date: Wed, 29 Nov 2023 12:33:07 +0100
Message-Id: <20231129113825.2961913-1-arnd@kernel.org>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This warning option is now enabled by default, causing a few build regressions
in combination with the newly added pvr driver:

drivers/gpu/drm/imagination/pvr_device.c:130:6: error: no previous prototype for 'pvr_device_process_active_queues' [-Werror=missing-prototypes]
  130 | void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/imagination/pvr_fw_meta.c:33:1: error: no previous prototype for 'pvr_meta_cr_read32' [-Werror=missing-prototypes]
   33 | pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
      | ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/imagination/pvr_vm.c:542:6: error: no previous prototype for 'pvr_gpuvm_free' [-Werror=missing-prototypes]
  542 | void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)

Mark pvr_device_process_active_queues and pvr_gpuvm_free static as they are only used
in the file they are defined in, and include the correct header for the pvr_meta_cr_read32
declaration.

Fixes: eaf01ee5ba28 ("drm/imagination: Implement job submission and scheduling")
Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure and META FW support")
Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imagination/pvr_device.c  | 2 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c | 1 +
 drivers/gpu/drm/imagination/pvr_vm.c      | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8499becf4fbb..048eba776cf2 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -127,7 +127,7 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
  * This is called any time we receive a FW event. It iterates over all
  * active queues and calls pvr_queue_process() on them.
  */
-void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
+static void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
 {
 	struct pvr_queue *queue, *tmp_queue;
 	LIST_HEAD(active_queues);
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 119934c36184..c39beb70c317 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -4,6 +4,7 @@
 #include "pvr_device.h"
 #include "pvr_fw.h"
 #include "pvr_fw_info.h"
+#include "pvr_fw_meta.h"
 #include "pvr_gem.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_rogue_meta.h"
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 2aab53594a77..30ecd7d7052e 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -539,7 +539,7 @@ pvr_device_addr_and_size_are_valid(struct pvr_vm_context *vm_ctx,
 	       (device_addr + size <= PVR_PAGE_TABLE_ADDR_SPACE_SIZE);
 }
 
-void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
+static void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
 {
 	kfree(to_pvr_vm_context(gpuvm));
 }
-- 
2.39.2

