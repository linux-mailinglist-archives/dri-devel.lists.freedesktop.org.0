Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342C838BCB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C01B10EF8F;
	Tue, 23 Jan 2024 10:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9076D10E76E;
 Tue, 23 Jan 2024 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005720; x=1737541720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n4+XRlJHH5zo+uYkumOFO8e/6+ofc8haCBHkcQbZxOs=;
 b=hxrFT01n1B9PyBSqkihvFOmeixhxKhmn7pDjMQPYQZ4mAkSlyjOlZfzC
 4ANFr8/xXIcPuFda14vUhtW+KMDYRDdzwFZK+TW2rHQdQSmW+w5yaxy+W
 OeUkVVnW7U6Lcf1C4+31Oqg3NQSEldayy0OdlvLrLHvt9VEYanvDr6IMb
 EwrPUxtG2Nrm0W2MOVQ70lFIJjMq673HvWGz6DZ7eUapxwXWo/7HiCslP
 egCsSkm6vz5k9XQqRek7ce082jPa8qdg8rfS9mrHAtbVTJpC58EECo1x8
 UFxRISEtvZGKHWsyk5Gfp5FxadVuqJXJhwopVInQunv18ed5DJf1MMV1I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134110"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134110"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283365"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283365"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:38 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/19] drm/dp: Add support for DP tunneling
Date: Tue, 23 Jan 2024 12:28:33 +0200
Message-Id: <20240123102850.390126-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Display Port DP tunneling. For now this includes the
support for Bandwidth Allocation Mode, leaving adding Panel Replay
support for later.

