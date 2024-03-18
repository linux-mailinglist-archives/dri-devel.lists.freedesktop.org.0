Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133987F430
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 00:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9550410F255;
	Mon, 18 Mar 2024 23:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Z8rzyd6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CDA10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 23:42:35 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710805353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=w0W1TcwjE/iK1zTqE+wMMVfVgJ37P2hH21l+AHsTGLU=;
 b=Z8rzyd6xT1dNzDVSCg4FMo4Giv0Hab4i1vuixvZyDpIfCN1gIe7/RcxmKBV28btFqI0/MA
 Hw85v/PXbgXcRzfvd/iy4106ivcrwLMmWr8LVcgfkLDKNiq8sH1/PzKDAMBkfCnwL5oQwC
 zq8ZSOIJgMjL7reRdWijDLqfqe5Kmrw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] software node: Implement device_get_match_data fwnode callback
Date: Tue, 19 Mar 2024 07:42:22 +0800
Message-Id: <20240318234222.1278882-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

This makes it possible to support (and/or test) a few drivers that
originates from DT World on the x86-64 platform. Originally, those
drivers using the of_device_get_match_data() function to get match
data. For example, drivers/gpu/drm/bridge/simple-bridge.c and
drivers/gpu/drm/bridge/display-connector.c. Those drivers works very
well in the DT world, however, there is no counterpart to
of_device_get_match_data() when porting them to the x86 platform,
because x86 CPUs lack DT support.

By replacing it with device_get_match_data() and creating a software
graph that mimics the OF graph, everything else works fine, except that
there isn't an out-of-box replacement for the of_device_get_match_data()
function. Because the software node backend of the fwnode framework lacks
an implementation for the device_get_match_data callback.

Implement device_get_match_data fwnode callback fwnode callback to fill
this gap. Device drivers or platform setup codes are expected to provide
a "compatible" string property. The value of this string property is used
to match against the compatible entries in the of_device_id table. Which
is consistent with the original usage style.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/base/swnode.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 36512fb75a20..3670094592f2 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -8,6 +8,7 @@
 
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 
@@ -379,6 +380,30 @@ static void software_node_put(struct fwnode_handle *fwnode)
 	kobject_put(&swnode->kobj);
 }
 
+static const void *
+software_node_get_match_data(const struct fwnode_handle *fwnode,
+			     const struct device *dev)
+{
+	struct swnode *swnode = to_swnode(fwnode);
+	const struct of_device_id *matches = dev->driver->of_match_table;
+	const char *val = NULL;
+	int ret;
+
+	ret = property_entry_read_string_array(swnode->node->properties,
+					       "compatible", &val, 1);
+	if (ret < 0 || !val)
+		return NULL;
+
+	while (matches && matches->compatible[0]) {
+		if (!strcmp(matches->compatible, val))
+			return matches->data;
+
+		matches++;
+	}
+
+	return NULL;
+}
+
 static bool software_node_property_present(const struct fwnode_handle *fwnode,
 					   const char *propname)
 {
@@ -665,6 +690,7 @@ software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
+	.device_get_match_data = software_node_get_match_data,
 	.property_present = software_node_property_present,
 	.property_read_int_array = software_node_read_int_array,
 	.property_read_string_array = software_node_read_string_array,
-- 
2.34.1

