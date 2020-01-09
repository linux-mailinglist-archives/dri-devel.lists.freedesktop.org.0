Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5C135F0A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542EF6E92A;
	Thu,  9 Jan 2020 17:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A2B6E926;
 Thu,  9 Jan 2020 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JDS9CN2d+DgzafdnZvBFYhV1TXQVqhQXcOfgo6X2fcA=; b=UonjSO/kaWHci2FJB4EFub647c
 e2jl2oIqU1x90EjpT1tmgU6LTKpZRC5PlF5kR0PXoffVTR0KMojHQgsAt1l+RrB+VLJJdCxdijQ2C
 VX7dnVrT6QyL2RCagbQZKzk0t0NTGFtQAVeZofpX4HT1elQSx4Z5i5XPFYvrJhULqtSvvENWzMaxl
 jEClSMuPHtAAT/CtD0XJV9h38Wv1EaH665YF5aND9OQnJiLjgdtN19HLU2YKN9HtHBSXkWEx2obwx
 4/gSWfc1YmfR85+DMi1ET1gYRjcIQzEtDZysRPak9yVS/mYL6BxXHIljeSx1P7LWJDFajjfLyV3Ee
 rSTQMqyA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNv-0002Va-Q4; Thu, 09 Jan 2020 18:14:15 +0100
Received: from [24.134.37.229] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy02.your-server.de with esmtpsa (TLSv1:ECDHE-RSA-AES256-SHA:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNv-000ER9-H6; Thu, 09 Jan 2020 18:14:15 +0100
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [RFC PATCH 3/4] drm/i915/gvt: define a public interface to gvt
Date: Thu,  9 Jan 2020 19:13:56 +0200
Message-Id: <20200109171357.115936-4-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25689/Thu Jan  9 10:59:33 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So far, the KVMGT code just included the whole i915 driver and GVT
internals to do its job. Change this to have a single public header
that defines the interface via accessor functions.

Some ugly things:

a) The handle member of intel_vgpu should be in kvmgt_vdev and the
generic code should just pass the vgpu pointer around.

b) The "public" API is rather ugly, because I tried to limit the
changes I do to KVMGT and have a mechanical 1:1 conversion. Future
patches will need to simplify this to something sane.

v2:
- Remove edid and display constants from public API

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>

Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
---
 drivers/gpu/drm/i915/gvt/Makefile     |   2 +-
 drivers/gpu/drm/i915/gvt/debug.h      |   2 +-
 drivers/gpu/drm/i915/gvt/display.c    |  26 +++++
 drivers/gpu/drm/i915/gvt/display.h    |  27 -----
 drivers/gpu/drm/i915/gvt/gtt.h        |   2 -
 drivers/gpu/drm/i915/gvt/gvt.h        |  40 +------
 drivers/gpu/drm/i915/gvt/gvt_public.c | 154 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gvt_public.h | 104 +++++++++++++++++
 drivers/gpu/drm/i915/gvt/hypercall.h  |   3 +
 drivers/gpu/drm/i915/gvt/kvmgt.c      | 130 +++++++++++-----------
 drivers/gpu/drm/i915/gvt/mpt.h        |   3 -
 drivers/gpu/drm/i915/gvt/reg.h        |   2 -
 12 files changed, 354 insertions(+), 141 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gvt/gvt_public.c
 create mode 100644 drivers/gpu/drm/i915/gvt/gvt_public.h

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..183827c4f917 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -3,7 +3,7 @@ GVT_DIR := gvt
 GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
 	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
-	fb_decoder.o dmabuf.o page_track.o
+	fb_decoder.o dmabuf.o page_track.o gvt_public.o
 
 ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
