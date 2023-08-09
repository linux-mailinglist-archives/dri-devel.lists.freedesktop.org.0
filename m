Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738657765A2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E48410E47E;
	Wed,  9 Aug 2023 16:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F01C10E46B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:53:40 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A6106607221;
 Wed,  9 Aug 2023 17:53:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691600019;
 bh=pd3BoPTp7ZUA6xth/73DzUhdA692/Sn0PVE63/KUwUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NloPC5TgWiK/6BFqRf09B9no+Vqha+7DIs4uEnhqEHds4PWE6xQCMTUvHkmdyv9rE
 Y3lR+roskZc4nrok9LxsoBUNWOUu11JQ40LOAU/VL3f1HST1Y4uv35V9u3EhceJ4k5
 4kwg/MBtOycKL3udNGkFeOFhYlPL8XyMjgNbHzjZACbQGW9vFCcSersFpqEkEzJ1Th
 wdBTC+B8BeY4JvnTpzcJKR8111mMml6LETJa2IKlg3cqiwILOuuWBMKYHDKGUpQMpO
 g8sO/pCTsR1WrBlgmnit7eJcXWi7x0Ci1p7YWX9YK7aPl3u00Bf92n/K5nOl0w46Ph
 71M+ZNJHAtyig==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/15] drm/panthor: Add the FW logical block
Date: Wed,  9 Aug 2023 18:53:22 +0200
Message-ID: <20230809165330.2451699-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809165330.2451699-1-boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Contains everything that's FW related, that includes the code dealing
with the microcontroller unit (MCU) that's running the FW, and anything
related to allocating memory shared between the FW and the CPU.

A few global FW events are processed in the IRQ handler, the rest is
forwarded to the scheduler, since scheduling is the primary reason for
the FW existence, and also the main source of FW <-> kernel
interactions.

v2:
- Rename the driver (pancsf -> panthor)
- Rename the file (_mcu -> _fw)
- Change the license (GPL2 -> MIT + GPL2)
- Split the driver addition commit
- Document the code
- Use drm_dev_{unplug,enter,exit}() to provide safe device removal
- Use the panthor_irq layer to manage/process IRQs

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 1417 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.h |  505 +++++++++
 2 files changed, 1922 insertions(+)
 create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
