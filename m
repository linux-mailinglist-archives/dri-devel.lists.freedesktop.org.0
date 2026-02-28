Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IcIIEebomlI4QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:37:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B0E1C1244
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4530310E21F;
	Sat, 28 Feb 2026 07:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cpj7eftY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC610E1DD;
 Sat, 28 Feb 2026 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772264260; x=1803800260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nlKlJIV6c8UF49Q7WoBIm6g1G7LIw2iMkm8gvy/anME=;
 b=Cpj7eftYislGnQ9OJEFHMITeSQNp5Rsmohk2VfX0QJ5gIs4uGyhmiju3
 dtEUTUtOb3S0/hikqNEsIiS7iHPrG7tU4uOBrWpQr2zruunbfN8RR0yo/
 G4NK3GYLTc0mUlAtbjL0KK25IkxtiO81fgmEtBF8hWUOJHJ9Vk1PTPn4Y
 yEw8gjVe+RRaBeiu/6ck1xtol0daklDGCfpi5727v/UTmOA4sK//FLzXf
 3DQMNvN0SJz4RcGPAOZlvQpMHW8bOPpOnoK7BhNNGX9sqfaUDSYqKcWEt
 fH/bRth6FXo1WNbabbT/OUxlDvRXOkuWAOvbsFwFJiy885Zrjp81LY0sA A==;
X-CSE-ConnectionGUID: TGK+voykROeJDsRDsj88JA==
X-CSE-MsgGUID: m6nWUO6IRMCkgAcdwKsuUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73048407"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="73048407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 23:37:39 -0800
X-CSE-ConnectionGUID: SanxvoINSdG9TEWcmkBiYg==
X-CSE-MsgGUID: V6KAPx6ZRiWhxLTEcTFyhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="214465967"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 23:37:33 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v9 1/5] drm/ras: Introduce the DRM RAS infrastructure over
 generic netlink
Date: Sat, 28 Feb 2026 13:38:25 +0530
Message-ID: <20260228080858.3063532-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260228080858.3063532-7-riana.tauro@intel.com>
References: <20260228080858.3063532-7-riana.tauro@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,kernel.org,davemloft.net,redhat.com,google.com,vger.kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E4B0E1C1244
X-Rspamd-Action: no action

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Introduces the DRM RAS infrastructure over generic netlink.

The new interface allows drivers to expose RAS nodes and their
associated error counters to userspace in a structured and extensible
way. Each drm_ras node can register its own set of error counters, which
are then discoverable and queryable through netlink operations. This
lays the groundwork for reporting and managing hardware error states
in a unified manner across different DRM drivers.

Currently it only supports error-counter nodes. But it can be
extended later.

The registration is also not tied to any drm node, so it can be
used by accel devices as well.

It uses the new and mandatory YAML description format stored in
Documentation/netlink/specs/. This forces a single generic netlink
family namespace for the entire drm: "drm-ras".
But multiple-endpoints are supported within the single family.

Any modification to this API needs to be applied to
Documentation/netlink/specs/drm_ras.yaml before regenerating the
code:

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
 Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
 -o include/uapi/drm/drm_ras.h

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
  Documentation/netlink/specs/drm_ras.yaml --mode kernel \
  --header -o drivers/gpu/drm/drm_ras_nl.h

$ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
  Documentation/netlink/specs/drm_ras.yaml \
  --mode kernel --source -o drivers/gpu/drm/drm_ras_nl.c

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org
Co-developed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---
v2: fix doc and memory leak
    use xe_for_each_start
    use standard genlmsg_iput (Jakub Kicinski)

v3: add documentation to index
    modify documentation to mention uAPI requirements (Rodrigo)

v4: fix typo (Zack)

v5: fix kernel-robot reported htmldocs error
    fix kernel-robot reported build error on csky arch

v6: regenerate files
    fix yamllint warnings
    use get-error-counter for both do/dump function calls
    fix kernel-doc (Jakub)

v7: Fix ynl-regen.sh reported issue
    move drm_ras_nl.h from include/ to drm/
    use -o to generate files and fix commit message (Jakub)
