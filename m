Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58A82F30B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC33F10E5D1;
	Tue, 16 Jan 2024 17:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7210E593;
 Tue, 16 Jan 2024 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705425246; x=1736961246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D8QpRSaMUWSSLOyzS27POdCaBXjcXjgz+1vc0Ng3pHA=;
 b=Kp7F8Jvg2UvdFJQ7wj3COuT0rTF2C8VKfRWN8BEdfv+MRBBf/Uo1IZLg
 Rwzz0fH07PNSECNso/iDAM/wlb4ij6Vn3ctgRobWHxlOTz8LnLqtikBeq
 PXcMwHoHWmc5Kinoanpm9u9sir7XDjaH+4jbS4t4vgShyvnO5z4biZC8L
 XWne+zgU+wIRosU96g6IHLQ7uhPq6a5Z3g8CNFf7jOVu+bPOnKV+hRg85
 nzi5aA0Xf3lWZp+6wGnKpPAZcsb28W7iTgd5Y9OR/rmM4Hozp0dBeYLgP
 171kFRhZH1C+sOGKhXqB46uFb1biA8DGNgoylHQkaz0Yf2lxDGb7SsBwm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399593364"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="399593364"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="25869630"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 09:12:46 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Extract GuC error capture lists on G2H
 notification
Date: Tue, 16 Jan 2024 09:12:35 -0800
Message-Id: <20240116171237.118463-8-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116171237.118463-1-zhanjun.dong@intel.com>
References: <20240116171237.118463-1-zhanjun.dong@intel.com>
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upon the G2H Notify-Err-Capture event, parse through the
GuC Log Buffer (error-capture-subregion) and generate one or
more capture-nodes. A single node represents a single "engine-
instance-capture-dump" and contains at least 3 register lists:
global, engine-class and engine-instance. An internal link
list is maintained to store one or more nodes.

Because the link-list node generation happen before the call
to devcoredump, duplicate global and engine-class register
lists for each engine-instance register dump if we find
dependent-engine resets in a engine-capture-group.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   7 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 572 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |  22 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |   3 +
 5 files changed, 605 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 3062e0e0d467..fc5c098e6596 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -182,6 +182,13 @@ enum xe_guc_sleep_state_status {
 #define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
 #define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
 
+enum intel_guc_state_capture_event_status {
+	XE_GUC_STATE_CAPTURE_EVENT_STATUS_SUCCESS = 0x0,
+	XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE = 0x1,
+};
+
+#define XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
+
 #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
 #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
 /* Flush PPC or SMRO caches along with TLB invalidation request */
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f4153dc4ab86..319e606eeb2a 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -634,6 +634,578 @@ static void check_guc_capture_size(struct xe_guc *guc)
 			  buffer_size, spare_size, min_size);
 }
 
