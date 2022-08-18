Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF595A01E2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC35992A0E;
	Wed, 24 Aug 2022 19:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A50810E29F;
 Thu, 18 Aug 2022 23:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660863797; x=1692399797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=niXsVpfGqDcnw/iyz1VZdTDJxGktMtC+b3TKnzJCApE=;
 b=iR0J32naEN64Jf4Bns60Q9jRwCII8ct/M/Yk4JzvlFNcJfxhqqU/zK2d
 cxgI+2q6ut30Qh2oHgwjw9RvcWyWfwv88+eGqKNEjzXh/cM+suIngNO7p
 MGFzGu4d/Cad9Y+zbL2ZrtjDau6jMoOcy60oofZw5T96WgwEfVqWSwPEb
 1QiBAA0HbnDAgYYqKhgv4/bF44vBUTEPu6+r4ssrq+Mjv0CC/5jRpsPrI
 Pe1D4H4mSRCd1XmT3bHwB30kf3B2ZfFjuIrC8BmN5RIujdinZ76bsMpLz
 G93LHT7IaphR3iq6t5iCZXrGWibqgby7hJgKFu1BcnLvh5RLkE0U3KFZj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293677542"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293677542"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="641042846"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/15] mei: pxp: add command streamer API to the PXP driver
Date: Thu, 18 Aug 2022 16:02:33 -0700
Message-Id: <20220818230243.3921066-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Lubart <vitaly.lubart@intel.com>

The discrete graphics card with GSC firmware
using command streamer API hence it requires to enhance
pxp module with the new gsc_command() handler.

The handler is implemented via mei_pxp_gsc_command() which is
just just a thin wrapper around mei_cldev_send_gsc_command()

V2:
 1. More detailed commit message
 2. Fix typo in the comments

Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/misc/mei/pxp/mei_pxp.c       | 28 ++++++++++++++++++++++++++++
 include/drm/i915_pxp_tee_interface.h |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
index 5c39457e3f53..17c5d201603f 100644
--- a/drivers/misc/mei/pxp/mei_pxp.c
+++ b/drivers/misc/mei/pxp/mei_pxp.c
@@ -77,10 +77,38 @@ mei_pxp_receive_message(struct device *dev, void *buffer, size_t size)
 	return byte;
 }
 
+/**
+ * mei_pxp_gsc_command() - sends a gsc command, by sending
+ * a sgl mei message to gsc and receiving reply from gsc
+ *
+ * @dev: device corresponding to the mei_cl_device
+ * @client_id: client id to send the command to
+ * @fence_id: fence id to send the command to
+ * @sg_in: scatter gather list containing addresses for rx message buffer
+ * @total_in_len: total length of data in 'in' sg, can be less than the sum of buffers sizes
+ * @sg_out: scatter gather list containing addresses for tx message buffer
+ *
+ * Return: bytes sent on Success, <0 on Failure
+ */
+static ssize_t mei_pxp_gsc_command(struct device *dev, u8 client_id, u32 fence_id,
+				   struct scatterlist *sg_in, size_t total_in_len,
+				   struct scatterlist *sg_out)
+{
+	struct mei_cl_device *cldev;
+
+	if (!dev || !sg_in || !sg_out)
+		return -EINVAL;
+
+	cldev = to_mei_cl_device(dev);
+
+	return mei_cldev_send_gsc_command(cldev, client_id, fence_id, sg_in, total_in_len, sg_out);
+}
+
 static const struct i915_pxp_component_ops mei_pxp_ops = {
 	.owner = THIS_MODULE,
 	.send = mei_pxp_send_message,
 	.recv = mei_pxp_receive_message,
+	.gsc_command = mei_pxp_gsc_command,
 };
 
 static int mei_component_master_bind(struct device *dev)
diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
index af593ec64469..67d44a1827f9 100644
--- a/include/drm/i915_pxp_tee_interface.h
+++ b/include/drm/i915_pxp_tee_interface.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/device.h>
+#include <linux/scatterlist.h>
 
 /**
  * struct i915_pxp_component_ops - ops for PXP services.
@@ -23,6 +24,10 @@ struct i915_pxp_component_ops {
 
 	int (*send)(struct device *dev, const void *message, size_t size);
 	int (*recv)(struct device *dev, void *buffer, size_t size);
+	ssize_t (*gsc_command)(struct device *dev, u8 client_id, u32 fence_id,
+			       struct scatterlist *sg_in, size_t total_in_len,
+			       struct scatterlist *sg_out);
+
 };
 
 /**
-- 
2.37.2

