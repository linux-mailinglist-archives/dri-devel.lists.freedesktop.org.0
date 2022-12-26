Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEA65652B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 22:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6543510E151;
	Mon, 26 Dec 2022 21:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C29F10E119
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 21:33:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5934B60F09;
 Mon, 26 Dec 2022 21:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9B2C433D2;
 Mon, 26 Dec 2022 21:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672090351;
 bh=lwU9Kl8Xzc7F+A8wpvvCU4Lqw994MKfruNw8F1fJBAY=;
 h=From:To:Cc:Subject:Date:From;
 b=Dx8kdvSS7UVJRZ9LP1ka/5k1EZ4Xn3FfN2JNxuPMOxtPjjkCpGAStgMuhSqjsJv1z
 9AgHCgybCvfKR/dLSfsX1X4fE4TF64lwBzPb9SaPT7tuqQoVsdj5AQJdBEJJ7Ti/Cq
 TqjrJhUxYXKXhiKpO/qXU+HDEm0VXnpcq/H51iSu2ZMZPfuTlHSnkrLEIP2Hct/Aj8
 5EYcA05q2LJgZz7NLHDITU3w+pmmJ/vicyqAZ1nicaNzjM8kfbKzOresBaaSbGF7PK
 EYrkXMyQ9aREFrgwhIMxJcu5j2dcMv+Rj2bQKOrsKJin9ulD3HFP0FkaJa+5auO0pm
 pA3kCyY7JPjfg==
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 1/2] habanalabs/uapi: move uapi file to drm
Date: Mon, 26 Dec 2022 23:32:26 +0200
Message-Id: <20221226213227.26953-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the habanalabs.h uapi file from include/uapi/misc to
include/uapi/drm, and rename it to habanalabs_accel.h.

This is required before moving the actual driver to the accel
subsystem.

