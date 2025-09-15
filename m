Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A34B58F0B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796DC10E6C0;
	Tue, 16 Sep 2025 07:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="LRgTB/yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B76210E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 23:46:23 +0000 (UTC)
Received: from mrdev.corp.microsoft.com
 (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
 by linux.microsoft.com (Postfix) with ESMTPSA id CE92E212329F;
 Mon, 15 Sep 2025 16:46:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CE92E212329F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757979982;
 bh=gs16ls5Och2HyyMzPWy5wjtp6Giar6v2cihGMYFiDfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LRgTB/yg0F3upRJmZZ2276i8xhsWZd64Q4YUv9nQmQzBtN3VlzJQ81lurrbYaCfhn
 0UaiirGPm6vk6DhOPYu0tUFKZi8HIKcDSJwK/PHYzrTJ0ZsDUTAtPUbY8CKlMgnjvS
 cKizZeKdQnGdwSlzTXU42nEF8VO/b9lLeIITG7HE=
From: Mukesh Rathor <mrathor@linux.microsoft.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, bhelgaas@google.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 gregkh@linuxfoundation.org, deller@gmx.de, arnd@arndb.de,
 sgarzare@redhat.com, horms@kernel.org
Subject: [PATCH v2 2/2] Drivers: hv: Make CONFIG_HYPERV bool
Date: Mon, 15 Sep 2025 16:46:04 -0700
Message-Id: <20250915234604.3256611-3-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
In-Reply-To: <20250915234604.3256611-1-mrathor@linux.microsoft.com>
References: <20250915234604.3256611-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=1.7 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Tue, 16 Sep 2025 07:21:33 +0000
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

With CONFIG_HYPERV and CONFIG_HYPERV_VMBUS separated, change CONFIG_HYPERV
to bool from tristate. CONFIG_HYPERV now becomes the core Hyper-V
hypervisor support, such as hypercalls, clocks/timers, Confidential
Computing setup, PCI passthru, etc. that doesn't involve VMBus or VMBus
devices.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
---
 drivers/Makefile    | 2 +-
 drivers/hv/Kconfig  | 2 +-
 drivers/hv/Makefile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index b5749cf67044..7ad5744db0b6 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -161,7 +161,7 @@ obj-$(CONFIG_SOUNDWIRE)		+= soundwire/
 
 # Virtualization drivers
 obj-$(CONFIG_VIRT_DRIVERS)	+= virt/
-obj-$(subst m,y,$(CONFIG_HYPERV))	+= hv/
+obj-$(CONFIG_HYPERV)		+= hv/
 
 obj-$(CONFIG_PM_DEVFREQ)	+= devfreq/
 obj-$(CONFIG_EXTCON)		+= extcon/
diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 29f8637f441a..0b8c391a0342 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -3,7 +3,7 @@
 menu "Microsoft Hyper-V guest support"
 
 config HYPERV
-	tristate "Microsoft Hyper-V client drivers"
+	bool "Microsoft Hyper-V core hypervisor support"
 	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
 		|| (ARM64 && !CPU_BIG_ENDIAN)
 	select PARAVIRT
diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
index 4bb41663767d..1a1677bf4dac 100644
--- a/drivers/hv/Makefile
+++ b/drivers/hv/Makefile
@@ -16,5 +16,5 @@ mshv_root-y := mshv_root_main.o mshv_synic.o mshv_eventfd.o mshv_irq.o \
 	       mshv_root_hv_call.o mshv_portid_table.o
 
 # Code that must be built-in
-obj-$(subst m,y,$(CONFIG_HYPERV)) += hv_common.o
+obj-$(CONFIG_HYPERV) += hv_common.o
 obj-$(subst m,y,$(CONFIG_MSHV_ROOT)) += hv_proc.o mshv_common.o
-- 
2.36.1.vfs.0.0

