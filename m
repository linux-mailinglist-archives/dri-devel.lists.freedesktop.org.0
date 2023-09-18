Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8BC7A45A2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A151C10E238;
	Mon, 18 Sep 2023 09:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB4410E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 114FCB80CA2;
 Mon, 18 Sep 2023 09:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08D8C433C8;
 Mon, 18 Sep 2023 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028410;
 bh=DKlCHJ1BfrgX6X6/lxRyiL9q1TBqxd84Oj8p7ZwR7Zk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BBqeOuJGJdSu44etL3D+aEFE2n+DhAdUcsiWdveIL4AKde8n8iMnti19zRE3IZme3
 8/vg/OQk4mrm8hKsfCin7SOlJsBnx0wCJOQDd345OYtKHG2gB08bpMkbY1QUuFMeWA
 B6bGvrhXn0R6sy1UL+fwyBcC54r/HuNSigQwObUz2zHoW7cKNiT9QfLmBSOeK6oBei
 GYoj/acNIbBBXsAW8Emk3JLz42L70uLLopNo0FegRD3jfk/ZO2xvPQBIug9Au9FucJ
 Z1RtKm4ksg70Kn19XjwJrBDiwKynmHrSi22EMIrhTAGTNHcTf3XrjvKtuz0crWSeHy
 TYToFCFXpUNBA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/14] accel/habanalabs: move cpucp interface to
 linux/habanalabs
Date: Mon, 18 Sep 2023 12:13:10 +0300
Message-Id: <20230918091321.855943-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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
Cc: David Meriin <dmeriin@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Meriin <dmeriin@habana.ai>

The CPUCP interface is moved to a shared folder outside of accel as
a pre-requisite to upstream the NIC drivers that will also include
this file.

Signed-off-by: David Meriin <dmeriin@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 MAINTAINERS                                         |  1 +
 drivers/accel/habanalabs/common/firmware_if.c       |  2 +-
 drivers/accel/habanalabs/common/habanalabs.h        |  2 +-
 drivers/accel/habanalabs/gaudi/gaudiP.h             |  2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h           |  2 +-
 drivers/accel/habanalabs/goya/goyaP.h               |  2 +-
 .../common => include/linux/habanalabs}/cpucp_if.h  | 13 +++++++++----
 .../linux/habanalabs}/hl_boot_if.h                  |  0
 8 files changed, 15 insertions(+), 9 deletions(-)
 rename {drivers/accel/habanalabs/include/common => include/linux/habanalabs}/cpucp_if.h (99%)
 rename {drivers/accel/habanalabs/include/common => include/linux/habanalabs}/hl_boot_if.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..a9dad911add9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9067,6 +9067,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git
 F:	Documentation/ABI/testing/debugfs-driver-habanalabs
 F:	Documentation/ABI/testing/sysfs-driver-habanalabs
 F:	drivers/accel/habanalabs/
+F:	include/linux/habanalabs/
 F:	include/trace/events/habanalabs.h
 F:	include/uapi/drm/habanalabs_accel.h
 
diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 2bc775d29854..2a6dfea3d27d 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -6,7 +6,7 @@
  */
 
 #include "habanalabs.h"
-#include "../include/common/hl_boot_if.h"
+#include <linux/habanalabs/hl_boot_if.h>
 
 #include <linux/firmware.h>
 #include <linux/crc32.h>
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index efb046370f2e..8b5fd2b92676 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -8,7 +8,7 @@
 #ifndef HABANALABSP_H_
 #define HABANALABSP_H_
 
-#include "../include/common/cpucp_if.h"
+#include <linux/habanalabs/cpucp_if.h>
 #include "../include/common/qman_if.h"
 #include "../include/hw_ip/mmu/mmu_general.h"
 #include <uapi/drm/habanalabs_accel.h>
