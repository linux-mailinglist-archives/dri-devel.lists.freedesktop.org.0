Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E6CCFEC1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 13:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560E210EF84;
	Fri, 19 Dec 2025 12:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+Oj8Rf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE2310E486;
 Fri, 19 Dec 2025 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766149054; x=1797685054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VP+ya5c5i9/YhY1xiApIuSw9QnnDMkC/N+U1/iZndn0=;
 b=S+Oj8Rf+KtnKt8RsDwjexiIe9Kr8PgBh1OqMiKXzdC/tniWMLBjHmwDT
 fxccCZjZD71FbFm56IBKnDcFs3AIkNhcCGm0sDjHJzb3mbb1siarARiiB
 J9x925gU7QFByi3VEc1HAG5imtmNY5azMVLZfVaYp6x4ssVErhnh95PNM
 G8p5Dk2DWOnMdpWc2irPlYuOkXDuPLxTYg4+xpzI4c1wdK6KLWonJiAeF
 dz9RoNs4cBjYwql5sQ0tXLqLwjaAG4zkWtlnlkswoR2fZmRNNiBDkG5vd
 LoAqMlpeg2FHPXvXT3oU0LIrTWCQ1lZr+vYDZxyyIcL/uxVyGd6zHyPMK Q==;
X-CSE-ConnectionGUID: ZRA6Vq01S5GnPzgW4/dbSg==
X-CSE-MsgGUID: DB+80oiuQKC5MUif1ndeQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71954428"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71954428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:57:33 -0800
X-CSE-ConnectionGUID: 1msnVABnSKqrQt8nnpawhQ==
X-CSE-MsgGUID: kt72wbYET7+HEfU+9v4BCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198920548"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:57:31 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Tauro Riana <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Iddamsetty Aravind <aravind.iddamsetty@intel.com>
Subject: [PATCH i-g-t v4] tools/drm_ras: tool to communicate with DRM Netlink
 Subsystem
Date: Fri, 19 Dec 2025 18:26:53 +0530
Message-Id: <20251219125653.1325766-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User space tool for querying GPU health monitoring RAS events via
Generic Netlink Socket interface from Kernel's DRM Netlink Subsystem.
Available Commands are
	- List Nodes
	- Get Error Counters
	- Query Error Counter

Below are the example usage of the tool

Examples:

$./build/tools/drm_ras list_nodes
node-id   device-name    	node-name       	node-type
0         0000:03:00.0   	correctable-errors	1
1         0000:03:00.0   	nonfatal-errors		1
2         0000:03:00.0   	fatal-errors		1

$./build/tools/drm_ras get_error_counters --node-id=1
error-id  error-name            error-value
1         Core Compute Error    0
2         SOC Internal Error    0

$./build/tools/drm_ras query_error_counter --node-id=1 --error-id=1
counter value 0

$./build/tools/drm_ras query_error_counter --node-id=1
--error-name="Core Compute Error"
Resolving error_name "Core Compute Error" to get error_id
Retrieved error_id 1 from error_name Core Compute Error
counter value 0

Cc: Tauro Riana <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
Co-developed-by: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
Signed-off-by: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

---
V3 -> V4:
	- Introduced new command to query error counter using error-name
V2 -> V3:
	- Created handle_err() function to remove redundant code
	- Handled more error scenarios while passing command line arguments
	- Resolved formatting issues (Rodrigo)

V1 -> V2:
	- Removed device_id from the input parameters
	- Updated help() function
	- Incorporated error handling logic