+/*
+ * KMD Init time flows:
+ * --------------------
+ *     --> alloc A: GuC input capture regs lists (registered to GuC via ADS).
+ *                  xe_guc_ads acquires the register lists by calling
+ *                  xe_guc_capture_list_size and xe_guc_capture_list_get 'n' times,
+ *                  where n = 1 for global-reg-list +
+ *                            num_engine_classes for class-reg-list +
+ *                            num_engine_classes for instance-reg-list
+ *                               (since all instances of the same engine-class type
+ *                                have an identical engine-instance register-list).
+ *                  ADS module also calls separately for PF vs VF.
+ *
+ *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
+ *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
+ *                  Note2: 'x 3' to hold multiple capture groups
+ *
+ * GUC Runtime notify capture:
+ * --------------------------
+ *     --> G2H STATE_CAPTURE_NOTIFICATION
+ *                   L--> xe_guc_capture_process
+ *                           L--> Loop through B (head..tail) and for each engine instance's
+ *                                err-state-captured register-list we find, we alloc 'C':
+ *      --> alloc C: A capture-output-node structure that includes misc capture info along
+ *                   with 3 register list dumps (global, engine-class and engine-instance)
+ *                   This node is created from a pre-allocated list of blank nodes in
+ *                   guc->capture->cachelist and populated with the error-capture
+ *                   data from GuC and then it's added into guc->capture->outlist linked
+ *                   list. This list is used for matchup and printout by xe_devcoredump_read
+ *                   and xe_hw_engine_snapshot_print, (when user invokes the devcoredump sysfs).
+ *
+ * GUC --> notify context reset:
+ * -----------------------------
+ *     --> G2H CONTEXT RESET
+ *                   L--> guc_handle_context_reset --> i915_capture_error_state
+ *                          L--> devcoredump_snapshot(..IS_GUC_CAPTURE)
+ *                               --> xe_hw_engine_snapshot_capture(..IS_GUC_CAPTURE)
+ *                               L--> xe_hw_engine_snapshot_from_capture is where
+ *                                    detach C from internal linked list and add it into
+ *                                    xe_hw_engine_snapshot struct (if the context and
+ *                                    engine of the event notification matches a node
+ *                                    in the link list).
+ *
+ * User Sysfs / Debugfs
+ * --------------------
+ *      --> xe_devcoredump_read->
+ *             L--> xxx_snapshot_print
+ *                    L--> xe_hw_engine_snapshot_print
+ *                         register lists values of the xe_hw_engine_snapshot
+ *                         saved from the error-engine-dump.
+ *
+ */
+
+static int guc_capture_buf_cnt(struct __guc_capture_bufstate *buf)
+{
+	if (buf->wr >= buf->rd)
+		return (buf->wr - buf->rd);
+	return (buf->size - buf->rd) + buf->wr;
+}
+
+static int guc_capture_buf_cnt_to_end(struct __guc_capture_bufstate *buf)
+{
+	if (buf->rd > buf->wr)
+		return (buf->size - buf->rd);
+	return (buf->wr - buf->rd);
+}
+
+/*
+ * GuC's error-capture output is a ring buffer populated in a byte-stream fashion:
+ *
+ * The GuC Log buffer region for error-capture is managed like a ring buffer.
+ * The GuC firmware dumps error capture logs into this ring in a byte-stream flow.
+ * Additionally, as per the current and foreseeable future, all packed error-
+ * capture output structures are dword aligned.
+ *
+ * That said, if the GuC firmware is in the midst of writing a structure that is larger
+ * than one dword but the tail end of the err-capture buffer-region has lesser space left,
+ * we would need to extract that structure one dword at a time straddled across the end,
+ * onto the start of the ring.
+ *
+ * Below function, guc_capture_log_remove_dw is a helper for that. All callers of this
+ * function would typically do a straight-up memcpy from the ring contents and will only
+ * call this helper if their structure-extraction is straddling across the end of the
+ * ring. GuC firmware does not add any padding. The reason for the no-padding is to ease
+ * scalability for future expansion of output data types without requiring a redesign
+ * of the flow controls.
+ */
+static int
+guc_capture_log_remove_dw(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			  u32 *dw)
+{
+	int tries = 2;
+	int avail = 0;
+	u32 *src_data;
+
+	if (!guc_capture_buf_cnt(buf))
+		return 0;
+
+	while (tries--) {
+		avail = guc_capture_buf_cnt_to_end(buf);
+		if (avail >= sizeof(u32)) {
+			src_data = (u32 *)(buf->data + buf->rd);
+			*dw = *src_data;
+			buf->rd += 4;
+			return 4;
+		}
+		if (avail)
+			xe_gt_dbg(guc_to_gt(guc), "Register capture log not dword aligned, skipping.\n");
+		buf->rd = 0;
+	}
+
+	return 0;
+}
+
+static bool
+guc_capture_data_extracted(struct __guc_capture_bufstate *b,
+			   int size, void *dest)
+{
+	if (guc_capture_buf_cnt_to_end(b) >= size) {
+		memcpy(dest, (b->data + b->rd), size);
+		b->rd += size;
+		return true;
+	}
+	return false;
+}
+
+static int
+guc_capture_log_get_group_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			      struct guc_state_capture_group_header_t *ghdr)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_state_capture_group_header_t);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(buf, fullsize, (void *)ghdr))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &ghdr->owner);
+	read += guc_capture_log_remove_dw(guc, buf, &ghdr->info);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static int
+guc_capture_log_get_data_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_state_capture_header_t *hdr)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_state_capture_header_t);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(buf, fullsize, (void *)hdr))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->owner);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->info);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->lrca);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->guc_id);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->num_mmios);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static int
+guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_mmio_reg *reg)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_mmio_reg);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(buf, fullsize, (void *)reg))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &reg->offset);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->value);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->flags);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->mask);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static void
+guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
+			     struct list_head *list)
+{
+	list_add_tail(&node->link, list);
+}
+
+static void
+guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
+				struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->outlist);
+}
+
+static void
+guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
+				  struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->cachelist);
+}
+
+static void
+guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+{
+	struct guc_mmio_reg *tmp[GUC_CAPTURE_LIST_TYPE_MAX];
+	int i;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		tmp[i] = node->reginfo[i].regs;
+		memset(tmp[i], 0, sizeof(struct guc_mmio_reg) *
+		       guc->capture->max_mmio_per_node);
+	}
+	memset(node, 0, sizeof(*node));
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i)
+		node->reginfo[i].regs = tmp[i];
+
+	INIT_LIST_HEAD(&node->link);
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_get_prealloc_node(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *found = NULL;
+
+	if (!list_empty(&guc->capture->cachelist)) {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		/* get first avail node from the cache list */
+		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
+			found = n;
+			list_del(&n->link);
+			break;
+		}
+	} else {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		/* traverse down and steal back the oldest node already allocated */
+		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+			found = n;
+		}
+		if (found)
+			list_del(&found->link);
+	}
+	if (found)
+		guc_capture_init_node(guc, found);
+
+	return found;
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
+		       u32 keep_reglist_mask)
+{
+	struct __guc_capture_parsed_output *new;
+	int i;
+
+	new = guc_capture_get_prealloc_node(guc);
+	if (!new)
+		return NULL;
+	if (!original)
+		return new;
+
+	new->is_partial = original->is_partial;
+
+	/* copy reg-lists that we want to clone */
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		if (keep_reglist_mask & BIT(i)) {
+			XE_WARN_ON(original->reginfo[i].num_regs  >
+				   guc->capture->max_mmio_per_node);
+
+			memcpy(new->reginfo[i].regs, original->reginfo[i].regs,
+			       original->reginfo[i].num_regs * sizeof(struct guc_mmio_reg));
+
+			new->reginfo[i].num_regs = original->reginfo[i].num_regs;
+			new->reginfo[i].vfid  = original->reginfo[i].vfid;
+
+			if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS) {
+				new->eng_class = original->eng_class;
+			} else if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
+				new->eng_inst = original->eng_inst;
+				new->guc_id = original->guc_id;
+				new->lrca = original->lrca;
+			}
+		}
+	}
+
+	return new;
+}
+
+static int
+guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
+{
+	struct guc_state_capture_group_header_t ghdr = {0};
+	struct guc_state_capture_header_t hdr = {0};
+	struct __guc_capture_parsed_output *node = NULL;
+	struct guc_mmio_reg *regs = NULL;
+	int i, numlists, numregs, ret = 0;
+	enum guc_capture_type datatype;
+	struct guc_mmio_reg tmp;
+	bool is_partial = false;
+
+	i = guc_capture_buf_cnt(buf);
+	if (!i)
+		return -ENODATA;
+
+	if (i % sizeof(u32)) {
+		xe_gt_warn(guc_to_gt(guc), "Got mis-aligned register capture entries\n");
+		ret = -EIO;
+		goto bailout;
+	}
+
+	/* first get the capture group header */
+	if (guc_capture_log_get_group_hdr(guc, buf, &ghdr)) {
+		ret = -EIO;
+		goto bailout;
+	}
+	/*
+	 * we would typically expect a layout as below where n would be expected to be
+	 * anywhere between 3 to n where n > 3 if we are seeing multiple dependent engine
+	 * instances being reset together.
+	 * ____________________________________________
+	 * | Capture Group                            |
+	 * | ________________________________________ |
+	 * | | Capture Group Header:                | |
+	 * | |  - num_captures = 5                  | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture1:                            | |
+	 * | |  Hdr: GLOBAL, numregs=a              | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... rega           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture2:                            | |
+	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=b| |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regb           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture3:                            | |
+	 * | |  Hdr: INSTANCE=RCS, numregs=c        | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regc           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture4:                            | |
+	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=d| |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regd           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture5:                            | |
+	 * | |  Hdr: INSTANCE=CCS0, numregs=e       | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... rege           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * |__________________________________________|
+	 */
+	is_partial = FIELD_GET(CAP_GRP_HDR_CAPTURE_TYPE, ghdr.info);
+	numlists = FIELD_GET(CAP_GRP_HDR_NUM_CAPTURES, ghdr.info);
+
+	while (numlists--) {
+		if (guc_capture_log_get_data_hdr(guc, buf, &hdr)) {
+			ret = -EIO;
+			break;
+		}
+
+		datatype = FIELD_GET(CAP_HDR_CAPTURE_TYPE, hdr.info);
+		if (datatype > GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
+			/* unknown capture type - skip over to next capture set */
+			numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
+			while (numregs--) {
+				if (guc_capture_log_get_register(guc, buf, &tmp)) {
+					ret = -EIO;
+					break;
+				}
+			}
+			continue;
+		} else if (node) {
+			/*
+			 * Based on the current capture type and what we have so far,
+			 * decide if we should add the current node into the internal
+			 * linked list for match-up when i915_gpu_coredump calls later
+			 * (and alloc a blank node for the next set of reglists)
+			 * or continue with the same node or clone the current node
+			 * but only retain the global or class registers (such as the
+			 * case of dependent engine resets).
+			 */
+			if (datatype == GUC_CAPTURE_LIST_TYPE_GLOBAL) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS &&
+				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS].num_regs) {
+				/* Add to list, clone node and duplicate global list */
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = guc_capture_clone_node(guc, node,
+							      GCAP_PARSED_REGLIST_INDEX_GLOBAL);
+			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE &&
+				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE].num_regs) {
+				/* Add to list, clone node and duplicate global + class lists */
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = guc_capture_clone_node(guc, node,
+							      (GCAP_PARSED_REGLIST_INDEX_GLOBAL |
+							      GCAP_PARSED_REGLIST_INDEX_ENGCLASS));
+			}
+		}
+
+		if (!node) {
+			node = guc_capture_get_prealloc_node(guc);
+			if (!node) {
+				ret = -ENOMEM;
+				break;
+			}
+			if (datatype != GUC_CAPTURE_LIST_TYPE_GLOBAL)
+				xe_gt_dbg(guc_to_gt(guc),
+					  "Register capture missing global dump: %08x!\n",
+					  datatype);
+		}
+		node->is_partial = is_partial;
+		node->reginfo[datatype].vfid = FIELD_GET(CAP_HDR_CAPTURE_VFID, hdr.owner);
+
+		switch (datatype) {
+		case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
+			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
+			node->eng_inst = FIELD_GET(CAP_HDR_ENGINE_INSTANCE, hdr.info);
+			node->lrca = hdr.lrca;
+			node->guc_id = hdr.guc_id;
+			break;
+		case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
+			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
+			break;
+		default:
+			break;
+		}
+
+		numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
+		if (numregs > guc->capture->max_mmio_per_node) {
+			xe_gt_dbg(guc_to_gt(guc), "Register capture list extraction clipped by prealloc!\n");
+			numregs = guc->capture->max_mmio_per_node;
+		}
+		node->reginfo[datatype].num_regs = numregs;
+		regs = node->reginfo[datatype].regs;
+		i = 0;
+		while (numregs--) {
+			if (guc_capture_log_get_register(guc, buf, &regs[i++])) {
+				ret = -EIO;
+				break;
+			}
+		}
+	}
+
+bailout:
+	if (node) {
+		/* If we have data, add to linked list for match-up when i915_gpu_coredump calls */
+		for (i = GUC_CAPTURE_LIST_TYPE_GLOBAL; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+			if (node->reginfo[i].regs) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+				break;
+			}
+		}
+		if (node) /* else return it back to cache list */
+			guc_capture_add_node_to_cachelist(guc->capture, node);
+	}
+	return ret;
+}
+
+static int __guc_capture_flushlog_complete(struct xe_guc *guc)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
+		GUC_CAPTURE_LOG_BUFFER
+	};
+
+	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static void __guc_capture_process_output(struct xe_guc *guc)
+{
+	unsigned int buffer_size, read_offset, write_offset, full_count;
+	struct xe_uc *uc = container_of(guc, typeof(*uc), guc);
+	struct guc_log_buffer_state log_buf_state_local;
+	struct guc_log_buffer_state *log_buf_state;
+	struct __guc_capture_bufstate buf;
+	void *src_data = NULL;
+	bool new_overflow;
+	int ret;
+
+	log_buf_state = (struct guc_log_buffer_state *)((ulong)guc->log.bo->vmap.vaddr +
+			(sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER));
+	src_data = (struct guc_log_buffer_state *)((ulong)guc->log.bo->vmap.vaddr +
+		   xe_guc_get_log_buffer_offset(&guc->log, GUC_CAPTURE_LOG_BUFFER));
+
+	/*
+	 * Make a copy of the state structure, inside GuC log buffer
+	 * (which is uncached mapped), on the stack to avoid reading
+	 * from it multiple times.
+	 */
+	memcpy(&log_buf_state_local, log_buf_state, sizeof(struct guc_log_buffer_state));
+
+	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_CAPTURE_LOG_BUFFER);
+	read_offset = log_buf_state_local.read_ptr;
+	write_offset = log_buf_state_local.sampled_write_ptr;
+	full_count = log_buf_state_local.buffer_full_cnt;
+
+	/* Bookkeeping stuff */
+	guc->log.stats[GUC_CAPTURE_LOG_BUFFER].flush += log_buf_state_local.flush_to_file;
+	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_CAPTURE_LOG_BUFFER,
+						     full_count);
+
+	/* Now copy the actual logs. */
+	if (unlikely(new_overflow)) {
+		/* copy the whole buffer in case of overflow */
+		read_offset = 0;
+		write_offset = buffer_size;
+	} else if (unlikely((read_offset > buffer_size) ||
+			(write_offset > buffer_size))) {
+		xe_gt_err(guc_to_gt(guc),
+			  "Register capture buffer in invalid state: read = 0x%X, size = 0x%X!\n",
+			  read_offset, buffer_size);
+		/* copy whole buffer as offsets are unreliable */
+		read_offset = 0;
+		write_offset = buffer_size;
+	}
+
+	buf.size = buffer_size;
+	buf.rd = read_offset;
+	buf.wr = write_offset;
+	buf.data = src_data;
+
+	if (!guc_read_stopped(guc)) {
+		do {
+			ret = guc_capture_extract_reglists(guc, &buf);
+		} while (ret >= 0);
+	}
+
+	/* Update the state of log buffer err-cap state */
+	log_buf_state->read_ptr = write_offset;
+	log_buf_state->flush_to_file = 0;
+	__guc_capture_flushlog_complete(guc);
+}
+
+void xe_guc_capture_process(struct xe_guc *guc)
+{
+	if (guc->capture)
+		__guc_capture_process_output(guc);
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4cde93c18a2d..3586306b23f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -948,6 +948,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		/* Selftest only at the moment */
 		break;
 	case XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
+		ret = xe_guc_error_capture_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE:
 		/* FIXME: Handle this */
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8e740b450ade..95b9b8852803 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -23,7 +23,9 @@
 #include "xe_force_wake.h"
 #include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_submit_types.h"
@@ -760,7 +762,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 	xe_sched_job_put(job);
 }
 
-static int guc_read_stopped(struct xe_guc *guc)
+int guc_read_stopped(struct xe_guc *guc)
 {
 	return atomic_read(&guc->submission_state.stopped);
 }
@@ -1702,6 +1704,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
+int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	u32 status;
+
+	if (unlikely(len != 1)) {
+		xe_gt_dbg(guc_to_gt(guc), "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	status = msg[0] & XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
+	if (status == XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
+		xe_gt_warn(guc_to_gt(guc), "G2H-Error capture no space");
+
+	xe_guc_capture_process(guc);
+
+	return 0;
+}
+
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index fc97869c5b86..0c4e01c4a7ec 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -19,12 +19,15 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc);
 int xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 
+int guc_read_stopped(struct xe_guc *guc);
+
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len);
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
+int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
-- 
2.34.1