---
 Documentation/gpu/drm-ras.rst            | 103 +++++++
 Documentation/gpu/index.rst              |   1 +
 Documentation/netlink/specs/drm_ras.yaml | 115 ++++++++
 drivers/gpu/drm/Kconfig                  |  10 +
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/drm_drv.c                |   6 +
 drivers/gpu/drm/drm_ras.c                | 354 +++++++++++++++++++++++
 drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
 drivers/gpu/drm/drm_ras_nl.c             |  56 ++++
 drivers/gpu/drm/drm_ras_nl.h             |  24 ++
 include/drm/drm_ras.h                    |  75 +++++
 include/drm/drm_ras_genl_family.h        |  17 ++
 include/uapi/drm/drm_ras.h               |  49 ++++
 13 files changed, 853 insertions(+)
 create mode 100644 Documentation/gpu/drm-ras.rst
 create mode 100644 Documentation/netlink/specs/drm_ras.yaml
 create mode 100644 drivers/gpu/drm/drm_ras.c
 create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
 create mode 100644 drivers/gpu/drm/drm_ras_nl.c
 create mode 100644 drivers/gpu/drm/drm_ras_nl.h
 create mode 100644 include/drm/drm_ras.h
 create mode 100644 include/drm/drm_ras_genl_family.h
 create mode 100644 include/uapi/drm/drm_ras.h

diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm-ras.rst
new file mode 100644
index 000000000000..70b246a78fc8
--- /dev/null
+++ b/Documentation/gpu/drm-ras.rst
@@ -0,0 +1,103 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+============================
+DRM RAS over Generic Netlink
+============================
+
+The DRM RAS (Reliability, Availability, Serviceability) interface provides a
+standardized way for GPU/accelerator drivers to expose error counters and
+other reliability nodes to user space via Generic Netlink. This allows
+diagnostic tools, monitoring daemons, or test infrastructure to query hardware
+health in a uniform way across different DRM drivers.
+
+Key Goals:
+
+* Provide a standardized RAS solution for GPU and accelerator drivers, enabling
+  data center monitoring and reliability operations.
+* Implement a single drm-ras Generic Netlink family to meet modern Netlink YAML
+  specifications and centralize all RAS-related communication in one namespace.
+* Support a basic error counter interface, addressing the immediate, essential
+  monitoring needs.
+* Offer a flexible, future-proof interface that can be extended to support
+  additional types of RAS data in the future.
+* Allow multiple nodes per driver, enabling drivers to register separate
+  nodes for different IP blocks, sub-blocks, or other logical subdivisions
+  as applicable.
+
+Nodes
+=====
+
+Nodes are logical abstractions representing an error type or error source within
+the device. Currently, only error counter nodes is supported.
+
+Drivers are responsible for registering and unregistering nodes via the
+`drm_ras_node_register()` and `drm_ras_node_unregister()` APIs.
+
+Node Management
+-------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_ras.c
+   :doc: DRM RAS Node Management
+.. kernel-doc:: drivers/gpu/drm/drm_ras.c
+   :internal:
+
+Generic Netlink Usage
+=====================
+
+The interface is implemented as a Generic Netlink family named ``drm-ras``.
+User space tools can:
+
+* List registered nodes with the ``list-nodes`` command.
+* List all error counters in an node with the ``get-error-counter`` command with ``node-id``
+  as a parameter.
+* Query specific error counter values with the ``get-error-counter`` command, using both
+  ``node-id`` and ``error-id`` as parameters.
+
+YAML-based Interface
+--------------------
+
+The interface is described in a YAML specification ``Documentation/netlink/specs/drm_ras.yaml``
+
+This YAML is used to auto-generate user space bindings via
+``tools/net/ynl/pyynl/ynl_gen_c.py``, and drives the structure of netlink
+attributes and operations.
+
+Usage Notes
+-----------
+
+* User space must first enumerate nodes to obtain their IDs.
+* Node IDs or Node names can be used for all further queries, such as error counters.
+* Error counters can be queried by either the Error ID or Error name.
+* Query Parameters should be defined as part of the uAPI to ensure user interface stability.
+* The interface supports future extension by adding new node types and
+  additional attributes.
+
+Example: List nodes using ynl
+
+.. code-block:: bash
+
+    sudo ynl --family drm_ras --dump list-nodes
+    [{'device-name': '0000:03:00.0',
+    'node-id': 0,
+    'node-name': 'correctable-errors',
+    'node-type': 'error-counter'},
+    {'device-name': '0000:03:00.0',
+     'node-id': 1,
+     'node-name': 'uncorrectable-errors',
+     'node-type': 'error-counter'}]
+
+Example: List all error counters using ynl
+
+.. code-block:: bash
+
+    sudo ynl --family drm_ras --dump get-error-counter --json '{"node-id":0}'
+    [{'error-id': 1, 'error-name': 'error_name1', 'error-value': 0},
+    {'error-id': 2, 'error-name': 'error_name2', 'error-value': 0}]
+
+Example: Query an error counter for a given node
+
+.. code-block:: bash
+
+    sudo ynl --family drm_ras --do get-error-counter --json '{"node-id":0, "error-id":1}'
+    {'error-id': 1, 'error-name': 'error_name1', 'error-value': 0}
+
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 2fafa1f35ef3..5d708a106b3f 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -9,6 +9,7 @@ GPU Driver Developer's Guide
    drm-mm
    drm-kms
    drm-kms-helpers