---
---
 include/drm-uapi/drm_ras.h |  79 ++++++
 meson.build                |   5 +-
 tools/drm_ras.c            | 556 +++++++++++++++++++++++++++++++++++++
 tools/meson.build          |   5 +
 4 files changed, 644 insertions(+), 1 deletion(-)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 tools/drm_ras.c

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
new file mode 100644
index 000000000..af893aa36
--- /dev/null
+++ b/include/drm-uapi/drm_ras.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+
+#ifndef _LINUX_DRM_RAS_H
+#define _LINUX_DRM_RAS_H
+
+#define DRM_RAS_GENL_NAME "drm-ras"
+#define DRM_RAS_FAMILY_VERSION	1
+
+/*
+ * Type of the node. Currently, only error-counter nodes are supported, which
+ * expose reliability counters for a hardware/software component.
+ */
+enum drm_ras_node_type {
+	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+};
+
+enum {
+	/* Unique identifier for the node*/
+	DRM_RAS_NODE_ATTR_NODE_ID = 1,
+
+	/* Device name chosen by the driver at the time of registration */
+	DRM_RAS_NODE_ATTR_DEVICE_NAME,
+
+	/* Node name chosen by the driver at registration to identify RAS node inside the device */
+	DRM_RAS_NODE_ATTR_NODE_NAME,
+
+	/* Type of the node, identifying its function */
+	DRM_RAS_NODE_ATTR_NODE_TYPE,
+
+	__DRM_RAS_NODE_ATTR_MAX,
+	DRM_RAS_NODE_ATTR_MAX = (__DRM_RAS_NODE_ATTR_MAX - 1)
+};
+
+enum {
+	/* Node ID targeted by this error counter operation */
+	DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID = 1,
+
+	/* Unique identifier for a specific error counter within an node */
+	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID,
+
+	/* Name of the requested error counter */
+	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME,
+
+	/* Current value of the requested error counter */
+	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE,
+
+	__DRM_RAS_ERROR_COUNTER_ATTR_MAX,
+	DRM_RAS_ERROR_COUNTER_ATTR_MAX = (__DRM_RAS_ERROR_COUNTER_ATTR_MAX - 1)
+};
+
+enum drm_genl_error_cmds {
+	/**
+	 * @DRM_RAS_CMD_LIST_NODES: Command to Retrieve the full list of currently registered
+	 * DRM RAS nodes.Each node includes its dynamically assigned ID, name, and type.
+	 * Obtain the Node IDs by calling this command and use it in the subsequent operations
+	 * on the nodes.
+	 */
+	DRM_RAS_CMD_LIST_NODES = 1,
+
+	/**
+	 * @DRM_RAS_CMD_GET_ERROR_COUNTERS: Retrieve the full list of error counters for a given
+	 * node. The response include id, name, and current value of each counter.
+	 */
+	DRM_RAS_CMD_GET_ERROR_COUNTERS,
+
+	/**
+	 * @DRM_RAS_CMD_QUERY_ERROR_COUNTER: Query the information of a specific error counter
+	 * for a given node. Response contains id, name, and current value of the counter.
+	 */
+	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#endif /* _LINUX_DRM_RAS_H */
diff --git a/meson.build b/meson.build
index db6e09a94..f7807660e 100644
--- a/meson.build
+++ b/meson.build
@@ -165,10 +165,13 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
+libnl = dependency('libnl-3.0', required: false)
+libnl_genl = dependency('libnl-genl-3.0', required: false)
+libnl_cli = dependency('libnl-cli-3.0', required:false)
+
 xmlrpc = dependency('xmlrpc', required : false)
 xmlrpc_util = dependency('xmlrpc_util', required : false)
 xmlrpc_client = dependency('xmlrpc_client', required : false)
-
 xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
 if not xmlrpc.found() and xmlrpc_cmd.found()
 	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
diff --git a/tools/drm_ras.c b/tools/drm_ras.c
new file mode 100644
index 000000000..13aab347a
--- /dev/null
+++ b/tools/drm_ras.c
@@ -0,0 +1,556 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <ctype.h>
+#include <getopt.h>
+#include <linux/genetlink.h>
+#include <netlink/netlink.h>
+#include <netlink/cache.h>
+#include <netlink/genl/genl.h>
+#include <netlink/genl/ctrl.h>
+#include <netlink/cli/utils.h>
+#include <netlink/cli/link.h>
+#include "../include/drm-uapi/drm_ras.h"
+#include "igt_device_scan.h"
+
+#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
+
+struct nl_sock *mcsock;
+
+enum opt_val {
+	OPT_UNKNOWN = '?',
+	OPT_END = -1,
+	OPT_NODEID,
+	OPT_ERRORID,
+	OPT_ERRORNAME,
+	OPT_HELP,
+};
+
+enum cmd_ids {
+	INVALID_CMD = -1,
+	LIST_NODES = 0,
+	GET_ERROR_COUNTERS,
+	QUERY_ERROR_COUNTER,
+
+	__MAX_CMDS,
+};
+
+static const char * const cmd_names[] = {
+	"list_nodes",
+	"get_error_counters",
+	"query_error_counter",
+};
+
+struct err_mapping {
+	uint32_t node_id;
+	uint32_t error_id;
+	char error_name[65];
+};
+
+struct app_context {
+	enum drm_genl_error_cmds command;
+	struct nl_sock *sock;
+	struct nl_cb *cb;
+	uint32_t node_id;
+	uint32_t error_id;
+	int error;
+	int family_id;
+	char error_name[65];
+	struct err_mapping *err_mappings;
+	int num_mappings;
+	int err_map_capacity;
+	bool is_mapping;
+};
+
+static void help(char **argv)
+{
+	int i;
+
+	printf("Usage: %s command [<command options>]\n", argv[0]);
+	printf("commands:\n");
+
+	for (i = 0; i < __MAX_CMDS; i++) {
+		switch (i) {
+		case LIST_NODES:
+			printf("%s %s\n",
+			       argv[0],
+			       cmd_names[i]);
+			break;
+		case GET_ERROR_COUNTERS:
+			printf("%s %s --node-id=<node-id>\n",
+				argv[0],
+				cmd_names[i]);
+			break;
+		case QUERY_ERROR_COUNTER:
+			printf("%s %s --node-id=<node-id> "
+				"--error-id=<error-id>\n",
+				argv[0],
+				cmd_names[i]);
+			printf("%s %s --node-id=<node-id> "
+				"--error-name=<error-name>\n",
+				argv[0],
+				cmd_names[i]);
+			break;
+		default:
+			printf("%s is Unknown Command\n",
+			       (i < __MAX_CMDS && cmd_names[i]) ? cmd_names[i] : "Unknown");
+		}
+	}
+}
+
+static void handle_err(struct nl_sock *sock, int ret, const char *err_msg)
+{
+	nl_close(sock);
+	nl_socket_free(sock);
+	nl_cli_fatal(ret, err_msg);
+}
+
+static uint32_t get_error_id_by_name(struct app_context *ctx, const char *error_name)
+{
+	int i = 0;
+
+	for (i = 0; i < ctx->num_mappings; ++i) {
+		if (strcmp(ctx->err_mappings[i].error_name, error_name) == 0 &&
+		    ctx->err_mappings[i].node_id == ctx->node_id) {
+			return ctx->err_mappings[i].error_id;
+		}
+	}
+
+	return -1;
+}
+
+static void __send_cmd(int cmd, void *arg)
+{
+	struct app_context *ctx = (struct app_context *)arg;
+	struct nl_msg *msg;
+	void *msg_head;
+	int ret;
+
+	msg = nlmsg_alloc();
+	if (!msg)
+		handle_err(ctx->sock, NLE_INVAL, "nlmsg_alloc failed\n");
+
+	switch (cmd) {
+	case DRM_RAS_CMD_LIST_NODES:
+		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
+				       ctx->family_id, 0,
+				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
+				       cmd, 1);
+		if (!msg_head)
+			handle_err(ctx->sock, ENOMEM, "genlmsg_put failed\n");
+
+		if (!ctx->is_mapping)
+			printf("%-18s\t%-30s\t%-30s\t%-18s\n",
+				"node-id", "device-name", "node-name", "node-type");
+		break;
+	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
+		if (ctx->node_id == -1) {
+			fprintf(stderr, "Error: --node-id is required for %s command\n",
+				cmd_names[ctx->command - 1]);
+			exit(EXIT_FAILURE);
+		}
+		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
+				       ctx->family_id, 0,
+				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
+				       cmd, 1);
+
+		if (!msg_head)
+			handle_err(ctx->sock, ENOMEM, "genlmsg_put failed\n");
+
+		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
+		if (!ctx->is_mapping)
+			printf("%-18s\t%-30s\t%-18s\n",
+				"error-id", "error-name", "error-value");
+
+		break;
+	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
+		if (ctx->node_id == -1) {
+			fprintf(stderr,
+				"Error: --node-id is required for %s command\n",
+				cmd_names[ctx->command - 1]);
+			exit(EXIT_FAILURE);
+		}
+
+		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
+				       ctx->family_id, 0,
+				       NLM_F_REQUEST | NLM_F_ACK,
+				       cmd, 1);
+
+		if (!msg_head)
+			handle_err(ctx->sock, ENOMEM, "genlmsg_put failed\n");
+
+		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
+		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID, ctx->error_id);
+		break;
+	default:
+		break;
+	}
+
+	ret = nl_send_auto(ctx->sock, msg);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
+
+	ret = nl_recvmsgs_default(ctx->sock);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
+
+	nlmsg_free(msg);
+}
+
+
+static void query_by_error_name(struct app_context *ctx)
+{
+	enum drm_genl_error_cmds orig_command = ctx->command;
+	uint32_t error_id_from_name = 0;
+
+	ctx->is_mapping = true;
+	ctx->num_mappings = 0;
+
+	ctx->command = DRM_RAS_CMD_GET_ERROR_COUNTERS;
+
+	/* Map error_id with error_name using get_error_counters op */
+	__send_cmd(DRM_RAS_CMD_GET_ERROR_COUNTERS, ctx);
+
+	ctx->command = orig_command;
+
+	/* Get the error_id from the given error_name */
+	error_id_from_name = get_error_id_by_name(ctx, ctx->error_name);
+	if (error_id_from_name == (uint32_t)-1) {
+		fprintf(stderr, "Error: Unable to find error-name %s for node %d\n",
+				ctx->error_name, ctx->node_id);
+		handle_err(ctx->sock,
+			   NLE_FAILURE,
+			   "Unable to find given error-name for the given node\n"
+			   );
+	}
+
+	/* Query the error counter with retrieved error_id */
+	ctx->is_mapping = false;
+	ctx->error_id = error_id_from_name;
+	__send_cmd(DRM_RAS_CMD_QUERY_ERROR_COUNTER, ctx);
+
+}
+
+static void send_cmd(int cmd, void *arg)
+{
+	struct app_context *ctx = (struct app_context *)arg;
+
+	if (cmd == DRM_RAS_CMD_QUERY_ERROR_COUNTER &&
+	    ctx->error_id == -1 &&
+	    strlen(ctx->error_name) > 0) {
+		query_by_error_name(ctx);
+	} else {
+		__send_cmd(cmd, ctx);
+	}
+}
+
+
+static int list_nodes_handler(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct nlattr *nla;
+	int len, remain;
+
+	len = GENL_HDRLEN;
+	nlmsg_for_each_attr(nla, nlh, len, remain) {
+		if (nla_type(nla) > DRM_RAS_NODE_ATTR_MAX) {
+			printf("Unknown Node attribute type: %d\n", nla_type(nla));
+			return NL_SKIP;
+		}
+
+		switch (nla_type(nla)) {
+		case DRM_RAS_NODE_ATTR_NODE_ID:
+			printf("%-18u\t", nla_get_u32(nla));
+			break;
+		case DRM_RAS_NODE_ATTR_DEVICE_NAME:
+			printf("%-30s\t", nla_get_string(nla));
+			break;
+		case DRM_RAS_NODE_ATTR_NODE_NAME:
+			printf("%-30s\t", nla_get_string(nla));
+			break;
+		case DRM_RAS_NODE_ATTR_NODE_TYPE:
+			printf("%-18u\n", nla_get_u32(nla));
+			break;
+		default:
+			printf("Unknown attribute type: %d\n", nla_type(nla));
+			break;
+		}
+	}
+	return NL_OK;
+}
+
+static int query_error_counter(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct app_context *ctx = (struct app_context *)arg;
+	struct nlattr *attrs[256];
+	int ret;
+
+	ret = genlmsg_parse(nlh, 0, attrs, 256, NULL);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to parse attributes: %s\n", nl_geterror(ret));
+		return NL_SKIP;
+	}
+
+	if (!attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE])
+		handle_err(ctx->sock,
+			   NLE_FAILURE,
+			   "DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE attribute is missing\n"
+			   );
+
+	printf("counter value %u\n", nla_get_u32(attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]));
+
+	return NL_OK;
+}
+
+static int get_error_counters(struct nl_msg *msg, void *arg)
+{
+	struct app_context *ctx = (struct app_context *)arg;
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct nlattr *nla;
+	int len, remain;
+	uint32_t curr_error_id = 0;
+	char curr_error_name[65] = {0};
+
+	len = GENL_HDRLEN;
+
+	nlmsg_for_each_attr(nla, nlh, len, remain) {
+		if (nla_type(nla) > DRM_RAS_ERROR_COUNTER_ATTR_MAX) {
+			printf("Unknown error counter attribute type: %d\n", nla_type(nla));
+			return NL_SKIP;
+		}
+
+		switch (nla_type(nla)) {
+		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID:
+			curr_error_id = nla_get_u32(nla);
+			if (!ctx->is_mapping)
+				printf("%-18u\t", curr_error_id);
+			break;
+		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME:
+			strncpy(curr_error_name, nla_get_string(nla), sizeof(curr_error_name) - 1);
+			curr_error_name[sizeof(curr_error_name) - 1] = '\0';
+			if (!ctx->is_mapping)
+				printf("%-30s\t", curr_error_name);
+			break;
+		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE:
+			if (!ctx->is_mapping)
+				printf("%-18u\n", nla_get_u32(nla));
+
+			if (ctx->is_mapping) {
+				if (ctx->num_mappings >= ctx->err_map_capacity) {
+					ctx->err_map_capacity = ctx->err_map_capacity
+								? ctx->err_map_capacity * 2
+								: 10;
+					ctx->err_mappings = realloc(ctx->err_mappings,
+						ctx->err_map_capacity * sizeof(struct err_mapping));
+					if (!ctx->err_mappings) {
+						fprintf(stderr, "Memory allocation failed\n");
+						handle_err(ctx->sock, NLE_FAILURE, "Memory allocation failed\n");
+					}
+				}
+
+				ctx->err_mappings[ctx->num_mappings].error_id = curr_error_id;
+				len = sizeof(ctx->err_mappings[ctx->num_mappings].error_name);
+				snprintf(ctx->err_mappings[ctx->num_mappings].error_name,
+					len, "%s", curr_error_name);
+				ctx->err_mappings[ctx->num_mappings].error_name[len - 1] = '\0';
+				ctx->err_mappings[ctx->num_mappings].node_id = ctx->node_id;
+				ctx->num_mappings++;
+			}
+			break;
+		default:
+			printf("Unknown attribute type: %d\n", nla_type(nla));
+			break;
+		}
+	}
+	return NL_OK;
+}
+
+static int drm_genl_handle_msg(struct nl_msg *msg, void *arg)
+{
+	struct app_context *ctx = (struct app_context *)arg;
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct genlmsghdr *gnlh = genlmsg_hdr(nlh);
+
+	if (gnlh->cmd != ctx->command) {
+		fprintf(stderr,
+			"Unexpected command response: got %d, expected %d\n",
+			gnlh->cmd,
+			ctx->command);
+		return NL_SKIP;
+	}
+
+	switch (ctx->command) {
+	case DRM_RAS_CMD_LIST_NODES:
+		return list_nodes_handler(msg, arg);
+	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
+		return get_error_counters(msg, arg);
+	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
+		return query_error_counter(msg, arg);
+	default:
+		fprintf(stderr, "Unknown command: %d\n", ctx->command);
+		ctx->error = -EOPNOTSUPP;
+		return NL_SKIP;
+	}
+}
+
+static int get_cmd(char *cmd_name)
+{
+	int i;
+
+	if (!cmd_name)
+		return -1;
+
+	for (i = 0; i < __DRM_RAS_CMD_MAX; i++) {
+		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
+			return i + 1;
+	}
+	return -1;
+}
+
+static int check_for_help(int argc, char **argv)
+{
+	for (int i = 1; i < argc; i++) {
+		if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0)
+			return 1;
+	}
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	char *endptr;
+	int ret, opt, option_index = 0;
+	struct app_context ctx = {0};
+	static struct option options[] = {
+		{"error-id", optional_argument, NULL, OPT_ERRORID},
+		{"node-id",  optional_argument, NULL, OPT_NODEID},
+		{"error-name", optional_argument, NULL, OPT_ERRORNAME},
+		{"help",     no_argument,       NULL, OPT_HELP},
+		{0, 0, 0, 0}
+	};
+
+	ctx.error_id = -1;
+	ctx.node_id = -1;
+	memset(ctx.error_name, '\0', sizeof(ctx.error_name));
+	ctx.is_mapping = false;
+	ctx.err_mappings = NULL;
+	ctx.num_mappings = 0;
+	ctx.err_map_capacity = 0;
+
+	if (argc < 2) {
+		fprintf(stderr, "\nNo Arguments were passed.\n\n"
+			"Use --help to see the correct usage.\n\n");
+		exit(EXIT_FAILURE);
+	}
+	if (check_for_help(argc, argv)) {
+		help(argv);
+		exit(EXIT_SUCCESS);
+	}
+
+	ctx.command = get_cmd(argv[1]);
+	if (ctx.command < 0) {
+		fprintf(stderr, "invalid command\n");
+		help(argv);
+		exit(EXIT_FAILURE);
+	}
+
+	optind = 2;
+	while ((opt = getopt_long(argc, argv, "h", options, &option_index)) != -1) {
+		switch (opt) {
+		case OPT_ERRORID:
+			if (strlen(optarg) == 0) {
+				printf("error-id not specified. check --help  for correct usage\n");
+				exit(EXIT_FAILURE);
+			}
+			ctx.error_id = strtoul(optarg, &endptr, 10);
+			if (*endptr != '\0' || ctx.error_id < 0) {
+				fprintf(stderr,
+					"\ninvalid error-id %s\n\n"
+					"Enter a valid error-id received from get_error_counters command\n\n",
+					optarg);
+				exit(EXIT_FAILURE);
+			}
+			break;
+		case OPT_ERRORNAME:
+			if (optarg == NULL || strlen(optarg) == 0) {
+				printf("error-name not specified. check --help for usage\n");
+				exit(EXIT_FAILURE);
+			}
+			if (strlen(optarg) >= sizeof(ctx.error_name)) {
+				fprintf(stderr,
+					"\ninvalid error-name %s\n\n"
+					"error-name is too long\n\n",
+					optarg);
+				exit(EXIT_FAILURE);
+			}
+			strncpy(ctx.error_name, optarg, sizeof(ctx.error_name)-1);
+			ctx.error_name[sizeof(ctx.error_name)-1] = '\0';
+			break;
+		case OPT_NODEID:
+			if (strlen(optarg) == 0) {
+				printf("node-id not specified. Check --help for correct usage\n");
+				exit(EXIT_FAILURE);
+			}
+
+			ctx.node_id = strtoul(optarg, &endptr, 10);
+			if (*endptr != '\0' || ctx.node_id < 0) {
+				fprintf(stderr,
+					"\ninvalid node id %s\n\n"
+					"Enter a valid node-id received from list_nodes command\n\n",
+					optarg);
+				exit(EXIT_FAILURE);
+			}
+
+			break;
+		case OPT_HELP:
+		case 'h':
+			help(argv);
+			exit(EXIT_SUCCESS);
+			break;
+		case '?':
+			fprintf(stderr,
+				"Unknown argument passed\n"
+				"Check --help for the correct usage\n\n");
+			exit(EXIT_FAILURE);
+			break;
+		default:
+			fprintf(stderr, "Unexpected option: %c\n", opt);
+			exit(EXIT_FAILURE);
+			break;
+		}
+	}
+
+	ctx.sock = nl_cli_alloc_socket();
+	if (!ctx.sock)
+		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
+
+	ret = nl_cli_connect(ctx.sock, NETLINK_GENERIC);
+	if (ret < 0)
+		handle_err(ctx.sock, ret, "Cannot connect handle\n");
+
+	ctx.family_id = genl_ctrl_resolve(ctx.sock, DRM_RAS_GENL_NAME);
+	if (ctx.family_id < 0)
+		handle_err(ctx.sock, NLE_INVAL, "Resolving of family name failed\n");
+
+	ret = nl_socket_modify_cb(ctx.sock, NL_CB_VALID, NL_CB_CUSTOM, drm_genl_handle_msg, &ctx);
+	if (ret < 0)
+		handle_err(ctx.sock, ret, "Unable to modify valid message callback\n");
+
+	send_cmd(ctx.command, &ctx);
+
+	nl_close(ctx.sock);
+	nl_socket_free(ctx.sock);
+
+	if (ctx.err_mappings)
+		free(ctx.err_mappings);
+
+	return 0;
+}
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..74ff97713 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,6 +70,11 @@ if libudev.found()
 		   install : true)
 endif
 
+executable('drm_ras', 'drm_ras.c',
+			dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
+			install_rpath : bindir_rpathdir,
+			install : true)
+
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-- 
2.34.1

