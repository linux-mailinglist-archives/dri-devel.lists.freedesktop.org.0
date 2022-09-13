Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F95B64BE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 02:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15C810E4B9;
	Tue, 13 Sep 2022 00:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0005310E146;
 Tue, 13 Sep 2022 00:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030681; x=1694566681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1nTDkL3mgCUnrA8sQr9KF99VldG4It3d6Cc2R6BlSws=;
 b=FdXBb/cK54ywhtMYe+CBFM4plpWTTphdPz/Q5UMgFY/GOy7LIN+jyli0
 ydizQDCComAlwN96DzYrKYmQVvXW1RlhM36eq3o9zdQJh2qGibcakpSwB
 8IyO1AmcyzCdnDqMFZa26+B/t3HthJRm6+yFioxOC19rIh3iOC6Vdfi0z
 sapabFsIjN4R869Gr/xL5gJHkt7aEXhCXunYsVU68/zmvOGhpYARxhGjX
 2LBFvvyhX0TcLcuT3ucSAseEMwydnKOc6C7XEGzjq5REKqVLN4sp47wnX
 BLT1zkHbvrsHb9x7TfRYphvBZIq3ccHspupynnOwOM+BnLaPqCuB7oKSJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281024404"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="281024404"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593541"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:00 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 05/15] mei: pxp: add command streamer API to the PXP driver
Date: Mon, 12 Sep 2022 17:57:29 -0700
Message-Id: <20220913005739.798337-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Lubart <vitaly.lubart@intel.com>

The discrete graphics card with GSC firmware
using command streamer API hence it requires to enhance
pxp module with the new gsc_command() handler.

The handler is implemented via mei_pxp_gsc_command() which is
just a thin wrapper around mei_cldev_send_gsc_command()

Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
V2:
 1. More detailed commit message
 2. Fix typo in the comments
V3: Rebase
V4:
1. Use forward declaration for struct scatterlist (Jani)
2. Drop double 'just' in the commit message
V5:
1. Drop usless input params checks in mei_pxp_gsc_command (Greg)

 drivers/misc/mei/pxp/mei_pxp.c       | 25 +++++++++++++++++++++++++
 include/drm/i915_pxp_tee_interface.h |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
index 5c39457e3f53..f221464c4009 100644
--- a/drivers/misc/mei/pxp/mei_pxp.c
+++ b/drivers/misc/mei/pxp/mei_pxp.c
@@ -77,10 +77,35 @@ mei_pxp_receive_message(struct device *dev, void *buffer, size_t size)
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
index af593ec64469..a702b6ec17f7 100644
--- a/include/drm/i915_pxp_tee_interface.h
+++ b/include/drm/i915_pxp_tee_interface.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/device.h>
+struct scatterlist;
 
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