+   drm-ras
    drm-uapi
    drm-usage-stats
    driver-uapi
diff --git a/Documentation/netlink/specs/drm_ras.yaml b/Documentation/netlink/specs/drm_ras.yaml
new file mode 100644
index 000000000000..79af25dac3c5
--- /dev/null
+++ b/Documentation/netlink/specs/drm_ras.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+---
+name: drm-ras
+protocol: genetlink
+uapi-header: drm/drm_ras.h
+
+doc: >-
+  DRM RAS (Reliability, Availability, Serviceability) over Generic Netlink.
+  Provides a standardized mechanism for DRM drivers to register "nodes"
+  representing hardware/software components capable of reporting error counters.
+  Userspace tools can query the list of nodes or individual error counters
+  via the Generic Netlink interface.
+
+definitions:
+  -
+    type: enum
+    name: node-type
+    value-start: 1
+    entries: [error-counter]
+    doc: >-
+         Type of the node. Currently, only error-counter nodes are
+         supported, which expose reliability counters for a hardware/software
+         component.
+
+attribute-sets:
+  -
+    name: node-attrs
+    attributes:
+      -
+        name: node-id
+        type: u32
+        doc: >-
+             Unique identifier for the node.
+             Assigned dynamically by the DRM RAS core upon registration.
+      -
+        name: device-name
+        type: string
+        doc: >-
+             Device name chosen by the driver at registration.
+             Can be a PCI BDF, UUID, or module name if unique.
+      -
+        name: node-name
+        type: string
+        doc: >-
+             Node name chosen by the driver at registration.
+             Can be an IP block name, or any name that identifies the
+             RAS node inside the device.
+      -
+        name: node-type
+        type: u32
+        doc: Type of this node, identifying its function.
+        enum: node-type
+  -
+    name: error-counter-attrs
+    attributes:
+      -
+        name: node-id
+        type: u32
+        doc: Node ID targeted by this error counter operation.
+      -
+        name: error-id
+        type: u32
+        doc: Unique identifier for a specific error counter within an node.
+      -
+        name: error-name
+        type: string
+        doc: Name of the error.
+      -
+        name: error-value
+        type: u32
+        doc: Current value of the requested error counter.
+
+operations:
+  list:
+    -
+      name: list-nodes
+      doc: >-
+           Retrieve the full list of currently registered DRM RAS nodes.
+           Each node includes its dynamically assigned ID, name, and type.
+           **Important:** User space must call this operation first to obtain
+           the node IDs. These IDs are required for all subsequent
+           operations on nodes, such as querying error counters.
+      attribute-set: node-attrs
+      flags: [admin-perm]
+      dump:
+        reply:
+          attributes:
+            - node-id
+            - device-name
+            - node-name
+            - node-type
+    -
+      name: get-error-counter
+      doc: >-
+           Retrieve error counter for a given node.
+           The response includes the id, the name, and even the current
+           value of each counter.
+      attribute-set: error-counter-attrs
+      flags: [admin-perm]
+      do:
+        request:
+          attributes:
+            - node-id
+            - error-id
+        reply:
+          attributes: &errorinfo
+            - error-id
+            - error-name
+            - error-value
+      dump:
+        request:
+          attributes:
+            - node-id
+        reply:
+          attributes: *errorinfo
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0d0657dd1b41..5386248e75b6 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -130,6 +130,16 @@ config DRM_PANIC_SCREEN_QR_VERSION
 	  Smaller QR code are easier to read, but will contain less debugging
 	  data. Default is 40.
 