Update MAINTAINERS file accordingly.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 MAINTAINERS                                                | 2 +-
 drivers/misc/habanalabs/Kconfig                            | 2 +-
 drivers/misc/habanalabs/common/command_buffer.c            | 2 +-
 drivers/misc/habanalabs/common/command_submission.c        | 2 +-
 drivers/misc/habanalabs/common/device.c                    | 2 +-
 drivers/misc/habanalabs/common/habanalabs.h                | 2 +-
 drivers/misc/habanalabs/common/habanalabs_ioctl.c          | 2 +-
 drivers/misc/habanalabs/common/memory.c                    | 2 +-
 drivers/misc/habanalabs/common/state_dump.c                | 2 +-
 drivers/misc/habanalabs/gaudi/gaudiP.h                     | 2 +-
 drivers/misc/habanalabs/gaudi/gaudi_coresight.c            | 3 ++-
 drivers/misc/habanalabs/gaudi2/gaudi2P.h                   | 2 +-
 drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c          | 2 +-
 drivers/misc/habanalabs/goya/goyaP.h                       | 2 +-
 drivers/misc/habanalabs/goya/goya_coresight.c              | 2 +-
 include/uapi/{misc/habanalabs.h => drm/habanalabs_accel.h} | 0
 16 files changed, 16 insertions(+), 15 deletions(-)
 rename include/uapi/{misc/habanalabs.h => drm/habanalabs_accel.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f61eb221415b..ce47d05693d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9049,7 +9049,7 @@ F:	Documentation/ABI/testing/debugfs-driver-habanalabs
 F:	Documentation/ABI/testing/sysfs-driver-habanalabs
 F:	drivers/misc/habanalabs/
 F:	include/trace/events/habanalabs.h
-F:	include/uapi/misc/habanalabs.h
+F:	include/uapi/drm/habanalabs_accel.h
 
 HACKRF MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
diff --git a/drivers/misc/habanalabs/Kconfig b/drivers/misc/habanalabs/Kconfig
index bd01d0d940c0..585235531b9b 100644
--- a/drivers/misc/habanalabs/Kconfig
+++ b/drivers/misc/habanalabs/Kconfig
@@ -19,7 +19,7 @@ config HABANA_AI
 	  the user to submit workloads to the devices.
 
 	  The user-space interface is described in
-	  include/uapi/misc/habanalabs.h
+	  include/uapi/drm/habanalabs_accel.h
 
 	  If unsure, say N.
 
diff --git a/drivers/misc/habanalabs/common/command_buffer.c b/drivers/misc/habanalabs/common/command_buffer.c
index 24100501f8ca..6263d01cb9c1 100644
--- a/drivers/misc/habanalabs/common/command_buffer.c
+++ b/drivers/misc/habanalabs/common/command_buffer.c
@@ -5,7 +5,7 @@
  * All Rights Reserved.
  */
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "habanalabs.h"
 
 #include <linux/mm.h>
diff --git a/drivers/misc/habanalabs/common/command_submission.c b/drivers/misc/habanalabs/common/command_submission.c
index 1543ef993f8e..f6ee10334235 100644
--- a/drivers/misc/habanalabs/common/command_submission.c
+++ b/drivers/misc/habanalabs/common/command_submission.c
@@ -5,7 +5,7 @@
  * All Rights Reserved.
  */
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "habanalabs.h"
 
 #include <linux/uaccess.h>
diff --git a/drivers/misc/habanalabs/common/device.c b/drivers/misc/habanalabs/common/device.c
index 71f958a2e91b..6620580e9ba8 100644
--- a/drivers/misc/habanalabs/common/device.c
+++ b/drivers/misc/habanalabs/common/device.c
@@ -7,7 +7,7 @@
 
 #define pr_fmt(fmt)			"habanalabs: " fmt
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "habanalabs.h"
 
 #include <linux/pci.h>
diff --git a/drivers/misc/habanalabs/common/habanalabs.h b/drivers/misc/habanalabs/common/habanalabs.h
index c609b2e44ad3..7b6f10033ee9 100644
--- a/drivers/misc/habanalabs/common/habanalabs.h
+++ b/drivers/misc/habanalabs/common/habanalabs.h
@@ -11,7 +11,7 @@
 #include "../include/common/cpucp_if.h"
 #include "../include/common/qman_if.h"
 #include "../include/hw_ip/mmu/mmu_general.h"
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 
 #include <linux/cdev.h>
 #include <linux/iopoll.h>
diff --git a/drivers/misc/habanalabs/common/habanalabs_ioctl.c b/drivers/misc/habanalabs/common/habanalabs_ioctl.c
index 4d642987ad02..079483421e12 100644
--- a/drivers/misc/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/misc/habanalabs/common/habanalabs_ioctl.c
@@ -7,7 +7,7 @@
 
 #define pr_fmt(fmt)	"habanalabs: " fmt
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "habanalabs.h"
 
 #include <linux/fs.h>
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index a2d24c9a3d1e..1c38fab39337 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -5,7 +5,7 @@
  * All Rights Reserved.
  */
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "habanalabs.h"
 #include "../include/hw_ip/mmu/mmu_general.h"
 
diff --git a/drivers/misc/habanalabs/common/state_dump.c b/drivers/misc/habanalabs/common/state_dump.c
index 74726907c95e..3a9931f24259 100644
--- a/drivers/misc/habanalabs/common/state_dump.c
+++ b/drivers/misc/habanalabs/common/state_dump.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/vmalloc.h>
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "habanalabs.h"
 
 /**
diff --git a/drivers/misc/habanalabs/gaudi/gaudiP.h b/drivers/misc/habanalabs/gaudi/gaudiP.h
index 4fbcf3f0afe5..3d88d56c8eb3 100644
--- a/drivers/misc/habanalabs/gaudi/gaudiP.h
+++ b/drivers/misc/habanalabs/gaudi/gaudiP.h
@@ -8,7 +8,7 @@
 #ifndef GAUDIP_H_
 #define GAUDIP_H_
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "../common/habanalabs.h"
 #include "../include/common/hl_boot_if.h"
 #include "../include/gaudi/gaudi_packets.h"
diff --git a/drivers/misc/habanalabs/gaudi/gaudi_coresight.c b/drivers/misc/habanalabs/gaudi/gaudi_coresight.c
index 08108f5fed67..3455b14554c6 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi_coresight.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi_coresight.c
@@ -11,7 +11,8 @@
 #include "../include/gaudi/gaudi_masks.h"
 #include "../include/gaudi/gaudi_reg_map.h"
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
+
 #define SPMU_SECTION_SIZE		MME0_ACC_SPMU_MAX_OFFSET
 #define SPMU_EVENT_TYPES_OFFSET		0x400
 #define SPMU_MAX_COUNTERS		6
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2P.h b/drivers/misc/habanalabs/gaudi2/gaudi2P.h
index b4383c199bbb..ed09864c2dfc 100644
--- a/drivers/misc/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/misc/habanalabs/gaudi2/gaudi2P.h
@@ -8,7 +8,7 @@
 #ifndef GAUDI2P_H_
 #define GAUDI2P_H_
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "../common/habanalabs.h"
 #include "../include/common/hl_boot_if.h"
 #include "../include/gaudi2/gaudi2.h"
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c
index 1df7a59e4101..1dfbe293ecec 100644
--- a/drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/misc/habanalabs/gaudi2/gaudi2_coresight.c
@@ -5,7 +5,7 @@
  * All Rights Reserved.
  */
 #include "gaudi2_coresight_regs.h"
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 
 #define GAUDI2_PLDM_CORESIGHT_TIMEOUT_USEC	(CORESIGHT_TIMEOUT_USEC * 2000)
 #define SPMU_MAX_COUNTERS			6
diff --git a/drivers/misc/habanalabs/goya/goyaP.h b/drivers/misc/habanalabs/goya/goyaP.h
index d6ec43d6f6b0..5df3d30b91fd 100644
--- a/drivers/misc/habanalabs/goya/goyaP.h
+++ b/drivers/misc/habanalabs/goya/goyaP.h
@@ -8,7 +8,7 @@
 #ifndef GOYAP_H_
 #define GOYAP_H_
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 #include "../common/habanalabs.h"
 #include "../include/common/hl_boot_if.h"
 #include "../include/goya/goya_packets.h"
diff --git a/drivers/misc/habanalabs/goya/goya_coresight.c b/drivers/misc/habanalabs/goya/goya_coresight.c
index 2c5133cfae65..e7ac3046cfaa 100644
--- a/drivers/misc/habanalabs/goya/goya_coresight.c
+++ b/drivers/misc/habanalabs/goya/goya_coresight.c
@@ -10,7 +10,7 @@
 #include "../include/goya/asic_reg/goya_regs.h"
 #include "../include/goya/asic_reg/goya_masks.h"
 
-#include <uapi/misc/habanalabs.h>
+#include <uapi/drm/habanalabs_accel.h>
 
 #define GOYA_PLDM_CORESIGHT_TIMEOUT_USEC	(CORESIGHT_TIMEOUT_USEC * 100)
 
diff --git a/include/uapi/misc/habanalabs.h b/include/uapi/drm/habanalabs_accel.h
similarity index 100%
rename from include/uapi/misc/habanalabs.h
rename to include/uapi/drm/habanalabs_accel.h
-- 
2.34.1