diff --git a/drivers/accel/habanalabs/gaudi/gaudiP.h b/drivers/accel/habanalabs/gaudi/gaudiP.h
index b8fa724be5a1..831be53bb9d7 100644
--- a/drivers/accel/habanalabs/gaudi/gaudiP.h
+++ b/drivers/accel/habanalabs/gaudi/gaudiP.h
@@ -10,7 +10,7 @@
 
 #include <uapi/drm/habanalabs_accel.h>
 #include "../common/habanalabs.h"
-#include "../include/common/hl_boot_if.h"
+#include <linux/habanalabs/hl_boot_if.h>
 #include "../include/gaudi/gaudi_packets.h"
 #include "../include/gaudi/gaudi.h"
 #include "../include/gaudi/gaudi_async_events.h"
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index 5f3ce086928e..4535aa5ab561 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -10,7 +10,7 @@
 
 #include <uapi/drm/habanalabs_accel.h>
 #include "../common/habanalabs.h"
-#include "../include/common/hl_boot_if.h"
+#include <linux/habanalabs/hl_boot_if.h>
 #include "../include/gaudi2/gaudi2.h"
 #include "../include/gaudi2/gaudi2_packets.h"
 #include "../include/gaudi2/gaudi2_fw_if.h"
diff --git a/drivers/accel/habanalabs/goya/goyaP.h b/drivers/accel/habanalabs/goya/goyaP.h
index 5df3d30b91fd..194c2ae157cd 100644
--- a/drivers/accel/habanalabs/goya/goyaP.h
+++ b/drivers/accel/habanalabs/goya/goyaP.h
@@ -9,8 +9,8 @@
 #define GOYAP_H_
 
 #include <uapi/drm/habanalabs_accel.h>
+#include <linux/habanalabs/hl_boot_if.h>
 #include "../common/habanalabs.h"
-#include "../include/common/hl_boot_if.h"
 #include "../include/goya/goya_packets.h"
 #include "../include/goya/goya.h"
 #include "../include/goya/goya_async_events.h"
diff --git a/drivers/accel/habanalabs/include/common/cpucp_if.h b/include/linux/habanalabs/cpucp_if.h
similarity index 99%
rename from drivers/accel/habanalabs/include/common/cpucp_if.h
rename to include/linux/habanalabs/cpucp_if.h
index ef7d32224066..4cdedb603ecb 100644
--- a/drivers/accel/habanalabs/include/common/cpucp_if.h
+++ b/include/linux/habanalabs/cpucp_if.h
@@ -668,7 +668,11 @@ enum pq_init_status {
  *       Packet to register interrupts indicating LKD is ready to receive events from FW.
  *
  * CPUCP_PACKET_SOFT_RESET -
- *	 Packet to perform soft-reset.
+ *      Packet to perform soft-reset.
+ *
+ * CPUCP_PACKET_INTS_REGISTER -
+ *       Packet to inform FW that queues have been established and LKD is ready to receive
+ *       EQ events.
  */
 
 enum cpucp_packet_id {
@@ -734,9 +738,10 @@ enum cpucp_packet_id {
 	CPUCP_PACKET_RESERVED10,		/* not used */
 	CPUCP_PACKET_RESERVED11,		/* not used */
 	CPUCP_PACKET_RESERVED12,		/* internal */
-	CPUCP_PACKET_REGISTER_INTERRUPTS,	/* internal */
-	CPUCP_PACKET_SOFT_RESET,		/* internal */
-	CPUCP_PACKET_ID_MAX			/* must be last */
+	CPUCP_PACKET_RESERVED13,                /* internal */
+	CPUCP_PACKET_SOFT_RESET,                /* internal */
+	CPUCP_PACKET_INTS_REGISTER,             /* internal */
+	CPUCP_PACKET_ID_MAX                     /* must be last */
 };
 
 #define CPUCP_PACKET_FENCE_VAL	0xFE8CE7A5
diff --git a/drivers/accel/habanalabs/include/common/hl_boot_if.h b/include/linux/habanalabs/hl_boot_if.h
similarity index 100%
rename from drivers/accel/habanalabs/include/common/hl_boot_if.h
rename to include/linux/habanalabs/hl_boot_if.h
-- 
2.34.1

