Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C52373416
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 05:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ACA6E420;
	Wed,  5 May 2021 03:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2A86E413
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 03:57:46 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 4 May 2021 20:57:43 -0700
Received: from vertex.localdomain (unknown [10.21.250.233])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 5996C2047D;
 Tue,  4 May 2021 20:57:45 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/vmwgfx: Port vmwgfx to arm64
Date: Tue, 4 May 2021 23:57:40 -0400
Message-ID: <20210505035740.286923-7-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505035740.286923-1-zackr@vmware.com>
References: <20210505035740.286923-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: krastevm@vmware.com, sroland@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change fixes all of the arm64 issues we've had in the driver.
ARM support is provided in svga version 3, for which support we've added
in previous changes. svga version 3 currently lacks many of the
advanced features (in particular 3D support is lacking) but
that will change in time.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/Kconfig            |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c       |   9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c       |  31 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.h       | 214 ---------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h | 130 +++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h   | 219 ++++++++++++++++++++++
 7 files changed, 378 insertions(+), 230 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg.h
 create mode 100755 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h

diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index b3a34196935b..0060ef842b5a 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
-	depends on DRM && PCI && X86 && MMU
+	depends on DRM && PCI && MMU
+	depends on X86 || ARM64
 	select DRM_TTM
 	select MAPPING_DIRTY_HELPERS
 	# Only needed for the transitional use of drm_crtc_init - can be removed
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 3c44091ff44f..385681d7df7c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -37,6 +37,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <generated/utsrelease.h>
 
 #include "ttm_object.h"
 #include "vmwgfx_binding.h"
@@ -781,7 +782,6 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	int ret;
 	enum vmw_res_type i;
 	bool refuse_dma = false;
-	char host_log[100] = {0};
 	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 
 	dev_priv->vmw_chipset = pci_id;
@@ -1050,10 +1050,9 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		DRM_INFO("SM4 support available.\n");
 	DRM_INFO("Running without reservation semaphore\n");
 