new file mode 100644
index 000000000000..359a68f7af03
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -0,0 +1,1417 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2023 Collabora ltd. */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/iopoll.h>
+#include <linux/iosys-map.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include "panthor_device.h"
+#include "panthor_gem.h"
+#include "panthor_gpu.h"
+#include "panthor_regs.h"
+#include "panthor_fw.h"
+#include "panthor_mmu.h"
+#include "panthor_sched.h"
+
+#define CSF_FW_NAME "mali_csffw.bin"
+
+#define PING_INTERVAL_MS			12000
+#define PROGRESS_TIMEOUT_CYCLES			(5ull * 500 * 1024 * 1024)
+#define PROGRESS_TIMEOUT_SCALE_SHIFT		10
+#define IDLE_HYSTERESIS_US			800
+#define PWROFF_HYSTERESIS_US			10000
+
+/**
+ * struct panthor_fw_mem - FW memory
+ */
+struct panthor_fw_mem {
+	/** @bo: Buffer object backing the FW memory. */
+	struct panthor_gem_object *bo;
+
+	/** @kmap: Kernel CPU mapping of the FW memory. */
+	void *kmap;
+
+	/** @va: MCU mapping of the FW memory. */
+	u64 va;
+};
+
+/**
+ * struct panthor_fw_binary_hdr - Firmware binary header.
+ */
+struct panthor_fw_binary_hdr {
+	/** @magic: Magic value to check binary validity. */
+	u32 magic;
+#define CSF_FW_BINARY_HEADER_MAGIC		0xc3f13a6e
+
+	/** @minor: Minor FW version. */
+	u8 minor;
+
+	/** @major: Major FW version. */
+	u8 major;
+#define CSF_FW_BINARY_HEADER_MAJOR_MAX		0
+
+	/** @padding1: MBZ. */
+	u16 padding1;
+
+	/** @version_hash: FW version hash. */
+	u32 version_hash;
+
+	/** @padding2: MBZ. */
+	u32 padding2;
+
+	/** @size: FW binary size. */
+	u32 size;
+};
+
+/**
+ * enum panthor_fw_binary_entry_type - Firmware binary entry type
+ */
+enum panthor_fw_binary_entry_type {
+	/** @CSF_FW_BINARY_ENTRY_TYPE_IFACE: Host <-> FW interface. */
+	CSF_FW_BINARY_ENTRY_TYPE_IFACE = 0,
+
+	/** @CSF_FW_BINARY_ENTRY_TYPE_CONFIG: FW config. */
+	CSF_FW_BINARY_ENTRY_TYPE_CONFIG = 1,
+
+	/** @CSF_FW_BINARY_ENTRY_TYPE_FUTF_TEST: Unit-tests. */
+	CSF_FW_BINARY_ENTRY_TYPE_FUTF_TEST = 2,
+
+	/** @CSF_FW_BINARY_ENTRY_TYPE_TRACE_BUFFER: Trace buffer interface. */
+	CSF_FW_BINARY_ENTRY_TYPE_TRACE_BUFFER = 3,
+
+	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata interface. */
+	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA = 4,
+};
+
+#define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
+#define CSF_FW_BINARY_ENTRY_SIZE(ehdr)					(((ehdr) >> 8) & 0xff)
+#define CSF_FW_BINARY_ENTRY_UPDATE					BIT(30)
+#define CSF_FW_BINARY_ENTRY_OPTIONAL					BIT(31)
+
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_RD					BIT(0)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_WR					BIT(1)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_EX					BIT(2)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_NONE			(0 << 3)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED			(1 << 3)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_UNCACHED_COHERENT	(2 << 3)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED_COHERENT		(3 << 3)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK			GENMASK(4, 3)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_PROT				BIT(5)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED				BIT(30)
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO				BIT(31)
+
+#define CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS			\
+	(CSF_FW_BINARY_IFACE_ENTRY_RD_RD |				\
+	 CSF_FW_BINARY_IFACE_ENTRY_RD_WR |				\
+	 CSF_FW_BINARY_IFACE_ENTRY_RD_EX |				\
+	 CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK |			\
+	 CSF_FW_BINARY_IFACE_ENTRY_RD_PROT |				\
+	 CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED  |				\
+	 CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO)
+
+/**
+ * struct panthor_fw_binary_section_entry_hdr - Describes a section of FW binary
+ */
+struct panthor_fw_binary_section_entry_hdr {
+	/** @flags: Section flags. */
+	u32 flags;
+
+	/** @va: MCU virtual range to map this binary section to. */
+	struct {
+		/** @start: Start address. */
+		u32 start;
+
+		/** @end: End address. */
+		u32 end;
+	} va;
+
+	/** @data: Data to initialize the FW section with. */
+	struct {
+		/** @start: Start offset in the FW binary. */
+		u32 start;
+
+		/** @end: End offset in the FW binary. */
+		u32 end;
+	} data;
+};
+
+/**
+ * struct panthor_fw_binary_iter - Firmware binary iterator
+ *
+ * Used to parse a firmware binary.
+ */
+struct panthor_fw_binary_iter {
+	/** @data: FW binary data. */
+	const void *data;
+
+	/** @size: FW binary size. */
+	size_t size;
+
+	/** @offset: Iterator offset. */
+	size_t offset;
+};
+
+/**
+ * struct panthor_fw_section - FW section
+ */
+struct panthor_fw_section {
+	/** @node: Used to keep track of FW sections. */
+	struct list_head node;
+
+	/** @flags: Section flags, as encoded in the FW binary. */
+	u32 flags;
+
+	/** @mem: Section memory. */
+	struct panthor_fw_mem *mem;
+
+	/**
+	 * @name: Name of the section, as specified in the binary.
+	 *
+	 * Can be NULL.
+	 */
+	const char *name;
+
+	/**
+	 * @data: Initial data copied to the FW memory.
+	 *
+	 * We keep data around so we can reload sections after a reset.
+	 */
+	struct {
+		/** @buf: Buffed used to store init data. */
+		const void *buf;
+
+		/** @size: Size of @buf in bytes. */
+		size_t size;
+	} data;
+};
+
+#define CSF_MCU_SHARED_REGION_START		0x04000000ULL
+#define CSF_MCU_SHARED_REGION_SIZE		0x04000000ULL
+
+#define MIN_CS_PER_CSG				8
+#define MIN_CSGS				3
+#define MAX_CSG_PRIO				0xf
+
+#define CSF_IFACE_VERSION(major, minor, patch)	\
+	(((major) << 24) | ((minor) << 16) | (patch))
+#define CSF_IFACE_VERSION_MAJOR(v)		((v) >> 24)
+#define CSF_IFACE_VERSION_MINOR(v)		(((v) >> 16) & 0xff)
+#define CSF_IFACE_VERSION_PATCH(v)		((v) & 0xffff)
+
+#define CSF_GROUP_CONTROL_OFFSET		0x1000
+#define CSF_STREAM_CONTROL_OFFSET		0x40
+#define CSF_UNPRESERVED_REG_COUNT		4
+
+/**
+ * struct panthor_fw_iface - FW interfaces
+ */
+struct panthor_fw_iface {
+	/** @global: Global interface. */
+	struct panthor_fw_global_iface global;
+
+	/** @groups: Group slot interfaces. */
+	struct panthor_fw_csg_iface groups[MAX_CSGS];
+
+	/** @streams: Command stream slot interfaces. */
+	struct panthor_fw_cs_iface streams[MAX_CSGS][MAX_CS_PER_CSG];
+};
+
+/**
+ * struct panthor_fw - Firmware management
+ */
+struct panthor_fw {
+	/** @vm: MCU VM. */
+	struct panthor_vm *vm;
+
+	/** @sections: List of FW sections. */
+	struct list_head sections;
+
+	/** @shared_section: The section containing the FW interfaces. */
+	struct panthor_fw_section *shared_section;
+
+	/** @iface: FW interfaces. */
+	struct panthor_fw_iface iface;
+
+	/** @watchdog: Collection of fields relating to the FW watchdog. */
+	struct {
+		/** @ping_work: Delayed work used to ping the FW. */
+		struct delayed_work ping_work;
+	} watchdog;
+
+	/**
+	 * @waitqueues: Request waitqueues.
+	 *
+	 * Everytime a request is sent to a command stream group or the global
+	 * interface, the caller will first busy wait for the request to be
+	 * acknowledged, and then fallback to a sleeping wait.
+	 *
+	 * Those wait queues are here to support the sleeping wait flavor.
+	 *
+	 * Entry 31 is the global waitqueue, the other ones are the command
+	 * stream group slot waitqueues.
+	 */
+	wait_queue_head_t waitqueues[32];
+
+	/** @booted: True is the FW is booted */
+	bool booted;
+
+	/**
+	 * @fast_reset: True if the post_reset logic can proceed with a fast reset.
+	 *
+	 * A fast reset is just a reset where the driver doesn't reload the FW sections.
+	 *
+	 * Any time the firmware is properly suspended, a fast reset can take place.
+	 * On the other hand, if the halt operation failed, the driver will reload
+	 * all sections to make sure we start from a fresh state.
+	 */
+	bool fast_reset;
+
+	/** @irq: Job irq data. */
+	struct panthor_irq irq;
+};
+
+/**
+ * panthor_fw_get_glb_iface() - Get the global interface
+ * @ptdev: Device.
+ *
+ * Return: The global interface.
+ */
+struct panthor_fw_global_iface *
+panthor_fw_get_glb_iface(struct panthor_device *ptdev)
+{
+	return &ptdev->fw->iface.global;
+}
+
+/**
+ * panthor_fw_get_glb_iface() - Get a command stream group slot interface
+ * @ptdev: Device.
+ * @csg_slot: Index of the command stream group slot.
+ *
+ * Return: The command stream group slot interface.
+ */
+struct panthor_fw_csg_iface *
+panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot)
+{
+	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS))
+		return NULL;
+
+	return &ptdev->fw->iface.groups[csg_slot];
+}
+
+/**
+ * panthor_fw_get_glb_iface() - Get a command stream slot interface
+ * @ptdev: Device.
+ * @csg_slot: Index of the command stream group slot.
+ * @cs_slot: Index of the command stream slot.
+ *
+ * Return: The command stream slot interface.
+ */
+struct panthor_fw_cs_iface *
+panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
+{
+	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS || cs_slot > MAX_CS_PER_CSG))
+		return NULL;
+
+	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
+}
+
+/**
+ * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
+ * @ptdev: Device.
+ * @timeout_us: Timeout expressed in micro-seconds.
+ *
+ * The FW has two timer sources: the GPU counter or arch-timer. We need
+ * to express timeouts in term of number of cycles and specify which
+ * timer source should be used.
+ *
+ * Return: A value suitable for timeout fields in the global interface.
+ */
+static u32 panthor_fw_conv_timeout(struct panthor_device *ptdev, u32 timeout_us)
+{
+	bool use_cycle_counter = false;
+	u32 timer_rate = 0;
+	u64 cycles;
+
+#ifdef CONFIG_ARM_ARCH_TIMER
+	timer_rate = arch_timer_get_cntfrq();
+#endif
+
+	if (!timer_rate) {
+		use_cycle_counter = true;
+		timer_rate = clk_get_rate(ptdev->clks.core);
+	}
+
+	if (drm_WARN_ON(&ptdev->base, !timer_rate)) {
+		/* We couldn't get a valid clock rate, let's just pick the
+		 * maximum value so the FW still handles the core
+		 * power on/off requests.
+		 */
+		return GLB_TIMER_VAL(0x7fffffff) |
+		       GLB_TIMER_SOURCE_GPU_COUNTER;
+	}
+
+	cycles = DIV_ROUND_UP_ULL((u64)timeout_us * timer_rate, 1000000);
+	return GLB_TIMER_VAL(cycles >> 10) |
+	       (use_cycle_counter ? GLB_TIMER_SOURCE_GPU_COUNTER : 0);
+}
+
+static int panthor_fw_binary_iter_read(struct panthor_device *ptdev,
+				       struct panthor_fw_binary_iter *iter,
+				       void *out, size_t size)
+{
+	size_t new_offset = iter->offset + size;
+
+	if (new_offset > iter->size || new_offset < iter->offset) {
+		drm_err(&ptdev->base, "Firmware too small\n");
+		return -EINVAL;
+	}
+
+	memcpy(out, iter->data + iter->offset, size);
+	iter->offset = new_offset;
+	return 0;
+}
+
+static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
+					struct panthor_fw_section *section)
+{
+	bool was_mapped = !!section->mem->kmap;
+	void *kmap;
+
+	if (!section->data.size &&
+	    !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO))
+		return;
+
+	kmap = panthor_fw_mem_vmap(section->mem);
+	if (drm_WARN_ON(&ptdev->base, !kmap))
+		return;
+
+	memcpy(kmap, section->data.buf, section->data.size);
+	if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_ZERO) {
+		memset(kmap + section->data.size, 0,
+		       section->mem->bo->base.base.size - section->data.size);
+	}
+
+	if (!was_mapped)
+		panthor_fw_mem_vunmap(section->mem);
+}
+
+/**
+ * panthor_fw_mem_va() - Get the MCU address of a FW memory object.
+ * @mem: FW memory object.
+ *
+ * Return: The MCU address of a virtual object.
+ */
+u64 panthor_fw_mem_va(struct panthor_fw_mem *mem)
+{
+	return mem->va;
+}
+
+/**
+ * panthor_fw_mem_vunmap() - Kill kernel space mapping of a FW memory object
+ * @mem: FW memory object.
+ */
+void panthor_fw_mem_vunmap(struct panthor_fw_mem *mem)
+{
+	if (mem->kmap) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(mem->kmap);
+
+		drm_gem_vunmap_unlocked(&mem->bo->base.base, &map);
+		mem->kmap = NULL;
+	}
+}
+
+/**
+ * panthor_fw_mem_vunmap() - Map a FW memory object in kernel space
+ * @mem: FW memory object.
+ *
+ * Return: a non-NULL pointer on success, NULL otherwise.
+ */
+void *panthor_fw_mem_vmap(struct panthor_fw_mem *mem)
+{
+	if (!mem->kmap) {
+		struct iosys_map map;
+		int ret;
+
+		ret = drm_gem_vmap_unlocked(&mem->bo->base.base, &map);
+		if (ret)
+			return NULL;
+
+		mem->kmap = map.vaddr;
+	}
+
+	return mem->kmap;
+}
+
+/**
+ * panthor_fw_mem_free() - Free a FW memory object.
+ * @ptdev: Device.
+ * @mem: FW memory object to free.
+ */
+void panthor_fw_mem_free(struct panthor_device *ptdev, struct panthor_fw_mem *mem)
+{
+	if (IS_ERR_OR_NULL(mem))
+		return;
+
+	if (mem->bo)
+		panthor_gem_unmap_and_put(ptdev->fw->vm, mem->bo, mem->va, mem->kmap);
+
+	kfree(mem);
+}
+
+/**
+ * panthor_fw_mem_alloc() - Allocate a FW memory object and map it to the MCU VM.
+ * @ptdev: Device.
+ * @size: Size of the memory block.
+ * @bo_flags: BO flags.
+ * @vm_map_flags: VM_MAP flags.
+ * @va: Virtual address of the MCU mapping.
+ * Set to PANTHOR_GEM_ALLOC_VA for automatic VA-assignment. In that case, the
+ * VA will be allocated in the shared VA space.
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+static struct panthor_fw_mem *
+panthor_fw_mem_alloc(struct panthor_device *ptdev, size_t size,
+		     u32 bo_flags, u32 vm_map_flags, u64 va)
+{
+	struct panthor_fw_mem *mem = kzalloc(sizeof(*mem), GFP_KERNEL);
+	int ret;
+
+	if (!mem)
+		return ERR_PTR(-ENOMEM);
+
+	mem->bo = panthor_gem_create_and_map(ptdev, ptdev->fw->vm,
+					     size, bo_flags, vm_map_flags,
+					     &va, NULL);
+	if (IS_ERR(mem->bo)) {
+		ret = PTR_ERR(mem->bo);
+		mem->bo = NULL;
+		goto err_free_mem;
+	}
+
+	mem->va = va;
+	return mem;
+
+err_free_mem:
+	panthor_fw_mem_free(ptdev, mem);
+	return ERR_PTR(ret);
+}
+
+/**
+ * panthor_fw_alloc_queue_iface_mem() - Allocate a ring-buffer interfaces.
+ * @ptdev: Device.
+ * @input: Pointer holding the input interface on success.
+ * Should be ignored on failure.
+ * @output: Pointer holding the output interface on success.
+ * Should be ignored on failure.
+ *
+ * Allocates panthor_fw_ringbuf_{input,out}_iface interfaces. The input
+ * interface is at offset 0, and the output interface at offset 4096.
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+struct panthor_fw_mem *
+panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
+				 struct panthor_fw_ringbuf_input_iface **input,
+				 const struct panthor_fw_ringbuf_output_iface **output)
+{
+	struct panthor_fw_mem *mem;
+	void *kmap;
+
+	mem = panthor_fw_mem_alloc(ptdev, 8192,
+				   DRM_PANTHOR_BO_NO_MMAP,
+				   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
+				   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
+				   PANTHOR_GEM_ALLOC_VA);
+	if (IS_ERR(mem))
+		return mem;
+
+	kmap = panthor_fw_mem_vmap(mem);
+	if (!kmap) {
+		panthor_fw_mem_free(ptdev, mem);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	memset(kmap, 0, mem->bo->base.base.size);
+	*input = kmap;
+	*output = kmap + 4096;
+	return mem;
+}
+
+/**
+ * panthor_fw_alloc_suspend_buf_mem() - Allocate a suspend buffer for a command stream group.
+ * @ptdev: Device.
+ * @size: Size of the suspend buffer.
+ *
+ * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
+ */
+struct panthor_fw_mem *
+panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
+{
+	return panthor_fw_mem_alloc(ptdev, size,
+				    DRM_PANTHOR_BO_NO_MMAP,
+				    DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
+				    PANTHOR_GEM_ALLOC_VA);
+}
+
+static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
+					 const struct firmware *fw,
+					 struct panthor_fw_binary_iter *iter,
+					 u32 ehdr)
+{
+	struct panthor_fw_binary_section_entry_hdr hdr;
+	struct panthor_fw_section *section;
+	u32 section_size;
+	u32 name_len;
+	int ret;
+
+	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
+	if (ret)
+		return ret;
+
+	if (hdr.data.end < hdr.data.start) {
+		drm_err(&ptdev->base, "Firmware corrupted, data.end < data.start (0x%x < 0x%x)\n",
+			hdr.data.end, hdr.data.start);
+		return -EINVAL;
+	}
+
+	if (hdr.va.end < hdr.va.start) {
+		drm_err(&ptdev->base, "Firmware corrupted, hdr.va.end < hdr.va.start (0x%x < 0x%x)\n",
+			hdr.va.end, hdr.va.start);
+		return -EINVAL;
+	}
+
+	if (hdr.data.end > fw->size) {
+		drm_err(&ptdev->base, "Firmware corrupted, file truncated? data_end=0x%x > fw size=0x%zx\n",
+			hdr.data.end, fw->size);
+		return -EINVAL;
+	}
+
+	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
+	    (hdr.va.end & ~PAGE_MASK) != 0) {
+		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
+			hdr.va.start, hdr.va.end);
+		return -EINVAL;
+	}
+
+	if (hdr.flags & ~CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS) {
+		drm_err(&ptdev->base, "Firmware contains interface with unsupported flags (0x%x)\n",
+			hdr.flags);
+		return -EINVAL;
+	}
+
+	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_PROT) {
+		drm_warn(&ptdev->base,
+			 "Firmware protected mode entry not be supported, ignoring");
+		return 0;
+	}
+
+	if (hdr.va.start == CSF_MCU_SHARED_REGION_START &&
+	    !(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED)) {
+		drm_err(&ptdev->base,
+			"Interface at 0x%llx must be shared", CSF_MCU_SHARED_REGION_START);
+		return -EINVAL;
+	}
+
+	name_len = iter->size - iter->offset;
+
+	section = drmm_kzalloc(&ptdev->base, sizeof(*section), GFP_KERNEL);
+	if (!section)
+		return -ENOMEM;
+
+	list_add_tail(&section->node, &ptdev->fw->sections);
+	section->flags = hdr.flags;
+	section->data.size = hdr.data.end - hdr.data.start;
+
+	if (section->data.size > 0) {
+		void *data = drmm_kmalloc(&ptdev->base, section->data.size, GFP_KERNEL);
+
+		if (!data)
+			return -ENOMEM;
+
+		memcpy(data, fw->data + hdr.data.start, section->data.size);
+		section->data.buf = data;
+	}
+
+	if (name_len > 0) {
+		char *name = drmm_kmalloc(&ptdev->base, name_len + 1, GFP_KERNEL);
+
+		if (!name)
+			return -ENOMEM;
+
+		memcpy(name, iter->data + iter->offset, name_len);
+		name[name_len] = '\0';
+		section->name = name;
+	}
+
+	section_size = hdr.va.end - hdr.va.start;
+	if (section_size) {
+		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK;
+		u32 vm_map_flags = 0;
+		struct sg_table *sgt;
+		u64 va = hdr.va.start;
+
+		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
+			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
+
+		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_EX))
+			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
+
+		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_*_COHERENT are mapped to
+		 * non-cacheable for now. We might want to introduce a new
+		 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
+		 * memory and is currently not used by our driver) for
+		 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
+		 * of IO-coherent systems.
+		 */
+		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED)
+			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
+
+		/* Shared section is in the auto-VA range. We need to
+		 * reserve the VA range so it's not allocated to someone else.
+		 */
+		if (va >= CSF_MCU_SHARED_REGION_START &&
+		    va < CSF_MCU_SHARED_REGION_START + CSF_MCU_SHARED_REGION_SIZE)
+			va = PANTHOR_GEM_ALLOC_VA;
+
+		section->mem = panthor_fw_mem_alloc(ptdev, section_size,
+						    DRM_PANTHOR_BO_NO_MMAP,
+						    vm_map_flags, va);
+		if (IS_ERR(section->mem))
+			return PTR_ERR(section->mem);
+
+		if (drm_WARN_ON(&ptdev->base, section->mem->va != hdr.va.start))
+			return -EINVAL;
+
+		panthor_fw_init_section_mem(ptdev, section);
+
+		sgt = drm_gem_shmem_get_pages_sgt(&section->mem->bo->base);
+		if (IS_ERR(sgt))
+			return PTR_ERR(section->mem);
+
+		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
+
+		if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED) {
+			if (!panthor_fw_mem_vmap(section->mem))
+				return -ENOMEM;
+		}
+	}
+
+	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
+		ptdev->fw->shared_section = section;
+
+	return 0;
+}
+
+static void
+panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
+{
+	struct panthor_fw_section *section;
+
+	list_for_each_entry(section, &ptdev->fw->sections, node) {
+		struct sg_table *sgt;
+
+		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
+			continue;
+
+		panthor_fw_init_section_mem(ptdev, section);
+		sgt = drm_gem_shmem_get_pages_sgt(&section->mem->bo->base);
+		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
+			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
+	}
+}
+
+static int panthor_fw_load_entry(struct panthor_device *ptdev,
+				 const struct firmware *fw,
+				 struct panthor_fw_binary_iter *iter)
+{
+	struct panthor_fw_binary_iter eiter;
+	u32 ehdr;
+	int ret;
+
+	ret = panthor_fw_binary_iter_read(ptdev, iter, &ehdr, sizeof(ehdr));
+	if (ret)
+		return ret;
+
+	if ((iter->offset % sizeof(u32)) ||
+	    (CSF_FW_BINARY_ENTRY_SIZE(ehdr) % sizeof(u32))) {
+		drm_err(&ptdev->base, "Firmware entry isn't 32 bit aligned, offset=0x%x size=0x%x\n",
+			(u32)(iter->offset - sizeof(u32)), CSF_FW_BINARY_ENTRY_SIZE(ehdr));
+		return -EINVAL;
+	}
+
+	eiter.offset = 0;
+	eiter.data = iter->data + iter->offset;
+	eiter.size = CSF_FW_BINARY_ENTRY_SIZE(ehdr) - sizeof(ehdr);
+	iter->offset += eiter.size;
+
+	switch (CSF_FW_BINARY_ENTRY_TYPE(ehdr)) {
+	case CSF_FW_BINARY_ENTRY_TYPE_IFACE:
+		return panthor_fw_load_section_entry(ptdev, fw, &eiter, ehdr);
+
+	/* FIXME: handle those entry types? */
+	case CSF_FW_BINARY_ENTRY_TYPE_CONFIG:
+	case CSF_FW_BINARY_ENTRY_TYPE_FUTF_TEST:
+	case CSF_FW_BINARY_ENTRY_TYPE_TRACE_BUFFER:
+	case CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA:
+		return 0;
+	default:
+		break;
+	}
+
+	if (ehdr & CSF_FW_BINARY_ENTRY_OPTIONAL)
+		return 0;
+
+	drm_err(&ptdev->base,
+		"Unsupported non-optional entry type %u in firmware\n",
+		CSF_FW_BINARY_ENTRY_TYPE(ehdr));
+	return -EINVAL;
+}
+
+static int panthor_fw_load(struct panthor_device *ptdev)
+{
+	const struct firmware *fw = NULL;
+	struct panthor_fw_binary_iter iter = {};
+	struct panthor_fw_binary_hdr hdr;
+	int ret;
+
+	ret = request_firmware(&fw, CSF_FW_NAME, ptdev->base.dev);
+	if (ret) {
+		drm_err(&ptdev->base, "Failed to load firmware image '%s'\n",
+			CSF_FW_NAME);
+		return ret;
+	}
+
+	iter.data = fw->data;
+	iter.size = fw->size;
+	ret = panthor_fw_binary_iter_read(ptdev, &iter, &hdr, sizeof(hdr));
+	if (ret)
+		goto out;
+
+	if (hdr.magic != CSF_FW_BINARY_HEADER_MAGIC) {
+		ret = -EINVAL;
+		drm_err(&ptdev->base, "Invalid firmware magic\n");
+		goto out;
+	}
+
+	if (hdr.major != CSF_FW_BINARY_HEADER_MAJOR_MAX) {
+		ret = -EINVAL;
+		drm_err(&ptdev->base, "Unsupported firmware binary header version %d.%d (expected %d.x)\n",
+			hdr.major, hdr.minor, CSF_FW_BINARY_HEADER_MAJOR_MAX);
+		goto out;
+	}
+
+	if (hdr.size > iter.size) {
+		drm_err(&ptdev->base, "Firmware image is truncated\n");
+		goto out;
+	}
+
+	iter.size = hdr.size;
+
+	while (iter.offset < hdr.size) {
+		ret = panthor_fw_load_entry(ptdev, fw, &iter);
+		if (ret)
+			goto out;
+	}
+
+	if (!ptdev->fw->shared_section) {
+		drm_err(&ptdev->base, "Shared interface region not found\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+out:
+	release_firmware(fw);
+	return ret;
+}
+
+/**
+ * iface_fw_to_cpu_addr() - Turn an MCU address into a CPU address
+ * @ptdev: Device.
+ * @mcu_va: MCU address.
+ *
+ * Return: NULL if the address is not part of the shared section, non-NULL otherwise.
+ */
+static void *iface_fw_to_cpu_addr(struct panthor_device *ptdev, u32 mcu_va)
+{
+	u64 shared_mem_start = ptdev->fw->shared_section->mem->va;
+	u64 shared_mem_end = ptdev->fw->shared_section->mem->va +
+			     ptdev->fw->shared_section->mem->bo->base.base.size;
+	if (mcu_va < shared_mem_start || mcu_va >= shared_mem_end)
+		return NULL;
+
+	return ptdev->fw->shared_section->mem->kmap + (mcu_va - shared_mem_start);
+}
+
+static int panthor_init_cs_iface(struct panthor_device *ptdev,
+				 unsigned int csg_idx, unsigned int cs_idx)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_idx);
+	struct panthor_fw_cs_iface *cs_iface = &ptdev->fw->iface.streams[csg_idx][cs_idx];
+	u64 shared_section_sz = ptdev->fw->shared_section->mem->bo->base.base.size;
+	u32 iface_offset = CSF_GROUP_CONTROL_OFFSET +
+			   (csg_idx * glb_iface->control->group_stride) +
+			   CSF_STREAM_CONTROL_OFFSET +
+			   (cs_idx * csg_iface->control->stream_stride);
+
+	if (iface_offset + sizeof(*cs_iface) >= shared_section_sz)
+		return -EINVAL;
+
+	spin_lock_init(&cs_iface->lock);
+	cs_iface->control = ptdev->fw->shared_section->mem->kmap + iface_offset;
+	cs_iface->input = iface_fw_to_cpu_addr(ptdev, cs_iface->control->input_va);
+	cs_iface->output = iface_fw_to_cpu_addr(ptdev, cs_iface->control->output_va);
+
+	if (!cs_iface->input || !cs_iface->output) {
+		drm_err(&ptdev->base, "Invalid stream control interface input/output VA");
+		return -EINVAL;
+	}
+
+	if (csg_idx > 0 || cs_idx > 0) {
+		struct panthor_fw_cs_iface *first_cs_iface =
+			panthor_fw_get_cs_iface(ptdev, 0, 0);
+
+		if (cs_iface->control->features != first_cs_iface->control->features) {
+			drm_err(&ptdev->base, "Expecting identical CS slots");
+			return -EINVAL;
+		}
+	} else {
+		u32 reg_count = CS_FEATURES_WORK_REGS(cs_iface->control->features);
+
+		ptdev->csif_info.cs_reg_count = reg_count;
+		ptdev->csif_info.unpreserved_cs_reg_count = CSF_UNPRESERVED_REG_COUNT;
+	}
+
+	return 0;
+}
+
+static int panthor_init_csg_iface(struct panthor_device *ptdev,
+				  unsigned int csg_idx)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct panthor_fw_csg_iface *csg_iface = &ptdev->fw->iface.groups[csg_idx];
+	u64 shared_section_sz = ptdev->fw->shared_section->mem->bo->base.base.size;
+	u32 iface_offset = CSF_GROUP_CONTROL_OFFSET + (csg_idx * glb_iface->control->group_stride);
+	unsigned int i;
+
+	if (iface_offset + sizeof(*csg_iface) >= shared_section_sz)
+		return -EINVAL;
+
+	spin_lock_init(&csg_iface->lock);
+	csg_iface->control = ptdev->fw->shared_section->mem->kmap + iface_offset;
+	csg_iface->input = iface_fw_to_cpu_addr(ptdev, csg_iface->control->input_va);
+	csg_iface->output = iface_fw_to_cpu_addr(ptdev, csg_iface->control->output_va);
+
+	if (csg_iface->control->stream_num < MIN_CS_PER_CSG ||
+	    csg_iface->control->stream_num > MAX_CS_PER_CSG)
+		return -EINVAL;
+
+	if (!csg_iface->input || !csg_iface->output) {
+		drm_err(&ptdev->base, "Invalid group control interface input/output VA");
+		return -EINVAL;
+	}
+
+	if (csg_idx > 0) {
+		struct panthor_fw_csg_iface *first_csg_iface =
+			panthor_fw_get_csg_iface(ptdev, 0);
+		u32 first_protm_suspend_size = first_csg_iface->control->protm_suspend_size;
+
+		if (first_csg_iface->control->features != csg_iface->control->features ||
+		    first_csg_iface->control->suspend_size != csg_iface->control->suspend_size ||
+		    first_protm_suspend_size != csg_iface->control->protm_suspend_size ||
+		    first_csg_iface->control->stream_num != csg_iface->control->stream_num) {
+			drm_err(&ptdev->base, "Expecting identical CSG slots");
+			return -EINVAL;
+		}
+	}
+
+	for (i = 0; i < csg_iface->control->stream_num; i++) {
+		int ret = panthor_init_cs_iface(ptdev, csg_idx, i);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static u32 panthor_get_instr_features(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (glb_iface->control->version < CSF_IFACE_VERSION(1, 1, 0))
+		return 0;
+
+	return glb_iface->control->instr_features;
+}
+
+static int panthor_fw_init_ifaces(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = &ptdev->fw->iface.global;
+	unsigned int i;
+
+	if (!ptdev->fw->shared_section->mem->kmap)
+		return -EINVAL;
+
+	spin_lock_init(&glb_iface->lock);
+	glb_iface->control = ptdev->fw->shared_section->mem->kmap;
+
+	if (!glb_iface->control->version) {
+		drm_err(&ptdev->base, "Invalid CSF interface version %d.%d.%d (%x)",
+			CSF_IFACE_VERSION_MAJOR(glb_iface->control->version),
+			CSF_IFACE_VERSION_MINOR(glb_iface->control->version),
+			CSF_IFACE_VERSION_PATCH(glb_iface->control->version),
+			glb_iface->control->version);
+		return -EINVAL;
+	}
+
+	glb_iface->input = iface_fw_to_cpu_addr(ptdev, glb_iface->control->input_va);
+	glb_iface->output = iface_fw_to_cpu_addr(ptdev, glb_iface->control->output_va);
+	if (!glb_iface->input || !glb_iface->output) {
+		drm_err(&ptdev->base, "Invalid global control interface input/output VA");
+		return -EINVAL;
+	}
+
+	if (glb_iface->control->group_num > MAX_CSGS ||
+	    glb_iface->control->group_num < MIN_CSGS) {
+		drm_err(&ptdev->base, "Invalid number of control groups");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < glb_iface->control->group_num; i++) {
+		int ret = panthor_init_csg_iface(ptdev, i);
+
+		if (ret)
+			return ret;
+	}
+
+	drm_info(&ptdev->base, "CSF FW v%d.%d.%d, Features %x Instrumentation features %x",
+		 CSF_IFACE_VERSION_MAJOR(glb_iface->control->version),
+		 CSF_IFACE_VERSION_MINOR(glb_iface->control->version),
+		 CSF_IFACE_VERSION_PATCH(glb_iface->control->version),
+		 glb_iface->control->features,
+		 panthor_get_instr_features(ptdev));
+	return 0;
+}
+
+static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	/* Enable all cores. */
+	glb_iface->input->core_en_mask = ptdev->gpu_info.shader_present;
+
+	/* Setup timers. */
+	glb_iface->input->poweroff_timer = panthor_fw_conv_timeout(ptdev, PWROFF_HYSTERESIS_US);
+	glb_iface->input->progress_timer = PROGRESS_TIMEOUT_CYCLES >> PROGRESS_TIMEOUT_SCALE_SHIFT;
+	glb_iface->input->idle_timer = panthor_fw_conv_timeout(ptdev, IDLE_HYSTERESIS_US);
+
+	/* Enable interrupts we care about. */
+	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
+					 GLB_PING |
+					 GLB_CFG_PROGRESS_TIMER |
+					 GLB_CFG_POWEROFF_TIMER |
+					 GLB_IDLE_EN |
+					 GLB_IDLE;
+
+	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
+	panthor_fw_toggle_reqs(glb_iface, req, ack,
+			       GLB_CFG_ALLOC_EN |
+			       GLB_CFG_POWEROFF_TIMER |
+			       GLB_CFG_PROGRESS_TIMER);
+
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+
+	/* Kick the watchdog. */
+	mod_delayed_work(ptdev->reset.wq, &ptdev->fw->watchdog.ping_work,
+			 msecs_to_jiffies(PING_INTERVAL_MS));
+}
+
+static void panthor_fw_process_global_irq(struct panthor_device *ptdev)
+{
+	/* If the FW is not booted, don't process IRQs, just flag the FW as booted. */
+	if (!ptdev->fw->booted)
+		ptdev->fw->booted = true;
+	else
+		panthor_sched_process_global_irq(ptdev);
+
+	wake_up_all(&ptdev->fw->waitqueues[31]);
+}
+
+static void panthor_fw_process_csg_irq(struct panthor_device *ptdev, u32 csg_slot)
+{
+	panthor_sched_process_csg_irq(ptdev, csg_slot);
+	wake_up_all(&ptdev->fw->waitqueues[csg_slot]);
+}
+
+static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
+{
+	if (status & JOB_INT_GLOBAL_IF) {
+		panthor_fw_process_global_irq(ptdev);
+		status &= ~JOB_INT_GLOBAL_IF;
+	}
+
+	while (status) {
+		u32 csg_id = ffs(status) - 1;
+
+		panthor_fw_process_csg_irq(ptdev, csg_id);
+		status &= ~BIT(csg_id);
+	}
+}
+PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
+
+static int panthor_fw_start(struct panthor_device *ptdev)
+{
+	bool timedout = false;
+
+	ptdev->fw->booted = false;
+	panthor_job_irq_resume(&ptdev->fw->irq, ~0);
+	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_AUTO);
+
+	if (!wait_event_timeout(ptdev->fw->waitqueues[31],
+				ptdev->fw->booted,
+				msecs_to_jiffies(1000))) {
+		if (!ptdev->fw->booted &&
+		    !(gpu_read(ptdev, JOB_INT_STAT) & JOB_INT_GLOBAL_IF))
+			timedout = true;
+	}
+
+	if (timedout) {
+		drm_err(&ptdev->base, "Failed to boot MCU");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void panthor_fw_stop(struct panthor_device *ptdev)
+{
+	u32 status;
+
+	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
+	if (readl_poll_timeout(ptdev->iomem + MCU_CONTROL, status,
+			       status == MCU_CONTROL_DISABLE, 10, 100000))
+		drm_err(&ptdev->base, "Failed to stop MCU");
+}
+
+/**
+ * panthor_fw_pre_reset() - Call before a reset.
+ * @ptdev: Device.
+ * @on_hang: true if the reset was triggered on a GPU hang.
+ *
+ * If the reset is not triggered on a hang, we try to gracefully halt the
+ * MCU, so we can do a fast-reset when panthor_fw_post_reset() is called.
+ */
+void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
+{
+	/* Make sure we won't be woken up by a ping. */
+	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
+
+	ptdev->fw->fast_reset = false;
+
+	if (!on_hang) {
+		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+		u32 status;
+
+		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
+		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
+					status == MCU_STATUS_HALT, 10, 100000) &&
+		    glb_iface->output->halt_status == PANTHOR_FW_HALT_OK) {
+			ptdev->fw->fast_reset = true;
+		} else {
+			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
+		}
+
+		/* The FW detects 0 -> 1 transitions. Make sure we reset
+		 * the HALT bit before the FW is rebooted.
+		 */
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+	}
+
+	panthor_job_irq_suspend(&ptdev->fw->irq);
+}
+
+/**
+ * panthor_fw_post_reset() - Call after a reset.
+ * @ptdev: Device.
+ *
+ * Start the FW. If this is not a fast reset, all FW sections are reloaded to
+ * make sure we can recover from a memory corruption.
+ */
+int panthor_fw_post_reset(struct panthor_device *ptdev)
+{
+	int ret;
+
+	/* Make the MCU VM active. */
+	ret = panthor_vm_active(ptdev->fw->vm);
+	if (ret)
+		return ret;
+
+	/* Reload all sections, including RO ones. We're not supposed
+	 * to end up here anyway, let's just assume the overhead of
+	 * reloading everything is acceptable.
+	 */
+	if (!ptdev->fw->fast_reset)
+		panthor_reload_fw_sections(ptdev, true);
+
+	ret = panthor_fw_start(ptdev);
+	if (ret)
+		return ret;
+
+	/* We must re-initialize the global interface even on fast-reset. */
+	panthor_fw_init_global_iface(ptdev);
+	return 0;
+}
+
+/**
+ * panthor_fw_unplug() - Called when the device is unplugged.
+ * @ptdev: Device.
+ *
+ * This function must make sure all pending operations are flushed before
+ * will release device resources, thus preventing any interaction with
+ * the HW.
+ *
+ * If there are still FW-relates works running after this function returns,
+ * they must use drm_dev_{enter,exit}() and skip any HW access when
+ * drm_dev_enter() returns false.
+ */
+void panthor_fw_unplug(struct panthor_device *ptdev)
+{
+	struct panthor_fw_section *section;
+
+	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
+
+	/* Make sure the IRQ handler can be called after that point. */
+	if (ptdev->fw->irq.irq)
+		panthor_job_irq_suspend(&ptdev->fw->irq);
+
+	panthor_fw_stop(ptdev);
+
+	if (ptdev->fw->vm)
+		panthor_vm_idle(ptdev->fw->vm);
+
+	list_for_each_entry(section, &ptdev->fw->sections, node) {
+		panthor_fw_mem_free(ptdev, section->mem);
+	}
+
+	panthor_vm_put(ptdev->fw->vm);
+
+	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+}
+
+/**
+ * panthor_fw_wait_acks() - Wait for requests to be acknowledged by the FW.
+ * @req_ptr: Pointer to the req register.
+ * @ack_ptr: Pointer to the ack register.
+ * @wq: Wait queue to use for the sleeping wait.
+ * @req_mask: Mask of requests to wait for.
+ * @acked: Pointer to field that's updated with the acked requests.
+ * If the function returns 0, *acked == req_mask.
+ * @timeout_ms: Timeout expressed in milliseconds.
+ *
+ * Return: 0 on success, -ETIMEDOUT otherwise.
+ */
+static int panthor_fw_wait_acks(const u32 *req_ptr, const u32 *ack_ptr,
+				wait_queue_head_t *wq,
+				u32 req_mask, u32 *acked,
+				u32 timeout_ms)
+{
+	u32 ack, req = READ_ONCE(*req_ptr) & req_mask;
+	int ret;
+
+	/* Busy wait for a few µsecs before falling back to a sleeping wait. */
+	*acked = req_mask;
+	ret = read_poll_timeout_atomic(READ_ONCE, ack,
+				       (ack & req_mask) == req,
+				       0, 10, 0,
+				       *ack_ptr);
+	if (!ret)
+		return 0;
+
+	if (wait_event_timeout(*wq, (READ_ONCE(*ack_ptr) & req_mask) == req,
+			       msecs_to_jiffies(timeout_ms)))
+		return 0;
+
+	/* Check one last time, in case we were not woken up for some reason. */
+	ack = READ_ONCE(*ack_ptr);
+	if ((ack & req_mask) == req)
+		return 0;
+
+	*acked = ~(req ^ ack) & req_mask;
+	return -ETIMEDOUT;
+}
+
+/**
+ * panthor_fw_glb_wait_acks() - Wait for global requests to be acknowledged.
+ * @ptdev: Device.
+ * @req_mask: Mask of requests to wait for.
+ * @acked: Pointer to field that's updated with the acked requests.
+ * If the function returns 0, *acked == req_mask.
+ * @timeout_ms: Timeout expressed in milliseconds.
+ *
+ * Return: 0 on success, -ETIMEDOUT otherwise.
+ */
+int panthor_fw_glb_wait_acks(struct panthor_device *ptdev,
+			     u32 req_mask, u32 *acked,
+			     u32 timeout_ms)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	/* GLB_HALT doesn't get acked through the FW interface. */
+	if (drm_WARN_ON(&ptdev->base, req_mask & (~GLB_REQ_MASK | GLB_HALT)))
+		return -EINVAL;
+
+	return panthor_fw_wait_acks(&glb_iface->input->req,
+				    &glb_iface->output->ack,
+				    &ptdev->fw->waitqueues[31],
+				    req_mask, acked, timeout_ms);
+}
+
+/**
+ * panthor_fw_glb_wait_acks() - Wait for command stream group requests to be acknowledged.
+ * @ptdev: Device.
+ * @req_mask: Mask of requests to wait for.
+ * @acked: Pointer to field that's updated with the acked requests.
+ * If the function returns 0, *acked == req_mask.
+ * @timeout_ms: Timeout expressed in milliseconds.
+ *
+ * Return: 0 on success, -ETIMEDOUT otherwise.
+ */
+int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_slot,
+			     u32 req_mask, u32 *acked, u32 timeout_ms)
+{
+	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_slot);
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, req_mask & ~CSG_REQ_MASK))
+		return -EINVAL;
+
+	ret = panthor_fw_wait_acks(&csg_iface->input->req,
+				   &csg_iface->output->ack,
+				   &ptdev->fw->waitqueues[csg_slot],
+				   req_mask, acked, timeout_ms);
+
+	if (ret && (*acked & CSG_STATE_MASK) != CSG_STATE_MASK)
+		*acked &= ~CSG_STATE_MASK;
+
+	return ret;
+}
+
+/**
+ * panthor_fw_ring_csg_doorbells() - Ring command stream group doorbells.
+ * @ptdev: Device.
+ * @csg_mask: Bitmask encoding the command stream group doorbells to ring.
+ *
+ * This function is toggling bits in the doorbell_req and ringing the
+ * global doorbell. It doesn't require a user doorbell to be attached to
+ * the group.
+ */
+void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 csg_mask)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	panthor_fw_toggle_reqs(glb_iface, doorbell_req, doorbell_ack, csg_mask);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+static void panthor_fw_ping_work(struct work_struct *work)
+{
+	struct panthor_fw *fw = container_of(work, struct panthor_fw, watchdog.ping_work.work);
+	struct panthor_device *ptdev = fw->irq.ptdev;
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	u32 acked;
+	int ret;
+
+	if (panthor_device_reset_is_pending(ptdev))
+		return;
+
+	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PING);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+
+	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PING, &acked, 100);
+	if (ret) {
+		panthor_device_schedule_reset(ptdev);
+		drm_err(&ptdev->base, "FW ping timeout, scheduling a reset");
+	} else {
+		mod_delayed_work(ptdev->reset.wq, &fw->watchdog.ping_work,
+				 msecs_to_jiffies(PING_INTERVAL_MS));
+	}
+}
+
+/**
+ * panthor_fw_init() - Initialize FW related data.
+ * @ptdev: Device.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int panthor_fw_init(struct panthor_device *ptdev)
+{
+	struct panthor_fw *fw;
+	int ret, irq;
+
+	fw = drmm_kzalloc(&ptdev->base, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
+
+	ptdev->fw = fw;
+	for (u32 i = 0; i < ARRAY_SIZE(fw->waitqueues); i++)
+		init_waitqueue_head(&fw->waitqueues[i]);
+
+	INIT_LIST_HEAD(&fw->sections);
+	INIT_DELAYED_WORK(&fw->watchdog.ping_work, panthor_fw_ping_work);
+
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "job");
+	if (irq <= 0)
+		return -ENODEV;
+
+	ret = panthor_request_job_irq(ptdev, &fw->irq, irq, 0);
+	if (ret) {
+		drm_err(&ptdev->base, "failed to request job irq");
+		return ret;
+	}
+
+	ret = panthor_gpu_l2_power_on(ptdev);
+	if (ret)
+		return ret;
+
+	fw->vm = panthor_vm_create(ptdev, true,
+				   CSF_MCU_SHARED_REGION_START,
+				   CSF_MCU_SHARED_REGION_SIZE);
+	if (IS_ERR(fw->vm)) {
+		ret = PTR_ERR(fw->vm);
+		fw->vm = NULL;
+		goto err_unplug_fw;
+	}
+
+	ret = panthor_fw_load(ptdev);
+	if (ret)
+		goto err_unplug_fw;
+
+	ret = panthor_vm_active(fw->vm);
+	if (ret)
+		goto err_unplug_fw;
+
+	ret = panthor_fw_start(ptdev);
+	if (ret)
+		goto err_unplug_fw;
+
+	ret = panthor_fw_init_ifaces(ptdev);
+	if (ret)
+		goto err_unplug_fw;
+
+	panthor_fw_init_global_iface(ptdev);
+	return 0;
+
+err_unplug_fw:
+	panthor_fw_unplug(ptdev);
+	return ret;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
new file mode 100644
index 000000000000..929760c2a46b
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -0,0 +1,505 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2023 Collabora ltd. */
+
+#ifndef __PANTHOR_MCU_H__
+#define __PANTHOR_MCU_H__
+
+#include <linux/types.h>
+
+#include "panthor_device.h"
+
+struct panthor_fw_mem;
+
+#define MAX_CSGS				31
+#define MAX_CS_PER_CSG                          32
+
+struct panthor_fw_ringbuf_input_iface {
+	u64 insert;
+	u64 extract;
+} __packed;
+
+struct panthor_fw_ringbuf_output_iface {
+	u64 extract;
+	u32 active;
+} __packed;
+
+struct panthor_fw_cs_control_iface {
+#define CS_FEATURES_WORK_REGS(x)		(((x) & GENMASK(7, 0)) + 1)
+#define CS_FEATURES_SCOREBOARDS(x)		(((x) & GENMASK(15, 8)) >> 8)
+#define CS_FEATURES_COMPUTE			BIT(16)
+#define CS_FEATURES_FRAGMENT			BIT(17)
+#define CS_FEATURES_TILER			BIT(18)
+	u32 features;
+	u32 input_va;
+	u32 output_va;
+} __packed;
+
+struct panthor_fw_cs_input_iface {
+#define CS_STATE_MASK				GENMASK(2, 0)
+#define CS_STATE_STOP				0
+#define CS_STATE_START				1
+#define CS_EXTRACT_EVENT			BIT(4)
+#define CS_IDLE_SYNC_WAIT			BIT(8)
+#define CS_IDLE_PROTM_PENDING			BIT(9)
+#define CS_IDLE_EMPTY				BIT(10)
+#define CS_IDLE_RESOURCE_REQ			BIT(11)
+#define CS_TILER_OOM				BIT(26)
+#define CS_PROTM_PENDING			BIT(27)
+#define CS_FATAL				BIT(30)
+#define CS_FAULT				BIT(31)
+#define CS_REQ_MASK				(CS_STATE_MASK | \
+						 CS_EXTRACT_EVENT | \
+						 CS_IDLE_SYNC_WAIT | \
+						 CS_IDLE_PROTM_PENDING | \
+						 CS_IDLE_EMPTY | \
+						 CS_IDLE_RESOURCE_REQ)
+#define CS_EVT_MASK				(CS_TILER_OOM | \
+						 CS_PROTM_PENDING | \
+						 CS_FATAL | \
+						 CS_FAULT)
+	u32 req;
+
+#define CS_CONFIG_PRIORITY(x)			((x) & GENMASK(3, 0))
+#define CS_CONFIG_DOORBELL(x)			(((x) << 8) & GENMASK(15, 8))
+	u32 config;
+	u32 reserved1;
+	u32 ack_irq_mask;
+	u64 ringbuf_base;
+	u32 ringbuf_size;
+	u32 reserved2;
+	u64 heap_start;
+	u64 heap_end;
+	u64 ringbuf_input;
+	u64 ringbuf_output;
+	u32 instr_config;
+	u32 instrbuf_size;
+	u64 instrbuf_base;
+	u64 instrbuf_offset_ptr;
+} __packed;
+
+struct panthor_fw_cs_output_iface {
+	u32 ack;
+	u32 reserved1[15];
+	u64 status_cmd_ptr;
+
+#define CS_STATUS_WAIT_SB_MASK			GENMASK(15, 0)
+#define CS_STATUS_WAIT_SB_SRC_MASK		GENMASK(19, 16)
+#define CS_STATUS_WAIT_SB_SRC_NONE		(0 << 16)
+#define CS_STATUS_WAIT_SB_SRC_WAIT		(8 << 16)
+#define CS_STATUS_WAIT_SYNC_COND_LE		(0 << 24)
+#define CS_STATUS_WAIT_SYNC_COND_GT		(1 << 24)
+#define CS_STATUS_WAIT_SYNC_COND_MASK		GENMASK(27, 24)
+#define CS_STATUS_WAIT_PROGRESS			BIT(28)
+#define CS_STATUS_WAIT_PROTM			BIT(29)
+#define CS_STATUS_WAIT_SYNC_64B			BIT(30)
+#define CS_STATUS_WAIT_SYNC			BIT(31)
+	u32 status_wait;
+	u32 status_req_resource;
+	u64 status_wait_sync_ptr;
+	u32 status_wait_sync_value;
+	u32 status_scoreboards;
+
+#define CS_STATUS_BLOCKED_REASON_UNBLOCKED	0
+#define CS_STATUS_BLOCKED_REASON_SB_WAIT	1
+#define CS_STATUS_BLOCKED_REASON_PROGRESS_WAIT	2
+#define CS_STATUS_BLOCKED_REASON_SYNC_WAIT	3
+#define CS_STATUS_BLOCKED_REASON_DEFERRED	5
+#define CS_STATUS_BLOCKED_REASON_RES		6
+#define CS_STATUS_BLOCKED_REASON_FLUSH		7
+#define CS_STATUS_BLOCKED_REASON_MASK		GENMASK(3, 0)
+	u32 status_blocked_reason;
+	u32 status_wait_sync_value_hi;
+	u32 reserved2[6];
+
+#define CS_EXCEPTION_TYPE(x)			((x) & GENMASK(7, 0))
+#define CS_EXCEPTION_DATA(x)			(((x) >> 8) & GENMASK(23, 0))
+	u32 fault;
+	u32 fatal;
+	u64 fault_info;
+	u64 fatal_info;
+	u32 reserved3[10];
+	u32 heap_vt_start;
+	u32 heap_vt_end;
+	u32 reserved4;
+	u32 heap_frag_end;
+	u64 heap_address;
+} __packed;
+
+struct panthor_fw_csg_control_iface {
+	u32 features;
+	u32 input_va;
+	u32 output_va;
+	u32 suspend_size;
+	u32 protm_suspend_size;
+	u32 stream_num;
+	u32 stream_stride;
+} __packed;
+
+struct panthor_fw_csg_input_iface {
+#define CSG_STATE_MASK				GENMASK(2, 0)
+#define CSG_STATE_TERMINATE			0
+#define CSG_STATE_START				1
+#define CSG_STATE_SUSPEND			2
+#define CSG_STATE_RESUME			3
+#define CSG_ENDPOINT_CONFIG			BIT(4)
+#define CSG_STATUS_UPDATE			BIT(5)
+#define CSG_SYNC_UPDATE				BIT(28)
+#define CSG_IDLE				BIT(29)
+#define CSG_DOORBELL				BIT(30)
+#define CSG_PROGRESS_TIMER_EVENT		BIT(31)
+#define CSG_REQ_MASK				(CSG_STATE_MASK | \
+						 CSG_ENDPOINT_CONFIG | \
+						 CSG_STATUS_UPDATE)
+#define CSG_EVT_MASK				(CSG_SYNC_UPDATE | \
+						 CSG_IDLE | \
+						 CSG_PROGRESS_TIMER_EVENT)
+	u32 req;
+	u32 ack_irq_mask;
+
+	u32 doorbell_req;
+	u32 cs_irq_ack;
+	u32 reserved1[4];
+	u64 allow_compute;
+	u64 allow_fragment;
+	u32 allow_other;
+
+#define CSG_EP_REQ_COMPUTE(x)			((x) & GENMASK(7, 0))
+#define CSG_EP_REQ_FRAGMENT(x)			(((x) << 8) & GENMASK(15, 8))
+#define CSG_EP_REQ_TILER(x)			(((x) << 16) & GENMASK(19, 16))
+#define CSG_EP_REQ_EXCL_COMPUTE			BIT(20)
+#define CSG_EP_REQ_EXCL_FRAGMENT		BIT(21)
+#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & GENMASK(31, 28))
+#define CSG_EP_REQ_PRIORITY_MASK		GENMASK(31, 28)
+	u32 endpoint_req;
+	u32 reserved2[2];
+	u64 suspend_buf;
+	u64 protm_suspend_buf;
+	u32 config;
+	u32 iter_trace_config;
+} __packed;
+
+struct panthor_fw_csg_output_iface {
+	u32 ack;
+	u32 reserved1;
+	u32 doorbell_ack;
+	u32 cs_irq_req;
+	u32 status_endpoint_current;
+	u32 status_endpoint_req;
+
+#define CSG_STATUS_STATE_IS_IDLE		BIT(0)
+	u32 status_state;
+	u32 resource_dep;
+} __packed;
+
+struct panthor_fw_global_control_iface {
+	u32 version;
+	u32 features;
+	u32 input_va;
+	u32 output_va;
+	u32 group_num;
+	u32 group_stride;
+	u32 perfcnt_size;
+	u32 instr_features;
+} __packed;
+
+struct panthor_fw_global_input_iface {
+#define GLB_HALT				BIT(0)
+#define GLB_CFG_PROGRESS_TIMER			BIT(1)
+#define GLB_CFG_ALLOC_EN			BIT(2)
+#define GLB_CFG_POWEROFF_TIMER			BIT(3)
+#define GLB_PROTM_ENTER				BIT(4)
+#define GLB_PERFCNT_EN				BIT(5)
+#define GLB_PERFCNT_SAMPLER			BIT(6)
+#define GLB_COUNTER_EN				BIT(7)
+#define GLB_PING				BIT(8)
+#define GLB_FWCFG_UPDATE			BIT(9)
+#define GLB_IDLE_EN				BIT(10)
+#define GLB_SLEEP				BIT(12)
+#define GLB_INACTIVE_COMPUTE			BIT(20)
+#define GLB_INACTIVE_FRAGMENT			BIT(21)
+#define GLB_INACTIVE_TILER			BIT(22)
+#define GLB_PROTM_EXIT				BIT(23)
+#define GLB_PERFCNT_THRESHOLD			BIT(24)
+#define GLB_PERFCNT_OVERFLOW			BIT(25)
+#define GLB_IDLE				BIT(26)
+#define GLB_DBG_CSF				BIT(30)
+#define GLB_DBG_HOST				BIT(31)
+#define GLB_REQ_MASK				GENMASK(10, 0)
+#define GLB_EVT_MASK				GENMASK(26, 20)
+	u32 req;
+	u32 ack_irq_mask;
+	u32 doorbell_req;
+	u32 reserved1;
+	u32 progress_timer;
+
+#define GLB_TIMER_VAL(x)			((x) & GENMASK(30, 0))
+#define GLB_TIMER_SOURCE_GPU_COUNTER		BIT(31)
+	u32 poweroff_timer;
+	u64 core_en_mask;
+	u32 reserved2;
+	u32 perfcnt_as;
+	u64 perfcnt_base;
+	u32 perfcnt_extract;
+	u32 reserved3[3];
+	u32 perfcnt_config;
+	u32 perfcnt_csg_select;
+	u32 perfcnt_fw_enable;
+	u32 perfcnt_csg_enable;
+	u32 perfcnt_csf_enable;
+	u32 perfcnt_shader_enable;
+	u32 perfcnt_tiler_enable;
+	u32 perfcnt_mmu_l2_enable;
+	u32 reserved4[8];
+	u32 idle_timer;
+} __packed;
+
+enum panthor_fw_halt_status {
+	PANTHOR_FW_HALT_OK = 0,
+	PANTHOR_FW_HALT_ON_PANIC = 0x4e,
+	PANTHOR_FW_HALT_ON_WATCHDOG_EXPIRATION = 0x4f,
+};
+
+struct panthor_fw_global_output_iface {
+	u32 ack;
+	u32 reserved1;
+	u32 doorbell_ack;
+	u32 reserved2;
+	u32 halt_status;
+	u32 perfcnt_status;
+	u32 perfcnt_insert;
+} __packed;
+
+/**
+ * struct panthor_fw_cs_iface - Firmware command stream slot interface
+ */
+struct panthor_fw_cs_iface {
+	/**
+	 * @lock: Lock protecting access to the panthor_fw_cs_input_iface::req
+	 * field.
+	 *
+	 * Needed so we can update the req field concurrently from the interrupt
+	 * handler and the scheduler logic.
+	 *
+	 * TODO: Ideally we'd want to use a cmpxchg() to update the req, but FW
+	 * interface sections are mapped uncached/write-combined right now, and
+	 * using cmpxchg() on such mappings leads to SError faults. Revisit when
+	 * we have 'SHARED' GPU mappings hooked up.
+	 */
+	spinlock_t lock;
+
+	/**
+	 * @control: Command stream slot control interface.
+	 *
+	 * Used to expose command stream slot properties.
+	 *
+	 * This interface is read-only.
+	 */
+	struct panthor_fw_cs_control_iface *control;
+
+	/**
+	 * @input: Command stream slot input interface.
+	 *
+	 * Used for host updates/events.
+	 */
+	struct panthor_fw_cs_input_iface *input;
+
+	/**
+	 * @output: Command stream slot output interface.
+	 *
+	 * Used for FW updates/events.
+	 *
+	 * This interface is read-only.
+	 */
+	const struct panthor_fw_cs_output_iface *output;
+};
+
+/**
+ * struct panthor_fw_csg_iface - Firmware command stream group slot interface
+ */
+struct panthor_fw_csg_iface {
+	/**
+	 * @lock: Lock protecting access to the panthor_fw_csg_input_iface::req
+	 * field.
+	 *
+	 * Needed so we can update the req field concurrently from the interrupt
+	 * handler and the scheduler logic.
+	 *
+	 * TODO: Ideally we'd want to use a cmpxchg() to update the req, but FW
+	 * interface sections are mapped uncached/write-combined right now, and
+	 * using cmpxchg() on such mappings leads to SError faults. Revisit when
+	 * we have 'SHARED' GPU mappings hooked up.
+	 */
+	spinlock_t lock;
+
+	/**
+	 * @control: Command stream group slot control interface.
+	 *
+	 * Used to expose command stream group slot properties.
+	 *
+	 * This interface is read-only.
+	 */
+	const struct panthor_fw_csg_control_iface *control;
+
+	/**
+	 * @input: Command stream slot input interface.
+	 *
+	 * Used for host updates/events.
+	 */
+	struct panthor_fw_csg_input_iface *input;
+
+	/**
+	 * @output: Command stream group slot output interface.
+	 *
+	 * Used for FW updates/events.
+	 *
+	 * This interface is read-only.
+	 */
+	const struct panthor_fw_csg_output_iface *output;
+};
+
+/**
+ * struct panthor_fw_global_iface - Firmware global interface
+ */
+struct panthor_fw_global_iface {
+	/**
+	 * @lock: Lock protecting access to the panthor_fw_global_input_iface::req
+	 * field.
+	 *
+	 * Needed so we can update the req field concurrently from the interrupt
+	 * handler and the scheduler/FW management logic.
+	 *
+	 * TODO: Ideally we'd want to use a cmpxchg() to update the req, but FW
+	 * interface sections are mapped uncached/write-combined right now, and
+	 * using cmpxchg() on such mappings leads to SError faults. Revisit when
+	 * we have 'SHARED' GPU mappings hooked up.
+	 */
+	spinlock_t lock;
+
+	/**
+	 * @control: Command stream group slot control interface.
+	 *
+	 * Used to expose global FW properties.
+	 *
+	 * This interface is read-only.
+	 */
+	const struct panthor_fw_global_control_iface *control;
+
+	/**
+	 * @input: Global input interface.
+	 *
+	 * Used for host updates/events.
+	 */
+	struct panthor_fw_global_input_iface *input;
+
+	/**
+	 * @output: Global output interface.
+	 *
+	 * Used for FW updates/events.
+	 *
+	 * This interface is read-only.
+	 */
+	const struct panthor_fw_global_output_iface *output;
+};
+
+/**
+ * panthor_fw_toggle_reqs() - Toggle acknowledge bits to send an event to the FW
+ * @__iface: The interface to operate on.
+ * @__in_reg: Name of the register to update in the input section of the interface.
+ * @__out_reg: Name of the register to take as a reference in the output section of the
+ * interface.
+ * @__mask: Mask to apply to the update.
+ *
+ * The Host -> FW event/message passing was designed to be lockless, with each side of
+ * the channel having its writeable section. Events are signaled as a difference between
+ * the host and FW side in the req/ack registers (when a bit differs, there's an event
+ * pending, when they are the same, nothing needs attention).
+ *
+ * This helper allows one to update the req register based on the current value of the
+ * ack register managed by the FW. Toggling a specific bit will flag an event. In order
+ * for events to be re-evaluated, the interface doorbell needs to be rung.
+ *
+ * Concurrent accesses to the same req register is covered.
+ *
+ * Anything requiring atomic updates to multiple registers requires a dedicated lock.
+ */
+#define panthor_fw_toggle_reqs(__iface, __in_reg, __out_reg, __mask) \
+	do { \
+		u32 __cur_val, __new_val, __out_val; \
+		spin_lock(&(__iface)->lock); \
+		__cur_val = READ_ONCE((__iface)->input->__in_reg); \
+		__out_val = READ_ONCE((__iface)->output->__out_reg); \
+		__new_val = ((__out_val ^ (__mask)) & (__mask)) | (__cur_val & ~(__mask)); \
+		WRITE_ONCE((__iface)->input->__in_reg, __new_val); \
+		spin_unlock(&(__iface)->lock); \
+	} while (0)
+
+/**
+ * panthor_fw_update_reqs() - Update bits to reflect a configuration change
+ * @__iface: The interface to operate on.
+ * @__in_reg: Name of the register to update in the input section of the interface.
+ * @__val: Value to set.
+ * @__mask: Mask to apply to the update.
+ *
+ * Some configuration get passed through req registers that are also used to
+ * send events to the FW. Those req registers being updated from the interrupt
+ * handler, they require special helpers to update the configuration part as well.
+ *
+ * Concurrent accesses to the same req register is covered.
+ *
+ * Anything requiring atomic updates to multiple registers requires a dedicated lock.
+ */
+#define panthor_fw_update_reqs(__iface, __in_reg, __val, __mask) \
+	do { \
+		u32 __cur_val, __new_val; \
+		spin_lock(&(__iface)->lock); \
+		__cur_val = READ_ONCE((__iface)->input->__in_reg); \
+		__new_val = (__cur_val & ~(__mask)) | ((__val) & (__mask)); \
+		WRITE_ONCE((__iface)->input->__in_reg, __new_val); \
+		spin_unlock(&(__iface)->lock); \
+	} while (0)
+
+struct panthor_fw_global_iface *
+panthor_fw_get_glb_iface(struct panthor_device *ptdev);
+
+struct panthor_fw_csg_iface *
+panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot);
+
+struct panthor_fw_cs_iface *
+panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot);
+
+int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_mask,
+			     u32 *acked, u32 timeout_ms);
+
+int panthor_fw_glb_wait_acks(struct panthor_device *ptdev, u32 req_mask, u32 *acked,
+			     u32 timeout_ms);
+
+void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 csg_slot);
+
+void panthor_fw_mem_vunmap(struct panthor_fw_mem *mem);
+void *panthor_fw_mem_vmap(struct panthor_fw_mem *mem);
+u64 panthor_fw_mem_va(struct panthor_fw_mem *mem);
+void panthor_fw_mem_free(struct panthor_device *ptdev, struct panthor_fw_mem *mem);
+struct panthor_fw_mem *
+panthor_fw_alloc_queue_iface_mem(struct panthor_device *ptdev,
+				 struct panthor_fw_ringbuf_input_iface **input,
+				 const struct panthor_fw_ringbuf_output_iface **output);
+struct panthor_fw_mem *
+panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size);
+
+void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang);
+int panthor_fw_post_reset(struct panthor_device *ptdev);
+
+static inline void panthor_fw_suspend(struct panthor_device *ptdev)
+{
+	panthor_fw_pre_reset(ptdev, false);
+}
+
+static inline int panthor_fw_resume(struct panthor_device *ptdev)
+{
+	return panthor_fw_post_reset(ptdev);
+}
+
+int panthor_fw_init(struct panthor_device *ptdev);
+void panthor_fw_unplug(struct panthor_device *ptdev);
+
+#endif
-- 
2.41.0