BWA allows using displays that share the same (Thunderbolt) link with
their maximum resolution. Atm, this may not be possible due to the
coarse granularity of partitioning the link BW among the displays on the
link: the BW allocation policy is in a SW/FW/HW component on the link
(on Thunderbolt it's the SW or FW Connection Manager), independent of
the driver. This policy will set the DPRX maximum rate and lane count
DPCD registers the GFX driver will see (0x00000, 0x00001, 0x02200,
0x02201) based on the available link BW.

The granularity of the current BW allocation policy is course, based on
the required link rate in the 1.62Gbs..8.1Gbps range and it may prevent
using higher resolutions all together: the display connected first will
get a share of the link BW which corresponds to its full DPRX capability
(regardless of the actual mode it uses). A subsequent display connected
will only get the remaining BW, which could be well below its full
capability.

BWA solves the above course granularity (reducing it to a 250Mbs..1Gps
range) and first-come/first-served issues by letting the driver request
the BW for each display on a link which reflects the actual modes the
displays use.

This patch adds the DRM core helper functions, while a follow-up change
in the patchset takes them into use in the i915 driver.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/Kconfig         |   17 +
 drivers/gpu/drm/display/Makefile        |    2 +
 drivers/gpu/drm/display/drm_dp_tunnel.c | 1715 +++++++++++++++++++++++
 include/drm/display/drm_dp.h            |   60 +
 include/drm/display/drm_dp_tunnel.h     |  270 ++++
 5 files changed, 2064 insertions(+)
 create mode 100644 drivers/gpu/drm/display/drm_dp_tunnel.c
 create mode 100644 include/drm/display/drm_dp_tunnel.h

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 09712b88a5b83..b024a84b94c1c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -17,6 +17,23 @@ config DRM_DISPLAY_DP_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
+config DRM_DISPLAY_DP_TUNNEL
+	bool
+	select DRM_DISPLAY_DP_HELPER
+	help
+	  Enable support for DisplayPort tunnels.
+
+config DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+	bool "Enable debugging the DP tunnel state"
+	depends on REF_TRACKER
+	depends on DRM_DISPLAY_DP_TUNNEL
+	depends on DEBUG_KERNEL
+	depends on EXPERT
+	help
+	  Enables debugging the DP tunnel manager's status.
+
+	  If in doubt, say "N".
+
 config DRM_DISPLAY_HDCP_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 17ac4a1006a80..7ca61333c6696 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -8,6 +8,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_helper.o \
 	drm_dp_mst_topology.o \
 	drm_dsc_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
+	drm_dp_tunnel.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
new file mode 100644
index 0000000000000..58f6330db7d9d
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -0,0 +1,1715 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/ref_tracker.h>
+#include <linux/types.h>
+
+#include <drm/drm_atomic_state_helper.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_print.h>
+#include <drm/display/drm_dp.h>
+#include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dp_tunnel.h>
+
+#define to_group(__private_obj) \
+	container_of(__private_obj, struct drm_dp_tunnel_group, base)
+
+#define to_group_state(__private_state) \
+	container_of(__private_state, struct drm_dp_tunnel_group_state, base)
+
+#define is_dp_tunnel_private_obj(__obj) \
+	((__obj)->funcs == &tunnel_group_funcs)
+
+#define for_each_new_group_in_state(__state, __new_group_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_private_objs; \
+	     (__i)++) \
+		for_each_if ((__state)->private_objs[__i].ptr && \
+			     is_dp_tunnel_private_obj((__state)->private_objs[__i].ptr) && \
+			     ((__new_group_state) = \
+				to_group_state((__state)->private_objs[__i].new_state), 1))
+
+#define for_each_old_group_in_state(__state, __old_group_state, __i) \
+	for ((__i) = 0; \
+	     (__i) < (__state)->num_private_objs; \
+	     (__i)++) \
+		for_each_if ((__state)->private_objs[__i].ptr && \
+			     is_dp_tunnel_private_obj((__state)->private_objs[__i].ptr) && \
+			     ((__old_group_state) = \
+				to_group_state((__state)->private_objs[__i].old_state), 1))
+
+#define for_each_tunnel_in_group(__group, __tunnel) \
+	list_for_each_entry(__tunnel, &(__group)->tunnels, node)
+
+#define for_each_tunnel_state(__group_state, __tunnel_state) \
+	list_for_each_entry(__tunnel_state, &(__group_state)->tunnel_states, node)
+
+#define for_each_tunnel_state_safe(__group_state, __tunnel_state, __tunnel_state_tmp) \
+	list_for_each_entry_safe(__tunnel_state, __tunnel_state_tmp, \
+				 &(__group_state)->tunnel_states, node)
+
+#define kbytes_to_mbits(__kbytes) \
+	DIV_ROUND_UP((__kbytes) * 8, 1000)
+
+#define DPTUN_BW_ARG(__bw) ((__bw) < 0 ? (__bw) : kbytes_to_mbits(__bw))
+
+#define __tun_prn(__tunnel, __level, __type, __fmt, ...) \
+	drm_##__level##__type((__tunnel)->group->mgr->dev, \
+			      "[DPTUN %s][%s] " __fmt, \
+			      drm_dp_tunnel_name(__tunnel), \
+			      (__tunnel)->aux->name, ## \
+			      __VA_ARGS__)
+
+#define tun_dbg(__tunnel, __fmt, ...) \
+	__tun_prn(__tunnel, dbg, _kms, __fmt, ## __VA_ARGS__)
+
+#define tun_dbg_stat(__tunnel, __err, __fmt, ...) do { \
+	if (__err) \
+		__tun_prn(__tunnel, dbg, _kms, __fmt " (Failed, err: %pe)\n", \
+			  ## __VA_ARGS__, ERR_PTR(__err)); \
+	else \
+		__tun_prn(__tunnel, dbg, _kms, __fmt " (Ok)\n", \
+			  ## __VA_ARGS__); \
+} while (0)
+
+#define tun_dbg_atomic(__tunnel, __fmt, ...) \
+	__tun_prn(__tunnel, dbg, _atomic, __fmt, ## __VA_ARGS__)
+
+#define tun_grp_dbg(__group, __fmt, ...) \
+	drm_dbg_kms((__group)->mgr->dev, \
+		    "[DPTUN %s] " __fmt, \
+		    drm_dp_tunnel_group_name(__group), ## \
+		    __VA_ARGS__)
+
+#define DP_TUNNELING_BASE DP_TUNNELING_OUI
+
+#define __DPTUN_REG_RANGE(start, size) \
+	GENMASK_ULL(start + size - 1, start)
+
+#define DPTUN_REG_RANGE(addr, size) \
+	__DPTUN_REG_RANGE((addr) - DP_TUNNELING_BASE, size)
+
+#define DPTUN_REG(addr) DPTUN_REG_RANGE(addr, 1)
+
+#define DPTUN_INFO_REG_MASK ( \
+	DPTUN_REG_RANGE(DP_TUNNELING_OUI, DP_TUNNELING_OUI_BYTES) | \
+	DPTUN_REG_RANGE(DP_TUNNELING_DEV_ID, DP_TUNNELING_DEV_ID_BYTES) | \
+	DPTUN_REG(DP_TUNNELING_HW_REV) | \
+	DPTUN_REG(DP_TUNNELING_SW_REV_MAJOR) | \
+	DPTUN_REG(DP_TUNNELING_SW_REV_MINOR) | \
+	DPTUN_REG(DP_TUNNELING_CAPABILITIES) | \
+	DPTUN_REG(DP_IN_ADAPTER_INFO) | \
+	DPTUN_REG(DP_USB4_DRIVER_ID) | \
+	DPTUN_REG(DP_USB4_DRIVER_BW_CAPABILITY) | \
+	DPTUN_REG(DP_IN_ADAPTER_TUNNEL_INFORMATION) | \
+	DPTUN_REG(DP_BW_GRANULARITY) | \
+	DPTUN_REG(DP_ESTIMATED_BW) | \
+	DPTUN_REG(DP_ALLOCATED_BW) | \
+	DPTUN_REG(DP_TUNNELING_MAX_LINK_RATE) | \
+	DPTUN_REG(DP_TUNNELING_MAX_LANE_COUNT) | \
+	DPTUN_REG(DP_DPTX_BW_ALLOCATION_MODE_CONTROL))
+
+static const DECLARE_BITMAP(dptun_info_regs, 64) = {
+	DPTUN_INFO_REG_MASK & -1UL,
+#if BITS_PER_LONG == 32
+	DPTUN_INFO_REG_MASK >> 32,
+#endif
+};
+
+struct drm_dp_tunnel_regs {
+	u8 buf[HWEIGHT64(DPTUN_INFO_REG_MASK)];
+};
+
+struct drm_dp_tunnel_group;
+
+struct drm_dp_tunnel {
+	struct drm_dp_tunnel_group *group;
+
+	struct list_head node;
+
+	struct kref kref;
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+	struct ref_tracker *tracker;
+#endif
+	struct drm_dp_aux *aux;
+	char name[8];
+
+	int bw_granularity;
+	int estimated_bw;
+	int allocated_bw;
+
+	int max_dprx_rate;
+	u8 max_dprx_lane_count;
+
+	u8 adapter_id;
+
+	bool bw_alloc_supported:1;
+	bool bw_alloc_enabled:1;
+	bool has_io_error:1;
+	bool destroyed:1;
+};
+
+struct drm_dp_tunnel_group_state;
+
+struct drm_dp_tunnel_state {
+	struct drm_dp_tunnel_group_state *group_state;
+
+	struct drm_dp_tunnel_ref tunnel_ref;
+
+	struct list_head node;
+
+	u32 stream_mask;
+	int *stream_bw;
+};
+
+struct drm_dp_tunnel_group_state {
+	struct drm_private_state base;
+
+	struct list_head tunnel_states;
+};
+
+struct drm_dp_tunnel_group {
+	struct drm_private_obj base;
+	struct drm_dp_tunnel_mgr *mgr;
+
+	struct list_head tunnels;
+
+	int available_bw;	/* available BW including the allocated_bw of all tunnels */
+	int drv_group_id;
+
+	char name[8];
+
+	bool active:1;
+};
+
+struct drm_dp_tunnel_mgr {
+	struct drm_device *dev;
+
+	int group_count;
+	struct drm_dp_tunnel_group *groups;
+	wait_queue_head_t bw_req_queue;
+
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+	struct ref_tracker_dir ref_tracker;
+#endif
+};
+
+static int next_reg_area(int *offset)
+{
+	*offset = find_next_bit(dptun_info_regs, 64, *offset);
+
+	return find_next_zero_bit(dptun_info_regs, 64, *offset + 1) - *offset;
+}
+
+#define tunnel_reg_ptr(__regs, __address) ({ \
+	WARN_ON(!test_bit((__address) - DP_TUNNELING_BASE, dptun_info_regs)); \
+	&(__regs)->buf[bitmap_weight(dptun_info_regs, (__address) - DP_TUNNELING_BASE)]; \
+})
+
+static int read_tunnel_regs(struct drm_dp_aux *aux, struct drm_dp_tunnel_regs *regs)
+{
+	int offset = 0;
+	int len;
+
+	while ((len = next_reg_area(&offset))) {
+		int address = DP_TUNNELING_BASE + offset;
+
+		if (drm_dp_dpcd_read(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
+			return -EIO;
+
+		offset += len;
+	}
+
+	return 0;
+}
+
+static u8 tunnel_reg(const struct drm_dp_tunnel_regs *regs, int address)
+{
+	return *tunnel_reg_ptr(regs, address);
+}
+
+static int tunnel_reg_drv_group_id(const struct drm_dp_tunnel_regs *regs)
+{
+	int drv_id = tunnel_reg(regs, DP_USB4_DRIVER_ID) & DP_USB4_DRIVER_ID_MASK;
+	int group_id = tunnel_reg(regs, DP_IN_ADAPTER_TUNNEL_INFORMATION) & DP_GROUP_ID_MASK;
+
+	if (!group_id)
+		return 0;
+
+	return (drv_id << DP_GROUP_ID_BITS) | group_id;
+}
+
+/* Return granularity in kB/s units */
+static int tunnel_reg_bw_granularity(const struct drm_dp_tunnel_regs *regs)
+{
+	int gr = tunnel_reg(regs, DP_BW_GRANULARITY) & DP_BW_GRANULARITY_MASK;
+
+	WARN_ON(gr > 2);
+
+	return (250000 << gr) / 8;
+}
+
+static int tunnel_reg_max_dprx_rate(const struct drm_dp_tunnel_regs *regs)
+{
+	u8 bw_code = tunnel_reg(regs, DP_TUNNELING_MAX_LINK_RATE);
+
+	return drm_dp_bw_code_to_link_rate(bw_code);
+}
+
+static int tunnel_reg_max_dprx_lane_count(const struct drm_dp_tunnel_regs *regs)
+{
+	u8 lane_count = tunnel_reg(regs, DP_TUNNELING_MAX_LANE_COUNT) &
+			DP_TUNNELING_MAX_LANE_COUNT_MASK;
+
+	return lane_count;
+}
+
+static bool tunnel_reg_bw_alloc_supported(const struct drm_dp_tunnel_regs *regs)
+{
+	u8 cap_mask = DP_TUNNELING_SUPPORT | DP_IN_BW_ALLOCATION_MODE_SUPPORT;
+
+	if ((tunnel_reg(regs, DP_TUNNELING_CAPABILITIES) & cap_mask) != cap_mask)
+		return false;
+
+	return tunnel_reg(regs, DP_USB4_DRIVER_BW_CAPABILITY) &
+	       DP_USB4_DRIVER_BW_ALLOCATION_MODE_SUPPORT;
+}
+
+static bool tunnel_reg_bw_alloc_enabled(const struct drm_dp_tunnel_regs *regs)
+{
+	return tunnel_reg(regs, DP_DPTX_BW_ALLOCATION_MODE_CONTROL) &
+		DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE;
+}
+
+static int tunnel_group_drv_id(int drv_group_id)
+{
+	return drv_group_id >> DP_GROUP_ID_BITS;
+}
+
+static int tunnel_group_id(int drv_group_id)
+{
+	return drv_group_id & DP_GROUP_ID_MASK;
+}
+
+const char *drm_dp_tunnel_name(const struct drm_dp_tunnel *tunnel)
+{
+	return tunnel->name;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_name);
+
+static const char *drm_dp_tunnel_group_name(const struct drm_dp_tunnel_group *group)
+{
+	return group->name;
+}
+
+static struct drm_dp_tunnel_group *
+lookup_or_alloc_group(struct drm_dp_tunnel_mgr *mgr, int drv_group_id)
+{
+	struct drm_dp_tunnel_group *group = NULL;
+	int i;
+
+	for (i = 0; i < mgr->group_count; i++) {
+		/*
+		 * A tunnel group with 0 group ID shouldn't have more than one
+		 * tunnels.
+		 */
+		if (tunnel_group_id(drv_group_id) &&
+		    mgr->groups[i].drv_group_id == drv_group_id)
+			return &mgr->groups[i];
+
+		if (!group && !mgr->groups[i].active)
+			group = &mgr->groups[i];
+	}
+
+	if (!group) {
+		drm_dbg_kms(mgr->dev,
+			    "DPTUN: Can't allocate more tunnel groups\n");
+		return NULL;
+	}
+
+	group->drv_group_id = drv_group_id;
+	group->active = true;
+
+	snprintf(group->name, sizeof(group->name), "%d:%d:*",
+		 tunnel_group_drv_id(drv_group_id) & ((1 << DP_GROUP_ID_BITS) - 1),
+		 tunnel_group_id(drv_group_id) & ((1 << DP_USB4_DRIVER_ID_BITS) - 1));
+
+	return group;
+}
+
+static void free_group(struct drm_dp_tunnel_group *group)
+{
+	struct drm_dp_tunnel_mgr *mgr = group->mgr;
+
+	if (drm_WARN_ON(mgr->dev, !list_empty(&group->tunnels)))
+		return;
+
+	group->drv_group_id = 0;
+	group->available_bw = -1;
+	group->active = false;
+}
+
+static struct drm_dp_tunnel *
+tunnel_get(struct drm_dp_tunnel *tunnel)
+{
+	kref_get(&tunnel->kref);
+
+	return tunnel;
+}
+
+static void free_tunnel(struct kref *kref)
+{
+	struct drm_dp_tunnel *tunnel = container_of(kref, typeof(*tunnel), kref);
+	struct drm_dp_tunnel_group *group = tunnel->group;
+
+	list_del(&tunnel->node);
+	if (list_empty(&group->tunnels))
+		free_group(group);
+
+	kfree(tunnel);
+}
+
+static void tunnel_put(struct drm_dp_tunnel *tunnel)
+{
+	kref_put(&tunnel->kref, free_tunnel);
+}
+
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+static void track_tunnel_ref(struct drm_dp_tunnel *tunnel,
+			     struct ref_tracker **tracker)
+{
+	ref_tracker_alloc(&tunnel->group->mgr->ref_tracker,
+			  tracker, GFP_KERNEL);
+}
+
+static void untrack_tunnel_ref(struct drm_dp_tunnel *tunnel,
+			       struct ref_tracker **tracker)
+{
+	ref_tracker_free(&tunnel->group->mgr->ref_tracker,
+			 tracker);
+}
+
+struct drm_dp_tunnel *
+drm_dp_tunnel_get_untracked(struct drm_dp_tunnel *tunnel)
+{
+	track_tunnel_ref(tunnel, NULL);
+
+	return tunnel_get(tunnel);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_get_untracked);
+
+void drm_dp_tunnel_put_untracked(struct drm_dp_tunnel *tunnel)
+{
+	tunnel_put(tunnel);
+	untrack_tunnel_ref(tunnel, NULL);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_put_untracked);
+
+struct drm_dp_tunnel *
+drm_dp_tunnel_get(struct drm_dp_tunnel *tunnel,
+		    struct ref_tracker **tracker)
+{
+	track_tunnel_ref(tunnel, tracker);
+
+	return tunnel_get(tunnel);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_get);
+
+void drm_dp_tunnel_put(struct drm_dp_tunnel *tunnel,
+			 struct ref_tracker **tracker)
+{
+	untrack_tunnel_ref(tunnel, tracker);
+	tunnel_put(tunnel);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_put);
+#else
+#define track_tunnel_ref(tunnel, tracker) do {} while (0)
+#define untrack_tunnel_ref(tunnel, tracker) do {} while (0)
+
+struct drm_dp_tunnel *
+drm_dp_tunnel_get_untracked(struct drm_dp_tunnel *tunnel)
+{
+	return tunnel_get(tunnel);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_get_untracked);
+
+void drm_dp_tunnel_put_untracked(struct drm_dp_tunnel *tunnel)
+{
+	tunnel_put(tunnel);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_put_untracked);
+#endif
+
+static bool add_tunnel_to_group(struct drm_dp_tunnel_mgr *mgr,
+				int drv_group_id,
+				struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_group *group =
+		lookup_or_alloc_group(mgr, drv_group_id);
+
+	if (!group)
+		return false;
+
+	tunnel->group = group;
+	list_add(&tunnel->node, &group->tunnels);
+
+	return true;
+}
+
+static struct drm_dp_tunnel *
+create_tunnel(struct drm_dp_tunnel_mgr *mgr,
+	      struct drm_dp_aux *aux,
+	      const struct drm_dp_tunnel_regs *regs)
+{
+	int drv_group_id = tunnel_reg_drv_group_id(regs);
+	struct drm_dp_tunnel *tunnel;
+
+	tunnel = kzalloc(sizeof(*tunnel), GFP_KERNEL);
+	if (!tunnel)
+		return NULL;
+
+	INIT_LIST_HEAD(&tunnel->node);
+
+	kref_init(&tunnel->kref);
+
+	tunnel->aux = aux;
+
+	tunnel->adapter_id = tunnel_reg(regs, DP_IN_ADAPTER_INFO) & DP_IN_ADAPTER_NUMBER_MASK;
+
+	snprintf(tunnel->name, sizeof(tunnel->name), "%d:%d:%d",
+		 tunnel_group_drv_id(drv_group_id) & ((1 << DP_GROUP_ID_BITS) - 1),
+		 tunnel_group_id(drv_group_id) & ((1 << DP_USB4_DRIVER_ID_BITS) - 1),
+		 tunnel->adapter_id & ((1 << DP_IN_ADAPTER_NUMBER_BITS) - 1));
+
+	tunnel->bw_granularity = tunnel_reg_bw_granularity(regs);
+	tunnel->allocated_bw = tunnel_reg(regs, DP_ALLOCATED_BW) *
+			       tunnel->bw_granularity;
+
+	tunnel->bw_alloc_supported = tunnel_reg_bw_alloc_supported(regs);
+	tunnel->bw_alloc_enabled = tunnel_reg_bw_alloc_enabled(regs);
+
+	if (!add_tunnel_to_group(mgr, drv_group_id, tunnel)) {
+		kfree(tunnel);
+
+		return NULL;
+	}
+
+	track_tunnel_ref(tunnel, &tunnel->tracker);
+
+	return tunnel;
+}
+
+static void destroy_tunnel(struct drm_dp_tunnel *tunnel)
+{
+	untrack_tunnel_ref(tunnel, &tunnel->tracker);
+	tunnel_put(tunnel);
+}
+
+void drm_dp_tunnel_set_io_error(struct drm_dp_tunnel *tunnel)
+{
+	tunnel->has_io_error = true;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_set_io_error);
+
+static char yes_no_chr(int val)
+{
+	return val ? 'Y' : 'N';
+}
+
+#define SKIP_DPRX_CAPS_CHECK		BIT(0)
+#define ALLOW_ALLOCATED_BW_CHANGE	BIT(1)
+
+static bool tunnel_regs_are_valid(struct drm_dp_tunnel_mgr *mgr,
+				  const struct drm_dp_tunnel_regs *regs,
+				  unsigned int flags)
+{
+	int drv_group_id = tunnel_reg_drv_group_id(regs);
+	bool check_dprx = !(flags & SKIP_DPRX_CAPS_CHECK);
+	bool ret = true;
+
+	if (!tunnel_reg_bw_alloc_supported(regs)) {
+		if (tunnel_group_id(drv_group_id)) {
+			drm_dbg_kms(mgr->dev,
+				    "DPTUN: A non-zero group ID is only allowed with BWA support\n");
+			ret = false;
+		}
+
+		if (tunnel_reg(regs, DP_ALLOCATED_BW)) {
+			drm_dbg_kms(mgr->dev,
+				    "DPTUN: BW is allocated without BWA support\n");
+			ret = false;
+		}
+
+		return ret;
+	}
+
+	if (!tunnel_group_id(drv_group_id)) {
+		drm_dbg_kms(mgr->dev,
+			    "DPTUN: BWA support requires a non-zero group ID\n");
+		ret = false;
+	}
+
+	if (check_dprx && hweight8(tunnel_reg_max_dprx_lane_count(regs)) != 1) {
+		drm_dbg_kms(mgr->dev,
+			    "DPTUN: Invalid DPRX lane count: %d\n",
+			    tunnel_reg_max_dprx_lane_count(regs));
+
+		ret = false;
+	}
+
+	if (check_dprx && !tunnel_reg_max_dprx_rate(regs)) {
+		drm_dbg_kms(mgr->dev,
+			    "DPTUN: DPRX rate is 0\n");
+
+		ret = false;
+	}
+
+	if (tunnel_reg(regs, DP_ALLOCATED_BW) > tunnel_reg(regs, DP_ESTIMATED_BW)) {
+		drm_dbg_kms(mgr->dev,
+			    "DPTUN: Allocated BW %d > estimated BW %d Mb/s\n",
+			    DPTUN_BW_ARG(tunnel_reg(regs, DP_ALLOCATED_BW) *
+					 tunnel_reg_bw_granularity(regs)),
+			    DPTUN_BW_ARG(tunnel_reg(regs, DP_ESTIMATED_BW) *
+					 tunnel_reg_bw_granularity(regs)));
+
+		ret = false;
+	}
+
+	return ret;
+}
+
+static bool tunnel_info_changes_are_valid(struct drm_dp_tunnel *tunnel,
+					  const struct drm_dp_tunnel_regs *regs,
+					  unsigned int flags)
+{
+	int new_drv_group_id = tunnel_reg_drv_group_id(regs);
+	bool ret = true;
+
+	if (tunnel->bw_alloc_supported != tunnel_reg_bw_alloc_supported(regs)) {
+		tun_dbg(tunnel,
+			"BW alloc support has changed %c -> %c\n",
+			yes_no_chr(tunnel->bw_alloc_supported),
+			yes_no_chr(tunnel_reg_bw_alloc_supported(regs)));
+
+		ret = false;
+	}
+
+	if (tunnel->group->drv_group_id != new_drv_group_id) {
+		tun_dbg(tunnel,
+			"Driver/group ID has changed %d:%d:* -> %d:%d:*\n",
+			tunnel_group_drv_id(tunnel->group->drv_group_id),
+			tunnel_group_id(tunnel->group->drv_group_id),
+			tunnel_group_drv_id(new_drv_group_id),
+			tunnel_group_id(new_drv_group_id));
+
+		ret = false;
+	}
+
+	if (!tunnel->bw_alloc_supported)
+		return ret;
+
+	if (tunnel->bw_granularity != tunnel_reg_bw_granularity(regs)) {
+		tun_dbg(tunnel,
+			"BW granularity has changed: %d -> %d Mb/s\n",
+			DPTUN_BW_ARG(tunnel->bw_granularity),
+			DPTUN_BW_ARG(tunnel_reg_bw_granularity(regs)));
+
+		ret = false;
+	}
+
+	/*
+	 * On some devices at least the BW alloc mode enabled status is always
+	 * reported as 0, so skip checking that here.
+	 */
+
+	if (!(flags & ALLOW_ALLOCATED_BW_CHANGE) &&
+	    tunnel->allocated_bw !=
+	    tunnel_reg(regs, DP_ALLOCATED_BW) * tunnel->bw_granularity) {
+		tun_dbg(tunnel,
+			"Allocated BW has changed: %d -> %d Mb/s\n",
+			DPTUN_BW_ARG(tunnel->allocated_bw),
+			DPTUN_BW_ARG(tunnel_reg(regs, DP_ALLOCATED_BW) * tunnel->bw_granularity));
+
+		ret = false;
+	}
+
+	return ret;
+}
+
+static int
+read_and_verify_tunnel_regs(struct drm_dp_tunnel *tunnel,
+			    struct drm_dp_tunnel_regs *regs,
+			    unsigned int flags)
+{
+	int err;
+
+	err = read_tunnel_regs(tunnel->aux, regs);
+	if (err < 0) {
+		drm_dp_tunnel_set_io_error(tunnel);
+
+		return err;
+	}
+
+	if (!tunnel_regs_are_valid(tunnel->group->mgr, regs, flags))
+		return -EINVAL;
+
+	if (!tunnel_info_changes_are_valid(tunnel, regs, flags))
+		return -EINVAL;
+
+	return 0;
+}
+
+static bool update_dprx_caps(struct drm_dp_tunnel *tunnel, const struct drm_dp_tunnel_regs *regs)
+{
+	bool changed = false;
+
+	if (tunnel_reg_max_dprx_rate(regs) != tunnel->max_dprx_rate) {
+		tunnel->max_dprx_rate = tunnel_reg_max_dprx_rate(regs);
+		changed = true;
+	}
+
+	if (tunnel_reg_max_dprx_lane_count(regs) != tunnel->max_dprx_lane_count) {
+		tunnel->max_dprx_lane_count = tunnel_reg_max_dprx_lane_count(regs);
+		changed = true;
+	}
+
+	return changed;
+}
+
+static int dev_id_len(const u8 *dev_id, int max_len)
+{
+	while (max_len && dev_id[max_len - 1] == '\0')
+		max_len--;
+
+	return max_len;
+}
+
+static int get_max_dprx_bw(const struct drm_dp_tunnel *tunnel)
+{
+	int bw = drm_dp_max_dprx_data_rate(tunnel->max_dprx_rate,
+					   tunnel->max_dprx_lane_count);
+
+	return min(roundup(bw, tunnel->bw_granularity),
+		   MAX_DP_REQUEST_BW * tunnel->bw_granularity);
+}
+
+static int get_max_tunnel_bw(const struct drm_dp_tunnel *tunnel)
+{
+	return min(get_max_dprx_bw(tunnel), tunnel->group->available_bw);
+}
+
+/**
+ * drm_dp_tunnel_detect - Detect DP tunnel on the link
+ * @mgr: Tunnel manager
+ * @aux: DP AUX on which the tunnel will be detected
+ *
+ * Detect if there is any DP tunnel on the link and add it to the tunnel
+ * group's tunnel list.
+ *
+ * Returns 0 on success, negative error code on failure.
+ */
+struct drm_dp_tunnel *
+drm_dp_tunnel_detect(struct drm_dp_tunnel_mgr *mgr,
+		       struct drm_dp_aux *aux)
+{
+	struct drm_dp_tunnel_regs regs;
+	struct drm_dp_tunnel *tunnel;
+	int err;
+
+	err = read_tunnel_regs(aux, &regs);
+	if (err)
+		return ERR_PTR(err);
+
+	if (!(tunnel_reg(&regs, DP_TUNNELING_CAPABILITIES) &
+	      DP_TUNNELING_SUPPORT))
+		return ERR_PTR(-ENODEV);
+
+	/* The DPRX caps are valid only after enabling BW alloc mode. */
+	if (!tunnel_regs_are_valid(mgr, &regs, SKIP_DPRX_CAPS_CHECK))
+		return ERR_PTR(-EINVAL);
+
+	tunnel = create_tunnel(mgr, aux, &regs);
+	if (!tunnel)
+		return ERR_PTR(-ENOMEM);
+
+	tun_dbg(tunnel,
+		"OUI:%*phD DevID:%*pE Rev-HW:%d.%d SW:%d.%d PR-Sup:%c BWA-Sup:%c BWA-En:%c\n",
+		DP_TUNNELING_OUI_BYTES,
+			tunnel_reg_ptr(&regs, DP_TUNNELING_OUI),
+		dev_id_len(tunnel_reg_ptr(&regs, DP_TUNNELING_DEV_ID), DP_TUNNELING_DEV_ID_BYTES),
+			tunnel_reg_ptr(&regs, DP_TUNNELING_DEV_ID),
+		(tunnel_reg(&regs, DP_TUNNELING_HW_REV) & DP_TUNNELING_HW_REV_MAJOR_MASK) >>
+			DP_TUNNELING_HW_REV_MAJOR_SHIFT,
+		(tunnel_reg(&regs, DP_TUNNELING_HW_REV) & DP_TUNNELING_HW_REV_MINOR_MASK) >>
+			DP_TUNNELING_HW_REV_MINOR_SHIFT,
+		tunnel_reg(&regs, DP_TUNNELING_SW_REV_MAJOR),
+		tunnel_reg(&regs, DP_TUNNELING_SW_REV_MINOR),
+		yes_no_chr(tunnel_reg(&regs, DP_TUNNELING_CAPABILITIES) &
+			   DP_PANEL_REPLAY_OPTIMIZATION_SUPPORT),
+		yes_no_chr(tunnel->bw_alloc_supported),
+		yes_no_chr(tunnel->bw_alloc_enabled));
+
+	return tunnel;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_detect);
+
+/**
+ * drm_dp_tunnel_destroy - Destroy tunnel object
+ * @tunnel: Tunnel object
+ *
+ * Remove the tunnel from the tunnel topology and destroy it.
+ */
+int drm_dp_tunnel_destroy(struct drm_dp_tunnel *tunnel)
+{
+	if (drm_WARN_ON(tunnel->group->mgr->dev, tunnel->destroyed))
+		return -ENODEV;
+
+	tun_dbg(tunnel, "destroying\n");
+
+	tunnel->destroyed = true;
+	destroy_tunnel(tunnel);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_destroy);
+
+static int check_tunnel(const struct drm_dp_tunnel *tunnel)
+{
+	if (tunnel->destroyed)
+		return -ENODEV;
+
+	if (tunnel->has_io_error)
+		return -EIO;
+
+	return 0;
+}
+
+static int group_allocated_bw(struct drm_dp_tunnel_group *group)
+{
+	struct drm_dp_tunnel *tunnel;
+	int group_allocated_bw = 0;
+
+	for_each_tunnel_in_group(group, tunnel) {
+		if (check_tunnel(tunnel) == 0 &&
+		    tunnel->bw_alloc_enabled)
+			group_allocated_bw += tunnel->allocated_bw;
+	}
+
+	return group_allocated_bw;
+}
+
+static int calc_group_available_bw(const struct drm_dp_tunnel *tunnel)
+{
+	return group_allocated_bw(tunnel->group) -
+	       tunnel->allocated_bw +
+	       tunnel->estimated_bw;
+}
+
+static int update_group_available_bw(struct drm_dp_tunnel *tunnel,
+				     const struct drm_dp_tunnel_regs *regs)
+{
+	struct drm_dp_tunnel *tunnel_iter;
+	int group_available_bw;
+	bool changed;
+
+	tunnel->estimated_bw = tunnel_reg(regs, DP_ESTIMATED_BW) * tunnel->bw_granularity;
+
+	if (calc_group_available_bw(tunnel) == tunnel->group->available_bw)
+		return 0;
+
+	for_each_tunnel_in_group(tunnel->group, tunnel_iter) {
+		int err;
+
+		if (tunnel_iter == tunnel)
+			continue;
+
+		if (check_tunnel(tunnel_iter) != 0 ||
+		    !tunnel_iter->bw_alloc_enabled)
+			continue;
+
+		err = drm_dp_dpcd_probe(tunnel_iter->aux, DP_DPCD_REV);
+		if (err) {
+			tun_dbg(tunnel_iter,
+				"Probe failed, assume disconnected (err %pe)\n",
+				ERR_PTR(err));
+			drm_dp_tunnel_set_io_error(tunnel_iter);
+		}
+	}
+
+	group_available_bw = calc_group_available_bw(tunnel);
+
+	tun_dbg(tunnel, "Updated group available BW: %d->%d\n",
+		DPTUN_BW_ARG(tunnel->group->available_bw),
+		DPTUN_BW_ARG(group_available_bw));
+
+	changed = tunnel->group->available_bw != group_available_bw;
+
+	tunnel->group->available_bw = group_available_bw;
+
+	return changed ? 1 : 0;
+}
+
+static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
+{
+	u8 mask = DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE | DP_UNMASK_BW_ALLOCATION_IRQ;
+	u8 val;
+
+	if (drm_dp_dpcd_readb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
+		goto out_err;
+
+	if (enable)
+		val |= mask;
+	else
+		val &= ~mask;
+
+	if (drm_dp_dpcd_writeb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
+		goto out_err;
+
+	tunnel->bw_alloc_enabled = enable;
+
+	return 0;
+
+out_err:
+	drm_dp_tunnel_set_io_error(tunnel);
+
+	return -EIO;
+}
+
+/**
+ * drm_dp_tunnel_enable_bw_alloc: Enable DP tunnel BW allocation mode
+ * @tunnel: Tunnel object
+ *
+ * Enable the DP tunnel BW allocation mode on @tunnel if it supports it.
+ *
+ * Returns 0 in case of success, negative error code otherwise.
+ */
+int drm_dp_tunnel_enable_bw_alloc(struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_regs regs;
+	int err = check_tunnel(tunnel);
+
+	if (err)
+		return err;
+
+	if (!tunnel->bw_alloc_supported)
+		return -EOPNOTSUPP;
+
+	if (!tunnel_group_id(tunnel->group->drv_group_id))
+		return -EINVAL;
+
+	err = set_bw_alloc_mode(tunnel, true);
+	if (err)
+		goto out;
+
+	err = read_and_verify_tunnel_regs(tunnel, &regs, 0);
+	if (err) {
+		set_bw_alloc_mode(tunnel, false);
+
+		goto out;
+	}
+
+	if (!tunnel->max_dprx_rate)
+		update_dprx_caps(tunnel, &regs);
+
+	if (tunnel->group->available_bw == -1) {
+		err = update_group_available_bw(tunnel, &regs);
+		if (err > 0)
+			err = 0;
+	}
+out:
+	tun_dbg_stat(tunnel, err,
+		     "Enabling BW alloc mode: DPRX:%dx%d Group alloc:%d/%d Mb/s",
+		     tunnel->max_dprx_rate / 100, tunnel->max_dprx_lane_count,
+		     DPTUN_BW_ARG(group_allocated_bw(tunnel->group)),
+		     DPTUN_BW_ARG(tunnel->group->available_bw));
+
+	return err;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_enable_bw_alloc);
+
+/**
+ * drm_dp_tunnel_disable_bw_alloc: Disable DP tunnel BW allocation mode
+ * @tunnel: Tunnel object
+ *
+ * Disable the DP tunnel BW allocation mode on @tunnel.
+ *
+ * Returns 0 in case of success, negative error code otherwise.
+ */
+int drm_dp_tunnel_disable_bw_alloc(struct drm_dp_tunnel *tunnel)
+{
+	int err = check_tunnel(tunnel);
+
+	if (err)
+		return err;
+
+	err = set_bw_alloc_mode(tunnel, false);
+
+	tun_dbg_stat(tunnel, err, "Disabling BW alloc mode");
+
+	return err;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_disable_bw_alloc);
+
+bool drm_dp_tunnel_bw_alloc_is_enabled(const struct drm_dp_tunnel *tunnel)
+{
+	return tunnel->bw_alloc_enabled;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_bw_alloc_is_enabled);
+
+static int bw_req_complete(struct drm_dp_aux *aux, bool *status_changed)
+{
+	u8 bw_req_mask = DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED;
+	u8 status_change_mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
+	u8 val;
+
+	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+		return -EIO;
+
+	*status_changed = val & status_change_mask;
+
+	val &= bw_req_mask;
+
+	if (!val)
+		return -EAGAIN;
+
+	if (drm_dp_dpcd_writeb(aux, DP_TUNNELING_STATUS, val) < 0)
+		return -EIO;
+
+	return val == DP_BW_REQUEST_SUCCEEDED ? 0 : -ENOSPC;
+}
+
+static int allocate_tunnel_bw(struct drm_dp_tunnel *tunnel, int bw)
+{
+	struct drm_dp_tunnel_mgr *mgr = tunnel->group->mgr;
+	int request_bw = DIV_ROUND_UP(bw, tunnel->bw_granularity);
+	unsigned long wait_expires;
+	DEFINE_WAIT(wait);
+	int err;
+
+	/* Atomic check should prevent the following. */
+	if (drm_WARN_ON(mgr->dev, request_bw > MAX_DP_REQUEST_BW)) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (drm_dp_dpcd_writeb(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
+		err = -EIO;
+		goto out;
+	}
+
+	wait_expires = jiffies + msecs_to_jiffies(3000);
+
+	for (;;) {
+		bool status_changed;
+
+		err = bw_req_complete(tunnel->aux, &status_changed);
+		if (err != -EAGAIN)
+			break;
+
+		if (status_changed) {
+			struct drm_dp_tunnel_regs regs;
+
+			err = read_and_verify_tunnel_regs(tunnel, &regs,
+							  ALLOW_ALLOCATED_BW_CHANGE);
+			if (err)
+				break;
+		}
+
+		if (time_after(jiffies, wait_expires)) {
+			err = -ETIMEDOUT;
+			break;
+		}
+
+		prepare_to_wait(&mgr->bw_req_queue, &wait, TASK_UNINTERRUPTIBLE);
+		schedule_timeout(msecs_to_jiffies(200));
+	};
+
+	finish_wait(&mgr->bw_req_queue, &wait);
+
+	if (err)
+		goto out;
+
+	tunnel->allocated_bw = request_bw * tunnel->bw_granularity;
+
+out:
+	tun_dbg_stat(tunnel, err, "Allocating %d/%d Mb/s for tunnel: Group alloc:%d/%d Mb/s",
+		     DPTUN_BW_ARG(request_bw * tunnel->bw_granularity),
+		     DPTUN_BW_ARG(get_max_tunnel_bw(tunnel)),
+		     DPTUN_BW_ARG(group_allocated_bw(tunnel->group)),
+		     DPTUN_BW_ARG(tunnel->group->available_bw));
+
+	if (err == -EIO)
+		drm_dp_tunnel_set_io_error(tunnel);
+
+	return err;
+}
+
+int drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw)
+{
+	int err = check_tunnel(tunnel);
+
+	if (err)
+		return err;
+
+	return allocate_tunnel_bw(tunnel, bw);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_alloc_bw);
+
+static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
+{
+	u8 mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
+	u8 val;
+
+	if (drm_dp_dpcd_readb(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
+		goto out_err;
+
+	val &= mask;
+
+	if (val) {
+		if (drm_dp_dpcd_writeb(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
+			goto out_err;
+
+		return 1;
+	}
+
+	if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
+		return 0;
+
+	/*
+	 * Check for estimated BW changes explicitly to account for lost
+	 * BW change notifications.
+	 */
+	if (drm_dp_dpcd_readb(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
+		goto out_err;
+
+	if (val * tunnel->bw_granularity != tunnel->estimated_bw)
+		return 1;
+
+	return 0;
+
+out_err:
+	drm_dp_tunnel_set_io_error(tunnel);
+
+	return -EIO;
+}
+
+/**
+ * drm_dp_tunnel_update_state: Update DP tunnel SW state with the HW state
+ * @tunnel: Tunnel object
+ *
+ * Update the SW state of @tunnel with the HW state.
+ *
+ * Returns 0 if the state has not changed, 1 if it has changed and got updated
+ * successfully and a negative error code otherwise.
+ */
+int drm_dp_tunnel_update_state(struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_regs regs;
+	bool changed = false;
+	int ret = check_tunnel(tunnel);
+
+	if (ret < 0)
+		return ret;
+
+	ret = check_and_clear_status_change(tunnel);
+	if (ret < 0)
+		goto out;
+
+	if (!ret)
+		return 0;
+
+	ret = read_and_verify_tunnel_regs(tunnel, &regs, 0);
+	if (ret)
+		goto out;
+
+	if (update_dprx_caps(tunnel, &regs))
+		changed = true;
+
+	ret = update_group_available_bw(tunnel, &regs);
+	if (ret == 1)
+		changed = true;
+
+out:
+	tun_dbg_stat(tunnel, ret < 0 ? ret : 0,
+		     "State update: Changed:%c DPRX:%dx%d Tunnel alloc:%d/%d Group alloc:%d/%d Mb/s",
+		     yes_no_chr(changed),
+		     tunnel->max_dprx_rate / 100, tunnel->max_dprx_lane_count,
+		     DPTUN_BW_ARG(tunnel->allocated_bw),
+		     DPTUN_BW_ARG(get_max_tunnel_bw(tunnel)),
+		     DPTUN_BW_ARG(group_allocated_bw(tunnel->group)),
+		     DPTUN_BW_ARG(tunnel->group->available_bw));
+
+	if (ret < 0)
+		return ret;
+
+	if (changed)
+		return 1;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_update_state);
+
+/*
+ * Returns 0 if no re-probe is needed, 1 if a re-probe is needed,
+ * a negative error code otherwise.
+ */
+int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_aux *aux)
+{
+	u8 val;
+
+	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+		return -EIO;
+
+	if (val & (DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED))
+		wake_up_all(&mgr->bw_req_queue);
+
+	if (val & (DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED))
+		return 1;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_handle_irq);
+
+/**
+ * drm_dp_tunnel_max_dprx_rate - Query the maximum rate of the tunnel's DPRX
+ * @tunnel: Tunnel object
+ *
+ * The function is used to query the maximum link rate of the DPRX connected
+ * to @tunnel. Note that this rate will not be limited by the BW limit of the
+ * tunnel, as opposed to the standard and extended DP_MAX_LINK_RATE DPCD
+ * registers.
+ *
+ * Returns the maximum link rate in 10 kbit/s units.
+ */
+int drm_dp_tunnel_max_dprx_rate(const struct drm_dp_tunnel *tunnel)
+{
+	return tunnel->max_dprx_rate;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_max_dprx_rate);
+
+/**
+ * drm_dp_tunnel_max_dprx_lane_count - Query the maximum lane count of the tunnel's DPRX
+ * @tunnel: Tunnel object
+ *
+ * The function is used to query the maximum lane count of the DPRX connected
+ * to @tunnel. Note that this lane count will not be limited by the BW limit of
+ * the tunnel, as opposed to the standard and extended DP_MAX_LANE_COUNT DPCD
+ * registers.
+ *
+ * Returns the maximum lane count.
+ */
+int drm_dp_tunnel_max_dprx_lane_count(const struct drm_dp_tunnel *tunnel)
+{
+	return tunnel->max_dprx_lane_count;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_max_dprx_lane_count);
+
+/**
+ * drm_dp_tunnel_available_bw - Query the estimated total available BW of the tunnel
+ * @tunnel: Tunnel object
+ *
+ * This function is used to query the estimated total available BW of the
+ * tunnel. This includes the currently allocated and free BW for all the
+ * tunnels in @tunnel's group. The available BW is valid only after the BW
+ * allocation mode has been enabled for the tunnel and its state got updated
+ * calling drm_dp_tunnel_update_state().
+ *
+ * Returns the @tunnel group's estimated total available bandwidth in kB/s
+ * units, or -1 if the available BW isn't valid (the BW allocation mode is
+ * not enabled or the tunnel's state hasn't been updated).
+ */
+int drm_dp_tunnel_available_bw(const struct drm_dp_tunnel *tunnel)
+{
+	return tunnel->group->available_bw;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_available_bw);
+
+static struct drm_dp_tunnel_group_state *
+drm_dp_tunnel_atomic_get_group_state(struct drm_atomic_state *state,
+				     const struct drm_dp_tunnel *tunnel)
+{
+	return (struct drm_dp_tunnel_group_state *)
+		drm_atomic_get_private_obj_state(state,
+						 &tunnel->group->base);
+}
+
+static struct drm_dp_tunnel_state *
+add_tunnel_state(struct drm_dp_tunnel_group_state *group_state,
+		 struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_state *tunnel_state;
+
+	tun_dbg_atomic(tunnel,
+		       "Adding state for tunnel %p to group state %p\n",
+		       tunnel, group_state);
+
+	tunnel_state = kzalloc(sizeof(*tunnel_state), GFP_KERNEL);
+	if (!tunnel_state)
+		return NULL;
+
+	tunnel_state->group_state = group_state;
+
+	drm_dp_tunnel_ref_get(tunnel, &tunnel_state->tunnel_ref);
+
+	INIT_LIST_HEAD(&tunnel_state->node);
+	list_add(&tunnel_state->node, &group_state->tunnel_states);
+
+	return tunnel_state;
+}
+
+void drm_dp_tunnel_atomic_clear_state(struct drm_dp_tunnel_state *tunnel_state)
+{
+	tun_dbg_atomic(tunnel_state->tunnel_ref.tunnel,
+		       "Clearing state for tunnel %p\n",
+		       tunnel_state->tunnel_ref.tunnel);
+
+	list_del(&tunnel_state->node);
+
+	kfree(tunnel_state->stream_bw);
+	drm_dp_tunnel_ref_put(&tunnel_state->tunnel_ref);
+
+	kfree(tunnel_state);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_atomic_clear_state);
+
+static void clear_tunnel_group_state(struct drm_dp_tunnel_group_state *group_state)
+{
+	struct drm_dp_tunnel_state *tunnel_state;
+	struct drm_dp_tunnel_state *tunnel_state_tmp;
+
+	for_each_tunnel_state_safe(group_state, tunnel_state, tunnel_state_tmp)
+		drm_dp_tunnel_atomic_clear_state(tunnel_state);
+}
+
+static struct drm_dp_tunnel_state *
+get_tunnel_state(struct drm_dp_tunnel_group_state *group_state,
+		 const struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_state *tunnel_state;
+
+	for_each_tunnel_state(group_state, tunnel_state)
+		if (tunnel_state->tunnel_ref.tunnel == tunnel)
+			return tunnel_state;
+
+	return NULL;
+}
+
+static struct drm_dp_tunnel_state *
+get_or_add_tunnel_state(struct drm_dp_tunnel_group_state *group_state,
+			struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_state *tunnel_state;
+
+	tunnel_state = get_tunnel_state(group_state, tunnel);
+	if (tunnel_state)
+		return tunnel_state;
+
+	return add_tunnel_state(group_state, tunnel);
+}
+
+static struct drm_private_state *
+tunnel_group_duplicate_state(struct drm_private_obj *obj)
+{
+	struct drm_dp_tunnel_group_state *group_state = to_group_state(obj->state);
+	struct drm_dp_tunnel_state *tunnel_state;
+
+	group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
+	if (!group_state)
+		return NULL;
+
+	INIT_LIST_HEAD(&group_state->tunnel_states);
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &group_state->base);
+
+	for_each_tunnel_state(to_group_state(obj->state), tunnel_state) {
+		struct drm_dp_tunnel_state *new_tunnel_state;
+
+		new_tunnel_state = get_or_add_tunnel_state(group_state,
+							   tunnel_state->tunnel_ref.tunnel);
+		if (!new_tunnel_state)
+			goto out_free_state;
+
+		new_tunnel_state->stream_mask = tunnel_state->stream_mask;
+		new_tunnel_state->stream_bw = kmemdup(tunnel_state->stream_bw,
+						      sizeof(*tunnel_state->stream_bw) *
+							hweight32(tunnel_state->stream_mask),
+						      GFP_KERNEL);
+
+		if (!new_tunnel_state->stream_bw)
+			goto out_free_state;
+	}
+
+	return &group_state->base;
+
+out_free_state:
+	clear_tunnel_group_state(group_state);
+	kfree(group_state);
+
+	return NULL;
+}
+
+static void tunnel_group_destroy_state(struct drm_private_obj *obj, struct drm_private_state *state)
+{
+	struct drm_dp_tunnel_group_state *group_state = to_group_state(state);
+
+	clear_tunnel_group_state(group_state);
+	kfree(group_state);
+}
+
+static const struct drm_private_state_funcs tunnel_group_funcs = {
+	.atomic_duplicate_state = tunnel_group_duplicate_state,
+	.atomic_destroy_state = tunnel_group_destroy_state,
+};
+
+struct drm_dp_tunnel_state *
+drm_dp_tunnel_atomic_get_state(struct drm_atomic_state *state,
+			       struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_group_state *group_state =
+		drm_dp_tunnel_atomic_get_group_state(state, tunnel);
+	struct drm_dp_tunnel_state *tunnel_state;
+
+	if (IS_ERR(group_state))
+		return ERR_CAST(group_state);
+
+	tunnel_state = get_or_add_tunnel_state(group_state, tunnel);
+	if (!tunnel_state)
+		return ERR_PTR(-ENOMEM);
+
+	return tunnel_state;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_state);
+
+struct drm_dp_tunnel_state *
+drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
+				   const struct drm_dp_tunnel *tunnel)
+{
+	struct drm_dp_tunnel_group_state *new_group_state;
+	int i;
+
+	for_each_new_group_in_state(state, new_group_state, i)
+		if (to_group(new_group_state->base.obj) == tunnel->group)
+			return get_tunnel_state(new_group_state, tunnel);
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_new_state);
+
+static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group *group)
+{
+	struct drm_dp_tunnel_group_state *group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
+
+	if (!group_state)
+		return false;
+
+	INIT_LIST_HEAD(&group_state->tunnel_states);
+
+	group->mgr = mgr;
+	group->available_bw = -1;
+	INIT_LIST_HEAD(&group->tunnels);
+
+	drm_atomic_private_obj_init(mgr->dev, &group->base, &group_state->base,
+				    &tunnel_group_funcs);
+
+	return true;
+}
+
+static void cleanup_group(struct drm_dp_tunnel_group *group)
+{
+	drm_atomic_private_obj_fini(&group->base);
+}
+
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+static void check_unique_stream_ids(const struct drm_dp_tunnel_group_state *group_state)
+{
+	const struct drm_dp_tunnel_state *tunnel_state;
+	u32 stream_mask = 0;
+
+	for_each_tunnel_state(group_state, tunnel_state) {
+		drm_WARN(to_group(group_state->base.obj)->mgr->dev,
+			 tunnel_state->stream_mask & stream_mask,
+			 "[DPTUN %s]: conflicting stream IDs %x (IDs in other tunnels %x)\n",
+			 tunnel_state->tunnel_ref.tunnel->name,
+			 tunnel_state->stream_mask,
+			 stream_mask);
+
+		stream_mask |= tunnel_state->stream_mask;
+	}
+}
+#else
+static void check_unique_stream_ids(const struct drm_dp_tunnel_group_state *group_state)
+{
+}
+#endif
+
+static int stream_id_to_idx(u32 stream_mask, u8 stream_id)
+{
+	return hweight32(stream_mask & (BIT(stream_id) - 1));
+}
+
+static int resize_bw_array(struct drm_dp_tunnel_state *tunnel_state,
+			   unsigned long old_mask, unsigned long new_mask)
+{
+	unsigned long move_mask = old_mask & new_mask;
+	int *new_bws = NULL;
+	int id;
+
+	WARN_ON(!new_mask);
+
+	if (old_mask == new_mask)
+		return 0;
+
+	new_bws = kcalloc(hweight32(new_mask), sizeof(*new_bws), GFP_KERNEL);
+	if (!new_bws)
+		return -ENOMEM;
+
+	for_each_set_bit(id, &move_mask, BITS_PER_TYPE(move_mask))
+		new_bws[stream_id_to_idx(new_mask, id)] =
+			tunnel_state->stream_bw[stream_id_to_idx(old_mask, id)];
+
+	kfree(tunnel_state->stream_bw);
+	tunnel_state->stream_bw = new_bws;
+	tunnel_state->stream_mask = new_mask;
+
+	return 0;
+}
+
+static int set_stream_bw(struct drm_dp_tunnel_state *tunnel_state,
+			 u8 stream_id, int bw)
+{
+	int err;
+
+	err = resize_bw_array(tunnel_state,
+			      tunnel_state->stream_mask,
+			      tunnel_state->stream_mask | BIT(stream_id));
+	if (err)
+		return err;
+
+	tunnel_state->stream_bw[stream_id_to_idx(tunnel_state->stream_mask, stream_id)] = bw;
+
+	return 0;
+}
+
+static int clear_stream_bw(struct drm_dp_tunnel_state *tunnel_state,
+			   u8 stream_id)
+{
+	if (!(tunnel_state->stream_mask & ~BIT(stream_id))) {
+		drm_dp_tunnel_atomic_clear_state(tunnel_state);
+		return 0;
+	}
+
+	return resize_bw_array(tunnel_state,
+			       tunnel_state->stream_mask,
+			       tunnel_state->stream_mask & ~BIT(stream_id));
+}
+
+int drm_dp_tunnel_atomic_set_stream_bw(struct drm_atomic_state *state,
+					 struct drm_dp_tunnel *tunnel,
+					 u8 stream_id, int bw)
+{
+	struct drm_dp_tunnel_group_state *new_group_state =
+		drm_dp_tunnel_atomic_get_group_state(state, tunnel);
+	struct drm_dp_tunnel_state *tunnel_state;
+	int err;
+
+	if (drm_WARN_ON(tunnel->group->mgr->dev,
+			stream_id > BITS_PER_TYPE(tunnel_state->stream_mask)))
+		return -EINVAL;
+
+	tun_dbg(tunnel,
+		"Setting %d Mb/s for stream %d\n",
+		DPTUN_BW_ARG(bw), stream_id);
+
+	if (bw == 0) {
+		tunnel_state = get_tunnel_state(new_group_state, tunnel);
+		if (!tunnel_state)
+			return 0;
+
+		return clear_stream_bw(tunnel_state, stream_id);
+	}
+
+	tunnel_state = get_or_add_tunnel_state(new_group_state, tunnel);
+	if (drm_WARN_ON(state->dev, !tunnel_state))
+		return -EINVAL;
+
+	err = set_stream_bw(tunnel_state, stream_id, bw);
+	if (err)
+		return err;
+
+	check_unique_stream_ids(new_group_state);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_atomic_set_stream_bw);
+
+int drm_dp_tunnel_atomic_get_tunnel_bw(const struct drm_dp_tunnel_state *tunnel_state)
+{
+	int tunnel_bw = 0;
+	int i;
+
+	for (i = 0; i < hweight32(tunnel_state->stream_mask); i++)
+		tunnel_bw += tunnel_state->stream_bw[i];
+
+	return tunnel_bw;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_tunnel_bw);
+
+int drm_dp_tunnel_atomic_get_group_streams_in_state(struct drm_atomic_state *state,
+						    const struct drm_dp_tunnel *tunnel,
+						    u32 *stream_mask)
+{
+	struct drm_dp_tunnel_group_state *group_state =
+		drm_dp_tunnel_atomic_get_group_state(state, tunnel);
+	struct drm_dp_tunnel_state *tunnel_state;
+
+	if (IS_ERR(group_state))
+		return PTR_ERR(group_state);
+
+	*stream_mask = 0;
+	for_each_tunnel_state(group_state, tunnel_state)
+		*stream_mask |= tunnel_state->stream_mask;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_group_streams_in_state);
+
+static int
+drm_dp_tunnel_atomic_check_group_bw(struct drm_dp_tunnel_group_state *new_group_state,
+				    u32 *failed_stream_mask)
+{
+	struct drm_dp_tunnel_group *group = to_group(new_group_state->base.obj);
+	struct drm_dp_tunnel_state *new_tunnel_state;
+	u32 group_stream_mask = 0;
+	int group_bw = 0;
+
+	for_each_tunnel_state(new_group_state, new_tunnel_state) {
+		struct drm_dp_tunnel *tunnel = new_tunnel_state->tunnel_ref.tunnel;
+		int max_dprx_bw = get_max_dprx_bw(tunnel);
+		int tunnel_bw = drm_dp_tunnel_atomic_get_tunnel_bw(new_tunnel_state);
+
+		tun_dbg(tunnel,
+			"%sRequired %d/%d Mb/s total for tunnel.\n",
+			tunnel_bw > max_dprx_bw ? "Not enough BW: " : "",
+			DPTUN_BW_ARG(tunnel_bw),
+			DPTUN_BW_ARG(max_dprx_bw));
+
+		if (tunnel_bw > max_dprx_bw) {
+			*failed_stream_mask = new_tunnel_state->stream_mask;
+			return -ENOSPC;
+		}
+
+		group_bw += min(roundup(tunnel_bw, tunnel->bw_granularity),
+				max_dprx_bw);
+		group_stream_mask |= new_tunnel_state->stream_mask;
+	}
+
+	tun_grp_dbg(group,
+		    "%sRequired %d/%d Mb/s total for tunnel group.\n",
+		    group_bw > group->available_bw ? "Not enough BW: " : "",
+		    DPTUN_BW_ARG(group_bw),
+		    DPTUN_BW_ARG(group->available_bw));
+
+	if (group_bw > group->available_bw) {
+		*failed_stream_mask = group_stream_mask;
+		return -ENOSPC;
+	}
+
+	return 0;
+}
+
+int drm_dp_tunnel_atomic_check_stream_bws(struct drm_atomic_state *state,
+					  u32 *failed_stream_mask)
+{
+	struct drm_dp_tunnel_group_state *new_group_state;
+	int i;
+
+	for_each_new_group_in_state(state, new_group_state, i) {
+		int ret;
+
+		ret = drm_dp_tunnel_atomic_check_group_bw(new_group_state,
+							  failed_stream_mask);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_atomic_check_stream_bws);
+
+static void destroy_mgr(struct drm_dp_tunnel_mgr *mgr)
+{
+	int i;
+
+	for (i = 0; i < mgr->group_count; i++) {
+		cleanup_group(&mgr->groups[i]);
+		drm_WARN_ON(mgr->dev, !list_empty(&mgr->groups[i].tunnels));
+	}
+
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+	ref_tracker_dir_exit(&mgr->ref_tracker);
+#endif
+
+	kfree(mgr->groups);
+	kfree(mgr);
+}
+
+/**
+ * drm_dp_tunnel_mgr_create - Create a DP tunnel manager
+ * @i915: i915 driver object
+ *
+ * Creates a DP tunnel manager.
+ *
+ * Returns a pointer to the tunnel manager if created successfully or NULL in
+ * case of an error.
+ */
+struct drm_dp_tunnel_mgr *
+drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
+{
+	struct drm_dp_tunnel_mgr *mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
+	int i;
+
+	if (!mgr)
+		return NULL;
+
+	mgr->dev = dev;
+	init_waitqueue_head(&mgr->bw_req_queue);
+
+	mgr->groups = kcalloc(max_group_count, sizeof(*mgr->groups), GFP_KERNEL);
+	if (!mgr->groups) {
+		kfree(mgr);
+
+		return NULL;
+	}
+
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+	ref_tracker_dir_init(&mgr->ref_tracker, 16, "dptun");
+#endif
+
+	for (i = 0; i < max_group_count; i++) {
+		if (!init_group(mgr, &mgr->groups[i])) {
+			destroy_mgr(mgr);
+
+			return NULL;
+		}
+
+		mgr->group_count++;
+	}
+
+	return mgr;
+}
+EXPORT_SYMBOL(drm_dp_tunnel_mgr_create);
+
+/**
+ * drm_dp_tunnel_mgr_destroy - Destroy DP tunnel manager
+ * @mgr: Tunnel manager object
+ *
+ * Destroy the tunnel manager.
+ */
+void drm_dp_tunnel_mgr_destroy(struct drm_dp_tunnel_mgr *mgr)
+{
+	destroy_mgr(mgr);
+}
+EXPORT_SYMBOL(drm_dp_tunnel_mgr_destroy);
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 281afff6ee4e5..8bfd5d007be8d 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1382,6 +1382,66 @@
 #define DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET	0x69494
 #define DP_HDCP_2_2_REG_DBG_OFFSET		0x69518
 
+/* DP-tunneling */
+#define DP_TUNNELING_OUI				0xe0000
+#define  DP_TUNNELING_OUI_BYTES				3
+
+#define DP_TUNNELING_DEV_ID				0xe0003
+#define  DP_TUNNELING_DEV_ID_BYTES			6
+
+#define DP_TUNNELING_HW_REV				0xe0009
+#define  DP_TUNNELING_HW_REV_MAJOR_SHIFT		4
+#define  DP_TUNNELING_HW_REV_MAJOR_MASK			(0xf << DP_TUNNELING_HW_REV_MAJOR_SHIFT)
+#define  DP_TUNNELING_HW_REV_MINOR_SHIFT		0
+#define  DP_TUNNELING_HW_REV_MINOR_MASK			(0xf << DP_TUNNELING_HW_REV_MINOR_SHIFT)
+
+#define DP_TUNNELING_SW_REV_MAJOR			0xe000a
+#define DP_TUNNELING_SW_REV_MINOR			0xe000b
+
+#define DP_TUNNELING_CAPABILITIES			0xe000d
+#define  DP_IN_BW_ALLOCATION_MODE_SUPPORT		(1 << 7)
+#define  DP_PANEL_REPLAY_OPTIMIZATION_SUPPORT		(1 << 6)
+#define  DP_TUNNELING_SUPPORT				(1 << 0)
+
+#define DP_IN_ADAPTER_INFO				0xe000e
+#define  DP_IN_ADAPTER_NUMBER_BITS			7
+#define  DP_IN_ADAPTER_NUMBER_MASK			((1 << DP_IN_ADAPTER_NUMBER_BITS) - 1)
+
+#define DP_USB4_DRIVER_ID				0xe000f
+#define  DP_USB4_DRIVER_ID_BITS				4
+#define  DP_USB4_DRIVER_ID_MASK				((1 << DP_USB4_DRIVER_ID_BITS) - 1)
+
+#define DP_USB4_DRIVER_BW_CAPABILITY			0xe0020
+#define  DP_USB4_DRIVER_BW_ALLOCATION_MODE_SUPPORT	(1 << 7)
+
+#define DP_IN_ADAPTER_TUNNEL_INFORMATION		0xe0021
+#define  DP_GROUP_ID_BITS				3
+#define  DP_GROUP_ID_MASK				((1 << DP_GROUP_ID_BITS) - 1)
+
+#define DP_BW_GRANULARITY				0xe0022
+#define  DP_BW_GRANULARITY_MASK				0x3
+
+#define DP_ESTIMATED_BW					0xe0023
+#define DP_ALLOCATED_BW					0xe0024
+
+#define DP_TUNNELING_STATUS				0xe0025
+#define  DP_BW_ALLOCATION_CAPABILITY_CHANGED		(1 << 3)
+#define  DP_ESTIMATED_BW_CHANGED			(1 << 2)
+#define  DP_BW_REQUEST_SUCCEEDED			(1 << 1)
+#define  DP_BW_REQUEST_FAILED				(1 << 0)
+
+#define DP_TUNNELING_MAX_LINK_RATE			0xe0028
+
+#define DP_TUNNELING_MAX_LANE_COUNT			0xe0029
+#define  DP_TUNNELING_MAX_LANE_COUNT_MASK		0x1f
+
+#define DP_DPTX_BW_ALLOCATION_MODE_CONTROL		0xe0030
+#define  DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE	(1 << 7)
+#define  DP_UNMASK_BW_ALLOCATION_IRQ			(1 << 6)
+
+#define DP_REQUEST_BW					0xe0031
+#define  MAX_DP_REQUEST_BW				255
+
 /* LTTPR: Link Training (LT)-tunable PHY Repeaters */
 #define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000 /* 1.3 */
 #define DP_MAX_LINK_RATE_PHY_REPEATER			    0xf0001 /* 1.4a */
diff --git a/include/drm/display/drm_dp_tunnel.h b/include/drm/display/drm_dp_tunnel.h
new file mode 100644
index 0000000000000..f6449b1b4e6e9
--- /dev/null
+++ b/include/drm/display/drm_dp_tunnel.h
@@ -0,0 +1,270 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __DRM_DP_TUNNEL_H__
+#define __DRM_DP_TUNNEL_H__
+
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+
+struct drm_dp_aux;
+
+struct drm_device;
+
+struct drm_atomic_state;
+struct drm_dp_tunnel_mgr;
+struct drm_dp_tunnel_state;
+
+struct ref_tracker;
+
+struct drm_dp_tunnel_ref {
+	struct drm_dp_tunnel *tunnel;
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+	struct ref_tracker *tracker;
+#endif
+};
+
+#ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL
+
+struct drm_dp_tunnel *
+drm_dp_tunnel_get_untracked(struct drm_dp_tunnel *tunnel);
+void drm_dp_tunnel_put_untracked(struct drm_dp_tunnel *tunnel);
+
+#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+struct drm_dp_tunnel *
+drm_dp_tunnel_get(struct drm_dp_tunnel *tunnel, struct ref_tracker **tracker);
+
+void
+drm_dp_tunnel_put(struct drm_dp_tunnel *tunnel, struct ref_tracker **tracker);
+#else
+#define drm_dp_tunnel_get(tunnel, tracker) \
+	drm_dp_tunnel_get_untracked(tunnel)
+
+#define drm_dp_tunnel_put(tunnel, tracker) \
+	drm_dp_tunnel_put_untracked(tunnel)
+
+#endif
+
+static inline void drm_dp_tunnel_ref_get(struct drm_dp_tunnel *tunnel,
+					   struct drm_dp_tunnel_ref *tunnel_ref)
+{
+	tunnel_ref->tunnel = drm_dp_tunnel_get(tunnel, &tunnel_ref->tracker);
+}
+
+static inline void drm_dp_tunnel_ref_put(struct drm_dp_tunnel_ref *tunnel_ref)
+{
+	drm_dp_tunnel_put(tunnel_ref->tunnel, &tunnel_ref->tracker);
+}
+
+struct drm_dp_tunnel *
+drm_dp_tunnel_detect(struct drm_dp_tunnel_mgr *mgr,
+		     struct drm_dp_aux *aux);
+int drm_dp_tunnel_destroy(struct drm_dp_tunnel *tunnel);
+
+int drm_dp_tunnel_enable_bw_alloc(struct drm_dp_tunnel *tunnel);
+int drm_dp_tunnel_disable_bw_alloc(struct drm_dp_tunnel *tunnel);
+bool drm_dp_tunnel_bw_alloc_is_enabled(const struct drm_dp_tunnel *tunnel);
+int drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw);
+int drm_dp_tunnel_check_state(struct drm_dp_tunnel *tunnel);
+int drm_dp_tunnel_update_state(struct drm_dp_tunnel *tunnel);
+
+void drm_dp_tunnel_set_io_error(struct drm_dp_tunnel *tunnel);
+
+int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr,
+			     struct drm_dp_aux *aux);
+
+int drm_dp_tunnel_max_dprx_rate(const struct drm_dp_tunnel *tunnel);
+int drm_dp_tunnel_max_dprx_lane_count(const struct drm_dp_tunnel *tunnel);
+int drm_dp_tunnel_available_bw(const struct drm_dp_tunnel *tunnel);
+
+const char *drm_dp_tunnel_name(const struct drm_dp_tunnel *tunnel);
+
+struct drm_dp_tunnel_state *
+drm_dp_tunnel_atomic_get_state(struct drm_atomic_state *state,
+			       struct drm_dp_tunnel *tunnel);
+struct drm_dp_tunnel_state *
+drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
+				   const struct drm_dp_tunnel *tunnel);
+
+void drm_dp_tunnel_atomic_clear_state(struct drm_dp_tunnel_state *tunnel_state);
+
+int drm_dp_tunnel_atomic_set_stream_bw(struct drm_atomic_state *state,
+				       struct drm_dp_tunnel *tunnel,
+				       u8 stream_id, int bw);
+int drm_dp_tunnel_atomic_get_group_streams_in_state(struct drm_atomic_state *state,
+						    const struct drm_dp_tunnel *tunnel,
+						    u32 *stream_mask);
+
+int drm_dp_tunnel_atomic_check_stream_bws(struct drm_atomic_state *state,
+					  u32 *failed_stream_mask);
+
+int drm_dp_tunnel_atomic_get_tunnel_bw(const struct drm_dp_tunnel_state *tunnel_state);
+
+struct drm_dp_tunnel_mgr *
+drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count);
+void drm_dp_tunnel_mgr_destroy(struct drm_dp_tunnel_mgr *mgr);
+
+#else
+
+static inline struct drm_dp_tunnel *
+drm_dp_tunnel_get_untracked(struct drm_dp_tunnel *tunnel)
+{
+	return NULL;
+}
+
+static inline void
+drm_dp_tunnel_put_untracked(struct drm_dp_tunnel *tunnel) {}
+
+static inline struct drm_dp_tunnel *
+drm_dp_tunnel_get(struct drm_dp_tunnel *tunnel, struct ref_tracker **tracker)
+{
+	return NULL;
+}
+
+static inline void
+drm_dp_tunnel_put(struct drm_dp_tunnel *tunnel, struct ref_tracker **tracker) {}
+
+static inline void drm_dp_tunnel_ref_get(struct drm_dp_tunnel *tunnel,
+					   struct drm_dp_tunnel_ref *tunnel_ref) {}
+static inline void drm_dp_tunnel_ref_put(struct drm_dp_tunnel_ref *tunnel_ref) {}
+
+static inline struct drm_dp_tunnel *
+drm_dp_tunnel_detect(struct drm_dp_tunnel_mgr *mgr,
+		     struct drm_dp_aux *aux)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline int
+drm_dp_tunnel_destroy(struct drm_dp_tunnel *tunnel)
+{
+	return 0;
+}
+
+static inline int drm_dp_tunnel_enable_bw_alloc(struct drm_dp_tunnel *tunnel)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int drm_dp_tunnel_disable_bw_alloc(struct drm_dp_tunnel *tunnel)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline bool drm_dp_tunnel_bw_alloc_is_enabled(const struct drm_dp_tunnel *tunnel)
+{
+	return false;
+}
+
+static inline int
+drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+drm_dp_tunnel_check_state(struct drm_dp_tunnel *tunnel)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+drm_dp_tunnel_update_state(struct drm_dp_tunnel *tunnel)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void drm_dp_tunnel_set_io_error(struct drm_dp_tunnel *tunnel) {}
+static inline int
+drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr,
+			 struct drm_dp_aux *aux)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+drm_dp_tunnel_max_dprx_rate(const struct drm_dp_tunnel *tunnel)
+{
+	return 0;
+}
+
+static inline int
+drm_dp_tunnel_max_dprx_lane_count(const struct drm_dp_tunnel *tunnel)
+{
+	return 0;
+}
+
+static inline int
+drm_dp_tunnel_available_bw(const struct drm_dp_tunnel *tunnel)
+{
+	return -1;
+}
+
+static inline const char *
+drm_dp_tunnel_name(const struct drm_dp_tunnel *tunnel)
+{
+	return NULL;
+}
+
+static inline struct drm_dp_tunnel_state *
+drm_dp_tunnel_atomic_get_state(struct drm_atomic_state *state,
+			       struct drm_dp_tunnel *tunnel)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline struct drm_dp_tunnel_state *
+drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
+				   const struct drm_dp_tunnel *tunnel)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline void
+drm_dp_tunnel_atomic_clear_state(struct drm_dp_tunnel_state *tunnel_state) {}
+
+static inline int
+drm_dp_tunnel_atomic_set_stream_bw(struct drm_atomic_state *state,
+				   struct drm_dp_tunnel *tunnel,
+				   u8 stream_id, int bw)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+drm_dp_tunnel_atomic_get_group_streams_in_state(struct drm_atomic_state *state,
+						const struct drm_dp_tunnel *tunnel,
+						u32 *stream_mask)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+drm_dp_tunnel_atomic_check_stream_bws(struct drm_atomic_state *state,
+				      u32 *failed_stream_mask)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+drm_dp_tunnel_atomic_get_tunnel_bw(const struct drm_dp_tunnel_state *tunnel_state)
+{
+	return 0;
+}
+
+static inline struct drm_dp_tunnel_mgr *
+drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+static inline
+void drm_dp_tunnel_mgr_destroy(struct drm_dp_tunnel_mgr *mgr) {}
+
+
+#endif /* CONFIG_DRM_DISPLAY_DP_TUNNEL */
+
+#endif /* __DRM_DP_TUNNEL_H__ */
-- 
2.39.2