diff --git a/drivers/gpu/drm/i915/gvt/debug.h b/drivers/gpu/drm/i915/gvt/debug.h
index c6027125c1ec..8270f34cfa43 100644
--- a/drivers/gpu/drm/i915/gvt/debug.h
+++ b/drivers/gpu/drm/i915/gvt/debug.h
@@ -32,7 +32,7 @@ do {									\
 	if (IS_ERR_OR_NULL(vgpu))					\
 		pr_err("gvt: "fmt, ##args);			\
 	else								\
-		pr_err("gvt: vgpu %d: "fmt, vgpu->id, ##args);\
+		pr_err("gvt: vgpu %d: "fmt, intel_vgpu_id(vgpu), ##args);	\
 } while (0)
 
 #define gvt_dbg_core(fmt, args...) \
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index e1c313da6c00..08636fa15c46 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -529,3 +529,29 @@ void intel_vgpu_reset_display(struct intel_vgpu *vgpu)
 {
 	emulate_monitor_status_change(vgpu);
 }
+
+unsigned int vgpu_edid_xres(struct intel_vgpu_port *port)
+{
+	switch (port->id) {
+	case GVT_EDID_1024_768:
+		return 1024;
+	case GVT_EDID_1920_1200:
+		return 1920;
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL_GPL(vgpu_edid_xres);
+
+unsigned int vgpu_edid_yres(struct intel_vgpu_port *port)
+{
+	switch (port->id) {
+	case GVT_EDID_1024_768:
+		return 768;
+	case GVT_EDID_1920_1200:
+		return 1200;
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL_GPL(vgpu_edid_yres);
diff --git a/drivers/gpu/drm/i915/gvt/display.h b/drivers/gpu/drm/i915/gvt/display.h
index b59b34046e1e..6cdfc28b1070 100644
--- a/drivers/gpu/drm/i915/gvt/display.h
+++ b/drivers/gpu/drm/i915/gvt/display.h
@@ -43,9 +43,6 @@ struct intel_vgpu;
 #define SBI_REG_MAX	20
 #define DPCD_SIZE	0x700
 
-#define intel_vgpu_port(vgpu, port) \
-	(&(vgpu->display.ports[port]))
-
 #define intel_vgpu_has_monitor_on_port(vgpu, port) \
 	(intel_vgpu_port(vgpu, port)->edid && \
 		intel_vgpu_port(vgpu, port)->edid->data_valid)
@@ -178,30 +175,6 @@ static inline char *vgpu_edid_str(enum intel_vgpu_edid id)
 	}
 }
 
-static inline unsigned int vgpu_edid_xres(enum intel_vgpu_edid id)
-{
-	switch (id) {
-	case GVT_EDID_1024_768:
-		return 1024;
-	case GVT_EDID_1920_1200:
-		return 1920;
-	default:
-		return 0;
-	}
-}
-
-static inline unsigned int vgpu_edid_yres(enum intel_vgpu_edid id)
-{
-	switch (id) {
-	case GVT_EDID_1024_768:
-		return 768;
-	case GVT_EDID_1920_1200:
-		return 1200;
-	default:
-		return 0;
-	}
-}
-
 void intel_gvt_emulate_vblank(struct intel_gvt *gvt);
 void intel_gvt_check_vblank_emulation(struct intel_gvt *gvt);
 
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index 88789316807d..2618affcd5d9 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -38,8 +38,6 @@
 
 struct intel_vgpu_mm;
 
-#define INTEL_GVT_INVALID_ADDR (~0UL)
-
 struct intel_gvt_gtt_entry {
 	u64 val64;
 	int type;
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 8cf292a8d6bd..f9693c44e342 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -33,6 +33,7 @@
 #ifndef _GVT_H_
 #define _GVT_H_
 
+#include "gvt_public.h"
 #include "debug.h"
 #include "hypercall.h"
 #include "mmio.h"
@@ -206,11 +207,6 @@ struct intel_vgpu {
 	u32 scan_nonprivbb;
 };
 
-static inline void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
-{
-	return vgpu->vdev;
-}
-
 /* validating GM healthy status*/
 #define vgpu_is_vm_unhealthy(ret_val) \
 	(((ret_val) == -EBADRQC) || ((ret_val) == -EFAULT))
@@ -515,13 +511,6 @@ int intel_vgpu_emulate_cfg_write(struct intel_vgpu *vgpu, unsigned int offset,
 
 void intel_vgpu_emulate_hotplug(struct intel_vgpu *vgpu, bool connected);
 
-static inline u64 intel_vgpu_get_bar_gpa(struct intel_vgpu *vgpu, int bar)
-{
-	/* We are 64bit bar. */
-	return (*(u64 *)(vgpu->cfg_space.virtual_cfg_space + bar)) &
-			PCI_BASE_ADDRESS_MEM_MASK;
-}
-
 void intel_vgpu_clean_opregion(struct intel_vgpu *vgpu);
 int intel_vgpu_init_opregion(struct intel_vgpu *vgpu);
 int intel_vgpu_opregion_base_write_handler(struct intel_vgpu *vgpu, u32 gpa);
@@ -532,33 +521,6 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu);
 int intel_gvt_scan_and_shadow_workload(struct intel_vgpu_workload *workload);
 void enter_failsafe_mode(struct intel_vgpu *vgpu, int reason);
 
-struct intel_gvt_ops {
-	int (*emulate_cfg_read)(struct intel_vgpu *, unsigned int, void *,
-				unsigned int);
-	int (*emulate_cfg_write)(struct intel_vgpu *, unsigned int, void *,
-				unsigned int);
-	int (*emulate_mmio_read)(struct intel_vgpu *, u64, void *,
-				unsigned int);
-	int (*emulate_mmio_write)(struct intel_vgpu *, u64, void *,
-				unsigned int);
-	struct intel_vgpu *(*vgpu_create)(struct intel_gvt *,
-				struct intel_vgpu_type *);
-	void (*vgpu_destroy)(struct intel_vgpu *vgpu);
-	void (*vgpu_release)(struct intel_vgpu *vgpu);
-	void (*vgpu_reset)(struct intel_vgpu *);
-	void (*vgpu_activate)(struct intel_vgpu *);
-	void (*vgpu_deactivate)(struct intel_vgpu *);
-	struct intel_vgpu_type *(*gvt_find_vgpu_type)(struct intel_gvt *gvt,
-			const char *name);
-	bool (*get_gvt_attrs)(struct attribute_group ***intel_vgpu_type_groups);
-	int (*vgpu_query_plane)(struct intel_vgpu *vgpu, void *);
-	int (*vgpu_get_dmabuf)(struct intel_vgpu *vgpu, unsigned int);
-	int (*write_protect_handler)(struct intel_vgpu *, u64, void *,
-				     unsigned int);
-	void (*emulate_hotplug)(struct intel_vgpu *vgpu, bool connected);
-};
-
-
 enum {
 	GVT_FAILSAFE_UNSUPPORTED_GUEST,
 	GVT_FAILSAFE_INSUFFICIENT_RESOURCE,
diff --git a/drivers/gpu/drm/i915/gvt/gvt_public.c b/drivers/gpu/drm/i915/gvt/gvt_public.c
new file mode 100644
index 000000000000..b3f814ec125a
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/gvt_public.c
@@ -0,0 +1,154 @@
+#include "i915_drv.h"
+#include "gvt.h"
+
+struct intel_gvt *intel_gvt_from_kdev(struct device *kobj)
+{
+	return kdev_to_i915(kobj)->gvt;
+}
+EXPORT_SYMBOL_GPL(intel_gvt_from_kdev);
+
+void *intel_vgpu_vdev(struct intel_vgpu *vgpu)
+{
+	return vgpu->vdev;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_vdev);
+
+void intel_vgpu_set_vdev(struct intel_vgpu *vgpu, void *vdev)
+{
+	vgpu->vdev = vdev;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_set_vdev);
+
+int intel_vgpu_id(struct intel_vgpu *vgpu)
+{
+	return vgpu->id;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_id);
+
+bool intel_vgpu_active_find(struct intel_vgpu *vgpu, bool (*pred)(struct intel_vgpu *, void *), void *ctx)
+{
+	struct intel_vgpu *itr;
+	int id;
+	bool ret = false;
+
+	mutex_lock(&vgpu->gvt->lock);
+	for_each_active_vgpu(vgpu->gvt, itr, id) {
+		if (pred(itr, ctx)) {
+			ret = true;
+			goto out;
+		}
+	}
+ out:
+	mutex_unlock(&vgpu->gvt->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_active_find);
+
+struct device *intel_vgpu_pdev(struct intel_vgpu *vgpu)
+{
+	return &vgpu->gvt->dev_priv->drm.pdev->dev;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_pdev);
+
+void *intel_vgpu_opregion_va(struct intel_vgpu *vgpu)
+{
+	return vgpu_opregion(vgpu)->va;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_opregion_va);
+
+struct intel_vgpu_port *intel_vgpu_port(struct intel_vgpu *vgpu, size_t port)
+{
+	return &(vgpu->display.ports[port]);
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_port);
+
+void *intel_vgpu_edid_block(struct intel_vgpu_port *port, size_t *edid_size)
+{
+	*edid_size = EDID_SIZE;
+
+	return port->edid->edid_block;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_edid_block);
+
+void intel_vgpu_set_handle(struct intel_vgpu *vgpu, unsigned long handle)
+{
+	vgpu->handle = handle;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_set_handle);
+
+unsigned long intel_vgpu_handle(struct intel_vgpu *vgpu)
+{
+	return vgpu->handle;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_handle);
+
+u32 *intel_vgpu_bar_ptr(struct intel_vgpu *vgpu, int bar)
+{
+	return (u32 *)(vgpu->cfg_space.virtual_cfg_space + bar);
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_bar_ptr);
+
+u64 intel_vgpu_get_bar_gpa(struct intel_vgpu *vgpu, int bar)
+{
+	/* We are 64bit bar. */
+	return (*(u64 *)(vgpu->cfg_space.virtual_cfg_space + bar)) &
+			PCI_BASE_ADDRESS_MEM_MASK;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_get_bar_gpa);
+
+u64 intel_vgpu_get_bar_size(struct intel_vgpu *vgpu, int bar)
+{
+	return vgpu->cfg_space.bar[bar].size;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_get_bar_size);
+
+u64 intel_gvt_cfg_space_size(struct intel_vgpu *vgpu)
+{
+	return vgpu->gvt->device_info.cfg_space_size;
+}
+EXPORT_SYMBOL_GPL(intel_gvt_cfg_space_size);
+
+u64 intel_gvt_aperture_pa_base(struct intel_vgpu *vgpu)
+{
+	return gvt_aperture_pa_base(vgpu->gvt);
+}
+EXPORT_SYMBOL_GPL(intel_gvt_aperture_pa_base);
+
+u64 intel_vgpu_aperture_offset(struct intel_vgpu *vgpu)
+{
+	return vgpu_aperture_offset(vgpu);
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_aperture_offset);
+
+u64 intel_vgpu_aperture_size(struct intel_vgpu *vgpu)
+{
+	return vgpu_aperture_sz(vgpu);
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_aperture_size);
+
+u64 intel_gvt_aperture_size(struct intel_vgpu *vgpu)
+{
+	return gvt_aperture_sz(vgpu->gvt);
+}
+EXPORT_SYMBOL_GPL(intel_gvt_aperture_size);
+
+struct io_mapping *intel_gvt_gtt_iomap(struct intel_vgpu *vgpu)
+{
+	return &vgpu->gvt->dev_priv->ggtt.iomap;
+}
+EXPORT_SYMBOL_GPL(intel_gvt_gtt_iomap);
+
+bool intel_gvt_in_gtt(struct intel_vgpu *vgpu, u64 offset)
+{
+	struct intel_gvt *gvt = vgpu->gvt;
+
+	return (offset >= gvt->device_info.gtt_start_offset &&
+		offset < gvt->device_info.gtt_start_offset + gvt_ggtt_sz(gvt));
+}
+EXPORT_SYMBOL_GPL(intel_gvt_in_gtt);
+
+struct dentry *intel_vgpu_debugfs(struct intel_vgpu *vgpu)
+{
+	return vgpu->debugfs;
+}
+EXPORT_SYMBOL_GPL(intel_vgpu_debugfs);
diff --git a/drivers/gpu/drm/i915/gvt/gvt_public.h b/drivers/gpu/drm/i915/gvt/gvt_public.h
new file mode 100644
index 000000000000..23bf1235e1a1
--- /dev/null
+++ b/drivers/gpu/drm/i915/gvt/gvt_public.h
@@ -0,0 +1,104 @@
+/*
+ * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ */
+
+#ifndef _GVT_PUBLIC_H_
+#define _GVT_PUBLIC_H_
+
+#include "hypercall.h"
+
+struct attribute;
+struct attribute_group;
+
+struct intel_vgpu;
+struct intel_gvt;
+struct intel_vgpu_type;
+struct intel_vgpu_port;
+
+/* reg.h */
+#define INTEL_GVT_OPREGION_PAGES	2
+#define INTEL_GVT_OPREGION_SIZE		(INTEL_GVT_OPREGION_PAGES * PAGE_SIZE)
+
+/* gtt.h */
+#define INTEL_GVT_INVALID_ADDR (~0UL)
+
+struct intel_gvt_ops {
+	int (*emulate_cfg_read)(struct intel_vgpu *, unsigned int, void *,
+				unsigned int);
+	int (*emulate_cfg_write)(struct intel_vgpu *, unsigned int, void *,
+				unsigned int);
+	int (*emulate_mmio_read)(struct intel_vgpu *, u64, void *,
+				unsigned int);
+	int (*emulate_mmio_write)(struct intel_vgpu *, u64, void *,
+				unsigned int);
+	struct intel_vgpu *(*vgpu_create)(struct intel_gvt *,
+				struct intel_vgpu_type *);
+	void (*vgpu_destroy)(struct intel_vgpu *vgpu);
+	void (*vgpu_release)(struct intel_vgpu *vgpu);
+	void (*vgpu_reset)(struct intel_vgpu *);
+	void (*vgpu_activate)(struct intel_vgpu *);
+	void (*vgpu_deactivate)(struct intel_vgpu *);
+	struct intel_vgpu_type *(*gvt_find_vgpu_type)(struct intel_gvt *gvt,
+			const char *name);
+	bool (*get_gvt_attrs)(struct attribute_group ***intel_vgpu_type_groups);
+	int (*vgpu_query_plane)(struct intel_vgpu *vgpu, void *);
+	int (*vgpu_get_dmabuf)(struct intel_vgpu *vgpu, unsigned int);
+	int (*write_protect_handler)(struct intel_vgpu *, u64, void *,
+				     unsigned int);
+	void (*emulate_hotplug)(struct intel_vgpu *vgpu, bool connected);
+};
+
+bool intel_vgpu_active_find(struct intel_vgpu *vgpu, bool (*pred)(struct intel_vgpu *, void *), void *ctx);
+
+struct intel_gvt *intel_gvt_from_kdev(struct device *kobj);
+void *intel_vgpu_vdev(struct intel_vgpu *vgpu);
+void intel_vgpu_set_vdev(struct intel_vgpu *vgpu, void *vdev);
+int intel_vgpu_id(struct intel_vgpu *vgpu);
+
+struct device *intel_vgpu_pdev(struct intel_vgpu *vgpu);
+void *intel_vgpu_opregion_va(struct intel_vgpu *vgpu);
+struct intel_vgpu_port *intel_vgpu_port(struct intel_vgpu *vgpu, size_t port);
+
+unsigned int vgpu_edid_xres(struct intel_vgpu_port *port);
+unsigned int vgpu_edid_yres(struct intel_vgpu_port *port);
+void *intel_vgpu_edid_block(struct intel_vgpu_port *port, size_t *edid_size);
+
+void intel_vgpu_set_handle(struct intel_vgpu *vgpu, unsigned long handle);
+unsigned long intel_vgpu_handle(struct intel_vgpu *vgpu);
+
+u32 *intel_vgpu_bar_ptr(struct intel_vgpu *vgpu, int bar);
+u64 intel_vgpu_get_bar_gpa(struct intel_vgpu *vgpu, int bar);
+u64 intel_vgpu_get_bar_size(struct intel_vgpu *vgpu, int bar);
+
+u64 intel_gvt_cfg_space_size(struct intel_vgpu *vgpu);
+
+u64 intel_gvt_aperture_pa_base(struct intel_vgpu *vgpu);
+u64 intel_vgpu_aperture_offset(struct intel_vgpu *vgpu);
+u64 intel_vgpu_aperture_size(struct intel_vgpu *vgpu);
+u64 intel_gvt_aperture_size(struct intel_vgpu *vgpu);
+
+struct io_mapping *intel_gvt_gtt_iomap(struct intel_vgpu *vgpu);
+bool intel_gvt_in_gtt(struct intel_vgpu *vgpu, u64 off);
+
+struct dentry *intel_vgpu_debugfs(struct intel_vgpu *vgpu);
+
+#endif /* _GVT_PUBLIC_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/gvt/hypercall.h
index b17c4a1599cd..7ed33e4919a3 100644
--- a/drivers/gpu/drm/i915/gvt/hypercall.h
+++ b/drivers/gpu/drm/i915/gvt/hypercall.h
@@ -81,4 +81,7 @@ struct intel_gvt_mpt {
 
 extern struct intel_gvt_mpt xengt_mpt;
 
+int intel_gvt_register_hypervisor(struct intel_gvt_mpt *);
+void intel_gvt_unregister_hypervisor(void);
+
 #endif /* _GVT_HYPERCALL_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 9a435bc1a2f0..f5157211d45f 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -28,10 +28,15 @@
  *    Xiaoguang Chen <xiaoguang.chen@intel.com>
  */
 
+#include <drm/drm_edid.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/hashtable.h>
+#include <linux/io-mapping.h>
 #include <linux/mm.h>
 #include <linux/mmu_context.h>
+#include <linux/pci.h>
 #include <linux/sched/mm.h>
 #include <linux/types.h>
 #include <linux/list.h>
@@ -46,8 +51,8 @@
 
 #include <linux/nospec.h>
 
-#include "i915_drv.h"
-#include "gvt.h"
+#include "debug.h"
+#include "gvt_public.h"
 
 static const struct intel_gvt_ops *intel_gvt_ops;
 
@@ -217,7 +222,7 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		dma_addr_t *dma_addr, unsigned long size)
 {
-	struct device *dev = &vgpu->gvt->dev_priv->drm.pdev->dev;
+	struct device *dev = intel_vgpu_pdev(vgpu);
 	struct page *page = NULL;
 	int ret;
 
@@ -240,7 +245,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		dma_addr_t dma_addr, unsigned long size)
 {
-	struct device *dev = &vgpu->gvt->dev_priv->drm.pdev->dev;
+	struct device *dev = intel_vgpu_pdev(vgpu);
 
 	dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
 	gvt_unpin_guest_page(vgpu, gfn, size);
@@ -627,7 +632,7 @@ static int kvmgt_set_opregion(void *p_vgpu)
 	 * one later. This one is used to expose opregion to VFIO. And the
 	 * other one created by VFIO later, is used by guest actually.
 	 */
-	base = vgpu_opregion(vgpu)->va;
+	base = intel_vgpu_opregion_va(vgpu);
 	if (!base)
 		return -ENOMEM;
 
@@ -639,7 +644,7 @@ static int kvmgt_set_opregion(void *p_vgpu)
 	ret = intel_vgpu_register_reg(vgpu,
 			PCI_VENDOR_ID_INTEL | VFIO_REGION_TYPE_PCI_VENDOR_TYPE,
 			VFIO_REGION_SUBTYPE_INTEL_IGD_OPREGION,
-			&intel_vgpu_regops_opregion, OPREGION_SIZE,
+			&intel_vgpu_regops_opregion, INTEL_GVT_OPREGION_SIZE,
 			VFIO_REGION_INFO_FLAG_READ, base);
 
 	return ret;
@@ -650,24 +655,26 @@ static int kvmgt_set_edid(void *p_vgpu, int port_num)
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
 	struct intel_vgpu_port *port = intel_vgpu_port(vgpu, port_num);
 	struct vfio_edid_region *base;
+	size_t edid_size;
 	int ret;
 
 	base = kzalloc(sizeof(*base), GFP_KERNEL);
 	if (!base)
 		return -ENOMEM;
 
+	base->edid_blob = intel_vgpu_edid_block(port, &edid_size);
+
 	/* TODO: Add multi-port and EDID extension block support */
 	base->vfio_edid_regs.edid_offset = EDID_BLOB_OFFSET;
-	base->vfio_edid_regs.edid_max_size = EDID_SIZE;
-	base->vfio_edid_regs.edid_size = EDID_SIZE;
-	base->vfio_edid_regs.max_xres = vgpu_edid_xres(port->id);
-	base->vfio_edid_regs.max_yres = vgpu_edid_yres(port->id);
-	base->edid_blob = port->edid->edid_block;
+	base->vfio_edid_regs.edid_max_size = edid_size;
+	base->vfio_edid_regs.edid_size = edid_size;
+	base->vfio_edid_regs.max_xres = vgpu_edid_xres(port);
+	base->vfio_edid_regs.max_yres = vgpu_edid_yres(port);
 
 	ret = intel_vgpu_register_reg(vgpu,
 			VFIO_REGION_TYPE_GFX,
 			VFIO_REGION_SUBTYPE_GFX_EDID,
-			&intel_vgpu_regops_edid, EDID_SIZE,
+			&intel_vgpu_regops_edid, edid_size,
 			VFIO_REGION_INFO_FLAG_READ |
 			VFIO_REGION_INFO_FLAG_WRITE |
 			VFIO_REGION_INFO_FLAG_CAPS, base);
@@ -690,11 +697,11 @@ static int intel_vgpu_create(struct kobject *kobj, struct mdev_device *mdev)
 	struct intel_vgpu *vgpu = NULL;
 	struct intel_vgpu_type *type;
 	struct device *pdev;
-	void *gvt;
+	struct intel_gvt *gvt;
 	int ret;
 
 	pdev = mdev_parent_dev(mdev);
-	gvt = kdev_to_i915(pdev)->gvt;
+	gvt = intel_gvt_from_kdev(pdev);
 
 	type = intel_gvt_ops->gvt_find_vgpu_type(gvt, kobject_name(kobj));
 	if (!type) {
@@ -728,7 +735,7 @@ static int intel_vgpu_remove(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 
-	if (handle_valid(vgpu->handle))
+	if (handle_valid(intel_vgpu_handle(vgpu)))
 		return -EBUSY;
 
 	intel_gvt_ops->vgpu_destroy(vgpu);
@@ -857,7 +864,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	struct kvmgt_guest_info *info;
 	int ret;
 
-	if (!handle_valid(vgpu->handle))
+	if (!handle_valid(intel_vgpu_handle(vgpu)))
 		return;
 
 	if (atomic_cmpxchg(&vdev->released, 0, 1))
@@ -876,13 +883,13 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	/* dereference module reference taken at open */
 	module_put(THIS_MODULE);
 
-	info = (struct kvmgt_guest_info *)vgpu->handle;
+	info = (struct kvmgt_guest_info *)intel_vgpu_handle(vgpu);
 	kvmgt_guest_exit(info);
 
 	intel_vgpu_release_msi_eventfd_ctx(vgpu);
 
 	vdev->kvm = NULL;
-	vgpu->handle = 0;
+	intel_vgpu_set_handle(vgpu, 0);
 }
 
 static void intel_vgpu_release(struct mdev_device *mdev)
@@ -902,18 +909,16 @@ static void intel_vgpu_release_work(struct work_struct *work)
 
 static u64 intel_vgpu_get_bar_addr(struct intel_vgpu *vgpu, int bar)
 {
+	u32 *barp = intel_vgpu_bar_ptr(vgpu, bar);
 	u32 start_lo, start_hi;
 	u32 mem_type;
 
-	start_lo = (*(u32 *)(vgpu->cfg_space.virtual_cfg_space + bar)) &
-			PCI_BASE_ADDRESS_MEM_MASK;
-	mem_type = (*(u32 *)(vgpu->cfg_space.virtual_cfg_space + bar)) &
-			PCI_BASE_ADDRESS_MEM_TYPE_MASK;
+	start_lo = barp[0] & PCI_BASE_ADDRESS_MEM_MASK;
+	mem_type = barp[0] & PCI_BASE_ADDRESS_MEM_TYPE_MASK;
 
 	switch (mem_type) {
 	case PCI_BASE_ADDRESS_MEM_TYPE_64:
-		start_hi = (*(u32 *)(vgpu->cfg_space.virtual_cfg_space
-						+ bar + 4));
+		start_hi = barp[1];
 		break;
 	case PCI_BASE_ADDRESS_MEM_TYPE_32:
 	case PCI_BASE_ADDRESS_MEM_TYPE_1M:
@@ -944,8 +949,8 @@ static int intel_vgpu_bar_rw(struct intel_vgpu *vgpu, int bar, u64 off,
 
 static inline bool intel_vgpu_in_aperture(struct intel_vgpu *vgpu, u64 off)
 {
-	return off >= vgpu_aperture_offset(vgpu) &&
-	       off < vgpu_aperture_offset(vgpu) + vgpu_aperture_sz(vgpu);
+	return off >= intel_vgpu_aperture_offset(vgpu) &&
+	       off < intel_vgpu_aperture_offset(vgpu) + intel_vgpu_aperture_size(vgpu);
 }
 
 static int intel_vgpu_aperture_rw(struct intel_vgpu *vgpu, u64 off,
@@ -959,7 +964,7 @@ static int intel_vgpu_aperture_rw(struct intel_vgpu *vgpu, u64 off,
 		return -EINVAL;
 	}
 
-	aperture_va = io_mapping_map_wc(&vgpu->gvt->dev_priv->ggtt.iomap,
+	aperture_va = io_mapping_map_wc(intel_gvt_gtt_iomap(vgpu),
 					ALIGN_DOWN(off, PAGE_SIZE),
 					count + offset_in_page(off));
 	if (!aperture_va)
@@ -1029,8 +1034,7 @@ static bool gtt_entry(struct mdev_device *mdev, loff_t *ppos)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 	unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
-	struct intel_gvt *gvt = vgpu->gvt;
-	int offset;
+	u64 offset;
 
 	/* Only allow MMIO GGTT entry access */
 	if (index != PCI_BASE_ADDRESS_0)
@@ -1039,9 +1043,7 @@ static bool gtt_entry(struct mdev_device *mdev, loff_t *ppos)
 	offset = (u64)(*ppos & VFIO_PCI_OFFSET_MASK) -
 		intel_vgpu_get_bar_gpa(vgpu, PCI_BASE_ADDRESS_0);
 
-	return (offset >= gvt->device_info.gtt_start_offset &&
-		offset < gvt->device_info.gtt_start_offset + gvt_ggtt_sz(gvt)) ?
-			true : false;
+	return intel_gvt_in_gtt(vgpu, offset);
 }
 
 static ssize_t intel_vgpu_read(struct mdev_device *mdev, char __user *buf,
@@ -1219,10 +1221,10 @@ static int intel_vgpu_mmap(struct mdev_device *mdev, struct vm_area_struct *vma)
 	if (!intel_vgpu_in_aperture(vgpu, req_start))
 		return -EINVAL;
 	if (req_start + req_size >
-	    vgpu_aperture_offset(vgpu) + vgpu_aperture_sz(vgpu))
+	    intel_vgpu_aperture_offset(vgpu) + intel_vgpu_aperture_size(vgpu))
 		return -EINVAL;
 
-	pgoff = (gvt_aperture_pa_base(vgpu->gvt) >> PAGE_SHIFT) + pgoff;
+	pgoff = (intel_gvt_aperture_pa_base(vgpu) >> PAGE_SHIFT) + pgoff;
 
 	return remap_pfn_range(vma, virtaddr, pgoff, req_size, pg_prot);
 }
@@ -1326,7 +1328,7 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
 	unsigned long minsz;
 
-	gvt_dbg_core("vgpu%d ioctl, cmd: %d\n", vgpu->id, cmd);
+	gvt_dbg_core("vgpu%d ioctl, cmd: %d\n", intel_vgpu_id(vgpu), cmd);
 
 	if (cmd == VFIO_DEVICE_GET_INFO) {
 		struct vfio_device_info info;
@@ -1368,13 +1370,13 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 		switch (info.index) {
 		case VFIO_PCI_CONFIG_REGION_INDEX:
 			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.size = vgpu->gvt->device_info.cfg_space_size;
+			info.size = intel_gvt_cfg_space_size(vgpu);
 			info.flags = VFIO_REGION_INFO_FLAG_READ |
 				     VFIO_REGION_INFO_FLAG_WRITE;
 			break;
 		case VFIO_PCI_BAR0_REGION_INDEX:
 			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
-			info.size = vgpu->cfg_space.bar[info.index].size;
+			info.size = intel_vgpu_get_bar_size(vgpu, info.index);
 			if (!info.size) {
 				info.flags = 0;
 				break;
@@ -1394,7 +1396,7 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 					VFIO_REGION_INFO_FLAG_MMAP |
 					VFIO_REGION_INFO_FLAG_READ |
 					VFIO_REGION_INFO_FLAG_WRITE;
-			info.size = gvt_aperture_sz(vgpu->gvt);
+			info.size = intel_gvt_aperture_size(vgpu);
 
 			sparse = kzalloc(struct_size(sparse, areas, nr_areas),
 					 GFP_KERNEL);
@@ -1406,8 +1408,8 @@ static long intel_vgpu_ioctl(struct mdev_device *mdev, unsigned int cmd,
 			sparse->nr_areas = nr_areas;
 			cap_type_id = VFIO_REGION_INFO_CAP_SPARSE_MMAP;
 			sparse->areas[0].offset =
-					PAGE_ALIGN(vgpu_aperture_offset(vgpu));
-			sparse->areas[0].size = vgpu_aperture_sz(vgpu);
+				PAGE_ALIGN(intel_vgpu_aperture_offset(vgpu));
+			sparse->areas[0].size = intel_vgpu_aperture_size(vgpu);
 			break;
 
 		case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
@@ -1607,7 +1609,7 @@ vgpu_id_show(struct device *dev, struct device_attribute *attr,
 	if (mdev) {
 		struct intel_vgpu *vgpu = (struct intel_vgpu *)
 			mdev_get_drvdata(mdev);
-		return sprintf(buf, "%d\n", vgpu->id);
+		return sprintf(buf, "%d\n", intel_vgpu_id(vgpu));
 	}
 	return sprintf(buf, "\n");
 }
@@ -1761,27 +1763,21 @@ static void kvmgt_page_track_flush_slot(struct kvm *kvm,
 	spin_unlock(&kvm->mmu_lock);
 }
 
-static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
+static bool __kvmgt_has_this_kvm(struct intel_vgpu *vgpu, void *kvm)
 {
-	struct intel_vgpu *itr;
+	unsigned long handle = intel_vgpu_handle(vgpu);
 	struct kvmgt_guest_info *info;
-	int id;
-	bool ret = false;
-
-	mutex_lock(&vgpu->gvt->lock);
-	for_each_active_vgpu(vgpu->gvt, itr, id) {
-		if (!handle_valid(itr->handle))
-			continue;
-
-		info = (struct kvmgt_guest_info *)itr->handle;
-		if (kvm && kvm == info->kvm) {
-			ret = true;
-			goto out;
-		}
-	}
-out:
-	mutex_unlock(&vgpu->gvt->lock);
-	return ret;
+
+	if (!handle_valid(handle))
+		return false;
+
+	info = (struct kvmgt_guest_info *)handle;
+	return kvm && kvm == info->kvm;
+}
+
+static bool __kvmgt_vgpu_exist(struct intel_vgpu *vgpu, struct kvm *kvm)
+{
+	return intel_vgpu_active_find(vgpu, __kvmgt_has_this_kvm, kvm);
 }
 
 static int kvmgt_guest_init(struct mdev_device *mdev)
@@ -1792,7 +1788,7 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	struct kvm *kvm;
 
 	vgpu = mdev_get_drvdata(mdev);
-	if (handle_valid(vgpu->handle))
+	if (handle_valid(intel_vgpu_handle(vgpu)))
 		return -EEXIST;
 
 	vdev = kvmgt_vdev(vgpu);
@@ -1809,7 +1805,7 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	if (!info)
 		return -ENOMEM;
 
-	vgpu->handle = (unsigned long)info;
+	intel_vgpu_set_handle(vgpu, (unsigned long)info);
 	info->vgpu = vgpu;
 	info->kvm = kvm;
 	kvm_get_kvm(info->kvm);
@@ -1823,7 +1819,7 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 
 	info->debugfs_cache_entries = debugfs_create_ulong(
 						"kvmgt_nr_cache_entries",
-						0444, vgpu->debugfs,
+						0444, intel_vgpu_debugfs(vgpu),
 						&vdev->nr_cache_entries);
 	return 0;
 }
@@ -1844,13 +1840,15 @@ static bool kvmgt_guest_exit(struct kvmgt_guest_info *info)
 static int kvmgt_attach_vgpu(void *p_vgpu, unsigned long *handle)
 {
 	struct intel_vgpu *vgpu = (struct intel_vgpu *)p_vgpu;
+	struct kvmgt_vdev *vdev;
 
-	vgpu->vdev = kzalloc(sizeof(struct kvmgt_vdev), GFP_KERNEL);
+	vdev = kzalloc(sizeof(struct kvmgt_vdev), GFP_KERNEL);
 
-	if (!vgpu->vdev)
+	if (!vdev)
 		return -ENOMEM;
 
-	kvmgt_vdev(vgpu)->vgpu = vgpu;
+	vdev->vgpu = vgpu;
+	intel_vgpu_set_vdev(vgpu, vdev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mpt.h
index 9ad224df9c68..8b8184d6a1fb 100644
--- a/drivers/gpu/drm/i915/gvt/mpt.h
+++ b/drivers/gpu/drm/i915/gvt/mpt.h
@@ -392,7 +392,4 @@ static inline bool intel_gvt_hypervisor_is_valid_gfn(
 	return intel_gvt_host.mpt->is_valid_gfn(vgpu->handle, gfn);
 }
 
-int intel_gvt_register_hypervisor(struct intel_gvt_mpt *);
-void intel_gvt_unregister_hypervisor(void);
-
 #endif /* _GVT_MPT_H_ */
diff --git a/drivers/gpu/drm/i915/gvt/reg.h b/drivers/gpu/drm/i915/gvt/reg.h
index 5b66e14c5b7b..85f71d2fbcb7 100644
--- a/drivers/gpu/drm/i915/gvt/reg.h
+++ b/drivers/gpu/drm/i915/gvt/reg.h
@@ -49,8 +49,6 @@
 #define INTEL_GVT_OPREGION_SCIC_SF_REQEUSTEDCALLBACKS 1
 #define INTEL_GVT_OPREGION_PARM                   0x204
 
-#define INTEL_GVT_OPREGION_PAGES	2
-#define INTEL_GVT_OPREGION_SIZE		(INTEL_GVT_OPREGION_PAGES * PAGE_SIZE)
 #define INTEL_GVT_OPREGION_VBT_OFFSET	0x400
 #define INTEL_GVT_OPREGION_VBT_SIZE	\
 		(INTEL_GVT_OPREGION_SIZE - INTEL_GVT_OPREGION_VBT_OFFSET)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