-	snprintf(host_log, sizeof(host_log), "vmwgfx: Module Version: %d.%d.%d",
-		VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
-		VMWGFX_DRIVER_PATCHLEVEL);
-	vmw_host_log(host_log);
+	vmw_host_printf("vmwgfx: Module Version: %d.%d.%d (kernel: %s)",
+			VMWGFX_DRIVER_MAJOR, VMWGFX_DRIVER_MINOR,
+			VMWGFX_DRIVER_PATCHLEVEL, UTS_RELEASE);
 
 	if (dev_priv->enable_fb) {
 		vmw_fifo_resource_inc(dev_priv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 696ea7086140..c3391388971e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1498,7 +1498,7 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 /* Host messaging -vmwgfx_msg.c: */
 int vmw_host_get_guestinfo(const char *guest_info_param,
 			   char *buffer, size_t *length);
-int vmw_host_log(const char *log);
+__printf(1, 2) int vmw_host_printf(const char *fmt, ...);
 int vmw_msg_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file_priv);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 609269625468..3d08f5700bdb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -33,7 +33,8 @@
 #include <asm/hypervisor.h>
 
 #include "vmwgfx_drv.h"
-#include "vmwgfx_msg.h"
+#include "vmwgfx_msg_x86.h"
+#include "vmwgfx_msg_arm64.h"
 
 #define MESSAGE_STATUS_SUCCESS  0x0001
 #define MESSAGE_STATUS_DORECV   0x0002
@@ -473,30 +474,40 @@ int vmw_host_get_guestinfo(const char *guest_info_param,
 }
 
 
-
 /**
- * vmw_host_log: Sends a log message to the host
+ * vmw_host_printf: Sends a log message to the host
  *
- * @log: NULL terminated string
+ * @fmt: Regular printf format string and arguments
  *
  * Returns: 0 on success
  */
-int vmw_host_log(const char *log)
+__printf(1, 2)
+int vmw_host_printf(const char *fmt, ...)
 {
+	va_list ap;
 	struct rpc_channel channel;
 	char *msg;
+	char *log;
 	int ret = 0;
 
-
 	if (!vmw_msg_enabled)
 		return -ENODEV;
 
-	if (!log)
+	if (!fmt)
 		return ret;
 
+	va_start(ap, fmt);
+	log = kvasprintf(GFP_KERNEL, fmt, ap);
+	va_end(ap);
+	if (!log) {
+		DRM_ERROR("Cannot allocate memory for the log message.\n");
+		return -ENOMEM;
+	}
+
 	msg = kasprintf(GFP_KERNEL, "log %s", log);
 	if (!msg) {
 		DRM_ERROR("Cannot allocate memory for host log message.\n");
+		kfree(log);
 		return -ENOMEM;
 	}
 
@@ -508,6 +519,7 @@ int vmw_host_log(const char *log)
 
 	vmw_close_channel(&channel);
 	kfree(msg);
+	kfree(log);
 
 	return 0;
 
@@ -515,6 +527,7 @@ int vmw_host_log(const char *log)
 	vmw_close_channel(&channel);
 out_open:
 	kfree(msg);
+	kfree(log);
 	DRM_ERROR("Failed to send host log message.\n");
 
 	return -EINVAL;
@@ -537,7 +550,7 @@ int vmw_msg_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file_priv)
 {
 	struct drm_vmw_msg_arg *arg =
-		(struct drm_vmw_msg_arg *) data;
+			(struct drm_vmw_msg_arg *)data;
 	struct rpc_channel channel;
 	char *msg;
 	int length;
@@ -577,7 +590,7 @@ int vmw_msg_ioctl(struct drm_device *dev, void *data,
 		}
 		if (reply && reply_len > 0) {
 			if (copy_to_user((void __user *)((unsigned long)arg->receive),
-							 reply, reply_len)) {
+					 reply, reply_len)) {
 				DRM_ERROR("Failed to copy message to userspace.\n");
 				kfree(reply);
 				goto out_msg;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.h b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.h
deleted file mode 100644
index f685c7071dec..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.h
+++ /dev/null
@@ -1,214 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
-/**************************************************************************
- *
- * Copyright 2016 VMware, Inc., Palo Alto, CA., USA
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************
- *
- * Based on code from vmware.c and vmmouse.c.
- * Author:
- *   Sinclair Yeh <syeh@vmware.com>
- */
-#ifndef _VMWGFX_MSG_H
-#define _VMWGFX_MSG_H
-
-#include <asm/vmware.h>
-
-/**
- * Hypervisor-specific bi-directional communication channel.  Should never
- * execute on bare metal hardware.  The caller must make sure to check for
- * supported hypervisor before using these macros.
- *
- * The last two parameters are both input and output and must be initialized.
- *
- * @cmd: [IN] Message Cmd
- * @in_ebx: [IN] Message Len, through EBX
- * @in_si: [IN] Input argument through SI, set to 0 if not used
- * @in_di: [IN] Input argument through DI, set ot 0 if not used
- * @flags: [IN] hypercall flags + [channel id]
- * @magic: [IN] hypervisor magic value
- * @eax: [OUT] value of EAX register
- * @ebx: [OUT] e.g. status from an HB message status command
- * @ecx: [OUT] e.g. status from a non-HB message status command
- * @edx: [OUT] e.g. channel id
- * @si:  [OUT]
- * @di:  [OUT]
- */
-#define VMW_PORT(cmd, in_ebx, in_si, in_di,	\
-		 flags, magic,		\
-		 eax, ebx, ecx, edx, si, di)	\
-({						\
-	asm volatile (VMWARE_HYPERCALL :	\
-		"=a"(eax),			\
-		"=b"(ebx),			\
-		"=c"(ecx),			\
-		"=d"(edx),			\
-		"=S"(si),			\
-		"=D"(di) :			\
-		"a"(magic),			\
-		"b"(in_ebx),			\
-		"c"(cmd),			\
-		"d"(flags),			\
-		"S"(in_si),			\
-		"D"(in_di) :			\
-		"memory");			\
-})
-
-
-/**
- * Hypervisor-specific bi-directional communication channel.  Should never
- * execute on bare metal hardware.  The caller must make sure to check for
- * supported hypervisor before using these macros.
- *
- * The last 3 parameters are both input and output and must be initialized.
- *
- * @cmd: [IN] Message Cmd
- * @in_ecx: [IN] Message Len, through ECX
- * @in_si: [IN] Input argument through SI, set to 0 if not used
- * @in_di: [IN] Input argument through DI, set to 0 if not used
- * @flags: [IN] hypercall flags + [channel id]
- * @magic: [IN] hypervisor magic value
- * @bp:  [IN]
- * @eax: [OUT] value of EAX register
- * @ebx: [OUT] e.g. status from an HB message status command
- * @ecx: [OUT] e.g. status from a non-HB message status command
- * @edx: [OUT] e.g. channel id
- * @si:  [OUT]
- * @di:  [OUT]
- */
-#ifdef __x86_64__
-
-#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di,	\
-			flags, magic, bp,		\
-			eax, ebx, ecx, edx, si, di)	\
-({							\
-	asm volatile ("push %%rbp;"			\
-		"mov %12, %%rbp;"			\
-		VMWARE_HYPERCALL_HB_OUT			\
-		"pop %%rbp;" :				\
-		"=a"(eax),				\
-		"=b"(ebx),				\
-		"=c"(ecx),				\
-		"=d"(edx),				\
-		"=S"(si),				\
-		"=D"(di) :				\
-		"a"(magic),				\
-		"b"(cmd),				\
-		"c"(in_ecx),				\
-		"d"(flags),				\
-		"S"(in_si),				\
-		"D"(in_di),				\
-		"r"(bp) :				\
-		"memory", "cc");			\
-})
-
-
-#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di,	\
-		       flags, magic, bp,		\
-		       eax, ebx, ecx, edx, si, di)	\
-({							\
-	asm volatile ("push %%rbp;"			\
-		"mov %12, %%rbp;"			\
-		VMWARE_HYPERCALL_HB_IN			\
-		"pop %%rbp" :				\
-		"=a"(eax),				\
-		"=b"(ebx),				\
-		"=c"(ecx),				\
-		"=d"(edx),				\
-		"=S"(si),				\
-		"=D"(di) :				\
-		"a"(magic),				\
-		"b"(cmd),				\
-		"c"(in_ecx),				\
-		"d"(flags),				\
-		"S"(in_si),				\
-		"D"(in_di),				\
-		"r"(bp) :				\
-		"memory", "cc");			\
-})
-
-#else
-
-/*
- * In the 32-bit version of this macro, we store bp in a memory location
- * because we've ran out of registers.
- * Now we can't reference that memory location while we've modified
- * %esp or %ebp, so we first push it on the stack, just before we push
- * %ebp, and then when we need it we read it from the stack where we
- * just pushed it.
- */
-#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di,	\
-			flags, magic, bp,		\
-			eax, ebx, ecx, edx, si, di)	\
-({							\
-	asm volatile ("push %12;"			\
-		"push %%ebp;"				\
-		"mov 0x04(%%esp), %%ebp;"		\
-		VMWARE_HYPERCALL_HB_OUT			\
-		"pop %%ebp;"				\
-		"add $0x04, %%esp;" :			\
-		"=a"(eax),				\
-		"=b"(ebx),				\
-		"=c"(ecx),				\
-		"=d"(edx),				\
-		"=S"(si),				\
-		"=D"(di) :				\
-		"a"(magic),				\
-		"b"(cmd),				\
-		"c"(in_ecx),				\
-		"d"(flags),				\
-		"S"(in_si),				\
-		"D"(in_di),				\
-		"m"(bp) :				\
-		"memory", "cc");			\
-})
-
-
-#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di,	\
-		       flags, magic, bp,		\
-		       eax, ebx, ecx, edx, si, di)	\
-({							\
-	asm volatile ("push %12;"			\
-		"push %%ebp;"				\
-		"mov 0x04(%%esp), %%ebp;"		\
-		VMWARE_HYPERCALL_HB_IN			\
-		"pop %%ebp;"				\
-		"add $0x04, %%esp;" :			\
-		"=a"(eax),				\
-		"=b"(ebx),				\
-		"=c"(ecx),				\
-		"=d"(edx),				\
-		"=S"(si),				\
-		"=D"(di) :				\
-		"a"(magic),				\
-		"b"(cmd),				\
-		"c"(in_ecx),				\
-		"d"(flags),				\
-		"S"(in_si),				\
-		"D"(in_di),				\
-		"m"(bp) :				\
-		"memory", "cc");			\
-})
-#endif /* #if __x86_64__ */
-
-#endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
new file mode 100755
index 000000000000..4f40167ad61f
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright 2021 VMware, Inc., Palo Alto, CA., USA
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#ifndef _VMWGFX_MSG_ARM64_H
+#define _VMWGFX_MSG_ARM64_H
+
+#if defined(__aarch64__)
+
+#define VMWARE_HYPERVISOR_PORT    0x5658
+#define VMWARE_HYPERVISOR_PORT_HB 0x5659
+
+#define VMWARE_HYPERVISOR_HB  BIT(0)
+#define VMWARE_HYPERVISOR_OUT BIT(1)
+
+#define X86_IO_MAGIC 0x86
+
+#define X86_IO_W7_SIZE_SHIFT 0
+#define X86_IO_W7_SIZE_MASK (0x3 << X86_IO_W7_SIZE_SHIFT)
+#define X86_IO_W7_DIR       (1 << 2)
+#define X86_IO_W7_WITH	    (1 << 3)
+#define X86_IO_W7_STR	    (1 << 4)
+#define X86_IO_W7_DF	    (1 << 5)
+#define X86_IO_W7_IMM_SHIFT  5
+#define X86_IO_W7_IMM_MASK  (0xff << X86_IO_W7_IMM_SHIFT)
+
+static inline void vmw_port(unsigned long cmd, unsigned long in_ebx,
+			    unsigned long in_si, unsigned long in_di,
+			    unsigned long flags, unsigned long magic,
+			    unsigned long *eax, unsigned long *ebx,
+			    unsigned long *ecx, unsigned long *edx,
+			    unsigned long *si, unsigned long *di)
+{
+	register u64 x0 asm("x0") = magic;
+	register u64 x1 asm("x1") = in_ebx;
+	register u64 x2 asm("x2") = cmd;
+	register u64 x3 asm("x3") = flags | VMWARE_HYPERVISOR_PORT;
+	register u64 x4 asm("x4") = in_si;
+	register u64 x5 asm("x5") = in_di;
+
+	register u64 x7 asm("x7") = ((u64)X86_IO_MAGIC << 32) |
+				    X86_IO_W7_WITH |
+				    X86_IO_W7_DIR |
+				    (2 << X86_IO_W7_SIZE_SHIFT);
+
+	asm volatile("mrs xzr, mdccsr_el0 \n\t"
+		     : "+r"(x0), "+r"(x1), "+r"(x2),
+		       "+r"(x3), "+r"(x4), "+r"(x5)
+		     : "r"(x7)
+		     :);
+	*eax = x0;
+	*ebx = x1;
+	*ecx = x2;
+	*edx = x3;
+	*si = x4;
+	*di = x5;
+}
+
+static inline void vmw_port_hb(unsigned long cmd, unsigned long in_ecx,
+			       unsigned long in_si, unsigned long in_di,
+			       unsigned long flags, unsigned long magic,
+			       unsigned long bp, u32 w7dir,
+			       unsigned long *eax, unsigned long *ebx,
+			       unsigned long *ecx, unsigned long *edx,
+			       unsigned long *si, unsigned long *di)
+{
+	register u64 x0 asm("x0") = magic;
+	register u64 x1 asm("x1") = cmd;
+	register u64 x2 asm("x2") = in_ecx;
+	register u64 x3 asm("x3") = flags | VMWARE_HYPERVISOR_PORT_HB;
+	register u64 x4 asm("x4") = in_si;
+	register u64 x5 asm("x5") = in_di;
+	register u64 x6 asm("x6") = bp;
+	register u64 x7 asm("x7") = ((u64)X86_IO_MAGIC << 32) |
+				    X86_IO_W7_STR |
+				    X86_IO_W7_WITH |
+				    w7dir;
+
+	asm volatile("mrs xzr, mdccsr_el0 \n\t"
+		     : "+r"(x0), "+r"(x1), "+r"(x2),
+		       "+r"(x3), "+r"(x4), "+r"(x5)
+		     : "r"(x6), "r"(x7)
+		     :);
+	*eax = x0;
+	*ebx = x1;
+	*ecx = x2;
+	*edx = x3;
+	*si  = x4;
+	*di  = x5;
+}
+
+#define VMW_PORT(cmd, in_ebx, in_si, in_di, flags, magic, eax, ebx, ecx, edx,  \
+		 si, di)                                                       \
+	vmw_port(cmd, in_ebx, in_si, in_di, flags, magic, &eax, &ebx, &ecx,    \
+		 &edx, &si, &di)
+
+#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di, flags, magic, bp, eax, ebx, \
+		        ecx, edx, si, di)                                      \
+	vmw_port_hb(cmd, in_ecx, in_si, in_di, flags, magic, bp,               \
+                    0, &eax, &ebx, &ecx, &edx, &si, &di)
+
+#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di, flags, magic, bp, eax, ebx,  \
+		       ecx, edx, si, di)                                       \
+	vmw_port_hb(cmd, in_ecx, in_si, in_di, flags, magic, bp,               \
+		    X86_IO_W7_DIR, &eax, &ebx, &ecx, &edx, &si, &di)
+
+#endif
+
+#endif /* _VMWGFX_MSG_ARM64_H */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
new file mode 100644
index 000000000000..0b74ca2dfb7b
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
+/**************************************************************************
+ *
+ * Copyright 2016-2021 VMware, Inc., Palo Alto, CA., USA
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ **************************************************************************
+ *
+ * Based on code from vmware.c and vmmouse.c.
+ * Author:
+ *   Sinclair Yeh <syeh@vmware.com>
+ */
+#ifndef _VMWGFX_MSG_X86_H
+#define _VMWGFX_MSG_X86_H
+
+
+#if defined(__i386__) || defined(__x86_64__)
+
+#include <asm/vmware.h>
+
+/**
+ * Hypervisor-specific bi-directional communication channel.  Should never
+ * execute on bare metal hardware.  The caller must make sure to check for
+ * supported hypervisor before using these macros.
+ *
+ * The last two parameters are both input and output and must be initialized.
+ *
+ * @cmd: [IN] Message Cmd
+ * @in_ebx: [IN] Message Len, through EBX
+ * @in_si: [IN] Input argument through SI, set to 0 if not used
+ * @in_di: [IN] Input argument through DI, set ot 0 if not used
+ * @flags: [IN] hypercall flags + [channel id]
+ * @magic: [IN] hypervisor magic value
+ * @eax: [OUT] value of EAX register
+ * @ebx: [OUT] e.g. status from an HB message status command
+ * @ecx: [OUT] e.g. status from a non-HB message status command
+ * @edx: [OUT] e.g. channel id
+ * @si:  [OUT]
+ * @di:  [OUT]
+ */
+#define VMW_PORT(cmd, in_ebx, in_si, in_di,	\
+                 flags, magic,		\
+                 eax, ebx, ecx, edx, si, di)	\
+({						\
+        asm volatile (VMWARE_HYPERCALL :	\
+                "=a"(eax),			\
+                "=b"(ebx),			\
+                "=c"(ecx),			\
+                "=d"(edx),			\
+                "=S"(si),			\
+                "=D"(di) :			\
+                "a"(magic),			\
+                "b"(in_ebx),			\
+                "c"(cmd),			\
+                "d"(flags),			\
+                "S"(in_si),			\
+                "D"(in_di) :			\
+                "memory");			\
+})
+
+
+/**
+ * Hypervisor-specific bi-directional communication channel.  Should never
+ * execute on bare metal hardware.  The caller must make sure to check for
+ * supported hypervisor before using these macros.
+ *
+ * The last 3 parameters are both input and output and must be initialized.
+ *
+ * @cmd: [IN] Message Cmd
+ * @in_ecx: [IN] Message Len, through ECX
+ * @in_si: [IN] Input argument through SI, set to 0 if not used
+ * @in_di: [IN] Input argument through DI, set to 0 if not used
+ * @flags: [IN] hypercall flags + [channel id]
+ * @magic: [IN] hypervisor magic value
+ * @bp:  [IN]
+ * @eax: [OUT] value of EAX register
+ * @ebx: [OUT] e.g. status from an HB message status command
+ * @ecx: [OUT] e.g. status from a non-HB message status command
+ * @edx: [OUT] e.g. channel id
+ * @si:  [OUT]
+ * @di:  [OUT]
+ */
+#ifdef __x86_64__
+
+#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di,	\
+                        flags, magic, bp,		\
+                        eax, ebx, ecx, edx, si, di)	\
+({							\
+        asm volatile ("push %%rbp;"			\
+                "mov %12, %%rbp;"			\
+                VMWARE_HYPERCALL_HB_OUT			\
+                "pop %%rbp;" :				\
+                "=a"(eax),				\
+                "=b"(ebx),				\
+                "=c"(ecx),				\
+                "=d"(edx),				\
+                "=S"(si),				\
+                "=D"(di) :				\
+                "a"(magic),				\
+                "b"(cmd),				\
+                "c"(in_ecx),				\
+                "d"(flags),				\
+                "S"(in_si),				\
+                "D"(in_di),				\
+                "r"(bp) :				\
+                "memory", "cc");			\
+})
+
+
+#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di,	\
+                       flags, magic, bp,		\
+                       eax, ebx, ecx, edx, si, di)	\
+({							\
+        asm volatile ("push %%rbp;"			\
+                "mov %12, %%rbp;"			\
+                VMWARE_HYPERCALL_HB_IN			\
+                "pop %%rbp" :				\
+                "=a"(eax),				\
+                "=b"(ebx),				\
+                "=c"(ecx),				\
+                "=d"(edx),				\
+                "=S"(si),				\
+                "=D"(di) :				\
+                "a"(magic),				\
+                "b"(cmd),				\
+                "c"(in_ecx),				\
+                "d"(flags),				\
+                "S"(in_si),				\
+                "D"(in_di),				\
+                "r"(bp) :				\
+                "memory", "cc");			\
+})
+
+#elif defined(__i386__)
+
+/*
+ * In the 32-bit version of this macro, we store bp in a memory location
+ * because we've ran out of registers.
+ * Now we can't reference that memory location while we've modified
+ * %esp or %ebp, so we first push it on the stack, just before we push
+ * %ebp, and then when we need it we read it from the stack where we
+ * just pushed it.
+ */
+#define VMW_PORT_HB_OUT(cmd, in_ecx, in_si, in_di,	\
+                        flags, magic, bp,		\
+                        eax, ebx, ecx, edx, si, di)	\
+({							\
+        asm volatile ("push %12;"			\
+                "push %%ebp;"				\
+                "mov 0x04(%%esp), %%ebp;"		\
+                VMWARE_HYPERCALL_HB_OUT			\
+                "pop %%ebp;"				\
+                "add $0x04, %%esp;" :			\
+                "=a"(eax),				\
+                "=b"(ebx),				\
+                "=c"(ecx),				\
+                "=d"(edx),				\
+                "=S"(si),				\
+                "=D"(di) :				\
+                "a"(magic),				\
+                "b"(cmd),				\
+                "c"(in_ecx),				\
+                "d"(flags),				\
+                "S"(in_si),				\
+                "D"(in_di),				\
+                "m"(bp) :				\
+                "memory", "cc");			\
+})
+
+
+#define VMW_PORT_HB_IN(cmd, in_ecx, in_si, in_di,	\
+                       flags, magic, bp,		\
+                       eax, ebx, ecx, edx, si, di)	\
+({							\
+        asm volatile ("push %12;"			\
+                "push %%ebp;"				\
+                "mov 0x04(%%esp), %%ebp;"		\
+                VMWARE_HYPERCALL_HB_IN			\
+                "pop %%ebp;"				\
+                "add $0x04, %%esp;" :			\
+                "=a"(eax),				\
+                "=b"(ebx),				\
+                "=c"(ecx),				\
+                "=d"(edx),				\
+                "=S"(si),				\
+                "=D"(di) :				\
+                "a"(magic),				\
+                "b"(cmd),				\
+                "c"(in_ecx),				\
+                "d"(flags),				\
+                "S"(in_si),				\
+                "D"(in_di),				\
+                "m"(bp) :				\
+                "memory", "cc");			\
+})
+#endif /* defined(__i386__) */
+
+#endif /* defined(__i386__) || defined(__x86_64__) */
+
+#endif /* _VMWGFX_MSG_X86_H */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