+config DRM_RAS
+	bool "DRM RAS support"
+	depends on DRM
+	depends on NET
+	help
+	  Enables the DRM RAS (Reliability, Availability and Serviceability)
+	  support for DRM drivers. This provides a Generic Netlink interface
+	  for error reporting and queries.
+	  If in doubt, say "N".
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index aba4bf542a35..e97faabcd783 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -93,6 +93,7 @@ drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
 drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 drm-$(CONFIG_DRM_DRAW) += drm_draw.o
 drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
+drm-$(CONFIG_DRM_RAS) += drm_ras.o drm_ras_nl.o drm_ras_genl_family.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce..6b965c3d3307 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -53,6 +53,7 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
+#include <drm/drm_ras_genl_family.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -1223,6 +1224,7 @@ static const struct file_operations drm_stub_fops = {
 
 static void drm_core_exit(void)
 {
+	drm_ras_genl_family_unregister();
 	drm_privacy_screen_lookup_exit();
 	drm_panic_exit();
 	accel_core_exit();
@@ -1261,6 +1263,10 @@ static int __init drm_core_init(void)
 
 	drm_privacy_screen_lookup_init();
 
+	ret = drm_ras_genl_family_register();
+	if (ret < 0)
+		goto error;
+
 	drm_core_init_complete = true;
 
 	DRM_DEBUG("Initialized\n");
diff --git a/drivers/gpu/drm/drm_ras.c b/drivers/gpu/drm/drm_ras.c
new file mode 100644
index 000000000000..23d2c8159e09
--- /dev/null
+++ b/drivers/gpu/drm/drm_ras.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/netdevice.h>
+#include <linux/xarray.h>
+#include <net/genetlink.h>
+
+#include <drm/drm_ras.h>
+
+#include "drm_ras_nl.h"
+
+/**
+ * DOC: DRM RAS Node Management
+ *
+ * This module provides the infrastructure to manage RAS (Reliability,
+ * Availability, and Serviceability) nodes for DRM drivers. Each
+ * DRM driver may register one or more RAS nodes, which represent
+ * logical components capable of reporting error counters and other
+ * reliability metrics.
+ *
+ * The nodes are stored in a global xarray `drm_ras_xa` to allow
+ * efficient lookup by ID. Nodes can be registered or unregistered
+ * dynamically at runtime.
+ *
+ * A Generic Netlink family `drm_ras` exposes two main operations to
+ * userspace:
+ *
+ * 1. LIST_NODES: Dump all currently registered RAS nodes.
+ *    The user receives an array of node IDs, names, and types.
+ *
+ * 2. GET_ERROR_COUNTER: Get error counters of a given node.
+ *    Userspace must provide Node ID, Error ID (Optional for specific counter).
+ *    Returns all counters of a node if only Node ID is provided or specific
+ *    error counters.
+ *
+ * Node registration:
+ *
+ * - drm_ras_node_register(): Registers a new node and assigns
+ *   it a unique ID in the xarray.
+ * - drm_ras_node_unregister(): Removes a previously registered
+ *   node from the xarray.
+ *
+ * Node type:
+ *
+ * - ERROR_COUNTER:
+ *     + Currently, only error counters are supported.
+ *     + The driver must implement the query_error_counter() callback to provide
+ *       the name and the value of the error counter.
+ *     + The driver must provide a error_counter_range.last value informing the
+ *       last valid error ID.
+ *     + The driver can provide a error_counter_range.first value informing the
+ *       first valid error ID.
+ *     + The error counters in the driver doesn't need to be contiguous, but the
+ *       driver must return -ENOENT to the query_error_counter as an indication
+ *       that the ID should be skipped and not listed in the netlink API.
+ *
+ * Netlink handlers:
+ *
+ * - drm_ras_nl_list_nodes_dumpit(): Implements the LIST_NODES
+ *   operation, iterating over the xarray.
+ * - drm_ras_nl_get_error_counter_dumpit(): Implements the GET_ERROR_COUNTER dumpit
+ *   operation, fetching all counters from a specific node.
+ * - drm_ras_nl_get_error_counter_doit(): Implements the GET_ERROR_COUNTER doit
+ *   operation, fetching a counter value from a specific node.
+ */
+
+static DEFINE_XARRAY_ALLOC(drm_ras_xa);
+
+/*
+ * The netlink callback context carries dump state across multiple dumpit calls
+ */
+struct drm_ras_ctx {
+	/* Which xarray id to restart the dump from */
+	unsigned long restart;
+};
+
+/**
+ * drm_ras_nl_list_nodes_dumpit() - Dump all registered RAS nodes
+ * @skb: Netlink message buffer
+ * @cb: Callback context for multi-part dumps
+ *
+ * Iterates over all registered RAS nodes in the global xarray and appends
+ * their attributes (ID, name, type) to the given netlink message buffer.
+ * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
+ * multi-part dump support. On buffer overflow, updates the context to resume
+ * from the last node on the next invocation.
+ *
+ * Return: 0 if all nodes fit in @skb, number of bytes added to @skb if
+ *          the buffer filled up (requires multi-part continuation), or
+ *          a negative error code on failure.
+ */
+int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
+				 struct netlink_callback *cb)
+{
+	const struct genl_info *info = genl_info_dump(cb);
+	struct drm_ras_ctx *ctx = (void *)cb->ctx;
+	struct drm_ras_node *node;
+	struct nlattr *hdr;
+	unsigned long id;
+	int ret;
+
+	xa_for_each_start(&drm_ras_xa, id, node, ctx->restart) {
+		hdr = genlmsg_iput(skb, info);
+		if (!hdr) {
+			ret = -EMSGSIZE;
+			break;
+		}
+
+		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_ID, node->id);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+				     node->device_name);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		ret = nla_put_string(skb, DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+				     node->node_name);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		ret = nla_put_u32(skb, DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+				  node->type);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		genlmsg_end(skb, hdr);
+	}
+
+	if (ret == -EMSGSIZE)
+		ctx->restart = id;
+
+	return ret;
+}
+
+static int get_node_error_counter(u32 node_id, u32 error_id,
+				  const char **name, u32 *value)
+{
+	struct drm_ras_node *node;
+
+	node = xa_load(&drm_ras_xa, node_id);
+	if (!node || !node->query_error_counter)
+		return -ENOENT;
+
+	if (error_id < node->error_counter_range.first ||
+	    error_id > node->error_counter_range.last)
+		return -EINVAL;
+
+	return node->query_error_counter(node, error_id, name, value);
+}
+
+static int msg_reply_value(struct sk_buff *msg, u32 error_id,
+			   const char *error_name, u32 value)
+{
+	int ret;
+
+	ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, error_id);
+	if (ret)
+		return ret;
+
+	ret = nla_put_string(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+			     error_name);
+	if (ret)
+		return ret;
+
+	return nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+			   value);
+}
+
+static int doit_reply_value(struct genl_info *info, u32 node_id,
+			    u32 error_id)
+{
+	struct sk_buff *msg;
+	struct nlattr *hdr;
+	const char *error_name;
+	u32 value;
+	int ret;
+
+	msg = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	hdr = genlmsg_iput(msg, info);
+	if (!hdr) {
+		nlmsg_free(msg);
+		return -EMSGSIZE;
+	}
+
+	ret = get_node_error_counter(node_id, error_id,
+				     &error_name, &value);
+	if (ret)
+		return ret;
+
+	ret = msg_reply_value(msg, error_id, error_name, value);
+	if (ret) {
+		genlmsg_cancel(msg, hdr);
+		nlmsg_free(msg);
+		return ret;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	return genlmsg_reply(msg, info);
+}
+
+/**
+ * drm_ras_nl_get_error_counter_dumpit() - Dump all Error Counters
+ * @skb: Netlink message buffer
+ * @cb: Callback context for multi-part dumps
+ *
+ * Iterates over all error counters in a given Node and appends
+ * their attributes (ID, name, value) to the given netlink message buffer.
+ * Uses @cb->ctx to track progress in case the message buffer fills up, allowing
+ * multi-part dump support. On buffer overflow, updates the context to resume
+ * from the last node on the next invocation.
+ *
+ * Return: 0 if all errors fit in @skb, number of bytes added to @skb if
+ *          the buffer filled up (requires multi-part continuation), or
+ *          a negative error code on failure.
+ */
+int drm_ras_nl_get_error_counter_dumpit(struct sk_buff *skb,
+					struct netlink_callback *cb)
+{
+	const struct genl_info *info = genl_info_dump(cb);
+	struct drm_ras_ctx *ctx = (void *)cb->ctx;
+	struct drm_ras_node *node;
+	struct nlattr *hdr;
+	const char *error_name;
+	u32 node_id, error_id, value;
+	int ret;
+
+	if (!info->attrs || !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID])
+		return -EINVAL;
+
+	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
+
+	node = xa_load(&drm_ras_xa, node_id);
+	if (!node)
+		return -ENOENT;
+
+	for (error_id = max(node->error_counter_range.first, ctx->restart);
+	     error_id <= node->error_counter_range.last;
+	     error_id++) {
+		ret = get_node_error_counter(node_id, error_id,
+					     &error_name, &value);
+		/*
+		 * For non-contiguous range, driver return -ENOENT as indication
+		 * to skip this ID when listing all errors.
+		 */
+		if (ret == -ENOENT)
+			continue;
+		if (ret)
+			return ret;
+
+		hdr = genlmsg_iput(skb, info);
+
+		if (!hdr) {
+			ret = -EMSGSIZE;
+			break;
+		}
+
+		ret = msg_reply_value(skb, error_id, error_name, value);
+		if (ret) {
+			genlmsg_cancel(skb, hdr);
+			break;
+		}
+
+		genlmsg_end(skb, hdr);
+	}
+
+	if (ret == -EMSGSIZE)
+		ctx->restart = error_id;
+
+	return ret;
+}
+
+/**
+ * drm_ras_nl_get_error_counter_doit() - Query an error counter of an node
+ * @skb: Netlink message buffer
+ * @info: Generic Netlink info containing attributes of the request
+ *
+ * Extracts the node ID and error ID from the netlink attributes and
+ * retrieves the current value of the corresponding error counter. Sends the
+ * result back to the requesting user via the standard Genl reply.
+ *
+ * Return: 0 on success, or negative errno on failure.
+ */
+int drm_ras_nl_get_error_counter_doit(struct sk_buff *skb,
+				      struct genl_info *info)
+{
+	u32 node_id, error_id;
+
+	if (!info->attrs ||
+	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
+	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
+		return -EINVAL;
+
+	node_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID]);
+	error_id = nla_get_u32(info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
+
+	return doit_reply_value(info, node_id, error_id);
+}
+
+/**
+ * drm_ras_node_register() - Register a new RAS node
+ * @node: Node structure to register
+ *
+ * Adds the given RAS node to the global node xarray and assigns it
+ * a unique ID. Both @node->name and @node->type must be valid.
+ *
+ * Return: 0 on success, or negative errno on failure:
+ */
+int drm_ras_node_register(struct drm_ras_node *node)
+{
+	if (!node->device_name || !node->node_name)
+		return -EINVAL;
+
+	/* Currently, only Error Counter Endpoints are supported */
+	if (node->type != DRM_RAS_NODE_TYPE_ERROR_COUNTER)
+		return -EINVAL;
+
+	/* Mandatory entries for Error Counter Node */
+	if (node->type == DRM_RAS_NODE_TYPE_ERROR_COUNTER &&
+	    (!node->error_counter_range.last || !node->query_error_counter))
+		return -EINVAL;
+
+	return xa_alloc(&drm_ras_xa, &node->id, node, xa_limit_32b, GFP_KERNEL);
+}
+EXPORT_SYMBOL(drm_ras_node_register);
+
+/**
+ * drm_ras_node_unregister() - Unregister a previously registered node
+ * @node: Node structure to unregister
+ *
+ * Removes the given node from the global node xarray using its ID.
+ */
+void drm_ras_node_unregister(struct drm_ras_node *node)
+{
+	xa_erase(&drm_ras_xa, node->id);
+}
+EXPORT_SYMBOL(drm_ras_node_unregister);
diff --git a/drivers/gpu/drm/drm_ras_genl_family.c b/drivers/gpu/drm/drm_ras_genl_family.c
new file mode 100644
index 000000000000..6f406d3d48c5
--- /dev/null
+++ b/drivers/gpu/drm/drm_ras_genl_family.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_ras_genl_family.h>
+#include "drm_ras_nl.h"
+
+/* Track family registration so the drm_exit can be called at any time */
+static bool registered;
+
+/**
+ * drm_ras_genl_family_register() - Register drm-ras genl family
+ *
+ * Only to be called one at drm_drv_init()
+ */
+int drm_ras_genl_family_register(void)
+{
+	int ret;
+
+	registered = false;
+
+	ret = genl_register_family(&drm_ras_nl_family);
+	if (ret)
+		return ret;
+
+	registered = true;
+	return 0;
+}
+
+/**
+ * drm_ras_genl_family_unregister() - Unregister drm-ras genl family
+ *
+ * To be called one at drm_drv_exit() at any moment, but only once.
+ */
+void drm_ras_genl_family_unregister(void)
+{
+	if (registered) {
+		genl_unregister_family(&drm_ras_nl_family);
+		registered = false;
+	}
+}
diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
new file mode 100644
index 000000000000..16803d0c4a44
--- /dev/null
+++ b/drivers/gpu/drm/drm_ras_nl.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN kernel source */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include "drm_ras_nl.h"
+
+#include <uapi/drm/drm_ras.h>
+
+/* DRM_RAS_CMD_GET_ERROR_COUNTER - do */
+static const struct nla_policy drm_ras_get_error_counter_do_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {
+	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
+	[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] = { .type = NLA_U32, },
+};
+
+/* DRM_RAS_CMD_GET_ERROR_COUNTER - dump */
+static const struct nla_policy drm_ras_get_error_counter_dump_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {
+	[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] = { .type = NLA_U32, },
+};
+
+/* Ops table for drm_ras */
+static const struct genl_split_ops drm_ras_nl_ops[] = {
+	{
+		.cmd	= DRM_RAS_CMD_LIST_NODES,
+		.dumpit	= drm_ras_nl_list_nodes_dumpit,
+		.flags	= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
+	},
+	{
+		.cmd		= DRM_RAS_CMD_GET_ERROR_COUNTER,
+		.doit		= drm_ras_nl_get_error_counter_doit,
+		.policy		= drm_ras_get_error_counter_do_nl_policy,
+		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
+	{
+		.cmd		= DRM_RAS_CMD_GET_ERROR_COUNTER,
+		.dumpit		= drm_ras_nl_get_error_counter_dumpit,
+		.policy		= drm_ras_get_error_counter_dump_nl_policy,
+		.maxattr	= DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DUMP,
+	},
+};
+
+struct genl_family drm_ras_nl_family __ro_after_init = {
+	.name		= DRM_RAS_FAMILY_NAME,
+	.version	= DRM_RAS_FAMILY_VERSION,
+	.netnsok	= true,
+	.parallel_ops	= true,
+	.module		= THIS_MODULE,
+	.split_ops	= drm_ras_nl_ops,
+	.n_split_ops	= ARRAY_SIZE(drm_ras_nl_ops),
+};
diff --git a/drivers/gpu/drm/drm_ras_nl.h b/drivers/gpu/drm/drm_ras_nl.h
new file mode 100644
index 000000000000..06ccd9342773
--- /dev/null
+++ b/drivers/gpu/drm/drm_ras_nl.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN kernel header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
+
+#ifndef _LINUX_DRM_RAS_GEN_H
+#define _LINUX_DRM_RAS_GEN_H
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include <uapi/drm/drm_ras.h>
+
+int drm_ras_nl_list_nodes_dumpit(struct sk_buff *skb,
+				 struct netlink_callback *cb);
+int drm_ras_nl_get_error_counter_doit(struct sk_buff *skb,
+				      struct genl_info *info);
+int drm_ras_nl_get_error_counter_dumpit(struct sk_buff *skb,
+					struct netlink_callback *cb);
+
+extern struct genl_family drm_ras_nl_family;
+
+#endif /* _LINUX_DRM_RAS_GEN_H */
diff --git a/include/drm/drm_ras.h b/include/drm/drm_ras.h
new file mode 100644
index 000000000000..5d50209e51db
--- /dev/null
+++ b/include/drm/drm_ras.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __DRM_RAS_H__
+#define __DRM_RAS_H__
+
+#include <uapi/drm/drm_ras.h>
+
+/**
+ * struct drm_ras_node - A DRM RAS Node
+ */
+struct drm_ras_node {
+	/** @id: Unique identifier for the node. Dynamically assigned. */
+	u32 id;
+	/**
+	 * @device_name: Human-readable name of the device. Given by the driver.
+	 */
+	const char *device_name;
+	/** @node_name: Human-readable name of the node. Given by the driver. */
+	const char *node_name;
+	/** @type: Type of the node (enum drm_ras_node_type). */
+	enum drm_ras_node_type type;
+
+	/* Error-Counter Related Callback and Variables */
+
+	/** @error_counter_range: Range of valid Error IDs for this node. */
+	struct {
+		/** @first: First valid Error ID. */
+		u32 first;
+		/** @last: Last valid Error ID. Mandatory entry. */
+		u32 last;
+	} error_counter_range;
+
+	/**
+	 * @query_error_counter:
+	 *
+	 * This callback is used by drm-ras to query a specific error counter.
+	 * Used for input check and to iterate all error counters in a node.
+	 *
+	 * Driver should expect query_error_counter() to be called with
+	 * error_id from `error_counter_range.first` to
+	 * `error_counter_range.last`.
+	 *
+	 * The @query_error_counter is a mandatory callback for
+	 * error_counter_node.
+	 *
+	 * Returns: 0 on success,
+	 *          -ENOENT when error_id is not supported as an indication that
+	 *                  drm_ras should silently skip this entry. Used for
+	 *                  supporting non-contiguous error ranges.
+	 *                  Driver is responsible for maintaining the list of
+	 *                  supported error IDs in the range of first to last.
+	 *          Other negative values on errors that should terminate the
+	 *          netlink query.
+	 */
+	int (*query_error_counter)(struct drm_ras_node *node, u32 error_id,
+				   const char **name, u32 *val);
+
+	/** @priv: Driver private data */
+	void *priv;
+};
+
+struct drm_device;
+
+#if IS_ENABLED(CONFIG_DRM_RAS)
+int drm_ras_node_register(struct drm_ras_node *node);
+void drm_ras_node_unregister(struct drm_ras_node *node);
+#else
+static inline int drm_ras_node_register(struct drm_ras_node *node) { return 0; }
+static inline void drm_ras_node_unregister(struct drm_ras_node *node) { }
+#endif
+
+#endif
diff --git a/include/drm/drm_ras_genl_family.h b/include/drm/drm_ras_genl_family.h
new file mode 100644
index 000000000000..910fb3943a75
--- /dev/null
+++ b/include/drm/drm_ras_genl_family.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __DRM_RAS_GENL_FAMILY_H__
+#define __DRM_RAS_GENL_FAMILY_H__
+
+#if IS_ENABLED(CONFIG_DRM_RAS)
+int drm_ras_genl_family_register(void);
+void drm_ras_genl_family_unregister(void);
+#else
+static inline int drm_ras_genl_family_register(void) { return 0; }
+static inline void drm_ras_genl_family_unregister(void) { }
+#endif
+
+#endif
diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
new file mode 100644
index 000000000000..5f40fa5b869d
--- /dev/null
+++ b/include/uapi/drm/drm_ras.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
+
+#ifndef _UAPI_LINUX_DRM_RAS_H
+#define _UAPI_LINUX_DRM_RAS_H
+
+#define DRM_RAS_FAMILY_NAME	"drm-ras"
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
+	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+
+	__DRM_RAS_A_NODE_ATTRS_MAX,
+	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+
+	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_CMD_LIST_NODES = 1,
+	DRM_RAS_CMD_GET_ERROR_COUNTER,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#endif /* _UAPI_LINUX_DRM_RAS_H */
-- 
2.47.1

