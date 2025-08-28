Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D6B39448
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 08:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4756D10E1A1;
	Thu, 28 Aug 2025 06:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="iB1bgR9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id E932610E002
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 01:00:18 +0000 (UTC)
Received: from mrdev.corp.microsoft.com
 (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
 by linux.microsoft.com (Postfix) with ESMTPSA id 745CD2110830;
 Wed, 27 Aug 2025 18:00:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 745CD2110830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1756342818;
 bh=Ss7JjVNarChnOl65zBgAvUfYxLdS3O+Tfo7rHSNxB9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iB1bgR9k38TWMcBaNOrofX9U3QhRranEqmjY4QBRQWN9iqDfCo+sFbyb+ac0gAYI+
 UWCZEAmd8YAQt6iI52v4RuD2hczI/STVoaIWYwQONfpLAwwR0reXjYQj0+TYv1eU+h
 ALWR/RBRW/aykzecJYV3AndpIsKXmPC2xN9RSkyE=
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
Subject: [PATCH V0 2/2] hyper-v: Make CONFIG_HYPERV bool
Date: Wed, 27 Aug 2025 17:59:52 -0700
Message-Id: <20250828005952.884343-3-mrathor@linux.microsoft.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
In-Reply-To: <20250828005952.884343-1-mrathor@linux.microsoft.com>
References: <20250828005952.884343-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=2.1 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Thu, 28 Aug 2025 06:55:09 +0000
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

CONFIG_HYPERV is an umbrella config option involved in enabling hyperv
support and build of modules like hyperv-balloon, hyperv-vmbus, etc.. As
such it should be bool and the hack in Makefile be removed.

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
index 08c4ed005137..b860bc1026b7 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -3,7 +3,7 @@
 menu "Microsoft Hyper-V guest support"
 
 config HYPERV
-	tristate "Microsoft Hyper-V client drivers"
+	bool "Microsoft Hyper-V client drivers"
 	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
 		|| (ARM64 && !CPU_BIG_ENDIAN)
 	select PARAVIRT
diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
index 050517756a82..8b04a33e4dd8 100644
--- a/drivers/hv/Makefile
+++ b/drivers/hv/Makefile
@@ -18,7 +18,7 @@ mshv_root-y := mshv_root_main.o mshv_synic.o mshv_eventfd.o mshv_irq.o \
 mshv_vtl-y := mshv_vtl_main.o
 
 # Code that must be built-in
-obj-$(subst m,y,$(CONFIG_HYPERV)) += hv_common.o
+obj-$(CONFIG_HYPERV) += hv_common.o
 obj-$(subst m,y,$(CONFIG_MSHV_ROOT)) += hv_proc.o
 ifneq ($(CONFIG_MSHV_ROOT) $(CONFIG_MSHV_VTL),)
     obj-y += mshv_common.o
-- 
2.36.1.vfs.0.0

